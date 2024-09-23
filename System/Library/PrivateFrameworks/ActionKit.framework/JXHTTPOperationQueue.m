@implementation JXHTTPOperationQueue

- (void)dealloc
{
  objc_super v3;

  -[JXHTTPOperationQueue removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("operations"), JXHTTPOperationQueueContext);
  v3.receiver = self;
  v3.super_class = (Class)JXHTTPOperationQueue;
  -[JXHTTPOperationQueue dealloc](&v3, sel_dealloc);
}

- (JXHTTPOperationQueue)init
{
  JXHTTPOperationQueue *v2;
  JXHTTPOperationQueue *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  id v13;
  const char *v14;
  dispatch_queue_t v15;
  id v16;
  dispatch_queue_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)JXHTTPOperationQueue;
  v2 = -[JXHTTPOperationQueue init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    -[JXHTTPOperationQueue setMaxConcurrentOperationCount:](v2, "setMaxConcurrentOperationCount:", 4);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "globallyUniqueString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPOperationQueue setUniqueString:](v3, "setUniqueString:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[JXHTTPOperationQueue setObservedOperationSet:](v3, "setObservedOperationSet:", v6);

    -[JXHTTPOperationQueue setPerformsBlocksOnMainQueue:](v3, "setPerformsBlocksOnMainQueue:", 0);
    -[JXHTTPOperationQueue setDelegate:](v3, "setDelegate:", 0);
    -[JXHTTPOperationQueue setStartDate:](v3, "setStartDate:", 0);
    -[JXHTTPOperationQueue setFinishDate:](v3, "setFinishDate:", 0);
    -[JXHTTPOperationQueue setWillStartBlock:](v3, "setWillStartBlock:", 0);
    -[JXHTTPOperationQueue setWillFinishBlock:](v3, "setWillFinishBlock:", 0);
    -[JXHTTPOperationQueue setDidStartBlock:](v3, "setDidStartBlock:", 0);
    -[JXHTTPOperationQueue setDidUploadBlock:](v3, "setDidUploadBlock:", 0);
    -[JXHTTPOperationQueue setDidDownloadBlock:](v3, "setDidDownloadBlock:", 0);
    -[JXHTTPOperationQueue setDidMakeProgressBlock:](v3, "setDidMakeProgressBlock:", 0);
    -[JXHTTPOperationQueue setDidFinishBlock:](v3, "setDidFinishBlock:", 0);
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@.%p."), v9, v3);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("observation"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    -[JXHTTPOperationQueue setObservationQueue:](v3, "setObservationQueue:", v12);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("progress"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = dispatch_queue_create(v14, MEMORY[0x24BDAC9C0]);
    -[JXHTTPOperationQueue setProgressQueue:](v3, "setProgressQueue:", v15);

    objc_msgSend(v10, "stringByAppendingString:", CFSTR("blocks"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    -[JXHTTPOperationQueue setBlockQueue:](v3, "setBlockQueue:", v17);

    -[JXHTTPOperationQueue addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v3, CFSTR("operations"), 3, JXHTTPOperationQueueContext);
  }
  return v3;
}

- (double)elapsedSeconds
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[JXHTTPOperationQueue startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[JXHTTPOperationQueue finishDate](self, "finishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[JXHTTPOperationQueue finishDate](self, "finishDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  }
  v7 = v5;

  -[JXHTTPOperationQueue startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return v10;
}

- (void)performDelegateMethod:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  -[JXHTTPOperationQueue delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[JXHTTPOperationQueue delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:onThread:withObject:waitUntilDone:", a3, v8, self, 1);

  }
  -[JXHTTPOperationQueue blockForSelector:](self, "blockForSelector:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = -[JXHTTPOperationQueue performsBlocksOnMainQueue](self, "performsBlocksOnMainQueue");
    if (v10)
    {
      v11 = MEMORY[0x24BDAC9B8];
      v12 = MEMORY[0x24BDAC9B8];
    }
    else
    {
      -[JXHTTPOperationQueue blockQueue](self, "blockQueue");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__JXHTTPOperationQueue_performDelegateMethod___block_invoke;
    block[3] = &unk_24F8B5A00;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    dispatch_async(v11, block);
    v13 = MEMORY[0x24BDAC9B8];
    if (!v10)
      v13 = v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (id)blockForSelector:(SEL)a3
{
  void *v4;

  if (sel_httpOperationQueueWillStart_ == a3)
  {
    -[JXHTTPOperationQueue willStartBlock](self, "willStartBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationQueueWillFinish_ == a3)
  {
    -[JXHTTPOperationQueue willFinishBlock](self, "willFinishBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationQueueDidStart_ == a3)
  {
    -[JXHTTPOperationQueue didStartBlock](self, "didStartBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationQueueDidUpload_ == a3)
  {
    -[JXHTTPOperationQueue didUploadBlock](self, "didUploadBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationQueueDidDownload_ == a3)
  {
    -[JXHTTPOperationQueue didDownloadBlock](self, "didDownloadBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (sel_httpOperationQueueDidMakeProgress_ == a3)
  {
    -[JXHTTPOperationQueue didMakeProgressBlock](self, "didMakeProgressBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (sel_httpOperationQueueDidFinish_ != a3)
      return 0;
    -[JXHTTPOperationQueue didFinishBlock](self, "didFinishBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  JXHTTPOperationQueue *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  NSObject *v21;
  JXHTTPOperationQueue *v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  JXHTTPOperationQueue *v28;
  NSNumber *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  JXHTTPOperationQueue *v34;
  NSNumber *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  unint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id obj;
  _QWORD v74[4];
  id v75;
  id v76[2];
  _QWORD v77[4];
  id v78;
  id v79[2];
  _QWORD v80[4];
  id v81;
  id v82[2];
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[6];
  _QWORD v89[4];
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[6];
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  _QWORD block[4];
  id v108;
  id v109;
  id location;
  objc_super v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (JXHTTPOperationQueue *)a4;
  v12 = a5;
  v70 = v12;
  if ((void *)JXHTTPOperationQueueContext == a6)
  {
    if (v11 == self && objc_msgSend(v10, "isEqualToString:", CFSTR("operations")))
    {
      objc_msgSend(v70, "objectForKey:", *MEMORY[0x24BDD0E68]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (v14 == 1)
      {
        v67 = objc_alloc_init(MEMORY[0x24BDBCE60]);
        objc_msgSend(v70, "objectForKey:", *MEMORY[0x24BDD0E70]);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKey:", *MEMORY[0x24BDD0E80]);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v69);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v68);
        objc_msgSend(v15, "removeObjectsInArray:", v68);
        v71 = v16;
        objc_msgSend(v16, "removeObjectsInArray:", v69);
        v17 = objc_msgSend(v69, "count");
        v18 = objc_msgSend(v68, "count");
        if (v17)
          v19 = v18 == 0;
        else
          v19 = 0;
        if (v17)
          v20 = 0;
        else
          v20 = v18 != 0;
        v66 = __PAIR64__(v19, v20);
        if (v19)
        {
          objc_initWeak(&location, v11);
          -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
          v21 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_24F8B5A28;
          objc_copyWeak(&v109, &location);
          v108 = v67;
          dispatch_barrier_async(v21, block);

          objc_destroyWeak(&v109);
          objc_destroyWeak(&location);
        }
        else if (v20)
        {
          objc_initWeak(&location, v11);
          -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
          v40 = objc_claimAutoreleasedReturnValue();
          v105[0] = MEMORY[0x24BDAC760];
          v105[1] = 3221225472;
          v105[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_35;
          v105[3] = &unk_24F8B76C8;
          objc_copyWeak(&v106, &location);
          dispatch_barrier_async(v40, v105);

          objc_destroyWeak(&v106);
          objc_destroyWeak(&location);
        }
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        obj = v15;
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v102;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v102 != v42)
                objc_enumerationMutation(obj);
              v44 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v44, "requestBody");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "numberWithLongLong:", objc_msgSend(v46, "httpContentLength"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v44, "uniqueString");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = (void *)objc_msgSend(v48, "copy");

                objc_initWeak(&location, v11);
                -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
                v50 = objc_claimAutoreleasedReturnValue();
                v97[0] = MEMORY[0x24BDAC760];
                v97[1] = 3221225472;
                v97[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
                v97[3] = &unk_24F8B5A50;
                objc_copyWeak(&v100, &location);
                v51 = v47;
                v98 = v51;
                v52 = v49;
                v99 = v52;
                dispatch_barrier_async(v50, v97);

                -[JXHTTPOperationQueue observationQueue](v11, "observationQueue");
                v53 = objc_claimAutoreleasedReturnValue();
                v96[0] = MEMORY[0x24BDAC760];
                v96[1] = 3221225472;
                v96[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
                v96[3] = &unk_24F8BA480;
                v96[4] = v11;
                v96[5] = v44;
                dispatch_sync(v53, v96);

                objc_destroyWeak(&v100);
                objc_destroyWeak(&location);

              }
            }
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
          }
          while (v41);
        }

        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v72 = v71;
        v54 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
        if (v54)
        {
          v55 = *(_QWORD *)v93;
          v56 = MEMORY[0x24BDAC760];
          do
          {
            for (j = 0; j != v54; ++j)
            {
              if (*(_QWORD *)v93 != v55)
                objc_enumerationMutation(v72);
              v58 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v58, "isCancelled"))
                {
                  objc_msgSend(v58, "uniqueString");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = (void *)objc_msgSend(v59, "copy");

                  objc_initWeak(&location, v11);
                  -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
                  v61 = objc_claimAutoreleasedReturnValue();
                  v89[0] = v56;
                  v89[1] = 3221225472;
                  v89[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
                  v89[3] = &unk_24F8B5A28;
                  objc_copyWeak(&v91, &location);
                  v90 = v60;
                  v62 = v60;
                  dispatch_barrier_async(v61, v89);

                  objc_destroyWeak(&v91);
                  objc_destroyWeak(&location);
                }
                -[JXHTTPOperationQueue observationQueue](v11, "observationQueue", v66);
                v63 = objc_claimAutoreleasedReturnValue();
                v88[0] = v56;
                v88[1] = 3221225472;
                v88[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_5;
                v88[3] = &unk_24F8BA480;
                v88[4] = v11;
                v88[5] = v58;
                dispatch_sync(v63, v88);

              }
            }
            v54 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
          }
          while (v54);
        }

        if (HIDWORD(v66))
        {
          objc_initWeak(&location, v11);
          -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
          v64 = objc_claimAutoreleasedReturnValue();
          v86[0] = MEMORY[0x24BDAC760];
          v86[1] = 3221225472;
          v86[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_6;
          v86[3] = &unk_24F8B76C8;
          objc_copyWeak(&v87, &location);
          dispatch_barrier_async(v64, v86);

          objc_destroyWeak(&v87);
          objc_destroyWeak(&location);
        }
        else if ((_DWORD)v66)
        {
          objc_initWeak(&location, v11);
          -[JXHTTPOperationQueue progressQueue](v11, "progressQueue");
          v65 = objc_claimAutoreleasedReturnValue();
          v83[0] = MEMORY[0x24BDAC760];
          v83[1] = 3221225472;
          v83[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_7;
          v83[3] = &unk_24F8B5A28;
          objc_copyWeak(&v85, &location);
          v84 = v67;
          dispatch_barrier_async(v65, v83);

          objc_destroyWeak(&v85);
          objc_destroyWeak(&location);
        }

      }
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("response")))
    {
      v22 = v11;
      -[JXHTTPOperationQueue response](v22, "response");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (char *)objc_msgSend(v23, "expectedContentLength");

      -[JXHTTPOperationQueue uniqueString](v22, "uniqueString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "copy");

      if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        objc_initWeak(&location, self);
        -[JXHTTPOperationQueue progressQueue](self, "progressQueue");
        v27 = objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_8;
        v80[3] = &unk_24F8B5A78;
        objc_copyWeak(v82, &location);
        v82[1] = v24;
        v81 = v26;
        dispatch_barrier_async(v27, v80);

        objc_destroyWeak(v82);
        objc_destroyWeak(&location);
      }

    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("bytesDownloaded")))
    {
      v28 = v11;
      v29 = -[JXHTTPOperationQueue bytesDownloaded](v28, "bytesDownloaded");
      -[JXHTTPOperationQueue uniqueString](v28, "uniqueString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "copy");

      objc_initWeak(&location, self);
      -[JXHTTPOperationQueue progressQueue](self, "progressQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_9;
      v77[3] = &unk_24F8B5A78;
      objc_copyWeak(v79, &location);
      v79[1] = v29;
      v78 = v31;
      v33 = v31;
      dispatch_barrier_async(v32, v77);

      objc_destroyWeak(v79);
      objc_destroyWeak(&location);

    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("bytesUploaded")))
    {
      v34 = v11;
      v35 = -[JXHTTPOperationQueue bytesUploaded](v34, "bytesUploaded");
      -[JXHTTPOperationQueue uniqueString](v34, "uniqueString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "copy");

      objc_initWeak(&location, self);
      -[JXHTTPOperationQueue progressQueue](self, "progressQueue");
      v38 = objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x24BDAC760];
      v74[1] = 3221225472;
      v74[2] = __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_10;
      v74[3] = &unk_24F8B5A78;
      objc_copyWeak(v76, &location);
      v76[1] = v35;
      v75 = v37;
      v39 = v37;
      dispatch_barrier_async(v38, v74);

      objc_destroyWeak(v76);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v111.receiver = self;
    v111.super_class = (Class)JXHTTPOperationQueue;
    -[JXHTTPOperationQueue observeValueForKeyPath:ofObject:change:context:](&v111, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (JXHTTPOperationQueueDelegate)delegate
{
  return (JXHTTPOperationQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uniqueString
{
  return (NSString *)objc_getProperty(self, a2, 528, 1);
}

- (void)setUniqueString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSNumber)downloadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setDownloadProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSNumber)uploadProgress
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setUploadProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSNumber)bytesDownloaded
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setBytesDownloaded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NSNumber)bytesUploaded
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setBytesUploaded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSNumber)expectedDownloadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 568, 1);
}

- (void)setExpectedDownloadBytes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (NSNumber)expectedUploadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 576, 1);
}

- (void)setExpectedUploadBytes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 584, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 592, 1);
}

- (void)setFinishDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (BOOL)performsBlocksOnMainQueue
{
  return self->_performsBlocksOnMainQueue;
}

- (void)setPerformsBlocksOnMainQueue:(BOOL)a3
{
  self->_performsBlocksOnMainQueue = a3;
}

- (id)willStartBlock
{
  return objc_getProperty(self, a2, 600, 1);
}

- (void)setWillStartBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 600);
}

- (id)willFinishBlock
{
  return objc_getProperty(self, a2, 608, 1);
}

- (void)setWillFinishBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 608);
}

- (id)didStartBlock
{
  return objc_getProperty(self, a2, 616, 1);
}

- (void)setDidStartBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 616);
}

- (id)didUploadBlock
{
  return objc_getProperty(self, a2, 624, 1);
}

- (void)setDidUploadBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 624);
}

- (id)didDownloadBlock
{
  return objc_getProperty(self, a2, 632, 1);
}

- (void)setDidDownloadBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 632);
}

- (id)didMakeProgressBlock
{
  return objc_getProperty(self, a2, 640, 1);
}

- (void)setDidMakeProgressBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 640);
}

