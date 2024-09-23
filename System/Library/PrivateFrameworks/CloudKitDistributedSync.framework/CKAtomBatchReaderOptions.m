@implementation CKAtomBatchReaderOptions

- (NSDictionary)underlyingReaderOptionsByClass
{
  return self->_underlyingReaderOptionsByClass;
}

- (void)setUnderlyingReaderOptionsByClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingReaderOptionsByClass, 0);
}

@end
