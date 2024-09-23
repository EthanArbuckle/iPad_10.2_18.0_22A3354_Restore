@implementation _EARSystemResult

- (NSArray)sausage
{
  return self->_sausage;
}

- (void)setSausage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)nBestIndexes
{
  return self->_nBestIndexes;
}

- (void)setNBestIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidences, 0);
  objc_storeStrong((id *)&self->_nBestIndexes, 0);
  objc_storeStrong((id *)&self->_sausage, 0);
}

@end
