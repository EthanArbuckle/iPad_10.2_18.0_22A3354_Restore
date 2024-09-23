@implementation BWSWFRProcessorControllerConfiguration

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWSWFRProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v2, sel_dealloc);
}

- (int)version
{
  return self->_version;
}

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

@end
