@implementation _NUVideoExportResult

- (NSString)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
}

@end
