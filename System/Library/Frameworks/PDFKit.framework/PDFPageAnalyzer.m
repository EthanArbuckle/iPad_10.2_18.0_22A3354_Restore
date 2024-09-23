@implementation PDFPageAnalyzer

+ (PDFPageAnalyzer)sharedInstance
{
  if (+[PDFPageAnalyzer sharedInstance]::onceToken != -1)
    dispatch_once(&+[PDFPageAnalyzer sharedInstance]::onceToken, &__block_literal_global_3);
  return (PDFPageAnalyzer *)(id)+[PDFPageAnalyzer sharedInstance]::sharedInstance;
}

void __33__PDFPageAnalyzer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[PDFPageAnalyzer sharedInstance]::sharedInstance;
  +[PDFPageAnalyzer sharedInstance]::sharedInstance = v0;

}

- (PDFPageAnalyzer)init
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v18.receiver = self;
  v18.super_class = (Class)PDFPageAnalyzer;
  v2 = -[PDFPageAnalyzer init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("PDFKit.PDFPageAnalyzer.workQueue", v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = dispatch_queue_create("PDFKit.PDFPageAnalyzer.analyzerCallbackQueue", v4);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v9 = (void *)getVKImageAnalyzerClass(void)::softClass;
    v23 = getVKImageAnalyzerClass(void)::softClass;
    if (!getVKImageAnalyzerClass(void)::softClass)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = ___ZL23getVKImageAnalyzerClassv_block_invoke;
      v19[3] = &unk_24C25CA98;
      v19[4] = &v20;
      ___ZL23getVKImageAnalyzerClassv_block_invoke((uint64_t)v19);
      v9 = (void *)v21[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v20, 8);
    v11 = objc_msgSend([v10 alloc], "init");
    v12 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v11;

    objc_msgSend(*((id *)v2 + 3), "setCallbackQueue:", *((_QWORD *)v2 + 2));
    v13 = dispatch_semaphore_create(8);
    v14 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v13;

    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v15;

    *((_QWORD *)v2 + 14) = 0x4000000000000000;
  }
  return (PDFPageAnalyzer *)v2;
}

- (void)analyzePage:(id)a3 analysisTypes:(unint64_t)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  std::mutex *v13;
  void *v14;
  uint64_t v15;
  CFAbsoluteTime Current;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38[4];
  id location;
  _QWORD v40[3];
  char v41;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = (std::mutex *)((char *)self + 48);
    std::mutex::lock((std::mutex *)((char *)self + 48));
    objc_msgSend(v10, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexForPage:", v10);

    Current = CFAbsoluteTimeGetCurrent();
    v17 = (void *)(v15 + 1);
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePage: (page #%lu) START", v18, v19, v20, v21, v22, (uint64_t)v17);
    LODWORD(v14) = objc_msgSend(v10, "didPerformOCR");
    v23 = objc_msgSend(v10, "didPerformFormDetection");
    v24 = a4 & 0xFFFFFFFFFFFFFFFELL;
    if (!(_DWORD)v14)
      v24 = a4;
    if (v23)
      v25 = (void *)(v24 & 0xFFFFFFFFFFFFFFFDLL);
    else
      v25 = (void *)v24;
    if (v25)
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v41 = 0;
      if ((objc_msgSend(*((id *)self + 5), "containsObject:", v10) & 1) == 0)
      {
        objc_msgSend(*((id *)self + 5), "addObject:", v10);
        objc_initWeak(&location, self);
        v26 = *((_QWORD *)self + 1);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke;
        block[3] = &unk_24C25C9A8;
        objc_copyWeak(v38, &location);
        v38[1] = v17;
        v38[2] = *(id *)&Current;
        v27 = v10;
        v38[3] = v25;
        v34 = v27;
        v37 = v40;
        v36 = v12;
        v35 = v11;
        dispatch_async(v26, block);

        objc_destroyWeak(v38);
        objc_destroyWeak(&location);
      }
      _Block_object_dispose(v40, 8);
    }
    else
    {
      -[PDFPageAnalyzer _callCompletionBlock:onQueue:analysis:error:foundTable:](self, "_callCompletionBlock:onQueue:analysis:error:foundTable:", v12, v11, 0, 0, 0);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePage (page #%lu): (analysisTypes == 0), DONE (+%g secs)", v28, v29, v30, v31, v32, (uint64_t)v17);
    }
    std::mutex::unlock(v13);
  }

}

