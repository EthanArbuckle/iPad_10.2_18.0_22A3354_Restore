@implementation _ASAgentCredentialSharingGroupsListener

- (_ASAgentCredentialSharingGroupsListener)init
{
  _ASAgentCredentialSharingGroupsListener *v2;
  ASCredentialSharingGroupsNotificationManager *v3;
  ASCredentialSharingGroupsNotificationManager *notificationManager;
  id v5;
  uint64_t v6;
  NSXPCListener *listener;
  _ASAgentCredentialSharingGroupsListener *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_ASAgentCredentialSharingGroupsListener;
  v2 = -[_ASAgentCredentialSharingGroupsListener init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ASCredentialSharingGroupsNotificationManager);
    notificationManager = v2->_notificationManager;
    v2->_notificationManager = v3;

    v5 = objc_alloc(MEMORY[0x24BDD1998]);
    v6 = objc_msgSend(v5, "initWithMachServiceName:", *MEMORY[0x24BE82E40]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v8 = v2;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char HasEntitlement;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "auditToken");
  HasEntitlement = WBSAuditTokenHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v10, 0, 0, 0, 0);

    objc_msgSend(v8, "setExportedObject:", self->_notificationManager);
    objc_msgSend(v8, "resume");
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_ASAgentCredentialSharingGroupsListener listener:shouldAcceptNewConnection:].cold.1(v11);
  }

  return HasEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20E4D9000, log, OS_LOG_TYPE_FAULT, "Rejecting connection from unentitled process", v1, 2u);
}

@end
