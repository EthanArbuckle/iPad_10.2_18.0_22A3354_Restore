@implementation MTFWrappedPhoneme

- (NSString)name
{
  void *v2;
  MTFEPhoneme *v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[MTFWrappedPhoneme elem](self, "elem");
  return (NSString *)objc_msgSend(v2, "stringWithCString:encoding:", *(_QWORD *)(MEMORY[0x1E0DA8EB0] + 8 * v3->var9), 1);
}

@end
