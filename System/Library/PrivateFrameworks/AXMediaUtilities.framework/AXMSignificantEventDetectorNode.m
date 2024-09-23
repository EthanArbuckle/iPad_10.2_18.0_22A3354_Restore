@implementation AXMSignificantEventDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "physicalMemory") > 0x773593FF;

  return v3;
}

+ (id)title
{
  return CFSTR("Significant Events Detector");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVN6Mb1ME89lyW3HpahkEygIGClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMSignificantEventDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMSignificantEventDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  VN6Mb1ME89lyW3HpahkEygIG *request;
  VN6Mb1ME89lyW3HpahkEygIG *v10;
  VN6Mb1ME89lyW3HpahkEygIG *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  float v20;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMSignificantEventDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v26, sel_evaluate_metrics_, v6, v7);
  context = (void *)MEMORY[0x1B5E128FC](v8);
  request = self->_request;
  if (!request)
  {
    v10 = (VN6Mb1ME89lyW3HpahkEygIG *)objc_alloc_init((Class)getVN6Mb1ME89lyW3HpahkEygIGClass());
    v11 = self->_request;
    self->_request = v10;

    request = self->_request;
  }
  v28[0] = request;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v12, v6, 0, v7, 0);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[VN6Mb1ME89lyW3HpahkEygIG results](self->_request, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "confidence");
        +[AXMSignificantEventDetectorNode addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMSignificantEventDetectorNode, "addSignificantEventResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v6, v19, 0, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(context);
}

+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  __CFString **v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  float v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  BOOL v39;
  _Unwind_Exception *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v11 = (_QWORD *)getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0;
  v45 = getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0;
  if (!getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0)
  {
    v12 = (void *)VisionLibrary_9();
    v11 = dlsym(v12, "VN3FNQUJVIs2puI1uPc9mxh7");
    v43[3] = (uint64_t)v11;
    getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0 = (uint64_t)v11;
  }
  _Block_object_dispose(&v42, 8);
  if (!v11)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_44:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_45:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_46:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_47:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_48;
  }
  if ((objc_msgSend(v10, "isEqualToString:", *v11, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryBlood;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v14 = (_QWORD *)getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0;
  v45 = getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0;
  if (!getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0)
  {
    v15 = (void *)VisionLibrary_9();
    v14 = dlsym(v15, "VNSY8t4EoTztuqIL02g8uVA0");
    v43[3] = (uint64_t)v14;
    getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0 = (uint64_t)v14;
  }
  _Block_object_dispose(&v42, 8);
  if (!v14)
    goto LABEL_44;
  if ((objc_msgSend(v10, "isEqualToString:", *v14, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryDemonstration;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v16 = (_QWORD *)getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0;
  v45 = getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0;
  if (!getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0)
  {
    v17 = (void *)VisionLibrary_9();
    v16 = dlsym(v17, "VN6XNMvaRunPpzWjGa9uUHD6");
    v43[3] = (uint64_t)v16;
    getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0 = (uint64_t)v16;
  }
  _Block_object_dispose(&v42, 8);
  if (!v16)
    goto LABEL_45;
  if ((objc_msgSend(v10, "isEqualToString:", *v16, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryDestruction;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v18 = (_QWORD *)getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0;
  v45 = getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0;
  if (!getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0)
  {
    v19 = (void *)VisionLibrary_9();
    v18 = dlsym(v19, "VN4QuphG8kE4qDaDycivBkX5");
    v43[3] = (uint64_t)v18;
    getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0 = (uint64_t)v18;
  }
  _Block_object_dispose(&v42, 8);
  if (!v18)
    goto LABEL_46;
  if ((objc_msgSend(v10, "isEqualToString:", *v18, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFireDevastation;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v20 = (_QWORD *)getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0;
  v45 = getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0;
  if (!getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0)
  {
    v21 = (void *)VisionLibrary_9();
    v20 = dlsym(v21, "VN7gQUejje8mmnE9GSTsVBVV");
    v43[3] = (uint64_t)v20;
    getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0 = (uint64_t)v20;
  }
  _Block_object_dispose(&v42, 8);
  if (!v20)
    goto LABEL_47;
  if ((objc_msgSend(v10, "isEqualToString:", *v20, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFloodDevastation;
    goto LABEL_39;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v22 = (_QWORD *)getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0;
  v45 = getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0;
  if (!getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0)
  {
    v23 = (void *)VisionLibrary_9();
    v22 = dlsym(v23, "VNa9xpOJNvRoaW9plFGZ9Eo0");
    v43[3] = (uint64_t)v22;
    getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0 = (uint64_t)v22;
  }
  _Block_object_dispose(&v42, 8);
  if (!v22)
  {
LABEL_48:
    v41 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v41);
  }
  if ((objc_msgSend(v10, "isEqualToString:", *v22, v42) & 1) != 0)
  {
    v13 = AXMSignificantEventCategoryFuneral;
  }
  else
  {
    getVN2vIWnsZbk4Su55oeWfKDq1_0();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "isEqualToString:", v24);

    if ((v25 & 1) != 0)
    {
      v13 = AXMSignificantEventCategoryHospital;
    }
    else
    {
      getVNmNJnu0xlW8CZXt6hJ7Rpb0_0();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v10, "isEqualToString:", v26);

      if ((v27 & 1) != 0)
      {
        v13 = AXMSignificantEventCategoryReligiousSetting;
      }
      else
      {
        getVN35FOB1QhtSfYGRIJvTgtTq_0();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v10, "isEqualToString:", v28);

        if ((v29 & 1) != 0)
        {
          v13 = AXMSignificantEventCategoryVehicleCrash;
        }
        else
        {
          getVN6ZsEIQ9ri2eF1vhsxw5COm_0();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v10, "isEqualToString:", v30);

          if (!v31)
          {
LABEL_41:
            v39 = 0;
            goto LABEL_42;
          }
          v13 = &AXMSignificantEventCategoryWar;
        }
      }
    }
  }
LABEL_39:
  v32 = *v13;
  if (!v32)
    goto LABEL_41;
  v33 = v32;
  objc_msgSend(v9, "size");
  v36 = v35;
  v34 = a5;
  *(float *)&v35 = v34;
  +[AXMVisionFeature significantEventClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "significantEventClassificationWithCategory:confidence:canvasSize:", v33, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCaptionMayContainSensitiveContent:", v6);
  objc_msgSend(v9, "appendFeature:", v38);

  v39 = 1;
LABEL_42:

  return v39;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifySignificantEventRequestSoft was nil", v1, 2u);
}

@end
