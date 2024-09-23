@implementation CPLStagingScopeChange

- (CPLScopeChange)stagedScopeChange
{
  return self->_stagedScopeChange;
}

- (void)setStagedScopeChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSData)stagedTransportScope
{
  return self->_stagedTransportScope;
}

- (void)setStagedTransportScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)stagedScopeFlags
{
  return self->_stagedScopeFlags;
}

- (void)setStagedScopeFlags:(int64_t)a3
{
  self->_stagedScopeFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedTransportScope, 0);
  objc_storeStrong((id *)&self->_stagedScopeChange, 0);
}

@end
