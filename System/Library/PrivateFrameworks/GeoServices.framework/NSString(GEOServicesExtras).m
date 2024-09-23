@implementation NSString(GEOServicesExtras)

- (GEOFormattedString)_geo_formattedString
{
  GEOFormattedString *v2;
  void *v3;

  v2 = objc_alloc_init(GEOFormattedString);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  -[GEOFormattedString setFormatStrings:](v2, "setFormatStrings:", v3);

  return v2;
}

@end
