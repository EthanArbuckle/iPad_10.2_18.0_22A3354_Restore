@implementation XRCourierAgent

+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5 replyStop:(id)a6 replyTicket:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  XRCourierAgent *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [XRCourierAgent alloc];
  v19 = (void *)objc_msgSend_initWithMessage_details_(v16, v17, (uint64_t)v14, (uint64_t)v13, v18);

  objc_msgSend_sendToWaitingRoom_replyStop_replyTicket_(v19, v20, (uint64_t)v15, (uint64_t)v12, (uint64_t)v11);
  return v19;
}

+ (id)sendCourierToVisitWaitingRoom:(id)a3 message:(id)a4 details:(id)a5
{
  return (id)MEMORY[0x24BEDD108](a1, sel_sendCourierToVisitWaitingRoom_message_details_replyStop_replyTicket_, a3, a4, a5);
}

- (XRCourierAgent)initWithMessage:(id)a3 details:(id)a4
{
  id v7;
  id v8;
  XRCourierAgent *v9;
  XRCourierAgent *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *details;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)XRCourierAgent;
  v9 = -[XRCourierAgent init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    v15 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    details = v10->_details;
    v10->_details = (NSDictionary *)v15;

  }
  return v10;
}

- (void)sendToWaitingRoom:(id)a3 replyStop:(id)a4 replyTicket:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_visitorTicketForAgent_team_(v10, v11, (uint64_t)self, 0, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateAtStop_activationTicket_finalDestination_finalTicket_(self, v13, (uint64_t)v10, (uint64_t)v14, (uint64_t)v9, v8);

}

- (void)sendToWaitingRoom:(id)a3
{
  objc_msgSend_sendToWaitingRoom_replyStop_replyTicket_(self, a2, (uint64_t)a3, 0, 0);
}

- (XRCourierAgent)init
{

  return 0;
}

- (id)agentDiagnosticsName
{
  return CFSTR("Courier");
}

- (BOOL)yieldNow
{
  return 0;
}

- (void)executeStopOnItinerary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString **v19;
  objc_super v20;
  objc_super v21;

  v4 = a3;
  objc_msgSend_mode(self, v5, v6, v7, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == CFSTR("Activating"))
  {
    v21.receiver = self;
    v21.super_class = (Class)XRCourierAgent;
    -[XRMobileAgent executeStopOnItinerary:](&v21, sel_executeStopOnItinerary_, v4);
    objc_msgSend_currentStop(v4, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (self->_roomOwner)
        v19 = XRMobileAgentFinished;
      else
        v19 = &XRMobileAgentFailed;
    }
    else
    {
      v19 = XRMobileAgentFinished;
    }
    objc_msgSend_finishedWithMode_(v4, v16, (uint64_t)*v19, v17, v18);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)XRCourierAgent;
    -[XRMobileAgent executeStopOnItinerary:](&v20, sel_executeStopOnItinerary_, v4);
  }

}

- (XRMobileAgentOwner)roomOwner
{
  return self->_roomOwner;
}

- (void)setRoomOwner:(id)a3
{
  objc_storeStrong((id *)&self->_roomOwner, a3);
}

- (NSString)message
{
  return self->_message;
}

- (NSDictionary)details
{
  return self->_details;
}

- (NSDictionary)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_storeStrong((id *)&self->_reply, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_roomOwner, 0);
}

@end
