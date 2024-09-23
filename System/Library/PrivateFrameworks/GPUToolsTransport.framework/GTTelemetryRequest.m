@implementation GTTelemetryRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryRequest)init
{
  GTTelemetryRequest *v2;
  GTTelemetryRequest *v3;
  unsigned int v4;
  GTTelemetryRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTTelemetryRequest;
  v2 = -[GTTelemetryRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr((unsigned int *)&globalRequestID_0);
    while (__stlxr(v4 + 1, (unsigned int *)&globalRequestID_0));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (id)initNoRequestID
{
  GTTelemetryRequest *v2;
  GTTelemetryRequest *v3;
  GTTelemetryRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequest;
  v2 = -[GTTelemetryRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (GTTelemetryRequest)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryRequest *v5;
  GTTelemetryRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTTelemetryRequest;
  v5 = -[GTTelemetryRequest init](&v8, sel_init);
  if (v5)
  {
    v5->_requestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_requestID, CFSTR("requestID"));
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

@end
