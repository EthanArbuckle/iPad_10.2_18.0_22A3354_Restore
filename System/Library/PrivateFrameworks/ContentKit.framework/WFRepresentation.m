@implementation WFRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)wfName
{
  return 0;
}

- (WFType)wfType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WFRepresentation copyWithName:zone:](self, "copyWithName:zone:", 0, a3);
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  return 0;
}

- (id)copyWithName:(id)a3
{
  return -[WFRepresentation copyWithName:zone:](self, "copyWithName:zone:", a3, 0);
}

- (BOOL)isEncodable
{
  return 0;
}

@end
