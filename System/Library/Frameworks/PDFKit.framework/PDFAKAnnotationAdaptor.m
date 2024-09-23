@implementation PDFAKAnnotationAdaptor

+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5
{
  return +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:updatePDFAnnotationIfNeeded:](PDFAKAnnotationAdaptor, "annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:updatePDFAnnotationIfNeeded:", a3, a4, a5, 1);
}

+ (PDFAKAnnotationAdaptor)annotationAdaptorWithPDFAnnotation:(id)a3 andCGPDFAnnotation:(CGPDFAnnotation *)a4 andPDFDictionary:(CGPDFDictionary *)a5 updatePDFAnnotationIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a6;
  v10 = a3;
  objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (!a4
    || !a5
    || (+[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:andDictionary:](PDFAKAnnotationSerializationHelper, "akAnnotationFromCGPDFAnnotation:andDictionary:", a4, a5), v13 = (void *)objc_claimAutoreleasedReturnValue(), v12 = v13 != 0, !v13))
  {
    if (!objc_msgSend(v11, "length"))
    {
      v13 = 0;
LABEL_14:
      v15 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Widget")))
    {
      objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/FT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(a1, "_akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:", v11, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      if (!v13)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(a1, "_akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:", v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_14;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPDFAnnotation:andAKAnnotation:", v10, v13);
  v15 = v17;
  if (v12)
  {
    objc_msgSend(v17, "_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:", 0);
    if (v6)
      objc_msgSend(v15, "_syncEverythingToPDFAnnotation");
  }
  else
  {
    objc_msgSend(v17, "_syncEverythingToAKAnnotation");
  }
LABEL_15:

  return (PDFAKAnnotationAdaptor *)v15;
}

+ (id)newPDFAnnotationFromAKAnnotation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;

  v5 = a3;
  if (GetDefaultsWriteAKEnabled())
  {
    objc_msgSend(a1, "_pdfAnnotationInstanceForAKAnnotation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "setupAKAnnotationAdaptorIfNecessary");
      objc_msgSend(v6, "akAnnotationAdaptor");
      v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_stopObservingAnnotation");
      objc_storeStrong((id *)(v8[1] + 24), a3);
      objc_msgSend(v8, "_syncEverythingToPDFAnnotation");
      objc_msgSend(v8, "_startObservingAnnotation");
      v9 = v6;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PDFAKAnnotationAdaptor)initWithPDFAnnotation:(id)a3 andAKAnnotation:(id)a4
{
  id v6;
  id v7;
  PDFAKAnnotationAdaptor *v8;
  uint64_t v9;
  PDFAKAnnotationAdaptorPrivate *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFAKAnnotationAdaptor;
  v8 = -[PDFAKAnnotationAdaptor init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    v10 = v8->_private;
    v8->_private = (PDFAKAnnotationAdaptorPrivate *)v9;

    objc_storeWeak((id *)&v8->_private->pdfAnnotation, v6);
    objc_storeStrong((id *)&v8->_private->akAnnotation, a4);
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "associatePDFAnnotation:withAKAnnotation:", v6, v7);
      -[PDFAKAnnotationAdaptor _startObservingAnnotation](v8, "_startObservingAnnotation");
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_private->isTornDown)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      -[PDFAKAnnotationAdaptor _teardown](self, "_teardown");
    else
      NSLog(CFSTR("%s: Called from a background thread, and we aren't torn down yet!"), "-[PDFAKAnnotationAdaptor dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKAnnotationAdaptor;
  -[PDFAKAnnotationAdaptor dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFAKAnnotationAdaptor _teardown](self, "_teardown");
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__PDFAKAnnotationAdaptor_teardown__block_invoke;
    block[3] = &unk_24C25C350;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __34__PDFAKAnnotationAdaptor_teardown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardown");
}

- (void)_teardown
{
  PDFAKAnnotationAdaptorPrivate *v2;
  PDFAKAnnotationAdaptorPrivate *v4;
  AKAnnotation *akAnnotation;

  v2 = self->_private;
  if (v2)
  {
    if (!v2->isTornDown)
    {
      v2->isTornDown = 1;
      -[PDFAKAnnotationAdaptor _stopObservingAnnotation](self, "_stopObservingAnnotation");
      v4 = self->_private;
      akAnnotation = v4->akAnnotation;
      v4->akAnnotation = 0;

      objc_storeWeak((id *)&self->_private->pdfAnnotation, 0);
    }
  }
}

- (PDFAnnotation)pdfAnnotation
{
  return (PDFAnnotation *)objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
}

- (AKAnnotation)akAnnotation
{
  return self->_private->akAnnotation;
}

+ (id)getPDFAnnotationAssociatedWith:(id)a3
{
  void *v3;
  void *v4;

  objc_getAssociatedObject(a3, CFSTR("PDFAnnotationAssociatedObjectKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weakObjectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)associatePDFAnnotation:(id)a3 withAKAnnotation:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1968];
  v6 = a4;
  objc_msgSend(v5, "valueWithWeakObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, CFSTR("PDFAnnotationAssociatedObjectKey"), v7, (void *)0x301);

}

- (void)didSetValue:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  void *v7;
  PDFAKAnnotationAdaptorPrivate *v8;
  BOOL isSyncingFromPDFAnnotation;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  v8 = self->_private;
  if (!v8->isSyncingFromAKAnnotation)
  {
    isSyncingFromPDFAnnotation = v8->isSyncingFromPDFAnnotation;
    v8->isSyncingFromPDFAnnotation = 1;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Subtype")))
    {
      -[PDFAKAnnotationAdaptor _syncSubtype:](self, "_syncSubtype:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Rect")))
    {
      objc_msgSend(v12, "PDFKitPDFRectValue");
      -[PDFAKAnnotationAdaptor _syncRect:](self, "_syncRect:");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/L")))
    {
      -[PDFAKAnnotationAdaptor _syncLinePoints:](self, "_syncLinePoints:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/C")))
    {
      -[PDFAKAnnotationAdaptor _syncColor:](self, "_syncColor:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/IC")))
    {
      -[PDFAKAnnotationAdaptor _syncInteriorColor:](self, "_syncInteriorColor:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Contents")))
    {
      -[PDFAKAnnotationAdaptor _syncContents:](self, "_syncContents:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/T")))
    {
      -[PDFAKAnnotationAdaptor _syncTextLabel:](self, "_syncTextLabel:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Border")))
    {
      -[PDFAKAnnotationAdaptor _syncBorder:](self, "_syncBorder:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/BS")))
    {
      -[PDFAKAnnotationAdaptor _syncBorderStyle:](self, "_syncBorderStyle:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/LE")))
    {
      -[PDFAKAnnotationAdaptor _syncLineEndingStyles:](self, "_syncLineEndingStyles:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Q")))
    {
      v10 = objc_msgSend(v12, "integerValue");
      if (v10 == 1)
        v11 = 1;
      else
        v11 = 2 * (v10 == 2);
      -[PDFAKAnnotationAdaptor _syncQuadding:](self, "_syncQuadding:", v11);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/InkList")))
    {
      -[PDFAKAnnotationAdaptor _syncInklist:](self, "_syncInklist:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Name")))
    {
      -[PDFAKAnnotationAdaptor _syncIconName:](self, "_syncIconName:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/H")))
    {
      -[PDFAKAnnotationAdaptor _syncHighlightingMode:](self, "_syncHighlightingMode:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/AP")))
    {
      -[PDFAKAnnotationAdaptor _syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:](self, "_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:", 0);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/AS")))
    {
      -[PDFAKAnnotationAdaptor _syncAppearanceState:](self, "_syncAppearanceState:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/DA")))
    {
      -[PDFAKAnnotationAdaptor _syncDefaultAppearance:](self, "_syncDefaultAppearance:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/F")))
    {
      -[PDFAKAnnotationAdaptor _syncFlags:](self, "_syncFlags:", objc_msgSend(v12, "unsignedLongValue"));
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/M")))
    {
      -[PDFAKAnnotationAdaptor _syncDate:](self, "_syncDate:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/NM")))
    {
      -[PDFAKAnnotationAdaptor _syncName:](self, "_syncName:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/P")))
    {
      -[PDFAKAnnotationAdaptor _syncPage:](self, "_syncPage:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/A")))
    {
      -[PDFAKAnnotationAdaptor _syncAction:](self, "_syncAction:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/AA")))
    {
      -[PDFAKAnnotationAdaptor _syncAdditionalAction:](self, "_syncAdditionalAction:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Dest")))
    {
      -[PDFAKAnnotationAdaptor _syncDestination:](self, "_syncDestination:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Open")))
    {
      -[PDFAKAnnotationAdaptor _syncOpen:](self, "_syncOpen:", objc_msgSend(v12, "BOOLValue"));
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Parent")))
    {
      -[PDFAKAnnotationAdaptor _syncParent:](self, "_syncParent:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup")))
    {
      -[PDFAKAnnotationAdaptor _syncPopup:](self, "_syncPopup:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/DV")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetDefaultValue:](self, "_syncWidgetDefaultValue:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Ff")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetFieldFlags:](self, "_syncWidgetFieldFlags:", objc_msgSend(v12, "unsignedLongValue"));
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/FT")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetFieldType:](self, "_syncWidgetFieldType:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/MK")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetAppearance:](self, "_syncWidgetAppearance:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/MaxLen")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetMaxLen:](self, "_syncWidgetMaxLen:", objc_msgSend(v12, "unsignedLongValue"));
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Opt")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetOptions:](self, "_syncWidgetOptions:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/TU")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetTextLabelUI:](self, "_syncWidgetTextLabelUI:", v12);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/V")))
    {
      -[PDFAKAnnotationAdaptor _syncWidgetValue:](self, "_syncWidgetValue:", v12);
    }
    self->_private->isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
  }

}

