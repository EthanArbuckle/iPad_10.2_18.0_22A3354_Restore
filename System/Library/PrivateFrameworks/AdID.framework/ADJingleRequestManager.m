@implementation ADJingleRequestManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ADJingleRequestManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_5 != -1)
    dispatch_once(&sharedInstance__onceToken_5, block);
  return (id)sharedInstance__instance_5;
}

void __40__ADJingleRequestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_5;
  sharedInstance__instance_5 = (uint64_t)v0;

}

- (ADJingleRequestManager)init
{
  ADJingleRequestManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingJingleRequests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADJingleRequestManager;
  v2 = -[ADJingleRequestManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingJingleRequests = v2->_pendingJingleRequests;
    v2->_pendingJingleRequests = v3;

  }
  return v2;
}

- (void)startJingleRequest:(id)a3
{
  id v4;
  NSMutableDictionary *pendingJingleRequests;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  pendingJingleRequests = self->_pendingJingleRequests;
  objc_msgSend(v4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingJingleRequests, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__ADJingleRequestManager_startJingleRequest___block_invoke;
  v9[3] = &unk_24D710270;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "addOperationWithBlock:", v9);

}

uint64_t __45__ADJingleRequestManager_startJingleRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send");
}

- (id)makeSegmentRequest:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ADJingleSegmentRequest *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8 && -[ADJingleRequestManager canMakeJingleRequest](self, "canMakeJingleRequest"))
  {
    v10 = [ADJingleSegmentRequest alloc];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke;
    v19[3] = &unk_24D710ED8;
    v19[4] = self;
    v20 = v9;
    v11 = -[ADJingleSegmentRequest init:forceSegments:withCompletion:](v10, "init:forceSegments:withCompletion:", v8, v6, v19);
    -[ADJingleRequestManager startJingleRequest:](self, "startJingleRequest:", v11);
    objc_msgSend(v11, "token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = -[ADJingleRequestManager canMakeJingleRequest](self, "canMakeJingleRequest");
    v16 = CFSTR("NO");
    if (v15)
      v16 = CFSTR("YES");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Unable to make Segment Request for DSID %@. Has activeDSIDRecord and Network Connection: %@"), v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v13 = 0;
  }

  return v13;
}

void __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke_2;
  v7[3] = &unk_24D710310;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v7);

}

uint64_t __74__ADJingleRequestManager_makeSegmentRequest_forceSegments_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "jingleRequestCompleted:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)canMakeJingleRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] There is no active DSID Record."), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDSIDRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)jingleRequestCompleted:(id)a3
{
  NSMutableDictionary *pendingJingleRequests;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;

  pendingJingleRequests = self->_pendingJingleRequests;
  v5 = a3;
  objc_msgSend(v5, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingJingleRequests, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_pendingJingleRequests;
    objc_msgSend(v5, "token");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v11);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "token");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringWithFormat:", CFSTR("Received a response to Jingle request %@, but the request has already timed out; this response will be ignored."),
      v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

- (void)authenticateUser:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ADJingleRequestManager_authenticateUser___block_invoke;
  v7[3] = &unk_24D7102E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __43__ADJingleRequestManager_authenticateUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(void);
  void *v20;
  uint64_t v21;
  id v22;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "educationModeEnabled"))
  {

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iTunesStoreAccount");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = objc_opt_class();
    if (v22)
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@]: Initiating Jingle authentication request."), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "authenticateAccountThroughAMSOperation:", v22);

      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        objc_msgSend(v22, "ams_DSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@]: Successfully authenticated account. The account is: %@"), v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        v18 = *(_QWORD *)(a1 + 40);
        if (v18)
        {
          v19 = *(void (**)(void))(v18 + 16);
LABEL_15:
          v19();
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@]: FILE A RADAR IMMEDIATELY: We have an active account but could not authenticate it."), v13);
    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@]: Jingle authentication request failed, ACAccount is (null)."), v8);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
    {
      v19 = *(void (**)(void))(v21 + 16);
      goto LABEL_15;
    }
LABEL_16:

    return;
  }
LABEL_4:
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
}

- (BOOL)jingleRequestInProgress
{
  return self->_jingleRequestInProgress;
}

- (void)setJingleRequestInProgress:(BOOL)a3
{
  self->_jingleRequestInProgress = a3;
}

- (NSMutableDictionary)pendingJingleRequests
{
  return self->_pendingJingleRequests;
}

- (void)setPendingJingleRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingJingleRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingJingleRequests, 0);
}

@end
