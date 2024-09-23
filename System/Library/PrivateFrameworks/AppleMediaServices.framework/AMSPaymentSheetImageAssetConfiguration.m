@implementation AMSPaymentSheetImageAssetConfiguration

- (AMSPaymentSheetImageAssetConfiguration)initWithFilename:(id)a3 size:(CGSize)a4 type:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  AMSPaymentSheetImageAssetConfiguration *v10;
  uint64_t v11;
  NSString *filename;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSPaymentSheetImageAssetConfiguration;
  v10 = -[AMSPaymentSheetImageAssetConfiguration init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    filename = v10->_filename;
    v10->_filename = (NSString *)v11;

    v10->_size.width = width;
    v10->_size.height = height;
    v10->_type = a5;
  }

  return v10;
}

- (NSString)fileExtension
{
  if (-[AMSPaymentSheetImageAssetConfiguration type](self, "type") == 1)
    return (NSString *)CFSTR("pdf");
  else
    return (NSString *)CFSTR("tiff");
}

- (NSString)filename
{
  return self->_filename;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
