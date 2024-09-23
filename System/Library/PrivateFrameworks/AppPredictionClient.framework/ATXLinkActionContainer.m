@implementation ATXLinkActionContainer

- (ATXLinkActionContainer)initWithBundleId:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  ATXLinkActionContainer *v8;
  uint64_t v9;
  NSString *bundleId;
  uint64_t v11;
  LNAction *action;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXLinkActionContainer;
  v8 = -[ATXLinkActionContainer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    action = v8->_action;
    v8->_action = (LNAction *)v11;

  }
  return v8;
}

- (id)_initWithBundleId:(id)a3 action:(id)a4 image:(id)a5
{
  id v8;
  ATXLinkActionContainer *v9;
  uint64_t v10;
  LNImage *image;

  v8 = a5;
  v9 = -[ATXLinkActionContainer initWithBundleId:action:](self, "initWithBundleId:action:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    image = v9->_image;
    v9->_image = (LNImage *)v10;

  }
  return v9;
}

- (ATXLinkActionContainer)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  ATXLinkActionContainer *v13;
  void *v14;
  ATXLinkActionContainer *v15;
  id v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1A85A4F90]();
      v7 = (void *)MEMORY[0x1E0CB3710];
      v8 = objc_opt_class();
      -[NSObject action](v5, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;

      objc_autoreleasePoolPop(v6);
      if (v11)
      {
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ATXLinkActionContainer initWithProto:].cold.1();

        v13 = 0;
      }
      else
      {
        -[NSObject bundleId](v5, "bundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ATXLinkActionContainer initWithBundleId:action:](self, "initWithBundleId:action:", v14, v10);

        self = v15;
        v13 = self;
      }

    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXLinkActionContainer initWithProto:].cold.2((uint64_t)self, v5);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;

  v3 = (void *)objc_opt_new();
  -[ATXLinkActionContainer bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleId:", v4);

  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = (void *)MEMORY[0x1E0CB36F8];
  -[ATXLinkActionContainer action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  objc_autoreleasePoolPop(v5);
  objc_msgSend(v3, "setAction:", v8);

  if (v9)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXLinkActionContainer proto].cold.1();

    v11 = 0;
  }
  else
  {
    v11 = v3;
  }

  return v11;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXLinkActionContainer proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXLinkActionContainer)initWithProtoData:(id)a3
{
  id v4;
  ATXPBLinkAction *v5;
  ATXLinkActionContainer *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBLinkAction initWithData:]([ATXPBLinkAction alloc], "initWithData:", v4);

    self = -[ATXLinkActionContainer initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ATXLinkActionContainer bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForBundleId"));

  -[ATXLinkActionContainer action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForLinkAction"));

  -[ATXLinkActionContainer image](self, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForLinkImage"));

}

- (ATXLinkActionContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ATXLinkActionContainer *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForBundleId"), v4, 1, CFSTR("com.apple.proactive.LinkActionContainer"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_default();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("codingKeyForLinkAction"), v4, 1, CFSTR("com.apple.proactive.LinkActionContainer"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D81610];
      v14 = objc_opt_class();
      __atxlog_handle_default();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("codingKeyForLinkImage"), v4, 0, CFSTR("com.apple.proactive.LinkActionContainer"), -1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      self = (ATXLinkActionContainer *)-[ATXLinkActionContainer _initWithBundleId:action:image:](self, "_initWithBundleId:action:image:", v8, v12, v16);
      v17 = self;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[ATXLinkActionContainer bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXLinkActionContainer image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ATXLinkActionContainer action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXLinkActionContainer *v4;
  ATXLinkActionContainer *v5;
  BOOL v6;

  v4 = (ATXLinkActionContainer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXLinkActionContainer isEqualToATXLinkActionContainer:](self, "isEqualToATXLinkActionContainer:", v5);

  return v6;
}

- (BOOL)isEqualToATXLinkActionContainer:(id)a3
{
  id *v4;
  NSString *bundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  LNAction *v11;
  LNAction *v12;

  v4 = (id *)a3;
  bundleId = self->_bundleId;
  v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_action;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[LNAction isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXLinkActionContainer bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLinkActionContainer action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXLinkActionContainer - bundleId: %@, actionId: %@"), v4, v6);

  return (NSString *)v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (LNAction)action
{
  return self->_action;
}

- (LNImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (INAppIntent)cachedAppIntent
{
  return (INAppIntent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedAppIntent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppIntent, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "%@: Unable to decode data from serialized Link action message: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBLinkAction proto", (uint8_t *)&v5, 0xCu);

}

- (void)proto
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "%@: Unable to serialize LNAction: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

@end
