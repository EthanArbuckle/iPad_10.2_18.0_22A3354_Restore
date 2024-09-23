@implementation CSAudioStreamHoldRequestOption

- (CSAudioStreamHoldRequestOption)initWithTimeout:(double)a3 clientIdentity:(unint64_t)a4 requireRecordModeLock:(BOOL)a5 requireListeningMicIndicatorLock:(BOOL)a6
{
  CSAudioStreamHoldRequestOption *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSAudioStreamHoldRequestOption;
  result = -[CSAudioStreamHoldRequestOption init](&v11, sel_init);
  if (result)
  {
    result->_timeout = a3;
    result->_clientIdentity = a4;
    result->_requireRecordModeLock = a5;
    result->_requireListeningMicIndicatorLock = a6;
  }
  return result;
}

- (CSAudioStreamHoldRequestOption)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioStreamHoldRequestOption *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSAudioStreamHoldRequestOption;
  v5 = -[CSAudioStreamHoldRequestOption init](&v7, sel_init);
  if (v5)
  {
    v5->_timeout = xpc_dictionary_get_double(v4, "timeout");
    v5->_clientIdentity = xpc_dictionary_get_uint64(v4, "clientIdentity");
    v5->_requireRecordModeLock = xpc_dictionary_get_BOOL(v4, "requireRecordModeLock");
    v5->_requireListeningMicIndicatorLock = xpc_dictionary_get_BOOL(v4, "requireListeningMicIndicatorLock");
  }

  return v5;
}

- (id)xpcObject
{
  xpc_object_t v3;
  uint64_t i;
  xpc_object_t values[4];
  char *keys[5];

  keys[4] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "timeout";
  keys[1] = "clientIdentity";
  keys[2] = "requireRecordModeLock";
  keys[3] = "requireListeningMicIndicatorLock";
  values[0] = xpc_double_create(self->_timeout);
  values[1] = xpc_uint64_create(self->_clientIdentity);
  values[2] = xpc_BOOL_create(self->_requireRecordModeLock);
  values[3] = xpc_BOOL_create(self->_requireListeningMicIndicatorLock);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  for (i = 3; i != -1; --i)

  return v3;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)requireRecordModeLock
{
  return self->_requireRecordModeLock;
}

- (BOOL)requireListeningMicIndicatorLock
{
  return self->_requireListeningMicIndicatorLock;
}

+ (id)defaultOptionWithTimeout:(double)a3
{
  return -[CSAudioStreamHoldRequestOption initWithTimeout:clientIdentity:requireRecordModeLock:requireListeningMicIndicatorLock:]([CSAudioStreamHoldRequestOption alloc], "initWithTimeout:clientIdentity:requireRecordModeLock:requireListeningMicIndicatorLock:", 0, 0, 0, a3);
}

@end
