@implementation AKHighlightAnnotationController

- (AKHighlightAnnotationController)initWithController:(id)a3
{
  id v4;
  AKHighlightAnnotationController *v5;
  AKHighlightAnnotationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKHighlightAnnotationController;
  v5 = -[AKHighlightAnnotationController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (void)performOneShotHighlightWithAttributeTag:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  -[AKHighlightAnnotationController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "currentPageController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKHighlightAnnotationController _createHighlightAnnotationWithAttributeTag:](self, "_createHighlightAnnotationWithAttributeTag:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v8, objc_msgSend(v7, "pageIndex"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setQuadPoints:", v10);
      v18 = 0;
      v11 = -[AKHighlightAnnotationController _adaptExistingHighlightsToNewHighlight:onPageController:firstModifiedHighlight:](self, "_adaptExistingHighlightsToNewHighlight:onPageController:firstModifiedHighlight:", v9, v7, &v18);
      v12 = v18;
      if (v11)
      {
        objc_msgSend(v5, "toolController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v9, v7, 1, 0);

        v14 = v9;
        v12 = v14;
      }
      if (v12)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_22901973C;
        block[3] = &unk_24F1A76F8;
        v16 = v7;
        v17 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
    else
    {
      NSLog(CFSTR("%s: delegate does not respond to quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:"), "-[AKHighlightAnnotationController performOneShotHighlightWithAttributeTag:]");
    }
  }
  else
  {
    NSLog(CFSTR("%s: delegate does not respond to highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:"), "-[AKHighlightAnnotationController performOneShotHighlightWithAttributeTag:]");
  }

}

- (void)clearHighlightsWithinSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKHighlightAnnotationController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "currentPageController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v4, "pageIndex"), v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](self, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", -1, 0, objc_msgSend(v5, "firstIndex"), objc_msgSend(v5, "lastIndex") - objc_msgSend(v5, "firstIndex") + 1, v4);

    }
    else
    {
      NSLog(CFSTR("%s: delegate does not respond to highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:"), "-[AKHighlightAnnotationController clearHighlightsWithinSelection]");
    }
  }
  else
  {
    NSLog(CFSTR("%s: delegate does not respond to hasHighlightableSelectionForAnnotationController"), "-[AKHighlightAnnotationController clearHighlightsWithinSelection]");
  }

}

- (id)highlightsWithinSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AKHighlightAnnotationController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    NSLog(CFSTR("%s: delegate does not respond to highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:"), "-[AKHighlightAnnotationController highlightsWithinSelection]");
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "hasHighlightableSelectionForAnnotationController:", v3))
  {
LABEL_6:
    v7 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_7;
  }
  objc_msgSend(v3, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v5, "pageIndex"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightAnnotationController _highlightsInCharacterIndexRange:onPageController:](self, "_highlightsInCharacterIndexRange:onPageController:", objc_msgSend(v6, "firstIndex"), objc_msgSend(v6, "lastIndex") - objc_msgSend(v6, "firstIndex") + 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (void)beginContinuousHighlighting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKHighlightAnnotationController controller](self, "controller");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightAnnotationController _createHighlightAnnotationWithAttributeTag:](self, "_createHighlightAnnotationWithAttributeTag:", objc_msgSend(v3, "highlightStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightAnnotationController setContinuousHighlight:](self, "setContinuousHighlight:", v4);

  objc_msgSend(v7, "toolController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v6, 0, 1, 0);

}

- (void)continueHighlighting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AKHighlightAnnotationController controller](self, "controller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "hasHighlightableSelectionForAnnotationController:", v8))
  {
    objc_msgSend(v8, "currentPageController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v4, "pageIndex"), v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v5, objc_msgSend(v4, "pageIndex"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQuadPoints:", v6);

  }
}

- (void)endContinuousHighlighting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKHighlightAnnotationController controller](self, "controller");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quadPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[AKHighlightAnnotationController _adaptExistingHighlightsToNewHighlight:onPageController:firstModifiedHighlight:](self, "_adaptExistingHighlightsToNewHighlight:onPageController:firstModifiedHighlight:", v9, v5, 0);

        if (!v10)
        {
          objc_msgSend(v5, "pageModelController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mutableArrayValueForKey:", CFSTR("annotations"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v13);

        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "clearHighlightableSelectionForAnnotationController:", v17);
    }
    else
    {
      objc_msgSend(v5, "pageModelController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mutableArrayValueForKey:", CFSTR("annotations"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKHighlightAnnotationController continuousHighlight](self, "continuousHighlight");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v16);

    }
    -[AKHighlightAnnotationController setContinuousHighlight:](self, "setContinuousHighlight:", 0);

  }
}

