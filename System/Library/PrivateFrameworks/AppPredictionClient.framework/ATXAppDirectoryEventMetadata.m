@implementation ATXAppDirectoryEventMetadata

- (ATXAppDirectoryEventMetadata)init
{
  return -[ATXAppDirectoryEventMetadata initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:](self, "initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", 0, 0);
}

- (ATXAppDirectoryEventMetadata)initWithBundleIdInTopAppsVisible:(id)a3 userLaunchedAppBeforeLeaving:(id)a4
{
  id v7;
  id v8;
  ATXAppDirectoryEventMetadata *v9;
  ATXAppDirectoryEventMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAppDirectoryEventMetadata;
  v9 = -[ATXAppDirectoryEventMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdInTopAppsVisible, a3);
    objc_storeStrong((id *)&v10->_userLaunchedAppBeforeLeaving, a4);
  }

  return v10;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXAppDirectoryEventMetadata proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXAppDirectoryEventMetadata)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  ATXAppDirectoryEventMetadata *v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryEventMetadata initWithProto:].cold.1((uint64_t)self, v7);

    goto LABEL_8;
  }
  v5 = v4;
  if (-[ATXPBAppDirectoryEventMetadata hasBundleIdInTopAppsVisible]((uint64_t)v5))
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[ATXPBAppDirectoryEventMetadata bundleIdInTopAppsVisible]((_BOOL8)v5));
  else
    v6 = 0;
  if (-[ATXPBAppDirectoryEventMetadata hasUserLaunchedAppBeforeLeaving]((uint64_t)v5))
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[ATXPBAppDirectoryEventMetadata userLaunchedAppBeforeLeaving]((_BOOL8)v5));
  else
    v9 = 0;
  self = -[ATXAppDirectoryEventMetadata initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:](self, "initWithBundleIdInTopAppsVisible:userLaunchedAppBeforeLeaving:", v6, v9);

  v8 = self;
LABEL_14:

  return v8;
}

- (ATXAppDirectoryEventMetadata)initWithProtoData:(id)a3
{
  id v4;
  ATXPBAppDirectoryEventMetadata *v5;
  ATXAppDirectoryEventMetadata *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBAppDirectoryEventMetadata initWithData:]([ATXPBAppDirectoryEventMetadata alloc], "initWithData:", v4);

    self = -[ATXAppDirectoryEventMetadata initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  NSNumber *bundleIdInTopAppsVisible;
  NSNumber *userLaunchedAppBeforeLeaving;

  v3 = (void *)objc_opt_new();
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  if (bundleIdInTopAppsVisible)
    -[ATXPBAppDirectoryEventMetadata setBundleIdInTopAppsVisible:]((uint64_t)v3, -[NSNumber BOOLValue](bundleIdInTopAppsVisible, "BOOLValue"));
  userLaunchedAppBeforeLeaving = self->_userLaunchedAppBeforeLeaving;
  if (userLaunchedAppBeforeLeaving)
    -[ATXPBAppDirectoryEventMetadata setUserLaunchedAppBeforeLeaving:]((uint64_t)v3, -[NSNumber BOOLValue](userLaunchedAppBeforeLeaving, "BOOLValue"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXAppDirectoryEventMetadata encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXAppDirectoryEventMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXAppDirectoryEventMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXAppDirectoryEventMetadata initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_bundleIdInTopAppsVisible, "hash");
  return -[NSNumber hash](self->_userLaunchedAppBeforeLeaving, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXAppDirectoryEventMetadata *v4;
  ATXAppDirectoryEventMetadata *v5;
  BOOL v6;

  v4 = (ATXAppDirectoryEventMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXAppDirectoryEventMetadata isEqualToATXAppDirectoryEventMetadata:](self, "isEqualToATXAppDirectoryEventMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXAppDirectoryEventMetadata:(id)a3
{
  id *v4;
  NSNumber *bundleIdInTopAppsVisible;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  char v9;
  char v10;
  NSNumber *v11;
  NSNumber *v12;

  v4 = (id *)a3;
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  v6 = (NSNumber *)v4[1];
  if (bundleIdInTopAppsVisible == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleIdInTopAppsVisible;
    v9 = -[NSNumber isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_userLaunchedAppBeforeLeaving;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSNumber isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (id)jsonDict
{
  NSNumber *userLaunchedAppBeforeLeaving;
  NSNumber *bundleIdInTopAppsVisible;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  userLaunchedAppBeforeLeaving = (NSNumber *)CFSTR("nil");
  v5[0] = CFSTR("bundleIdInTopAppsVisible");
  v5[1] = CFSTR("userLaunchedAppBeforeLeaving");
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  if (!bundleIdInTopAppsVisible)
    bundleIdInTopAppsVisible = (NSNumber *)CFSTR("nil");
  if (self->_userLaunchedAppBeforeLeaving)
    userLaunchedAppBeforeLeaving = self->_userLaunchedAppBeforeLeaving;
  v6[0] = bundleIdInTopAppsVisible;
  v6[1] = userLaunchedAppBeforeLeaving;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)bundleIdInTopAppsVisible
{
  return self->_bundleIdInTopAppsVisible;
}

- (void)setBundleIdInTopAppsVisible:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdInTopAppsVisible, a3);
}

- (NSNumber)userLaunchedAppBeforeLeaving
{
  return self->_userLaunchedAppBeforeLeaving;
}

- (void)setUserLaunchedAppBeforeLeaving:(id)a3
{
  objc_storeStrong((id *)&self->_userLaunchedAppBeforeLeaving, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLaunchedAppBeforeLeaving, 0);
  objc_storeStrong((id *)&self->_bundleIdInTopAppsVisible, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAppDirectoryEventMetadata proto", (uint8_t *)&v5, 0xCu);

}

@end
