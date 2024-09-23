@implementation MTFWrappedWord

- (NSString)fText
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", -[MTFWrappedWord elem](self, "elem") + 200, 1);
}

- (NSString)fResolvedPOS
{
  return (NSString *)&stru_1E936B8A8;
}

- (NSString)fGroupPOS
{
  void *v2;
  MTFEWord *v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[MTFWrappedWord elem](self, "elem");
  return (NSString *)objc_msgSend(v2, "stringWithCString:encoding:", *(_QWORD *)(MEMORY[0x1E0DA8E90] + 8 * v3->var13), 1);
}

@end
