@implementation ATXAppModeEntity

- (ATXAppModeEntity)initWithBundleId:(id)a3
{
  return -[ATXAppModeEntity initWithBundleId:itunesGenreIds:](self, "initWithBundleId:itunesGenreIds:", a3, 0);
}

- (ATXAppModeEntity)initWithBundleId:(id)a3 itunesGenreIds:(id)a4
{
  id v6;
  id v7;
  ATXAppModeEntity *v8;
  NSObject *v9;
  uint64_t v10;
  NSString *bundleId;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppModeEntity;
  v8 = -[ATXAppModeEntity init](&v13, sel_init);
  if (v8)
  {
    if (!v6)
    {
      __atxlog_handle_notification_management();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXAppModeEntity initWithBundleId:itunesGenreIds:].cold.1(v9);

    }
    v10 = objc_msgSend(v6, "copy");
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v10;

    objc_storeStrong((id *)&v8->_itunesGenreIds, a4);
  }

  return v8;
}

- (id)identifier
{
  return self->_bundleId;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("entityIdentifier");
  -[ATXAppModeEntity identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("scoreMetadata");
  -[ATXAppModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v7;
  v12[2] = CFSTR("genreId");
  -[NSArray firstObject](self->_itunesGenreIds, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v6)
  if (!v3)

  return v10;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[ATXAppModeEntity jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXAppModeEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "score");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("entityIdentifier: %@, score: %.3f"), v4, v6);

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXAppModeEntity *v4;
  ATXAppModeEntity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ATXAppModeEntity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXAppModeEntity identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppModeEntity identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXAppModeEntity identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  -[ATXAppModeEntity bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForBundleId"));

  -[ATXAppModeEntity itunesGenreIds](self, "itunesGenreIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForItunesGenreIds"));

  -[ATXAppModeEntity scoreMetadata](self, "scoreMetadata");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForScoreMetadata"));

}

- (ATXAppModeEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAppModeEntity *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForBundleId"), v4, 1, CFSTR("com.apple.proactive.decode.appModeEntity"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = (void *)MEMORY[0x1A85A4F90]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    __atxlog_handle_notification_management();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("codingKeyForItunesGenreIds"), v4, 0, CFSTR("com.apple.proactive.decode.appModeEntity"), -1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v10 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = objc_opt_class();
      __atxlog_handle_notification_management();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("codingKeyForScoreMetadata"), v4, 0, CFSTR("com.apple.proactive.decode.appModeEntity"), -1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v10 = 0;
      }
      else
      {
        self = -[ATXAppModeEntity initWithBundleId:itunesGenreIds:](self, "initWithBundleId:itunesGenreIds:", v8, v17);
        -[ATXAppModeEntity setScoreMetadata:](self, "setScoreMetadata:", v22);
        v10 = self;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXAppModeEntity *v4;
  void *v5;
  void *v6;
  ATXAppModeEntity *v7;

  v4 = +[ATXAppModeEntity allocWithZone:](ATXAppModeEntity, "allocWithZone:", a3);
  -[ATXAppModeEntity bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAppModeEntity itunesGenreIds](self, "itunesGenreIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppModeEntity initWithBundleId:itunesGenreIds:](v4, "initWithBundleId:itunesGenreIds:", v5, v6);

  return v7;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
  objc_storeStrong((id *)&self->scoreMetadata, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)itunesGenreIds
{
  return self->_itunesGenreIds;
}

- (void)setItunesGenreIds:(id)a3
{
  objc_storeStrong((id *)&self->_itunesGenreIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesGenreIds, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

- (void)initWithBundleId:(os_log_t)log itunesGenreIds:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "BundleId is nil while initializing ATXAppModeEntity", v1, 2u);
}

@end