- (id)_createHighlightAnnotationWithAttributeTag:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  if ((unint64_t)(a3 - 765200) > 6)
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = qword_229092950[a3 - 765200];
    +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:](AKHighlightAppearanceHelper, "colorForHighlightAttributeWithTag:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setColor:", v6);
  objc_msgSend(v4, "setStyle:", v5);

  return v4;
}

- (id)_highlightsInCharacterIndexRange:(_NSRange)a3 onPageController:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  objc_msgSend(v4, "pageModelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "annotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        objc_opt_self();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v16 = v13;
          objc_msgSend(v16, "quadPoints");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v17, objc_msgSend(v6, "pageIndex"), v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18 && objc_msgSend(v18, "countOfIndexesInRange:", a3.location, a3.length))
            objc_msgSend(v21, "addObject:", v16);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v21;
}

- (BOOL)_adaptExistingHighlightsToNewHighlight:(id)a3 onPageController:(id)a4 firstModifiedHighlight:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  BOOL v32;
  id *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  AKHighlightAnnotationController *v101;
  void *v102;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v107 = a3;
  v7 = a4;
  v101 = self;
  -[AKHighlightAnnotationController controller](self, "controller");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "delegate");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v106 = v7;
  objc_msgSend(v7, "pageModelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "annotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v115 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_opt_self();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 && v15 != v107)
        {
          objc_msgSend(v15, "quadPoints");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v18, objc_msgSend(v7, "pageIndex"), v105);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v120[0] = CFSTR("annotation");
          v120[1] = CFSTR("characterIndexes");
          v121[0] = v15;
          v121[1] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
    }
    while (v12);
  }

  v21 = v8;
  if (!objc_msgSend(v8, "count"))
  {
    v31 = 0;
    v32 = 1;
    v33 = a5;
    if (!a5)
      goto LABEL_55;
    goto LABEL_54;
  }
  objc_msgSend(v8, "sortUsingComparator:", &unk_24F1A71B8);
  objc_msgSend(v107, "quadPoints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v22, objc_msgSend(v7, "pageIndex"), v105);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = objc_msgSend(v23, "firstIndex");
  v24 = objc_msgSend(v23, "lastIndex");
  v98 = objc_msgSend(v23, "firstIndex");
  v25 = MEMORY[0x24BDAC760];
  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = sub_22901AA70;
  v111[3] = &unk_24F1A7C88;
  v26 = v107;
  v112 = v26;
  v27 = v23;
  v113 = v27;
  v28 = objc_msgSend(v8, "indexOfObjectPassingTest:", v111);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = 0;
    v30 = 0;
  }
  else
  {
    v34 = v28;
    objc_msgSend(v8, "objectAtIndex:", v28);
    v35 = v24;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("annotation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v35;
    objc_msgSend(v21, "objectAtIndex:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v108[0] = v25;
  v108[1] = 3221225472;
  v108[2] = sub_22901AB24;
  v108[3] = &unk_24F1A7C88;
  v38 = v26;
  v109 = v38;
  v39 = v27;
  v110 = v39;
  v40 = objc_msgSend(v21, "indexOfObjectPassingTest:", v108);
  if (v40 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v100 = 0;
    v41 = 0;
  }
  else
  {
    v42 = v40;
    objc_msgSend(v21, "objectAtIndex:", v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("annotation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectAtIndex:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v102 = v41;
  if (!v30)
    goto LABEL_32;
  if (v30 != v41)
    goto LABEL_32;
  v45 = objc_msgSend(v30, "style");
  if (v45 != objc_msgSend(v38, "style"))
    goto LABEL_32;
  objc_msgSend(v30, "color");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "color");
  v47 = v24;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = +[AKHighlightAppearanceHelper highlightColor:isEquivalentToHighlightColor:](AKHighlightAppearanceHelper, "highlightColor:isEquivalentToHighlightColor:", v46, v48);

  v24 = v47;
  if (!v49)
  {
LABEL_32:
    v99 = v24 - v98 + 1;
    if ((v30 != 0) == (v41 != 0))
      goto LABEL_60;
    v58 = objc_msgSend(v38, "style");
    v59 = v30 ? v30 : v41;
    if (v58 != objc_msgSend(v59, "style"))
      goto LABEL_60;
    objc_msgSend(v38, "color");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "color");
    v94 = v29;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = +[AKHighlightAppearanceHelper highlightColor:isEquivalentToHighlightColor:](AKHighlightAppearanceHelper, "highlightColor:isEquivalentToHighlightColor:", v60, v61);

    v29 = v94;
    if (!v62)
    {
LABEL_60:
      if (v30)
      {
        if (v41)
        {
          if (v30 != v41)
          {
            v71 = objc_msgSend(v38, "style");
            if (v71 == objc_msgSend(v30, "style"))
            {
              v72 = objc_msgSend(v38, "style");
              if (v72 == objc_msgSend(v41, "style"))
              {
                v73 = v29;
                objc_msgSend(v38, "color");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "color");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                if (+[AKHighlightAppearanceHelper highlightColor:isEquivalentToHighlightColor:](AKHighlightAppearanceHelper, "highlightColor:isEquivalentToHighlightColor:", v74, v75))
                {
                  objc_msgSend(v38, "color");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "color");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = +[AKHighlightAppearanceHelper highlightColor:isEquivalentToHighlightColor:](AKHighlightAppearanceHelper, "highlightColor:isEquivalentToHighlightColor:", v76, v77);

                  v29 = v73;
                  if (v95)
                  {
                    v91 = v100;
                    v96 = v73;
                    v56 = (void *)objc_msgSend(v96, "mutableCopy");
                    objc_msgSend(v56, "addIndexes:", v91);
                    objc_msgSend(v56, "addIndexes:", v39);
                    objc_msgSend(v104, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v56, objc_msgSend(v106, "pageIndex"), v105);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "setQuadPoints:", v93);
                    v31 = v30;
                    objc_msgSend(v106, "pageModelController");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "mutableArrayValueForKey:", CFSTR("annotations"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "removeObject:", v102);

                    v80 = 1 << objc_msgSend(v38, "style");
                    v81 = (void *)MEMORY[0x24BDBCF20];
                    v118[0] = v38;
                    v118[1] = v31;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 2);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v81, "setWithArray:", v82);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    v84 = v80;
                    v29 = v73;
                    -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v101, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v84, v83, v97, v99, v106);

                    goto LABEL_39;
                  }
                }
                else
                {

                }
              }
            }
          }
        }
      }
      v32 = 1;
      v88 = 1 << objc_msgSend(v38, "style");
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v38);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v101, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v88, v56, v97, v99, v106);
      v31 = 0;
      goto LABEL_52;
    }
    v63 = v59;
    objc_msgSend(v63, "quadPoints");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v64, objc_msgSend(v106, "pageIndex"), v105);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)objc_msgSend(v92, "mutableCopy");
    objc_msgSend(v56, "addIndexes:", v39);
    objc_msgSend(v104, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v56, objc_msgSend(v106, "pageIndex"), v105);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setQuadPoints:", v65);
    v31 = v63;
    v66 = 1 << objc_msgSend(v38, "style");
    v67 = (void *)MEMORY[0x24BDBCF20];
    v119[0] = v38;
    v119[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setWithArray:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v66;
    v29 = v94;
    -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v101, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v70, v69, v97, v99, v106);

