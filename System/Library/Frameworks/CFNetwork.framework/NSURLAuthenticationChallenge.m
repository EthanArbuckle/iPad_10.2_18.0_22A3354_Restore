@implementation NSURLAuthenticationChallenge

+ (id)_authenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  return (id)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:]([NSURLAuthenticationChallenge alloc], (uint64_t)a3, (uint64_t)a4);
}

- (uint64_t)_initWithCFAuthChallenge:(uint64_t)a3 sender:
{
  _QWORD *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if (!a1)
    return 0;
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  if (a2)
    v6 = (_QWORD *)(a2 + 16);
  else
    v6 = 0;
  v7 = (id)v6[3];
  if (v7)
  {
    v7 = -[NSURLProtectionSpace _initWithCFURLProtectionSpace:]([NSURLProtectionSpace alloc], "_initWithCFURLProtectionSpace:", v7);
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  }
  v8 = (id)v6[4];
  if (v8)
  {
    v8 = -[NSURLCredential _initWithCFURLCredential:]([NSURLCredential alloc], "_initWithCFURLCredential:", v8);
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  }
  if (v6[6])
  {
    v9 = +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(a1, "_initWithListOfProtectionSpaces:CurrentProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", v6[8], v7, v8, v6[5], v9, v6[7], a3);
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 64) = v6[9];
  return v10;
}

- (id)_initWithListOfProtectionSpaces:(id)a3 CurrentProtectionSpace:(id)a4 proposedCredential:(id)a5 previousFailureCount:(int64_t)a6 failureResponse:(id)a7 error:(id)a8 sender:(id)a9
{
  NSURLAuthenticationChallenge *v10;

  v10 = -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:](self, "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", a4, a5, a6, a7, a8, a9);
  if (a3)
    v10->_internal->protectionSpacesForChallenge = (NSArray *)objc_msgSend(a3, "copy");
  return v10;
}

- (NSURLAuthenticationChallenge)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(NSInteger)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id)sender
{
  NSURLAuthenticationChallenge *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NSURLAuthenticationChallenge;
  v14 = -[NSURLAuthenticationChallenge init](&v16, sel_init);
  if (v14)
    v14->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallengeInternal alloc], space, credential, previousFailureCount, response, error, sender);
  return v14;
}

- (NSInteger)previousFailureCount
{
  return self->_internal->previousFailureCount;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_internal->space;
}

- (_CFURLAuthChallenge)_createCFAuthChallenge
{
  NSURLAuthenticationChallengeInternal *internal;
  NSURLProtectionSpace *space;
  _CFURLProtectionSpace *v5;
  NSURLCredential *proposedCredential;
  _CFURLCredential *v7;
  NSURLResponse *failureResponse;
  _CFURLResponse *v9;
  uint64_t v10;
  NSArray *protectionSpacesForChallenge;
  BOOL v12;
  uint64_t v13;

  internal = self->_internal;
  space = internal->space;
  if (space)
  {
    v5 = -[NSURLProtectionSpace _cfurlprtotectionspace](space, "_cfurlprtotectionspace");
    internal = self->_internal;
  }
  else
  {
    v5 = 0;
  }
  proposedCredential = internal->proposedCredential;
  if (proposedCredential)
  {
    v7 = -[NSURLCredential _cfurlcredential](proposedCredential, "_cfurlcredential");
    internal = self->_internal;
  }
  else
  {
    v7 = 0;
  }
  failureResponse = internal->failureResponse;
  if (failureResponse)
  {
    v9 = -[NSURLResponse _CFURLResponse](failureResponse, "_CFURLResponse");
    internal = self->_internal;
  }
  else
  {
    v9 = 0;
  }
  v10 = CFURLAuthChallengeCreate(0, v5, v7, internal->previousFailureCount, v9, internal->error);
  protectionSpacesForChallenge = self->_internal->protectionSpacesForChallenge;
  if (v10)
    v12 = protectionSpacesForChallenge == 0;
  else
    v12 = 1;
  if (!v12)
  {
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
    URLAuthChallenge::setListOfProtectionSpaces((URLAuthChallenge *)(v10 + 16), protectionSpacesForChallenge);
  }
  if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
    dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
  v13 = v10 + 16;
  if (!v10)
    v13 = 0;
  *(_QWORD *)(v13 + 72) = self->_internal->preferredProtSpaceIndex;
  return (_CFURLAuthChallenge *)v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLAuthenticationChallenge;
  -[NSURLAuthenticationChallenge dealloc](&v3, sel_dealloc);
}

