@implementation AFInterstitialConfiguration

- (AFInterstitialConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFInterstitialConfigurationMutation *);
  AFInterstitialConfiguration *v5;
  AFInterstitialConfiguration *v6;
  _AFInterstitialConfigurationMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *languageCode;
  void *v11;
  uint64_t v12;
  NSString *recordRoute;
  objc_super v15;

  v4 = (void (**)(id, _AFInterstitialConfigurationMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFInterstitialConfiguration;
  v5 = -[AFInterstitialConfiguration init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFInterstitialConfigurationMutation initWithBase:]([_AFInterstitialConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFInterstitialConfigurationMutation isDirty](v7, "isDirty"))
    {
      v6->_style = -[_AFInterstitialConfigurationMutation getStyle](v7, "getStyle");
      -[_AFInterstitialConfigurationMutation getLanguageCode](v7, "getLanguageCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      languageCode = v6->_languageCode;
      v6->_languageCode = (NSString *)v9;

      v6->_gender = -[_AFInterstitialConfigurationMutation getGender](v7, "getGender");
      -[_AFInterstitialConfigurationMutation getRecordRoute](v7, "getRecordRoute");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      recordRoute = v6->_recordRoute;
      v6->_recordRoute = (NSString *)v12;

      v6->_isVoiceTrigger = -[_AFInterstitialConfigurationMutation getIsVoiceTrigger](v7, "getIsVoiceTrigger");
      v6->_isDucking = -[_AFInterstitialConfigurationMutation getIsDucking](v7, "getIsDucking");
      v6->_isTwoShot = -[_AFInterstitialConfigurationMutation getIsTwoShot](v7, "getIsTwoShot");
      v6->_speechEndHostTime = -[_AFInterstitialConfigurationMutation getSpeechEndHostTime](v7, "getSpeechEndHostTime");
    }

  }
  return v6;
}

- (AFInterstitialConfiguration)init
{
  return -[AFInterstitialConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFInterstitialConfiguration)initWithStyle:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 recordRoute:(id)a6 isVoiceTrigger:(BOOL)a7 isDucking:(BOOL)a8 isTwoShot:(BOOL)a9 speechEndHostTime:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  AFInterstitialConfiguration *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;

  v16 = a4;
  v17 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __130__AFInterstitialConfiguration_initWithStyle_languageCode_gender_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime___block_invoke;
  v22[3] = &unk_1E3A35958;
  v25 = a3;
  v26 = a5;
  v23 = v16;
  v24 = v17;
  v28 = a7;
  v29 = a8;
  v30 = a9;
  v27 = a10;
  v18 = v17;
  v19 = v16;
  v20 = -[AFInterstitialConfiguration initWithBuilder:](self, "initWithBuilder:", v22);

  return v20;
}

- (id)description
{
  return -[AFInterstitialConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t style;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15.receiver = self;
  v15.super_class = (Class)AFInterstitialConfiguration;
  -[AFInterstitialConfiguration description](&v15, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  if (style > 8)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A35028[style];
  v8 = v7;
  v9 = v8;
  v10 = CFSTR("YES");
  if (self->_isVoiceTrigger)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_isDucking)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (!self->_isTwoShot)
    v10 = CFSTR("NO");
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {style = %@, languageCode = %@, gender = %lld, recordRoute = %@, isVoiceTrigger = %@, isDucking = %@, isTwoShot = %@, speechEndHostTime = %llu}"), v5, v8, *(_OWORD *)&self->_languageCode, self->_recordRoute, v11, v12, v10, self->_speechEndHostTime);

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_style);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_languageCode, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_gender);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_recordRoute, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVoiceTrigger);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDucking);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTwoShot);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_speechEndHostTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  AFInterstitialConfiguration *v4;
  AFInterstitialConfiguration *v5;
  int64_t style;
  int64_t gender;
  _BOOL4 isVoiceTrigger;
  _BOOL4 isDucking;
  _BOOL4 isTwoShot;
  unint64_t speechEndHostTime;
  NSString *v12;
  NSString *languageCode;
  NSString *v14;
  NSString *recordRoute;
  BOOL v16;

  v4 = (AFInterstitialConfiguration *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      style = self->_style;
      if (style == -[AFInterstitialConfiguration style](v5, "style")
        && (gender = self->_gender, gender == -[AFInterstitialConfiguration gender](v5, "gender"))
        && (isVoiceTrigger = self->_isVoiceTrigger,
            isVoiceTrigger == -[AFInterstitialConfiguration isVoiceTrigger](v5, "isVoiceTrigger"))
        && (isDucking = self->_isDucking, isDucking == -[AFInterstitialConfiguration isDucking](v5, "isDucking"))
        && (isTwoShot = self->_isTwoShot, isTwoShot == -[AFInterstitialConfiguration isTwoShot](v5, "isTwoShot"))
        && (speechEndHostTime = self->_speechEndHostTime,
            speechEndHostTime == -[AFInterstitialConfiguration speechEndHostTime](v5, "speechEndHostTime")))
      {
        -[AFInterstitialConfiguration languageCode](v5, "languageCode");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        languageCode = self->_languageCode;
        if (languageCode == v12 || -[NSString isEqual:](languageCode, "isEqual:", v12))
        {
          -[AFInterstitialConfiguration recordRoute](v5, "recordRoute");
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          recordRoute = self->_recordRoute;
          v16 = recordRoute == v14 || -[NSString isEqual:](recordRoute, "isEqual:", v14);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (AFInterstitialConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  AFInterstitialConfiguration *v18;
  uint64_t v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::languageCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::gender"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::recordRoute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::isVoiceTrigger"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::isDucking"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::isTwoShot"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInterstitialConfiguration::speechEndHostTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedLongLongValue");
  LOBYTE(v20) = v15;
  v18 = -[AFInterstitialConfiguration initWithStyle:languageCode:gender:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:](self, "initWithStyle:languageCode:gender:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:", v5, v6, v8, v9, v11, v13, v20, v17);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t style;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  style = self->_style;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", style);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFInterstitialConfiguration::style"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_languageCode, CFSTR("AFInterstitialConfiguration::languageCode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_gender);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFInterstitialConfiguration::gender"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_recordRoute, CFSTR("AFInterstitialConfiguration::recordRoute"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVoiceTrigger);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFInterstitialConfiguration::isVoiceTrigger"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDucking);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("AFInterstitialConfiguration::isDucking"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTwoShot);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("AFInterstitialConfiguration::isTwoShot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_speechEndHostTime);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("AFInterstitialConfiguration::speechEndHostTime"));

}

- (int64_t)style
{
  return self->_style;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (BOOL)isVoiceTrigger
{
  return self->_isVoiceTrigger;
}

- (BOOL)isDucking
{
  return self->_isDucking;
}

- (BOOL)isTwoShot
{
  return self->_isTwoShot;
}

- (unint64_t)speechEndHostTime
{
  return self->_speechEndHostTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __130__AFInterstitialConfiguration_initWithStyle_languageCode_gender_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setStyle:", v3);
  objc_msgSend(v4, "setLanguageCode:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setGender:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setRecordRoute:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIsVoiceTrigger:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v4, "setIsDucking:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v4, "setIsTwoShot:", *(unsigned __int8 *)(a1 + 74));
  objc_msgSend(v4, "setSpeechEndHostTime:", *(_QWORD *)(a1 + 64));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFInterstitialConfigurationMutation *);
  _AFInterstitialConfigurationMutation *v5;
  AFInterstitialConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSString *languageCode;
  void *v10;
  uint64_t v11;
  NSString *recordRoute;

  v4 = (void (**)(id, _AFInterstitialConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFInterstitialConfigurationMutation initWithBase:]([_AFInterstitialConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFInterstitialConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFInterstitialConfiguration);
      v6->_style = -[_AFInterstitialConfigurationMutation getStyle](v5, "getStyle");
      -[_AFInterstitialConfigurationMutation getLanguageCode](v5, "getLanguageCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      languageCode = v6->_languageCode;
      v6->_languageCode = (NSString *)v8;

      v6->_gender = -[_AFInterstitialConfigurationMutation getGender](v5, "getGender");
      -[_AFInterstitialConfigurationMutation getRecordRoute](v5, "getRecordRoute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      recordRoute = v6->_recordRoute;
      v6->_recordRoute = (NSString *)v11;

      v6->_isVoiceTrigger = -[_AFInterstitialConfigurationMutation getIsVoiceTrigger](v5, "getIsVoiceTrigger");
      v6->_isDucking = -[_AFInterstitialConfigurationMutation getIsDucking](v5, "getIsDucking");
      v6->_isTwoShot = -[_AFInterstitialConfigurationMutation getIsTwoShot](v5, "getIsTwoShot");
      v6->_speechEndHostTime = -[_AFInterstitialConfigurationMutation getSpeechEndHostTime](v5, "getSpeechEndHostTime");
    }
    else
    {
      v6 = (AFInterstitialConfiguration *)-[AFInterstitialConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFInterstitialConfiguration *)-[AFInterstitialConfiguration copy](self, "copy");
  }

  return v6;
}

@end
