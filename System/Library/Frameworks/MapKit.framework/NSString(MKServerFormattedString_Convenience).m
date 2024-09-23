@implementation NSString(MKServerFormattedString_Convenience)

- (MKServerFormattedString)mkServerFormattedString
{
  void *v2;
  MKServerFormattedString *v3;
  MKServerFormattedStringParameters *v4;
  MKServerFormattedString *v5;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "_geo_serverFormattedString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = [MKServerFormattedString alloc];
    v4 = objc_alloc_init(MKServerFormattedStringParameters);
    v5 = -[MKServerFormattedString initWithGeoServerString:parameters:](v3, "initWithGeoServerString:parameters:", v2, v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