- (void)didRemoveValueForAnnotationKey:(id)a3
{
  PDFAKAnnotationAdaptorPrivate *v3;
  BOOL isSyncingFromPDFAnnotation;

  v3 = self->_private;
  if (!v3->isSyncingFromAKAnnotation)
  {
    isSyncingFromPDFAnnotation = v3->isSyncingFromPDFAnnotation;
    v3->isSyncingFromPDFAnnotation = 1;
    -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](self, "didSetValue:forAnnotationKey:", 0, a3);
    self->_private->isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
  }
}

- (void)didReplaceAllValuesWithNewDictionary:(id)a3 andOldDictionary:(id)a4
{
  id v6;
  PDFAKAnnotationAdaptorPrivate *v7;
  BOOL isSyncingFromPDFAnnotation;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self->_private;
  if (!v7->isSyncingFromAKAnnotation)
  {
    isSyncingFromPDFAnnotation = v7->isSyncingFromPDFAnnotation;
    v7->isSyncingFromPDFAnnotation = 1;
    v9 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(a4, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v6, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minusSet:", v14);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](self, "didSetValue:forAnnotationKey:", 0, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v17);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](self, "didSetValue:forAnnotationKey:", v26, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v22);
    }

    -[PDFAKAnnotationAdaptor _syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:](self, "_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:", 1);
    self->_private->isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;

  }
}

- (void)invalidateAppearanceStream
{
  void *v2;
  void *v3;
  id v4;

  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "setDictionaryRef:", 0);
    objc_msgSend(v4, "page");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "changedAnnotation:", v4);

    v2 = v4;
  }

}

- (void)_syncSubtype:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  PDFAKAnnotationAdaptorPrivate *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Widget")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/FT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || !objc_msgSend(v6, "length"))
    {
      v7 = 0;
      goto LABEL_11;
    }
    objc_msgSend((id)objc_opt_class(), "_akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!v7)
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->_private;
  if (v7 == v8)
  {
    v10 = objc_loadWeakRetained((id *)&v9->pdfAnnotation);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PDFAKAnnotationAdaptor__syncSubtype___block_invoke;
    block[3] = &unk_24C25C350;
    v13 = v10;
    v11 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_storeStrong((id *)&v9->akAnnotation, v7);
    -[PDFAKAnnotationAdaptor _startObservingAnnotation](self, "_startObservingAnnotation");
  }
LABEL_11:

}

