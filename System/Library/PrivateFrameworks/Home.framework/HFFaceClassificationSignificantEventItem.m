@implementation HFFaceClassificationSignificantEventItem

+ (id)dateFormatter
{
  if (qword_1ED379230 != -1)
    dispatch_once(&qword_1ED379230, &__block_literal_global_126);
  return (id)_MergedGlobals_270;
}

uint64_t __57__HFFaceClassificationSignificantEventItem_dateFormatter__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "relativeDateFormatter");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_270;
  _MergedGlobals_270 = v1;

  return objc_msgSend((id)_MergedGlobals_270, "setTimeStyle:", 0);
}

- (HFFaceClassificationSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  HFFaceClassificationSignificantEventItem *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "faceClassification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    NSLog(CFSTR("Event %@ is missing a face classification"), v6);
  objc_msgSend(v6, "faceClassification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    HFLogForCategory(0x13uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Event %@ is missing a face classification", buf, 0xCu);
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)HFFaceClassificationSignificantEventItem;
  v11 = -[HFCameraClipSignificantEventItem initWithSignificantEvent:home:](&v13, sel_initWithSignificantEvent_home_, v6, v7);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFFaceClassificationSignificantEventItem *v4;
  void *v5;
  void *v6;
  HFFaceClassificationSignificantEventItem *v7;
  void *v8;

  v4 = [HFFaceClassificationSignificantEventItem alloc];
  -[HFCameraClipSignificantEventItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraClipSignificantEventItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFFaceClassificationSignificantEventItem initWithSignificantEvent:home:](v4, "initWithSignificantEvent:home:", v5, v6);

  -[HFFaceClassificationSignificantEventItem faceCropImage](self, "faceCropImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFFaceClassificationSignificantEventItem setFaceCropImage:](v7, "setFaceCropImage:", v8);

  return v7;
}

- (HMFaceClassification)faceClassification
{
  void *v2;
  void *v3;

  -[HFCameraClipSignificantEventItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFaceClassification *)v3;
}

- (HMPerson)person
{
  void *v2;
  void *v3;
  void *v4;

  -[HFCameraClipSignificantEventItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPerson *)v4;
}

