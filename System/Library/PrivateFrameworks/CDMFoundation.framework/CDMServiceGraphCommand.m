@implementation CDMServiceGraphCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
}

- (CDMServiceGraphCommand)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDMServiceGraphCommand;
  return -[CDMBaseCommand initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDMServiceGraphCommand;
  -[CDMBaseCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)loggingRequestID
{
  return 0;
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (void)setDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceGraphName
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return &stru_24DCAE158;
}

@end
