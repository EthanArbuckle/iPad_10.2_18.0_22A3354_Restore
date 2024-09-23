@implementation AUPasscodeCodecCapability

- (AUPasscodeCodecCapability)init
{
  return -[AUPasscodeCodecCapability initWithAlgorithmName:](self, "initWithAlgorithmName:", &stru_24F24C5A8);
}

- (AUPasscodeCodecCapability)initWithAlgorithmName:(id)a3
{
  id v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AUPasscodeCodecCapability;
  v6 = -[AUPasscodeCodecCapability init](&v13, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 44100);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 48000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v10;

    *(_OWORD *)(v6 + 24) = xmmword_22959E080;
    objc_storeStrong((id *)v6 + 1, a3);
  }

  return (AUPasscodeCodecCapability *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AUPasscodeCodecCapability isEqualToPasscodeCodecCapability:](self, "isEqualToPasscodeCodecCapability:", v4);

  return v5;
}

- (BOOL)isEqualToPasscodeCodecCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[AUPasscodeCodecCapability supportedSampleRates](self, "supportedSampleRates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedSampleRates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = -[AUPasscodeCodecCapability numChannelRange](self, "numChannelRange");
    v9 = v8;
    v11 = 0;
    if (v7 == objc_msgSend(v4, "numChannelRange") && v9 == v10)
    {
      -[AUPasscodeCodecCapability algorithmName](self, "algorithmName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "algorithmName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "isEqual:", v13);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)algorithmName
{
  return self->_algorithmName;
}

- (NSArray)supportedSampleRates
{
  return self->_supportedSampleRates;
}

- (_NSRange)numChannelRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_numChannelRange.length;
  location = self->_numChannelRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSampleRates, 0);
  objc_storeStrong((id *)&self->_algorithmName, 0);
}

@end
