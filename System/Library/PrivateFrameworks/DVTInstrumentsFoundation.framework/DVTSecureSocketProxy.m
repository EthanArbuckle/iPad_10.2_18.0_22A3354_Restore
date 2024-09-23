@implementation DVTSecureSocketProxy

- (void)_onIOQueue_cancelProxy
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD handler[5];

  -[DVTSecureSocketProxy ioQueue](self, "ioQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[DVTSecureSocketProxy cancelled](self, "cancelled"))
  {
    -[DVTSecureSocketProxy setCancelled:](self, "setCancelled:", 1);
    -[DVTSecureSocketProxy setSendDataToConnection:](self, "setSendDataToConnection:", 0);
    -[DVTSecureSocketProxy setReceiveDataFromConnection:](self, "setReceiveDataFromConnection:", 0);
    if (!-[DVTSecureSocketProxy pendingWrites](self, "pendingWrites"))
    {
      -[DVTSecureSocketProxy socketIOChannel](self, "socketIOChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_io_close(v4, 1uLL);

    }
    -[DVTSecureSocketProxy canReceiveFromConnection](self, "canReceiveFromConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_222B29CC0;
    handler[3] = &unk_24EB27E30;
    handler[4] = self;
    dispatch_source_set_cancel_handler(v5, handler);

    -[DVTSecureSocketProxy canSendToConnection](self, "canSendToConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = sub_222B29D78;
    v10[3] = &unk_24EB27E30;
    v10[4] = self;
    dispatch_source_set_cancel_handler(v7, v10);

    -[DVTSecureSocketProxy canReceiveFromConnection](self, "canReceiveFromConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[DVTSecureSocketProxy canSendToConnection](self, "canSendToConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

  }
}

- (void)_onIOQueue_finishCleanup
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  -[DVTSecureSocketProxy ioQueue](self, "ioQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DVTSecureSocketProxy cleanupConnection](self, "cleanupConnection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (id)v4;
    -[DVTSecureSocketProxy canReceiveFromConnection](self, "canReceiveFromConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (-[DVTSecureSocketProxy canSendToConnection](self, "canSendToConnection"),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[DVTSecureSocketProxy socketIOChannel](self, "socketIOChannel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[DVTSecureSocketProxy cleanupConnection](self, "cleanupConnection");
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        -[DVTSecureSocketProxy setCleanupConnection:](self, "setCleanupConnection:", 0);
      }
    }
  }
}

- (void)receiveDataFromConnectionAndWriteToSocket
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[DVTSecureSocketProxy receiveFromConnectionQueue](self, "receiveFromConnectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_222B2A034;
  v12 = sub_222B2A044;
  -[DVTSecureSocketProxy receiveFromConnectionBufferPool](self, "receiveFromConnectionBufferPool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockingAcquireBuffer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[DVTSecureSocketProxy ioQueue](self, "ioQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B2A04C;
  v7[3] = &unk_24EB28738;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  if (v9[5])
  {
    -[DVTSecureSocketProxy receiveFromConnectionBufferPool](self, "receiveFromConnectionBufferPool");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "releaseBuffer:", v9[5]);

  }
  _Block_object_dispose(&v8, 8);

}

- (void)readDataFromSocketAndSendToConnection
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  -[DVTSecureSocketProxy sendToConnectionQueue](self, "sendToConnectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DVTSecureSocketProxy ioQueue](self, "ioQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B2A4B0;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_sync(v4, block);

  -[DVTSecureSocketProxy sendToConnectionCompleted](self, "sendToConnectionCompleted");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_onIOQueue_sendDataToConnection:(id)a3
{
  NSObject *v4;
  NSObject *data;
  _QWORD applier[5];

  data = a3;
  -[DVTSecureSocketProxy ioQueue](self, "ioQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[DVTSecureSocketProxy cancelled](self, "cancelled"))
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = sub_222B2A808;
    applier[3] = &unk_24EB28788;
    applier[4] = self;
    dispatch_data_apply(data, applier);
  }

}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ioQueue, a3);
}

- (OS_dispatch_queue)receiveFromConnectionQueue
{
  return self->_receiveFromConnectionQueue;
}

- (void)setReceiveFromConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_receiveFromConnectionQueue, a3);
}

- (OS_dispatch_queue)sendToConnectionQueue
{
  return self->_sendToConnectionQueue;
}

- (void)setSendToConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sendToConnectionQueue, a3);
}

- (DVTSecureSocketProxyBufferPool)receiveFromConnectionBufferPool
{
  return self->_receiveFromConnectionBufferPool;
}

- (void)setReceiveFromConnectionBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_receiveFromConnectionBufferPool, a3);
}

- (OS_dispatch_group)sendToConnectionCompleted
{
  return self->_sendToConnectionCompleted;
}

- (void)setSendToConnectionCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_sendToConnectionCompleted, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (OS_dispatch_io)socketIOChannel
{
  return self->_socketIOChannel;
}

- (void)setSocketIOChannel:(id)a3
{
  objc_storeStrong((id *)&self->_socketIOChannel, a3);
}

- (unint64_t)pendingWrites
{
  return self->_pendingWrites;
}

- (void)setPendingWrites:(unint64_t)a3
{
  self->_pendingWrites = a3;
}

- (OS_dispatch_source)canReceiveFromConnection
{
  return self->_canReceiveFromConnection;
}

- (void)setCanReceiveFromConnection:(id)a3
{
  objc_storeStrong((id *)&self->_canReceiveFromConnection, a3);
}

- (OS_dispatch_source)canSendToConnection
{
  return self->_canSendToConnection;
}

- (void)setCanSendToConnection:(id)a3
{
  objc_storeStrong((id *)&self->_canSendToConnection, a3);
}

- (id)receiveDataFromConnection
{
  return self->_receiveDataFromConnection;
}

- (void)setReceiveDataFromConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)sendDataToConnection
{
  return self->_sendDataToConnection;
}

- (void)setSendDataToConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)cleanupConnection
{
  return self->_cleanupConnection;
}

- (void)setCleanupConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupConnection, 0);
  objc_storeStrong(&self->_sendDataToConnection, 0);
  objc_storeStrong(&self->_receiveDataFromConnection, 0);
  objc_storeStrong((id *)&self->_canSendToConnection, 0);
  objc_storeStrong((id *)&self->_canReceiveFromConnection, 0);
  objc_storeStrong((id *)&self->_socketIOChannel, 0);
  objc_storeStrong((id *)&self->_sendToConnectionCompleted, 0);
  objc_storeStrong((id *)&self->_receiveFromConnectionBufferPool, 0);
  objc_storeStrong((id *)&self->_sendToConnectionQueue, 0);
  objc_storeStrong((id *)&self->_receiveFromConnectionQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end
