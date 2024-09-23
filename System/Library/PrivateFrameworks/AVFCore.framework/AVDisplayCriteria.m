@implementation AVDisplayCriteria

- (AVDisplayCriteria)initWithRefreshRate:(float)a3 videoDynamicRange:(int)a4
{
  AVDisplayCriteria *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVDisplayCriteria;
  result = -[AVDisplayCriteria init](&v7, sel_init);
  if (result)
  {
    result->_videoDynamicRange = a4;
    result->_refreshRate = a3;
  }
  return result;
}

- (AVDisplayCriteria)initWithRefreshRate:(float)refreshRate formatDescription:(CMFormatDescriptionRef)formatDescription
{
  AVDisplayCriteria *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVDisplayCriteria;
  v5 = -[AVDisplayCriteria init](&v7, sel_init);
  if (v5)
  {
    v5->_videoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
    v5->_refreshRate = refreshRate;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDisplayCriteria;
  -[AVDisplayCriteria dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int videoDynamicRange;
  float refreshRate;
  float v7;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  videoDynamicRange = self->_videoDynamicRange;
  if (videoDynamicRange != objc_msgSend(a3, "videoDynamicRange"))
    return 0;
  refreshRate = self->_refreshRate;
  objc_msgSend(a3, "refreshRate");
  return refreshRate == v7;
}

- (float)refreshRate
{
  return self->_refreshRate;
}

- (int)videoDynamicRange
{
  return self->_videoDynamicRange;
}

@end
