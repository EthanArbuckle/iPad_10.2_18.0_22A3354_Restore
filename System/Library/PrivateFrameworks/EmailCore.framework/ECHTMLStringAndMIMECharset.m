@implementation ECHTMLStringAndMIMECharset

- (ECHTMLStringAndMIMECharset)initWithString:(id)a3 charset:(id)a4
{
  id v6;
  id v7;
  ECHTMLStringAndMIMECharset *v8;
  uint64_t v9;
  NSString *string;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ECHTMLStringAndMIMECharset;
  v8 = -[ECHTMLStringAndMIMECharset init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    objc_storeStrong((id *)&v8->_charset, a4);
  }

  return v8;
}

- (NSString)string
{
  return self->_string;
}

- (ECMIMECharset)charset
{
  return self->_charset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charset, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