uint64_t __39__PDFAKAnnotationAdaptor__syncSubtype___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAKAnnotationAdaptor");
}

- (void)_syncWidgetFieldType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PDFAKAnnotationAdaptorPrivate *v7;
  uint64_t v8;
  char isKindOfClass;
  id WeakRetained;
  void *v11;
  AKAnnotation *v12;
  PDFAKAnnotationAdaptorPrivate *v13;
  AKAnnotation *akAnnotation;
  AKAnnotation *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v16;
    if (v6)
    {
      v7 = self->_private;
      if (v7->akAnnotation)
      {
        v8 = objc_msgSend((id)objc_opt_class(), "_akAnnotationSubclassForWidgetFieldType:", v16);
        v7 = self->_private;
        if (v8)
        {
          isKindOfClass = objc_opt_isKindOfClass();
          v5 = v16;
          if ((isKindOfClass & 1) != 0)
            goto LABEL_13;
          v7 = self->_private;
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&v7->pdfAnnotation);
      objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("/Widget")) & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "_akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:", v11, v16);
        v12 = (AKAnnotation *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = self->_private;
          akAnnotation = v13->akAnnotation;
          v13->akAnnotation = v12;
          v15 = v12;

          -[PDFAKAnnotationAdaptor _startObservingAnnotation](self, "_startObservingAnnotation");
        }
      }
      else if (v11)
      {
        NSLog(CFSTR("%s: Setting widget field type (%@) on a non-widget of type %@."), "-[PDFAKAnnotationAdaptor _syncWidgetFieldType:]", v16, v11);
      }

      v5 = v16;
    }
  }
LABEL_13:

}

- (void)_syncEverythingToAKAnnotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGPDFDictionary *v7;
  _BOOL4 Dictionary;
  void *v9;
  CGPDFDictionaryRef value;

  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotationKeyValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CGPDFDictionary *)objc_msgSend(v3, "sourceDictionary");
  value = 0;
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("/Subtype"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("/AP"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("/P"));
  Dictionary = CGPDFDictionaryGetDictionary(v7, "AAPL:AKExtras", &value);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/FreeText")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("/Text")) & 1) == 0
    && ((Dictionary | objc_msgSend(v6, "isEqualToString:", CFSTR("/Popup"))) & 1) == 0)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("/Contents"));
  }
  -[PDFAKAnnotationAdaptor didReplaceAllValuesWithNewDictionary:andOldDictionary:](self, "didReplaceAllValuesWithNewDictionary:andOldDictionary:", v5, MEMORY[0x24BDBD1B8]);
  objc_msgSend(v4, "objectForKey:", CFSTR("/P"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](self, "didSetValue:forAnnotationKey:", v9, CFSTR("/P"));

}

- (void)_syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  PDFAKAnnotationAdaptorPrivate *v7;
  BOOL isSyncingFromPDFAnnotation;
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
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, CGContext *);
  void *v27;
  id v28;
  id v29[5];
  id from;
  id location;

  v3 = a3;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_private;
  isSyncingFromPDFAnnotation = v7->isSyncingFromPDFAnnotation;
  v7->isSyncingFromPDFAnnotation = 1;
  if (objc_msgSend(v5, "appearance:", 0))
  {
    objc_msgSend(v5, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      NSLog(&CFSTR("Could not sync appearance dictionary. We need to have access to the PDFPage, otherwise we can't set the app"
                   "earanceOverride block.").isa);
      goto LABEL_12;
    }
    v10 = v9;
    objc_msgSend(v9, "akPageAdaptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "initializeExifAndScaleOnAnnotation:", v6);

    objc_initWeak(&location, v5);
    objc_initWeak(&from, v6);
    objc_msgSend(v5, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __90__PDFAKAnnotationAdaptor__syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride___block_invoke;
    v27 = &unk_24C25CF20;
    objc_copyWeak(&v28, &location);
    v29[1] = v13;
    v29[2] = v15;
    v29[3] = v17;
    v29[4] = v19;
    objc_copyWeak(v29, &from);
    objc_msgSend(v6, "setAppearanceOverride:", &v24);
    if (v3)
    {
      objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/Subtype"), v24, v25, v26, v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("/Stamp")) & 1) != 0
        || (objc_msgSend(v20, "isEqualToString:", CFSTR("/Ink")) & 1) != 0)
      {
        v21 = 0;
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("/Widget")))
      {
        objc_msgSend(v5, "valueForAnnotationKey:", CFSTR("/FT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("/Sig"));

        v21 = v23 ^ 1u;
      }
      else
      {
        v21 = 1;
      }
      objc_msgSend(v6, "setEditsDisableAppearanceOverride:", v21);

    }
    objc_destroyWeak(v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v6, "setAppearanceOverride:", 0);
  }
  self->_private->isSyncingFromPDFAnnotation = isSyncingFromPDFAnnotation;
LABEL_12:

}

void __90__PDFAKAnnotationAdaptor__syncAppearanceDictionaryUpdatingEditsDisableAppearanceOverride___block_invoke(uint64_t a1, CGContext *a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v15;
  void *v16;
  CGAffineTransform v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "appearance:", 0);
    if (v6)
    {
      v7 = v6;
      CGContextSaveGState(a2);
      v8 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
      objc_msgSend(v5, "page");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "boundsForBox:", 0);
      v11 = v10;
      v13 = v12;

      if (v11 != *MEMORY[0x24BDBEFB0] || v13 != *(double *)(MEMORY[0x24BDBEFB0] + 8))
      {
        CGAffineTransformMakeTranslation(&v17, v11, v13);
        CGContextConcatCTM(a2, &v17);
      }
      objc_msgSend(v5, "drawAppearance:withBox:inContext:inRect:scaleProportional:", v7, 0, a2, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v8);
      CGContextRestoreGState(a2);
    }
    else
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 40));
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "setAppearanceOverride:", 0);

    }
  }

}

