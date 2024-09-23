@implementation SNSoundPrintKEmbeddingModelOutput

- (SNSoundPrintKEmbeddingModelOutput)initWithFixedLengthEmbedding:(id)a3 framewiseEmbedding:(id)a4
{
  id v7;
  id v8;
  SNSoundPrintKEmbeddingModelOutput *v9;
  SNSoundPrintKEmbeddingModelOutput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNSoundPrintKEmbeddingModelOutput;
  v9 = -[SNSoundPrintKEmbeddingModelOutput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fixedLengthEmbedding, a3);
    objc_storeStrong((id *)&v10->_framewiseEmbedding, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA9B0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("fixedLengthEmbedding")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintKEmbeddingModelOutput fixedLengthEmbedding](self, "fixedLengthEmbedding");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("framewiseEmbedding")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrintKEmbeddingModelOutput framewiseEmbedding](self, "framewiseEmbedding");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (MLMultiArray)fixedLengthEmbedding
{
  return self->_fixedLengthEmbedding;
}

- (void)setFixedLengthEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLengthEmbedding, a3);
}

- (MLMultiArray)framewiseEmbedding
{
  return self->_framewiseEmbedding;
}

- (void)setFramewiseEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_framewiseEmbedding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framewiseEmbedding, 0);
  objc_storeStrong((id *)&self->_fixedLengthEmbedding, 0);
}

@end
