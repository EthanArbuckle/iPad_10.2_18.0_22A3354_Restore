@implementation CSUTokenEmbedding

- (MLMultiArray)embedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEmbedding:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
