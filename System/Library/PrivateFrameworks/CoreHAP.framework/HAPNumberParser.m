@implementation HAPNumberParser

- (HAPNumberParser)initWithTLVData:(id)a3
{
  id v4;
  HAPNumberParser *v5;
  HAPNumberParser *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HAPNumberParser;
  v5 = -[HAPNumberParser init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_msgSend(v4, "getBytes:length:", &v5->_decodedNumber, 8);

  return v6;
}

- (unint64_t)decodedNumber
{
  return self->_decodedNumber;
}

@end
