@implementation AddCallControlService

- (void)callModelDidChange:(id)a3
{
  sub_100151424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100151408);
}

- (void)callStatusDidChange:(id)a3
{
  sub_100151424((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1001517B8);
}

@end
