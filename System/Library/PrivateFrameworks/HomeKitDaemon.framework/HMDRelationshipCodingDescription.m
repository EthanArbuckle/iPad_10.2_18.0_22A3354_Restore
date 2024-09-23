@implementation HMDRelationshipCodingDescription

- (NSRelationshipDescription)relationship
{
  if (self)
  {
    -[HMDPropertyCodingDescription property](self, "property");
    self = (HMDRelationshipCodingDescription *)objc_claimAutoreleasedReturnValue();
  }
  return (NSRelationshipDescription *)self;
}

- (BOOL)isParentChild
{
  return self->_parentChild;
}

- (BOOL)isReference
{
  return !self->_parentChild;
}

@end
