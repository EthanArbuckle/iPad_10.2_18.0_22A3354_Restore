@implementation MTLCaptureDescriptor

- (MTLCaptureDescriptor)init
{
  MTLCaptureDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureDescriptor;
  result = -[MTLCaptureDescriptor init](&v3, sel_init);
  if (result)
    result->_destination = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureDescriptor;
  -[MTLCaptureDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTLCaptureDescriptor *v4;

  v4 = objc_alloc_init(MTLCaptureDescriptor);
  -[MTLCaptureDescriptor setCaptureObject:](v4, "setCaptureObject:", self->_captureObject);
  -[MTLCaptureDescriptor setDestination:](v4, "setDestination:", self->_destination);
  -[MTLCaptureDescriptor setOutputURL:](v4, "setOutputURL:", self->_outputURL);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  BOOL result;
  id captureObject;
  NSURL *outputURL;

  if (self == a3)
    return 1;
  v5 = objc_opt_class();
  result = 0;
  if (v5 == objc_opt_class())
  {
    captureObject = self->_captureObject;
    if ((captureObject == *((id *)a3 + 1) || objc_msgSend(captureObject, "isEqual:"))
      && self->_destination == *((_QWORD *)a3 + 2))
    {
      outputURL = self->_outputURL;
      if (outputURL == *((NSURL **)a3 + 3) || (-[NSURL isEqual:](outputURL, "isEqual:") & 1) != 0)
        return 1;
    }
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSURL *outputURL;
  int64_t v5;

  v3 = objc_msgSend(self->_captureObject, "hash");
  outputURL = self->_outputURL;
  v5 = self->_destination | v3;
  return v5 | -[NSURL hash](outputURL, "hash");
}

- (id)captureObject
{
  return self->_captureObject;
}

- (void)setCaptureObject:(id)captureObject
{
  objc_setProperty_nonatomic(self, a2, captureObject, 8);
}

- (MTLCaptureDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(MTLCaptureDestination)destination
{
  self->_destination = destination;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(NSURL *)outputURL
{
  objc_setProperty_nonatomic_copy(self, a2, outputURL, 24);
}

@end