- (void)_syncBorder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  id v26;

  v26 = a3;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/BS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setStrokeWidth:", 1.0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setCornerRadius:", 0.0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setDashed:", 0);
      goto LABEL_37;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v26;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "lineWidth");
        objc_msgSend(v6, "setStrokeWidth:");
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "horizontalCornerRadius");
        v9 = v8;
        objc_msgSend(v7, "verticalCornerRadius");
        if (v9 >= v10)
          v10 = v9;
        objc_msgSend(v6, "setCornerRadius:", v10);
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_36;
      if (objc_msgSend(v7, "style") == 1)
      {
        v11 = 1;
      }
      else
      {
        objc_msgSend(v7, "dashPattern");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (unint64_t)objc_msgSend(v23, "count") > 1;

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(CFSTR("%s: Unexpected border instance: %@"), "-[PDFAKAnnotationAdaptor _syncBorder:]", v26);
LABEL_37:

        goto LABEL_38;
      }
      v7 = v26;
      v12 = objc_msgSend(v7, "count");
      if (v12 < 3)
      {
        v11 = 0;
        v19 = 0.0;
        v22 = 1.0;
        v16 = 0.0;
      }
      else
      {
        v13 = v12;
        objc_msgSend(v7, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        objc_msgSend(v7, "objectAtIndex:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        objc_msgSend(v7, "objectAtIndex:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        if (v13 == 3)
        {
          v11 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:", 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v24 != 0;

        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setStrokeWidth:", v22);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (v16 >= v19)
          v25 = v16;
        else
          v25 = v19;
        objc_msgSend(v6, "setCornerRadius:", v25);
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    objc_msgSend(v6, "setDashed:", v11);
    goto LABEL_36;
  }
LABEL_38:

}

- (void)_syncBorderStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("/W"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(v4, "setStrokeWidth:");
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("/S"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setDashed:", objc_msgSend(v6, "isEqualToString:", CFSTR("/D")));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setCornerRadius:", 0.0);

  }
  else
  {
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForAnnotationKey:", CFSTR("/Border"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PDFAKAnnotationAdaptor _syncBorder:](self, "_syncBorder:", v4);
  }

}

- (void)_syncColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("/FreeText"));

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PDFAKAnnotationAdaptor _colorFromColorOrArray:](self, "_colorFromColorOrArray:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFillColor:", v8);
LABEL_6:

    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PDFAKAnnotationAdaptor _colorFromColorOrArray:](self, "_colorFromColorOrArray:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrokeColor:", v8);
    goto LABEL_6;
  }

}

- (void)_syncInteriorColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PDFAKAnnotationAdaptor _colorFromColorOrArray:](self, "_colorFromColorOrArray:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFillColor:", v5);

  }
}

- (void)_syncContents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2546010F0))
  {
    v5 = v4;
    if (v8)
    {
      objc_msgSend(v5, "typingAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6778]), "initWithString:attributes:", v8, v6);
      objc_msgSend(v5, "setAnnotationText:", v7);

    }
    else
    {
      objc_msgSend(v5, "setAnnotationText:", 0);
    }

  }
}

- (void)_syncDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModificationDate:", v4);

}

- (void)_syncPage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appearanceOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](self, "didSetValue:forAnnotationKey:", v5, CFSTR("/AP"));

    }
  }
}

- (void)_syncRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setRectangle:", x, y, width, height);

}

- (void)_syncDefaultAppearance:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2546010F0))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    objc_msgSend(WeakRetained, "getFontFromAppearanceNSString:", v19);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getColorFromAppearanceNSString:", v19);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
    {
      objc_msgSend(v5, "annotationText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "typingAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      v18 = v10;
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      v13 = objc_msgSend(v9, "length");
      if (v7)
      {
        v14 = *MEMORY[0x24BDF65F8];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v7, 0, v13);
        objc_msgSend(v12, "setObject:forKey:", v7, v14);
      }
      if (v8)
      {
        v15 = *MEMORY[0x24BDF6600];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x24BDF6600], v8, 0, v13);
        objc_msgSend(v12, "setObject:forKey:", v8, v15);
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6778]), "initWithAttributedString:", v11);
      objc_msgSend(v5, "setAnnotationText:", v16);

      v17 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v5, "setTypingAttributes:", v17);

    }
  }

}

- (void)_syncQuadding:(int64_t)a3
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  int64_t v34;

  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v31, "conformsToProtocol:", &unk_2546010F0);
  v5 = v31;
  if (!v4)
    goto LABEL_21;
  v6 = v31;
  objc_msgSend(v6, "annotationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v12 = 0;
    v10 = *MEMORY[0x24BDF6628];
    goto LABEL_8;
  }
  v9 = objc_msgSend(v7, "length");
  v10 = *MEMORY[0x24BDF6628];
  if (!v9)
  {
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 1;
  if (!v11)
  {
LABEL_8:
    objc_msgSend(v6, "typingAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = 1;
    goto LABEL_11;
  }
  v13 = (void *)v11;
  v14 = 0;
LABEL_11:
  if (objc_msgSend(v13, "alignment") != a3)
  {
    v28 = v14;
    v16 = v12;
    v30 = v8;
    objc_msgSend(v6, "typingAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v29, "mutableCopy");
    objc_msgSend(v6, "typingAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v21, "mutableCopy");

    }
    objc_msgSend(v20, "setAlignment:", a3);
    objc_msgSend(v17, "setObject:forKey:", v20, v10);
    v22 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v6, "setTypingAttributes:", v22);

    v23 = v30;
    if (v16)
    {
      v24 = (void *)objc_msgSend(v30, "mutableCopy");
      v25 = objc_msgSend(v30, "length");
      if ((v28 & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(v24, "addAttribute:value:range:", v10, v26, 0, v25);
      }
      else
      {
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __40__PDFAKAnnotationAdaptor__syncQuadding___block_invoke;
        v32[3] = &unk_24C25CF48;
        v34 = a3;
        v33 = v24;
        objc_msgSend(v30, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v25, 0x100000, v32);
        v26 = v33;
      }

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6778]), "initWithAttributedString:", v24);
      objc_msgSend(v6, "setAnnotationText:", v27);

      v23 = v30;
    }

  }
  v5 = v31;
