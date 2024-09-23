@implementation BWNodeConfigurationLiveMessage

- (_QWORD)_initWithConfigurationID:(void *)a3 updatedFormat:
{
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)BWNodeConfigurationLiveMessage;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[1] = 0x300000001;
    v5[2] = a2;
    v5[3] = a3;
  }
  return v6;
}

+ (id)newMessageWithConfigurationID:(int64_t)a3 updatedFormat:(id)a4
{
  return -[BWNodeConfigurationLiveMessage _initWithConfigurationID:updatedFormat:]([BWNodeConfigurationLiveMessage alloc], a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeConfigurationLiveMessage;
  -[BWNodeConfigurationLiveMessage dealloc](&v3, sel_dealloc);
}

- (BWFormat)updatedFormat
{
  return self->_updatedFormat;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

+ (id)newMessageWithConfigurationID:(int64_t)a3
{
  return -[BWNodeConfigurationLiveMessage _initWithConfigurationID:updatedFormat:]([BWNodeConfigurationLiveMessage alloc], a3, 0);
}

@end
