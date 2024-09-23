@implementation SNSoundClassifierVersion1ModelOutput

- (SNSoundClassifierVersion1ModelOutput)initWith_9:(id)a3 classLabel:(id)a4
{
  id v7;
  id v8;
  SNSoundClassifierVersion1ModelOutput *v9;
  SNSoundClassifierVersion1ModelOutput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNSoundClassifierVersion1ModelOutput;
  v9 = -[SNSoundClassifierVersion1ModelOutput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__9, a3);
    objc_storeStrong((id *)&v10->_classLabel, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA860);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("9")))
  {
    v6 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend__9(self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureValueWithDictionary:error:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("classLabel")))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundClassifierVersion1ModelOutput classLabel](self, "classLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "featureValueWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_7:
  return v10;
}

- (NSDictionary)_9
{
  return self->__9;
}

- (void)set_9:(id)a3
{
  objc_storeStrong((id *)&self->__9, a3);
}

- (NSString)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabel, 0);
  objc_storeStrong((id *)&self->__9, 0);
}

@end
