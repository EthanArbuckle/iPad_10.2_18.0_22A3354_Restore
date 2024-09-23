@implementation AXMSpeechOutputAction

- (AXMSpeechOutputAction)initWithText:(id)a3
{
  id v5;
  id *v6;
  AXMSpeechOutputAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMSpeechOutputAction;
  v6 = -[AXMOutputAction _initWithHandle:](&v9, sel__initWithHandle_, 0);
  v7 = (AXMSpeechOutputAction *)v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
