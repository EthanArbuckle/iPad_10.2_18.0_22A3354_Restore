@implementation PHPersistentChangeFetchRequest

- (PHPersistentChangeToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)maximumChangeThreshold
{
  return self->_maximumChangeThreshold;
}

- (void)setMaximumChangeThreshold:(unint64_t)a3
{
  self->_maximumChangeThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
