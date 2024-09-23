@implementation HMDValueTransformerReversingAdapter

- (id)transformedValue:(id)a3
{
  return -[NSValueTransformer reverseTransformedValue:](self->super._transformer, "reverseTransformedValue:", a3);
}

- (id)reverseTransformedValue:(id)a3
{
  return -[NSValueTransformer transformedValue:](self->super._transformer, "transformedValue:", a3);
}

@end
