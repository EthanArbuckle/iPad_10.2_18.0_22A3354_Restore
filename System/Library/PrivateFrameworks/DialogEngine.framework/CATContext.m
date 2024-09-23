@implementation CATContext

- (CATContext)init
{
  CATContext *v2;
  CATContext *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CATContext;
  v2 = -[CATContext init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CATContext setSiriLocale:](v2, "setSiriLocale:", CFSTR("en"));
    -[CATContext setSiriVoiceGender:](v3, "setSiriVoiceGender:", CFSTR("unknown"));
    -[CATContext setIsMultiUserEnabled:](v3, "setIsMultiUserEnabled:", 0);
    -[CATContext setRequiresUserGrounding:](v3, "setRequiresUserGrounding:", 0);
    -[CATContext setRandomSeed:](v3, "setRandomSeed:", 0);
    -[CATContext setCurrentTime:](v3, "setCurrentTime:", 0);
    -[CATContext setUserSettings:](v3, "setUserSettings:", &unk_1E7944968);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"***", v4);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** ACTION REQUIRED:", v5);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** This CAT request was issued by code using the default constructor", v6);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** of the CATContext object. This code must be updated to use the", v7);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** initWithInputLocale:outputVoiceLocale: constructor. Left unchanged,", v8);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"*** this code will not work for non-English locales. #siri-cat-help", v9);
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"***", v10);
  }
  return v3;
}

- (CATContext)initWithInputLocale:(id)a3 outputVoiceLocale:(id)a4
{
  id v6;
  CATContext *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[14];
  _QWORD v31[16];

  v31[14] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CATContext;
  v7 = -[CATContext init](&v28, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || !objc_msgSend(v9, "length"))
    {
      v11 = v26;

      v10 = v11;
    }
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12 || !objc_msgSend(v12, "length"))
    {
      v14 = v26;

      v13 = v14;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "languageCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v10;
    v20 = v19;
    if (objc_msgSend(v16, "isEqualToString:", v18))
    {
      v30[0] = &unk_1E79447B8;
      v30[1] = &unk_1E79447D0;
      v31[0] = CFSTR("en_CA");
      v31[1] = CFSTR("en_IN");
      v30[2] = &unk_1E79447E8;
      v30[3] = &unk_1E7944800;
      v31[2] = CFSTR("en_IN");
      v31[3] = CFSTR("en_SG");
      v30[4] = &unk_1E7944818;
      v30[5] = &unk_1E7944830;
      v31[4] = CFSTR("en_NZ");
      v31[5] = CFSTR("es_US");
      v30[6] = &unk_1E7944848;
      v30[7] = &unk_1E7944860;
      v31[6] = CFSTR("es_CL");
      v31[7] = CFSTR("es_CL");
      v30[8] = &unk_1E7944878;
      v30[9] = &unk_1E7944890;
      v31[8] = CFSTR("fr_BE");
      v31[9] = CFSTR("fr_CH");
      v30[10] = &unk_1E79448A8;
      v30[11] = &unk_1E79448C0;
      v31[10] = CFSTR("de_CH");
      v31[11] = CFSTR("de_AT");
      v30[12] = &unk_1E79448D8;
      v30[13] = &unk_1E79448F0;
      v31[12] = CFSTR("it_CH");
      v31[13] = CFSTR("zh_CN");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v19;
      v29[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v24 = v23;
      else
        v24 = v13;
      v20 = v24;

    }
    -[CATContext setSiriLocale:](v7, "setSiriLocale:", v20);
    -[CATContext setSiriVoiceGender:](v7, "setSiriVoiceGender:", CFSTR("unknown"));
    -[CATContext setIsMultiUserEnabled:](v7, "setIsMultiUserEnabled:", 0);
    -[CATContext setRequiresUserGrounding:](v7, "setRequiresUserGrounding:", 0);
    -[CATContext setRandomSeed:](v7, "setRandomSeed:", 0);
    -[CATContext setCurrentTime:](v7, "setCurrentTime:", 0);
    -[CATContext setUserSettings:](v7, "setUserSettings:", &unk_1E7944990);

  }
  return v7;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("locale");
  -[CATContext siriLocale](self, "siriLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("gender");
  -[CATContext siriVoiceGender](self, "siriVoiceGender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("multiuser");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CATContext isMultiUserEnabled](self, "isMultiUserEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("grounding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CATContext requiresUserGrounding](self, "requiresUserGrounding"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("randomSeed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CATContext randomSeed](self, "randomSeed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("currentTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[CATContext currentTime](self, "currentTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("userSettings");
  -[CATContext userSettings](self, "userSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (void)setSiriLocale:(id)a3
{
  objc_storeStrong((id *)&self->_siriLocale, a3);
}

- (NSString)siriVoiceGender
{
  return self->_siriVoiceGender;
}

- (void)setSiriVoiceGender:(id)a3
{
  objc_storeStrong((id *)&self->_siriVoiceGender, a3);
}

- (BOOL)isMultiUserEnabled
{
  return self->_isMultiUserEnabled;
}

- (void)setIsMultiUserEnabled:(BOOL)a3
{
  self->_isMultiUserEnabled = a3;
}

- (BOOL)requiresUserGrounding
{
  return self->_requiresUserGrounding;
}

- (void)setRequiresUserGrounding:(BOOL)a3
{
  self->_requiresUserGrounding = a3;
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->_randomSeed = a3;
}

- (int64_t)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(int64_t)a3
{
  self->_currentTime = a3;
}

- (NSDictionary)userSettings
{
  return self->_userSettings;
}

- (void)setUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_userSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_siriVoiceGender, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
}

@end
