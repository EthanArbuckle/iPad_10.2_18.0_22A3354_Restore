@implementation _EARCombinedResult

- (NSArray)nBestStrings
{
  return self->_nBestStrings;
}

- (void)setNBestStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)nBestSourceIndexes
{
  return self->_nBestSourceIndexes;
}

- (void)setNBestSourceIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)originalRanks
{
  return self->_originalRanks;
}

- (void)setOriginalRanks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRanks, 0);
  objc_storeStrong((id *)&self->_nBestSourceIndexes, 0);
  objc_storeStrong((id *)&self->_nBestStrings, 0);
}

@end
