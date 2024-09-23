@implementation NSXPCConnection(FPXPCSanitizer)

- (void)fp_annotateWithXPCSanitizer:()FPXPCSanitizer
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "fp_userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("FPXPCSanitizerKey"));

}

@end
