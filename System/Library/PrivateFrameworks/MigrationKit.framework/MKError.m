@implementation MKError

- (MKError)initWithDomain:(id)a3 code:(int64_t)a4 message:(id)a5
{
  id v8;
  MKError *v9;
  MKError *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MKError;
  v9 = -[MKError initWithDomain:code:userInfo:](&v12, sel_initWithDomain_code_userInfo_, a3, a4, 0);
  v10 = v9;
  if (v9)
    -[MKError setMessage:](v9, "setMessage:", v8);

  return v10;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
