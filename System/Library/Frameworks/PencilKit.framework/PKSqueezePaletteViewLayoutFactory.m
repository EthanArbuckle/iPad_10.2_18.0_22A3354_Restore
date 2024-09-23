@implementation PKSqueezePaletteViewLayoutFactory

- (PKSqueezePaletteViewLayoutFactory)init
{
  PKSqueezePaletteButtonFactory *v3;
  PKSqueezePaletteButtonFactory *v4;
  PKSqueezePaletteViewLayoutFactory *v5;
  objc_super v7;

  v3 = objc_alloc_init(PKSqueezePaletteButtonFactory);
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKSqueezePaletteViewLayoutFactory;
    v5 = -[PKSqueezePaletteViewLayoutFactory init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_buttonFactory, v3);
  }

  return self;
}

- (uint64_t)makeInitialLayoutWithToolPicker:(void *)a3 undoManager:(void *)a4 paletteViewStartAngleProvider:(int)a5 isLTR:
{
  id *v9;
  id v10;
  double (**v11)(id, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  id v48;
  void *v49;
  int v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  double (**v55)(id, uint64_t);
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    objc_msgSend(v9, "_tools");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      if (!v10 || (objc_msgSend(v10, "canUndo") & 1) == 0 && !objc_msgSend(v10, "canRedo"))
      {
        a1 = 0;
        goto LABEL_53;
      }
      v21 = v11[2](v11, 1);
      -[PKSqueezePaletteButtonFactory makeUndoButtonIsLTR:](a1[1], a5);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[PKSqueezePaletteButtonFactory makeRedoButtonIsLTR:](a1[1], a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (uint64_t *)-[PKSqueezePaletteViewUndoRedoLayout initWithUndoButton:redoButton:startAngle:]((id *)[PKSqueezePaletteViewUndoRedoLayout alloc], v22, v23, v21);
      goto LABEL_52;
    }
    v50 = a5;
    v48 = v10;
    if (v9)
    {
      v14 = objc_msgSend(v9[1], "indexOfObjectPassingTest:", &__block_literal_global_157);
      v15 = objc_msgSend(v9, "_indexOfTool:", v9[15]);
      v16 = objc_msgSend(v9, "_indexOfTool:", v9[6]);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = objc_msgSend(v9[1], "indexOfObjectPassingTest:", &__block_literal_global_156);
      v17 = objc_msgSend(v9[1], "indexOfObjectPassingTest:", &__block_literal_global_158);
    }
    else
    {
      v16 = 0;
      v14 = 0;
      v15 = 0;
      v17 = 0;
    }
    objc_msgSend(v9, "_tools");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", v15);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", v17);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    if (v20)
    {
      objc_msgSend(v19, "removeObject:", v20);
      objc_msgSend(v19, "insertObject:atIndex:", v20, 0);
      v26 = 1;
      if (!v24)
        goto LABEL_29;
    }
    else
    {
      v26 = 0;
      if (!v24)
        goto LABEL_29;
    }
    if (v24 != v20)
    {
      objc_msgSend(v19, "removeObject:", v24);
      objc_msgSend(v19, "insertObject:atIndex:", v24, v26++);
    }
LABEL_29:
    if (v56 && v56 != (void *)v20)
    {
      objc_msgSend(v19, "removeObject:", v56);
      objc_msgSend(v19, "insertObject:atIndex:", v56, v26);
    }
    if (v25)
    {
      objc_msgSend(v19, "removeObject:", v25);
      objc_msgSend(v19, "addObject:", v25);
    }
    if (v24)
    {
      v27 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v24);
      if (v20)
      {
LABEL_36:
        v47 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v20);
LABEL_39:
        v53 = (void *)v24;
        v54 = (void *)v20;
        v28 = (double)(unint64_t)objc_msgSend(v19, "count");
        v29 = *(double *)&PKSqueezePaletteVisibleToolsCount;
        if (*(double *)&PKSqueezePaletteVisibleToolsCount + 1.0 >= v28)
          v29 = (double)(unint64_t)objc_msgSend(v19, "count", *(double *)&PKSqueezePaletteVisibleToolsCount, v28, *(double *)&PKSqueezePaletteVisibleToolsCount + 1.0);
        v49 = (void *)v29;
        v55 = v11;
        v30 = v11[2](v11, 0);
        v31 = v19;
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v22 = v31;
        v33 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v58 != v35)
                objc_enumerationMutation(v22);
              -[PKSqueezePaletteButtonFactory makeDrawingToolButtonWithTool:](a1[1], *(void **)(*((_QWORD *)&v57 + 1) + 8 * i));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v37);

            }
            v34 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          }
          while (v34);
        }
        v51 = v9;
        v52 = (void *)v25;

        -[PKSqueezePaletteButtonFactory makeUndoButtonIsLTR:](a1[1], v50);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSqueezePaletteButtonFactory makeRedoButtonIsLTR:](a1[1], v50);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSqueezePaletteButtonFactory makeMoreButton](a1[1]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v27;
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v42 = 0;
        }
        else
        {
          objc_msgSend(v22, "objectAtIndex:", v27);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "ink");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "color");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v10 = v48;
        -[PKSqueezePaletteButtonFactory makeMulticolorButtonWithColor:](a1[1], v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (uint64_t *)-[PKSqueezePaletteViewMiniPaletteLayout initWithUndoButton:redoButton:drawingTools:selectedToolIndex:eraserToolIndex:visibleToolsCount:multicolorButton:moreButton:startAngle:]((id *)[PKSqueezePaletteViewMiniPaletteLayout alloc], v38, v39, v32, v41, (void *)v47, v49, v45, v30, v40);

        v23 = v54;
        v11 = v55;
        v9 = v51;
LABEL_52:

        goto LABEL_53;
      }
    }
    else
    {
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      if (v20)
        goto LABEL_36;
    }
    v47 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_39;
  }
