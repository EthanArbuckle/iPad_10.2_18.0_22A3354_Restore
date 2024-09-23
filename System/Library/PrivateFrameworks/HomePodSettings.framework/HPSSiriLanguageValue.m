@implementation HPSSiriLanguageValue

- (HPSSiriLanguageValue)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6
{
  id v10;
  id v11;
  id v12;
  HPSSiriLanguageValue *v13;
  uint64_t v14;
  NSString *recognitionLanguage;
  uint64_t v16;
  NSString *outputLanguage;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HPSSiriLanguageValue;
  v13 = -[HPSSiriLanguageValue init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    recognitionLanguage = v13->_recognitionLanguage;
    v13->_recognitionLanguage = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    outputLanguage = v13->_outputLanguage;
    v13->_outputLanguage = (NSString *)v16;

    v13->_gender = a5;
    objc_storeStrong((id *)&v13->_voiceName, a6);
  }

  return v13;
}

+ (id)languageDefaultWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BYTE *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithRecognitionLanguage:outputLanguage:gender:voiceName:", v12, v11, a5, v10);

  v13[8] = 1;
  return v13;
}

+ (id)languagesFromVoices:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = objc_msgSend(v6, "count");
  if (v26)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "gender");
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "languageDefaultWithRecognitionLanguage:outputLanguage:gender:voiceName:", v7, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 == 1)
    {
      v27[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v26);
      objc_msgSend(v14, "addObject:", v12);
      v15 = 1;
      v25 = v7;
      do
      {
        v16 = v8;
        v17 = v12;
        objc_msgSend(v6, "objectAtIndex:", v15, v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc((Class)a1);
        objc_msgSend(v8, "languageCode");
        v19 = a1;
        v20 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v8, "gender");
        objc_msgSend(v8, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v18, "initWithRecognitionLanguage:outputLanguage:gender:voiceName:", v25, v21, v22, v23);

        v6 = v20;
        a1 = v19;
        objc_msgSend(v14, "addObject:", v12);
        ++v15;
      }
      while (v26 != v15);
      v13 = (void *)objc_msgSend(v14, "copy");

      v7 = v25;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v13;
}

- (BOOL)alignsWithVoice:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (v5 = -[HPSSiriLanguageValue gender](self, "gender"), v5 == objc_msgSend(v4, "gender")))
  {
    -[HPSSiriLanguageValue outputLanguage](self, "outputLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[HPSSiriLanguageValue voiceName](self, "voiceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

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

- (BOOL)isEqual:(id)a3
{
  HPSSiriLanguageValue *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HPSSiriLanguageValue *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[HPSSiriLanguageValue gender](self, "gender"), v5 == -[HPSSiriLanguageValue gender](v4, "gender")))
    {
      -[HPSSiriLanguageValue recognitionLanguage](self, "recognitionLanguage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSSiriLanguageValue recognitionLanguage](v4, "recognitionLanguage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[HPSSiriLanguageValue outputLanguage](self, "outputLanguage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HPSSiriLanguageValue outputLanguage](v4, "outputLanguage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[HPSSiriLanguageValue voiceName](self, "voiceName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HPSSiriLanguageValue voiceName](v4, "voiceName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[HPSSiriLanguageValue recognitionLanguage](self, "recognitionLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HPSSiriLanguageValue outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HPSSiriLanguageValue voiceName](self, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[HPSSiriLanguageValue gender](self, "gender");

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSiriLanguageValue voiceName](self, "voiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HPSSiriLanguageValue gender](self, "gender");
  -[HPSSiriLanguageValue recognitionLanguage](self, "recognitionLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSiriLanguageValue outputLanguage](self, "outputLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HPSSiriLanguageValue isDefault](self, "isDefault");
  v11 = "";
  if (v10)
    v11 = ", isDefault";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\": Gender = %ld, Recognition = %@, Output = %@%s>"), v5, self, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HPSSiriLanguageValue recognitionLanguage](self, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("value.recognition"));

  -[HPSSiriLanguageValue outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("value.output"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HPSSiriLanguageValue gender](self, "gender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("value.gender"));

  -[HPSSiriLanguageValue voiceName](self, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("value.name"));

  objc_msgSend(v8, "encodeBool:forKey:", -[HPSSiriLanguageValue isDefault](self, "isDefault"), CFSTR("value.default"));
}

- (HPSSiriLanguageValue)initWithCoder:(id)a3
{
  id v4;
  HPSSiriLanguageValue *v5;
  uint64_t v6;
  NSString *recognitionLanguage;
  uint64_t v8;
  NSString *outputLanguage;
  uint64_t v10;
  NSString *voiceName;
  HPSSiriLanguageValue *v12;
  HPSSiriLanguageValue *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HPSSiriLanguageValue;
  v5 = -[HPSSiriLanguageValue init](&v15, sel_init);
  if (!v5)
    goto LABEL_7;
  v5->_languageDefault = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("value.default"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value.recognition"));
  v6 = objc_claimAutoreleasedReturnValue();
  recognitionLanguage = v5->_recognitionLanguage;
  v5->_recognitionLanguage = (NSString *)v6;

  if (!v5->_recognitionLanguage)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value.output"));
  v8 = objc_claimAutoreleasedReturnValue();
  outputLanguage = v5->_outputLanguage;
  v5->_outputLanguage = (NSString *)v8;

  if (!v5->_outputLanguage
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value.name")),
        v10 = objc_claimAutoreleasedReturnValue(),
        voiceName = v5->_voiceName,
        v5->_voiceName = (NSString *)v10,
        voiceName,
        !v5->_voiceName))
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value.gender"));
  v12 = (HPSSiriLanguageValue *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v5->_gender = -[HPSSiriLanguageValue integerValue](v12, "integerValue");

LABEL_7:
    v13 = v5;
  }
LABEL_9:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (BOOL)isDefault
{
  return self->_languageDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
}

@end
