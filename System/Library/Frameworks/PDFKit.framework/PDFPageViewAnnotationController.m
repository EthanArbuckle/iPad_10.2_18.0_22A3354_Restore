@implementation PDFPageViewAnnotationController

- (PDFPageViewAnnotationController)initWithPDFPageView:(id)a3
{
  id v4;
  PDFPageViewAnnotationController *v5;
  PDFPageViewAnnotationControllerPrivate *v6;
  PDFPageViewAnnotationControllerPrivate *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  PDFPageViewAnnotationControllerPrivate *v11;
  NSMutableDictionary *activeControls;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDFPageViewAnnotationController;
  v5 = -[PDFPageViewAnnotationController init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageViewAnnotationControllerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pageView, v4);
    objc_msgSend(v4, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_private->page, v8);
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_private->view, v9);

    objc_storeWeak((id *)&v5->_private->activeAnnotation, 0);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = v5->_private;
    activeControls = v11->activeControls;
    v11->activeControls = v10;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__didRotatePageNotification_, CFSTR("PDFPageDidRotate"), v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__didRotatePageNotification_, CFSTR("PDFPageDidChangeBounds"), v8);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAnnotationController;
  -[PDFPageViewAnnotationController dealloc](&v4, sel_dealloc);
}

- (id)activeAnnotation
{
  return objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
}

- (void)addControlForAnnotation:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  NSMutableDictionary *activeControls;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsFormFieldEntry");

  if (v6)
  {
    activeControls = self->_private->activeControls;
    objc_msgSend(v14, "pdfAnnotationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](activeControls, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v14, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "popup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (((objc_msgSend(v10, "isEqualToString:", CFSTR("/Widget")) & 1) != 0 || v11)
        && (objc_msgSend(v14, "isReadOnly") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        if (v11)
        {
          -[PDFPageViewAnnotationController _addPopupForAnnotation:](self, "_addPopupForAnnotation:", v14);
        }
        else
        {
          v12 = objc_loadWeakRetained((id *)&self->_private->pageView);
          objc_msgSend(v14, "valueForAnnotationKey:", CFSTR("/FT"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Tx")))
          {
            objc_msgSend(v12, "_addPDFAnnotationTextWidget:", v14);
          }
          else if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Ch")))
          {
            objc_msgSend(v12, "_addPDFAnnotationChoiceWidget:", v14);
          }

        }
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      }

    }
  }

}

- (void)removeControlForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (objc_msgSend(v4, "isSelected"))
      objc_msgSend(v10, "setIsSelected:", 0);
    objc_msgSend(v10, "pdfAnnotationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary objectForKey:](self->_private->activeControls, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
        objc_msgSend(WeakRetained, "undoManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeAllActionsWithTarget:", v6);

        objc_msgSend(v10, "setControl:", 0);
        objc_msgSend(v6, "removeFromSuperview");
        v9 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

        if (v9 == v10)
          objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
        -[NSMutableDictionary removeObjectForKey:](self->_private->activeControls, "removeObjectForKey:", v5);
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      }

    }
    v4 = v10;
  }

}

- (void)_rotateActiveAnnotation
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "pdfAnnotationUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableDictionary objectForKey:](self->_private->activeControls, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[PDFPageViewAnnotationController removeControlForAnnotation:](self, "removeControlForAnnotation:", v6);
        -[PDFPageViewAnnotationController addControlForAnnotation:](self, "addControlForAnnotation:", v6);
      }

    }
    WeakRetained = v6;
  }

}

- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  PDFPageViewAnnotationController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  PDFPageViewAnnotationController *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  int64_t v80;
  unint64_t v81;
  id v82;
  PDFPageViewAnnotationController *v83;
  uint64_t v84;
  id obj;
  id obja;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  const __CFString *v101;
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  v8 = objc_msgSend(WeakRetained, "allowsMarkupAnnotationEditing");

  if (!v8)
    goto LABEL_69;
  v82 = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(v82, "pageLayout");
  if (a3 == 8 || !objc_msgSend(v6, "rangeCount"))
    goto LABEL_68;
  v83 = self;
  v9 = +[PDFAnnotation MarkupTypeForMarkupStyle:](PDFAnnotation, "MarkupTypeForMarkupStyle:", a3);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", v6);
  objc_msgSend(v82, "annotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  v70 = v12;
  v72 = v6;
  if (!v13)
    goto LABEL_40;
  v14 = (id)v13;
  v15 = *(_QWORD *)v96;
  v16 = v83;
  v80 = v9;
  v81 = a3;
  v84 = *(_QWORD *)v96;
  do
  {
    v17 = 0;
    obj = v14;
    do
    {
      if (*(_QWORD *)v96 != v15)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)v17);
      if (objc_msgSend(v18, "isMarkupAnnotationSubtype", v70)
        && (v9 == 3 || objc_msgSend(v18, "markupType") == 3 || objc_msgSend(v18, "markupType") == v9))
      {
        objc_msgSend(v18, "indexSetForQuadPoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFPageViewAnnotationController _getIndexSetIntersectionBetween:and:](v16, "_getIndexSetIntersectionBetween:and:", v6, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count")
          || -[PDFPageViewAnnotationController _indexSet:touchesIndexSet:](v16, "_indexSet:touchesIndexSet:", v19, v6))
        {
          if (objc_msgSend(v18, "markupStyle") == a3)
          {
            if (objc_msgSend(v19, "containsIndexes:", v6))
            {
              if (objc_msgSend(v19, "isEqualToIndexSet:", v6))
              {
                objc_msgSend(v79, "addObject:", v18);
              }
              else
              {
                v74 = v10;
                objc_msgSend(v82, "string");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v6, "firstIndex") - 1;
                v73 = objc_msgSend(v6, "lastIndex");
                v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", v6);
                v28 = objc_msgSend(v19, "containsIndex:", v27);
                v77 = v26;
                objc_msgSend(v26, "substringWithRange:", v27, 1);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "length");

                if (v28 && !v32)
                  objc_msgSend(v76, "addIndex:", v27);
                v33 = objc_msgSend(v19, "containsIndex:", v73 + 1);
                objc_msgSend(v77, "substringWithRange:", v73 + 1, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stringByTrimmingCharactersInSet:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "length");

                if (v33 && !v37)
                  objc_msgSend(v76, "addIndex:", v73 + 1);
                v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", v19);
                objc_msgSend(v38, "removeIndexes:", v76);
                objc_msgSend(v78, "setObject:forKey:", v18, v38);

                v12 = v70;
                v6 = v72;
                v16 = v83;
                v10 = v74;
                v9 = v80;
                a3 = v81;
              }

              v10 = 0;
            }
            else
            {
              objc_msgSend(v79, "addObject:", v18);
              objc_msgSend(v10, "addIndexes:", v19);
            }
            goto LABEL_35;
          }
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", v19);
          objc_msgSend(v21, "removeIndexes:", v6);
          if (objc_msgSend(v21, "count"))
          {
            objc_msgSend(v78, "setObject:forKey:", v18, v21);
            goto LABEL_25;
          }
          objc_msgSend(v18, "popup");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22 && (v23 = (void *)v22, v24 = objc_msgSend(v19, "isEqualToIndexSet:", v6), v23, !v24))
          {
            objc_msgSend(v10, "removeIndexes:", v19);

            v16 = v83;
          }
          else
          {
            objc_msgSend(v79, "addObject:", v18);
            v16 = v83;
LABEL_25:
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexSet:", v19);
            objc_msgSend(v25, "removeIndexes:", v21);
            objc_msgSend(v10, "addIndexes:", v25);

          }
          v9 = v80;
          a3 = v81;
        }
LABEL_35:

        v15 = v84;
        v14 = obj;
      }
      v17 = (char *)v17 + 1;
    }
    while (v14 != v17);
    v39 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    v14 = (id)v39;
  }
  while (v39);
LABEL_40:

  if (v10)
  {
    +[PDFAnnotation SubtypeForPDFMarkupStyle:](PDFAnnotation, "SubtypeForPDFMarkupStyle:", a3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndex:", a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_alloc((Class)objc_msgSend(v82, "annotationSubclassForSubtype:", v40));
    v101 = CFSTR("/C");
    v102 = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "initWithBounds:forType:withProperties:", v40, v44, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

    objc_msgSend(v45, "setPage:", v82);
    objc_msgSend(v45, "setQuadPointsForIndexSet:withUndo:", v10, 0);
    if (objc_msgSend(v40, "isEqualToString:", CFSTR("/Redact")))
      objc_msgSend(v45, "setShouldBurnIn:", 1);
    objc_msgSend(v82, "addAnnotation:withUndo:", v45, 1, v70);

  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v46 = v78;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v92 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v46, "objectForKey:", v51, v70);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setQuadPointsForIndexSet:withUndo:", v51, 1);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    }
    while (v48);
  }
  v75 = v10;

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obja = v79;
  v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  v54 = v82;
  v55 = v83;
  if (v53)
  {
    v56 = v53;
    v57 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v88 != v57)
          objc_enumerationMutation(obja);
        v59 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v54, "removeAnnotation:withUndo:", v59, 1, v70);
        objc_msgSend(v59, "contents");
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v61 = (void *)v60;
          objc_msgSend(v59, "indexSetForQuadPoints");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFPageViewAnnotationController markupAnnotationsForIndexSet:](v55, "markupAnnotationsForIndexSet:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v63, "count"))
          {
            objc_msgSend(v63, "objectAtIndex:", 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "contents");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (v65)
            {
              objc_msgSend(v64, "contents");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "stringByAppendingString:", CFSTR("\n\n"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "stringByAppendingString:", v61);
              v68 = objc_claimAutoreleasedReturnValue();

              v54 = v82;
              v61 = (void *)v68;
              v55 = v83;
            }
            objc_msgSend(v64, "setContents:withUndo:", v61, 1);

          }
        }
      }
      v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
    }
    while (v56);
  }

  v6 = v72;
  if (v75)
    v69 = v75;
  else
    v69 = v72;
  -[PDFPageViewAnnotationController _propagateNotesForIndexSet:](v55, "_propagateNotesForIndexSet:", v69, v70);

