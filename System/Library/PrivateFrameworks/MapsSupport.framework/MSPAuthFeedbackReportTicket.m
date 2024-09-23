@implementation MSPAuthFeedbackReportTicket

- (id)_dataToSign
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[MSPBaseFeedbackReportTicket userInfoType](self, "userInfoType");
  if (v3 == 2)
  {
    -[MSPBaseFeedbackReportTicket userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tdmUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anonymousUserId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
    {
      v8 = 0;
      return v8;
    }
    -[MSPBaseFeedbackReportTicket userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userCredentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icloudUserPersonId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char BOOL;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSPAuthFeedbackReportTicket _dataToSign](self, "_dataToSign");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    BOOL = GEOConfigGetBOOL();
    GEOConfigGetDouble();
    v14 = v13;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__MSPAuthFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
    v17[3] = &unk_1E6654520;
    v19 = v9;
    v17[4] = self;
    v18 = v8;
    v20 = v10;
    MSPUGCFetchClientCertificate(CFSTR("com.apple.Maps.CommunityID"), v11, v11, BOOL, v17, v14);

    v15 = v19;
  }
  else
  {
    MSPGetMSPAuthFeedbackReportTicketLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_ERROR, "No data to sign", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("No data to sign"), -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v15);
  }

}

void __79__MSPAuthFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    MSPGetMSPAuthFeedbackReportTicketLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "Failed certificate fetch with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tdmUserInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D273D0]);
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTdmUserInfo:", v13);

    }
    v15 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tdmUserInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBaaCertificates:", v15);

    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tdmUserInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBaaSignature:", v8);

    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v23.receiver = *(id *)(a1 + 32);
    v23.super_class = (Class)MSPAuthFeedbackReportTicket;
    objc_msgSendSuper2(&v23, sel_submitWithCallbackQueue_handler_networkActivity_, v20, v21, v22);
  }

}

@end