void __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGColorSpaceRef v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  uint64_t v65;
  _QWORD v66[5];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  WeakRetained[120] = GetDefaultsWriteDrawOCRQuads();
  v3 = *(_QWORD *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) generating page image (+%g secs)", v4, v5, v6, v7, v8, v3);
  objc_msgSend(*(id *)(a1 + 32), "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderingProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v10, "displayBox");
  objc_msgSend(*(id *)(a1 + 32), "boundsForBox:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = PDFPointScale(v16, v18, *((double *)WeakRetained + 14));
  v22 = v21;
  v71[0] = CFSTR("PDFPageImageProperty_ColorSpace");
  v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF290]);
  v71[1] = CFSTR("PDFPageImageProperty_ForOCR");
  v72[0] = v23;
  v72[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "imageOfSize:forBox:withOptions:", v11, v24, v20, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v68 = &v67;
  v69 = 0x2050000000;
  v26 = (void *)getVKImageAnalyzerRequestClass(void)::softClass;
  v70 = getVKImageAnalyzerRequestClass(void)::softClass;
  v27 = MEMORY[0x24BDAC760];
  if (!getVKImageAnalyzerRequestClass(void)::softClass)
  {
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = ___ZL30getVKImageAnalyzerRequestClassv_block_invoke;
    v66[3] = &unk_24C25CA98;
    v66[4] = &v67;
    ___ZL30getVKImageAnalyzerRequestClassv_block_invoke((uint64_t)v66);
    v26 = (void *)v68[3];
  }
  v28 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v67, 8);
  v29 = (void *)objc_msgSend([v28 alloc], "initWithImage:requestType:", v25, 1);
  objc_msgSend(v29, "set_wantsFormFieldDetection:", (*(_QWORD *)(a1 + 88) & 6) != 0);
  CFAbsoluteTimeGetCurrent();
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)WeakRetained + 4), 0xFFFFFFFFFFFFFFFFLL);
  v30 = *(_QWORD *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) GOT workload semaphore after (%g) sec wait (+%g secs)", v31, v32, v33, v34, v35, v30);
  v36 = *(_QWORD *)(a1 + 72);
  CFAbsoluteTimeGetCurrent();
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request BEGIN (+%g secs)", v37, v38, v39, v40, v41, v36);
  v42 = (void *)*((_QWORD *)WeakRetained + 3);
  v53[0] = v27;
  v53[1] = 3221225472;
  v53[2] = __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke_2;
  v53[3] = &unk_24C25C980;
  v43 = *(_QWORD *)(a1 + 72);
  v53[4] = WeakRetained;
  v58 = v43;
  v59 = *(_QWORD *)(a1 + 80);
  v60 = *(_QWORD *)(a1 + 88);
  v44 = v25;
  v54 = v44;
  v61 = v13;
  v62 = v15;
  v63 = v17;
  v64 = v19;
  v55 = *(id *)(a1 + 32);
  v65 = v11;
  v52 = *(_OWORD *)(a1 + 48);
  v45 = (id)v52;
  v57 = v52;
  v56 = *(id *)(a1 + 40);
  if (!objc_msgSend(v42, "processRequest:progressHandler:completionHandler:", v29, 0, v53))
  {
    v46 = *(_QWORD *)(a1 + 72);
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu)  [VKImageAnalyzer processRequest:] returned 0(+%g secs)", v47, v48, v49, v50, v51, v46);
    std::mutex::lock((std::mutex *)(WeakRetained + 48));
    objc_msgSend(*((id *)WeakRetained + 5), "removeObject:", *(_QWORD *)(a1 + 32));
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 4));
    std::mutex::unlock((std::mutex *)(WeakRetained + 48));
  }

}

void __77__PDFPageAnalyzer_analyzePage_analysisTypes_completionQueue_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int IsVisionKitFormDetectionEnabled;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  std::mutex *v45;
  id v46;

  v46 = a2;
  v5 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
  v6 = *(_QWORD *)(a1 + 80);
  if (v46)
  {
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request COMPLETED (+%g secs)", v7, v8, v9, v10, v11, v6);
    v12 = *(_QWORD *)(a1 + 96);
    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addTextFromAnalysis:ofImage:bounds:toPage:", v46, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      objc_msgSend(*(id *)(a1 + 48), "setDidPerformOCR:", 1);
      v13 = *(_QWORD *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) OCR digestion COMPLETED (+%g secs)", v14, v15, v16, v17, v18, v13);
      v12 = *(_QWORD *)(a1 + 96);
    }
    if ((v12 & 2) != 0)
    {
      v19 = (id)objc_msgSend(*(id *)(a1 + 48), "annotations");
      IsVisionKitFormDetectionEnabled = PDFKitIsVisionKitFormDetectionEnabled();
      v21 = *(void **)(a1 + 32);
      if (IsVisionKitFormDetectionEnabled)
      {
        objc_msgSend(v21, "_addFormElementsFromAnalysis:bounds:toPage:", v46, *(_QWORD *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addTableFromAnalysis:bounds:toPDFPage:", v46, *(_QWORD *)(a1 + 48), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      }
      else
      {
        objc_msgSend(v21, "_addFormElementsUsingDetectorToPage:displayBox:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 136));
      }
      v27 = *(_QWORD *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Form detection COMPLETED (+%g secs)", v28, v29, v30, v31, v32, v27);
      objc_msgSend(*(id *)(a1 + 48), "setDidPerformFormDetection:", 1);
      v12 = *(_QWORD *)(a1 + 96);
    }
    if ((v12 & 4) != 0)
    {
      v33 = *(_QWORD *)(a1 + 80);
      CFAbsoluteTimeGetCurrent();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Minimal analysis COMPLETED (+%g secs)", v34, v35, v36, v37, v38, v33);
    }
    objc_msgSend(*(id *)(a1 + 32), "_callCompletionBlock:onQueue:analysis:error:foundTable:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v46, 0, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v39 = *(_QWORD *)(a1 + 80);
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Completion block COMPLETED (+%g secs)", v40, v41, v42, v43, v44, v39);
  }
  else
  {
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"analyzePageBlock: (page #%lu) Analyzer request FAILED (+%g secs)", v22, v23, v24, v25, v26, v6);
    objc_msgSend(*(id *)(a1 + 32), "_callCompletionBlock:onQueue:analysis:error:foundTable:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), 0, v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  }
  v45 = (std::mutex *)(*(_QWORD *)(a1 + 32) + 48);
  std::mutex::lock(v45);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 48));
  std::mutex::unlock(v45);

}

- (void)proposedFormFieldBoundsNearestPoint:(CGPoint)a3 onPage:(id)a4 completionBlock:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PDFPageAnalyzer *v16;
  id v17;
  _QWORD *v18;
  CGFloat v19;
  CGFloat v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x5012000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v21[5] = &unk_209DCC48F;
  v11 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v22 = *MEMORY[0x24BDBF070];
  v23 = v11;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke;
  v14[3] = &unk_24C25C9F8;
  v15 = v9;
  v16 = self;
  v19 = x;
  v20 = y;
  v17 = v10;
  v18 = v21;
  v12 = v10;
  v13 = v9;
  -[PDFPageAnalyzer analyzePage:analysisTypes:completionQueue:completionBlock:](self, "analyzePage:analysisTypes:completionQueue:completionBlock:", v13, 4, 0, v14);

  _Block_object_dispose(v21, 8);
}

void __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double b;
  double a;
  double d;
  double c;
  double ty;
  double tx;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  _QWORD block[4];
  id v52;
  uint64_t v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  NSPoint v58;
  NSPoint v59;
  CGRect v60;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderingProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "boundsForBox:", objc_msgSend(v9, "displayBox"));
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    memset(&v57, 0, sizeof(v57));
    v18 = (void *)objc_opt_class();
    if (v18)
      objc_msgSend(v18, "_normalizedToPageTransformForPageWithBounds:", v11, v13, v15, v17);
    else
      memset(&v57, 0, sizeof(v57));
    v49 = v17;
    v50 = v15;
    v55 = v57;
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformInvert(&v56, &v55);
    v19 = *(double *)(a1 + 64);
    v20 = *(double *)(a1 + 72);
    a = v56.a;
    b = v56.b;
    c = v56.c;
    d = v56.d;
    tx = v56.tx;
    ty = v56.ty;
    v58.x = v19;
    v58.y = v20;
    NSStringFromPoint(v58);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = ty + v20 * d + b * v19;
    v29 = tx + v20 * c + a * v19;
    v59.x = v29;
    v59.y = v28;
    NSStringFromPoint(v59);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"proposedFormField: pagePoint = %@, normalizedPoint = %@", v30, v31, v32, v33, v34, (uint64_t)v27);

    v35 = PDFPointScale(v50, v49, *(double *)(*(_QWORD *)(a1 + 40) + 112));
    objc_msgSend(v5, "proposedFormRegionForPoint:existingFields:formSize:", 0, v29, v28, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "quad");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "boundingBox");
      v54 = v57;
      *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = CGRectApplyAffineTransform(v60, &v54);

      NSStringFromRect(*(NSRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"proposedFormField: formRegion bounds: %@", v41, v42, v43, v44, v45, (uint64_t)v40);

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke_2;
  block[3] = &unk_24C25C9D0;
  v46 = *(id *)(a1 + 48);
  v47 = *(_QWORD *)(a1 + 56);
  v52 = v46;
  v53 = v47;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __78__PDFPageAnalyzer_proposedFormFieldBoundsNearestPoint_onPage_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 72));
}

