@implementation AUServiceAdapter

- (id)_init
{
  AUServiceAdapter *v2;
  AUServiceAdapter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUServiceAdapter;
  v2 = -[AUServiceAdapter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_activeConnection = 0;
  else
    NSLog(CFSTR("%s: Error could not instantiate the ServiceAdapter"), "-[AUServiceAdapter _init]");
  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__AUServiceAdapter_sharedInstance__block_invoke;
  block[3] = &unk_24DE13F28;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sharedInstance;
}

uint64_t __34__AUServiceAdapter_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  sharedInstance_sharedInstance = result;
  return result;
}

- (BOOL)hasActiveConnection
{
  return self->_activeConnection != 0;
}

- (void)deviceClassAttached:(id)a3 options:(id)a4 withReply:(id)a5
{
  objc_class *v9;
  FudPlugin *updater;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "principalClass");
  if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_25511F378) & 1) != 0)
  {
    updater = (FudPlugin *)objc_msgSend([v9 alloc], "initWithDeviceClass:delegate:info:options:", a3, self, &v12, a4);
    self->_updater = updater;
    v11 = v12;
  }
  else
  {
    NSLog(CFSTR("%s: Error 'Principal class' does not conform to plugin protocol"), "-[AUServiceAdapter deviceClassAttached:options:withReply:]");
    v11 = 0;
    updater = self->_updater;
  }
  (*((void (**)(id, BOOL, uint64_t))a5 + 2))(a5, updater != 0, v11);
}

- (void)bootstrapWithOptions:(id)a3
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin bootstrapWithOptions:](updater, "bootstrapWithOptions:", a3);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, "-[AUServiceAdapter bootstrapWithOptions:]");
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin findFirmwareWithOptions:remote:](updater, "findFirmwareWithOptions:remote:", a3, a4);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, a4, "-[AUServiceAdapter findFirmwareWithOptions:remote:]");
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin downloadFirmwareWithOptions:](updater, "downloadFirmwareWithOptions:", a3);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, "-[AUServiceAdapter downloadFirmwareWithOptions:]");
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin prepareFirmwareWithOptions:](updater, "prepareFirmwareWithOptions:", a3);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, "-[AUServiceAdapter prepareFirmwareWithOptions:]");
}

- (void)applyFirmwareWithOptions:(id)a3
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin applyFirmwareWithOptions:](updater, "applyFirmwareWithOptions:", a3);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, "-[AUServiceAdapter applyFirmwareWithOptions:]");
}

- (void)finishWithOptions:(id)a3
{
  FudPlugin *updater;

  updater = self->_updater;
  if (updater)
    -[FudPlugin finishWithOptions:](updater, "finishWithOptions:", a3);
  else
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, "-[AUServiceAdapter finishWithOptions:]");
}

- (void)queryDeviceList:(id)a3
{
  FudPlugin *updater;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  updater = self->_updater;
  if (!updater)
  {
    NSLog(CFSTR("%s: Plugin not loaded"), a2, "-[AUServiceAdapter queryDeviceList:]");
LABEL_7:
    v7 = 0;
    goto LABEL_4;
  }
  if ((-[FudPlugin conformsToProtocol:](updater, "conformsToProtocol:", &unk_25511F3D8) & 1) == 0)
  {
    NSLog(CFSTR("%s: Plugin does support queryDeviceList"), v6, "-[AUServiceAdapter queryDeviceList:]");
    goto LABEL_7;
  }
  -[FudPlugin queryDeviceList:](self->_updater, "queryDeviceList:", &v8);
  v7 = v8;
LABEL_4:
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  FudPlugin *updater;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  updater = self->_updater;
  if (updater)
  {
    if ((-[FudPlugin conformsToProtocol:](updater, "conformsToProtocol:", &unk_25511F438) & 1) != 0)
      -[FudPlugin personalizationResponse:response:status:](self->_updater, "personalizationResponse:response:status:", a3, a4, a5);
    else
      NSLog(CFSTR("%s: Plugin does support personalization"), v10, v11, v12, v13, "-[AUServiceAdapter personalizationResponse:response:status:]");
  }
  else
  {
    NSLog(CFSTR("%s: Plugin not loaded"), a2, a3, a4, a5, "-[AUServiceAdapter personalizationResponse:response:status:]");
  }
}

- (void)accessoryDisconnected:(id)a3
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global), "accessoryDisconnected:", a3);
}

void __42__AUServiceAdapter_accessoryDisconnected___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter accessoryDisconnected:]_block_invoke");
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_156), "didBootstrap:info:error:", a3, a4, a5);
}

void __44__AUServiceAdapter_didBootstrap_info_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didBootstrap:info:error:]_block_invoke");
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_157), "didFind:info:updateAvailable:needsDownload:error:", a3, a4, a5, a6, a7);
}

void __69__AUServiceAdapter_didFind_info_updateAvailable_needsDownload_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didFind:info:updateAvailable:needsDownload:error:]_block_invoke");
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_158), "didDownload:info:error:", a3, a4, a5);
}

void __43__AUServiceAdapter_didDownload_info_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didDownload:info:error:]_block_invoke");
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_159), "didPrepare:info:error:", a3, a4, a5);
}

void __42__AUServiceAdapter_didPrepare_info_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didPrepare:info:error:]_block_invoke");
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_160), "didApply:info:error:", a3, a4, a5);
}

void __40__AUServiceAdapter_didApply_info_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didApply:info:error:]_block_invoke");
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_161), "didFinish:info:error:", a3, a4, a5);
}

void __41__AUServiceAdapter_didFinish_info_error___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter didFinish:info:error:]_block_invoke");
}

- (void)personalizationRequest:(id)a3
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_162), "personalizationRequest:", a3);
}

void __43__AUServiceAdapter_personalizationRequest___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter personalizationRequest:]_block_invoke");
}

- (void)progress:(double)a3
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_163), "progress:", a3);
}

void __29__AUServiceAdapter_progress___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter progress:]_block_invoke");
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_164), "reportAnalytics:info:", a3, a4);
}

void __41__AUServiceAdapter_reportAnalytics_info___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter reportAnalytics:info:]_block_invoke");
}

- (void)issueNotification:(id)a3
{
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_activeConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_165), "issueNotification:", a3);
}

void __38__AUServiceAdapter_issueNotification___block_invoke()
{
  NSLog(CFSTR("%s: Could not report status to daemon"), "-[AUServiceAdapter issueNotification:]_block_invoke");
}

- (void)log:(int)a3 format:(id)a4
{
  uint64_t v4;

  -[AUServiceAdapter logv:format:arguments:](self, "logv:format:arguments:", *(_QWORD *)&a3, a4, &v4);
}

- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5
{
  NSLogv((NSString *)a4, a5);
}

- (FudPlugin)updater
{
  return self->_updater;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  self->_activeConnection = (NSXPCConnection *)a3;
}

@end
