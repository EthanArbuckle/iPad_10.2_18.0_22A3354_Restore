@implementation AAMobileMeOfferResponse

- (NSNumber)identifier
{
  return (NSNumber *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("identifier"));
}

- (NSString)title
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("title"));
}

- (NSString)message
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("message"));
}

- (NSString)classicTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("classicTitle"));
}

- (NSString)classicMessage
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("classicMessage"));
}

@end
