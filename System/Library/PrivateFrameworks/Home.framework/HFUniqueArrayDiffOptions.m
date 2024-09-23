@implementation HFUniqueArrayDiffOptions

- (HFUniqueArrayDiffOptions)init
{
  HFUniqueArrayDiffOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFUniqueArrayDiffOptions;
  result = -[HFUniqueArrayDiffOptions init](&v3, sel_init);
  if (result)
    result->_allowMoves = 1;
  return result;
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (id)equalComparator
{
  return self->_equalComparator;
}

- (id)changeComparator
{
  return self->_changeComparator;
}

- (BOOL)allowMoves
{
  return self->_allowMoves;
}

- (void)setHashGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setEqualComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAllowMoves:(BOOL)a3
{
  self->_allowMoves = a3;
}

- (void)setChangeComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeComparator, 0);
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_equalComparator, 0);
}

@end
