@implementation NSCoder(BCSNSCoderExtras)

- (id)_bcs_strictlyDecodeObjectOfClass:()BCSNSCoderExtras forKey:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "decodeObjectOfClass:forKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
