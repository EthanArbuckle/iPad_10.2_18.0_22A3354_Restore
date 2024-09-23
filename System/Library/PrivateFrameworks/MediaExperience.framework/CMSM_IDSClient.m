@implementation CMSM_IDSClient

- (CMSM_IDSClient)init
{
  CMSM_IDSClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMSM_IDSClient;
  v2 = -[CMSM_IDSClient init](&v6, sel_init);
  v2->pIdsService = (IDSService *)objc_msgSend(objc_alloc((Class)CMSM_GetIDSServiceClass()), "initWithService:", CFSTR("com.apple.private.alloy.cmsession"));
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.cmsession.ids.client.dispatch", v3);
  v2->idsDispatchQueue = (OS_dispatch_queue *)v4;
  -[IDSService addDelegate:queue:](v2->pIdsService, "addDelegate:queue:", v2, v4);
  v2->_lastSentRemotePlayingInfoQueryGUID = 0;
  return v2;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  return -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](self->pIdsService, "sendMessage:toDestinations:priority:options:identifier:error:", a3, a4, a5, a6, a7, a8);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!a6)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end
