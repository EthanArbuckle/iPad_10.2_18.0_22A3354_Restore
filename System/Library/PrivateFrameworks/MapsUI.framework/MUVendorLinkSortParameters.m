@implementation MUVendorLinkSortParameters

- (NSArray)preferredOrdering
{
  return self->_preferredOrdering;
}

- (void)setPreferredOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)winningAdamId
{
  return self->_winningAdamId;
}

- (void)setWinningAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)sortAlphabetically
{
  return self->_sortAlphabetically;
}

- (void)setSortAlphabetically:(BOOL)a3
{
  self->_sortAlphabetically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winningAdamId, 0);
  objc_storeStrong((id *)&self->_preferredOrdering, 0);
}

@end