- (void)_callCompletionBlock:(id)a3 onQueue:(id)a4 analysis:(id)a5 error:(id)a6 foundTable:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __74__PDFPageAnalyzer__callCompletionBlock_onQueue_analysis_error_foundTable___block_invoke;
      v15[3] = &unk_24C25CA20;
      v18 = v11;
      v16 = v13;
      v17 = v14;
      v19 = v7;
      dispatch_async(v12, v15);

    }
    else
    {
      (*((void (**)(id, id, id, _BOOL8))v11 + 2))(v11, v13, v14, v7);
    }
  }

}

uint64_t __74__PDFPageAnalyzer__callCompletionBlock_onQueue_analysis_error_foundTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void)_addTextFromAnalysis:(id)a3 ofImage:(id)a4 bounds:(CGRect)a5 toPage:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  CGPDFDictionary *v16;
  CGPDFDictionary *v17;
  CGPDFDictionary *Mutable;
  CGPDFDictionary *v19;
  CGPDFDictionary *v20;
  CGPDFDictionary *v21;
  CGPDFDictionary *v22;
  CGPDFPage *Page;
  CGPDFDictionary *Dictionary;
  CGPDFStreamRef stream;
  CGPDFDictionaryRef dict;
  CGPDFDictionaryRef value[8];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (CGPDFDictionary *)CGDisplayListCreate();
  value[7] = v16;
  v17 = (CGPDFDictionary *)CGDisplayListContextCreate();
  value[6] = v17;
  -[PDFPageAnalyzer _drawTextFromAnalysis:ofImage:intoContext:withBounds:](self, "_drawTextFromAnalysis:ofImage:intoContext:withBounds:", v13, v14, v17, x, y, width, height);
  CGContextFlush(v17);
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  value[5] = Mutable;
  v19 = CGDataConsumerCreateWithCFData(Mutable);
  value[4] = v19;
  v20 = CGPDFContextCreate(v19, 0, 0);
  value[3] = v20;
  CGPDFContextBeginPage(v20, 0);
  CGContextDrawDisplayList();
  CGPDFContextEndPage(v20);
  CGPDFContextClose(v20);
  v21 = CGDataProviderCreateWithCFData(Mutable);
  value[2] = v21;
  v22 = CGPDFDocumentCreateWithProvider(v21);
  value[1] = v22;
  Page = CGPDFDocumentGetPage(v22, 1uLL);
  Dictionary = CGPDFPageGetDictionary(Page);
  value[0] = 0;
  if (CGPDFDictionaryGetDictionary(Dictionary, "Resources", value))
  {
    dict = 0;
    if (CGPDFDictionaryGetDictionary(value[0], "XObject", &dict))
    {
      stream = 0;
      if (CGPDFDictionaryGetStream(dict, "Fm1", &stream))
      {
        CGPDFStreamGetDictionary(stream);
        objc_msgSend(v15, "setExtraContentStream:steamDocument:", stream, v22);
      }
    }
  }
  if (v22)
    CFRelease(v22);
  if (v21)
    CFRelease(v21);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (Mutable)
    CFRelease(Mutable);
  if (v17)
    CFRelease(v17);
  if (v16)
    CFRelease(v16);

}

