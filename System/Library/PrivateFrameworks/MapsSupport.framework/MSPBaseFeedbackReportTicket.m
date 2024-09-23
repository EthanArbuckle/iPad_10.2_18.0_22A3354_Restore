@implementation MSPBaseFeedbackReportTicket

- (MSPBaseFeedbackReportTicket)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4 userInfoType:(int64_t)a5
{
  id v9;
  id v10;
  MSPBaseFeedbackReportTicket *v11;
  MSPBaseFeedbackReportTicket *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPBaseFeedbackReportTicket;
  v11 = -[MSPBaseFeedbackReportTicket init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestParameters, a3);
    objc_storeStrong((id *)&v12->_traits, a4);
    v12->_userInfoType = a5;
  }

  return v12;
}

- (GEORPFeedbackUserInfo)userInfo
{
  GEORPFeedbackUserInfo *userInfo;
  int64_t userInfoType;
  GEORPFeedbackUserInfo *v5;
  GEORPFeedbackUserInfo *v6;
  void *v7;
  GEORPFeedbackUserInfo *v8;
  GEORPFeedbackUserInfo *v9;
  id v10;
  void *v11;
  void *v12;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    userInfoType = self->_userInfoType;
    if (userInfoType == 2)
    {
      v8 = (GEORPFeedbackUserInfo *)objc_alloc_init(MEMORY[0x1E0D273B8]);
      v9 = self->_userInfo;
      self->_userInfo = v8;

      v10 = objc_alloc_init(MEMORY[0x1E0D273D0]);
      -[GEORPFeedbackUserInfo setTdmUserInfo:](self->_userInfo, "setTdmUserInfo:", v10);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEORPFeedbackUserInfo tdmUserInfo](self->_userInfo, "tdmUserInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAnonymousUserId:", v11);

    }
    else
    {
      if (userInfoType != 1)
      {
        userInfo = 0;
        return userInfo;
      }
      v5 = (GEORPFeedbackUserInfo *)objc_alloc_init(MEMORY[0x1E0D273B8]);
      v6 = self->_userInfo;
      self->_userInfo = v5;

      objc_msgSend(MEMORY[0x1E0D273D8], "_credentialsForPrimaryICloudAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEORPFeedbackUserInfo setUserCredentials:](self->_userInfo, "setUserCredentials:", v7);
    }

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[MSPBaseFeedbackReportTicket submitWithCallbackQueue:handler:networkActivity:](self, "submitWithCallbackQueue:handler:networkActivity:", MEMORY[0x1E0C80D38], a3, a4);
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = (objc_class *)MEMORY[0x1E0D273A8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  -[MSPBaseFeedbackReportTicket requestParameters](self, "requestParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPBaseFeedbackReportTicket userInfo](self, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPBaseFeedbackReportTicket traits](self, "traits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v12, "initWithFeedbackRequestParameters:userInfo:traits:", v13, v14, v15);

  -[MSPBaseFeedbackReportTicket willSubmitRequestBlock](self, "willSubmitRequestBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MSPBaseFeedbackReportTicket willSubmitRequestBlock](self, "willSubmitRequestBlock");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v17)[2](v17, v21);

  }
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPBaseFeedbackReportTicket traits](self, "traits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ticketForFeedbackRequest:traits:", v21, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPBaseFeedbackReportTicket setTicket:](self, "setTicket:", v20);

  -[MSPBaseFeedbackReportTicket _submitWithCallbackQueue:handler:networkActivity:](self, "_submitWithCallbackQueue:handler:networkActivity:", v11, v10, v9);
}

- (void)_submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSPBaseFeedbackReportTicket ticket](self, "ticket");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v19[3] = &unk_1E6652218;
  v21 = v9;
  v20 = v8;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
  v16[3] = &unk_1E6652268;
  v17 = v20;
  v18 = v10;
  v13 = v20;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v11, "submitWithHandler:networkActivity:", v19, v16);

}

void __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    v17[3] = &unk_1E66521F0;
    v12 = v10;
    v21 = v12;
    v13 = v7;
    v18 = v13;
    v14 = v8;
    v19 = v14;
    v15 = v9;
    v20 = v15;
    if (v11)
    {
      dispatch_async(v11, v17);
      v16 = v20;
    }
    else
    {
      v16 = v15;
      (*((void (**)(id, id, id, id))v12 + 2))(v12, v13, v14, v15);
    }

  }
}

uint64_t __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_4;
    v7[3] = &unk_1E6652240;
    v5 = v2;
    v8 = v5;
    v9 = a2;
    if (v4)
    {
      dispatch_async(v4, v7);
      v6 = v8;
    }
    else
    {
      v6 = v5;
      (*((void (**)(id, uint64_t))v5 + 2))(v5, a2);
    }

  }
}

uint64_t __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)cancel
{
  GEOMapServiceFeedbackReportTicket *ticket;
  GEOMapServiceFeedbackReportTicket *v4;

  ticket = self->_ticket;
  if (ticket)
  {
    -[GEOMapServiceFeedbackReportTicket cancel](ticket, "cancel");
    v4 = self->_ticket;
    self->_ticket = 0;

  }
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (int64_t)userInfoType
{
  return self->_userInfoType;
}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (GEOMapServiceFeedbackReportTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (id)willSubmitRequestBlock
{
  return self->_willSubmitRequestBlock;
}

- (void)setWillSubmitRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willSubmitRequestBlock, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
