@implementation LNDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  id v3;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[LNDialog getResultWithCompletionHandler:] must be overridden"));
  __break(1u);
}

@end
