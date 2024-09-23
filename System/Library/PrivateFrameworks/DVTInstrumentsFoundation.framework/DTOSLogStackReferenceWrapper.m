@implementation DTOSLogStackReferenceWrapper

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