LABEL_68:
LABEL_69:

}

- (id)markupAnnotationsForIndexSet:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isMarkupAnnotationSubtype"))
        {
          objc_msgSend(v12, "indexSetForQuadPoints");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDFPageViewAnnotationController _getIndexSetIntersectionBetween:and:](self, "_getIndexSetIntersectionBetween:and:", v4, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15)
            objc_msgSend(v17, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global);
  return v17;
}

uint64_t __64__PDFPageViewAnnotationController_markupAnnotationsForIndexSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "indexSetForQuadPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "indexSetForQuadPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    if (v7 <= v9)
    {
      v11 = objc_msgSend(v4, "priority");
      v12 = objc_msgSend(v5, "priority");
      if (v11 > v12)
        v10 = -1;
      else
        v10 = v11 < v12;
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)_addPopupForAnnotation:(id)a3
{
  PDFKitPopupView *v4;
  id WeakRetained;
  id v6;
  PDFKitPopupView *v7;
  NSMutableDictionary *activeControls;
  void *v9;
  id obj;

  obj = a3;
  v4 = [PDFKitPopupView alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageView);
  v6 = objc_loadWeakRetained((id *)&self->_private->view);
  v7 = -[PDFKitPopupView initWithParentAnnotation:owningPageView:owningPDFView:](v4, "initWithParentAnnotation:owningPageView:owningPDFView:", obj, WeakRetained, v6);

  if (v7)
  {
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
    activeControls = self->_private->activeControls;
    objc_msgSend(obj, "pdfAnnotationUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](activeControls, "setObject:forKey:", v7, v9);

    objc_msgSend(obj, "setControl:", v7);
  }

}

- (id)_getIndexSetIntersectionBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__PDFPageViewAnnotationController__getIndexSetIntersectionBetween_and___block_invoke;
  v9[3] = &unk_24C25C2A8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "indexesPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __71__PDFPageViewAnnotationController__getIndexSetIntersectionBetween_and___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

- (BOOL)_indexSet:(id)a3 touchesIndexSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke;
  v10[3] = &unk_24C25C2F8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateRangesUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t result;
  _QWORD v8[7];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke_2;
  v8[3] = &unk_24C25C2D0;
  v8[5] = a2;
  v8[6] = a3;
  v6 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(v6, "enumerateRangesUsingBlock:", v8);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

_QWORD *__61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke_2(_QWORD *result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  BOOL v5;
  char v6;

  v4 = result[5];
  if (v4 >= a2)
    v5 = a2 + a3 == v4;
  else
    v5 = result[6] + v4 == a2;
  v6 = v5;
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24))
    *a4 = 1;
  return result;
}

- (id)_markupAnnotationsForExactIndexSet:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "isMarkupAnnotationSubtype", (_QWORD)v17))
        {
          objc_msgSend(v13, "indexSetForQuadPoints");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToIndexSet:", v4);

          if (v15)
            objc_msgSend(v5, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_62);
  return v5;
}

BOOL __70__PDFPageViewAnnotationController__markupAnnotationsForExactIndexSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "priority");
  v6 = objc_msgSend(v4, "priority");

  return v5 < v6;
}

- (void)_propagateNotesForIndexSet:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PDFPageViewAnnotationController _markupAnnotationsForExactIndexSet:](self, "_markupAnnotationsForExactIndexSet:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "contents", (_QWORD)v16);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v12, "setContents:withUndo:", 0, 1);
            objc_msgSend(v6, "setContents:withUndo:", v14, 1);

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(WeakRetained, "setActiveAnnotation:", v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "currentSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(WeakRetained, "setActiveAnnotation:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
