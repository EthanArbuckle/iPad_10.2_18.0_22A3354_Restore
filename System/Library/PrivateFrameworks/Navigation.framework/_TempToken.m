@implementation _TempToken

- (_TempToken)initWithCoder:(id)a3
{
  id v4;
  _TempToken *v5;
  uint64_t v6;
  NSString *token;
  void *v8;
  uint64_t v9;
  NSArray *value3s;
  uint64_t v11;
  NSString *stringValue;
  float v13;
  uint64_t v14;
  GEOGenericCombinations *genericCombinations;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *timeStampValues;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_TempToken;
  v5 = -[_TempToken init](&v26, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_value1 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value1"));
    v5->_value2 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value2"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value3s"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    value3s = v5->_value3s;
    v5->_value3s = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v11;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("percentageValue"));
    v5->_percentageValue = v13;
    v5->_shouldScaleUnits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldScaleUnits"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genericCombinations"));
    v14 = objc_claimAutoreleasedReturnValue();
    genericCombinations = v5->_genericCombinations;
    v5->_genericCombinations = (GEOGenericCombinations *)v14;

    v5->_waypointIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("waypointIndex"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("priceValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EEF08FA0))
      objc_storeStrong((id *)&v5->_priceValue, v16);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("artworkValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EEF092A8))
      objc_storeStrong((id *)&v5->_artworkValue, v17);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestampValues"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    timeStampValues = v5->_timeStampValues;
    v5->_timeStampValues = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("countdownValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EEF09460))
      objc_storeStrong((id *)&v5->_countdownValue, v21);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("urlValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EEF094C0))
      objc_storeStrong((id *)&v5->_urlValue, v22);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("maneuverValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "conformsToProtocol:", &unk_1EEF094C0))
      objc_storeStrong((id *)&v5->_maneuverValue, v23);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("numberData"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EEF09520))
      objc_storeStrong((id *)&v5->_numberData, v24);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  double v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_value1, CFSTR("value1"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_value2, CFSTR("value2"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_value3s, CFSTR("value3s"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
  *(float *)&v5 = self->_percentageValue;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("percentageValue"), v5);
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldScaleUnits, CFSTR("shouldScaleUnits"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_genericCombinations, CFSTR("genericCombinations"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_waypointIndex, CFSTR("waypointIndex"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_priceValue, CFSTR("priceValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_artworkValue, CFSTR("artworkValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_timeStampValues, CFSTR("timeStampValues"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_countdownValue, CFSTR("countdownValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_urlValue, CFSTR("urlValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_maneuverValue, CFSTR("maneuverValue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_numberData, CFSTR("numberData"));

}

- (_TempToken)initWithToken:(id)a3
{
  id v4;
  _TempToken *v5;
  uint64_t v6;
  NSString *token;
  uint64_t v8;
  NSArray *value3s;
  uint64_t v10;
  NSString *stringValue;
  float v12;
  uint64_t v13;
  GEOGenericCombinations *genericCombinations;
  uint64_t v15;
  GEOServerFormatTokenPriceValue *priceValue;
  uint64_t v17;
  GEOTransitArtworkDataSource *artworkValue;
  uint64_t v19;
  NSArray *timeStampValues;
  uint64_t v21;
  GEOServerFormatTokenCountdownValue *countdownValue;
  uint64_t v23;
  GEOServerFormatTokenUrlValue *urlValue;
  uint64_t v25;
  GEOServerFormatTokenManeuverValue *maneuverValue;
  uint64_t v27;
  GEOServerFormatTokenNumberData *numberData;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_TempToken;
  v5 = -[_TempToken init](&v30, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "token");
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_value1 = objc_msgSend(v4, "value1");
    v5->_value2 = objc_msgSend(v4, "value2");
    objc_msgSend(v4, "value3s");
    v8 = objc_claimAutoreleasedReturnValue();
    value3s = v5->_value3s;
    v5->_value3s = (NSArray *)v8;

    objc_msgSend(v4, "stringValue");
    v10 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v10;

    objc_msgSend(v4, "percentageValue");
    v5->_percentageValue = v12;
    v5->_shouldScaleUnits = objc_msgSend(v4, "shouldScaleUnits");
    objc_msgSend(v4, "genericCombinations");
    v13 = objc_claimAutoreleasedReturnValue();
    genericCombinations = v5->_genericCombinations;
    v5->_genericCombinations = (GEOGenericCombinations *)v13;

    v5->_waypointIndex = objc_msgSend(v4, "waypointIndex");
    objc_msgSend(v4, "priceValue");
    v15 = objc_claimAutoreleasedReturnValue();
    priceValue = v5->_priceValue;
    v5->_priceValue = (GEOServerFormatTokenPriceValue *)v15;

    objc_msgSend(v4, "artworkValue");
    v17 = objc_claimAutoreleasedReturnValue();
    artworkValue = v5->_artworkValue;
    v5->_artworkValue = (GEOTransitArtworkDataSource *)v17;

    objc_msgSend(v4, "timeStampValues");
    v19 = objc_claimAutoreleasedReturnValue();
    timeStampValues = v5->_timeStampValues;
    v5->_timeStampValues = (NSArray *)v19;

    objc_msgSend(v4, "countdownValue");
    v21 = objc_claimAutoreleasedReturnValue();
    countdownValue = v5->_countdownValue;
    v5->_countdownValue = (GEOServerFormatTokenCountdownValue *)v21;

    objc_msgSend(v4, "urlValue");
    v23 = objc_claimAutoreleasedReturnValue();
    urlValue = v5->_urlValue;
    v5->_urlValue = (GEOServerFormatTokenUrlValue *)v23;

    objc_msgSend(v4, "maneuverValue");
    v25 = objc_claimAutoreleasedReturnValue();
    maneuverValue = v5->_maneuverValue;
    v5->_maneuverValue = (GEOServerFormatTokenManeuverValue *)v25;

    objc_msgSend(v4, "numberData");
    v27 = objc_claimAutoreleasedReturnValue();
    numberData = v5->_numberData;
    v5->_numberData = (GEOServerFormatTokenNumberData *)v27;

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (unsigned)value1
{
  return self->_value1;
}

- (void)setValue1:(unsigned int)a3
{
  self->_value1 = a3;
}

- (unsigned)value2
{
  return self->_value2;
}

- (void)setValue2:(unsigned int)a3
{
  self->_value2 = a3;
}

- (NSArray)value3s
{
  return self->_value3s;
}

- (void)setValue3s:(id)a3
{
  objc_storeStrong((id *)&self->_value3s, a3);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (float)percentageValue
{
  return self->_percentageValue;
}

- (void)setPercentageValue:(float)a3
{
  self->_percentageValue = a3;
}

- (BOOL)shouldScaleUnits
{
  return self->_shouldScaleUnits;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (GEOServerFormatTokenPriceValue)priceValue
{
  return self->_priceValue;
}

- (void)setPriceValue:(id)a3
{
  objc_storeStrong((id *)&self->_priceValue, a3);
}

- (GEOTransitArtworkDataSource)artworkValue
{
  return self->_artworkValue;
}

- (void)setArtworkValue:(id)a3
{
  objc_storeStrong((id *)&self->_artworkValue, a3);
}

- (NSArray)timeStampValues
{
  return self->_timeStampValues;
}

- (void)setTimeStampValues:(id)a3
{
  objc_storeStrong((id *)&self->_timeStampValues, a3);
}

- (GEOServerFormatTokenCountdownValue)countdownValue
{
  return self->_countdownValue;
}

- (void)setCountdownValue:(id)a3
{
  objc_storeStrong((id *)&self->_countdownValue, a3);
}

- (GEOServerFormatTokenUrlValue)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (GEOServerFormatTokenManeuverValue)maneuverValue
{
  return self->_maneuverValue;
}

- (void)setManeuverValue:(id)a3
{
  objc_storeStrong((id *)&self->_maneuverValue, a3);
}

- (GEOServerFormatTokenNumberData)numberData
{
  return self->_numberData;
}

- (void)setNumberData:(id)a3
{
  objc_storeStrong((id *)&self->_numberData, a3);
}

- (GEOGenericCombinations)genericCombinations
{
  return self->_genericCombinations;
}

- (void)setGenericCombinations:(id)a3
{
  objc_storeStrong((id *)&self->_genericCombinations, a3);
}

- (int)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(int)a3
{
  self->_waypointIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericCombinations, 0);
  objc_storeStrong((id *)&self->_numberData, 0);
  objc_storeStrong((id *)&self->_maneuverValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_countdownValue, 0);
  objc_storeStrong((id *)&self->_timeStampValues, 0);
  objc_storeStrong((id *)&self->_artworkValue, 0);
  objc_storeStrong((id *)&self->_priceValue, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_value3s, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
