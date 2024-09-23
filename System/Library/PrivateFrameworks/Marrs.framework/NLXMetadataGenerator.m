@implementation NLXMetadataGenerator

+ (id)createEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithRequester:(int)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint8_t v23[16];
  uint8_t buf[12];
  int v25;

  v25 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = os_log_create("com.apple.siri.marrs", "General");
  objc_msgSend(MEMORY[0x1E0D9FAB0], "convertFromUUID:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = AFDeviceSupportsSAE();
  v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v11)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v14, OS_LOG_TYPE_DEFAULT, "Device supports AssistantEngine flow, use incoming requestId as subRequestId for Marrs", buf, 2u);
    }
    v17 = 0;
    v18 = v15;
  }
  else
  {
    if (v16)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1C281A000, v14, OS_LOG_TYPE_DEFAULT, "Device does NOT support AssistantEngine flow, use incoming requestId as is for Marrs", v23, 2u);
    }
    v18 = 0;
    v17 = v15;
  }
  v19 = (void *)MEMORY[0x1E0D9FAC8];
  v20 = v15;
  objc_msgSend(v19, "createNLXClientEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithSubRequestId:andWithResultCandidateId:andWithRequester:", v13, v12, v17, v18, v10, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
