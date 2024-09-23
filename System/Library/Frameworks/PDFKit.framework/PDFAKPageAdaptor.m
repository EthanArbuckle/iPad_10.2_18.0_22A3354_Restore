@implementation PDFAKPageAdaptor

- (PDFAKPageAdaptor)initWithPDFPage:(id)a3
{
  id v4;
  id v5;
  PDFAKPageAdaptor *v6;

  v4 = a3;
  if (GetDefaultsWriteAKEnabled())
  {
    v5 = objc_alloc_init((Class)AKPageModelControllerClass());
    objc_msgSend(v5, "setRepresentedObject:", v4);
    self = -[PDFAKPageAdaptor initWithPDFPage:pageModelController:](self, "initWithPDFPage:pageModelController:", v4, v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PDFAKPageAdaptor)initWithPDFPage:(id)a3 pageModelController:(id)a4
{
  id v6;
  id v7;
  PDFAKPageAdaptor *v8;
  uint64_t v9;
  PDFAKPageAdaptorPrivate *v10;
  PDFAKPageAdaptor *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (GetDefaultsWriteAKEnabled())
  {
    v13.receiver = self;
    v13.super_class = (Class)PDFAKPageAdaptor;
    v8 = -[PDFAKPageAdaptor init](&v13, sel_init);
    if (v8)
    {
      v9 = objc_opt_new();
      v10 = v8->_private;
      v8->_private = (PDFAKPageAdaptorPrivate *)v9;

      objc_storeWeak((id *)&v8->_private->pdfPage, v6);
      objc_storeStrong((id *)&v8->_private->akPageModelController, a4);
      -[PDFAKPageAdaptor _startObservingPageModel](v8, "_startObservingPageModel");
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_private->isTornDown)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      -[PDFAKPageAdaptor _teardown](self, "_teardown");
    else
      NSLog(CFSTR("%s: Called from a background thread, and we aren't torn down yet!"), "-[PDFAKPageAdaptor dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKPageAdaptor;
  -[PDFAKPageAdaptor dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFAKPageAdaptor _teardown](self, "_teardown");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__PDFAKPageAdaptor_teardown__block_invoke;
    block[3] = &unk_24C25C350;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __28__PDFAKPageAdaptor_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardown");
}

- (void)_teardown
{
  PDFAKPageAdaptorPrivate *v2;
  PDFAKPageAdaptorPrivate *v4;
  AKPageModelController *akPageModelController;

  v2 = self->_private;
  if (v2)
  {
    if (!v2->isTornDown)
    {
      v2->isTornDown = 1;
      -[PDFAKPageAdaptor _stopObservingPageModel](self, "_stopObservingPageModel");
      v4 = self->_private;
      akPageModelController = v4->akPageModelController;
      v4->akPageModelController = 0;

      objc_storeWeak((id *)&self->_private->pdfPage, 0);
    }
  }
}

- (PDFPage)pdfPage
{
  return (PDFPage *)objc_loadWeakRetained((id *)&self->_private->pdfPage);
}

- (AKPageModelController)akPageModelController
{
  return self->_private->akPageModelController;
}

- (void)pdfPage:(id)a3 didAddAnnotation:(id)a4
{
  PDFAKPageAdaptorPrivate *v4;
  BOOL isSyncingFromPDFPage;
  void *v7;
  void *v8;
  id v9;

  v4 = self->_private;
  if (!v4->isSyncingFromAKPageModel)
  {
    isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
    v4->isSyncingFromPDFPage = 1;
    objc_msgSend(a4, "akAnnotationAdaptor", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "akAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PDFAKPageAdaptor initializeExifAndScaleOnAnnotation:](self, "initializeExifAndScaleOnAnnotation:", v7);
      -[AKPageModelController mutableArrayValueForKey:](self->_private->akPageModelController, "mutableArrayValueForKey:", CFSTR("annotations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
    self->_private->isSyncingFromPDFPage = isSyncingFromPDFPage;

  }
}

- (void)pdfPage:(id)a3 didRemoveAnnotation:(id)a4
{
  PDFAKPageAdaptorPrivate *v4;
  BOOL isSyncingFromPDFPage;
  void *v7;
  void *v8;
  id v9;

  v4 = self->_private;
  if (!v4->isSyncingFromAKPageModel)
  {
    isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
    v4->isSyncingFromPDFPage = 1;
    objc_msgSend(a4, "akAnnotationAdaptor", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "akAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AKPageModelController mutableArrayValueForKey:](self->_private->akPageModelController, "mutableArrayValueForKey:", CFSTR("annotations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v7);

    }
    self->_private->isSyncingFromPDFPage = isSyncingFromPDFPage;

  }
}

- (void)pdfPageWasRotated:(id)a3
{
  PDFAKPageAdaptorPrivate *v4;
  BOOL isSyncingFromPDFPage;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = self->_private;
  isSyncingFromPDFPage = v4->isSyncingFromPDFPage;
  v4->isSyncingFromPDFPage = 1;
  objc_msgSend(a3, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "akAnnotationAdaptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "invalidateAppearanceStream");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  self->_private->isSyncingFromPDFPage = isSyncingFromPDFPage;

}

- (void)initializeExifAndScaleOnAnnotation:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "originalModelBaseScaleFactor");
  if (v4 == 0.0 || !objc_msgSend(v21, "originalExifOrientation"))
  {
    -[PDFAKPageAdaptor pdfPage](self, "pdfPage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
    if (v6 && (objc_msgSend(v6, "window"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      objc_msgSend(v5, "document");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "akDocumentAdaptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "akMainController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "modelController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pageModelControllers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "indexOfObjectIdenticalTo:", self->_private->akPageModelController);

          if (v17 == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v14, "isOverlayViewLoadedAtIndex:", v17))
          {
            v19 = 1;
          }
          else
          {
            objc_msgSend(v14, "currentModelBaseScaleFactorForPageAtIndex:", v17);
            v8 = v18;
            v19 = objc_msgSend(v14, "currentExifOrientationForPageAtIndex:", v17);
          }

        }
        else
        {
          v19 = 1;
        }

      }
      else
      {
        v19 = 1;
      }

    }
    else
    {
      v19 = 1;
    }
    objc_msgSend(v21, "originalModelBaseScaleFactor");
    if (v20 == 0.0)
      objc_msgSend(v21, "setOriginalModelBaseScaleFactor:", v8);
    if (!objc_msgSend(v21, "originalExifOrientation"))
      objc_msgSend(v21, "setOriginalExifOrientation:", v19);

  }
}

- (void)_startObservingPageModel
{
  PDFAKPageAdaptorPrivate *v2;
  AKPageModelController *v4;

  v2 = self->_private;
  if (!v2->isObservingPageModel)
  {
    v2->isObservingPageModel = 1;
    v4 = self->_private->akPageModelController;
    -[AKPageModelController addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", self, CFSTR("annotations"), 3, CFSTR("PDFAKPageAdaptor.modelAnnotationsObservationContext"));
    -[AKPageModelController addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedAnnotations"), 3, CFSTR("PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext"));

  }
}

- (void)_stopObservingPageModel
{
  PDFAKPageAdaptorPrivate *v2;
  AKPageModelController *v4;

  v2 = self->_private;
  if (v2->isObservingPageModel)
  {
    v4 = v2->akPageModelController;
    -[AKPageModelController removeObserver:forKeyPath:context:](v4, "removeObserver:forKeyPath:context:", self, CFSTR("annotations"), CFSTR("PDFAKPageAdaptor.modelAnnotationsObservationContext"));
    -[AKPageModelController removeObserver:forKeyPath:context:](v4, "removeObserver:forKeyPath:context:", self, CFSTR("selectedAnnotations"), CFSTR("PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext"));
    self->_private->isObservingPageModel = 0;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  PDFAKPageAdaptorPrivate *v13;
  BOOL isSyncingFromAKPageModel;
  AKPageModelController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("PDFAKPageAdaptor.modelAnnotationsObservationContext"))
  {
    v13 = self->_private;
    if (!v13->isSyncingFromPDFPage)
    {
      isSyncingFromAKPageModel = v13->isSyncingFromAKPageModel;
      v13->isSyncingFromAKPageModel = 1;
      v15 = self->_private->akPageModelController;
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[PDFAKPageAdaptor _annotationsWereRemoved:](self, "_annotationsWereRemoved:", v16);
      if (v17)
        -[PDFAKPageAdaptor _annotationsWereAdded:](self, "_annotationsWereAdded:", v17);
      self->_private->isSyncingFromAKPageModel = isSyncingFromAKPageModel;

    }
  }
  else if (a6 == CFSTR("PDFAKPageAdaptor.modelSelectedAnnotationsObservationContext"))
  {
    v33 = v11;
    v34 = v10;
    -[AKPageModelController selectedAnnotations](self->_private->akPageModelController, "selectedAnnotations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PDFAKPageAdaptor pdfPage](self, "pdfPage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "annotations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v26, "akAnnotationAdaptor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "akAnnotation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28 && objc_msgSend(v19, "containsObject:", v28))
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v23);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = CFSTR("PDFAnnotationsHit");
    v41 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("PDFViewAnnotationHit"), v30, v31);

    v11 = v33;
    v10 = v34;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)PDFAKPageAdaptor;
    -[PDFAKPageAdaptor observeValueForKeyPath:ofObject:change:context:](&v35, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_annotationsWereRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  -[PDFAKPageAdaptor pdfPage](self, "pdfPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "akAnnotationAdaptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "akAnnotation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && objc_msgSend(v4, "containsObject:", v14))
          objc_msgSend(v5, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v6, "removeAnnotation:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (void)_annotationsWereAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  AKPageModelController *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PDFAKPageAdaptor pdfPage](self, "pdfPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self->_private->akPageModelController;
  -[AKPageModelController annotations](v28, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v4;
  v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v33)
  {
    v8 = *(_QWORD *)v40;
    v9 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
    v29 = *(_QWORD *)v40;
    v30 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10);
        v12 = objc_msgSend(v9 + 294, "newPDFAnnotationFromAKAnnotation:", v11);
        v13 = (void *)v12;
        if (v12)
        {
          v34 = (void *)v12;
          v14 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v11);
          for (i = v14 + 1; ; ++i)
          {
            if (i >= objc_msgSend(v6, "count"))
              goto LABEL_14;
            objc_msgSend(v6, "objectAtIndex:", i);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v7, "containsObject:", v16) & 1) == 0)
            {
              AKCropAnnotationClass();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
            }

          }
          if (v16)
          {
            v32 = 0;
            goto LABEL_25;
          }
LABEL_14:
          if (v14 - 1 < 1)
          {
LABEL_18:
            v16 = 0;
            goto LABEL_19;
          }
          while (1)
          {
            objc_msgSend(v6, "objectAtIndex:", --v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v7, "containsObject:", v16) & 1) == 0)
            {
              AKCropAnnotationClass();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
            }

            if (v14 <= 1)
              goto LABEL_18;
          }
          if (v16)
          {
            v32 = 1;
LABEL_25:
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v17 = v31;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v36;
LABEL_27:
              v21 = 0;
              while (1)
              {
                if (*(_QWORD *)v36 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
                objc_msgSend(v22, "akAnnotationAdaptor");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "akAnnotation");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24 == v16)
                  break;

                if (v19 == ++v21)
                {
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                  v9 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
                  if (v19)
                    goto LABEL_27;
                  goto LABEL_33;
                }
              }
              v25 = v22;

              if (v25)
              {
                v26 = objc_msgSend(v17, "indexOfObjectIdenticalTo:", v25);
                v5 = v30;
                v13 = v34;
                objc_msgSend(v30, "insertAnnotation:atIndex:", v34, v26 + v32);

                v8 = v29;
                v9 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
                goto LABEL_20;
              }
              v8 = v29;
              v5 = v30;
              v9 = &OBJC_IVAR___PDFDestinationPrivate_zoom;
            }
            else
            {
LABEL_33:

              v8 = v29;
              v5 = v30;
            }
          }
LABEL_19:
          v13 = v34;
          objc_msgSend(v5, "addAnnotation:", v34);
LABEL_20:

        }
        ++v10;
      }
      while (v10 != v33);
      v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      v33 = v27;
    }
    while (v27);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
