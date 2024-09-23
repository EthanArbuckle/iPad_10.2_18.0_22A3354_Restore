@implementation SNAudioQualityModelOutput

- (SNAudioQualityModelOutput)initWithFinal_output:(id)a3 classLabel:(id)a4
{
  id v7;
  id v8;
  SNAudioQualityModelOutput *v9;
  SNAudioQualityModelOutput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioQualityModelOutput;
  v9 = -[SNAudioQualityModelOutput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_final_output, a3);
    objc_storeStrong((id *)&v10->_classLabel, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DAA40);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("final_output")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNAudioQualityModelOutput final_output](self, "final_output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureValueWithDictionary:error:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("classLabel")))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x1E0C9E918];
    -[SNAudioQualityModelOutput classLabel](self, "classLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureValueWithString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

LABEL_7:
  return v9;
}

- (NSDictionary)final_output
{
  return self->_final_output;
}

- (void)setFinal_output:(id)a3
{
  objc_storeStrong((id *)&self->_final_output, a3);
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
  objc_storeStrong((id *)&self->_final_output, 0);
}

@end