LABEL_39:
    v32 = 0;
LABEL_52:
    v33 = a5;
    goto LABEL_53;
  }
  v50 = objc_msgSend(v39, "firstIndex");
  v51 = objc_msgSend(v29, "firstIndex");
  if (v50 - v51 >= 0)
    v52 = v50 - v51;
  else
    v52 = v51 - v50;
  v53 = objc_msgSend(v39, "lastIndex");
  v54 = objc_msgSend(v29, "lastIndex");
  v55 = v53 - v54;
  if (v53 - v54 < 0)
    v55 = v54 - v53;
  if (v52 <= 1 && v55 <= 1)
  {
    objc_msgSend(v106, "pageModelController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "mutableArrayValueForKey:", CFSTR("annotations"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "removeObject:", v30);

    v31 = 0;
    goto LABEL_39;
  }
  v85 = (void *)objc_msgSend(v39, "mutableCopy");
  objc_msgSend(v85, "removeIndexes:", v29);
  v86 = objc_msgSend(v85, "count");
  v87 = (void *)objc_msgSend(v29, "mutableCopy");
  v56 = v87;
  if (v86)
    objc_msgSend(v87, "addIndexes:", v39);
  else
    objc_msgSend(v87, "removeIndexes:", v39);
  v33 = a5;
  objc_msgSend(v104, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v56, objc_msgSend(v106, "pageIndex"), v105);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setQuadPoints:", v90);
  v31 = v30;

  v32 = 0;
LABEL_53:

  if (v33)
LABEL_54:
    *v33 = objc_retainAutorelease(v31);
LABEL_55:

  return v32;
}

