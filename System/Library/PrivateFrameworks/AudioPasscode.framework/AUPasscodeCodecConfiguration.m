@implementation AUPasscodeCodecConfiguration

- (AUPasscodeCodecConfiguration)initWithAlgorithmName:(id)a3
{
  id v5;
  AUPasscodeCodecConfiguration *v6;
  AUPasscodeCodecConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUPasscodeCodecConfiguration;
  v6 = -[AUPasscodeCodecConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algorithmName, a3);
    -[AUPasscodeCodecConfiguration __setDefaultValues](v7, "__setDefaultValues");
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AUPasscodeCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  AUPasscodeCodecConfiguration *v5;
  uint64_t v6;
  NSString *algorithmName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUPasscodeCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration init](&v9, sel_init);
  if (v5)
  {
    v5->_payloadLengthBytes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payLen"));
    v5->_sampleRate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("samplerate"));
    v5->_numChannels = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("chans"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algoName"));
    v6 = objc_claimAutoreleasedReturnValue();
    algorithmName = v5->_algorithmName;
    v5->_algorithmName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t payloadLengthBytes;
  id v5;

  payloadLengthBytes = self->_payloadLengthBytes;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", payloadLengthBytes, CFSTR("payLen"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampleRate, CFSTR("samplerate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numChannels, CFSTR("chans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_algorithmName, CFSTR("algoName"));

}

- (void)__setDefaultValues
{
  *(_OWORD *)&self->_payloadLengthBytes = xmmword_22959E070;
  self->_numChannels = 1;
}

- (id)commandLineOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-fs [sample_rate]"), CFSTR("Set the sample rate to use for IO (44100 and 48000 only)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-ps [payload_size]"), CFSTR("Set the number of bytes in the payload (inferred from payload on encode/play)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-nc [channels]"), CFSTR("Set the number of channels to use for IO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AUPasscodeCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4;
  AUPasscodeCodecConfiguration *v5;
  AUPasscodeCodecConfiguration *v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  unint64_t numChannels;
  unint64_t v22;
  unint64_t v23;
  AUPasscodeCodecConfiguration *v24;
  AUPasscodeCodecCapability *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AUPasscodeCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AUPasscodeCodecConfiguration __setDefaultValues](v5, "__setDefaultValues");
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    v26 = objc_alloc_init(AUPasscodeCodecCapability);
    v8 = objc_msgSend(v4, "count");
    if (objc_msgSend(v4, "count"))
    {
      for (i = 0; i < objc_msgSend(v4, "count"); ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("-fs")))
          v11 = v8 == 0;
        else
          v11 = 1;
        if (v11)
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("-ps")) && v8)
          {
            objc_msgSend(v4, "objectAtIndex:", ++i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "numberFromString:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v6->_payloadLengthBytes = objc_msgSend(v13, "unsignedIntegerValue");

          }
          else
          {
            if (!objc_msgSend(v10, "isEqualToString:", CFSTR("-nc")) || !v8)
              goto LABEL_19;
            objc_msgSend(v4, "objectAtIndex:", ++i);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "numberFromString:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v6->_numChannels = objc_msgSend(v20, "unsignedIntegerValue");

            numChannels = v6->_numChannels;
            v22 = -[AUPasscodeCodecCapability numChannelRange](v26, "numChannelRange");
            if (numChannels < v22 || numChannels - v22 >= v23)
            {
LABEL_23:

              v24 = 0;
              goto LABEL_22;
            }
          }
        }
        else
        {
          objc_msgSend(v4, "objectAtIndex:", ++i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "numberFromString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v6->_sampleRate = objc_msgSend(v15, "unsignedIntegerValue");

          -[AUPasscodeCodecCapability supportedSampleRates](v26, "supportedSampleRates");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6->_sampleRate);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsObject:", v17);

          if (!v18)
            goto LABEL_23;
        }
        --v8;
LABEL_19:
        --v8;

      }
    }

  }
  v24 = v6;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AUPasscodeCodecConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[AUPasscodeCodecConfiguration init](+[AUPasscodeCodecConfiguration allocWithZone:](AUPasscodeCodecConfiguration, "allocWithZone:", a3), "init");
  -[AUPasscodeCodecConfiguration setPayloadLengthBytes:](v4, "setPayloadLengthBytes:", -[AUPasscodeCodecConfiguration payloadLengthBytes](self, "payloadLengthBytes"));
  -[AUPasscodeCodecConfiguration setSampleRate:](v4, "setSampleRate:", -[AUPasscodeCodecConfiguration sampleRate](self, "sampleRate"));
  -[AUPasscodeCodecConfiguration setNumChannels:](v4, "setNumChannels:", -[AUPasscodeCodecConfiguration numChannels](self, "numChannels"));
  -[AUPasscodeCodecConfiguration algorithmName](self, "algorithmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[AUPasscodeCodecConfiguration setAlgorithmName:](v4, "setAlgorithmName:", v6);

  return v4;
}

- (int64_t)payloadLengthBytes
{
  return self->_payloadLengthBytes;
}

- (void)setPayloadLengthBytes:(int64_t)a3
{
  self->_payloadLengthBytes = a3;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (int64_t)numChannels
{
  return self->_numChannels;
}

- (void)setNumChannels:(int64_t)a3
{
  self->_numChannels = a3;
}

- (NSString)algorithmName
{
  return self->_algorithmName;
}

- (void)setAlgorithmName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmName, 0);
}

@end
