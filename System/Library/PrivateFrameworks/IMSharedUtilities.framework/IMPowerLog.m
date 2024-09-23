@implementation IMPowerLog

+ (id)sharedInstance
{
  if (qword_1ECFC7610 != -1)
    dispatch_once(&qword_1ECFC7610, &unk_1E3FB32C8);
  return (id)qword_1ECFC7568;
}

- (void)logEvent:(id)a3 data:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (qword_1ECFC6BB8 != -1)
    dispatch_once(&qword_1ECFC6BB8, &unk_1E3FB45A8);
  if (off_1ECFC6BB0)
    off_1ECFC6BB0(7, v6, v5, 0);

}

- (void)logMessageSentWithGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 conversationType:(unint64_t)a6 messageType:(unint64_t)a7 sendDuration:(id)a8 errorCode:(id)a9 messageProtocol:(id)a10
{
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v34;
  _QWORD v35[8];
  _QWORD v36[9];

  v36[8] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("nil");
  if (a3)
    v17 = (const __CFString *)a3;
  else
    v17 = CFSTR("nil");
  v35[0] = CFSTR("MessageGUID");
  v35[1] = CFSTR("Source");
  if (a4)
    v18 = (const __CFString *)a4;
  else
    v18 = CFSTR("nil");
  v36[0] = v17;
  v36[1] = v18;
  if (a5)
    v16 = (const __CFString *)a5;
  v36[2] = v16;
  v35[2] = CFSTR("Target");
  v35[3] = CFSTR("ConversationType");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = (__CFString *)a10;
  v21 = a9;
  v22 = a8;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v19, "numberWithUnsignedInteger:", a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v26;
  v35[4] = CFSTR("MessageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v22)
    v29 = v22;
  else
    v29 = &unk_1E3FFE3F0;
  v36[4] = v27;
  v36[5] = v29;
  v35[5] = CFSTR("SendDuration");
  v35[6] = CFSTR("Error");
  if (v21)
    v30 = v21;
  else
    v30 = &unk_1E3FFE3F0;
  v35[7] = CFSTR("Protocol");
  v31 = CFSTR("Unknown");
  if (v20)
    v31 = v20;
  v36[6] = v30;
  v36[7] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 8, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "logEvent:data:", CFSTR("iMessageSent"), v32);
}

- (void)logMessageReceivedWithGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 conversationType:(unint64_t)a6 messageType:(unint64_t)a7 messageProtocol:(id)a8
{
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("nil");
  if (a3)
    v15 = (const __CFString *)a3;
  else
    v15 = CFSTR("nil");
  v27[0] = CFSTR("MessageGUID");
  v27[1] = CFSTR("Source");
  if (a4)
    v16 = (const __CFString *)a4;
  else
    v16 = CFSTR("nil");
  v28[0] = v15;
  v28[1] = v16;
  if (a5)
    v14 = (const __CFString *)a5;
  v28[2] = v14;
  v27[2] = CFSTR("Target");
  v27[3] = CFSTR("ConversationType");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = (__CFString *)a8;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v17, "numberWithUnsignedInteger:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v22;
  v27[4] = CFSTR("MessageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v27[5] = CFSTR("Protocol");
  v25 = CFSTR("Unknown");
  if (v18)
    v25 = v18;
  v28[4] = v23;
  v28[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMPowerLog logEvent:data:](self, "logEvent:data:", CFSTR("iMessageReceived"), v26);
}

- (void)logMessageDelivered:(id)a3 deliveryDuration:(id)a4 messageProtocol:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("DeliveryDuration");
  v13[1] = CFSTR("MessageGUID");
  v14[0] = a4;
  v14[1] = a3;
  v13[2] = CFSTR("Protocol");
  v14[2] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMPowerLog logEvent:data:](self, "logEvent:data:", CFSTR("iMessageDelivered Late Ack"), v12);
}

- (void)logMessageRead:(id)a3 messageProtocol:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("MessageGUID");
  v10[1] = CFSTR("Protocol");
  v11[0] = a3;
  v11[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMPowerLog logEvent:data:](self, "logEvent:data:", CFSTR("iMessageDelivered Late Ack"), v9);
}

- (void)logMessageSendFailureWithError:(id)a3
{
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = (const __CFString *)a3;
  else
    v4 = CFSTR("nil");
  v8 = CFSTR("Error");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMPowerLog logEvent:data:](self, "logEvent:data:", CFSTR("iMessageSent"), v7);
}

@end
