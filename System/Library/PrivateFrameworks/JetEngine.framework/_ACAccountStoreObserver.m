@implementation _ACAccountStoreObserver

- (void)accountCookiesDidChange:(id)a3
{
  sub_19CFD2078((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)accountStoreDidChange:(id)a3
{
  sub_19CFD2078((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 0);
}

@end
