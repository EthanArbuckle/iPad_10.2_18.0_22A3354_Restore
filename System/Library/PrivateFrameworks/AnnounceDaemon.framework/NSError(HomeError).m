@implementation NSError(HomeError)

- (BOOL)isHomeError
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "code") != 1016 && objc_msgSend(a1, "code") != 1002)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == (void *)*MEMORY[0x1E0CF79E8];

  return v3;
}

@end
