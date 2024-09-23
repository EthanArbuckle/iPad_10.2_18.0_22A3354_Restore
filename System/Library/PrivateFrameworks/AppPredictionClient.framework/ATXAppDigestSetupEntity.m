@implementation ATXAppDigestSetupEntity

- (ATXAppDigestSetupEntity)initWithBundleId:(id)a3 numBasicNotifications:(unint64_t)a4 numMessageNotifications:(unint64_t)a5 numTimeSenstiveNonMessageNotifications:(unint64_t)a6
{
  id v11;
  ATXAppDigestSetupEntity *v12;
  ATXAppDigestSetupEntity *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXAppDigestSetupEntity;
  v12 = -[ATXAppDigestSetupEntity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    v13->_numBasicNotifications = a4;
    v13->_numMessageNotifications = a5;
    v13->_numTimeSensitiveNonMessageNotifications = a6;
  }

  return v13;
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
  void *v7;
  id v8;

  v4 = a3;
  -[ATXAppDigestSetupEntity bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForBundleId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numBasicNotifications](self, "numBasicNotifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForNumBasicNotifications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numMessageNotifications](self, "numMessageNotifications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForNumMessageNotifications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppDigestSetupEntity numTimeSensitiveNonMessageNotifications](self, "numTimeSensitiveNonMessageNotifications"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForNumTimeSensitiveNotifications"));

}

- (ATXAppDigestSetupEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAppDigestSetupEntity *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForBundleId"), v4, 0, CFSTR("com.apple.proactive.decode.appDigestSetupEntity"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_notification_management();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForNumBasicNotifications"), v4, 0, CFSTR("com.apple.proactive.decode.appDigestSetupEntity"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_notification_management();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForNumMessageNotifications"), v4, 0, CFSTR("com.apple.proactive.decode.appDigestSetupEntity"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_notification_management();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForNumTimeSensitiveNotifications"), v4, 0, CFSTR("com.apple.proactive.decode.appDigestSetupEntity"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          self = -[ATXAppDigestSetupEntity initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:](self, "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v8, objc_msgSend(v14, "unsignedIntegerValue"), objc_msgSend(v19, "unsignedIntegerValue"), objc_msgSend(v24, "unsignedIntegerValue"));
          v10 = self;
        }

      }
    }

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXAppDigestSetupEntity *v4;
  void *v5;
  ATXAppDigestSetupEntity *v6;

  v4 = [ATXAppDigestSetupEntity alloc];
  -[ATXAppDigestSetupEntity bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAppDigestSetupEntity initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:](v4, "initWithBundleId:numBasicNotifications:numMessageNotifications:numTimeSenstiveNonMessageNotifications:", v5, -[ATXAppDigestSetupEntity numBasicNotifications](self, "numBasicNotifications"), -[ATXAppDigestSetupEntity numMessageNotifications](self, "numMessageNotifications"), -[ATXAppDigestSetupEntity numTimeSensitiveNonMessageNotifications](self, "numTimeSensitiveNonMessageNotifications"));

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)numBasicNotifications
{
  return self->_numBasicNotifications;
}

- (void)setNumBasicNotifications:(unint64_t)a3
{
  self->_numBasicNotifications = a3;
}

- (unint64_t)numMessageNotifications
{
  return self->_numMessageNotifications;
}

- (void)setNumMessageNotifications:(unint64_t)a3
{
  self->_numMessageNotifications = a3;
}

- (unint64_t)numTimeSensitiveNonMessageNotifications
{
  return self->_numTimeSensitiveNonMessageNotifications;
}

- (void)setNumTimeSensitiveNonMessageNotifications:(unint64_t)a3
{
  self->_numTimeSensitiveNonMessageNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
