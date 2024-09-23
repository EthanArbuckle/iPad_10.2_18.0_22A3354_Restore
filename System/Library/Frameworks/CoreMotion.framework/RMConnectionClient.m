@implementation RMConnectionClient

- (void)endpointWasInterrupted:(id)a3
{
  RMConnectionEndpoint *i;
  NSObject *v5;
  NSObject *v6;
  RMConnectionEndpoint *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (RMConnectionEndpoint *)a3;
  if (!self)
    goto LABEL_12;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (i = self->_endpoint; i != v7; i = 0)
  {
    sub_18F3866D8();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_18F3866D8();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Received interruption event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_18F3866D8();
    self = (RMConnectionClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "endpoint == self.endpoint";
      _os_log_impl(&dword_18F1DC000, &self->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
LABEL_12:
    dispatch_assert_queue_V2(0);
  }
  sub_18F386CC0((uint64_t)self);
  sub_18F38642C((uint64_t)self);

}

- (void)endpointWasInvalidated:(id)a3
{
  NSObject *v4;
  RMConnectionEndpoint *endpoint;
  OS_dispatch_source **p_connectionTimer;
  NSObject *v7;
  OS_dispatch_queue *v8;
  dispatch_source_t v9;
  OS_dispatch_source *v10;
  dispatch_time_t v11;
  NSObject *connectionTimer;
  NSObject *v13;
  NSObject *v14;
  _QWORD handler[5];
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    endpoint = self->_endpoint;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    endpoint = 0;
  }
  if (endpoint != (RMConnectionEndpoint *)v4)
  {
    sub_18F3866D8();
    v13 = objc_claimAutoreleasedReturnValue();
    p_connectionTimer = (OS_dispatch_source **)"assert";
    self = (RMConnectionClient *)"endpoint == self.endpoint";
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_18F3866D8();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Received invalidation event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_18F3866D8();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "endpoint == self.endpoint";
      _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
    goto LABEL_21;
  }
  sub_18F386CC0((uint64_t)self);
  if (v4)
  {
    objc_storeWeak((id *)&v4[3].isa, 0);
    objc_storeWeak((id *)&v4[2].isa, 0);
  }
  if (self)
  {
    objc_storeStrong((id *)&self->_endpoint, 0);
    if (self->_valid)
    {
      p_connectionTimer = &self->_connectionTimer;
      if (!self->_connectionTimer)
      {
        if (qword_1EE16DD28 == -1)
        {
LABEL_10:
          v7 = qword_1EE16DD30;
          if (os_log_type_enabled((os_log_t)qword_1EE16DD30, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEBUG, "Connection invalidated, setting up the reconnection timer", buf, 2u);
          }
          v8 = self->_queue;
          v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v8);
          objc_storeStrong((id *)p_connectionTimer, v9);

          self->_connectionTimerDelay = 4;
          v10 = self->_connectionTimer;
          v11 = dispatch_time(0, 4000000000);
          dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);

          connectionTimer = self->_connectionTimer;
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = sub_18F3876F4;
          handler[3] = &unk_1E2956400;
          handler[4] = self;
          dispatch_source_set_event_handler(connectionTimer, handler);
          dispatch_resume((dispatch_object_t)self->_connectionTimer);
          goto LABEL_13;
        }
LABEL_21:
        dispatch_once(&qword_1EE16DD28, &unk_1E2953028);
        goto LABEL_10;
      }
    }
  }
LABEL_13:

}

- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4
{
  if (self)
    self = (RMConnectionClient *)self->_streamingDataCallback;
  ((void (*)(RMConnectionClient *, id, _QWORD))self->_endpoint)(self, a4, 0);
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  if (self)
    self = (RMConnectionClient *)self->_messageHandler;
  ((void (*)(RMConnectionClient *, id, id, id))self->_endpoint)(self, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_messageCache, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_streamingDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
