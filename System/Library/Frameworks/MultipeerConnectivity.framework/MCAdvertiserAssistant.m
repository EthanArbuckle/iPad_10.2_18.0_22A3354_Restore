@implementation MCAdvertiserAssistant

- (MCAdvertiserAssistant)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCAdvertiserAssistant;
  -[MCAdvertiserAssistant doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCAdvertiserAssistant)initWithServiceType:(NSString *)serviceType discoveryInfo:(NSDictionary *)info session:(MCSession *)session
{
  MCAdvertiserAssistant *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  MCSession *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  MCNearbyServiceAdvertiser *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MCAdvertiserAssistant;
  v8 = -[MCAdvertiserAssistant init](&v20, sel_init);
  if (v8)
  {
    if (!session)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB8];
      v11 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("A nil MCSession object passed to %@"), NSStringFromClass(v11));
    }
    v12 = session;
    v8->_session = v12;
    v8->_myPeerID = (MCPeerID *)-[MCPeerID copy](-[MCSession myPeerID](v12, "myPeerID"), "copy");
    if (!+[MCNearbyServiceUtils isServiceTypeValid:](MCNearbyServiceUtils, "isServiceTypeValid:", serviceType))
    {
      v13 = (void *)MEMORY[0x24BDBCE88];
      v14 = *MEMORY[0x24BDBCAB8];
      v15 = (objc_class *)objc_opt_class();
      objc_msgSend(v13, "raise:format:", v14, CFSTR("Invalid serviceType passed to %@"), NSStringFromClass(v15));
    }
    v8->_serviceType = (NSString *)-[NSString copy](serviceType, "copy");
    v8->_discoveryInfo = (NSDictionary *)-[NSDictionary copy](info, "copy");
    v16 = -[MCNearbyServiceAdvertiser initWithPeer:discoveryInfo:serviceType:]([MCNearbyServiceAdvertiser alloc], "initWithPeer:discoveryInfo:serviceType:", v8->_myPeerID, v8->_discoveryInfo, v8->_serviceType);
    v8->_advertiser = v16;
    -[MCNearbyServiceAdvertiser setDelegate:](v16, "setDelegate:", v8);
    v8->_invitationsBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary");
    v8->_appName = (NSString *)objc_msgSend((id)objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDBD298]), "copy");
    v8->_frameworkBundle = (NSBundle *)(id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel_applicationWillTerminateNotification_, *MEMORY[0x24BDF75E0], 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  -[MCNearbyServiceAdvertiser setDelegate:](self->_advertiser, "setDelegate:", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)MCAdvertiserAssistant;
  -[MCAdvertiserAssistant dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSDictionary *v7;
  MCSession *v8;
  objc_class *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[MCAdvertiserAssistant serviceType](self, "serviceType");
  v7 = -[MCAdvertiserAssistant discoveryInfo](self, "discoveryInfo");
  v8 = -[MCAdvertiserAssistant session](self, "session");
  -[MCAdvertiserAssistant delegate](self, "delegate");
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p ServiceType = %@ DiscoveryInfo = %@ Session = %@ Delegate = <%@: %p>>"), v5, self, v6, v7, v8, NSStringFromClass(v9), -[MCAdvertiserAssistant delegate](self, "delegate"));
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)start
{
  -[MCNearbyServiceAdvertiser startAdvertisingPeer](-[MCAdvertiserAssistant advertiser](self, "advertiser"), "startAdvertisingPeer");
}

- (void)stop
{
  -[MCNearbyServiceAdvertiser stopAdvertisingPeer](-[MCAdvertiserAssistant advertiser](self, "advertiser"), "stopAdvertisingPeer");
}

- (void)handleUserInvitationDecision:(BOOL)a3
{
  _BOOL8 v3;
  MCSession *v5;
  NSObject *v6;
  void (**v7)(id, _BOOL8, MCSession *);

  v3 = a3;
  if (-[MCAdvertiserAssistant invitationHandlerForPresentedAlert](self, "invitationHandlerForPresentedAlert"))
  {
    if (v3)
      v5 = -[MCAdvertiserAssistant session](self, "session");
    else
      v5 = 0;
    v7 = -[MCAdvertiserAssistant invitationHandlerForPresentedAlert](self, "invitationHandlerForPresentedAlert");
    v7[2](v7, v3, v5);
    -[MCAdvertiserAssistant setInvitationHandlerForPresentedAlert:](self, "setInvitationHandlerForPresentedAlert:", 0);
    -[MCAdvertiserAssistant presentNextInvitation](self, "presentNextInvitation");
  }
  else
  {
    v6 = mcadvertiser_ui_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MCAdvertiserAssistant handleUserInvitationDecision:].cold.1(v6);
  }
}

