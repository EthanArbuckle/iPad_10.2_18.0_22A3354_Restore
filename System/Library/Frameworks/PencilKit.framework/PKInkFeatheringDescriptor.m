@implementation PKInkFeatheringDescriptor

- (void)setStartCapTime:(double)a3
{
  self->_startCapTime = a3;
}

- (void)setStartCapFade:(double)a3
{
  self->_startCapFade = a3;
}

- (void)setEndCapTime:(double)a3
{
  self->_endCapTime = a3;
}

- (void)setEndCapFade:(double)a3
{
  self->_endCapFade = a3;
}

+ (id)descriptorWithStartCapTime:(double)a3 startCapFade:(double)a4 endCapTime:(double)a5 endCapFade:(double)a6
{
  PKInkFeatheringDescriptor *v10;

  v10 = objc_alloc_init(PKInkFeatheringDescriptor);
  -[PKInkFeatheringDescriptor setStartCapTime:](v10, "setStartCapTime:", a3);
  -[PKInkFeatheringDescriptor setStartCapFade:](v10, "setStartCapFade:", a4);
  -[PKInkFeatheringDescriptor setEndCapTime:](v10, "setEndCapTime:", a5);
  -[PKInkFeatheringDescriptor setEndCapFade:](v10, "setEndCapFade:", a6);
  return v10;
}

- (PKInkFeatheringDescriptor)initWithStartCapTime:(double)a3 startCapDistance:(double)a4 startCapFade:(double)a5 startCapShrink:(double)a6 endCapTime:(double)a7 endCapDistance:(double)a8 endCapFade:(double)a9 endCapShrink:(double)a10
{
  PKInkFeatheringDescriptor *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKInkFeatheringDescriptor;
  result = -[PKInkFeatheringDescriptor init](&v19, sel_init);
  if (result)
  {
    result->_startCapTime = a3;
    result->_startCapDistance = a4;
    result->_startCapFade = a5;
    result->_startCapShrink = a6;
    result->_endCapTime = a7;
    result->_endCapDistance = a8;
    result->_endCapFade = a9;
    result->_endCapShrink = a10;
  }
  return result;
}

- (id)mutableCopy
{
  return -[PKInkFeatheringDescriptor initWithStartCapTime:startCapDistance:startCapFade:startCapShrink:endCapTime:endCapDistance:endCapFade:endCapShrink:]([PKInkFeatheringDescriptor alloc], "initWithStartCapTime:startCapDistance:startCapFade:startCapShrink:endCapTime:endCapDistance:endCapFade:endCapShrink:", self->_startCapTime, self->_startCapDistance, self->_startCapFade, self->_startCapShrink, self->_endCapTime, self->_endCapDistance, self->_endCapFade, self->_endCapShrink);
}

- (double)startCapTime
{
  return self->_startCapTime;
}

- (double)startCapDistance
{
  return self->_startCapDistance;
}

- (void)setStartCapDistance:(double)a3
{
  self->_startCapDistance = a3;
}

- (double)startCapFade
{
  return self->_startCapFade;
}

- (double)startCapShrink
{
  return self->_startCapShrink;
}

- (void)setStartCapShrink:(double)a3
{
  self->_startCapShrink = a3;
}

- (double)endCapTime
{
  return self->_endCapTime;
}

- (double)endCapDistance
{
  return self->_endCapDistance;
}

- (void)setEndCapDistance:(double)a3
{
  self->_endCapDistance = a3;
}

- (double)endCapFade
{
  return self->_endCapFade;
}

- (double)endCapShrink
{
  return self->_endCapShrink;
}

- (void)setEndCapShrink:(double)a3
{
  self->_endCapShrink = a3;
}

@end
