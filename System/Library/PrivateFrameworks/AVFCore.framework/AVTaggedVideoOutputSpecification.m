@implementation AVTaggedVideoOutputSpecification

- (AVTaggedVideoOutputSpecification)initWithTagCollections:(id)a3
{
  AVTaggedVideoOutputSpecification *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTaggedVideoOutputSpecification;
  v4 = -[AVTaggedVideoOutputSpecification init](&v6, sel_init);
  if (v4)
    v4->_realSpecification = -[AVVideoOutputSpecification initWithTagCollections:]([AVVideoOutputSpecification alloc], "initWithTagCollections:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTaggedVideoOutputSpecification;
  -[AVTaggedVideoOutputSpecification dealloc](&v3, sel_dealloc);
}

- (void)setOutputPixelBufferAttributes:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4
{
  -[AVVideoOutputSpecification setOutputPixelBufferAttributes:forTagCollection:](self->_realSpecification, "setOutputPixelBufferAttributes:forTagCollection:", a3, a4);
}

- (NSArray)preferredTagCollections
{
  return -[AVVideoOutputSpecification preferredTagCollections](self->_realSpecification, "preferredTagCollections");
}

- (NSDictionary)defaultPixelBufferAttributes
{
  return -[AVVideoOutputSpecification defaultPixelBufferAttributes](self->_realSpecification, "defaultPixelBufferAttributes");
}

- (void)setDefaultPixelBufferAttributes:(id)a3
{
  -[AVVideoOutputSpecification setDefaultPixelBufferAttributes:](self->_realSpecification, "setDefaultPixelBufferAttributes:", a3);
}

- (id)realSpecification
{
  return self->_realSpecification;
}

@end
