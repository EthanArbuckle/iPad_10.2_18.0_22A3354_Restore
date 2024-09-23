@implementation AFVoiceInfo

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5 name:(id)a6 footprint:(int64_t)a7 contentVersion:(id)a8 masteredVersion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  AFVoiceInfo *v19;
  uint64_t v20;
  NSString *languageCode;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSNumber *contentVersion;
  uint64_t v26;
  NSString *masteredVersion;
  objc_super v29;

  v15 = a3;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)AFVoiceInfo;
  v19 = -[AFVoiceInfo init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    languageCode = v19->_languageCode;
    v19->_languageCode = (NSString *)v20;

    v19->_gender = a4;
    v19->_isCustom = a5;
    v22 = objc_msgSend(v16, "copy");
    name = v19->_name;
    v19->_name = (NSString *)v22;

    v19->_footprint = a7;
    v24 = objc_msgSend(v17, "copy");
    contentVersion = v19->_contentVersion;
    v19->_contentVersion = (NSNumber *)v24;

    v26 = objc_msgSend(v18, "copy");
    masteredVersion = v19->_masteredVersion;
    v19->_masteredVersion = (NSString *)v26;

  }
  return v19;
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 isCustom:(BOOL)a5
{
  return -[AFVoiceInfo initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:](self, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", a3, a4, a5, 0, 0, 0, 0);
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 isCustom:(BOOL)a6
{
  return -[AFVoiceInfo initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:](self, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", a3, a4, a6, 0, a5, 0, 0);
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3 gender:(int64_t)a4 name:(id)a5 footprint:(int64_t)a6 isCustom:(BOOL)a7
{
  return -[AFVoiceInfo initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:](self, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", a3, a4, a7, a5, a6, 0, 0);
}

- (AFVoiceInfo)initWithLanguageCode:(id)a3
{
  return -[AFVoiceInfo initWithLanguageCode:gender:isCustom:](self, "initWithLanguageCode:gender:isCustom:", a3, 0, 1);
}

- (int64_t)gender
{
  int64_t result;

  result = self->_gender;
  if (!result)
  {
    if (self->_languageCode)
      return objc_msgSend((id)objc_opt_class(), "defaultGenderForOutputVoiceLanguageCode:", self->_languageCode);
    else
      return 0;
  }
  return result;
}

- (BOOL)isLanguageAndGenderEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *languageCode;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    languageCode = self->_languageCode;
    v7 = (!((unint64_t)languageCode | v5[2]) || -[NSString isEqualToString:](languageCode, "isEqualToString:"))
      && self->_gender == v5[3];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *languageCode;
  NSString *name;
  NSNumber *contentVersion;
  NSString *masteredVersion;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    languageCode = self->_languageCode;
    if ((!((unint64_t)languageCode | v5[2]) || -[NSString isEqualToString:](languageCode, "isEqualToString:"))
      && self->_gender == v5[3]
      && self->_isCustom == *((unsigned __int8 *)v5 + 8)
      && self->_footprint == v5[4]
      && ((name = self->_name, !((unint64_t)name | v5[5]))
       || -[NSString isEqualToString:](name, "isEqualToString:"))
      && ((contentVersion = self->_contentVersion, !((unint64_t)contentVersion | v5[6]))
       || -[NSNumber isEqualToNumber:](contentVersion, "isEqualToNumber:")))
    {
      masteredVersion = self->_masteredVersion;
      if ((unint64_t)masteredVersion | v5[7])
        v10 = -[NSString isEqualToString:](masteredVersion, "isEqualToString:");
      else
        v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_languageCode, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_contentVersion, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_masteredVersion, "hash") ^ self->_gender ^ self->_footprint ^ (16 * self->_isCustom);
}

- (id)description
{
  NSNumber *contentVersion;
  __CFString *v4;
  __CFString *masteredVersion;
  void *v6;
  __CFString *v7;
  void *v8;
  NSString *languageCode;
  NSString *name;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  contentVersion = self->_contentVersion;
  if (contentVersion)
  {
    -[NSNumber stringValue](contentVersion, "stringValue");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("?");
  }
  masteredVersion = (__CFString *)self->_masteredVersion;
  if (!masteredVersion)
    masteredVersion = CFSTR("?");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)AFVoiceInfo;
  v7 = masteredVersion;
  -[AFVoiceInfo description](&v16, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  name = self->_name;
  -[AFVoiceInfo genderString](self, "genderString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCustom);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceInfo footprintString](self, "footprintString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ languageCode: %@ name: %@ gender: %@ custom: %@ footprint: %@ contentVersion: %@ masteredVersion: %@"), v8, languageCode, name, v11, v12, v13, v4, v7, v16.receiver, v16.super_class);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *languageCode;
  NSString *name;
  NSNumber *contentVersion;
  NSString *masteredVersion;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_gender);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Gender"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCustom);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Custom"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_footprint);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Footprint"));

  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v3, "setObject:forKey:", languageCode, CFSTR("Language"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("Name"));
  contentVersion = self->_contentVersion;
  if (contentVersion)
    objc_msgSend(v3, "setObject:forKey:", contentVersion, CFSTR("ContentVersion"));
  masteredVersion = self->_masteredVersion;
  if (masteredVersion)
    objc_msgSend(v3, "setObject:forKey:", masteredVersion, CFSTR("MasteredVersion"));
  return v3;
}

- (AFVoiceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AFVoiceInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFVoiceInfo;
  v5 = -[AFVoiceInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Language"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_languageCode, v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("Gender"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_gender = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Custom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_isCustom = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Footprint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_footprint = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_name, v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("ContentVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_contentVersion, v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("MasteredVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_masteredVersion, v12);

    v5->_wasInitializedFromDictionaryRepresentation = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *languageCode;
  id v5;

  languageCode = self->_languageCode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", languageCode, CFSTR("_languageCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gender, CFSTR("_gender"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCustom, CFSTR("_isCustom"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_footprint, CFSTR("_footprint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentVersion, CFSTR("_contentVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_masteredVersion, CFSTR("_masteredVersion"));

}

- (AFVoiceInfo)initWithCoder:(id)a3
{
  id v4;
  AFVoiceInfo *v5;
  uint64_t v6;
  NSString *languageCode;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSNumber *contentVersion;
  uint64_t v12;
  NSString *masteredVersion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFVoiceInfo;
  v5 = -[AFVoiceInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_languageCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    v5->_gender = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_gender"));
    v5->_isCustom = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCustom"));
    v5->_footprint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_footprint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_masteredVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v12;

  }
  return v5;
}

- (id)genderString
{
  unint64_t v2;

  v2 = -[AFVoiceInfo gender](self, "gender");
  if (v2 > 3)
    return 0;
  else
    return off_1E3A2D128[v2];
}

- (id)footprintString
{
  unint64_t v2;

  v2 = -[AFVoiceInfo footprint](self, "footprint");
  if (v2 > 2)
    return 0;
  else
    return off_1E3A2D148[v2];
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (BOOL)isCustom
{
  return self->_isCustom;
}

- (void)setIsCustom:(BOOL)a3
{
  self->_isCustom = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (BOOL)wasInitializedFromDictionaryRepresentation
{
  return self->_wasInitializedFromDictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

+ (int64_t)defaultGenderForOutputVoiceLanguageCode:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int64_t v6;

  v3 = a3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ar-SA"), CFSTR("en-GB"), CFSTR("en-IN"), CFSTR("fr-FR"), CFSTR("nl-NL"), 0), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "containsObject:", v3), v4, (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isMatchForSiriVoice:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  void *v17;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = -[AFVoiceInfo isCustom](self, "isCustom");
  v7 = -[AFVoiceInfo footprint](self, "footprint");
  v8 = objc_msgSend(v4, "AFVoiceFootprint");
  -[AFVoiceInfo languageCode](self, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v10))
  {
    if (v6)
      v11 = -3;
    else
      v11 = -1;
    -[AFVoiceInfo name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v14 = objc_msgSend(v12, "isEqualToString:", v13);
    v15 = 0;
    if (v14 && (unint64_t)(v11 + v5) <= 1 && v7 == v8)
    {
      -[AFVoiceInfo contentVersion](self, "contentVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "version"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "isEqualToNumber:", v17);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isValidForSiriSessionLanguage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "allVoicesForSiriSessionLanguage:", v4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = -[AFVoiceInfo gender](self, "gender", (_QWORD)v20);
        if (v11 == objc_msgSend(v10, "gender"))
        {
          -[AFVoiceInfo languageCode](self, "languageCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "languageCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {
            objc_msgSend(v10, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AFVoiceInfo name](self, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((v17 & 1) != 0)
            {
              v18 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (id)allVoicesForSiriSessionLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v4, "allOutputVoiceIdentifiersForSiriLanguage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "loadInfoForVoicesWithLanguageCode:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v6, "addObjectsFromArray:", v13);
        }
        else
        {
          v14 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v22 = "+[AFVoiceInfo(AFLocalizationAdditions) allVoicesForSiriSessionLanguage:]";
            v23 = 2112;
            v24 = v12;
            _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s No voices loaded for %@, but they were expected", buf, 0x16u);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)allVoiceInfoForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadInfoForVoicesWithLanguageCode:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)voiceInfoForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadInfoForVoicesWithLanguageCode:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)voiceInfoForSessionLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadInfoForVoicesWithLanguageCode:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(v4, "defaultOutputVoiceForSiriSessionLanguage:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v14 = 136315650;
      v15 = "+[AFVoiceInfo(AFLocalizationAdditions) voiceInfoForSessionLanguageCode:]";
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s No voiceInfo was found for %@. Will return default output voice info instead: %@", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(v4, "loadInfoForVoicesWithLanguageCode:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }

  return v6;
}

+ (id)outputVoiceIdentifierForLanguageCode:(id)a3 voiceName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "_voiceMaps");
      v11 = (void *)*((_QWORD *)&v17 + 1);
    }
    else
    {
      v11 = 0;
      v16 = 0u;
      v17 = 0u;
    }
    objc_msgSend(v11, "objectForKey:", v8, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __destructor_8_s0_s8_s16_s24((id *)&v16);

    if (!v13)
    {
      v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "+[AFVoiceInfo(AFLocalizationAdditions) outputVoiceIdentifierForLanguageCode:voiceName:]";
        v20 = 2112;
        v21 = v5;
        v22 = 2112;
        v23 = v7;
        _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Cannot get output voice identifier for languageCode: %@, voiceName: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "+[AFVoiceInfo(AFLocalizationAdditions) outputVoiceIdentifierForLanguageCode:voiceName:]";
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v7;
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Cannot get output voice identifier for languageCode: %@, voiceName: %@", buf, 0x20u);
    }
    v13 = 0;
  }

  return v13;
}

- (int64_t)VSSpeechGender
{
  int64_t result;

  result = -[AFVoiceInfo gender](self, "gender");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (int64_t)VSSpeechFootprint
{
  int64_t result;

  result = -[AFVoiceInfo footprint](self, "footprint");
  if (result != 2)
    return result == 1;
  return result;
}

- (int64_t)VSSpeechType
{
  if (-[AFVoiceInfo isCustom](self, "isCustom"))
    return 3;
  else
    return 1;
}

- (id)VSVoiceAsset
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC7410]);
  objc_msgSend(v3, "setGender:", -[AFVoiceInfo VSSpeechGender](self, "VSSpeechGender"));
  objc_msgSend(v3, "setFootprint:", -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"));
  objc_msgSend(v3, "setIsBuiltInVoice:", -[AFVoiceInfo isCustom](self, "isCustom") ^ 1);
  -[AFVoiceInfo languageCode](self, "languageCode");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLanguages:", v6);

  }
  -[AFVoiceInfo contentVersion](self, "contentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentVersion:", v7);

  -[AFVoiceInfo masteredVersion](self, "masteredVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasteredVersion:", v8);

  -[AFVoiceInfo name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v9);

  return v3;
}

- (BOOL)isMatchForVoiceAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int64_t v12;
  int64_t v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[AFVoiceInfo name](self, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[AFVoiceInfo name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 0;
  }
  v12 = -[AFVoiceInfo VSSpeechGender](self, "VSSpeechGender");
  if (v12 == objc_msgSend(v4, "gender")
    && (v13 = -[AFVoiceInfo VSSpeechFootprint](self, "VSSpeechFootprint"), v13 == objc_msgSend(v4, "footprint"))
    && (v14 = -[AFVoiceInfo isCustom](self, "isCustom"), v14 != objc_msgSend(v4, "isBuiltInVoice")))
  {
    objc_msgSend(v4, "languages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFVoiceInfo languageCode](self, "languageCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v15, "containsObject:", v16) ^ 1 | v11) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      -[AFVoiceInfo contentVersion](self, "contentVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToNumber:", v20))
      {
        -[AFVoiceInfo masteredVersion](self, "masteredVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "masteredVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v21, "isEqualToString:", v22);

      }
      else
      {
        v17 = 0;
      }

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (int64_t)genderForVSSpeechGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

@end
