@implementation VCControlChannelFaceTime

- (VCControlChannelFaceTime)initWithCallID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  VCControlChannelFaceTime *v6;
  VCControlChannelFaceTime *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCControlChannelFaceTime;
  v6 = -[VCControlChannel init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_callID = a3;
    v6->_SIPHandle = (tagHANDLE *)objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
    v8 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__VCControlChannelFaceTime_initWithCallID_reportingAgent___block_invoke;
    v11[3] = &unk_1E9E54A78;
    v11[4] = v8;
    v9 = _Block_copy(v11);
    SIPSetMessageDelegateForCallID((uint64_t)v7->_SIPHandle, v7->_callID, (uint64_t)v9);
    _Block_release(v9);
    v7->super.super._reportingAgent = a4;
  }
  return v7;
}

uint64_t __58__VCControlChannelFaceTime_initWithCallID_reportingAgent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  return objc_msgSend((id)objc_msgSend(v5, "messageReceivedDelegate"), "controlChannel:receivedMessage:transactionID:fromParticipant:", v5, a2, a3, 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  SIPSetMessageDelegateForCallID((uint64_t)self->_SIPHandle, self->_callID, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCControlChannelFaceTime;
  -[VCControlChannel dealloc](&v3, sel_dealloc);
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4
{
  int v4;
  BOOL v5;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = SIPSendMessage((uint64_t *)&self->_SIPHandle, self->_callID, (char *)objc_msgSend((id)objc_msgSend(a3, "VCCCString"), "UTF8String"), &v7);
  if (v7)
    v5 = 1;
  else
    v5 = v4 < 0;
  return !v5;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4
{
  NSObject *asyncProcessingQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCControlChannelFaceTime_sendReliableMessage_withTopic___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(asyncProcessingQueue, v5);
}

uint64_t __58__VCControlChannelFaceTime_sendReliableMessage_withTopic___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 168)), "controlChannel:sendReliableMessage:didSucceed:toParticipant:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "VCCCString"), objc_msgSend(*(id *)(a1 + 32), "sendReliableMessageAndWait:withTopic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), 0);
}

@end
