@implementation _GPURawCounterSourceGroup

- (_GPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3
{
  _GPURawCounterSourceGroup *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GPURawCounterSourceGroup;
  result = -[_GPURawCounterSourceGroup init](&v5, sel_init);
  if (result)
  {
    result->_acceleratorPort = a3;
    if (!a3)
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  io_object_t acceleratorPort;
  objc_super v4;

  acceleratorPort = self->_acceleratorPort;
  if (acceleratorPort)
  {
    IOObjectRelease(acceleratorPort);
    self->_acceleratorPort = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_GPURawCounterSourceGroup;
  -[_GPURawCounterSourceGroup dealloc](&v4, sel_dealloc);
}

- (unint64_t)sampleMarker
{
  -[_GPURawCounterSourceGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)startSampling
{
  -[_GPURawCounterSourceGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)stopSampling
{
  -[_GPURawCounterSourceGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)subDivideCounterList:(id)a3 withOptions:(id)a4
{
  -[_GPURawCounterSourceGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)sourceList
{
  return self->_sourceList;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)features
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

@end
