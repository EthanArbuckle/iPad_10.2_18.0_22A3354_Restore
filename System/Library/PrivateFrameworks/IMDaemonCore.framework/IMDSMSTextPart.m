@implementation IMDSMSTextPart

- (IMDSMSTextPart)initWithContentLocation:(id)a3
{
  id v4;
  IMDSMSTextPart *v5;
  uint64_t v6;
  NSString *contentLocation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDSMSTextPart;
  v5 = -[IMDSMSTextPart init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = (NSString *)v6;

  }
  return v5;
}

- (void)appendText:(id)a3
{
  NSMutableString *text;
  NSMutableString *v5;
  NSMutableString *v6;

  text = self->_text;
  if (text)
  {
    -[NSMutableString appendString:](text, "appendString:", a3);
  }
  else
  {
    v5 = (NSMutableString *)objc_msgSend(a3, "mutableCopy");
    v6 = self->_text;
    self->_text = v5;

  }
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (NSString)text
{
  return &self->_text->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end
