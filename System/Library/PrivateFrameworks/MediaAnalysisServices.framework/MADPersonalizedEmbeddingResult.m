@implementation MADPersonalizedEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonalizedEmbeddingResult)initWithEmbedding:(id)a3 hiddenLayer:(id)a4 pooledEmbedding:(id)a5 personalized:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  MADPersonalizedEmbeddingResult *v14;
  MADPersonalizedEmbeddingResult *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADPersonalizedEmbeddingResult;
  v14 = -[MADPersonalizedEmbeddingResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_embedding, a3);
    objc_storeStrong((id *)&v15->_hiddenLayer, a4);
    objc_storeStrong((id *)&v15->_pooledEmbedding, a5);
    v15->_personalized = a6;
  }

  return v15;
}

- (MADPersonalizedEmbeddingResult)initWithCoder:(id)a3
{
  id v4;
  MADPersonalizedEmbeddingResult *v5;
  uint64_t v6;
  MADEmbeddingResult *embedding;
  uint64_t v8;
  MADEmbeddingResult *hiddenLayer;
  uint64_t v10;
  MADEmbeddingResult *pooledEmbedding;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADPersonalizedEmbeddingResult;
  v5 = -[MADMultiModalResult initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Embedding"));
    v6 = objc_claimAutoreleasedReturnValue();
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HiddenLayer"));
    v8 = objc_claimAutoreleasedReturnValue();
    hiddenLayer = v5->_hiddenLayer;
    v5->_hiddenLayer = (MADEmbeddingResult *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PooledEmbedding"));
    v10 = objc_claimAutoreleasedReturnValue();
    pooledEmbedding = v5->_pooledEmbedding;
    v5->_pooledEmbedding = (MADEmbeddingResult *)v10;

    v5->_personalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Personalized"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADPersonalizedEmbeddingResult;
  v4 = a3;
  -[MADMultiModalResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_embedding, CFSTR("Embedding"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_hiddenLayer, CFSTR("HiddenLayer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pooledEmbedding, CFSTR("PooledEmbedding"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_personalized, CFSTR("Personalized"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("personalized: %d, "), self->_personalized);
  objc_msgSend(v3, "appendFormat:", CFSTR("embedding: %@, "), self->_embedding);
  objc_msgSend(v3, "appendFormat:", CFSTR("hiddenLayer: %@, "), self->_hiddenLayer);
  objc_msgSend(v3, "appendFormat:", CFSTR("pooledEmbedding: %@>"), self->_pooledEmbedding);
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (MADEmbeddingResult)hiddenLayer
{
  return self->_hiddenLayer;
}

- (MADEmbeddingResult)pooledEmbedding
{
  return self->_pooledEmbedding;
}

- (BOOL)personalized
{
  return self->_personalized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pooledEmbedding, 0);
  objc_storeStrong((id *)&self->_hiddenLayer, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
