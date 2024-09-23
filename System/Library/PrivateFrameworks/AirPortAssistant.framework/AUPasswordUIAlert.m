@implementation AUPasswordUIAlert

- (void)prepareToShow
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AUPasswordUIAlert;
  -[AUTextFieldUIAlert prepareToShow](&v9, sel_prepareToShow);
  v5 = (void *)objc_msgSend_textField(self, v3, v4);
  objc_msgSend_setAutocorrectionType_(v5, v6, 1);
  objc_msgSend_setEnablesReturnKeyAutomatically_(v5, v7, 1);
  objc_msgSend_setSecureTextEntry_(v5, v8, 1);
}

@end
