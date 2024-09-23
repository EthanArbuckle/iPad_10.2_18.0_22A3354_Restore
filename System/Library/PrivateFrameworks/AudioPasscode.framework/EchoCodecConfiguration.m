@implementation EchoCodecConfiguration

- (EchoCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  EchoCodecConfiguration *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EchoCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("delayForBit0"));
    v5->_delayForBit0 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("delayForBit1"));
    v5->_delayForBit1 = v7;
    v5->_frameSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frameSize"));
    v5->_numFrameRepeat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numFrameRepeat"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("syncDetectThreshold"));
    v5->_syncDetectThreshold = v8;
    v5->_randomSeed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("randomSeed"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("echoGain"));
    v5->_echoGainDB = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("noiseGain"));
    v5->_noiseGainDB = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("hpfCutOffFreq"));
    v5->_hpfCutOffFreq = v11;
    v5->_hfNoiseFillingFlag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hfNoiseFilling")) != 0;
    v5->_algorithmVersionNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("algorithmVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[EchoCodecConfiguration delayForBit0](self, "delayForBit0");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("delayForBit0"));
  -[EchoCodecConfiguration delayForBit1](self, "delayForBit1");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("delayForBit1"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration frameSize](self, "frameSize"), CFSTR("frameSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration numFrameRepeat](self, "numFrameRepeat"), CFSTR("numFrameRepeat"));
  -[EchoCodecConfiguration syncDetectThreshold](self, "syncDetectThreshold");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("syncDetectThreshold"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration randomSeed](self, "randomSeed"), CFSTR("randomSeed"));
  -[EchoCodecConfiguration echoGainDB](self, "echoGainDB");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("echoGain"));
  -[EchoCodecConfiguration noiseGainDB](self, "noiseGainDB");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("noiseGain"));
  -[EchoCodecConfiguration hpfCutOffFreq](self, "hpfCutOffFreq");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("hpfCutOffFreq"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration hfNoiseFillingFlag](self, "hfNoiseFillingFlag"), CFSTR("hfNoiseFilling"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[EchoCodecConfiguration algorithmVersionNumber](self, "algorithmVersionNumber"), CFSTR("algorithmVersion"));
  v5.receiver = self;
  v5.super_class = (Class)EchoCodecConfiguration;
  -[AUPasscodeCodecConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EchoCodecConfiguration)init
{
  void *v3;
  EchoCodecConfiguration *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "echo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)EchoCodecConfiguration;
  v4 = -[AUPasscodeCodecConfiguration initWithAlgorithmName:](&v6, sel_initWithAlgorithmName_, v3);

  if (v4)
    -[EchoCodecConfiguration setDefaultValues](v4, "setDefaultValues");
  return v4;
}

- (void)setDefaultValues
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "echo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUPasscodeCodecConfiguration setAlgorithmName:](self, "setAlgorithmName:", v3);

  self->_delayForBit0 = 0.002;
  self->_delayForBit1 = 0.008;
  self->_frameSize = 2048;
  self->_numFrameRepeat = 2;
  self->_randomSeed = 0;
  self->_echoGainDB = 0.0;
  self->_noiseGainDB = -40.0;
  self->_syncDetectThreshold = 6.0;
  self->_hpfCutOffFreq = 18000.0;
  self->_hfNoiseFillingFlag = 1;
  self->_algorithmVersionNumber = 100;
}

