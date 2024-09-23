@implementation COAlarmServiceClient

- (COAlarmServiceClient)initWithConnection:(id)a3
{
  COAlarmServiceClient *v3;
  COAlarmServiceClient *v4;
  uint64_t v5;
  OS_nw_activity *clientLifetimeActivity;
  OS_xpc_object *v7;
  OS_xpc_object *clientLifetimeActivityMetrics;
  OS_xpc_object *v9;
  OS_xpc_object *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)COAlarmServiceClient;
  v3 = -[COCoordinationServiceClient initWithConnection:](&v13, sel_initWithConnection_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_clientLifetimeActivityCompletionReason = 2;
    +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 6, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    clientLifetimeActivity = v4->_clientLifetimeActivity;
    v4->_clientLifetimeActivity = (OS_nw_activity *)v5;

    nw_activity_activate();
    v7 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    clientLifetimeActivityMetrics = v4->_clientLifetimeActivityMetrics;
    v4->_clientLifetimeActivityMetrics = v7;

    v9 = v4->_clientLifetimeActivityMetrics;
    if (v9)
    {
      xpc_dictionary_set_uint64(v9, "service", 0);
      v10 = v4->_clientLifetimeActivityMetrics;
      -[COCoordinationServiceClient clientBundleIdentifier](v4, "clientBundleIdentifier");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v10, "client", (const char *)objc_msgSend(v11, "UTF8String"));

    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_clientLifetimeActivityMetrics)
    nw_activity_submit_metrics();
  nw_activity_complete_with_reason();
  v3.receiver = self;
  v3.super_class = (Class)COAlarmServiceClient;
  -[COAlarmServiceClient dealloc](&v3, sel_dealloc);
}

- (void)donateClientLifetimeActivityCompletionReason:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__COAlarmServiceClient_donateClientLifetimeActivityCompletionReason___block_invoke;
  v3[3] = &unk_24D4B2FC8;
  v4 = a3;
  v3[4] = self;
  -[COCoordinationServiceClient _withLock:](self, "_withLock:", v3);
}

uint64_t __69__COAlarmServiceClient_donateClientLifetimeActivityCompletionReason___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(unsigned int *)(result + 40);
  if ((_DWORD)v2 == 3)
    return objc_msgSend(*(id *)(v1 + 32), "setClientLifetimeActivityCompletionReason:", v2);
  if ((_DWORD)v2 == 2)
  {
    result = objc_msgSend(*(id *)(result + 32), "clientLifetimeActivityCompletionReason");
    if ((_DWORD)result != 3)
    {
      v2 = *(unsigned int *)(v1 + 40);
      return objc_msgSend(*(id *)(v1 + 32), "setClientLifetimeActivityCompletionReason:", v2);
    }
  }
  return result;
}

- (void)changeClientLifetimeActivityMetrics:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__COAlarmServiceClient_changeClientLifetimeActivityMetrics___block_invoke;
  v6[3] = &unk_24D4B0B68;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCoordinationServiceClient _withLock:](self, "_withLock:", v6);

}

void __60__COAlarmServiceClient_changeClientLifetimeActivityMetrics___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "clientLifetimeActivityMetrics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (OS_nw_activity)clientLifetimeActivity
{
  return self->_clientLifetimeActivity;
}

- (OS_xpc_object)clientLifetimeActivityMetrics
{
  return self->_clientLifetimeActivityMetrics;
}

- (int)clientLifetimeActivityCompletionReason
{
  return self->_clientLifetimeActivityCompletionReason;
}

- (void)setClientLifetimeActivityCompletionReason:(int)a3
{
  self->_clientLifetimeActivityCompletionReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLifetimeActivityMetrics, 0);
  objc_storeStrong((id *)&self->_clientLifetimeActivity, 0);
}

@end
