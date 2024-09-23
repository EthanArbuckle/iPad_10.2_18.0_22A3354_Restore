@implementation HSContainersResponse

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
}

@end