- (BOOL)_addTableFromAnalysis:(id)a3 bounds:(CGRect)a4 toPDFPage:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  void *v43;
  id v44;
  char inserted;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t i;
  CGAffineTransform v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGAffineTransform v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CGAffineTransform v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v76 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v55 = a5;
  memset(&v73, 0, sizeof(v73));
  v10 = (void *)objc_opt_class();
  if (v10)
    objc_msgSend(v10, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  else
    memset(&v73, 0, sizeof(v73));
  objc_msgSend(v56, "layoutComponents");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v54;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v70 != v59)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == 64)
        {
          objc_msgSend(v11, "boundingQuad");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "boundingBox");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;

          v68 = v73;
          v77.origin.x = v14;
          v77.origin.y = v16;
          v77.size.width = v18;
          v77.size.height = v20;
          v78 = CGRectApplyAffineTransform(v77, &v68);
          v21 = v78.origin.x;
          v22 = v78.origin.y;
          v23 = v78.size.width;
          v24 = v78.size.height;
          v61 = (void *)objc_opt_new();
          v25 = (void *)objc_opt_new();
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v11, "children");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v65 != v28)
                  objc_enumerationMutation(v26);
                v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                v31 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v30, "rowRange"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setValue:forKey:", v32, CFSTR("Row Index"));

                objc_msgSend(v30, "boundingQuad");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "boundingBox");
                v35 = v34;
                v37 = v36;
                v39 = v38;
                v41 = v40;

                v63 = v73;
                v79.origin.x = v35;
                v79.origin.y = v37;
                v79.size.width = v39;
                v79.size.height = v41;
                v80 = CGRectApplyAffineTransform(v79, &v63);
                objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setValue:forKey:", v42, CFSTR("Rect"));

                objc_msgSend(v25, "addObject:", v31);
              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
            }
            while (v27);
          }

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v21, v22, v23, v24);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setValue:forKey:", v43, CFSTR("Rect"));

          objc_msgSend(v61, "setValue:forKey:", v25, CFSTR("Cells"));
          objc_msgSend(v57, "addObject:", v61);

        }
      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v60);
  }

  if (objc_msgSend(v57, "count"))
  {
    CFAbsoluteTimeGetCurrent();
    objc_msgSend(v55, "pageRef");
    v44 = v57;
    inserted = CGPDFPageInsertTableDescriptions();
    objc_msgSend(v55, "document");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "indexForPage:", v55);
    CFAbsoluteTimeGetCurrent();
    _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PageAnalysis", (uint64_t)"table insertion for page: (page #%lu) COMPLETED (+%g secs)", v48, v49, v50, v51, v52, v47 + 1);

  }
  else
  {
    inserted = 0;
  }

  return inserted;
}

