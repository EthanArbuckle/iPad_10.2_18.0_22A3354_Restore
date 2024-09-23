@implementation FCImageOnTopPremiumHeadlineTemplate

- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5
{
  return -[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:allowNil:](self, "initWithJSONDictionary:versionNumber:URLGenerator:allowNil:", a3, a4, a5, 1);
}

- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5 allowNil:(BOOL)a6
{
  id v10;
  FCImageOnTopPremiumHeadlineTemplate *v11;
  FCImageOnTopPremiumHeadlineTemplate *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCImageOnTopPremiumHeadlineTemplate;
  v11 = -[FCHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:](&v20, sel_initWithJSONDictionary_versionNumber_URLGenerator_, v10, a4, a5);
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      if (a4 == 2)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("templateType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Image On Top"));

        if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "type == FCHeadlineTemplateTypeImageOnTopPremium");
          *(_DWORD *)buf = 136315906;
          v22 = "-[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:allowNil:]";
          v23 = 2080;
          v24 = "FCHeadlineTemplate.m";
          v25 = 1024;
          v26 = 320;
          v27 = 2114;
          v28 = v15;
          v16 = MEMORY[0x1E0C81028];
          goto LABEL_14;
        }
      }
      else if (a4 == 1)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("templateType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Image On Top"));

        if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "type == FCHeadlineTemplateTypeImageOnTopPremium");
          *(_DWORD *)buf = 136315906;
          v22 = "-[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:allowNil:]";
          v23 = 2080;
          v24 = "FCHeadlineTemplate.m";
          v25 = 1024;
          v26 = 314;
          v27 = 2114;
          v28 = v15;
          v16 = MEMORY[0x1E0C81028];
LABEL_14:
          _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
    }
    else if (!a6)
    {

      v12 = 0;
    }
  }

  return v12;
}

+ (id)debug_templateForHash:(unint64_t)a3
{
  return 0;
}

@end
