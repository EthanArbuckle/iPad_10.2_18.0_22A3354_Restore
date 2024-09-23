@implementation NSDictionary(NullSupport)

- (void)setValueWithNilHandling:()NullSupport forKey:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "setValue:forKey:", v7, v6);
  if (!v8)

}

- (id)valueWithNilHandlingForKey:()NullSupport
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "valueForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 == v2)
    v3 = 0;
  else
    v3 = v1;
  v4 = v3;

  return v4;
}

@end
