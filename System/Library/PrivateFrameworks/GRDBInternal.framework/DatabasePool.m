@implementation DatabasePool

- (void)suspend:(id)a3
{
  sub_23C8CD5EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23C8CD5CC);
}

- (void)resume:(id)a3
{
  sub_23C8CD5EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23C8CD5DC);
}

@end