- (void)presentNextInvitation
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  MCAlertController *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  if (!-[MCAdvertiserAssistant alertController](self, "alertController")
    && !-[MCAdvertiserAssistant invitationHandlerForPresentedAlert](self, "invitationHandlerForPresentedAlert"))
  {
    if (-[NSMutableArray count](-[MCAdvertiserAssistant invitationsBuffer](self, "invitationsBuffer"), "count"))
    {
      v3 = (void *)-[NSMutableArray objectAtIndex:](-[MCAdvertiserAssistant invitationsBuffer](self, "invitationsBuffer"), "objectAtIndex:", 0);
      v4 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("peerID"));
      -[MCAdvertiserAssistant setInvitationHandlerForPresentedAlert:](self, "setInvitationHandlerForPresentedAlert:", objc_msgSend(v3, "objectForKey:", CFSTR("invitationHandler")));
      v5 = -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Accept"), &stru_24C841670, 0);
      v6 = -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Decline"), &stru_24C841670, 0);
      v7 = -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("%@ wants to connect."), &stru_24C841670, 0);
      v8 = -[MCAdvertiserAssistant appName](self, "appName");
      v9 = +[MCAlertController alertControllerWithTitle:message:preferredStyle:](MCAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, objc_msgSend(v4, "displayName")), 1);
      v10 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke;
      v14[3] = &unk_24C8411D0;
      v14[4] = self;
      -[MCAlertController addAction:](v9, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v5, 0, v14));
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_2;
      v13[3] = &unk_24C8411D0;
      v13[4] = self;
      -[MCAlertController addAction:](v9, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v6, 1, v13));
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_3;
      v12[3] = &unk_24C8407E8;
      v12[4] = self;
      -[MCAlertController setViewWillAppearHandler:](v9, "setViewWillAppearHandler:", v12);
      v11[0] = v10;
      v11[1] = 3221225472;
      v11[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_4;
      v11[3] = &unk_24C8407E8;
      v11[4] = self;
      -[MCAlertController setViewDidDisappearHandler:](v9, "setViewDidDisappearHandler:", v11);
      -[MCAdvertiserAssistant setAlertController:](self, "setAlertController:", v9);
      -[MCAlertController show](-[MCAdvertiserAssistant alertController](self, "alertController"), "show");
      -[NSMutableArray removeObjectAtIndex:](-[MCAdvertiserAssistant invitationsBuffer](self, "invitationsBuffer"), "removeObjectAtIndex:", 0);
    }
  }
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserInvitationDecision:", 1);
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserInvitationDecision:", 0);
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_3(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_opt_respondsToSelector();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "advertiserAssitantWillPresentInvitation:", *(_QWORD *)(a1 + 32));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "advertiserAssistantWillPresentInvitation:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "advertiserAssistantDidDismissInvitation:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setAlertController:", 0);
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  NSObject *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = mcadvertiser_ui_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = objc_msgSend(a4, "displayName");
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Advertiser assistant will present invitation from from peer [%@].", buf, 0xCu);
  }
  v10[0] = CFSTR("peerID");
  v10[1] = CFSTR("invitationHandler");
  v11[0] = a4;
  v11[1] = (id)objc_msgSend(a6, "copy");
  -[NSMutableArray addObject:](-[MCAdvertiserAssistant invitationsBuffer](self, "invitationsBuffer"), "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  -[MCAdvertiserAssistant presentNextInvitation](self, "presentNextInvitation");
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  if (-[MCAdvertiserAssistant alertController](self, "alertController", a3))
  {
    -[MCAdvertiserAssistant handleUserInvitationDecision:](self, "handleUserInvitationDecision:", 0);
    -[MCAlertController dismiss](-[MCAdvertiserAssistant alertController](self, "alertController"), "dismiss");
    -[MCAdvertiserAssistant setAlertController:](self, "setAlertController:", 0);
  }
  -[NSMutableArray removeAllObjects](self->_invitationsBuffer, "removeAllObjects");
}

- (void)applicationWillTerminateNotification:(id)a3
{
  if (-[MCAdvertiserAssistant alertController](self, "alertController", a3))
  {
    -[MCAdvertiserAssistant handleUserInvitationDecision:](self, "handleUserInvitationDecision:", 0);
    -[MCAlertController dismiss](-[MCAdvertiserAssistant alertController](self, "alertController"), "dismiss");
    -[MCAdvertiserAssistant setAlertController:](self, "setAlertController:", 0);
  }
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)invitationsBuffer
{
  return self->_invitationsBuffer;
}

- (void)setInvitationsBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (id)invitationHandlerForPresentedAlert
{
  return self->_invitationHandlerForPresentedAlert;
}

- (void)setInvitationHandlerForPresentedAlert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)appName
{
  return self->_appName;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)wasAdvertising
{
  return self->_wasAdvertising;
}

- (void)setWasAdvertising:(BOOL)a3
{
  self->_wasAdvertising = a3;
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (MCAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)handleUserInvitationDecision:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DC1A000, log, OS_LOG_TYPE_ERROR, "Couldn't find invitationHandler.", v1, 2u);
}

@end
