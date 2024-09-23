@implementation VCAudioSessionClient

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_notificationClient, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioSessionClient;
  -[VCAudioSessionClient dealloc](&v3, sel_dealloc);
}

- (void)setNotificationClient:(id)a3
{
  objc_storeWeak((id *)&self->_notificationClient, a3);
}

- (VCAudioSessionDelegate)notificationClient
{
  return (VCAudioSessionDelegate *)objc_loadWeak((id *)&self->_notificationClient);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMediaProperties:", self->_mediaProperties);
  objc_msgSend(v4, "setNotificationClient:", -[VCAudioSessionClient notificationClient](self, "notificationClient"));
  return v4;
}

- (VCAudioSessionMediaProperties)mediaProperties
{
  return self->_mediaProperties;
}

- (void)setMediaProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

@end
