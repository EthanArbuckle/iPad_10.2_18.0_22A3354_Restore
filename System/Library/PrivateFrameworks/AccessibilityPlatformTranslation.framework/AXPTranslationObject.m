@implementation AXPTranslationObject

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_1);
}

void __34__AXPTranslationObject_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)UniqueIdLock;
  UniqueIdLock = v0;

}

- (AXPTranslationObject)init
{
  AXPTranslationObject *v2;
  NSObject *v3;
  uint64_t bytes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXPTranslationObject;
  v2 = -[AXPTranslationObject init](&v6, sel_init);
  objc_msgSend((id)UniqueIdLock, "lock");
  bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 8uLL, &bytes))
  {
    AXPlatformTranslationLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXPTranslationObject init].cold.1(v3);

    ++UniqueIDCount;
  }
  -[AXPTranslationObject setObjectID:](v2, "setObjectID:");
  objc_msgSend((id)UniqueIdLock, "unlock");
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AXPTranslationObject objectID](self, "objectID");
    v6 = v5 == objc_msgSend(v4, "objectID");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)remoteDebugDescription
{
  void (**remoteDescriptionBlock)(id, AXPTranslationObject *);
  __CFString *v4;
  NSString *remoteDebugDescription;

  if (!self->_remoteDebugDescription)
  {
    remoteDescriptionBlock = (void (**)(id, AXPTranslationObject *))self->_remoteDescriptionBlock;
    if (remoteDescriptionBlock)
    {
      remoteDescriptionBlock[2](remoteDescriptionBlock, self);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_24E6ACC10;
    }
    remoteDebugDescription = self->_remoteDebugDescription;
    self->_remoteDebugDescription = &v4->isa;

  }
  return self->_remoteDebugDescription;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXPTranslationObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[AXPTranslationObject init](+[AXPTranslationObject allocWithZone:](AXPTranslationObject, "allocWithZone:"), "init");
  -[AXPTranslationObject setObjectID:](v5, "setObjectID:", -[AXPTranslationObject objectID](self, "objectID"));
  -[AXPTranslationObject setPid:](v5, "setPid:", -[AXPTranslationObject pid](self, "pid"));
  -[AXPTranslationObject setIsApplicationElement:](v5, "setIsApplicationElement:", -[AXPTranslationObject isApplicationElement](self, "isApplicationElement"));
  -[AXPTranslationObject bridgeDelegateToken](self, "bridgeDelegateToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[AXPTranslationObject setBridgeDelegateToken:](v5, "setBridgeDelegateToken:", v7);

  -[AXPTranslationObject rawElementData](self, "rawElementData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[AXPTranslationObject setRawElementData:](v5, "setRawElementData:", v9);

  -[AXPTranslationObject setDidPopuldateAppInfo:](v5, "setDidPopuldateAppInfo:", -[AXPTranslationObject didPopuldateAppInfo](self, "didPopuldateAppInfo"));
  return v5;
}

+ (id)allowedDecodableClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXPTranslationObject_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken != -1)
    dispatch_once(&allowedDecodableClasses_onceToken, block);
  return (id)allowedDecodableClasses_Allowed;
}

void __47__AXPTranslationObject_allowedDecodableClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)allowedDecodableClasses_Allowed;
  allowedDecodableClasses_Allowed = v7;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslationObject pid](self, "pid"), CFSTR("pid"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPTranslationObject isApplicationElement](self, "isApplicationElement"), CFSTR("isApplicationElement"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPTranslationObject didPopuldateAppInfo](self, "didPopuldateAppInfo"), CFSTR("didPopuldateAppInfo"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AXPTranslationObject objectID](self, "objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[AXPTranslationObject bridgeDelegateToken](self, "bridgeDelegateToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bridgeDelegateToken"));

  -[AXPTranslationObject rawElementData](self, "rawElementData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rawElementData"));

}

- (AXPTranslationObject)initWithCoder:(id)a3
{
  id v3;
  AXPTranslationObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXPTranslationObject;
  v3 = a3;
  v4 = -[AXPTranslationObject init](&v9, sel_init);
  -[AXPTranslationObject setPid:](v4, "setPid:", objc_msgSend(v3, "decodeIntForKey:", CFSTR("pid"), v9.receiver, v9.super_class));
  -[AXPTranslationObject setIsApplicationElement:](v4, "setIsApplicationElement:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isApplicationElement")));
  -[AXPTranslationObject setDidPopuldateAppInfo:](v4, "setDidPopuldateAppInfo:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("didPopuldateAppInfo")));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslationObject setObjectID:](v4, "setObjectID:", objc_msgSend(v5, "unsignedLongLongValue"));

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bridgeDelegateToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslationObject setBridgeDelegateToken:](v4, "setBridgeDelegateToken:", v6);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawElementData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXPTranslationObject setRawElementData:](v4, "setRawElementData:", v7);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)AXPTranslationObject;
  -[AXPTranslationObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXPTranslationObject objectID](self, "objectID");
  -[AXPTranslationObject remoteDebugDescription](self, "remoteDebugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%llu]: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(unint64_t)a3
{
  self->_objectID = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isApplicationElement
{
  return self->_isApplicationElement;
}

- (void)setIsApplicationElement:(BOOL)a3
{
  self->_isApplicationElement = a3;
}

- (void)setRemoteDebugDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bridgeDelegateToken
{
  return self->_bridgeDelegateToken;
}

- (void)setBridgeDelegateToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)rawElementData
{
  return self->_rawElementData;
}

- (void)setRawElementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)didPopuldateAppInfo
{
  return self->_didPopuldateAppInfo;
}

- (void)setDidPopuldateAppInfo:(BOOL)a3
{
  self->_didPopuldateAppInfo = a3;
}

- (id)remoteDescriptionBlock
{
  return self->_remoteDescriptionBlock;
}

- (void)setRemoteDescriptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDescriptionBlock, 0);
  objc_storeStrong((id *)&self->_rawElementData, 0);
  objc_storeStrong((id *)&self->_bridgeDelegateToken, 0);
  objc_storeStrong((id *)&self->_remoteDebugDescription, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_220DB6000, log, OS_LOG_TYPE_ERROR, "Could not generate random number", v1, 2u);
}

@end