LABEL_21:

}

void __40__PDFAKAnnotationAdaptor__syncQuadding___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v7, "setAlignment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x24BDF6628], v7, a3, a4);

}

- (void)_syncLinePoints:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = v4;
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AKArrowAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v19, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(v19, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      objc_msgSend(v19, "objectAtIndex:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      objc_msgSend(v19, "objectAtIndex:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      objc_msgSend(v6, "setStartPoint:", v9, v12);
      objc_msgSend(v6, "setEndPoint:", v15, v18);
      objc_msgSend(v6, "setMidPoint:", (v9 + v15) * 0.5, (v12 + v18) * 0.5);

    }
    v4 = v19;
  }

}

- (void)_syncLineEndingStyles:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AKArrowAnnotationClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v13, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("/None"));
    v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("/None"));
    v10 = 3;
    if (v8 | v9)
      v10 = 1;
    v11 = 2;
    if (v9)
      v11 = 0;
    if (v8)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v5, "setArrowHeadStyle:", v12);

  }
}

- (void)_syncParent:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v12;
  }
  else
  {
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotationWithUUID:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "akAnnotationAdaptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "akAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254601150)
    && ((objc_msgSend(v11, "conformsToProtocol:", &unk_2546011B0) & 1) != 0 || !v11))
  {
    objc_msgSend(v4, "setParentAnnotation:", v11);
  }

}

- (void)_syncPopup:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v12;
  }
  else
  {
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotationWithUUID:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "akAnnotationAdaptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "akAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2546011B0)
    && ((objc_msgSend(v11, "conformsToProtocol:", &unk_254601150) & 1) != 0 || !v11))
  {
    objc_msgSend(v4, "setChildAnnotation:", v11);
  }

}

- (void)_syncTextLabel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isMarkupAnnotation"))
  {
    objc_msgSend(v4, "setAuthor:", v6);
  }
  else
  {
    AKTextFieldAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setFieldName:", v6);
  }

}

- (void)_syncEverythingToPDFAnnotation
{
  void *v3;
  void *v4;
  PDFAKAnnotationAdaptorPrivate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL isSyncingFromAKAnnotation;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_private;
  isSyncingFromAKAnnotation = v5->isSyncingFromAKAnnotation;
  v5->isSyncingFromAKAnnotation = 1;
  v6 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "drawingBounds");
  objc_msgSend(v6, "PDFKitValueWithPDFRect:");
  v26 = v3;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forAnnotationKey:");
  objc_msgSend(v4, "keysForValuesToObserveForUndo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C27DBA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    v13 = *MEMORY[0x24BDD0E68];
    v14 = *MEMORY[0x24BDD0E70];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
        {
          v34[0] = v13;
          v34[1] = v14;
          v35[0] = &unk_24C27D718;
          v35[1] = v17;
          v19 = (void *)MEMORY[0x24BDBCE70];
          v20 = (void **)v35;
          v21 = v34;
          v22 = 2;
        }
        else
        {
          v32 = v13;
          v33 = &unk_24C27D730;
          v19 = (void *)MEMORY[0x24BDBCE70];
          v20 = &v33;
          v21 = &v32;
          v22 = 1;
        }
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFAKAnnotationAdaptor observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", v16, v4, v23, CFSTR("PDFAKAnnotationAdaptor.annotationPropertyObservationContext"));

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v11);
  }

  self->_private->isSyncingFromAKAnnotation = isSyncingFromAKAnnotation;
}

