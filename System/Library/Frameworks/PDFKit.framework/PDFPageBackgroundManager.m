@implementation PDFPageBackgroundManager

- (PDFPageBackgroundManager)initWithDelegate:(id)a3 andRenderingProperties:(id)a4
{
  id v6;
  id v7;
  PDFPageBackgroundManager *v8;
  PDFPageBackgroundManagerPrivate *v9;
  PDFPageBackgroundManagerPrivate *v10;
  uint64_t i;
  objc_class *v12;
  PDFPageBackgroundManagerPrivate *v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  PDFPageBackgroundManagerPrivate *v17;
  OS_dispatch_queue *workQueue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PDFPageBackgroundManager;
  v8 = -[PDFPageBackgroundManager init](&v24, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(PDFPageBackgroundManagerPrivate);
    v10 = v8->_private;
    v8->_private = v9;

    objc_storeWeak((id *)&v8->_private->documentDelegate, v6);
    objc_storeWeak((id *)&v8->_private->renderingProperties, v7);
    v8->_private->activePageIndex = -1;
    for (i = 32; i != 56; i += 8)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = v8->_private;
      v14 = *(Class *)((char *)&v13->super.isa + i);
      *(Class *)((char *)&v13->super.isa + i) = v12;

    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("PDFKit.PDFPageBackgroundManager", v15);
    v17 = v8->_private;
    workQueue = v17->workQueue;
    v17->workQueue = (OS_dispatch_queue *)v16;

    v8->_private->isCancled = 0;
    v8->_private->isWorking = 0;
    v8->_private->willForceUpdate = 0;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "persistentDomainForName:", CFSTR("com.apple.universalaccess"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKey:", CFSTR("reduceTransparency"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && (objc_msgSend(v21, "BOOLValue") & 1) != 0 || (objc_msgSend(v7, "enableBackgroundImages") & 1) == 0)
      v8->_private->isCancled = 1;

  }
  return v8;
}

- (void)dealloc
{
  PDFPageBackgroundManager *v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->_private->isCancled = 1;
  v3 = self;
  objc_sync_enter(v3);
  v4 = 0;
  self->_private->isWorking = 1;
  do
  {
    v5 = self->_private->backgroundImageCache[v4];
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentDelegate);
          objc_msgSend(WeakRetained, "document");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "pageAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", 0, v4, v13);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    ++v4;
  }
  while (v4 != 3);
  objc_sync_exit(v3);

  v14.receiver = v3;
  v14.super_class = (Class)PDFPageBackgroundManager;
  -[PDFPageBackgroundManager dealloc](&v14, sel_dealloc);
}

- (void)updateActivePageIndex:(unint64_t)a3
{
  PDFPageBackgroundManagerPrivate *v4;
  PDFPageBackgroundManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj->_private;
  if (v4->activePageIndex != a3)
  {
    v4->activePageIndex = a3;
    -[PDFPageBackgroundManager _update](obj, "_update");
  }
  objc_sync_exit(obj);

}

- (void)willForceUpdate
{
  PDFPageBackgroundManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_private->willForceUpdate = 1;
  objc_sync_exit(obj);

}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
  PDFPageBackgroundManager *v6;
  NSObject *v7;
  NSObject *workQueue;
  dispatch_time_t v9;
  float v10;
  uint64_t block;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  PDFPageBackgroundManager *v15;
  id v16[2];
  id location;

  v6 = self;
  objc_sync_enter(v6);
  v6->_private->isWorking = 1;
  objc_sync_exit(v6);

  v6->_private->activePageIndex = a3;
  v7 = dispatch_group_create();
  objc_initWeak(&location, v6);
  workQueue = v6->_private->workQueue;
  block = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __71__PDFPageBackgroundManager_forceUpdateActivePageIndex_withMaxDuration___block_invoke;
  v14 = &unk_24C25D240;
  objc_copyWeak(v16, &location);
  v15 = v6;
  v16[1] = (id)a3;
  dispatch_group_async(v7, workQueue, &block);
  if (a4 > 0.0)
  {
    v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_group_wait(v7, v9))
    {
      v10 = a4;
      NSLog(CFSTR("Warning: Unable to complete drawing page index %d on time as a request to forceUpdateActivePageIndex:withMaxDuration: %.2f"), a3, v10, block, v12, v13, v14);
    }
  }
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __71__PDFPageBackgroundManager_forceUpdateActivePageIndex_withMaxDuration___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_drawPageImage:forQuality:", *(_QWORD *)(a1 + 48), 0);
    *(_BYTE *)(WeakRetained[1] + 65) = 0;
    *(_BYTE *)(WeakRetained[1] + 66) = 0;
    objc_msgSend(WeakRetained, "_update");
  }

}

