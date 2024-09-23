@implementation DatabaseQueue

- (void)suspend:(id)a3
{
  sub_23C88EC0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23C88EBA8);
}

- (void)resume:(id)a3
{
  sub_23C88EC0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23C88EBD8);
}

@end