- (void)_drawTextFromAnalysis:(id)a3 ofImage:(id)a4 intoContext:(CGContext *)a5 withBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double *v56;
  double *v57;
  double *v58;
  double *v59;
  double v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  __CFString *v65;
  const __CFDictionary *v66;
  const __CFAttributedString *v67;
  const __CTLine *v68;
  CTLineRef JustifiedLine;
  const __CTLine *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  CGMutablePathRef Mutable;
  id v80;
  id v81;
  id v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t i;
  id v89;
  const __CFAllocator *alloc;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  CGColorRef SRGB;
  uint64_t v95;
  long double angle;
  void *v97;
  uint64_t v98;
  PDFPageAnalyzer *v99;
  CFTypeRef cf;
  double v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t *v110;
  _QWORD *v111[2];
  CGAffineTransform v112;
  CGAffineTransform v113;
  CGAffineTransform v114;
  _QWORD v115[2];
  _QWORD v116[2];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v119 = *MEMORY[0x24BDAC8D0];
  v82 = a3;
  v80 = a4;
  objc_msgSend(v80, "size");
  v14 = v13;
  v16 = v15;
  CGAffineTransformMakeTranslation(&v114, 0.0, v15);
  v112 = v114;
  CGAffineTransformScale(&v113, &v112, v14, -v16);
  v114 = v113;
  memset(&v113, 0, sizeof(v113));
  v17 = (void *)objc_opt_class();
  if (v17)
    objc_msgSend(v17, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  else
    memset(&v113, 0, sizeof(v113));
  v99 = self;
  v81 = objc_retainAutorelease(v80);
  v93 = objc_msgSend(v81, "CGImage");
  CGContextSaveGState(a5);
  v111[0] = 0;
  v111[1] = 0;
  v110 = (uint64_t *)v111;
  SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, 0.0);
  objc_msgSend(v82, "allLines");
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
  if (v85)
  {
    v84 = *(_QWORD *)v107;
    v91 = *MEMORY[0x24BDC4EE0];
    v92 = *MEMORY[0x24BDC4C28];
    alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v85; ++i)
      {
        if (*(_QWORD *)v107 != v84)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v18, "children");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "lastObject");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "quad");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        quadTransformedWithAffineTransform(v19, &v113.a);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v87, "bottomLeft");
        v21 = v20;
        v23 = v22;
        objc_msgSend(v87, "bottomRight");
        angle = atan2(v24 - v23, v25 - v21);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v89 = v86;
        v26 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        if (v26)
        {
          v95 = *(_QWORD *)v103;
          do
          {
            v98 = v26;
            for (j = 0; j != v98; ++j)
            {
              if (*(_QWORD *)v103 != v95)
                objc_enumerationMutation(v89);
              v28 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
              objc_msgSend(v28, "quad");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              quadTransformedWithAffineTransform(v29, &v113.a);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "bottomLeft");
              v32 = v31;
              v34 = v33;
              objc_msgSend(v30, "bottomRight");
              v36 = v35;
              v38 = v37;
              objc_msgSend(v30, "sideLength");
              v40 = v39;
              v43 = (v41 + v42) * 0.5;
              v101 = round(v43 * 10.0) / 10.0;
              objc_msgSend(v28, "string");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "length");

              objc_msgSend(v28, "quad");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              quadTransformedWithAffineTransform(v46, &v114.a);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              -[PDFPageAnalyzer _computeEdgeInsetsForQuad:inImage:background:glyphCount:](v99, "_computeEdgeInsetsForQuad:inImage:background:glyphCount:", v47, v93, 0, v45);
              PDFRectScale(v48, v49, v50, v51, 1.0 / *((double *)v99 + 14));
              v53 = v52;
              v55 = v54;
              v56 = (double *)v111[0];
              if (!v111[0])
                goto LABEL_24;
              v57 = (double *)v111;
              do
              {
                v58 = v56;
                v59 = v57;
                v60 = v56[4];
                if (v60 >= v101)
                  v57 = v56;
                else
                  ++v56;
                v56 = *(double **)v56;
              }
              while (v56);
              if (v57 == (double *)v111)
                goto LABEL_24;
              if (v60 < v101)
                v58 = v59;
              if (v101 >= v58[4])
              {
                v61 = (_QWORD *)*((_QWORD *)v57 + 5);
              }
              else
              {
LABEL_24:
                cf = CTFontCreateWithName(CFSTR("Times-Roman"), v101, 0);
                std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__emplace_unique_key_args<double,double &,applesauce::CF::ObjectRef<__CTFont const*>&>(&v110, &v101, &v101, &cf);
                v61 = cf;
                if (cf)
                  CFRelease(cf);
              }
              objc_msgSend(v28, "string");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v62;
              if (v28 == v97)
                v64 = CFSTR("\n");
              else
                v64 = CFSTR(" ");
              objc_msgSend(v62, "stringByAppendingString:", v64);
              v65 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v115[0] = v92;
              v115[1] = v91;
              v116[0] = v61;
              v116[1] = SRGB;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
              v66 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              v67 = CFAttributedStringCreate(alloc, v65, v66);
              v68 = CTLineCreateWithAttributedString(v67);
              JustifiedLine = CTLineCreateJustifiedLine(v68, 1.0, v40 - (v53 + v55));
              CGContextSaveGState(a5);
              CGContextTranslateCTM(a5, v32, v34);
              CGContextRotateCTM(a5, angle);
              CGContextTranslateCTM(a5, v53, v43 * 0.18);
              CGContextSetTextPosition(a5, 0.0, 0.0);
              if (JustifiedLine)
                v70 = JustifiedLine;
              else
                v70 = v68;
              CTLineDraw(v70, a5);
              CGContextRestoreGState(a5);
              if (*((_BYTE *)v99 + 120))
              {
                objc_msgSend(v30, "topLeft");
                v72 = v71;
                v74 = v73;
                objc_msgSend(v30, "topRight");
                v76 = v75;
                v78 = v77;
                Mutable = CGPathCreateMutable();
                cf = Mutable;
                CGPathMoveToPoint(Mutable, 0, v72, v74);
                CGPathAddLineToPoint(Mutable, 0, v76, v78);
                CGPathAddLineToPoint(Mutable, 0, v36, v38);
                CGPathAddLineToPoint(Mutable, 0, v32, v34);
                CGPathCloseSubpath(Mutable);
                CGContextAddPath(a5, Mutable);
                CGContextSaveGState(a5);
                CGContextStrokePath(a5);
                CGContextRestoreGState(a5);
                if (Mutable)
                  CFRelease(Mutable);
              }
              if (JustifiedLine)
                CFRelease(JustifiedLine);
              if (v68)
                CFRelease(v68);
              if (v67)
                CFRelease(v67);

            }
            v26 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
          }
          while (v26);
        }

      }
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
    }
    while (v85);
  }

  CGContextRestoreGState(a5);
  std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy((uint64_t)&v110, v111[0]);
  if (SRGB)
    CFRelease(SRGB);

}