- (id)backgroundImageForPageIndex:(unint64_t)a3 withFoundQuality:(int *)a4
{
  PDFPageBackgroundManager *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;

  v6 = self;
  objc_sync_enter(v6);
  v7 = 0;
  while (1)
  {
    v8 = v6->_private->backgroundImageCache[v7];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      break;
    if (++v7 == 3)
      goto LABEL_6;
  }
  *a4 = v7;
LABEL_6:
  objc_sync_exit(v6);

  return v10;
}

- (void)didInsertPageAtIndex:(unint64_t)a3
{
  -[PDFPageBackgroundManager _shiftImagesAtIndex:downwards:](self, "_shiftImagesAtIndex:downwards:", a3, 1);
  -[PDFPageBackgroundManager _update](self, "_update");
}

- (void)didRemovePageAtIndex:(unint64_t)a3
{
  -[PDFPageBackgroundManager _shiftImagesAtIndex:downwards:](self, "_shiftImagesAtIndex:downwards:", a3 + 1, 0);
  -[PDFPageBackgroundManager _update](self, "_update");
}

- (void)didSwapPageAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4
{
  PDFPageBackgroundManager *v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = self;
  objc_sync_enter(v6);
  for (i = 32; i != 56; i += 8)
  {
    v8 = *(id *)((char *)&v6->_private->super.isa + i);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, v13);
    else
      objc_msgSend(v8, "removeObjectForKey:", v13);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "setObject:forKey:", v12, v14);
    else
      objc_msgSend(v8, "removeObjectForKey:", v14);

  }
  objc_sync_exit(v6);

  -[PDFPageBackgroundManager _update](v6, "_update");
}

- (void)cancel
{
  self->_private->isCancled = 1;
}

- (void)forceSetBackgroundImage:(id)a3 forPageIndex:(unint64_t)a4
{
  PDFPageBackgroundManager *v6;
  NSMutableDictionary *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_private->backgroundImageCache[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, v8);

  objc_sync_exit(v6);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_private->documentDelegate);
  objc_msgSend(WeakRetained, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pageAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", v12, 0, v11);

}

- (void)_update
{
  PDFPageBackgroundManager *v2;
  PDFPageBackgroundManagerPrivate *v3;
  NSObject *workQueue;
  PDFPageBackgroundManager *v5;
  _QWORD block[5];
  id v7[2];
  int v8;
  id location;
  int v10;
  void *v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_private;
  if (!*(_WORD *)&v3->isCancled && !v3->willForceUpdate)
  {
    v3->isWorking = 1;
    v11 = 0;
    v10 = 0;
    if (-[PDFPageBackgroundManager _findPageIndexNeedingUpdate:forQuality:](v2, "_findPageIndexNeedingUpdate:forQuality:", &v11, &v10))
    {
      objc_initWeak(&location, v2);
      workQueue = v2->_private->workQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__PDFPageBackgroundManager__update__block_invoke;
      block[3] = &unk_24C25D268;
      objc_copyWeak(v7, &location);
      v8 = v10;
      v7[1] = v11;
      block[4] = v2;
      dispatch_async(workQueue, block);
      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PDFPageBackgroundManager _cleanup](v2, "_cleanup");
      v5 = v2;
      objc_sync_enter(v5);
      v2->_private->isWorking = 0;
      objc_sync_exit(v5);

    }
  }
  objc_sync_exit(v2);

}

