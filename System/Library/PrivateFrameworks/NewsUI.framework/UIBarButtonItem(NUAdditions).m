@implementation UIBarButtonItem(NUAdditions)

- (id)nu_view
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(a1, "valueForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
