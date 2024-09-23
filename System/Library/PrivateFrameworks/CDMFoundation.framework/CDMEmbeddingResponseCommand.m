@implementation CDMEmbeddingResponseCommand

- (CDMEmbeddingResponseCommand)initWithTokenChain:(id)a3 embeddingTensor:(id)a4 numTokens:(unint64_t)a5 numLayers:(unint64_t)a6 embeddingDim:(unint64_t)a7
{
  id v12;
  id v13;
  CDMEmbeddingResponseCommand *v14;
  uint64_t v15;
  CDMTokenChain *tokenChain;
  uint64_t v17;
  NLv4EmbeddingTensor *embeddingTensor;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CDMEmbeddingResponseCommand;
  v14 = -[CDMBaseCommand init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    tokenChain = v14->_tokenChain;
    v14->_tokenChain = (CDMTokenChain *)v15;

    v17 = objc_msgSend(v13, "copy");
    embeddingTensor = v14->_embeddingTensor;
    v14->_embeddingTensor = (NLv4EmbeddingTensor *)v17;

    v14->_numTokens = a5;
    v14->_numLayers = a6;
    v14->_embeddingDim = a7;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  -[NLv4EmbeddingTensor values](self->_embeddingTensor, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  v10[0] = CFSTR("embeddings");
  v10[1] = CFSTR("numTokens");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numTokens);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("numLayers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numLayers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("embeddingDim");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_embeddingDim);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (CDMTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (unint64_t)numTokens
{
  return self->_numTokens;
}

- (unint64_t)numLayers
{
  return self->_numLayers;
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

@end
