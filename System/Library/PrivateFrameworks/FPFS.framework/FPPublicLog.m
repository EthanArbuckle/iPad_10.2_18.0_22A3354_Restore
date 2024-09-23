@implementation FPPublicLog

- (FPPublicLog)initWithString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
  return self;
}

- (id)description
{
  return self->_string;
}

- (id)redactedDescription
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