- (CGPoint)_testPixelsFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 compare:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  uint64_t (**v9)(id, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  double v27;
  double v28;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v9 = (uint64_t (**)(id, uint64_t, uint64_t))a5;
  v10 = (int)v8;
  v11 = (int)v7;
  v12 = (int)x;
  v13 = (int)y;
  if ((int)x > (int)v10)
    v14 = 1;
  else
    v14 = -1;
  if (v12 - (int)v10 >= 0)
    v15 = (int)x - v10;
  else
    v15 = v10 - (int)x;
  if (v13 > (int)v11)
    v16 = 1;
  else
    v16 = -1;
  if (v13 - (int)v11 >= 0)
    v17 = v13 - v11;
  else
    v17 = v11 - v13;
  v18 = -v17;
  v19 = v15 - v17;
  while ((v9[2](v9, v10, v11) & 1) != 0)
  {
    if ((_DWORD)v10 == v12 && (_DWORD)v11 == (int)y)
      goto LABEL_31;
    v20 = 2 * v19;
    if (2 * v19 >= v18)
      v21 = v14;
    else
      v21 = 0;
    v10 = (v21 + v10);
    if (v20 >= v18)
      v22 = v17;
    else
      v22 = 0;
    v23 = v19 - v22;
    v24 = v20 <= v15;
    if (v20 <= v15)
      v25 = v16;
    else
      v25 = 0;
    v11 = (v25 + v11);
    if (v24)
      v26 = v15;
    else
      v26 = 0;
    v19 = v23 + v26;
  }
  x = (double)(int)v10;
  y = (double)(int)v11;
LABEL_31:

  v27 = x;
  v28 = y;
  result.y = v28;
  result.x = v27;
  return result;
}

- (UIEdgeInsets)_computeEdgeInsetsForQuad:(id)a3 inImage:(CGImage *)a4 background:(unsigned __int8)a5 glyphCount:(unint64_t)a6
{
  id v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  size_t Height;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v46;
  double v47[12];
  double v48[10];
  double v49;
  double v50;
  double v51;
  _QWORD v52[4];
  _BYTE v53[336];
  _QWORD v54[40];
  int v55;
  char v56;
  unsigned __int8 v57;
  uint64_t v58;
  UIEdgeInsets result;

  v58 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  CGBuf::CGBuf((CGBuf *)v54, a4);
  v10 = v57 <= 1u && v56 == 8;
  if (!v10 || (v55 & 0x1Fu) - 1 <= 3)
  {
    NSLog(CFSTR("%s: Invalid image. Must be grayscale, 8-bit, and no alpha."), "-[PDFPageAnalyzer _computeEdgeInsetsForQuad:inImage:background:glyphCount:]");
LABEL_8:
    v11 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v13 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v14 = *(double *)(MEMORY[0x24BDF7718] + 24);
    goto LABEL_9;
  }
  if (!v54[3] || !v54[4])
  {
    NSLog(CFSTR("%s: Invalid image. Must have non-zero width and height."), "-[PDFPageAnalyzer _computeEdgeInsetsForQuad:inImage:background:glyphCount:]");
    goto LABEL_8;
  }
  Height = CGImageGetHeight(a4);
  v20 = *MEMORY[0x24BDF7718];
  v21 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v13 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v22 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3321888768;
  v52[2] = __75__PDFPageAnalyzer__computeEdgeInsetsForQuad_inImage_background_glyphCount___block_invoke;
  v52[3] = &__block_descriptor_361_ea8_32c10_ZTS5CGBuf_e11_B16__0i8i12l;
  CGBuf::CGBuf((CGBuf *)v53, (const CGBuf *)v54);
  v53[328] = a5;
  v23 = (void *)MEMORY[0x20BD1AEB4](v52);
  v51 = v21;
  MEMORY[0x24BDAC7A8]();
  divideQuadSideIntoSegments(v9, 0, v48);
  MEMORY[0x24BDAC7A8]();
  divideQuadSideIntoSegments(v9, 1, v47);
  v50 = v22;
  v24 = 0;
  v25 = (double)Height;
  v26 = 1.79769313e308;
  do
  {
    v27 = v48[v24];
    v28 = v25 - v48[v24 + 1];
    v29 = v47[v24];
    v30 = v25 - v47[v24 + 1];
    -[PDFPageAnalyzer _testPixelsFromPoint:toPoint:compare:](self, "_testPixelsFromPoint:toPoint:compare:", v23, v27, v28, v29, v30);
    if (v31 != v29 || v32 != v30)
    {
      v34 = (v32 - v28) * (v32 - v28) + (v31 - v27) * (v31 - v27);
      if (v26 >= v34)
        v26 = v34;
    }
    v24 += 2;
  }
  while (v24 != 12);
  v49 = v20;
  v35 = 0;
  v36 = sqrt(v26);
  v37 = 1.79769313e308;
  if (v26 == 1.79769313e308)
    v12 = v51;
  else
    v12 = v36;
  do
  {
    v38 = v47[v35];
    v39 = v25 - v47[v35 + 1];
    v40 = v48[v35];
    v41 = v25 - v48[v35 + 1];
    -[PDFPageAnalyzer _testPixelsFromPoint:toPoint:compare:](self, "_testPixelsFromPoint:toPoint:compare:", v23, v38, v39, v40, v41);
    if (v42 != v40 || v43 != v41)
    {
      v45 = (v43 - v39) * (v43 - v39) + (v42 - v38) * (v42 - v38);
      if (v37 >= v45)
        v37 = v45;
    }
    v35 += 2;
  }
  while (v35 != 12);
  v46 = sqrt(v37);
  if (v37 == 1.79769313e308)
    v14 = v50;
  else
    v14 = v46;

  v11 = v49;
  CGBuf::~CGBuf((CGBuf *)v53);
LABEL_9:
  CGBuf::~CGBuf((CGBuf *)v54);

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

BOOL __75__PDFPageAnalyzer__computeEdgeInsetsForQuad_inImage_background_glyphCount___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (*(_QWORD *)(a1 + 64) <= (unint64_t)a3)
    return 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v3 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 72) * a3;
  if (!v3)
    v4 = 0;
  v5 = v4 + v3;
  if (!v5 || *(_QWORD *)(a1 + 56) <= (unint64_t)a2)
    return 0;
  v6 = *(unsigned __int8 *)(v5 + a2) - *(unsigned __int8 *)(a1 + 360);
  if (v6 < 0)
    v6 = -v6;
  return v6 > 0x7F;
}

