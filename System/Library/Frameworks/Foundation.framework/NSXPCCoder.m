@implementation NSXPCCoder

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSXPCCoder;
  -[NSXPCCoder dealloc](&v3, sel_dealloc);
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (NSXPCCoder)init
{
  NSXPCCoder *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSXPCCoder;
  v2 = -[NSXPCCoder init](&v4, sel_init);
  if (v2 && _initializeClasses_onceToken != -1)
    dispatch_once(&_initializeClasses_onceToken, &__block_literal_global_86);
  return v2;
}

- (void)setUserInfo:(id)userInfo
{
  objc_setProperty_atomic(self, a2, userInfo, 8);
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 8, 1);
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClasses:(id)a4
{
  NSXPCEncoder *v6;
  uint64_t v7;
  NSXPCDecoder *v8;
  id v9;

  v6 = objc_alloc_init(NSXPCEncoder);
  -[NSXPCEncoder beginEncoding](v6, "beginEncoding");
  -[NSXPCEncoder encodeObject:forKey:](v6, "encodeObject:forKey:", a3, CFSTR("root"));
  v7 = -[NSXPCEncoder finishEncoding](v6, "finishEncoding");

  v8 = -[NSXPCDecoder initWithInterface:]([NSXPCDecoder alloc], "initWithInterface:", 0);
  -[NSXPCDecoder _startReadingFromXPCObject:](v8, "_startReadingFromXPCObject:", v7);
  v9 = -[NSXPCDecoder decodeObjectOfClasses:forKey:](v8, "decodeObjectOfClasses:forKey:", a4, CFSTR("root"));

  return v9;
}

- (id)decodeXPCObjectForKey:(id)a3
{
  return 0;
}

- (xpc_object_t)decodeXPCObjectOfType:(xpc_type_t)type forKey:(NSString *)key
{
  return 0;
}

- (NSXPCConnection)connection
{
  return 0;
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClass:(Class)a4
{
  return (id)objc_msgSend(a1, "_testEncodeAndDecodeObject:allowedClasses:", a3, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4));
}

+ (id)_testEncodeAndDecodeInvocation:(id)a3 interface:(id)a4
{
  NSXPCEncoder *v6;
  xpc_object_t v7;
  NSXPCDecoder *v8;
  NSXPCDecoder *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(NSXPCEncoder);
  v7 = xpc_dictionary_create(0, 0, 0);
  -[NSXPCEncoder _encodeInvocation:isReply:into:](v6, "_encodeInvocation:isReply:into:", a3, 0, v7);

  v8 = -[NSXPCDecoder initWithInterface:]([NSXPCDecoder alloc], "initWithInterface:", a4);
  v11[0] = 0;
  -[NSXPCDecoder _decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:](v8, "_decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:", v7, 0, v11, 0, 0, 0, 0);
  v9 = v8;
  xpc_release(v7);
  return (id)v11[0];
}

@end
