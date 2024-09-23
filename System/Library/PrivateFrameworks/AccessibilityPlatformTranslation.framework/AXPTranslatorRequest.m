@implementation AXPTranslatorRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requestWithTranslation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTranslation:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRequestType:", -[AXPTranslatorRequest requestType](self, "requestType"));
  -[AXPTranslatorRequest parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setParameters:", v7);

  objc_msgSend(v5, "setAttributeType:", -[AXPTranslatorRequest attributeType](self, "attributeType"));
  objc_msgSend(v5, "setActionType:", -[AXPTranslatorRequest actionType](self, "actionType"));
  -[AXPTranslatorRequest translation](self, "translation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslation:", v8);

  objc_msgSend(v5, "setClientType:", -[AXPTranslatorRequest clientType](self, "clientType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXPTranslatorRequest parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameters"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest requestType](self, "requestType"), CFSTR("requestType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest actionType](self, "actionType"), CFSTR("actionType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest attributeType](self, "attributeType"), CFSTR("attributeType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorRequest clientType](self, "clientType"), CFSTR("clientType"));
  -[AXPTranslatorRequest translation](self, "translation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("translation"));

}

+ (id)allowedDecodableClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXPTranslatorRequest_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken_0 != -1)
    dispatch_once(&allowedDecodableClasses_onceToken_0, block);
  return (id)allowedDecodableClasses_Allowed_0;
}

void __47__AXPTranslatorRequest_allowedDecodableClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[AXPTranslationObject allowedDecodableClasses](AXPTranslationObject, "allowedDecodableClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)allowedDecodableClasses_Allowed_0;
  allowedDecodableClasses_Allowed_0 = v8;

}

- (AXPTranslatorRequest)initWithCoder:(id)a3
{
  id v4;
  AXPTranslatorRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(AXPTranslatorRequest);
  -[AXPTranslatorRequest setRequestType:](v5, "setRequestType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType")));
  -[AXPTranslatorRequest setActionType:](v5, "setActionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType")));
  -[AXPTranslatorRequest setAttributeType:](v5, "setAttributeType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attributeType")));
  -[AXPTranslatorRequest setClientType:](v5, "setClientType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType")));
  objc_msgSend((id)objc_opt_class(), "allowedDecodableClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorRequest setParameters:](v5, "setParameters:", v7);

  objc_msgSend((id)objc_opt_class(), "allowedDecodableClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("translation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXPTranslatorRequest setTranslation:](v5, "setTranslation:", v9);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)AXPTranslatorRequest;
  -[AXPTranslatorRequest description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXPTranslatorRequest requestType](self, "requestType");
  _AXPActionToString(-[AXPTranslatorRequest actionType](self, "actionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPAttributeToString(-[AXPTranslatorRequest attributeType](self, "attributeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorRequest parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorRequest translation](self, "translation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Type: %d, action: %@, attribute: %@, params: %@: translation: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AXPTranslationObject)translation
{
  return self->_translation;
}

- (void)setTranslation:(id)a3
{
  objc_storeStrong((id *)&self->_translation, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_translation, 0);
}

@end
