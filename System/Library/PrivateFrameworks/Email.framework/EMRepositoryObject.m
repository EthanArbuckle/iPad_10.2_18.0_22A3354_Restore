@implementation EMRepositoryObject

- (void)setRepository:(id)a3
{
  objc_storeStrong((id *)&self->_repository, a3);
}

- (EMRepository)repository
{
  return self->_repository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