- (id)_detectedAnnotationWithBounds:(CGRect)a3 intersectsAnnotationOnPage:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  _QWORD **v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD *v25;
  BOOL v26;
  id v27;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  double *v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v35 = 0;
  v36 = 0;
  v9 = &v35;
  v34 = (uint64_t *)&v35;
  objc_msgSend(v8, "annotations");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "bounds");
        v42.origin.x = v15;
        v42.origin.y = v16;
        v18 = v17;
        v20 = v19;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v42.size.width = v18;
        v42.size.height = v20;
        v41 = CGRectIntersection(v40, v42);
        v21 = v41.size.width;
        v22 = v41.size.height;
        if (!CGRectIsNull(v41))
        {
          v29 = v21 * v22 / (v18 * v20);
          v37 = &v29;
          v23 = std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::__emplace_unique_key_args<double,std::piecewise_construct_t const&,std::tuple<double const&>,std::tuple<>>(&v34, &v29, (uint64_t)&std::piecewise_construct, (uint64_t **)&v37);
          objc_storeStrong((id *)v23 + 5, v14);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v11);
  }

  if (!v36)
    goto LABEL_16;
  v24 = v35;
  if (v35)
  {
    do
    {
      v25 = v24;
      v24 = (_QWORD *)v24[1];
    }
    while (v24);
  }
  else
  {
    do
    {
      v25 = v9[2];
      v26 = *v25 == (_QWORD)v9;
      v9 = (_QWORD **)v25;
    }
    while (v26);
  }
  if (*((double *)v25 + 4) > 0.5)
    v27 = (id)v25[5];
  else
LABEL_16:
    v27 = 0;

  std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy((uint64_t)&v34, v35);
  return v27;
}

- (void)_addFormElementsFromAnalysis:(id)a3 bounds:(CGRect)a4 toPage:(id)a5
{
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v45;
  id v46;
  uint64_t (**v47)(_QWORD, _QWORD);
  id v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  double y;
  double width;
  double height;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id obj;
  _QWORD v64[4];
  id v65;
  uint64_t (**v66)(_QWORD, _QWORD);
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  double v75;
  double v76;
  double v77;
  double v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v97 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v7 = a5;
  objc_msgSend(v7, "annotations");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v53;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v91 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSynthesizedFormField"))
        {
          objc_msgSend(v11, "contents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length") == 0;

          if (v13)
            objc_msgSend(v55, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
    }
    while (v8);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v62 = v55;
  v14 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v87 != v15)
          objc_enumerationMutation(v62);
        objc_msgSend(v7, "removeAnnotation:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    }
    while (v14);
  }

  v17 = objc_msgSend(v54, "recognitionConfidence");
  if (v17 < 3)
    objc_msgSend(v7, "setDetectedFormFieldsRecognitionConfidence:", v17 + 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v83 = 0u;
  v18 = (void *)objc_opt_class();
  if (v18)
  {
    objc_msgSend(v18, "_normalizedToPageTransformForPageWithBounds:", x, y, width, height);
  }
  else
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
  }
  v19 = (void *)MEMORY[0x24BDF6A70];
  +[PDFAnnotation detectedFormFieldDefaultFontName](PDFAnnotation, "detectedFormFieldDefaultFontName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation detectedFormFieldDefaultFontSize](PDFAnnotation, "detectedFormFieldDefaultFontSize");
  objc_msgSend(v19, "fontWithName:size:", v20);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDF6A70];
  +[PDFAnnotation detectedFormFieldDefaultFontSize](PDFAnnotation, "detectedFormFieldDefaultFontSize");
  objc_msgSend(v21, "monospacedSystemFontOfSize:weight:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "annotations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "formRegionsExcluding:updateExcludedFields:", v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v80;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v80 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v27);
        objc_msgSend(v28, "quad");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "topLeft");
        v31 = v30;
        v33 = v32;
        objc_msgSend(v29, "topRight");
        v35 = v34;
        v37 = v36;
        objc_msgSend(v29, "bottomLeft");
        v39 = v38;
        v41 = v40;
        objc_msgSend(v29, "bottomRight");
        if (v33 != v37 || v41 != v43)
        {

LABEL_41:
          goto LABEL_42;
        }
        v45 = v35 == v42 && v31 == v39;

        if (v45)
        {
          v67[0] = MEMORY[0x24BDAC760];
          v67[1] = 3221225472;
          v67[2] = __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke;
          v67[3] = &unk_24C25CA48;
          v72 = v83;
          v73 = v84;
          v74 = v85;
          v68 = v60;
          v69 = v59;
          v75 = x;
          v76 = y;
          v77 = width;
          v78 = height;
          v46 = v7;
          v70 = v46;
          v71 = v61;
          v47 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](v67);
          if (objc_msgSend(v28, "fieldType") == 1 || objc_msgSend(v28, "fieldType") == 2)
          {
            v48 = (id)((uint64_t (**)(_QWORD, void *))v47)[2](v47, v28);
          }
          else if (!objc_msgSend(v28, "fieldType"))
          {
            objc_msgSend(v28, "children");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
            v64[0] = MEMORY[0x24BDAC760];
            v64[1] = 3221225472;
            v64[2] = __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke_2;
            v64[3] = &unk_24C25CA70;
            v66 = v47;
            v51 = v50;
            v65 = v51;
            objc_msgSend(v49, "enumerateObjectsUsingBlock:", v64);
            if (objc_msgSend(v51, "count"))
              objc_msgSend(v46, "addFormFieldGroup:", v51);

          }
          v29 = v68;
          goto LABEL_41;
        }