void __35__PDFPageBackgroundManager__update__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_drawPageImage:forQuality:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
    objc_msgSend(v4, "_cleanup");
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    *(_BYTE *)(v4[1] + 65) = 0;
    objc_sync_exit(v3);

    objc_msgSend(*(id *)(a1 + 32), "_update");
    WeakRetained = v4;
  }

}

- (BOOL)_findPageIndexNeedingUpdate:(unint64_t *)a3 forQuality:(int *)a4
{
  PDFPageBackgroundManagerPrivate *v4;
  id WeakRetained;
  void *v9;
  int activePageIndex;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id i;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  _QWORD v23[5];
  int v24;

  v4 = self->_private;
  if (v4->activePageIndex == -1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&v4->documentDelegate);
  objc_msgSend(WeakRetained, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  activePageIndex = self->_private->activePageIndex;
  if (activePageIndex <= 1)
    activePageIndex = 1;
  v11 = (activePageIndex - 1);
  v12 = objc_msgSend(v9, "pageCount");
  if (v12 - 1 >= (unint64_t)(LODWORD(self->_private->activePageIndex) + 1))
    v13 = LODWORD(self->_private->activePageIndex) + 1;
  else
    v13 = v12 - 1;
  for (i = objc_alloc_init(MEMORY[0x24BDBCEB8]); v11 <= v13; ++v11)
  {
    v24 = 0;
    if (-[PDFPageBackgroundManager _expectedQualityIndexForPageIndex:forQuality:](self, "_expectedQualityIndexForPageIndex:forQuality:", v11, &v24))
    {
      v15 = self->_private->backgroundImageCache[v24];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(i, "addObject:", v18);

      }
    }
  }
  v19 = objc_msgSend(i, "count");
  v20 = v19 != 0;
  if (v19)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __67__PDFPageBackgroundManager__findPageIndexNeedingUpdate_forQuality___block_invoke;
    v23[3] = &unk_24C25D290;
    v23[4] = self;
    objc_msgSend(i, "sortUsingComparator:", v23);
    objc_msgSend(i, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v21, "unsignedIntegerValue");

    -[PDFPageBackgroundManager _expectedQualityIndexForPageIndex:forQuality:](self, "_expectedQualityIndexForPageIndex:forQuality:", *a3, a4);
  }

  return v20;
}

BOOL __67__PDFPageBackgroundManager__findPageIndexNeedingUpdate_forQuality___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4;
  id v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;

  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = a3;
  v6 = v4 - objc_msgSend(a2, "intValue");
  if (v6 >= 0)
    v7 = v6;
  else
    v7 = -v6;
  v8 = objc_msgSend(v5, "intValue");

  v9 = v4 - v8;
  if (v4 - v8 < 0)
    v9 = v8 - v4;
  return v7 > v9;
}

