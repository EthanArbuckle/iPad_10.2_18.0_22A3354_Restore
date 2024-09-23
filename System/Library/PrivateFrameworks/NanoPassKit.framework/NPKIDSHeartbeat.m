@implementation NPKIDSHeartbeat

- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9
{
  return -[NPKIDSHeartbeat initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:](self, "initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9 updateInterval:(double)a10
{
  id v18;
  id v19;
  NPKIDSHeartbeat *v20;
  NPKIDSHeartbeat *v21;
  uint64_t v22;
  NSDictionary *sendOptions;
  dispatch_source_t v24;
  OS_dispatch_source *statusTimer;
  uint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  NPKIDSHeartbeat *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  _QWORD handler[4];
  NPKIDSHeartbeat *v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v39 = a4;
  v38 = a7;
  v18 = a8;
  v19 = a9;
  v43.receiver = self;
  v43.super_class = (Class)NPKIDSHeartbeat;
  v20 = -[NPKIDSHeartbeat init](&v43, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pendingStatusProtobuf, a3);
    objc_storeStrong((id *)&v21->_service, a4);
    v21->_messagePriority = a5;
    objc_storeStrong((id *)&v21->_responseIdentifier, a7);
    v22 = objc_msgSend(v18, "copy", v38, v39, v40);
    sendOptions = v21->_sendOptions;
    v21->_sendOptions = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_queue, a9);
    v21->_updatesSent = 0;
    v21->_maxUpdates = a6;
    v24 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v21->_queue);
    statusTimer = v21->_statusTimer;
    v21->_statusTimer = (OS_dispatch_source *)v24;

    if (a10 <= 0.0)
      v26 = 30000000000;
    else
      v26 = (uint64_t)(a10 * 1000000000.0);
    v27 = v21->_statusTimer;
    v28 = dispatch_time(0, v26);
    dispatch_source_set_timer(v27, v28, v26, 0);
    v29 = v21->_statusTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __129__NPKIDSHeartbeat_initWithPendingStatusProtobuf_service_priority_maxUpdates_responseIdentifier_sendOptions_queue_updateInterval___block_invoke;
    handler[3] = &unk_24CFE7998;
    v30 = v21;
    v42 = v30;
    dispatch_source_set_event_handler(v29, handler);
    dispatch_resume((dispatch_object_t)v21->_statusTimer);
    pk_Payment_log();
    v31 = objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)v27)
    {
      pk_Payment_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKIDSHeartbeat service](v30, "service");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKIDSHeartbeat pendingStatusProtobuf](v30, "pendingStatusProtobuf");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "type");
        -[NPKIDSHeartbeat responseIdentifier](v30, "responseIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = v33;
        v46 = 1024;
        v47 = v35;
        v48 = 2112;
        v49 = v36;
        _os_log_impl(&dword_213518000, v32, OS_LOG_TYPE_DEFAULT, "Notice: Started providing periodic updates:\n\tservice: %@\n\tmessage type: %u\n\tresponse identifier: %@", buf, 0x1Cu);

      }
    }

  }
  return v21;
}

uint64_t __129__NPKIDSHeartbeat_initWithPendingStatusProtobuf_service_priority_maxUpdates_responseIdentifier_sendOptions_queue_updateInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHeartbeat");
}

- (void)invalidate
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning service agent status updater invalidating: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[NPKIDSHeartbeat statusTimer](self, "statusTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    -[NPKIDSHeartbeat setStatusTimer:](self, "setStatusTimer:", 0);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NPKIDSHeartbeat invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NPKIDSHeartbeat;
  -[NPKIDSHeartbeat dealloc](&v3, sel_dealloc);
}

- (void)_sendHeartbeat
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = (unint64_t)v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sending heartbeat for response identifer: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDSHeartbeat sendOptions](self, "sendOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPKIDSHeartbeat sendOptions](self, "sendOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  }
  -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x24BE4FB18]);

  }
  -[NPKIDSHeartbeat service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDSHeartbeat pendingStatusProtobuf](self, "pendingStatusProtobuf");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NPKIDSHeartbeat messagePriority](self, "messagePriority");
  -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __33__NPKIDSHeartbeat__sendHeartbeat__block_invoke;
  v23[3] = &unk_24CFE79C0;
  v23[4] = self;
  v16 = NPKProtoSendWithOptions(v12, v13, v14, v15, 0, v23, v7);

  -[NPKIDSHeartbeat setUpdatesSent:](self, "setUpdatesSent:", -[NPKIDSHeartbeat updatesSent](self, "updatesSent") + 1);
  v17 = -[NPKIDSHeartbeat updatesSent](self, "updatesSent");
  if (v17 >= -[NPKIDSHeartbeat maxUpdates](self, "maxUpdates"))
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = -[NPKIDSHeartbeat maxUpdates](self, "maxUpdates");
        -[NPKIDSHeartbeat responseIdentifier](self, "responseIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v25 = v21;
        v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Warning: Reached limit of %lu heartbeats for response identifier %@; will not send further updates.",
          buf,
          0x16u);

      }
    }
    -[NPKIDSHeartbeat invalidate](self, "invalidate");
  }

}

void __33__NPKIDSHeartbeat__sendHeartbeat__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pendingStatusProtobuf");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "type");
      objc_msgSend(*(id *)(a1 + 32), "responseIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 1024;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Not able to send heartbeat:\n\tservice: %@\n\tmessage type: %u\n\tresponse identifier: %@", (uint8_t *)&v9, 0x1Cu);

    }
  }
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (IDSProtobuf)pendingStatusProtobuf
{
  return self->_pendingStatusProtobuf;
}

- (void)setPendingStatusProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStatusProtobuf, a3);
}

- (int64_t)messagePriority
{
  return self->_messagePriority;
}

- (void)setMessagePriority:(int64_t)a3
{
  self->_messagePriority = a3;
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_source)statusTimer
{
  return self->_statusTimer;
}

- (void)setStatusTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)sendOptions
{
  return self->_sendOptions;
}

- (void)setSendOptions:(id)a3
{
  objc_storeStrong((id *)&self->_sendOptions, a3);
}

- (unint64_t)updatesSent
{
  return self->_updatesSent;
}

- (void)setUpdatesSent:(unint64_t)a3
{
  self->_updatesSent = a3;
}

- (unint64_t)maxUpdates
{
  return self->_maxUpdates;
}

- (void)setMaxUpdates:(unint64_t)a3
{
  self->_maxUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingStatusProtobuf, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