- (void)_startObservingAnnotation
{
  PDFAKAnnotationAdaptorPrivate *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (GetDefaultsWriteAKEnabled())
  {
    v3 = self->_private;
    if (!v3->isObservingAKAnnotation)
    {
      v3->isObservingAKAnnotation = 1;
      -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keysForValuesToObserveForUndo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 3, CFSTR("PDFAKAnnotationAdaptor.annotationPropertyObservationContext"));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_stopObservingAnnotation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (GetDefaultsWriteAKEnabled() && self->_private->isObservingAKAnnotation)
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keysForValuesToObserveForUndo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    self->_private->isObservingAKAnnotation = 0;

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  PDFAKAnnotationAdaptorPrivate *v19;
  BOOL isSyncingFromAKAnnotation;
  id WeakRetained;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == CFSTR("PDFAKAnnotationAdaptor.annotationPropertyObservationContext"))
  {
    if (self->_private->isSyncingFromPDFAnnotation)
      goto LABEL_44;
    v13 = v11;
    -[PDFAKAnnotationAdaptor akAnnotation](self, "akAnnotation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || objc_msgSend(v15, "isEqual:", v16))
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E68]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "integerValue") == 3)
      {

      }
      else
      {
        v18 = objc_msgSend(v10, "isEqualToString:", CFSTR("drawing"));

        if (!v18)
        {
LABEL_43:

          goto LABEL_44;
        }
      }
    }
    v19 = self->_private;
    isSyncingFromAKAnnotation = v19->isSyncingFromAKAnnotation;
    v19->isSyncingFromAKAnnotation = 1;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("isEdited")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToString:", CFSTR("shouldObserveEdits")) & 1) != 0)
    {
LABEL_42:
      self->_private->isSyncingFromAKAnnotation = isSyncingFromAKAnnotation;
      goto LABEL_43;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("typingAttributes")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("shouldUseAppearanceOverride")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("horizontallyFlipped")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("verticallyFlipped")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("magnification")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("brushStyle")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("image")) & 1) == 0
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("drawing")) & 1) == 0)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("midPoint")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("arrowHeadLength")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("arrowHeadWidth")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("arrowLineWidth")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("pointyBitPoint")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("pointyBitBaseWidthAngle")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("rotationAngle")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("pointCount")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("innerRadiusFactor")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("hasShadow")) & 1) == 0
        && (objc_msgSend(v10, "isEqualToString:", CFSTR("signature")) & 1) == 0)
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("author")))
        {
          -[PDFAKAnnotationAdaptor _syncAuthorForAnnotation:withKey:andNewValue:](self, "_syncAuthorForAnnotation:withKey:andNewValue:", v13, v10, v15);
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("modificationDate")))
        {
          -[PDFAKAnnotationAdaptor _syncModificationDateForAnnotation:withKey:andNewValue:](self, "_syncModificationDateForAnnotation:withKey:andNewValue:", v13, v10, v15);
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("annotationText")))
        {
          -[PDFAKAnnotationAdaptor _syncAnnotationTextForAnnotation:withKey:andNewValue:](self, "_syncAnnotationTextForAnnotation:withKey:andNewValue:", v13, v10, v15);
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("contents")))
        {
          -[PDFAKAnnotationAdaptor _syncContentsForAnnotation:withKey:andNewValue:](self, "_syncContentsForAnnotation:withKey:andNewValue:", v13, v10, v15);
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("rectangle")) & 1) == 0)
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("startPoint")))
          {
            -[PDFAKAnnotationAdaptor _syncStartPointForAnnotation:withKey:andNewValue:](self, "_syncStartPointForAnnotation:withKey:andNewValue:", v13, v10, v15);
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("endPoint")))
          {
            -[PDFAKAnnotationAdaptor _syncEndPointForAnnotation:withKey:andNewValue:](self, "_syncEndPointForAnnotation:withKey:andNewValue:", v13, v10, v15);
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("strokeWidth")))
          {
            -[PDFAKAnnotationAdaptor _syncStrokeWidthForAnnotation:withKey:andNewValue:](self, "_syncStrokeWidthForAnnotation:withKey:andNewValue:", v13, v10, v15);
          }
          else
          {
            if ((objc_msgSend(v10, "isEqualToString:", CFSTR("strokeColor")) & 1) != 0
              || (objc_msgSend(v10, "isEqualToString:", CFSTR("fillColor")) & 1) != 0
              || objc_msgSend(v10, "isEqualToString:", CFSTR("color")))
            {
              -[PDFAKAnnotationAdaptor _syncColorForAnnotation:withKey:andNewValue:](self, "_syncColorForAnnotation:withKey:andNewValue:", v13, v10, v15);
              goto LABEL_39;
            }
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("arrowHeadStyle")))
            {
              -[PDFAKAnnotationAdaptor _syncArrowHeadStyleForAnnotation:withKey:andNewValue:](self, "_syncArrowHeadStyleForAnnotation:withKey:andNewValue:", v13, v10, v15);
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("dashed")))
            {
              -[PDFAKAnnotationAdaptor _syncDashedForAnnotation:withKey:andNewValue:](self, "_syncDashedForAnnotation:withKey:andNewValue:", v13, v10, v15);
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("cornerRadius")))
            {
              -[PDFAKAnnotationAdaptor _syncCornerRadiusForAnnotation:withKey:andNewValue:](self, "_syncCornerRadiusForAnnotation:withKey:andNewValue:", v13, v10, v15);
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("path")))
            {
              -[PDFAKAnnotationAdaptor _syncInkPathForAnnotation:withKey:andNewValue:](self, "_syncInkPathForAnnotation:withKey:andNewValue:", v13, v10, v15);
            }
            else if (objc_msgSend(v10, "isEqualToString:", CFSTR("childAnnotation")))
            {
              -[PDFAKAnnotationAdaptor _syncChildAnnotationForAnnotation:withKey:andNewValue:](self, "_syncChildAnnotationForAnnotation:withKey:andNewValue:", v13, v10, v15);
            }
            else
            {
              NSLog(CFSTR("Unhandled AK property in AK->PDFKit syncing: %@"), v10);
            }
          }
        }
      }
      -[PDFAKAnnotationAdaptor _syncBoundingRectangleForAnnotation:withKey:andNewValue:](self, "_syncBoundingRectangleForAnnotation:withKey:andNewValue:", v13, v10, v15);
    }
LABEL_39:
    -[PDFAKAnnotationAdaptor _invalidateAppearanceStreamForAnnotation:withKey:andNewValue:](self, "_invalidateAppearanceStreamForAnnotation:withKey:andNewValue:", v13, v10, v15);
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfAnnotation);
    if (objc_msgSend(WeakRetained, "isFullyConstructed"))
    {
      objc_msgSend(WeakRetained, "page");
      v27 = v15;
      v22 = v16;
      v23 = v13;
      v24 = v14;
      v25 = isSyncingFromAKAnnotation;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "postAnnotationsChangedNotification");

      isSyncingFromAKAnnotation = v25;
      v14 = v24;
      v13 = v23;
      v16 = v22;
      v15 = v27;
    }

    goto LABEL_42;
  }
  v28.receiver = self;
  v28.super_class = (Class)PDFAKAnnotationAdaptor;
  -[PDFAKAnnotationAdaptor observeValueForKeyPath:ofObject:change:context:](&v28, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_44:

}

- (void)_syncBoundingRectangleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v6 = a3;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawingBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v8, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forAnnotationKey:", v15, CFSTR("/Rect"));

}

- (void)_syncAuthorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  if (v6)
  {
    v8 = v6;
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isMarkupAnnotation"))
      objc_msgSend(v7, "setValue:forAnnotationKey:", v8, CFSTR("/T"));

    v6 = v8;
  }

}

- (void)_syncModificationDateForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  if (v7)
  {
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forAnnotationKey:", v7, CFSTR("/M"));

  }
}

- (void)_syncAnnotationTextForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  id v13;
  id v14;

  v13 = a5;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v7 == v13)
  {

    v8 = 0;
  }
  v14 = v8;
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("/Contents");
  objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Widget")))
  {
    v12 = CFSTR("/V");

    v10 = v12;
  }
  if (v9)
    objc_msgSend(v6, "setValue:forAnnotationKey:", v9, v10);
  else
    objc_msgSend(v6, "removeValueForAnnotationKey:", v10);

}