- (id)didFinishBlock
{
  return objc_getProperty(self, a2, 648, 1);
}

- (void)setDidFinishBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 648);
}

- (NSMutableDictionary)bytesDownloadedPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 656, 1);
}

- (void)setBytesDownloadedPerOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (NSMutableDictionary)bytesUploadedPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 664, 1);
}

- (void)setBytesUploadedPerOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSMutableDictionary)expectedDownloadBytesPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 672, 1);
}

- (void)setExpectedDownloadBytesPerOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (NSMutableDictionary)expectedUploadBytesPerOperation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 680, 1);
}

- (void)setExpectedUploadBytesPerOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (NSMutableSet)observedOperationSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 688, 1);
}

- (void)setObservedOperationSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (OS_dispatch_queue)observationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 696, 1);
}

- (void)setObservationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (OS_dispatch_queue)progressQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 704, 1);
}

- (void)setProgressQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (OS_dispatch_queue)blockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 712, 1);
}

- (void)setBlockQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
  objc_storeStrong((id *)&self->_observedOperationSet, 0);
  objc_storeStrong((id *)&self->_expectedUploadBytesPerOperation, 0);
  objc_storeStrong((id *)&self->_expectedDownloadBytesPerOperation, 0);
  objc_storeStrong((id *)&self->_bytesUploadedPerOperation, 0);
  objc_storeStrong((id *)&self->_bytesDownloadedPerOperation, 0);
  objc_storeStrong(&self->_didFinishBlock, 0);
  objc_storeStrong(&self->_didMakeProgressBlock, 0);
  objc_storeStrong(&self->_didDownloadBlock, 0);
  objc_storeStrong(&self->_didUploadBlock, 0);
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_willFinishBlock, 0);
  objc_storeStrong(&self->_willStartBlock, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_expectedUploadBytes, 0);
  objc_storeStrong((id *)&self->_expectedDownloadBytes, 0);
  objc_storeStrong((id *)&self->_bytesUploaded, 0);
  objc_storeStrong((id *)&self->_bytesDownloaded, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(WeakRetained, "setBytesDownloadedPerOperation:", v2);

    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(WeakRetained, "setBytesUploadedPerOperation:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(WeakRetained, "setExpectedDownloadBytesPerOperation:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(WeakRetained, "setExpectedUploadBytesPerOperation:", v5);

    objc_msgSend(WeakRetained, "setDownloadProgress:", &unk_24F93C6F8);
    objc_msgSend(WeakRetained, "setUploadProgress:", &unk_24F93C6F8);
    objc_msgSend(WeakRetained, "setBytesDownloaded:", &unk_24F93AF70);
    objc_msgSend(WeakRetained, "setBytesUploaded:", &unk_24F93AF70);
    objc_msgSend(WeakRetained, "setExpectedDownloadBytes:", &unk_24F93AF70);
    objc_msgSend(WeakRetained, "setExpectedUploadBytes:", &unk_24F93AF70);
    objc_msgSend(WeakRetained, "setFinishDate:", 0);
    objc_msgSend(WeakRetained, "setStartDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "performDelegateMethod:", sel_httpOperationQueueWillStart_);
  }

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_35(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performDelegateMethod:", sel_httpOperationQueueWillFinish_);

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "expectedUploadBytesPerOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "observedOperationSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("bytesDownloaded"), 0, JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("bytesUploaded"), 0, JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("response"), 0, JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 32), "observedOperationSet");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "bytesDownloadedPerOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v5, "bytesUploadedPerOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "observedOperationSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("bytesDownloaded"), JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("bytesUploaded"), JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("response"), JXHTTPOperationQueueContext);
    objc_msgSend(*(id *)(a1 + 32), "observedOperationSet");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performDelegateMethod:", sel_httpOperationQueueDidStart_);

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setFinishDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "performDelegateMethod:", sel_httpOperationQueueDidFinish_);
    WeakRetained = v3;
  }

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "expectedDownloadBytesPerOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bytesDownloadedPerOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v3, "bytesDownloadedPerOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v3, "bytesDownloadedPerOperation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 += objc_msgSend(v15, "longLongValue");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v3, "expectedDownloadBytesPerOperation", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v3, "expectedDownloadBytesPerOperation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v20 += objc_msgSend(v25, "longLongValue");

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBytesDownloaded:", v26);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpectedDownloadBytes:", v27);

    if (v20)
    {
      *(float *)&v28 = (float)v10 / (float)v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDownloadProgress:", v29);

    }
    else
    {
      objc_msgSend(v3, "setDownloadProgress:", &unk_24F93C6F8);
    }
    objc_msgSend(v3, "performDelegateMethod:", sel_httpOperationQueueDidUpload_);
    objc_msgSend(v3, "performDelegateMethod:", sel_httpOperationQueueDidMakeProgress_);
  }

}

