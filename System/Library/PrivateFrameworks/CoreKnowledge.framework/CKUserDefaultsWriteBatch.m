@implementation CKUserDefaultsWriteBatch

- (void)writeWithCompletionHandler:(id)a3
{
  sub_1A4903084((int)self, (int)a2, a3);
}

- (BOOL)writeAndReturnError:(id *)a3
{
  return sub_1A49044C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A49030C8);
}

@end
