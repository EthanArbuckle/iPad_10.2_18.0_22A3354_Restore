@implementation AVURLAuthenticationChallenge

- (AVURLAuthenticationChallenge)init
{
  return -[AVURLAuthenticationChallenge initWithAuthenticationChallenge:sender:requestInfo:requestID:](self, "initWithAuthenticationChallenge:sender:requestInfo:requestID:", 0, 0, 0, 0);
}

- (AVURLAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3 sender:(id)a4 requestInfo:(__CFDictionary *)a5 requestID:(unint64_t)a6
{
  AVURLAuthenticationChallenge *v10;
  __CFDictionary *v11;
  BOOL v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVURLAuthenticationChallenge;
  v10 = -[NSURLAuthenticationChallenge initWithAuthenticationChallenge:sender:](&v14, sel_initWithAuthenticationChallenge_sender_);
  if (v10)
  {
    v10->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v10);
    v10->_requestID = a6;
    v11 = a5 ? (__CFDictionary *)CFRetain(a5) : 0;
    if ((v10->_requestInfo = v11, !a3) || !a4 || (v10->_weakReference ? (v12 = v11 == 0) : (v12 = 1), v12))
    {

      return 0;
    }
  }
  return v10;
}

- (AVURLAuthenticationChallenge)initWithAuthenticationChallenge:(id)a3 sender:(id)a4
{
  return -[AVURLAuthenticationChallenge initWithAuthenticationChallenge:sender:requestInfo:requestID:](self, "initWithAuthenticationChallenge:sender:requestInfo:requestID:", a3, a4, 0, 0);
}

- (AVURLAuthenticationChallenge)initWithProtectionSpace:(id)a3 proposedCredential:(id)a4 previousFailureCount:(int64_t)a5 failureResponse:(id)a6 error:(id)a7 sender:(id)a8
{
  return -[AVURLAuthenticationChallenge initWithAuthenticationChallenge:sender:requestInfo:requestID:](self, "initWithAuthenticationChallenge:sender:requestInfo:requestID:", 0, a8, 0, 0, a7);
}

- (void)dealloc
{
  __CFDictionary *requestInfo;
  objc_super v4;

  requestInfo = self->_requestInfo;
  if (requestInfo)
    CFRelease(requestInfo);
  v4.receiver = self;
  v4.super_class = (Class)AVURLAuthenticationChallenge;
  -[NSURLAuthenticationChallenge dealloc](&v4, sel_dealloc);
}

- (id)_weakReference
{
  return self->_weakReference;
}

- (unint64_t)_requestID
{
  return self->_requestID;
}

- (BOOL)_shouldInformDelegateOfFigCancellation
{
  return 1;
}

+ (SEL)_selectorForInformingDelegateOfCancellationByFig
{
  return sel_resourceLoader_didCancelAuthenticationChallenge_;
}

- (void)_performCancellationByClient
{
  -[NSURLAuthenticationChallengeSender cancelAuthenticationChallenge:](-[NSURLAuthenticationChallenge sender](self, "sender"), "cancelAuthenticationChallenge:", self);
}

- (__CFDictionary)_requestInfo
{
  return self->_requestInfo;
}

@end
