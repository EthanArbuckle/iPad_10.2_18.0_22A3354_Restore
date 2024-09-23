@implementation GTCaptureRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureRequest)init
{
  GTCaptureRequest *v2;
  GTCaptureRequest *v3;
  unsigned int v4;
  GTCaptureRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTCaptureRequest;
  v2 = -[GTCaptureRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr((unsigned int *)&g_requestID);
    while (__stlxr(v4 + 1, (unsigned int *)&g_requestID));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (GTCaptureRequest)initWithRequestID:(unint64_t)a3
{
  GTCaptureRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTCaptureRequest;
  result = -[GTCaptureRequest init](&v5, sel_init);
  if (result)
    result->_requestID = a3;
  return result;
}

- (GTCaptureRequest)initWithCoder:(id)a3
{
  id v4;
  GTCaptureRequest *v5;
  GTCaptureRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureRequest;
  v5 = -[GTCaptureRequest init](&v8, sel_init);
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

@end