LABEL_53:

  return a1;
}

- (id)makeExpandedUndoRedoLayoutWithContext:(int)a3 isLTR:
{
  id v5;
  PKSqueezePaletteViewExpandedUndoRedoLayout *v6;
  void *v7;
  id *v8;

  if (a1)
  {
    v5 = a2;
    v6 = [PKSqueezePaletteViewExpandedUndoRedoLayout alloc];
    -[PKSqueezePaletteButtonFactory sliderButtonConfigurationIsLTR:](*(_QWORD *)(a1 + 8), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKSqueezePaletteViewExpandedUndoRedoLayout initWithContext:sliderButtonConfiguration:]((id *)&v6->super.isa, v5, v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)makeExpandedToolsLayoutWithContext:(void *)a3 drawingTools:(void *)a4 selectedToolIndex:(void *)a5 visibleToolsCount:(void *)a6 delegate:
{
  id v10;
  id v11;
  id v12;
  id *v13;

  if (a1)
  {
    v10 = a6;
    v11 = a3;
    v12 = a2;
    v13 = -[PKSqueezePaletteViewExpandedToolsLayout initWithContext:drawingTools:selectedToolIndex:visibleToolsCount:]((id *)[PKSqueezePaletteViewExpandedToolsLayout alloc], v12, v11, a4, a5);

    if (v13)
      objc_storeWeak(v13 + 7, v10);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)makeExpandedColorsLayoutWithContext:(void *)a3 colors:(void *)a4 selectedColor:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  PKSqueezePaletteViewExpandedColorsLayout *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __94__PKSqueezePaletteViewLayoutFactory_makeExpandedColorsLayoutWithContext_colors_selectedColor___block_invoke;
    v18 = &unk_1E777D238;
    v19 = a1;
    v11 = v10;
    v20 = v11;
    v21 = v9;
    v22 = &v23;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
    objc_msgSend(a1[1], "makeBackButton", v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PKSqueezePaletteViewExpandedColorsLayout alloc];
    a1 = (id *)-[PKSqueezePaletteViewExpandedColorsLayout initWithContext:colorButtons:selectedColorIndex:backButton:](v13, v7, v11, v24[3], v12);

    _Block_object_dispose(&v23, 8);
  }

  return a1;
}

void __94__PKSqueezePaletteViewLayoutFactory_makeExpandedColorsLayoutWithContext_colors_selectedColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  -[PKSqueezePaletteButtonFactory makeColorSwatchButtonWithColor:](v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  LODWORD(v6) = DKUColorIsEqualToColorIgnoringOpacity((CGColor *)objc_msgSend(v8, "CGColor"), (CGColor *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "CGColor"), 1);

  if ((_DWORD)v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;

}

- (id)makeExpandedOptionsLayoutWithContext:(id *)a1
{
  id *v2;
  id v3;
  PKSqueezePaletteViewExpandedOptionsLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = [PKSqueezePaletteViewExpandedOptionsLayout alloc];
    objc_msgSend(v2[1], "makeBackButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[1], "makeTextBoxButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[1], "makeSignatureButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[1], "makeShapesButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PKIsDeviceLocked();
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v2[1], "makeStickersButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2[1], "makeGearButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[PKSqueezePaletteViewExpandedOptionsLayout initWithContext:backButton:textBoxButton:signatureButton:shapesButton:stickersButton:gearButton:](v4, v3, v5, v6, v7, v8, v10, v11);

    if (!v9)
  }
  return v2;
}

- (_QWORD)makeExpandedInkingToolLayoutWithContext:(_QWORD *)a1
{
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = v3;
    if (v3)
      v5 = (void *)*((_QWORD *)v3 + 3);
    else
      v5 = 0;
    v6 = v5;
    v7 = (void *)objc_opt_new();
    if (v6)
      v8 = (void *)v6[103];
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "_configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeWeightsToButtonImages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__PKSqueezePaletteViewLayoutFactory_makeExpandedInkingToolLayoutWithContext___block_invoke;
    v17[3] = &unk_1E777D260;
    v17[4] = v2;
    v18 = v6;
    v19 = v7;
    v14 = v7;
    v15 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
    v2 = -[PKSqueezePaletteViewExpandedInkingToolLayout initWithContext:strokeWeightButtons:]([PKSqueezePaletteViewExpandedInkingToolLayout alloc], v4, v14);

  }
  return v2;
}

void __77__PKSqueezePaletteViewLayoutFactory_makeExpandedInkingToolLayoutWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  float v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  const __CFString *v21;
  id v22;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  if (v3)
    v6 = *(void **)(v3 + 824);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "floatValue");
  -[PKSqueezePaletteButtonFactory makeStrokeWeightButtonForTool:withWeight:](v4, v7, v8);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v22);
  objc_msgSend(v5, "floatValue");
  v10 = v9;

  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("Weight"));
  if (v10 == -1.0
    || (fabs(v11 + 1.0) >= 0.000000999999997 ? (v13 = v10 == 10.0) : (v13 = 1),
        v13
     || (fabs(v11 + -10.0) >= 0.00000999999997 ? (v14 = v10 == 1.5) : (v14 = 1), v14 || fabs(v11 + -1.5) < 0.0000015)))
  {
    objc_msgSend(v22, "setAccessibilityLabel:", CFSTR("Very Light"));
  }
  if (v10 == -0.5
    || (fabs(v11 + 0.5) >= 0.000000499999999 ? (v15 = v10 == 20.0) : (v15 = 1),
        v15
     || (fabs(v11 + -20.0) >= 0.0000199999999 ? (v16 = v10 == 2.5) : (v16 = 1),
         v16 || fabs(v11 + -2.5) < 0.00000249999999)))
  {
    objc_msgSend(v22, "setAccessibilityLabel:", CFSTR("Light"));
  }
  if (v10 == 0.0
    || v10 == 30.0
    || (fabs(v11 + -30.0) >= 0.0000299999999 ? (v17 = v10 == 4.0) : (v17 = 1), v17
                                                                            || fabs(v11 + -4.0) < 0.00000399999999))
  {
    objc_msgSend(v22, "setAccessibilityLabel:", CFSTR("Medium"));
  }
  if (v10 == 0.5
    || (fabs(v11 + -0.5) >= 0.000000499999999 ? (v18 = v10 == 60.0) : (v18 = 1),
        v18
     || (fabs(v11 + -60.0) >= 0.0000599999998 ? (v19 = v10 == 8.0) : (v19 = 1),
         v19 || fabs(v11 + -8.0) < 0.00000799999998)))
  {
    objc_msgSend(v22, "setAccessibilityLabel:", CFSTR("Heavy"));
  }
  if (v10 == 1.0
    || (fabs(v11 + -1.0) >= 0.000000999999997 ? (v20 = v10 == 50.0) : (v20 = 1),
        v20
     || fabs(v11 + -50.0) < 0.0000499999999
     || v10 == 80.0
     || fabs(v11 + -80.0) < 0.0000799999998
     || v10 == 14.0
     || fabs(v11 + -14.0) < 0.000014))
  {
    objc_msgSend(v22, "setAccessibilityLabel:", CFSTR("Very Heavy"));
  }
  if (v10 == 40.0 || fabs(v11 + -40.0) < 0.0000399999999)
  {
    if (objc_msgSend(v12, "isEqual:", CFSTR("Watercolor")))
      v21 = CFSTR("Medium");
    else
      v21 = CFSTR("Heavy");
    objc_msgSend(v22, "setAccessibilityLabel:", v21);
  }

}

