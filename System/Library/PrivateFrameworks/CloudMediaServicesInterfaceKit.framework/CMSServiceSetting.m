@implementation CMSServiceSetting

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_updateListeningHistory)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_allowExplicitContent)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CMSServiceSetting <UpdateListeningHistory: %@, ExplicitContentSetting: %@>"), v3, v2);
}

- (BOOL)isEqual:(id)a3
{
  CMSServiceSetting *v4;
  CMSServiceSetting *v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;

  v4 = (CMSServiceSetting *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CMSServiceSetting updateListeningHistory](v5, "updateListeningHistory");
      if (v6 == -[CMSServiceSetting updateListeningHistory](self, "updateListeningHistory"))
      {
        v8 = -[CMSServiceSetting allowExplicitContent](v5, "allowExplicitContent");
        v7 = v8 ^ -[CMSServiceSetting allowExplicitContent](self, "allowExplicitContent") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

+ (id)settingDictionaryFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v10, v5, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  if (v12)
  {
    _CMSILogingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[CMSServiceSetting settingDictionaryFromData:].cold.1((uint64_t)v12, v13);

    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUpdateListeningHistory:", self->_updateListeningHistory);
  objc_msgSend(v4, "setAllowExplicitContent:", self->_allowExplicitContent);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSServiceSetting)initWithCoder:(id)a3
{
  id v4;
  CMSServiceSetting *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CMSServiceSetting;
  v5 = -[CMSServiceSetting init](&v7, sel_init);
  if (v5)
  {
    v5->_updateListeningHistory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AGSettingUpdateListeningHistoryEnodedKey"));
    v5->_allowExplicitContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CMSSettingExplicitContentSettingEncodedKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 updateListeningHistory;
  id v5;

  updateListeningHistory = self->_updateListeningHistory;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", updateListeningHistory, CFSTR("AGSettingUpdateListeningHistoryEnodedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowExplicitContent, CFSTR("CMSSettingExplicitContentSettingEncodedKey"));

}

- (BOOL)updateListeningHistory
{
  return self->_updateListeningHistory;
}

- (void)setUpdateListeningHistory:(BOOL)a3
{
  self->_updateListeningHistory = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

+ (void)settingDictionaryFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21DE4E000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving service setting dictionary %@", (uint8_t *)&v2, 0xCu);
}

@end
