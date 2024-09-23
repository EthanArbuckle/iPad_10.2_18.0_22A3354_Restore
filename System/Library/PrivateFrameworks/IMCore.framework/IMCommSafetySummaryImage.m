@implementation IMCommSafetySummaryImage

- (IMCommSafetySummaryImage)initWithIdentifier:(id)a3 imageData:(id)a4
{
  NSData *v6;
  id v7;
  IMCommSafetySummaryImage *v8;
  uint64_t v9;
  NSString *identifier;
  NSData *imageData;
  objc_super v13;

  v6 = (NSData *)a4;
  v13.receiver = self;
  v13.super_class = (Class)IMCommSafetySummaryImage;
  v7 = a3;
  v8 = -[IMCommSafetySummaryImage init](&v13, sel_init);
  v9 = objc_msgSend(v7, "copy", v13.receiver, v13.super_class);

  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  imageData = v8->_imageData;
  v8->_imageData = v6;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
