@implementation _HMFCFHTTPMessage

+ (id)dateFormatter
{
  if (qword_1ED013118 != -1)
    dispatch_once(&qword_1ED013118, &__block_literal_global_4);
  return (id)_MergedGlobals_57;
}

+ (id)requestWithMethod:(id)a3 url:(id)a4 protocolVersion:(int64_t)a5
{
  const __CFAllocator *v8;
  const __CFURL *v9;
  __CFString *v10;
  const __CFString *v11;
  CFHTTPMessageRef Request;
  void *v13;

  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = (const __CFURL *)a4;
  v10 = (__CFString *)a3;
  v11 = (const __CFString *)HMFHTTPProtocolVersionString(a5);
  Request = CFHTTPMessageCreateRequest(v8, v10, v9, v11);

  if (Request)
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageRef:", Request);
    CFRelease(Request);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)responseWithStatusCode:(int64_t)a3 statusDescription:(id)a4 protocolVersion:(int64_t)a5
{
  const __CFAllocator *v8;
  __CFString *v9;
  const __CFString *v10;
  CFHTTPMessageRef Response;
  void *v12;

  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = (__CFString *)a4;
  v10 = (const __CFString *)HMFHTTPProtocolVersionString(a5);
  Response = CFHTTPMessageCreateResponse(v8, a3, v9, v10);

  if (Response)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageRef:", Response);
    CFRelease(Response);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (_HMFCFHTTPMessage)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMFCFHTTPMessage)initWithMessageRef:(__CFHTTPMessage *)a3
{
  _HMFCFHTTPMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMFCFHTTPMessage;
  v4 = -[_HMFCFHTTPMessage init](&v6, sel_init);
  if (v4)
    v4->_message = (__CFHTTPMessage *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  __CFHTTPMessage *message;
  objc_super v4;

  message = self->_message;
  if (message)
    CFRelease(message);
  v4.receiver = self;
  v4.super_class = (Class)_HMFCFHTTPMessage;
  -[_HMFCFHTTPMessage dealloc](&v4, sel_dealloc);
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)CFHTTPMessageCopyAllHeaderFields(-[_HMFCFHTTPMessage message](self, "message"));
}

- (id)valueForHeaderField:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = (__CFString *)a3;
  v5 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(-[_HMFCFHTTPMessage message](self, "message"), v4);

  return v5;
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
  __CFString *v6;
  __CFString *value;

  v6 = (__CFString *)a4;
  value = (__CFString *)a3;
  CFHTTPMessageSetHeaderFieldValue(-[_HMFCFHTTPMessage message](self, "message"), v6, value);

}

- (id)date
{
  void *v2;
  void *v3;
  void *v4;

  -[_HMFCFHTTPMessage valueForHeaderField:](self, "valueForHeaderField:", CFSTR("Date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_HMFCFHTTPMessage setValue:forHeaderField:](self, "setValue:forHeaderField:", v6, CFSTR("Date"));
}

- (id)contentType
{
  return -[_HMFCFHTTPMessage valueForHeaderField:](self, "valueForHeaderField:", CFSTR("Content-Type"));
}

- (void)setContentType:(id)a3
{
  -[_HMFCFHTTPMessage setValue:forHeaderField:](self, "setValue:forHeaderField:", a3, CFSTR("Content-Type"));
}

- (int64_t)contentLength
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_HMFCFHTTPMessage valueForHeaderField:](self, "valueForHeaderField:", CFSTR("Content-Length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)setContentLength:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_HMFCFHTTPMessage setValue:forHeaderField:](self, "setValue:forHeaderField:", v4, CFSTR("Content-Length"));

}

- (NSData)body
{
  return (NSData *)CFHTTPMessageCopyBody(-[_HMFCFHTTPMessage message](self, "message"));
}

- (void)setBody:(id)a3
{
  const __CFData *v4;
  uint64_t v5;

  v4 = (const __CFData *)a3;
  CFHTTPMessageSetBody(-[_HMFCFHTTPMessage message](self, "message"), v4);
  v5 = -[__CFData length](v4, "length");

  -[_HMFCFHTTPMessage setContentLength:](self, "setContentLength:", v5);
}

- (__CFHTTPMessage)message
{
  return self->_message;
}

@end
