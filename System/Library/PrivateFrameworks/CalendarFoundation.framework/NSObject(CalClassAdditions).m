@implementation NSObject(CalClassAdditions)

- (id)CalClassName
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", class_getName(v0));
}

- (BOOL)isNull
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

- (void)performBlockOnMainThreadSynchronously:()CalClassAdditions
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

@end
