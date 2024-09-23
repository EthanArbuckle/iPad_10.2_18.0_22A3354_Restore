@implementation ULTapToRadar

+ (void)createRadarWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(id)a5 classification:(int64_t)a6 reproducibility:(int64_t)a7 title:(id)a8 description:(id)a9 extensionIDs:(id)a10 processName:(id)a11 displayReason:(id)a12 isUserInitiated:(BOOL)a13 completionHandler:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(id, void *);
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v34;
  id v35;

  v35 = a3;
  v17 = a4;
  v18 = a5;
  v34 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = (void (**)(id, void *))a14;
  if (+[ULPlatform isInternalInstall](ULPlatform, "isInternalInstall")
    && getTapToRadarServiceClass()
    && (Class)getRadarDraftClass[0]()
    && (Class)getRadarComponentClass[0]())
  {
    v24 = objc_alloc((Class)getRadarComponentClass[0]());
    v25 = v18;
    v26 = objc_msgSend(v18, "integerValue");
    v27 = v17;
    v28 = (void *)objc_msgSend(v24, "initWithName:version:identifier:", v35, v17, v26);
    getRadarDraftClass[0]();
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setComponent:", v28);
    objc_msgSend(v29, "setClassification:", objc_msgSend(a1, "_classificationFromULTapToRadarClassification:", a6));
    objc_msgSend(v29, "setReproducibility:", objc_msgSend(a1, "_reproducibilityFromULTapToRadarReproducibility:", a7));
    objc_msgSend(v29, "setTitle:", v34);
    objc_msgSend(v29, "setProblemDescription:", v19);
    objc_msgSend(v29, "setDiagnosticExtensionIDs:", v20);
    objc_msgSend(v29, "setIsUserInitiated:", a13);
    -[objc_class shared](getTapToRadarServiceClass(), "shared");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v29, v21, v22, v23);

  }
  else
  {
    v25 = v18;
    v27 = v17;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TTR not supported"), -1, 0, a6, a1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v28);
  }

}

+ (int64_t)_classificationFromULTapToRadarClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xA)
    return 0;
  else
    return a3;
}

+ (int64_t)_reproducibilityFromULTapToRadarReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6)
    return 0;
  else
    return a3;
}

@end
