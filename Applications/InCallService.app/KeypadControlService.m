@implementation KeypadControlService

- (void)callModelDidChange:(id)a3
{
  sub_100151424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100198548);
}

- (void)callIsOnHoldDidChange:(id)a3
{
  sub_100151424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100198758);
}

@end
