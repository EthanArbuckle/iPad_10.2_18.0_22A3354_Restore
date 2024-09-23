@implementation VSJSAppError

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