- (HMPersonManager)personManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFCameraClipSignificantEventItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFFaceClassificationSignificantEventItem faceClassification](self, "faceClassification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_personManagerWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMPersonManager *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  objc_super v19;
  id location;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFCameraClipSignificantEventItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personManagerSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFaceClassificationEnabled");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v19.receiver = self;
    v19.super_class = (Class)HFFaceClassificationSignificantEventItem;
    -[HFCameraClipSignificantEventItem _subclass_updateWithOptions:](&v19, sel__subclass_updateWithOptions_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke;
    v15[3] = &unk_1EA736458;
    objc_copyWeak(&v18, &location);
    v16 = v4;
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "flatMap:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    v21 = CFSTR("hidden");
    v22[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithResult:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

id __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2;
  v8[3] = &unk_1EA736430;
  objc_copyWeak(&v12, a1 + 6);
  v5 = v3;
  v9 = v5;
  v10 = a1[4];
  v11 = a1[5];
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v6;
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HFPersonItemUpdateRequest *v30;
  void *v31;
  HFPersonItemUpdateRequest *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  char v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];

  v73[2] = *MEMORY[0x1E0C80C00];
  v48 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v49 = (void *)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(WeakRetained, "faceClassification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v13 = v49;
    objc_msgSend(v49, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    objc_msgSend(v48, "finishWithResult:", v49);
    goto LABEL_20;
  }
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", HFItemUpdateOptionFullUpdateIndicated);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(WeakRetained, "faceCropImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      if ((v17 & 1) == 0)
        goto LABEL_4;
    }
    objc_msgSend(WeakRetained, "faceCropImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v18);

    v15 = 0;
    v12 = 0;
    v47 = v7;
    goto LABEL_13;
  }

LABEL_4:
  objc_msgSend(WeakRetained, "cameraProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_faceCropImageForSignificantEvent:", v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_3;
    v70[3] = &unk_1EA727188;
    v71 = a1[6];
    v72 = WeakRetained;
    objc_msgSend(v11, "afterDelay:performBlock:", v70, 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v15 = 1;
LABEL_13:
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_9;
  v65[3] = &unk_1EA7363B8;
  objc_copyWeak(&v68, a1 + 7);
  v69 = v15;
  v19 = v49;
  v66 = v19;
  v45 = v6;
  v67 = v45;
  v20 = (id)objc_msgSend(v47, "addCompletionBlock:", v65);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_12;
  v63[3] = &unk_1EA72CBB8;
  v44 = v12;
  v64 = v44;
  v21 = (id)objc_msgSend(v47, "addCompletionBlock:", v63);
  objc_msgSend(WeakRetained, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "faceClassification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "personManagerUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_personManagerWithIdentifier:", v24);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_opt_class();
  objc_msgSend(v25, "numberWithBool:", objc_opt_isKindOfClass() & 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("HFPersonResultIsHomeOriginatedKey"));

  objc_msgSend(WeakRetained, "faceClassification");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "person");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v30 = [HFPersonItemUpdateRequest alloc];
    objc_msgSend(WeakRetained, "home");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[HFPersonItemUpdateRequest initWithPerson:personManager:home:](v30, "initWithPerson:personManager:home:", v28, v46, v31);

    v33 = (void *)objc_msgSend(a1[5], "mutableCopy");
    objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], HFPersonItemUpdateOptionSkipFaceCrop);
    if (a1[6])
    {
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_17;
      v60[3] = &unk_1EA727188;
      v61 = a1[6];
      v62 = WeakRetained;
      objc_msgSend(v34, "afterDelay:performBlock:", v60, 10.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = 0;
    }
    -[HFPersonItemUpdateRequest updateWithOptions:](v32, "updateWithOptions:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_18;
    v56[3] = &unk_1EA7363E0;
    v36 = v35;
    v57 = v36;
    v58 = v19;
    v59 = v45;
    objc_msgSend(v37, "addCompletionBlock:", v56);
    v38 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v38;
  }
  else
  {
    v36 = 0;
  }
  v39 = (void *)MEMORY[0x1E0D519C0];
  v73[0] = v47;
  v73[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "chainFutures:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_21;
  v50[3] = &unk_1EA736408;
  v51 = v19;
  v42 = v45;
  v52 = v42;
  v53 = v48;
  v54 = a1[6];
  v55 = WeakRetained;
  v43 = (id)objc_msgSend(v41, "addCompletionBlock:", v50);

  objc_destroyWeak(&v68);
  v13 = v49;
LABEL_20:

}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  os_activity_scope_state_s state;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v2, "loggerActivity");
    v3 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v3, &state);

    HFLogForCategory(0x29uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Face crop update is taking more than 10 seconds: %@", (uint8_t *)&v8, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Face crop update is taking more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }

  }
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(WeakRetained, "setFaceCropImage:", v5);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("HFPersonResultFaceCropImageKey"));
    objc_msgSend(v8, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateOfOccurrence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("HFPersonResultFaceCropDateKey"));
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "faceClassification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "faceCrop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_setWithSafeObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, CFSTR("HFPersonResultFaceCropIdentifiersKey"));

    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromDate:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("description"));

    v19 = *(void **)(a1 + 40);
    objc_msgSend(v8, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "faceClassification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "faceCrop");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_safeAddObject:", v22);

  }
  else if (*(_BYTE *)(a1 + 56))
  {
    HFLogForCategory(0x13uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_ERROR, "%@: Unable to process face crop from significant event (error: %@)", (uint8_t *)&v24, 0x16u);
    }

  }
}

uint64_t __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_17(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  os_activity_scope_state_s state;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v2, "loggerActivity");
    v3 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v3, &state);

    HFLogForCategory(0x29uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Person update is taking more than 10 seconds: %@", (uint8_t *)&v8, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Person update is taking more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }

  }
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addResultsFromOutcome:", v5);
    v3 = *(void **)(a1 + 48);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v4);

  }
}

uint64_t __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_21(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  os_activity_scope_state_s state;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("dependentHomeKitObjects"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("HFPersonResultFaceCropImageKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v2)
    v5 = 0;
  else
    v5 = v4 == 0;
  if (!v5)
    return objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 32));
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v7, "loggerActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &state);

    HFLogForCategory(0x13uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 64);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Unable to display face crop or person: %@", (uint8_t *)&v13, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x13uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 64);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v12;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Unable to display face crop or person: %@", (uint8_t *)&state, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  return objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 32));
}

- (UIImage)faceCropImage
{
  return self->_faceCropImage;
}

- (void)setFaceCropImage:(id)a3
{
  objc_storeStrong((id *)&self->_faceCropImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropImage, 0);
}

@end
