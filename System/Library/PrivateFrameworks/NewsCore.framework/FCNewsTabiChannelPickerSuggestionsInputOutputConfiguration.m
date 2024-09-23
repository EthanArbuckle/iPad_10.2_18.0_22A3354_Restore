@implementation FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v19;
  id *p_isa;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v21;
  id v23;
  id v24;
  objc_super v25;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("contextFeatureKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("generalChannelSuggestionsOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("generalChannelSuggestionsScoreOutputName"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("newsPlusChannelSuggestionsOutputName"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v24 = v13;
          v23 = v14;
          FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("newsPlusChannelSuggestionsScoreOutputName"), 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
            v25.receiver = self;
            v25.super_class = (Class)FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration;
            v19 = -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration init](&v25, sel_init, v23);
            p_isa = (id *)&v19->super.isa;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_contextFeatureKey, v6);
              objc_storeStrong(p_isa + 2, v9);
              objc_storeStrong(p_isa + 3, v12);
              objc_storeStrong(p_isa + 4, v15);
              objc_storeStrong(p_isa + 5, v17);
            }
            self = p_isa;

            v21 = self;
          }
          else
          {
            v21 = 0;
          }

          v13 = v24;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsOutputName, 0);
  objc_storeStrong((id *)&self->_generalChannelSuggestionsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_generalChannelSuggestionsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)init
{
  return -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration contextFeatureKey](self, "contextFeatureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontextFeatureKey: %@;"), v4);

  -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration generalChannelSuggestionsOutputName](self, "generalChannelSuggestionsOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tgeneralChannelSuggestionsOutputName: %@;"), v5);

  -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration generalChannelSuggestionsScoreOutputName](self, "generalChannelSuggestionsScoreOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tgeneralChannelSuggestionsScoreOutputName: %@;"), v6);

  -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration newsPlusChannelSuggestionsOutputName](self, "newsPlusChannelSuggestionsOutputName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnewsPlusChannelSuggestionsOutputName: %@;"), v7);

  -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration newsPlusChannelSuggestionsScoreOutputName](self, "newsPlusChannelSuggestionsScoreOutputName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnewsPlusChannelSuggestionsScoreOutputName: %@;"), v8);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void)setContextFeatureKey:(id)a3
{
  objc_storeStrong((id *)&self->_contextFeatureKey, a3);
}

- (NSString)generalChannelSuggestionsOutputName
{
  return self->_generalChannelSuggestionsOutputName;
}

- (void)setGeneralChannelSuggestionsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_generalChannelSuggestionsOutputName, a3);
}

- (NSString)generalChannelSuggestionsScoreOutputName
{
  return self->_generalChannelSuggestionsScoreOutputName;
}

- (void)setGeneralChannelSuggestionsScoreOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_generalChannelSuggestionsScoreOutputName, a3);
}

- (NSString)newsPlusChannelSuggestionsOutputName
{
  return self->_newsPlusChannelSuggestionsOutputName;
}

- (void)setNewsPlusChannelSuggestionsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsOutputName, a3);
}

- (NSString)newsPlusChannelSuggestionsScoreOutputName
{
  return self->_newsPlusChannelSuggestionsScoreOutputName;
}

- (void)setNewsPlusChannelSuggestionsScoreOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsScoreOutputName, a3);
}

@end