- (void)_syncContentsForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/Text")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup")))
  {
    v8 = v11;
    objc_msgSend(v6, "setValue:forAnnotationKey:", v8, CFSTR("/Contents"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup")))
    {
      objc_msgSend(v6, "parent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "parent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forAnnotationKey:", v8, CFSTR("/Contents"));

      }
    }

  }
  else
  {
    NSLog(CFSTR("%s: Wasn't expecting to get a change of a \"contents\" property on an annotation other than a Text or Popup."), "-[PDFAKAnnotationAdaptor _syncContentsForAnnotation:withKey:andNewValue:]");
  }

}

- (void)_syncStartPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a5;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v13, "PDFKitPDFPointValue");
  objc_msgSend(v6, "setStartPoint:", v11 - v8, v12 - v10);

}

- (void)_syncEndPointForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a5;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v13, "PDFKitPDFPointValue");
  objc_msgSend(v6, "setEndPoint:", v11 - v8, v12 - v10);

}

- (void)_syncStrokeWidthForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  double v7;
  double v8;
  int v9;
  void *v10;
  PDFBorder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(a5, "doubleValue");
  v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v17, "isDashed");
  else
    v9 = 0;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/Border"));
  v11 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(PDFBorder);
    objc_msgSend(v10, "setValue:forAnnotationKey:", v11, CFSTR("/Border"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDFBorder setLineWidth:](v11, "setLineWidth:", v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)-[PDFBorder mutableCopy](v11, "mutableCopy");
      if ((unint64_t)objc_msgSend(v12, "count") >= 3)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 2, v13);
        objc_msgSend(v10, "setValue:forAnnotationKey:", v12, CFSTR("/Border"));

      }
    }
  }
  objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/BS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("/W"));

    objc_msgSend(v10, "setValue:forAnnotationKey:", v15, CFSTR("/BS"));
  }
  if (v9)
    -[PDFAKAnnotationAdaptor _updateDashedPatternForStrokeWidth:isDashed:](self, "_updateDashedPatternForStrokeWidth:isDashed:", 1, v8);

}

- (void)_syncColorForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v7;
  PDFAnnotationKey *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("strokeColor")) & 1) == 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("fillColor")) & 1) != 0)
    {
      v8 = &PDFAnnotationKeyInteriorColor;
      goto LABEL_6;
    }
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("color")))
      goto LABEL_8;
  }
  v8 = &PDFAnnotationKeyColor;
LABEL_6:
  v9 = *(id *)v8;
  if (v9)
  {
    v10 = v9;
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forAnnotationKey:", v7, v10);

  }
LABEL_8:

}

- (void)_syncArrowHeadStyleForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a5, "integerValue", a3, a4);
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 - 1;
  if ((unint64_t)(v6 - 1) > 2)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v9 = qword_209DC0528[v8];
    v10 = qword_209DC0540[v8];
  }
  +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forAnnotationKey:", v13, CFSTR("/LE"));

}

- (void)_syncDashedForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v13 = a3;
  v7 = objc_msgSend(a5, "BOOLValue");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "strokeWidth");
    v9 = v8;
  }
  else
  {
    -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/Border"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "lineWidth");
      v9 = v12;
    }
    else
    {
      v9 = 1.0;
    }

  }
  -[PDFAKAnnotationAdaptor _updateDashedPatternForStrokeWidth:isDashed:](self, "_updateDashedPatternForStrokeWidth:isDashed:", v7, v9);

}

- (void)_updateDashedPatternForStrokeWidth:(double)a3 isDashed:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  void *v6;
  PDFBorder *v7;
  void *v8;
  void *v9;
  void *v10;
  PDFBorder *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
    v5 = 1.0;
  else
    v5 = a3;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Border"));
  v7 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(PDFBorder);
    objc_msgSend(v6, "setValue:forAnnotationKey:", v7, CFSTR("/Border"));
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5 * 3.0 + 4.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5 + 7.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    -[PDFBorder setStyle:](v11, "setStyle:", v4);
    -[PDFBorder setDashPattern:](v11, "setDashPattern:", v10);
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v10)
  {
    v11 = (PDFBorder *)-[PDFBorder mutableCopy](v7, "mutableCopy");
    if ((unint64_t)-[PDFBorder count](v11, "count") >= 4)
    {
      -[PDFBorder replaceObjectAtIndex:withObject:](v11, "replaceObjectAtIndex:withObject:", 3, v10);
      objc_msgSend(v6, "setValue:forAnnotationKey:", v11, CFSTR("/Border"));
    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/BS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v4)
    {
      objc_msgSend(v13, "setObject:forKey:", CFSTR("/D"), CFSTR("/S"));
      v15 = objc_msgSend(v10, "copy");

      objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("/D"));
      v10 = (void *)v15;
    }
    else
    {
      objc_msgSend(v13, "setObject:forKey:", CFSTR("/S"), CFSTR("/S"));
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("/D"));
    }
    objc_msgSend(v6, "setValue:forAnnotationKey:", v14, CFSTR("/BS"));

  }
}

- (void)_syncCornerRadiusForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  double v6;
  double v7;
  PDFBorder *v8;
  PDFBorder *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a5, "doubleValue", a3, a4);
  v7 = v6;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForAnnotationKey:", CFSTR("/Border"));
  v8 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(PDFBorder);
    objc_msgSend(v12, "setValue:forAnnotationKey:", v8, CFSTR("/Border"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PDFBorder setHorizontalCornerRadius:](v9, "setHorizontalCornerRadius:", v7);
    -[PDFBorder setVerticalCornerRadius:](v9, "setVerticalCornerRadius:", v7);
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (PDFBorder *)-[PDFBorder mutableCopy](v8, "mutableCopy");
    if ((unint64_t)-[PDFBorder count](v9, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFBorder replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", 0, v10);
      -[PDFBorder replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", 1, v11);
      objc_msgSend(v12, "setValue:forAnnotationKey:", v9, CFSTR("/Border"));

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_syncChildAnnotationForAnnotation:(id)a3 withKey:(id)a4 andNewValue:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  -[PDFAKAnnotationAdaptor pdfAnnotation](self, "pdfAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    v9 = v6;
    if (v9)
    {
      v10 = v9;
      v11 = v7;
      objc_msgSend(v11, "page");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v22 = v11;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v12, "annotations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
LABEL_6:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "akAnnotationAdaptor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "akAnnotation");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 == v10)
              break;

            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              if (v16)
                goto LABEL_6;
              goto LABEL_12;
            }
          }
          objc_msgSend(v19, "pdfAnnotation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v22;
          if (!v21)
            goto LABEL_16;
          objc_msgSend(v22, "setPopupInternal:scanPage:", v21, 0);

          goto LABEL_17;
        }
LABEL_12:

        v11 = v22;
      }
LABEL_16:
      NSLog(CFSTR("%s: Did not find PDFAnnotation corresponding to AKAnnotation: %@. Both parent and child must be added to the AK model before setting the 'childAnnotation' property"), "-[PDFAKAnnotationAdaptor _syncChildAnnotationForAnnotation:withKey:andNewValue:]", v10);
LABEL_17:

      goto LABEL_18;
    }
  }
  objc_msgSend(v7, "setPopupInternal:scanPage:", 0, 0);
LABEL_18:

}

