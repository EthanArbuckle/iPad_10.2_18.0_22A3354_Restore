@implementation NullCodecConfiguration

- (NullCodecConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NullCodecConfiguration;
  return -[AUPasscodeCodecConfiguration initWithAlgorithmName:](&v3, sel_initWithAlgorithmName_, CFSTR("null"));
}

- (NullCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  NullCodecConfiguration *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NullCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("retrievalCallbackInterval"));
    v5->_retrievalCallbackInterval = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NullCodecConfiguration retrievalCallbackInterval](self, "retrievalCallbackInterval");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("retrievalCallbackInterval"));
  v5.receiver = self;
  v5.super_class = (Class)NullCodecConfiguration;
  -[AUPasscodeCodecConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);

}

- (void)setDefaultValues
{
  -[AUPasscodeCodecConfiguration setAlgorithmName:](self, "setAlgorithmName:", CFSTR("null"));
  self->_retrievalCallbackInterval = 4.0;
}

- (id)commandLineOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  +[AUPasscodeCodecCommandLineOption optionWithSyntax:description:](AUPasscodeCodecCommandLineOption, "optionWithSyntax:description:", CFSTR("-t [seconds]"), CFSTR("Set the time interval between irrelevant data retrieved handlers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)NullCodecConfiguration;
  -[AUPasscodeCodecConfiguration commandLineOptions](&v8, sel_commandLineOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NullCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4;
  NullCodecConfiguration *v5;
  NullCodecConfiguration *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NullCodecConfiguration;
  v5 = -[AUPasscodeCodecConfiguration initWithCommandLineArgs:](&v15, sel_initWithCommandLineArgs_, v4);
  v6 = v5;
  if (v5)
  {
    -[NullCodecConfiguration setDefaultValues](v5, "setDefaultValues");
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    v8 = objc_msgSend(v4, "count");
    if (objc_msgSend(v4, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("-t")))
          v11 = v8 == 0;
        else
          v11 = 1;
        if (!v11)
        {
          objc_msgSend(v4, "objectAtIndex:", ++v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "numberFromString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v6->_retrievalCallbackInterval = (float)(unint64_t)objc_msgSend(v13, "unsignedIntegerValue");

          --v8;
        }
        --v8;

        ++v9;
      }
      while (v9 < objc_msgSend(v4, "count"));
    }

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)retrievalCallbackInterval
{
  return self->_retrievalCallbackInterval;
}

- (void)setRetrievalCallbackInterval:(float)a3
{
  self->_retrievalCallbackInterval = a3;
}

@end
