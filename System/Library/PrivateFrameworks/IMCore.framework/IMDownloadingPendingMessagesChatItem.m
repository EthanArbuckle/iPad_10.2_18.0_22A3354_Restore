@implementation IMDownloadingPendingMessagesChatItem

- (id)_initWithItem:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDownloadingPendingMessagesChatItem;
  v3 = -[IMChatItem _initWithItem:](&v6, sel__initWithItem_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_setGUID:", CFSTR("spm:"));
  return v4;
}

- (unint64_t)pendingIncomingSatelliteMessageCount
{
  return self->_pendingIncomingSatelliteMessageCount;
}

- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3
{
  self->_pendingIncomingSatelliteMessageCount = a3;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)_setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

@end