+ (id)_akAnnotationInstanceForPDFAnnotationSubtype:(id)a3 withOptionalWidgetFieldType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Link"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("/Text")))
  {
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/FreeText")))
  {
    AKTextBoxAnnotationClass();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Line")))
  {
    AKArrowAnnotationClass();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Square")))
  {
    AKRectAnnotationClass();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Circle")))
  {
    AKOvalAnnotationClass();
    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("/Highlight"))
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("/Underline"))
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("/StrikeOut")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Ink"))
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("/Stamp")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("/SN")))
    {
      AKImageAnnotationClass();
      goto LABEL_12;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("/Popup"))
      && !objc_msgSend(v6, "isEqualToString:", CFSTR("/Redact")))
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("/Widget")))
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("/Redact")))
          NSLog(CFSTR("%s: Unhandled annotation subtype: %@,"), "+[PDFAKAnnotationAdaptor _akAnnotationInstanceForPDFAnnotationSubtype:withOptionalWidgetFieldType:]", v6);
        goto LABEL_3;
      }
      if (objc_msgSend(a1, "_akAnnotationSubclassForWidgetFieldType:", v7))
      {
LABEL_12:
        v8 = objc_opt_new();
        goto LABEL_13;
      }
    }
  }
LABEL_3:
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v9 = (void *)v8;

  return v9;
}

+ (Class)_akAnnotationSubclassForWidgetFieldType:(id)a3
{
  id v3;
  id v4;
  objc_class *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("/Btn")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("/Tx")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
  {
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("/Sig")))
  {
    NSLog(CFSTR("%s: Unhandled widgetFieldType: %@"), "+[PDFAKAnnotationAdaptor _akAnnotationSubclassForWidgetFieldType:]", v3);
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = AKImageAnnotationClass();
LABEL_8:
  v5 = (objc_class *)v4;

  return v5;
}

+ (id)_pdfAnnotationInstanceForAKAnnotation:(id)a3
{
  id v3;
  PDFAnnotation *v4;
  PDFAnnotation *v5;
  PDFAnnotationSubtype *v6;
  PDFBorder *v7;
  void *v8;
  PDFAnnotation *v9;
  uint64_t v11;

  v3 = a3;
  v4 = [PDFAnnotation alloc];
  v5 = -[PDFAnnotation initWithBounds:forType:withProperties:](v4, "initWithBounds:forType:withProperties:", &stru_24C25F170, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  AKTextBoxAnnotationClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = &PDFAnnotationSubtypeFreeText;
LABEL_26:
    -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", *v6, CFSTR("/Subtype"));
    goto LABEL_27;
  }
  AKRectAnnotationClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = &PDFAnnotationSubtypeSquare;
    goto LABEL_26;
  }
  AKRedactionRectAnnotationClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", CFSTR("/Square"), CFSTR("/Subtype"));
    if (GetDefaultsWriteHighlightRedactions())
      objc_msgSend(v3, "setIsHighlighted:", 1);
  }
  else
  {
    AKOvalAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = &PDFAnnotationSubtypeCircle;
      goto LABEL_26;
    }
    AKArrowShapeAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKArrowAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = &PDFAnnotationSubtypeLine;
      goto LABEL_26;
    }
    AKDoodleAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKInkAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", CFSTR("/Square"), CFSTR("/Subtype"));
      v7 = objc_alloc_init(PDFBorder);
      -[PDFBorder setLineWidth:](v7, "setLineWidth:", 0.0);
      -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", v7, CFSTR("/Border"));
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", v8, CFSTR("/C"));
      -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", v8, CFSTR("/IC"));
      -[PDFAnnotation setReadOnlyAnnotation:](v5, "setReadOnlyAnnotation:", 1);
      -[PDFAnnotation setLocked:](v5, "setLocked:", 1);
      -[PDFAnnotation setContentsLocked:](v5, "setContentsLocked:", 1);

      goto LABEL_27;
    }
    AKLoupeAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKThoughtBubbleAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKSpeechBubbleAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKTriangleAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKPolygonAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_25;
    AKStarAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (AKHeartAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (AKBorderMaskAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (AKImageAnnotationClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_25:
      v6 = &PDFAnnotationSubtypeStamp;
      goto LABEL_26;
    }
    AKSignatureAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PDFAnnotation setValue:forAnnotationKey:](v5, "setValue:forAnnotationKey:", CFSTR("/SN"), CFSTR("/Subtype"));
      -[PDFAnnotation setShouldBurnIn:](v5, "setShouldBurnIn:", 1);
    }
    else
    {
      AKCropAnnotationClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (PDFAnnotation *)v11;
      }
    }
  }
LABEL_27:
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();

    if (v9 != v5)
      -[PDFAnnotation setShouldBurnIn:](v5, "setShouldBurnIn:", objc_msgSend(v3, "shouldBurnIn"));
  }

  return v5;
}

- (id)_colorFromColorOrArray:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    PDFColorCreateFromNSArray(v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
