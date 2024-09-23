@implementation XPCConnectionManager

- (void)installProfileWithData:(NSData *)a3 completionHandler:(id)a4
{
  sub_22DF7AF00((uint64_t)self, (int)a2, a3, a4);
}

- (void)installedProfilesWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  swift_retain();
  sub_22DFA8D9C((uint64_t)&unk_255DDA098, v5);
}

- (void)removeProfileWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  sub_22DF7AF00((uint64_t)self, (int)a2, a3, a4);
}

@end
