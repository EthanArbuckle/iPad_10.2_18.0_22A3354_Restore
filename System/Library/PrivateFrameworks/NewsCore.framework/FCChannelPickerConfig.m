@implementation FCChannelPickerConfig

- (FCChannelPickerConfig)initWithPickerID:(id)a3 configDictionary:(id)a4
{
  id v6;
  id v7;
  FCChannelPickerConfig *v8;
  uint64_t v9;
  NSString *pickerID;
  uint64_t v11;
  NSString *titleText;
  uint64_t v13;
  NSString *featureName;
  uint64_t v15;
  NSString *buttonTitle;
  void *v17;
  uint64_t v18;
  FCContentColorPair *featureTextColor;
  uint64_t v20;
  NSArray *initialChannelIDs;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FCChannelPickerConfig;
  v8 = -[FCChannelPickerConfig init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pickerID = v8->_pickerID;
    v8->_pickerID = (NSString *)v9;

    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("titleText"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    titleText = v8->_titleText;
    v8->_titleText = (NSString *)v11;

    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("featureName"), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v13;

    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("buttonTitle"), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v8->_buttonTitle;
    v8->_buttonTitle = (NSString *)v15;

    FCAppConfigurationDictionaryValueWithDefaultValue(v7, (uint64_t)CFSTR("featureTextColor"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCContentColorPair colorPairWithDictionary:](FCContentColorPair, "colorPairWithDictionary:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    featureTextColor = v8->_featureTextColor;
    v8->_featureTextColor = (FCContentColorPair *)v18;

    v8->_showRelatedChannels = FCAppConfigurationBoolValue(v7, (uint64_t)CFSTR("showRelatedChannels"), 0);
    FCAppConfigurationArrayValueWithDefaultValue(v7, (uint64_t)CFSTR("initialChannelIDs"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
    initialChannelIDs = v8->_initialChannelIDs;
    v8->_initialChannelIDs = (NSArray *)v20;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialChannelIDs, 0);
  objc_storeStrong((id *)&self->_featureTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_pickerID, 0);
}

- (NSString)pickerID
{
  return self->_pickerID;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (FCContentColorPair)featureTextColor
{
  return self->_featureTextColor;
}

- (NSArray)initialChannelIDs
{
  return self->_initialChannelIDs;
}

- (BOOL)showRelatedChannels
{
  return self->_showRelatedChannels;
}

@end
