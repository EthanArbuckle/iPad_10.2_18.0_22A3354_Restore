@implementation CKAtomBatchWriterOptions

- (CKAtomBatchWriterOptions)init
{
  CKAtomBatchWriterOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAtomBatchWriterOptions;
  result = -[CKAtomBatchWriterOptions init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_formatVersion = 3;
  return result;
}

- (unsigned)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(unsigned __int8)a3
{
  self->_formatVersion = a3;
}

- (BOOL)fileBacked
{
  return self->_fileBacked;
}

- (void)setFileBacked:(BOOL)a3
{
  self->_fileBacked = a3;
}

- (NSDictionary)underlyingWriterOptionsByClass
{
  return self->_underlyingWriterOptionsByClass;
}

- (void)setUnderlyingWriterOptionsByClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingWriterOptionsByClass, 0);
}

@end
