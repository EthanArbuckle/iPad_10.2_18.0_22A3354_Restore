@implementation MPCFutureInvalidationToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCFutureInvalidationToken %p %@>"), self, self->_future);
}

- (MPCFuture)future
{
  return self->_future;
}

@end