- (BOOL)_clearHighlightsWithStyleMatchingMask:(unint64_t)a3 except:(id)a4 inRange:(_NSRange)a5 onPageController:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  NSUInteger v31;
  NSUInteger v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  length = a5.length;
  location = a5.location;
  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v31 = location;
  v32 = length;
  -[AKHighlightAnnotationController _highlightsInCharacterIndexRange:onPageController:](self, "_highlightsInCharacterIndexRange:onPageController:", location, length, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKHighlightAnnotationController controller](self, "controller");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_20;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v38 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if ((objc_msgSend(v10, "containsObject:", v18) & 1) == 0 && ((a3 >> objc_msgSend(v18, "style")) & 1) != 0)
      {
        objc_msgSend(v18, "quadPoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v11;
        objc_msgSend(v33, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v19, objc_msgSend(v11, "pageIndex"), v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countOfIndexesInRange:", v31, v32);
        v23 = objc_msgSend(v21, "count");
        v24 = v22 - v23;
        if (v22 - v23 < 0)
          v24 = v23 - v22;
        if (v24 <= 1)
        {
          objc_msgSend(v30, "addObject:", v18);
          goto LABEL_14;
        }
        if (v22)
        {
          v25 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v25, "removeIndexesInRange:", v31, v32);
          objc_msgSend(v33, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v25, objc_msgSend(v20, "pageIndex"), v34);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setQuadPoints:", v26);

LABEL_14:
          v15 = 1;
        }

        v11 = v20;
        continue;
      }
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v14);
LABEL_20:

  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v11, "pageModelController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mutableArrayValueForKey:", CFSTR("annotations"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeObjectsInArray:", v30);

  }
  return v15 & 1;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKHighlightAnnotation)continuousHighlight
{
  return (AKHighlightAnnotation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContinuousHighlight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousHighlight, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
