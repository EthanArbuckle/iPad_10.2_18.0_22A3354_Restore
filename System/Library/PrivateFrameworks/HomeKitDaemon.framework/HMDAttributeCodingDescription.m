@implementation HMDAttributeCodingDescription

- (NSAttributeDescription)attribute
{
  if (self)
  {
    -[HMDPropertyCodingDescription property](self, "property");
    self = (HMDAttributeCodingDescription *)objc_claimAutoreleasedReturnValue();
  }
  return (NSAttributeDescription *)self;
}

- (HMDValueTransformer)transformer
{
  return self->_transformer;
}

- (BOOL)shouldInline
{
  return self->_shouldInline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
}

@end
