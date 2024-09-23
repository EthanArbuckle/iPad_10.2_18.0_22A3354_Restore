@implementation PKDataDetectorItem

+ (id)dataDetectorItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int valid;
  PKDataDetectorItem *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "strokeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = -[PKDetectionItem initWithSessionManager:]([PKDataDetectorItem alloc], "initWithSessionManager:", v6);
    -[PKDetectionItem setQueryItem:](v10, "setQueryItem:", v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)drawing
{
  void *v2;
  void *v3;

  -[PKDetectionItem sessionManager](self, "sessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager drawing](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_baselinePath
{
  void *v2;
  void *v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baselinePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)strokeColor
{
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD);
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  -[PKDataDetectorItem scannerResult](self, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "coreResult");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v5 = (uint64_t (*)(uint64_t, _QWORD))_MergedGlobals_142;
  v21 = _MergedGlobals_142;
  if (!_MergedGlobals_142)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = ___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke;
    v16 = &unk_1E777A710;
    v17 = &v18;
    ___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke((uint64_t)&v13);
    v5 = (uint64_t (*)(uint64_t, _QWORD))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v5)
  {
    v6 = v5(v4, 0);

    if (v6)
    {
      -[PKDetectionItem inkColor](self, "inkColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[PKDetectionItem _generatePaths](self, "_generatePaths");
      v18 = 0;
      v19 = &v18;
      v20 = 0x2050000000;
      v8 = (void *)qword_1ECEE6340;
      v21 = (void *)qword_1ECEE6340;
      if (!qword_1ECEE6340)
      {
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = ___ZL29getDDDetectionControllerClassv_block_invoke;
        v16 = &unk_1E777A710;
        v17 = &v18;
        ___ZL29getDDDetectionControllerClassv_block_invoke((uint64_t)&v13);
        v8 = (void *)v19[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v18, 8);
      -[PKDetectionItem inkColor](self, "inkColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lightUnderlineColorFromTextColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    return v11;
  }
  else
  {
    dlerror();
    result = (id)abort_report_np();
    __break(1u);
  }
  return result;
}

- (DDScannerResult)scannerResult
{
  void *v2;
  void *v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DDScannerResult *)v3;
}

- (__DDResult)coreResult
{
  void *v2;
  void *v3;
  __DDResult *v4;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__DDResult *)objc_msgSend(v3, "coreResult");

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKDetectionItem queryItem](self, "queryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKDataDetectorItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PKDataDetectorItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKDetectionItem queryItem](self, "queryItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDetectionItem queryItem](v4, "queryItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (PKDataDetectorItemDelegate)delegate
{
  return (PKDataDetectorItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)updatedDataDetectorContextForView:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _Unwind_Exception *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  CGRect v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  -[PKDataDetectorItem delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataDetectorItemAllItems:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v13 = (_QWORD *)_MergedGlobals_146;
    v32 = _MergedGlobals_146;
    if (!_MergedGlobals_146)
    {
      v14 = (void *)DataDetectorsUILibrary();
      v13 = dlsym(v14, "kDataDetectorsAllResultsKey");
      v30[3] = (uint64_t)v13;
      _MergedGlobals_146 = (uint64_t)v13;
    }
    _Block_object_dispose(&v29, 8);
    if (!v13)
      goto LABEL_14;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *v13);
  }
  -[PKDataDetectorItem scannerResult](self, "scannerResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (!v17)
    goto LABEL_11;
  -[PKDataDetectorItem scannerResult](self, "scannerResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v20 = (_QWORD *)qword_1ECEE63A8;
  v32 = qword_1ECEE63A8;
  if (!qword_1ECEE63A8)
  {
    v21 = (void *)DataDetectorsUILibrary();
    v20 = dlsym(v21, "kDataDetectorsMiddleText");
    v30[3] = (uint64_t)v20;
    qword_1ECEE63A8 = (uint64_t)v20;
  }
  _Block_object_dispose(&v29, 8);
  if (!v20)
  {
LABEL_14:
    dlerror();
    v28 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v28);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *v20);

LABEL_11:
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (CGRectIsEmpty(v33))
  {
    objc_msgSend(v9, "bounds");
    x = v22;
    y = v23;
    width = v24;
    height = v25;
  }
  objc_msgSend(getDDContextMenuActionClass(), "updateContext:withSourceRect:", v10, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  _OWORD v11[3];
  _OWORD v12[3];

  v7 = *(_OWORD *)&a6->c;
  v12[0] = *(_OWORD *)&a6->a;
  v12[1] = v7;
  v12[2] = *(_OWORD *)&a6->tx;
  v8 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a7->tx;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v9;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKDataDetectorItem handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:](self, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:highlightTransform:sourceRect:", a3, a5, v12, v11, v10, a4.x, a4.y, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)handleTapForMenuForInteraction:(id)a3 location:(CGPoint)a4 view:(id)a5 viewTransform:(CGAffineTransform *)a6 drawingTransform:(CGAffineTransform *)a7 highlightTransform:(CGAffineTransform *)a8 sourceRect:(CGRect)a9
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v17;
  CGFloat v18;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  _OWORD v31[3];
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36[3];
  id location;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v17 = a4.y;
  v18 = a4.x;
  v20 = a3;
  v21 = a5;
  objc_initWeak(&location, self);
  -[PKDataDetectorItem updatedDataDetectorContextForView:sourceRect:](self, "updatedDataDetectorContextForView:sourceRect:", v21, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __148__PKDataDetectorItem_InteractionSupport__handleTapForMenuForInteraction_location_view_viewTransform_drawingTransform_highlightTransform_sourceRect___block_invoke;
  v32[3] = &unk_1E777BE98;
  objc_copyWeak(v36, &location);
  v23 = v21;
  v33 = v23;
  v36[1] = *(id *)&v18;
  v36[2] = *(id *)&v17;
  v24 = v20;
  v34 = v24;
  v25 = v22;
  v35 = v25;
  v26 = *(_OWORD *)&a6->c;
  v31[0] = *(_OWORD *)&a6->a;
  v31[1] = v26;
  v31[2] = *(_OWORD *)&a6->tx;
  v27 = *(_OWORD *)&a7->c;
  v30[0] = *(_OWORD *)&a7->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&a7->tx;
  v28 = *(_OWORD *)&a8->c;
  v29[0] = *(_OWORD *)&a8->a;
  v29[1] = v28;
  v29[2] = *(_OWORD *)&a8->tx;
  -[PKDataDetectorItem _highlightForView:viewTransform:drawingTransform:highlightTransform:completion:](self, "_highlightForView:viewTransform:drawingTransform:highlightTransform:completion:", v23, v31, v30, v29, v32);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);

}

void __148__PKDataDetectorItem_InteractionSupport__handleTapForMenuForInteraction_location_view_viewTransform_drawingTransform_highlightTransform_sourceRect___block_invoke(uint64_t a1)
{
  id DDContextMenuActionClass;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    DDContextMenuActionClass = getDDContextMenuActionClass();
    objc_msgSend(WeakRetained, "scannerResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DDContextMenuActionClass, "performDefaultActionWithResult:inView:atLocation:withMenuInteraction:context:", objc_msgSend(v3, "coreResult"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
}

- (void)_highlightForView:(id)a3 viewTransform:(CGAffineTransform *)a4 drawingTransform:(CGAffineTransform *)a5 highlightTransform:(CGAffineTransform *)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  const CGPath *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  dispatch_time_t v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  _QWORD block[6];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v12 = a3;
  v13 = a7;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x3010000000;
  v55 = 0;
  v56 = 0;
  v54 = "";
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x3010000000;
  v49 = 0;
  v50 = 0;
  v48 = "";
  -[PKDetectionItem itemSpaceBaselinePath](self, "itemSpaceBaselinePath");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const CGPath *)objc_msgSend(v14, "CGPath");
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke;
  block[3] = &unk_1E777BEC0;
  block[4] = &v51;
  block[5] = &v45;
  CGPathApplyWithBlock(v15, block);

  -[PKDetectionItem itemSpaceBoundsPath](self, "itemSpaceBoundsPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v19 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v43.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v43.c = v19;
  *(_OWORD *)&v43.tx = *(_OWORD *)&a5->tx;
  objc_msgSend(v18, "applyTransform:", &v43);
  v20 = atan2(v46[5] - v52[5], v46[4] - v52[4]);
  v21 = fabs(v20);
  if (v21 > 0.157079633)
  {
    objc_msgSend(v18, "bounds");
    v23 = v22;
    v25 = v24;
    CGAffineTransformMakeTranslation(&v42, v22 * -0.5, v24 * -0.5);
    objc_msgSend(v18, "applyTransform:", &v42);
    CGAffineTransformMakeRotation(&v41, -v20);
    objc_msgSend(v18, "applyTransform:", &v41);
    CGAffineTransformMakeTranslation(&v40, v23 * 0.5, v25 * 0.5);
    objc_msgSend(v18, "applyTransform:", &v40);
  }
  objc_msgSend(v18, "bounds");
  v26 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v43.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v43.c = v26;
  *(_OWORD *)&v43.tx = *(_OWORD *)&a4->tx;
  v58 = CGRectApplyAffineTransform(v57, &v43);
  v27 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v43.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&v43.c = v27;
  *(_OWORD *)&v43.tx = *(_OWORD *)&a6->tx;
  v59 = CGRectApplyAffineTransform(v58, &v43);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4198]), "initWithFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
  objc_msgSend(v28, "setOpaque:", 0);
  if (v21 > 0.157079633)
  {
    CGAffineTransformMakeRotation(&v39, v20);
    v38 = v39;
    objc_msgSend(v28, "setTransform:", &v38);
  }
  objc_msgSend(v28, "bounds");
  v30 = v29 * 0.5;
  if (v29 * 0.5 > 6.0)
    v30 = 6.0;
  objc_msgSend(v28, "setCornerRadius:", v30);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.101960784, 0.3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setColor:", v31);

  objc_msgSend(v12, "addSubview:", v28);
  v32 = dispatch_time(0, 100000000);
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke_2;
  v35[3] = &unk_1E7778AA0;
  v36 = v28;
  v37 = v13;
  v33 = v13;
  v34 = v28;
  dispatch_after(v32, MEMORY[0x1E0C80D38], v35);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

}

__n128 __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke(uint64_t a1, uint64_t a2, __n128 result)
{
  uint64_t v3;
  __n128 *v4;

  switch(*(_DWORD *)a2)
  {
    case 0:
      v3 = *(_QWORD *)(a1 + 32);
      goto LABEL_4;
    case 1:
      v3 = *(_QWORD *)(a1 + 40);
LABEL_4:
      v4 = *(__n128 **)(v3 + 8);
      result = *(__n128 *)*(_QWORD *)(a2 + 8);
      goto LABEL_6;
    case 2:
      v4 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
      result = *(__n128 *)(*(_QWORD *)(a2 + 8) + 16);
LABEL_6:
      v4[2] = result;
      break;
    case 3:
      result = *(__n128 *)(*(_QWORD *)(a2 + 8) + 32);
      *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __121__PKDataDetectorItem_InteractionSupport___highlightForView_viewTransform_drawingTransform_highlightTransform_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6
{
  return -[PKDataDetectorItem contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:](self, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:sourceRect:", a3, a5, a6, a4.x, a4.y, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 view:(id)a5 identifier:(id)a6 sourceRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id DDContextMenuActionClass;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a6;
  v14 = a5;
  DDContextMenuActionClass = getDDContextMenuActionClass();
  -[PKDataDetectorItem scannerResult](self, "scannerResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "coreResult");
  -[PKDataDetectorItem updatedDataDetectorContextForView:sourceRect:](self, "updatedDataDetectorContextForView:sourceRect:", v14, x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(DDContextMenuActionClass, "contextMenuConfigurationWithResult:inView:context:menuIdentifier:", v17, v14, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewInContainerView:(id)a5 frame:(CGRect)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  double MidX;
  double MidY;
  id v16;
  id v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a5;
  -[PKDetectionItem image](self, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, width, height);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidY = CGRectGetMidY(v22);
  v16 = objc_alloc(MEMORY[0x1E0DC3D90]);
  v17 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B88]), "initWithContainer:center:", v11, MidX, MidY);

  v19 = (void *)objc_msgSend(v16, "initWithView:parameters:target:", v13, v17, v18);
  return v19;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v10 = (void *)getDDContextMenuConfigurationClass_softClass;
  v16 = getDDContextMenuConfigurationClass_softClass;
  if (!getDDContextMenuConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getDDContextMenuConfigurationClass_block_invoke;
    v12[3] = &unk_1E7777068;
    v12[4] = &v13;
    __getDDContextMenuConfigurationClass_block_invoke((uint64_t)v12);
    v10 = (void *)v14[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v13, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "performPreviewActionForMenuWithAnimator:", v9);

}

@end
