@implementation AXPIEventSender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance__shared;
}

void __33__AXPIEventSender_sharedInstance__block_invoke()
{
  AXPIEventSender *v0;
  void *v1;

  v0 = objc_alloc_init(AXPIEventSender);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

- (AXPIEventSender)init
{
  AXPIEventSender *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *eventSendingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXPIEventSender;
  v2 = -[AXPIEventSender init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXPIEventSender-EventSendingQueue", 0);
    eventSendingQueue = v2->_eventSendingQueue;
    v2->_eventSendingQueue = (OS_dispatch_queue *)v3;

    -[AXPIEventSender setSenderID:](v2, "setSenderID:", 0x8000000817319372);
  }
  return v2;
}

- (void)sendEventRepresentation:(id)a3
{
  id v4;
  NSObject *eventSendingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AXPIEventSender *v9;

  v4 = a3;
  eventSendingQueue = self->_eventSendingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__AXPIEventSender_sendEventRepresentation___block_invoke;
  v7[3] = &unk_24F478680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(eventSendingQueue, v7);

}

void __43__AXPIEventSender_sendEventRepresentation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  unint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "postHIDEventDirectly"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = IOHIDEventSystemClientCreate();
    objc_msgSend(*(id *)(a1 + 32), "normalizedEventRepresentation:scale:", 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "newHIDEventRef");
    if (v2)
    {
      v3 = (const void *)v2;
      IOHIDEventSetSenderID();
      IOHIDEventSystemClientDispatchEvent();
      CFRelease(v3);
    }
  }
  else
  {
    v4 = ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "additionalFlags") >> 14) & 1;
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalFlags:", objc_msgSend(*(id *)(a1 + 32), "additionalFlags") & 0xFFFFFFFFFFFFBFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "setSenderID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(MEMORY[0x24BE005C8], "server");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postEvent:systemEvent:", *(_QWORD *)(a1 + 32), v4);
  }

}

- (void)sendIOHIDEventRef:(__IOHIDEvent *)a3
{
  NSObject *eventSendingQueue;
  _QWORD block[7];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = a3;
  if (a3)
    CFRetain(a3);
  eventSendingQueue = self->_eventSendingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__AXPIEventSender_sendIOHIDEventRef___block_invoke;
  block[3] = &unk_24F4786A8;
  block[5] = v7;
  block[6] = a3;
  block[4] = self;
  dispatch_async(eventSendingQueue, block);
  _Block_object_dispose(v7, 8);
}

void __37__AXPIEventSender_sendIOHIDEventRef___block_invoke(uint64_t a1)
{
  const void *v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = IOHIDEventSystemClientCreate();
  IOHIDEventSetSenderID();
  IOHIDEventSystemClientDispatchEvent();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSendingQueue, 0);
}

@end
