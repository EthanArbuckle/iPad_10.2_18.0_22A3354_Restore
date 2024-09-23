@implementation HMDCompositeLanguageSetting

- (HMDCompositeLanguageSetting)initWithInputLanguage:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6 readVersion:(id)a7 writeVersion:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDCompositeLanguageSetting *v18;
  HMDCompositeLanguageSetting *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDCompositeLanguageSetting;
  v18 = -[HMDCompositeSetting initWithReadVersion:writeVersion:](&v22, sel_initWithReadVersion_writeVersion_, a7, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_outputVoiceGenderCode, a5);
    objc_storeStrong((id *)&v19->_inputLanguageCode, a3);
    objc_storeStrong((id *)&v19->_outputVoiceLanguageCode, a4);
    objc_storeStrong((id *)&v19->_voiceName, a6);
  }

  return v19;
}

- (BOOL)isEqualValue:(id)a3
{
  HMDCompositeLanguageSetting *v4;
  HMDCompositeLanguageSetting *v5;
  HMDCompositeLanguageSetting *v6;
  HMDCompositeLanguageSetting *v7;
  HMDCompositeLanguageSetting *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;

  v4 = (HMDCompositeLanguageSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    if (-[HMDCompositeLanguageSetting conformsToProtocol:](v4, "conformsToProtocol:", &unk_2557CA3D8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      -[HMDCompositeLanguageSetting inputLanguageCode](v7, "inputLanguageCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeLanguageSetting inputLanguageCode](self, "inputLanguageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[HMDCompositeLanguageSetting outputVoiceGenderCode](v8, "outputVoiceGenderCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCompositeLanguageSetting outputVoiceGenderCode](self, "outputVoiceGenderCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          -[HMDCompositeLanguageSetting outputVoiceLanguageCode](v8, "outputVoiceLanguageCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCompositeLanguageSetting outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v14))
          {
            -[HMDCompositeLanguageSetting voiceName](v8, "voiceName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCompositeLanguageSetting voiceName](self, "voiceName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15 == v16)
            {
              v19 = 1;
            }
            else
            {
              v22 = v16;
              -[HMDCompositeLanguageSetting voiceName](v8, "voiceName");
              v21 = v13;
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDCompositeLanguageSetting voiceName](self, "voiceName");
              v23 = v15;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

              v15 = v23;
              v13 = v21;
              v16 = v22;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HMDCompositeLanguageSetting *v4;
  HMDCompositeLanguageSetting *v5;
  HMDCompositeLanguageSetting *v6;
  HMDCompositeLanguageSetting *v7;
  BOOL v8;
  objc_super v10;

  v4 = (HMDCompositeLanguageSetting *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6 && -[HMDCompositeLanguageSetting isEqualValue:](v6, "isEqualValue:", self))
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeLanguageSetting;
      v8 = -[HMDCompositeSetting isEqual:](&v10, sel_isEqual_, v7);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HMDCompositeLanguageSetting;
  -[HMDCompositeSetting attributeDescriptions](&v19, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeLanguageSetting inputLanguageCode](self, "inputLanguageCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("inputLanguageCode"), v18);
  v20[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeLanguageSetting outputVoiceGenderCode](self, "outputVoiceGenderCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("outputVoiceGenderCode"), v7);
  v20[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeLanguageSetting outputVoiceLanguageCode](self, "outputVoiceLanguageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("outputVoiceLanguageCode"), v10);
  v20[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCompositeLanguageSetting voiceName](self, "voiceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("voiceName"), v13);
  v20[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)inputLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)outputVoiceGenderCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)voiceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

@end
