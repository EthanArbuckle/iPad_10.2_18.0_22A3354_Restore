@implementation AVMetadataItemValueRequest

+ (AVMetadataItemValueRequest)metadataItemValueRequestWithMetadataItem:(id)a3
{
  return (AVMetadataItemValueRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMetadataItem:", a3);
}

- (AVMetadataItemValueRequest)initWithMetadataItem:(id)a3
{
  AVMetadataItemValueRequest *v4;
  AVMetadataItemValueRequestInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMetadataItemValueRequest;
  v4 = -[AVMetadataItemValueRequest init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVMetadataItemValueRequestInternal);
    v4->_valueRequest = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_valueRequest->weakReferenceToMetadataItem = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVMetadataItemValueRequestInternal *valueRequest;
  objc_super v4;

  valueRequest = self->_valueRequest;
  if (valueRequest)
  {

    CFRelease(self->_valueRequest);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMetadataItemValueRequest;
  -[AVMetadataItemValueRequest dealloc](&v4, sel_dealloc);
}

- (AVMetadataItem)metadataItem
{
  return (AVMetadataItem *)-[AVWeakReference referencedObject](self->_valueRequest->weakReferenceToMetadataItem, "referencedObject");
}

- (id)value
{
  return self->_valueRequest->value;
}

- (id)dataType
{
  return self->_valueRequest->dataType;
}

- (id)error
{
  return self->_valueRequest->error;
}

- (void)respondWithValue:(id)a3 dataType:(id)a4
{
  self->_valueRequest->value = objc_msgSend(a3, "copyWithZone:", -[AVMetadataItemValueRequest zone](self, "zone"));
  self->_valueRequest->dataType = (NSString *)objc_msgSend(a4, "copy");
  -[AVMetadataItem _valueRequestDidFinish](-[AVMetadataItemValueRequest metadataItem](self, "metadataItem"), "_valueRequestDidFinish");
}

- (void)respondWithValue:(id)value
{
  -[AVMetadataItemValueRequest respondWithValue:dataType:](self, "respondWithValue:dataType:", value, 0);
}

- (void)respondWithError:(NSError *)error
{
  self->_valueRequest->error = error;
  -[AVMetadataItem _valueRequestDidFinish](-[AVMetadataItemValueRequest metadataItem](self, "metadataItem"), "_valueRequestDidFinish");
}

@end
