@implementation MADImageEmbeddingResult

- (MADImageEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8;
  MADImageEmbeddingResult *v9;
  MADEmbeddingResult *v10;
  MADEmbeddingResult *embedding;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MADImageEmbeddingResult;
  v9 = -[MADResult init](&v13, sel_init);
  if (v9)
  {
    v10 = -[MADEmbeddingResult initWithVersion:data:type:]([MADEmbeddingResult alloc], "initWithVersion:data:type:", a3, v8, a5);
    embedding = v9->_embedding;
    v9->_embedding = v10;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageEmbeddingResult)initWithCoder:(id)a3
{
  id v4;
  MADImageEmbeddingResult *v5;
  uint64_t v6;
  MADEmbeddingResult *embedding;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADImageEmbeddingResult;
  v5 = -[MADResult initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embedding"));
    v6 = objc_claimAutoreleasedReturnValue();
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADImageEmbeddingResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_embedding, CFSTR("embedding"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("embedding: %@>"), self->_embedding);
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
