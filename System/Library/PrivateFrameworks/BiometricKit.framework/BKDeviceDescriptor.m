@implementation BKDeviceDescriptor

+ (id)deviceDescriptorForType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setType:", a3);
  return v4;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

+ (void)initialize
{
  if (initializeOSLog_onceToken != -1)
    dispatch_once(&initializeOSLog_onceToken, &__block_literal_global_1);
}

@end
