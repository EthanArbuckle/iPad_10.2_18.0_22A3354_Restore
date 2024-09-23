@implementation WFUnsupportedContentLocation

- (WFUnsupportedContentLocation)initWithIdentifier:(id)a3 serializedRepresentation:(id)a4
{
  id v7;
  WFUnsupportedContentLocation *v8;
  WFUnsupportedContentLocation *v9;
  WFUnsupportedContentLocation *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFUnsupportedContentLocation;
  v8 = -[WFContentLocation initWithIdentifier:promptingBehaviour:](&v12, sel_initWithIdentifier_promptingBehaviour_, a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backingSerializedRepresentation, a4);
    v10 = v9;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFContentLocation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFContentLocation identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)localizedTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  getWFWorkflowExecutionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[WFUnsupportedContentLocation localizedTitle]";
    _os_log_impl(&dword_20BBAD000, v2, OS_LOG_TYPE_FAULT, "%s The UI should never attempt to display a WFUnsupportedContentLocation", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (WFUnsupportedContentLocation)initWithCoder:(id)a3
{
  id v3;
  WFUnsupportedContentLocation *v4;
  void *v5;
  WFUnsupportedContentLocation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFUnsupportedContentLocation *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)WFUnsupportedContentLocation;
  v3 = a3;
  v4 = -[WFContentLocation initWithCoder:](&v13, sel_initWithCoder_, v3);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = v4;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("backingSerializedRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentLocation identifier](v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFUnsupportedContentLocation initWithIdentifier:serializedRepresentation:](v6, "initWithIdentifier:serializedRepresentation:", v10, v9);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFUnsupportedContentLocation;
  v4 = a3;
  -[WFContentLocation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFUnsupportedContentLocation backingSerializedRepresentation](self, "backingSerializedRepresentation", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("backingSerializedRepresentation"));

}

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;

  -[WFUnsupportedContentLocation backingSerializedRepresentation](self, "backingSerializedRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentLocation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDictionary)backingSerializedRepresentation
{
  return self->_backingSerializedRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingSerializedRepresentation, 0);
}

+ (id)locationWithIdentifier:(id)a3 serializedRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:serializedRepresentation:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WFUnsupportedContentLocation;
  v4 = a3;
  objc_msgSendSuper2(&v9, sel_objectWithWFSerializedRepresentation_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationWithIdentifier:serializedRepresentation:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