- (void)_drawPageImage:(unint64_t)a3 forQuality:(int)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PDFPageBackgroundManager *v12;
  NSMutableDictionary *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __n128 v24;
  __n128 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __n128 v37;
  __n128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MachSeconds;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  PDFPageBackgroundManager *v54;
  NSMutableDictionary *v55;
  void *v56;
  _BOOL4 v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  int v63;
  int v64;
  _QWORD v65[2];
  _QWORD v66[2];
  const __CFString *v67;
  _QWORD v68[3];

  v4 = *(_QWORD *)&a4;
  v68[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentDelegate);
  objc_msgSend(WeakRetained, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v64 = 0;
    objc_msgSend(WeakRetained, "backgroundImageForPage:withQuality:", v9, &v64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v64;
    v12 = self;
    objc_sync_enter(v12);
    v13 = self->_private->backgroundImageCache[v4];
    if (v10)
      v14 = v11 == (_DWORD)v4;
    else
      v14 = 0;
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v10, v17);

      objc_sync_exit(v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v12);
      if (v16)
      {
        objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", v16, v4, v9);
        v10 = (void *)v16;
      }
      else
      {
        v62 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
        v18 = objc_msgSend(v62, "displayBox");
        objc_msgSend(v9, "boundsForBox:", v18);
        v20 = v19;
        v22 = v21;
        v23 = kPDFPageBackgroundQualityFactors[v4];
        if ((PDFKitDeviceIsN61() & 1) != 0 || PDFKitDeviceIsN56())
          v26 = 400.0;
        else
          v26 = 800.0;
        v27 = v26;
        v28 = v23 * v20;
        v29 = v23 * v22;
        if (v23 * v20 > v26 || v29 > v26)
        {
          v24.n128_u64[0] = 0;
          v25.n128_u64[0] = 0;
          v30 = PDFRectMake(v24, v25, v23 * v20, v29);
          v32 = v31;
          v34 = v33;
          v36 = v35;
          v37.n128_u64[0] = 0;
          v38.n128_u64[0] = 0;
          v39 = PDFRectMake(v37, v38, v27, v27);
          v43 = PDFScaleRectToRect(v30, v32, v34, v36, v39, v40, v41, v42);
          v28 = v28 * v43;
          v29 = v29 * v43;
        }
        MachSeconds = GetMachSeconds();
        v67 = CFSTR("PDFPageImageProperty_WithRotation");
        v68[0] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageOfSize:forBox:withOptions:", v18, v45, ceil(v28), ceil(v29));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && !self->_private->isCancled)
        {
          if (GetDefaultsWriteLogPerfTimes())
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "timeIntervalSince1970");
            v48 = v47;

            objc_msgSend(v10, "size");
            v50 = v49;
            objc_msgSend(v10, "size");
            v52 = v51;
            v53 = GetMachSeconds();
            NSLog(CFSTR("PDFKit2_LogPerfTime: PDFPageBackgroundManager has draw page index %d (%d x %d reolution). Milliseconds since epoch: %llu. Time taken: %0.3f."), a3, (int)v50, (int)v52, (unint64_t)(v48 * 1000.0), v53 - MachSeconds);
          }
          v54 = v12;
          objc_sync_enter(v54);
          v55 = self->_private->backgroundImageCache[v4];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v55, "setObject:forKey:", v10, v56);

          objc_sync_exit(v54);
          v63 = 0;
          v57 = -[PDFPageBackgroundManager _expectedQualityIndexForPageIndex:forQuality:](v54, "_expectedQualityIndexForPageIndex:forQuality:", a3, &v63);
          if (v63 == (_DWORD)v4 && v57)
            objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", v10, v4, v9);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = CFSTR("page");
          v65[1] = CFSTR("quality");
          v66[0] = v9;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v60;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("PDFPageBackgroundComplete"), v54, v61);

        }
      }
    }

  }
}

- (BOOL)_expectedQualityIndexForPageIndex:(unint64_t)a3 forQuality:(int *)a4
{
  PDFPageBackgroundManager *v5;
  id WeakRetained;
  int v7;
  unint64_t v8;
  BOOL v9;
  int activePageIndex;
  void *v11;
  int v12;
  int v13;

  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_private->documentDelegate);
  v7 = 0;
  v8 = 0;
  v9 = 1;
  while (1)
  {
    activePageIndex = v5->_private->activePageIndex;
    objc_msgSend(WeakRetained, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "pageCount");

    if (((activePageIndex - v7) & ~((activePageIndex - v7) >> 31)) <= a3)
    {
      v13 = v12 - 1;
      if (v12 - 1 >= v7 + LODWORD(v5->_private->activePageIndex))
        v13 = v7 + LODWORD(v5->_private->activePageIndex);
      if (v13 >= a3)
        break;
    }
    v9 = v8 < 2;
    v7 = kPDFPageBackgroundQualtyRanges[++v8];
    if (v8 == 2)
    {
      v9 = 0;
      goto LABEL_9;
    }
  }
  *a4 = v8;
LABEL_9:

  objc_sync_exit(v5);
  return v9;
}

