@implementation ICActivityStreamDigest(UI)

- (id)initWithObject:()UI
{
  void *v3;
  id v4;
  id v5;
  id v7;

  v7 = 0;
  v3 = (void *)objc_msgSend(a1, "objc_initWithObject:error:", a3, &v7);
  v4 = v7;
  v5 = v3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "digest != ((void *)0)", "-[ICActivityStreamDigest(UI) initWithObject:]", 1, 0, CFSTR("Failed to init ActivityStreamDigest: %@"), v4);

  return v5;
}

@end