LABEL_42:
        ++v27;
      }
      while (v25 != v27);
      v52 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      v25 = v52;
    }
    while (v52);
  }

  if (objc_msgSend(v61, "count") && objc_msgSend(v61, "count"))
    objc_msgSend(v7, "addDetectedAnnotations:", v61);

}

id __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double x;
  double y;
  double width;
  double height;
  uint64_t v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v31;
  CGRect v32;

  v3 = a2;
  objc_msgSend(v3, "quad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v31.a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v31.c = v13;
  *(_OWORD *)&v31.tx = *(_OWORD *)(a1 + 96);
  v14 = v6;
  *(_QWORD *)&v13 = v8;
  v15 = v10;
  v16 = v12;
  v32 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v13 - 8), &v31);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  v21 = objc_msgSend(v3, "maxCharacterCount");
  v22 = 40;
  if (v21 > 0)
    v22 = 32;
  v23 = *(id *)(a1 + v22);
  objc_msgSend(v3, "suggestedLineHeight");
  if (v24 != 0.0)
  {
    objc_msgSend(v3, "suggestedLineHeight");
    objc_msgSend(v23, "fontWithSize:", v25 * *(double *)(a1 + 136) * 0.75);
    v26 = objc_claimAutoreleasedReturnValue();

    v23 = (id)v26;
  }
  objc_msgSend(v3, "autoFillContentType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v23, v27, *(_QWORD *)(a1 + 48), x, y, width, height);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setFormContentType:", objc_msgSend(v3, "contentType"));
  objc_msgSend(v3, "labelText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLabelText:", v29);

  if (objc_msgSend(v3, "contentType") == 50)
    objc_msgSend(v28, "setIsDetectedSignature:", 1);
  if (objc_msgSend(v3, "fieldType") == 2)
    objc_msgSend(v28, "setIsDetectedCheckbox:", 1);
  objc_msgSend(v28, "setAutofillNewContextStart:", objc_msgSend(v3, "autofillNewContextStart"));
  if (objc_msgSend(v3, "fieldType") == 1 && objc_msgSend(v3, "maxCharacterCount") >= 1)
  {
    objc_msgSend(v28, "setComb:", 1);
    objc_msgSend(v28, "setMaximumLength:", objc_msgSend(v3, "maxCharacterCount"));
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v28);

  return v28;
}

void __62__PDFPageAnalyzer__addFormElementsFromAnalysis_bounds_toPage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(v5, "setAutoFillTextContentType:", 0);
    objc_msgSend(v5, "setFormContentType:", 1);
  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)_addFormElementsUsingDetectorToPage:(id)a3 displayBox:(int64_t)a4
{
  PDFDetectedForm *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  double rect;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v31 = a3;
  v6 = -[PDFDetectedForm initWithPage:displayBox:]([PDFDetectedForm alloc], "initWithPage:displayBox:", v31, a4);
  v7 = (void *)MEMORY[0x24BDF6A70];
  +[PDFAnnotation detectedFormFieldDefaultFontName](PDFAnnotation, "detectedFormFieldDefaultFontName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation detectedFormFieldDefaultFontSize](PDFAnnotation, "detectedFormFieldDefaultFontSize");
  objc_msgSend(v7, "fontWithName:size:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PDFDetectedForm count](v6, "count");
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      -[PDFDetectedForm detectedFormFieldAtIndex:](v6, "detectedFormFieldAtIndex:", i, v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rect");
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      MinY = CGRectGetMinY(v34);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      rect = width;
      objc_msgSend(v9, "ascender", CGRectGetHeight(v35));
      v20 = v19;
      objc_msgSend(v9, "descender");
      v22 = v21;
      objc_msgSend(v9, "leading");
      v24 = v23;
      objc_msgSend(v9, "ascender");
      v25 = ceil(v20 - v22 + v24);
      v27 = MinY + v26 - v25;
      if (objc_msgSend(v13, "kind") == 2 || objc_msgSend(v13, "kind") == 3)
      {
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v28 = CGRectGetHeight(v36);
        v37.origin.x = x;
        v37.origin.y = v27;
        v37.size.width = rect;
        v37.size.height = v25;
        v27 = y + (v28 - CGRectGetHeight(v37)) * 0.5;
      }
      -[PDFPageAnalyzer _detectedAnnotationWithBounds:intersectsAnnotationOnPage:](self, "_detectedAnnotationWithBounds:intersectsAnnotationOnPage:", v31, x, v27 + -2.0, rect, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v9, 0, v31, x, v27 + -2.0, rect, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "kind") == 3)
        {
          objc_msgSend(v30, "setComb:", 1);
          objc_msgSend(v30, "setMaximumLength:", objc_msgSend(v13, "numberOfSegments"));
        }
        objc_msgSend(v10, "addObject:", v30);

      }
    }
  }
  if (objc_msgSend(v10, "count", v31))
    objc_msgSend(v32, "addDetectedAnnotations:", v10);

}

+ (CGAffineTransform)_normalizedToPageTransformForPageWithBounds:(SEL)a3
{
  double height;
  CGFloat width;
  __int128 v7;
  CGAffineTransform *result;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  height = a4.size.height;
  width = a4.size.width;
  CGAffineTransformMakeTranslation(retstr, a4.origin.x, a4.size.height + a4.origin.y);
  v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v11, &v10, width, -height);
  v9 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
