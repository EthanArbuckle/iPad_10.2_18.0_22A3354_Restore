@implementation NPTMetadataEventTypeConverter

+ (id)getTypeAsString:(int)a3
{
  if (a3 > 0x1B)
    return 0;
  else
    return off_24C991500[a3];
}

@end
