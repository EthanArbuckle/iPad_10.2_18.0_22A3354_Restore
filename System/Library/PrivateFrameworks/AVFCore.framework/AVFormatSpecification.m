@implementation AVFormatSpecification

- (AVFormatSpecification)initWithOutputSettings:(id)a3 sourceFormatDescription:(opaqueCMFormatDescription *)a4
{
  AVFormatSpecification *v6;
  CFTypeRef v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVFormatSpecification;
  v6 = -[AVFormatSpecification init](&v9, sel_init);
  if (v6)
  {
    v6->_outputSettings = (AVOutputSettings *)a3;
    if (a4)
    {
      v7 = CFRetain(a4);
      v6->_sourceFormatDescription = (opaqueCMFormatDescription *)CFMakeCollectable(v7);
    }
  }
  return v6;
}

+ (id)formatSpecificationWithOutputSettings:(id)a3 sourceFormatDescription:(opaqueCMFormatDescription *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputSettings:sourceFormatDescription:", a3, a4);
}

- (void)dealloc
{
  opaqueCMFormatDescription *sourceFormatDescription;
  objc_super v4;

  sourceFormatDescription = self->_sourceFormatDescription;
  if (sourceFormatDescription)
    CFRelease(sourceFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)AVFormatSpecification;
  -[AVFormatSpecification dealloc](&v4, sel_dealloc);
}

- (id)outputSettings
{
  return self->_outputSettings;
}

- (opaqueCMFormatDescription)sourceFormatDescription
{
  return self->_sourceFormatDescription;
}

@end
