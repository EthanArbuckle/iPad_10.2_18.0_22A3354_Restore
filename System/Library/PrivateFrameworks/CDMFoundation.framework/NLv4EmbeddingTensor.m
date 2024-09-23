@implementation NLv4EmbeddingTensor

- (NLv4EmbeddingTensor)init
{
  NLv4EmbeddingTensor *v2;
  NLv4EmbeddingTensor *v3;
  NSArray *values;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NLv4EmbeddingTensor;
  v2 = -[NLv4EmbeddingTensor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    values = v2->_values;
    v2->_values = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSArray copy](self->_values, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

  }
  return v4;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
