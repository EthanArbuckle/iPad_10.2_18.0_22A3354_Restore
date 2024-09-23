@implementation FCPaidALaCartePaywallConfig

- (FCPaidALaCartePaywallConfig)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaidALaCartePaywallConfig init]";
    v9 = 2080;
    v10 = "FCPaidALaCartePaywallConfig.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPaidALaCartePaywallConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCPaidALaCartePaywallConfig *v12;

  v6 = a4;
  v7 = a3;
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("channelPaywall"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("hardPaywall"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("leakyPaywall"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("promotionalPaywall"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FCPaidALaCartePaywallConfig initWithChannelID:channelPaywallTitle:hardPaywallTitle:leakyPaywallTitle:promotionalPaywallTitle:](self, "initWithChannelID:channelPaywallTitle:hardPaywallTitle:leakyPaywallTitle:promotionalPaywallTitle:", v7, v8, v9, v10, v11);
  return v12;
}

- (FCPaidALaCartePaywallConfig)initWithChannelID:(id)a3 channelPaywallTitle:(id)a4 hardPaywallTitle:(id)a5 leakyPaywallTitle:(id)a6 promotionalPaywallTitle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCPaidALaCartePaywallConfig *v17;
  uint64_t v18;
  NSString *channelID;
  uint64_t v20;
  NSString *channelPaywallTitle;
  uint64_t v22;
  NSString *hardPaywallTitle;
  uint64_t v24;
  NSString *leakyPaywallTitle;
  uint64_t v26;
  NSString *promotionalPaywallTitle;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FCPaidALaCartePaywallConfig;
  v17 = -[FCPaidALaCartePaywallConfig init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    channelID = v17->_channelID;
    v17->_channelID = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    channelPaywallTitle = v17->_channelPaywallTitle;
    v17->_channelPaywallTitle = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    hardPaywallTitle = v17->_hardPaywallTitle;
    v17->_hardPaywallTitle = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    leakyPaywallTitle = v17->_leakyPaywallTitle;
    v17->_leakyPaywallTitle = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    promotionalPaywallTitle = v17->_promotionalPaywallTitle;
    v17->_promotionalPaywallTitle = (NSString *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCPaidALaCartePaywallConfig channelId](self, "channelId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "channelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCPaidALaCartePaywallConfig channelPaywallTitle](self, "channelPaywallTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "channelPaywallTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0DE7910];
        -[FCPaidALaCartePaywallConfig hardPaywallTitle](self, "hardPaywallTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hardPaywallTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          v26 = v14;
          v16 = (void *)MEMORY[0x1E0DE7910];
          -[FCPaidALaCartePaywallConfig leakyPaywallTitle](self, "leakyPaywallTitle");
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "leakyPaywallTitle");
          v18 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v17;
          v19 = v17;
          v20 = (void *)v18;
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v19, v18))
          {
            v25 = (void *)MEMORY[0x1E0DE7910];
            -[FCPaidALaCartePaywallConfig promotionalPaywallTitle](self, "promotionalPaywallTitle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "promotionalPaywallTitle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v25, "nf_object:isEqualToObject:", v21, v22);

          }
          else
          {
            v23 = 0;
          }

          v14 = v26;
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[FCPaidALaCartePaywallConfig channelId](self, "channelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCPaidALaCartePaywallConfig channelPaywallTitle](self, "channelPaywallTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FCPaidALaCartePaywallConfig hardPaywallTitle](self, "hardPaywallTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[FCPaidALaCartePaywallConfig leakyPaywallTitle](self, "leakyPaywallTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[FCPaidALaCartePaywallConfig promotionalPaywallTitle](self, "promotionalPaywallTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)channelPaywallTitle
{
  return self->_channelPaywallTitle;
}

- (void)setChannelPaywallTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)hardPaywallTitle
{
  return self->_hardPaywallTitle;
}

- (void)setHardPaywallTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)leakyPaywallTitle
{
  return self->_leakyPaywallTitle;
}

- (void)setLeakyPaywallTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)promotionalPaywallTitle
{
  return self->_promotionalPaywallTitle;
}

- (void)setPromotionalPaywallTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_promotionalPaywallTitle, 0);
  objc_storeStrong((id *)&self->_leakyPaywallTitle, 0);
  objc_storeStrong((id *)&self->_hardPaywallTitle, 0);
  objc_storeStrong((id *)&self->_channelPaywallTitle, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
