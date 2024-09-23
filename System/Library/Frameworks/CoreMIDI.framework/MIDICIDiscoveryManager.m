@implementation MIDICIDiscoveryManager

- (int)setupManager
{
  NSLog(CFSTR("Unable to create MIDI client (err = %d)"), a2, 4294956452);
  return -10844;
}

- (void)discoverWithHandler:(MIDICIDiscoveryResponseBlock)completedHandler
{
  void *v4;
  MIDICIDiscoveryManager *v5;
  id v6;

  v6 = completedHandler;
  v4 = _Block_copy(v6);
  NSLog(CFSTR("discoverWithHandler:%p"), v4);

  -[MIDICIDiscoveryManager setResponseBlock:](self, "setResponseBlock:", v6);
  v5 = self;
  -[MIDICIDiscoveryManager discover](v5, "discover");

}

- (void)dealloc
{
  MIDIClientRef mClient;
  objc_super v4;

  mClient = self->_mClient;
  if (mClient)
    MIDIClientDispose(mClient);
  v4.receiver = self;
  v4.super_class = (Class)MIDICIDiscoveryManager;
  -[MIDICIDiscoveryManager dealloc](&v4, sel_dealloc);
}

- (id)handleNotification:(const MIDINotification *)a3
{
  id v4;
  size_t messageSize;
  uint64_t messageID;
  const char *v7;
  void *v8;
  uint64_t v9;
  const MIDINotification *v10;
  unsigned int v11;
  __int128 v12;
  uint64_t v13;
  MIDICIDiscoveredNode *v14;
  uint64_t v15;
  _OWORD __dst[2];

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  __dst[0] = 0uLL;
  *(_QWORD *)((char *)&__dst[1] + 5) = 0;
  *(_QWORD *)&__dst[1] = 0;
  messageID = a3->messageID;
  messageSize = a3->messageSize;
  if ((int)messageID > 30)
  {
    switch((_DWORD)messageID)
    {
      case 0x1F:
        v7 = "Property Supported";
        break;
      case 0x20:
        v7 = "Property SysEx Data";
        break;
      case 0x28:
        v7 = "Done w/ Capabilities";
        break;
      default:
LABEL_15:
        v7 = "Unknown Notification Type";
        break;
    }
  }
  else
  {
    v7 = "MUID";
    switch((int)messageID)
    {
      case 10:
        break;
      case 11:
        v7 = "Peer Info";
        break;
      case 12:
        v7 = "Peer Info Empty";
        break;
      case 20:
        v7 = "Profile Supported";
        break;
      case 21:
        v7 = "Profile Enabled";
        break;
      case 22:
        v7 = "Profile Disabled";
        break;
      case 23:
        v7 = "Profile Specific Data";
        break;
      default:
        goto LABEL_15;
    }
  }
  NSLog(CFSTR("handleNotification:%p msgID:%d (%s), msgSize:%lu"), a3, messageID, v7, messageSize, __dst[0], __dst[1]);
  if ((messageID - 10) > 2)
  {
    NSLog(CFSTR("Disallowed message type encountered"));
  }
  else
  {
    v8 = 0;
    v9 = messageID;
    while ((_DWORD)v9 == 11)
    {
      v10 = a3 + 1;
      memcpy(__dst, v10, messageSize);
      v11 = BYTE12(__dst[1]);
      v12 = *(_OWORD *)((char *)__dst + 4);
      v13 = DWORD1(__dst[1]);
      v14 = [MIDICIDiscoveredNode alloc];
      v15 = -[MIDICIDiscoveredNode initWithDestination:deviceID:profilesSupported:propertiesSupported:maxSysExSize:](v14, "initWithDestination:deviceID:profilesSupported:propertiesSupported:maxSysExSize:", DWORD2(__dst[1]), v12, (v11 >> 2) & 1, (v11 >> 3) & 1, v13);

      NSLog(CFSTR("Peer discovered:%@"), v15);
      objc_msgSend(v4, "addObject:", v15);
      a3 = (const MIDINotification *)((char *)v10 + messageSize);
      v9 = a3->messageID;
      messageSize = a3->messageSize;
      v8 = (void *)v15;
    }
    if ((_DWORD)v9 == 12 || (_DWORD)v9 == 40)
      NSLog(CFSTR("Done with capabilities."));
    else
      NSLog(CFSTR("Unrecognized msgID %d (done == %hhd)"), v9, 0);

  }
  return v4;
}

- (void)debugPrintMessage
{
  NSLog(CFSTR("NOTICE: DEBUG PRINT MESSAGE"), a2);
}

- (void)discover
{
  NSLog(CFSTR("Error: Unable to discover MIDI capabilities using client 0x%lx"), a2, self->_mClient);
}

- (id)responseBlock
{
  return self->_mResponseBlock;
}

- (void)setResponseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mResponseBlock, 0);
}

+ (MIDICIDiscoveryManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MIDICIDiscoveryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIDICIDiscoveryManager sharedInstance]::onceToken != -1)
    dispatch_once(&+[MIDICIDiscoveryManager sharedInstance]::onceToken, block);
  return (MIDICIDiscoveryManager *)(id)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance;
}

void __40__MIDICIDiscoveryManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance;
  +[MIDICIDiscoveryManager sharedInstance]::theSharedInstance = (uint64_t)v1;

  objc_msgSend((id)+[MIDICIDiscoveryManager sharedInstance]::theSharedInstance, "setupManager");
  NSLog(CFSTR("MIDICIDiscoveryManager sharedInstance:%@"), +[MIDICIDiscoveryManager sharedInstance]::theSharedInstance);
}

@end