- (void)_cleanup
{
  PDFPageBackgroundManager *v2;
  PDFPageBackgroundManagerPrivate *v3;
  void *v4;
  void *v5;
  PDFPageBackgroundManager *v6;
  int activePageIndex;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  id v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *v34;
  void *v35;
  NSMutableDictionary *v36;
  PDFPageBackgroundManager *obj;
  unint64_t v38;
  id WeakRetained;
  int v40;
  unsigned int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  obj = v2;
  v3 = v2->_private;
  if (v3->activePageIndex != -1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v3->documentDelegate);
    objc_msgSend(WeakRetained, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v2;
    if (SLODWORD(v2->_private->activePageIndex) <= 1)
      activePageIndex = 1;
    else
      activePageIndex = v2->_private->activePageIndex;
    v8 = 0;
    v9 = (activePageIndex - 1);
    v10 = objc_msgSend(v4, "pageCount", obj) - 1;
    if (v10 >= LODWORD(v6->_private->activePageIndex) + 1)
      v10 = LODWORD(v6->_private->activePageIndex) + 1;
    v38 = v10;
    do
    {
      v11 = obj->_private->backgroundImageCache[v8];
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v13 = v11;
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v17, "intValue") < v9
              || v38 < (int)objc_msgSend(v17, "intValue"))
            {
              objc_msgSend(v5, "pageAtIndex:", (int)objc_msgSend(v17, "intValue"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", 0, v8, v18);
              objc_msgSend(v12, "addObject:", v17);

            }
          }
          v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v14);
      }

      -[NSMutableDictionary removeObjectsForKeys:](v13, "removeObjectsForKeys:", v12);
      ++v8;
    }
    while (v8 != 3);
    if (v38 >= v9)
    {
      while (1)
      {
        v41 = 0;
        if (-[PDFPageBackgroundManager _expectedQualityIndexForPageIndex:forQuality:](obj, "_expectedQualityIndexForPageIndex:forQuality:", v9, &v41))
        {
          break;
        }
LABEL_36:
        if (++v9 > v38)
          goto LABEL_37;
      }
      objc_msgSend(v5, "pageAtIndex:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(WeakRetained, "backgroundImageForPage:withQuality:", v19, &v40);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
      {
        if (v41 == v40)
        {
          v22 = (void *)v20;
LABEL_35:

          goto LABEL_36;
        }
        v23 = obj->_private->backgroundImageCache[v41];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v23, "objectForKey:", v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(WeakRetained, "recieveBackgroundImage:atBackgroundQuality:forPage:", v22, v41, v19);
        v25 = obj->_private->backgroundImageCache[v40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v25, "removeObjectForKey:", v26);

        if (v22)
          goto LABEL_35;
      }
      if (v41)
      {
        if (v41 == 1)
        {
          v34 = obj->_private->backgroundImageCache[2];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v34, "removeObjectForKey:", v35);

          v36 = obj->_private->backgroundImageCache[0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v36, "removeObjectForKey:", v30);
        }
        else
        {
          if (v41 != 2)
          {
LABEL_34:
            v22 = 0;
            goto LABEL_35;
          }
          v27 = obj->_private->backgroundImageCache[1];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v27, "removeObjectForKey:", v28);

          v29 = obj->_private->backgroundImageCache[0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v29, "removeObjectForKey:", v30);
        }
      }
      else
      {
        v31 = obj->_private->backgroundImageCache[2];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v31, "removeObjectForKey:", v32);

        v33 = obj->_private->backgroundImageCache[1];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v33, "removeObjectForKey:", v30);
      }

      goto LABEL_34;
    }
LABEL_37:

  }
  objc_sync_exit(obj);

}

- (void)_shiftImagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4
{
  uint64_t i;
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  PDFPageBackgroundManager *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  obj = self;
  objc_sync_enter(obj);
  for (i = 0; i != 3; ++i)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = obj->_private->backgroundImageCache[i];
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v7;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
          v13 = objc_msgSend(v12, "intValue");
          -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)v13 < a3)
            v15 = v13;
          else
            v15 = v13 + 1;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v16);

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v17 = (uint64_t)obj->_private + 8 * i;
    v18 = *(void **)(v17 + 32);
    *(_QWORD *)(v17 + 32) = v6;
    v19 = v6;

  }
  objc_sync_exit(obj);

}

- (BOOL)drawProgressCallback
{
  return !self->_private->isCancled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
