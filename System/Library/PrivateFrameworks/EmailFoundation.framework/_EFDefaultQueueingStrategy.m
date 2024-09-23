@implementation _EFDefaultQueueingStrategy

- (NSString)descriptionType
{
  return (NSString *)CFSTR("default");
}

- (void)enqueueObject:(id)a3 replaceIfExists:(BOOL)a4 buffer:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = a5;
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "removeObject:", v9);
  objc_msgSend(v8, "addObject:", v9);

}

- (void)dequeueObject:(id)a3 buffer:(id)a4
{
  objc_msgSend(a4, "removeObject:", a3);
}

@end
