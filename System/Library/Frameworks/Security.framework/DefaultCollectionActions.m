@implementation DefaultCollectionActions

- (void)autoBugCaptureWithType:(id)a3 subType:(id)a4 domain:(id)a5
{
  +[SecABC triggerAutoBugCaptureWithType:subType:subtypeContext:domain:events:payload:detectedProcess:](SecABC, "triggerAutoBugCaptureWithType:subType:subtypeContext:domain:events:payload:detectedProcess:", a3, a4, 0, a5, 0, 0, 0);
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 attributes:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[SecTapToRadar initTapToRadar:description:radar:]([SecTapToRadar alloc], "initTapToRadar:description:radar:", v19, v18, v17);

  if (v23 && v14 && v15)
  {
    objc_msgSend(v20, "setComponentName:", v23);
    objc_msgSend(v20, "setComponentVersion:", v14);
    objc_msgSend(v20, "setComponentID:", v15);
  }
  if (v16 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v16))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 3, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
      objc_msgSend(v20, "setReason:", v22);

    }
  }
  objc_msgSend(v20, "trigger");

}

@end
