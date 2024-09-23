@implementation CTSliceInterfaceInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSliceInterfaceInfo interface](self, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSliceInterfaceInfo interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", interface=[%@]"), v5);

  }
  -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", trafficDescriptors=[%@]"), v7);

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
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSliceInterfaceInfo interface](self, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTSliceInterfaceInfo interface](self, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setInterface:", v7);

  }
  -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setTrafficDescriptors:", v10);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTSliceInterfaceInfo interface](self, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSliceInterfaceInfo interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("interface"));

  }
  -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSliceInterfaceInfo trafficDescriptors](self, "trafficDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("trafficDescriptors"));

  }
}

- (CTSliceInterfaceInfo)initWithCoder:(id)a3
{
  id v4;
  CTSliceInterfaceInfo *v5;
  uint64_t v6;
  NSString *interface;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *trafficDescriptors;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSliceInterfaceInfo;
  v5 = -[CTSliceInterfaceInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interface"));
    v6 = objc_claimAutoreleasedReturnValue();
    interface = v5->_interface;
    v5->_interface = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("trafficDescriptors"));
    v11 = objc_claimAutoreleasedReturnValue();
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
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
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