- (id)commandLineOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v16;
  void *v17;
  objc_super v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-n [frames]"), CFSTR("Set the echo frame size"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-r [repeats]"), CFSTR("Set the number of frame repeats"));
  v20 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v20;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-d0 [delay]"), CFSTR("Set the echo delay in msec for bit 0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v2;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-d1 [delay]"), CFSTR("Set the echo delay in msec for bit 1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v3;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-s [seed]"), CFSTR("Set the random number generator seed (32-bit non-zero unsigned integer)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-t [threshold]"), CFSTR("Set the threshold for sync detection in decoder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-eg [echo gain ]"), CFSTR("Set the echo gain in dB for the encoder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-ng [noise gain]"), CFSTR("Set the noise gain in dB for the encoder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-f [freq]"), CFSTR("Set the HPF cut-off frequency in Hz (16000 <= freq <= 20000)"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-alg [algorithm version]"), CFSTR("Set the algorithm version number (100 or 110 (default))"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-nf [0/1]"), CFSTR("Enable noise filling in high band (0:disable, 1:enable (default))"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)EchoCodecConfiguration;
  -[AUPasscodeCodecConfiguration commandLineOptions](&v18, sel_commandLineOptions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (EchoCodecConfiguration)initWithCapabilityData:(id)a3
{
  id v4;
  void *v5;
  EchoCodecConfiguration *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "echo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)EchoCodecConfiguration;
  v6 = -[AUPasscodeCodecConfiguration initWithAlgorithmName:](&v11, sel_initWithAlgorithmName_, v5);

  if (v6)
  {
    -[EchoCodecConfiguration setDefaultValues](v6, "setDefaultValues");
    objc_msgSend(v4, "algorithmVersionNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@max.self"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    v6->_algorithmVersionNumber = v9;
  }

  return v6;
}

- (EchoCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4;
  EchoCodecConfiguration *v5;
  EchoCodecConfiguration *v6;
  id v7;
  uint64_t v8;
  EchoCodecCapability *v9;
  unint64_t i;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t frameSize;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  uint64_t v30;
  int v31;
  int v32;
  float v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  float v46;
  float hpfCutOffFreq;
  unint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  unint64_t algorithmVersionNumber;
  uint64_t *v56;
  uint64_t v57;
  EchoCodecConfiguration *v58;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)EchoCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration initWithCommandLineArgs:](&v60, sel_initWithCommandLineArgs_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_75;
  -[EchoCodecConfiguration setDefaultValues](v5, "setDefaultValues");
  v6->_algorithmVersionNumber = 110;
  v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v7, "setNumberStyle:", 1);
  v8 = objc_msgSend(v4, "count");
  v9 = objc_alloc_init(EchoCodecCapability);
  for (i = 0; i < objc_msgSend(v4, "count"); ++i)
  {
    objc_msgSend(v4, "objectAtIndex:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("-n"));
    if (v8)
      v13 = v12;
    else
      v13 = 0;
    if (v13 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_frameSize = objc_msgSend(v15, "unsignedIntegerValue");

      frameSize = v6->_frameSize;
      v17 = -[EchoCodecCapability frameSizeRange](v9, "frameSizeRange");
LABEL_14:
      v23 = frameSize - v17;
      if (frameSize < v17)
        goto LABEL_73;
LABEL_15:
      if (v23 >= v18)
        goto LABEL_73;
LABEL_29:
      --v8;
      goto LABEL_30;
    }
    v19 = objc_msgSend(v11, "isEqualToString:", CFSTR("-r"));
    if (v8)
      v20 = v19;
    else
      v20 = 0;
    if (v20 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_numFrameRepeat = objc_msgSend(v22, "unsignedIntegerValue");

      frameSize = v6->_numFrameRepeat;
      v17 = -[EchoCodecCapability numFrameRepeatRange](v9, "numFrameRepeatRange");
      goto LABEL_14;
    }
    v24 = objc_msgSend(v11, "isEqualToString:", CFSTR("-d0"));
    if (v8)
      v25 = v24;
    else
      v25 = 0;
    if (v25 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28 / 1000.0;
      v30 = 44;
      goto LABEL_27;
    }
    v31 = objc_msgSend(v11, "isEqualToString:", CFSTR("-d1"));
    if (v8)
      v32 = v31;
    else
      v32 = 0;
    if (v32 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v33 / 1000.0;
      v30 = 48;
      goto LABEL_27;
    }
    v34 = objc_msgSend(v11, "isEqualToString:", CFSTR("-s"));
    if (v8)
      v35 = v34;
    else
      v35 = 0;
    if (v35 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_randomSeed = objc_msgSend(v27, "unsignedIntegerValue");
      goto LABEL_28;
    }
    v36 = objc_msgSend(v11, "isEqualToString:", CFSTR("-t"));
    if (v8)
      v37 = v36;
    else
      v37 = 0;
    if (v37 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v30 = 52;
LABEL_27:
      *(float *)((char *)&v6->super.super.isa + v30) = v29;
      goto LABEL_28;
    }
    v38 = objc_msgSend(v11, "isEqualToString:", CFSTR("-eg"));
    if (v8)
      v39 = v38;
    else
      v39 = 0;
    if (v39 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v30 = 56;
      goto LABEL_27;
    }
    v40 = objc_msgSend(v11, "isEqualToString:", CFSTR("-ng"));
    if (v8)
      v41 = v40;
    else
      v41 = 0;
    if (v41 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v30 = 60;
      goto LABEL_27;
    }
    v42 = objc_msgSend(v11, "isEqualToString:", CFSTR("-f"));
    if (v8)
      v43 = v42;
    else
      v43 = 0;
    if (v43 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "floatValue");
      v6->_hpfCutOffFreq = v46;

      hpfCutOffFreq = v6->_hpfCutOffFreq;
      v48 = -[EchoCodecCapability hpfCutOffFreqRange](v9, "hpfCutOffFreqRange");
      v23 = (unint64_t)hpfCutOffFreq - v48;
      if ((unint64_t)hpfCutOffFreq < v48)
        goto LABEL_73;
      goto LABEL_15;
    }
    v49 = objc_msgSend(v11, "isEqualToString:", CFSTR("-nf"));
    if (v8)
      v50 = v49;
    else
      v50 = 0;
    if (v50 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_hfNoiseFillingFlag = objc_msgSend(v27, "unsignedIntegerValue") != 0;
LABEL_28:

      goto LABEL_29;
    }
    v51 = objc_msgSend(v11, "isEqualToString:", CFSTR("-alg"));
    if (v8)
      v52 = v51;
    else
      v52 = 0;
    if (v52 == 1)
    {
      objc_msgSend(v4, "objectAtIndex:", ++i);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_algorithmVersionNumber = objc_msgSend(v54, "unsignedIntegerValue");

      algorithmVersionNumber = v6->_algorithmVersionNumber;
      v56 = &qword_22959DD68;
      if (!HIDWORD(algorithmVersionNumber))
      {
        v57 = 0;
        while (kSupportedAlgorithmVersions[v57] != (_DWORD)algorithmVersionNumber)
        {
          if (++v57 == 2)
          {
            v56 = &qword_22959DD68;
            goto LABEL_72;
          }
        }
        v56 = (uint64_t *)&kSupportedAlgorithmVersions[v57];
      }
LABEL_72:
      if ((char *)v56 - (char *)kSupportedAlgorithmVersions == 8)
      {
LABEL_73:

        v58 = 0;
        goto LABEL_76;
      }
      goto LABEL_29;
    }
LABEL_30:
    --v8;

  }
LABEL_75:
  v58 = v6;
LABEL_76:

  return v58;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EchoCodecConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[EchoCodecConfiguration init](+[EchoCodecConfiguration allocWithZone:](EchoCodecConfiguration, "allocWithZone:", a3), "init");
  -[AUPasscodeCodecConfiguration setSampleRate:](v4, "setSampleRate:", -[AUPasscodeCodecConfiguration sampleRate](self, "sampleRate"));
  -[AUPasscodeCodecConfiguration setNumChannels:](v4, "setNumChannels:", -[AUPasscodeCodecConfiguration numChannels](self, "numChannels"));
  -[AUPasscodeCodecConfiguration algorithmName](self, "algorithmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[AUPasscodeCodecConfiguration setAlgorithmName:](v4, "setAlgorithmName:", v6);

  -[AUPasscodeCodecConfiguration setPayloadLengthBytes:](v4, "setPayloadLengthBytes:", -[AUPasscodeCodecConfiguration payloadLengthBytes](self, "payloadLengthBytes"));
  -[EchoCodecConfiguration setFrameSize:](v4, "setFrameSize:", -[EchoCodecConfiguration frameSize](self, "frameSize"));
  -[EchoCodecConfiguration setNumFrameRepeat:](v4, "setNumFrameRepeat:", -[EchoCodecConfiguration numFrameRepeat](self, "numFrameRepeat"));
  -[EchoCodecConfiguration delayForBit0](self, "delayForBit0");
  -[EchoCodecConfiguration setDelayForBit0:](v4, "setDelayForBit0:");
  -[EchoCodecConfiguration delayForBit1](self, "delayForBit1");
  -[EchoCodecConfiguration setDelayForBit1:](v4, "setDelayForBit1:");
  -[EchoCodecConfiguration setRandomSeed:](v4, "setRandomSeed:", -[EchoCodecConfiguration randomSeed](self, "randomSeed"));
  -[EchoCodecConfiguration syncDetectThreshold](self, "syncDetectThreshold");
  -[EchoCodecConfiguration setSyncDetectThreshold:](v4, "setSyncDetectThreshold:");
  -[EchoCodecConfiguration echoGainDB](self, "echoGainDB");
  -[EchoCodecConfiguration setEchoGainDB:](v4, "setEchoGainDB:");
  -[EchoCodecConfiguration noiseGainDB](self, "noiseGainDB");
  -[EchoCodecConfiguration setNoiseGainDB:](v4, "setNoiseGainDB:");
  -[EchoCodecConfiguration hpfCutOffFreq](self, "hpfCutOffFreq");
  -[EchoCodecConfiguration setHpfCutOffFreq:](v4, "setHpfCutOffFreq:");
  -[EchoCodecConfiguration setHfNoiseFillingFlag:](v4, "setHfNoiseFillingFlag:", -[EchoCodecConfiguration hfNoiseFillingFlag](self, "hfNoiseFillingFlag"));
  -[EchoCodecConfiguration setAlgorithmVersionNumber:](v4, "setAlgorithmVersionNumber:", -[EchoCodecConfiguration algorithmVersionNumber](self, "algorithmVersionNumber"));
  return v4;
}

- (unint64_t)frameSize
{
  return self->_frameSize;
}

- (void)setFrameSize:(unint64_t)a3
{
  self->_frameSize = a3;
}

- (unint64_t)numFrameRepeat
{
  return self->_numFrameRepeat;
}

- (void)setNumFrameRepeat:(unint64_t)a3
{
  self->_numFrameRepeat = a3;
}

- (float)delayForBit0
{
  return self->_delayForBit0;
}

- (void)setDelayForBit0:(float)a3
{
  self->_delayForBit0 = a3;
}

- (float)delayForBit1
{
  return self->_delayForBit1;
}

- (void)setDelayForBit1:(float)a3
{
  self->_delayForBit1 = a3;
}

- (float)syncDetectThreshold
{
  return self->_syncDetectThreshold;
}

- (void)setSyncDetectThreshold:(float)a3
{
  self->_syncDetectThreshold = a3;
}

- (unint64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(unint64_t)a3
{
  self->_randomSeed = a3;
}

- (float)echoGainDB
{
  return self->_echoGainDB;
}

- (void)setEchoGainDB:(float)a3
{
  self->_echoGainDB = a3;
}

- (float)noiseGainDB
{
  return self->_noiseGainDB;
}

- (void)setNoiseGainDB:(float)a3
{
  self->_noiseGainDB = a3;
}

- (float)hpfCutOffFreq
{
  return self->_hpfCutOffFreq;
}

- (void)setHpfCutOffFreq:(float)a3
{
  self->_hpfCutOffFreq = a3;
}

- (BOOL)hfNoiseFillingFlag
{
  return self->_hfNoiseFillingFlag;
}

- (void)setHfNoiseFillingFlag:(BOOL)a3
{
  self->_hfNoiseFillingFlag = a3;
}

- (unint64_t)algorithmVersionNumber
{
  return self->_algorithmVersionNumber;
}

- (void)setAlgorithmVersionNumber:(unint64_t)a3
{
  self->_algorithmVersionNumber = a3;
}

@end
