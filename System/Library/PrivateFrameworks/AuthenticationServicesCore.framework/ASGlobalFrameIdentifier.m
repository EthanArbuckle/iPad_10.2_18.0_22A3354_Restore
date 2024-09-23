@implementation ASGlobalFrameIdentifier

- (ASGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  ASGlobalFrameIdentifier *v10;

  v6 = (objc_class *)MEMORY[0x24BE82CE0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPageID:frameID:", v8, v7);

  v10 = -[ASGlobalFrameIdentifier initWithCoreFrameIdentifier:](self, "initWithCoreFrameIdentifier:", v9);
  return v10;
}

- (ASGlobalFrameIdentifier)initWithCoreFrameIdentifier:(id)a3
{
  id v5;
  ASGlobalFrameIdentifier *v6;
  ASGlobalFrameIdentifier *v7;
  ASGlobalFrameIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASGlobalFrameIdentifier;
  v6 = -[ASGlobalFrameIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreFrameIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (NSNumber)webPageID
{
  return (NSNumber *)-[WBSGlobalFrameIdentifier webPageID](self->_coreFrameIdentifier, "webPageID");
}

- (NSNumber)webFrameID
{
  return (NSNumber *)-[WBSGlobalFrameIdentifier webFrameID](self->_coreFrameIdentifier, "webFrameID");
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASGlobalFrameIdentifier *v5;
  void *v6;
  ASGlobalFrameIdentifier *v7;

  v5 = +[ASGlobalFrameIdentifier allocWithZone:](ASGlobalFrameIdentifier, "allocWithZone:");
  v6 = (void *)-[WBSGlobalFrameIdentifier copyWithZone:](self->_coreFrameIdentifier, "copyWithZone:", a3);
  v7 = -[ASGlobalFrameIdentifier initWithCoreFrameIdentifier:](v5, "initWithCoreFrameIdentifier:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[WBSGlobalFrameIdentifier isEqual:](self->_coreFrameIdentifier, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[WBSGlobalFrameIdentifier hash](self->_coreFrameIdentifier, "hash");
}

- (id)description
{
  return (id)-[WBSGlobalFrameIdentifier description](self->_coreFrameIdentifier, "description");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASGlobalFrameIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASGlobalFrameIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreFrameIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASGlobalFrameIdentifier initWithCoreFrameIdentifier:](self, "initWithCoreFrameIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_coreFrameIdentifier, CFSTR("coreFrameIdentifierKey"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreFrameIdentifier, 0);
}

@end
