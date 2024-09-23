@implementation PHPersistentChangeFetchOptions

- (unint64_t)maximumChangeThreshold
{
  return self->_maximumChangeThreshold;
}

- (void)setMaximumChangeThreshold:(unint64_t)a3
{
  self->_maximumChangeThreshold = a3;
}

- (BOOL)excludesPrivateChanges
{
  return self->_excludesPrivateChanges;
}

- (void)setExcludesPrivateChanges:(BOOL)a3
{
  self->_excludesPrivateChanges = a3;
}

@end
