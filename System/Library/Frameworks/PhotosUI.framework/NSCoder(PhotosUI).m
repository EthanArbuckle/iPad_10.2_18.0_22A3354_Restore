@implementation NSCoder(PhotosUI)

- (double)ph_decodeRectForKey:()PhotosUI
{
  id v4;
  double x;
  void *v6;
  CGRect v8;

  v4 = a3;
  objc_msgSend(a1, "decodeRectForKey:", v4);
  x = v8.origin.x;
  if (CGRectEqualToRect(v8, *MEMORY[0x24BDBF090]))
  {
    objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("{{inf, inf}, {0, 0}}")))
      x = *MEMORY[0x24BDBF070];

  }
  return x;
}

@end
