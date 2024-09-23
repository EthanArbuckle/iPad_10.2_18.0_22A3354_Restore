@implementation CTServiceDescriptorContainer

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTServiceDescriptorContainer descriptors](self, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" descriptors=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_descriptors, CFSTR("descriptors"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTServiceDescriptorContainer)initWithDescriptors:(id)a3
{
  id v5;
  CTServiceDescriptorContainer *v6;
  CTServiceDescriptorContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTServiceDescriptorContainer;
  v6 = -[CTServiceDescriptorContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptors, a3);

  return v7;
}

- (CTServiceDescriptorContainer)initWithCoder:(id)a3
{
  id v4;
  CTServiceDescriptorContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *descriptors;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTServiceDescriptorContainer;
  v5 = -[CTServiceDescriptorContainer init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("descriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTServiceDescriptorContainer *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (CTServiceDescriptorContainer *)a3;
  if (v4 == self)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CTServiceDescriptorContainer descriptors](self, "descriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_7:
      -[CTServiceDescriptorContainer descriptors](self, "descriptors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTServiceDescriptorContainer descriptors](v4, "descriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqualToArray:", v9);

      goto LABEL_9;
    }
    -[CTServiceDescriptorContainer descriptors](v4, "descriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_7;
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[NSArray copy](self->_descriptors, "copy");
  objc_msgSend(v4, "setDescriptors:", v5);

  return v4;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

@end
