@implementation CTTrafficDescriptorsContainer

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", trafficDescriptors=[%@]"), v5);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setTrafficDescriptors:", v7);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTTrafficDescriptorsContainer trafficDescriptors](self, "trafficDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("trafficDescriptors"));

  }
}

- (CTTrafficDescriptorsContainer)initWithCoder:(id)a3
{
  id v4;
  CTTrafficDescriptorsContainer *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *trafficDescriptors;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTTrafficDescriptorsContainer;
  v5 = -[CTTrafficDescriptorsContainer init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trafficDescriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (void)setTrafficDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_trafficDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);
}

@end