- (id)sender
{
  return self->_internal->sender;
}

- (NSURLCredential)proposedCredential
{
  return self->_internal->proposedCredential;
}

- (NSURLResponse)failureResponse
{
  return self->_internal->failureResponse;
}

- (NSError)error
{
  return self->_internal->error;
}

- (NSURLAuthenticationChallenge)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id)sender
{
  NSURLAuthenticationChallenge *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSURLAuthenticationChallenge;
  v6 = -[NSURLAuthenticationChallenge init](&v8, sel_init);
  if (v6)
    v6->_internal = (NSURLAuthenticationChallengeInternal *)-[NSURLAuthenticationChallengeInternal initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallengeInternal alloc], -[NSURLAuthenticationChallenge protectionSpace](challenge, "protectionSpace"), -[NSURLAuthenticationChallenge proposedCredential](challenge, "proposedCredential"), -[NSURLAuthenticationChallenge previousFailureCount](challenge, "previousFailureCount"), -[NSURLAuthenticationChallenge failureResponse](challenge, "failureResponse"), -[NSURLAuthenticationChallenge error](challenge, "error"), sender);
  return v6;
}

- (NSURLAuthenticationChallenge)init
{
  NSLog(CFSTR("NSURLAuthenticationChallenge must have init parameters"), a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  _CFURLAuthChallenge *v4;
  _CFURLAuthChallenge *v5;
  CFTypeRef v6;
  CFTypeRef cf;

  v4 = -[NSURLAuthenticationChallenge _createCFAuthChallenge](self, "_createCFAuthChallenge");
  if (v4)
  {
    v5 = v4;
    cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge != -1)
      dispatch_once(&URLAuthChallenge::Class(void)::sOnce_URLAuthChallenge, &__block_literal_global_8559);
    if ((*(unsigned int (**)(_QWORD *, CFTypeRef *))(*((_QWORD *)v5 + 2) + 64))((_QWORD *)v5 + 2, &cf))
    {
      if (!cf)
      {
LABEL_17:
        CFRelease(v5);
        return;
      }
      v6 = CFRetain(cf);
    }
    else
    {
      v6 = 0;
    }
    if (cf)
      CFRelease(cf);
    if (v6)
    {
      if (objc_msgSend(a3, "requiresSecureCoding", &off_1E14EFC30)
        && objc_msgSend(a3, "allowsKeyedCoding"))
      {
        objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("__nsurlauthenticationchallenge_proto_plist"));
      }
      else
      {
        objc_msgSend(a3, "encodeObject:", v6);
      }
      CFRelease(v6);
    }
    goto LABEL_17;
  }
}

- (NSURLAuthenticationChallenge)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  NSURLAuthenticationChallenge *v16;
  uint64_t v18;
  void *v19;

  if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v19 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithObjects:", v18, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("__nsurlauthenticationchallenge_proto_plist"));
  }
  else
  {
    v13 = (const void *)objc_msgSend(a3, "decodeObject");
  }
  if (!v13)
    return 0;
  v14 = _CFURLAuthChallengeCreateFromArchive((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v13);
  if (!v14)
    return 0;
  v15 = (const void *)v14;
  v16 = (NSURLAuthenticationChallenge *)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:](self, v14, 0);
  CFRelease(v15);
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSender:(id)a3
{
  NSURLAuthenticationChallengeSender *sender;

  sender = self->_internal->sender;
  if (sender != a3)
  {

    self->_internal->sender = (NSURLAuthenticationChallengeSender *)a3;
  }
}

+ (id)_createAuthenticationChallengeForCFAuthChallenge:(_CFURLAuthChallenge *)a3 sender:(id)a4
{
  return (id)-[NSURLAuthenticationChallenge _initWithCFAuthChallenge:sender:]([NSURLAuthenticationChallenge alloc], (uint64_t)a3, (uint64_t)a4);
}

@end
