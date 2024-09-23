@implementation DTKTraceTapLocalShaderTimelineEventProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B8E318;
  v6[3] = &unk_24EB295F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateTriggerConfigs:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalShaderTimelineEventProducer)init
{
  DTKTraceTapLocalShaderTimelineEventProducer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTKTraceTapLocalShaderTimelineEventProducer;
  v2 = -[DTKTraceTapLocalShaderTimelineEventProducer init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.dt.instruments.ktrace.shadertimelineproducer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    notify_register_check("com.apple.Metal.AGXEnableOSSignposts", &v2->_token);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DTKTraceTapLocalShaderTimelineEventProducer;
  -[DTKTraceTapLocalShaderTimelineEventProducer dealloc](&v5, sel_dealloc);
}

- (void)_notifyShaderBinaryInfo
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  notify_set_state(self->_token, 0);
  notify_post("com.apple.Metal.AGXEnableOSSignposts");
  v3 = dispatch_time(0, 100000000);
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B8E54C;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)start
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v5, v6, 0x12A05F200uLL, 0xBEBC200uLL);
  objc_initWeak(&location, self);
  v7 = self->_timer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_222B8E698;
  handler[3] = &unk_24EB2AA28;
  objc_copyWeak(&v9, &location);
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
  -[DTKTraceTapLocalShaderTimelineEventProducer _notifyShaderBinaryInfo](self, "_notifyShaderBinaryInfo");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stop
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  notify_set_state(self->_token, 0);
  notify_post("com.apple.Metal.AGXEnableOSSignposts");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
