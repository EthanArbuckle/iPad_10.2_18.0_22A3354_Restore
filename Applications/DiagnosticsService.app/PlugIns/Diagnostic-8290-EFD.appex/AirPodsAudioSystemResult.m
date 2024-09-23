@implementation AirPodsAudioSystemResult

- (id)dictionaryValue
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v18.receiver = self;
  v18.super_class = (Class)AirPodsAudioSystemResult;
  v4 = -[AudioSystemResult dictionaryValue](&v18, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemResult energyValues](self, "energyValues"));
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("energyValues"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("energyValues"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemResult xCorrPNR](self, "xCorrPNR"));
  if (v9)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("xCoorPNR"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("xCoorPNR"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemResult xCorrPeak](self, "xCorrPeak"));
  if (v11)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("xCoorPeak"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("xCoorPeak"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemResult xCorrCenter](self, "xCorrCenter"));
  if (v13)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("xCoorCenter"));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("xCoorCenter"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[AirPodsAudioSystemResult audioTestType](self, "audioTestType")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("audioTestType"));

  v16 = objc_msgSend(v6, "copy");
  return v16;
}

- (NSArray)energyValues
{
  return self->_energyValues;
}

- (void)setEnergyValues:(id)a3
{
  objc_storeStrong((id *)&self->_energyValues, a3);
}

- (NSNumber)xCorrPNR
{
  return self->_xCorrPNR;
}

- (void)setXCorrPNR:(id)a3
{
  objc_storeStrong((id *)&self->_xCorrPNR, a3);
}

- (NSNumber)xCorrPeak
{
  return self->_xCorrPeak;
}

- (void)setXCorrPeak:(id)a3
{
  objc_storeStrong((id *)&self->_xCorrPeak, a3);
}

- (NSNumber)xCorrCenter
{
  return self->_xCorrCenter;
}

- (void)setXCorrCenter:(id)a3
{
  objc_storeStrong((id *)&self->_xCorrCenter, a3);
}

- (int64_t)audioTestType
{
  return self->_audioTestType;
}

- (void)setAudioTestType:(int64_t)a3
{
  self->_audioTestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xCorrCenter, 0);
  objc_storeStrong((id *)&self->_xCorrPeak, 0);
  objc_storeStrong((id *)&self->_xCorrPNR, 0);
  objc_storeStrong((id *)&self->_energyValues, 0);
}

@end
