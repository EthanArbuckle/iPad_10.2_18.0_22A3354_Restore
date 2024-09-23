@implementation AVContentKeyResponse

+ (AVContentKeyResponse)contentKeyResponseWithFairPlayStreamingKeyResponseData:(NSData *)keyResponseData
{
  return (AVContentKeyResponse *)-[AVContentKeyResponseFairPlayStreaming initWithKeyData:renewalDate:]([AVContentKeyResponseFairPlayStreaming alloc], "initWithKeyData:renewalDate:", keyResponseData, 0);
}

+ (AVContentKeyResponse)contentKeyResponseWithFairPlayStreamingKeyResponseData:(id)a3 renewalDate:(id)a4
{
  return (AVContentKeyResponse *)-[AVContentKeyResponseFairPlayStreaming initWithKeyData:renewalDate:]([AVContentKeyResponseFairPlayStreaming alloc], "initWithKeyData:renewalDate:", a3, a4);
}

+ (AVContentKeyResponse)contentKeyResponseWithClearKeyData:(NSData *)keyData initializationVector:(NSData *)initializationVector
{
  return (AVContentKeyResponse *)-[AVContentKeyResponseClearKey initWithKeyData:initializationVector:]([AVContentKeyResponseClearKey alloc], "initWithKeyData:initializationVector:", keyData, initializationVector);
}

+ (AVContentKeyResponse)contentKeyResponseWithAuthorizationTokenData:(NSData *)authorizationTokenData
{
  return (AVContentKeyResponse *)-[AVContentKeyResponseAuthorizationToken initWithAuthorizationTokenData:]([AVContentKeyResponseAuthorizationToken alloc], "initWithAuthorizationTokenData:", authorizationTokenData);
}

- (AVContentKeyResponse)initWithKeySystem:(id)a3
{
  AVContentKeyResponse *v4;
  AVContentKeyResponseInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVContentKeyResponse;
  v4 = -[AVContentKeyResponse init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVContentKeyResponseInternal);
    v4->_keyResponse = v5;
    if (v5)
    {
      v4->_keyResponse->_keySystem = (NSString *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVContentKeyResponseInternal *keyResponse;
  objc_super v4;

  keyResponse = self->_keyResponse;
  if (keyResponse)
  {

    keyResponse = self->_keyResponse;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVContentKeyResponse;
  -[AVContentKeyResponse dealloc](&v4, sel_dealloc);
}

- (id)keySystem
{
  return self->_keyResponse->_keySystem;
}

@end
