@implementation BWStillImageConditionalRouterNode

- (BWStillImageConditionalRouterNode)initWithRoutingConfiguration:(id)a3
{
  BWStillImageConditionalRouterNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageConditionalRouterNode;
  v4 = -[BWFanOutNode initWithFanOutCount:mediaType:](&v6, sel_initWithFanOutCount_mediaType_, objc_msgSend(a3, "numberOfOutputs"), 1986618469);
  if (v4)
    v4->_configuration = (BWStillImageConditionalRouterConfiguration *)a3;
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageConditionalRouterNode;
  -[BWFanOutNode dealloc](&v3, sel_dealloc);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  unsigned int (**v6)(id, opaqueCMSampleBuffer *, _DWORD *);
  NSArray *v7;
  id v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v6 = -[BWStillImageConditionalRouterConfiguration shouldEmitSampleBufferDecisionProvider](self->_configuration, "shouldEmitSampleBufferDecisionProvider", a3, a4);
  if (v6[2](v6, a3, &v12))
  {
    v7 = -[BWNode outputs](self, "outputs");
    v8 = -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v12);
    if (dword_1ECFE9870)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v8, "emitSampleBuffer:", a3, v10, v11);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  unsigned int (**v7)(id, id, _DWORD *);
  NSArray *v8;
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[BWStillImageConditionalRouterConfiguration shouldEmitNodeErrorDecisionProvider](self->_configuration, "shouldEmitNodeErrorDecisionProvider"))
  {
    v14 = 0;
    v7 = -[BWStillImageConditionalRouterConfiguration shouldEmitNodeErrorDecisionProvider](self->_configuration, "shouldEmitNodeErrorDecisionProvider");
    if (v7[2](v7, a3, &v14))
    {
      v8 = -[BWNode outputs](self, "outputs");
      v9 = -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v14);
      if (dword_1ECFE9870)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v9, "emitNodeError:", a3, v11, v12);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BWStillImageConditionalRouterNode;
    -[BWFanOutNode handleNodeError:forInput:](&v13, sel_handleNodeError_forInput_, a3, a4);
  }
}

@end
