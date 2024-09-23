@implementation NSString(ShortDescription)

- (id)ad_shortDescription
{
  id v2;

  if ((unint64_t)objc_msgSend(a1, "length") < 9)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", 8);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