void __71__JXHTTPOperationQueue_observeValueForKeyPath_ofObject_change_context___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bytesUploadedPerOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v3, "bytesUploadedPerOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v3, "bytesUploadedPerOperation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 += objc_msgSend(v15, "longLongValue");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v3, "expectedUploadBytesPerOperation", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v3, "expectedUploadBytesPerOperation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v20 += objc_msgSend(v25, "longLongValue");

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBytesUploaded:", v26);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpectedUploadBytes:", v27);

    if (v20)
    {
      *(float *)&v28 = (float)v10 / (float)v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUploadProgress:", v29);

    }
    else
    {
      objc_msgSend(v3, "setUploadProgress:", &unk_24F93C6F8);
    }
    objc_msgSend(v3, "performDelegateMethod:", sel_httpOperationQueueDidDownload_);
    objc_msgSend(v3, "performDelegateMethod:", sel_httpOperationQueueDidMakeProgress_);
  }

}

void __46__JXHTTPOperationQueue_performDelegateMethod___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

+ (id)sharedQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__JXHTTPOperationQueue_sharedQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedQueue_predicate != -1)
    dispatch_once(&sharedQueue_predicate, block);
  return (id)sharedQueue_sharedQueue;
}

void __35__JXHTTPOperationQueue_sharedQueue__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v1;

}

@end
