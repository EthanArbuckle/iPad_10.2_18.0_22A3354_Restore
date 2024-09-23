@implementation _COMeshControllerPing

- (_COMeshControllerPing)initWithTimeout:(double)a3 listeningPort:(int)a4
{
  _COMeshControllerPing *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_COMeshControllerPing;
  result = -[COMeshCommand init](&v7, sel_init);
  if (result)
  {
    result->_responseTimeout = a3;
    result->_listeningPort = a4;
  }
  return result;
}

- (_COMeshControllerPing)initWithTimeout:(double)a3
{
  return -[_COMeshControllerPing initWithTimeout:listeningPort:](self, "initWithTimeout:listeningPort:", 0, a3);
}

- (_COMeshControllerPing)initWithCoder:(id)a3
{
  id v4;
  _COMeshControllerPing *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_COMeshControllerPing;
  v5 = -[COMeshCommand initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_listeningPort = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("listeningPort"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_COMeshControllerPing;
  -[COMeshCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_listeningPort >= 1)
    objc_msgSend(v4, "encodeInt32:forKey:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (int)listeningPort
{
  return self->_listeningPort;
}

@end
