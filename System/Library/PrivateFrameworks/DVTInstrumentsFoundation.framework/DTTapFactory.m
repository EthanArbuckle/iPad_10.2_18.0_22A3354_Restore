@implementation DTTapFactory

+ (id)defaultFactory
{
  if (qword_25576FB20 != -1)
    dispatch_once(&qword_25576FB20, &unk_24EB27890);
  return (id)sTapFactory;
}

- (id)createNewTapWithConfig:(id)a3 connection:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  uint64_t v14;
  int v15;
  DTTapRemote *v16;
  id v17;
  uint64_t v18;
  DTTapMessageHandlerArchiver *v19;
  void *v20;
  DTKTraceTapLocalDelegate *v21;
  __objc2_class *v22;
  DTTapMemoHandler *v23;
  DTTapRemote *v24;
  DTKTraceTapLocalDelegate *v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DTTap_Option_MessageArchiveFileURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceName");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v9;
      v13 = v10;
      v14 = objc_opt_new();
      if (!v8)
      {
        v26 = -[DTKTraceTapLocalDelegate initWithConfig:]([DTKTraceTapLocalDelegate alloc], "initWithConfig:", v13);
        v19 = 0;
        v15 = -1;
LABEL_35:

        if (v11)
        {
          if (v19)
            sub_222BC6A2C();
          v19 = -[DTTapMessageHandlerArchiver initWithConfig:archiveURL:]([DTTapMessageHandlerArchiver alloc], "initWithConfig:archiveURL:", v10, v11);
        }
        v23 = -[DTTapMemoHandler initWithConfig:delegate:]([DTTapMemoHandler alloc], "initWithConfig:delegate:", v10, v14);
        v20 = (void *)v14;
        if (v8)
        {
          if (v12)
          {
            objc_msgSend(v10, "setServiceName:", v12);
            objc_msgSend(v10, "setServiceVersion:", v15);
            v24 = -[DTTapRemote initWithConfig:memoHandler:messageHandler:connection:]([DTTapRemote alloc], "initWithConfig:memoHandler:messageHandler:connection:", v10, v23, v19, v8);
          }
          else
          {
            v24 = 0;
          }
          v21 = v26;
        }
        else
        {
          v21 = v26;
          v24 = -[DTTapLocal initWithConfig:memoHandler:delegate:]([DTTapLocal alloc], "initWithConfig:memoHandler:delegate:", v10, v23, v26);
        }
        v16 = v24;

        v9 = v27;
        goto LABEL_45;
      }
      if (v12)
      {
        v15 = objc_msgSend(v8, "remoteCapabilityVersion:", v12);
        if (v15 <= 0)
        {

LABEL_23:
          v19 = 0;
          v12 = 0;
LABEL_27:
          v26 = 0;
          goto LABEL_35;
        }
      }
      else
      {
        v12 = CFSTR("com.apple.instruments.server.services.coreprofilesessiontap");
        v15 = objc_msgSend(v8, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.coreprofilesessiontap"));
        if (v15 < 1)
          goto LABEL_23;
      }
      if (v11)
        v19 = 0;
      else
        v19 = -[DTKTraceTapMessageHandler initWithConfig:]([DTKTraceTapMessageHandler alloc], "initWithConfig:", v13);
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v9;
      v17 = v10;
      v18 = objc_opt_new();
      if (v8)
      {

        v15 = objc_msgSend(v8, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.activitytracetap"));
        if (v15 >= 1)
        {
          if (v11)
            v19 = 0;
          else
            v19 = -[DTTapMessageHandler initWithConfig:]([DTActivityTraceTapMessageHandler alloc], "initWithConfig:", v17);
          v26 = 0;
          v12 = CFSTR("com.apple.instruments.server.services.activitytracetap");
          goto LABEL_34;
        }
        goto LABEL_25;
      }
      v22 = DTActivityTraceTapLocalDelegate;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = 0;
        v19 = 0;
        v21 = 0;
        v16 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v27 = v9;
      v17 = v10;
      v18 = objc_opt_new();
      if (v8)
      {

        v15 = objc_msgSend(v8, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.sysmontap"));
        if (v15 >= 1)
        {
          if (v11)
            v19 = 0;
          else
            v19 = -[DTTapMessageHandler initWithConfig:]([DTSysmonTapMessageHandler alloc], "initWithConfig:", v17);
          v26 = 0;
          v12 = CFSTR("com.apple.instruments.server.services.sysmontap");
          goto LABEL_34;
        }
LABEL_25:
        v19 = 0;
        v12 = 0;
        v26 = 0;
LABEL_34:
        v14 = v18;
        goto LABEL_35;
      }
      v22 = DTSysmonTapLocalDelegate;
    }
    v26 = (DTKTraceTapLocalDelegate *)objc_msgSend([v22 alloc], "initWithConfig:", v17);
    v19 = 0;
    v15 = -1;
    goto LABEL_34;
  }
  v16 = 0;
LABEL_46:

  return v16;
}

@end