- (id)makeExpandedLassoToolLayoutWithContext:(uint64_t)a1
{
  id v2;
  id *v3;

  if (a1)
  {
    v2 = a2;
    v3 = -[PKSqueezePaletteViewExpandedLassoToolLayout initWithContext:]((id *)[PKSqueezePaletteViewExpandedLassoToolLayout alloc], v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)makeExpandedEraserToolLayoutWithContext:(void *)a1
{
  void **v2;
  id v3;
  void *v4;
  void *v5;
  PKEraserTool *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PKEraserTool *v12;
  _QWORD v14[5];
  PKEraserTool *v15;
  id v16;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = (void *)objc_opt_new();
    -[PKSqueezePaletteButtonFactory makeObjectEraserButton](v2[1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
    v6 = -[PKEraserTool initWithEraserType:]([PKEraserTool alloc], "initWithEraserType:", 1);
    -[PKTool _configuration](v6, "_configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "strokeWeightsToButtonImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PKSqueezePaletteViewLayoutFactory_makeExpandedEraserToolLayoutWithContext___block_invoke;
    v14[3] = &unk_1E777D260;
    v14[4] = v2;
    v15 = v6;
    v16 = v4;
    v11 = v4;
    v12 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
    v2 = (void **)-[PKSqueezePaletteViewExpandedEraserToolLayout initWithContext:attributeButtons:]([PKSqueezePaletteViewExpandedEraserToolLayout alloc], v3, v11);

  }
  return v2;
}

void __77__PKSqueezePaletteViewLayoutFactory_makeExpandedEraserToolLayoutWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  float v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(a2, "floatValue");
  -[PKSqueezePaletteButtonFactory makeStrokeWeightButtonForTool:withWeight:](v4, v3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonFactory, 0);
}

@end
