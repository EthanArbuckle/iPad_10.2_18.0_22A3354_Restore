@implementation _GEOProgressForReceivingOverXPC

- (_GEOProgressForReceivingOverXPC)initWithEndpoint:(id)a3
{
  _xpc_endpoint_s *v4;
  id v5;
  uint64_t v6;
  void *v7;
  xpc_connection_t v8;
  void *v9;
  _xpc_connection_s *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  _GEOProgressForReceivingOverXPC *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v4 = (_xpc_endpoint_s *)a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOProgressForReceivingOverXPC;
  v5 = -[_GEOProgressForReceivingOverXPC initWithParent:userInfo:](&v18, sel_initWithParent_userInfo_, 0, 0);
  if (!v5)
    goto LABEL_4;
  geo_dispatch_queue_create_with_workloop_qos();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v6;

  v8 = xpc_connection_create_from_endpoint(v4);
  v9 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v8;

  v10 = (_xpc_connection_s *)*((_QWORD *)v5 + 15);
  if (v10)
  {
    xpc_connection_set_target_queue(v10, *((dispatch_queue_t *)v5 + 16));
    objc_initWeak(&location, v5);
    v11 = (_xpc_connection_s *)*((_QWORD *)v5 + 15);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52___GEOProgressForReceivingOverXPC_initWithEndpoint___block_invoke;
    v15[3] = &unk_1E1C07998;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v11, v15);
    xpc_connection_activate(*((xpc_connection_t *)v5 + 15));
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_connection_send_message(*((xpc_connection_t *)v5 + 15), v12);
    v13 = (_GEOProgressForReceivingOverXPC *)v5;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (id)initVendingEndpoint:(id *)a3
{
  _GEOProgressForReceivingOverXPC *v4;
  void *v5;
  xpc_connection_t v6;
  OS_xpc_object *connection;
  _xpc_connection_s *v8;
  _GEOProgressForReceivingOverXPC *v9;
  _QWORD handler[4];
  id v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_GEOProgressForReceivingOverXPC;
  v4 = -[_GEOProgressForReceivingOverXPC initWithParent:userInfo:](&v15, sel_initWithParent_userInfo_, 0, 0);
  if (v4)
  {
    geo_dispatch_queue_create_with_workloop_qos();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v4->_queue, v5);
    v6 = xpc_connection_create(0, (dispatch_queue_t)v4->_queue);
    connection = v4->_connection;
    v4->_connection = v6;

    if (v4->_connection)
    {
      objc_initWeak(&location, v4);
      v8 = v4->_connection;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke;
      handler[3] = &unk_1E1C0C948;
      objc_copyWeak(&v13, &location);
      v12 = v5;
      xpc_connection_set_event_handler(v8, handler);
      xpc_connection_activate(v4->_connection);
      if (a3)
        *a3 = xpc_endpoint_create(v4->_connection);
      v9 = v4;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  OS_xpc_object *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    xpc_connection_cancel(connection);
  v4.receiver = self;
  v4.super_class = (Class)_GEOProgressForReceivingOverXPC;
  -[_GEOProgressForReceivingOverXPC dealloc](&v4, sel_dealloc);
}

- (void)_handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  OS_xpc_object *connection;
  objc_super v9;

  v4 = a3;
  v5 = MEMORY[0x18D765A14]();
  if (v5 == MEMORY[0x1E0C812F8])
  {
    -[NSProgress _geo_configureFromMirroredProgressXPCDictionary:](self, "_geo_configureFromMirroredProgressXPCDictionary:", v4);
    if (-[_GEOProgressForReceivingOverXPC isFinished](self, "isFinished"))
    {
      v6 = self->_connection;
      connection = self->_connection;
      self->_connection = 0;

      if (v6)
        xpc_connection_cancel(v6);
      goto LABEL_10;
    }
  }
  else if (v5 == MEMORY[0x1E0C81310])
  {
    v6 = self->_connection;
    v7 = self->_connection;
    self->_connection = 0;

    if (v6)
      xpc_connection_cancel(v6);
    if ((-[_GEOProgressForReceivingOverXPC isFinished](self, "isFinished") & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)_GEOProgressForReceivingOverXPC;
      -[_GEOProgressForReceivingOverXPC cancel](&v9, sel_cancel);
    }
LABEL_10:

  }
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GEOProgressForReceivingOverXPC;
  -[_GEOProgressForReceivingOverXPC cancel](&v5, sel_cancel);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___GEOProgressForReceivingOverXPC_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
