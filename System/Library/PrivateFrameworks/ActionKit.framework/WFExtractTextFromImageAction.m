@implementation WFExtractTextFromImageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_24F8B8C50;
    v11 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_140;
    v9[3] = &unk_24F8BB050;
    v9[4] = v11;
    objc_msgSend(v8, "if_enumerateAsynchronouslyInSequence:completionHandler:", v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8BB4F0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  v8 = a2;
  objc_msgSend(v8, "getObjectRepresentations:forClass:", v9, objc_opt_class());

}

uint64_t __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  void *v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint8_t v47[128];
  _BYTE buf[24];
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v29 = a3;
  v30 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v10 = (void *)getVNRecognizeDocumentsRequestClass_softClass;
        v45 = getVNRecognizeDocumentsRequestClass_softClass;
        if (!getVNRecognizeDocumentsRequestClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getVNRecognizeDocumentsRequestClass_block_invoke;
          v49 = &unk_24F8BB430;
          v50 = &v42;
          __getVNRecognizeDocumentsRequestClass_block_invoke((uint64_t)buf);
          v10 = (void *)v43[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v42, 8);
        v12 = [v11 alloc];
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_4;
        v36[3] = &unk_24F8B64D0;
        v13 = *(id *)(a1 + 40);
        v36[4] = *(_QWORD *)(a1 + 32);
        v37 = v13;
        v14 = (void *)objc_msgSend(v12, "initWithCompletionHandler:", v36);
        objc_msgSend(v14, "setRecognitionLevel:", 0);
        objc_msgSend(v14, "setUsesLanguageDetection:", 1);
        objc_msgSend(v14, "setUsesLanguageCorrection:", 1);
        objc_msgSend(v14, "setMaximumCandidateCount:", 1);
        v35 = 0;
        objc_msgSend(v14, "supportedRecognitionLanguagesAndReturnError:", &v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v35;
        if (v15)
        {
          objc_msgSend(v14, "setRecognitionLanguages:", v15);
          getWFActionsLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            goto LABEL_14;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke_3";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          v18 = v17;
          v19 = OS_LOG_TYPE_INFO;
          v20 = "%s Supported detection languages: %@";
        }
        else
        {
          getWFActionsLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          v18 = v17;
          v19 = OS_LOG_TYPE_ERROR;
          v20 = "%s Error determining supported languages: %@";
        }
        _os_log_impl(&dword_22D353000, v18, v19, v20, buf, 0x16u);
LABEL_14:

        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v21 = (void *)getVNImageRequestHandlerClass_softClass;
        v45 = getVNImageRequestHandlerClass_softClass;
        if (!getVNImageRequestHandlerClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getVNImageRequestHandlerClass_block_invoke;
          v49 = &unk_24F8BB430;
          v50 = &v42;
          __getVNImageRequestHandlerClass_block_invoke((uint64_t)buf);
          v21 = (void *)v43[3];
        }
        v22 = objc_retainAutorelease(v21);
        _Block_object_dispose(&v42, 8);
        v23 = [v22 alloc];
        v24 = objc_msgSend(v9, "CGImage");
        v25 = (void *)objc_msgSend(v23, "initWithCGImage:options:", v24, MEMORY[0x24BDBD1B8]);
        v46 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v16;
        LOBYTE(v23) = objc_msgSend(v25, "performRequests:error:", v26, &v34);
        v27 = v34;

        if ((v23 & 1) == 0)
        {
          getWFActionsLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v27;
            _os_log_impl(&dword_22D353000, v28, OS_LOG_TYPE_ERROR, "%s Could not perform recognition request: %@", buf, 0x16u);
          }

        }
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v33);
  }

}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v17 = a1;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v11)
          {
            v23 = 0;
            v24 = &v23;
            v25 = 0x2050000000;
            v12 = (void *)getVNDocumentObservationClass_softClass;
            v26 = getVNDocumentObservationClass_softClass;
            if (!getVNDocumentObservationClass_softClass)
            {
              v22[0] = MEMORY[0x24BDAC760];
              v22[1] = 3221225472;
              v22[2] = __getVNDocumentObservationClass_block_invoke;
              v22[3] = &unk_24F8BB430;
              v22[4] = &v23;
              __getVNDocumentObservationClass_block_invoke((uint64_t)v22);
              v12 = (void *)v24[3];
            }
            v13 = objc_retainAutorelease(v12);
            _Block_object_dispose(&v23, 8);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "getTranscript");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "length"))
              {
                objc_msgSend(*(id *)(v17 + 32), "output");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BE19620], "itemWithObject:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addItem:", v16);

              }
            }
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(v17 + 40) + 16))();
    v6 = 0;
  }

}

@end
