@implementation Embedder

- (void)warmup
{
  -[SNLPEmbedder warmup](self->_snlpEmbedder, "warmup");
}

- (Embedder)initWithSnlpEmbedder:(id)a3 andEmbeddingConfigItem:(id)a4
{
  id v7;
  id v8;
  Embedder *v9;
  Embedder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)Embedder;
  v9 = -[Embedder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snlpEmbedder, a3);
    objc_storeStrong((id *)&v10->_embeddingConfigItem, a4);
  }

  return v10;
}

- (SNLPEmbedder)snlpEmbedder
{
  return self->_snlpEmbedder;
}

- (CDMEmbeddingConfigItem)embeddingConfigItem
{
  return self->_embeddingConfigItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingConfigItem, 0);
  objc_storeStrong((id *)&self->_snlpEmbedder, 0);
}

@end
