@implementation AMSPaymentSheetSymbolAssetConfiguration

- (AMSPaymentSheetSymbolAssetConfiguration)initWithName:(id)a3 accessibilityText:(id)a4 scale:(int64_t)a5
{
  id v8;
  id v9;
  AMSPaymentSheetSymbolAssetConfiguration *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *accessibilityText;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSPaymentSheetSymbolAssetConfiguration;
  v10 = -[AMSPaymentSheetSymbolAssetConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    accessibilityText = v10->_accessibilityText;
    v10->_accessibilityText = (NSString *)v13;

    v10->_scale = a5;
  }

  return v10;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
