@implementation GCDevicePhysicalInputSymbolDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)symbolWithSFSymbolsName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSFSymbolsName:", v4);

  return v5;
}

- (GCDevicePhysicalInputSymbolDescription)initWithSFSymbolsName:(id)a3
{
  id v5;
  GCDevicePhysicalInputSymbolDescription *v6;
  uint64_t v7;
  NSString *sfSymbolsName;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDevicePhysicalInputSymbolDescription.m"), 23, CFSTR("Invalid parameter not satisfying: %s"), "symbolName != nil");

  }
  v11.receiver = self;
  v11.super_class = (Class)GCDevicePhysicalInputSymbolDescription;
  v6 = -[GCDevicePhysicalInputSymbolDescription init](&v11, sel_init);
  v7 = objc_msgSend(v5, "copy");
  sfSymbolsName = v6->_sfSymbolsName;
  v6->_sfSymbolsName = (NSString *)v7;

  return v6;
}

- (GCDevicePhysicalInputSymbolDescription)init
{
  -[GCDevicePhysicalInputSymbolDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCDevicePhysicalInputSymbolDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GCDevicePhysicalInputSymbolDescription *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sfSymbolsName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GCDevicePhysicalInputSymbolDescription initWithSFSymbolsName:](self, "initWithSFSymbolsName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sfSymbolsName, CFSTR("sfSymbolsName"));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_sfSymbolsName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_sfSymbolsName, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  return self->_sfSymbolsName;
}

- (id)redactedDescription
{
  return self->_sfSymbolsName;
}

- (NSString)sfSymbolsName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
}

@end
