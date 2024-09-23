@implementation TabSnapshotGenerator

- (TabSnapshotGenerator)init
{
  TabSnapshotGenerator *v2;
  uint64_t v3;
  NSMutableArray *requestQueue;
  TabSnapshotGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotGenerator;
  v2 = -[TabSnapshotGenerator init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

+ (id)_snapshotRenderingQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TabSnapshotGenerator__snapshotRenderingQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_snapshotRenderingQueue_onceToken != -1)
    dispatch_once(&_snapshotRenderingQueue_onceToken, block);
  return (id)_snapshotRenderingQueue_queue;
}

void __47__TabSnapshotGenerator__snapshotRenderingQueue__block_invoke()
{
  NSObject *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *attr;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("com.apple.mobilesafari.%@"), v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), attr);
  v6 = (void *)_snapshotRenderingQueue_queue;
  _snapshotRenderingQueue_queue = (uint64_t)v5;

}

- (void)snapshotWithRequest:(id)a3 contentProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *requestQueue;
  TabSnapshotQueueItem *v11;
  void *v12;
  void *v13;
  TabSnapshotQueueItem *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  requestQueue = self->_requestQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__TabSnapshotGenerator_snapshotWithRequest_contentProvider_completion___block_invoke;
  v16[3] = &unk_1E9CF4628;
  v15 = v8;
  v17 = v15;
  v11 = (TabSnapshotQueueItem *)a5;
  -[NSMutableArray safari_firstObjectPassingTest:](requestQueue, "safari_firstObjectPassingTest:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setContentProvider:", v9);
    objc_msgSend(v13, "appendCompletionHandler:", v11);
  }
  else
  {
    v14 = -[TabSnapshotQueueItem initWithRequest:contentProvider:completionHandler:]([TabSnapshotQueueItem alloc], "initWithRequest:contentProvider:completionHandler:", v15, v9, v11);

    -[NSMutableArray insertObject:atIndex:](self->_requestQueue, "insertObject:atIndex:", v14, 0);
    v11 = v14;
  }

  -[TabSnapshotGenerator _beginNextItemIfIdle](self, "_beginNextItemIfIdle");
}

uint64_t __71__TabSnapshotGenerator_snapshotWithRequest_contentProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "snappshottingIsInProgress") ^ 1;
  else
    v5 = 0;

  return v5;
}

- (void)_beginNextItemIfIdle
{
  void *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  -[NSMutableArray lastObject](self->_requestQueue, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "snappshottingIsInProgress") & 1) == 0)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSignposts();
    v6 = os_signpost_id_make_with_pointer(v5, v4);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GenerateTabSnapshot", (const char *)&unk_1D7ED143D, buf, 2u);
      }
    }

    objc_msgSend(v4, "setSnappshottingIsInProgress:", 1);
    objc_msgSend(v4, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "options") & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      -[TabSnapshotGenerator _snapshotItem:](self, "_snapshotItem:", v4);
    }
    else
    {
      objc_msgSend(v8, "size");
      v11 = v10;
      v13 = v12;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__TabSnapshotGenerator__beginNextItemIfIdle__block_invoke;
      v14[3] = &unk_1E9CF4650;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v9, "prepareForSnapshotOfSize:completion:", v14, v11, v13);

    }
  }

}

uint64_t __44__TabSnapshotGenerator__beginNextItemIfIdle__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    return objc_msgSend(v3, "_snapshotItem:", v4);
  else
    return objc_msgSend(v3, "_didFinishItem:withImage:", v4, 0);
}

- (void)_didFinishItem:(id)a3 withImage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  __CFString *v11;
  __CFString *v12;
  void (**v13)(_QWORD, _QWORD);
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXSignposts();
  v9 = os_signpost_id_make_with_pointer(v8, v6);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      v11 = CFSTR("YES");
      if (!v7)
        v11 = CFSTR("NO");
      v12 = v11;
      v14 = 138412290;
      v15 = v12;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v8, OS_SIGNPOST_INTERVAL_END, v10, "GenerateTabSnapshot", "success=%@", (uint8_t *)&v14, 0xCu);

    }
  }

  -[NSMutableArray removeObject:](self->_requestQueue, "removeObject:", v6);
  objc_msgSend(v6, "completionHandler");
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v13)[2](v13, v7);

  -[TabSnapshotGenerator _beginNextItemIfIdle](self, "_beginNextItemIfIdle");
}

- (void)_snapshotItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id WeakRetained;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  TabSnapshotGenerator *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  BOOL v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  TabSnapshotGenerator *v50;
  id v51;
  id v52;
  id v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  char v68;
  char v69;

  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "snapshotContentImage"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = 0;
    v10 = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "snapshotContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v8 = 0;
    v10 = 0;
    if (!v9)
    {
      -[TabSnapshotGenerator _didFinishItem:withImage:](self, "_didFinishItem:withImage:", v4, 0);
      goto LABEL_25;
    }
  }
  objc_msgSend(v5, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "topBackdropHeight");
  v16 = v15;
  v17 = objc_msgSend(v5, "options");
  -[TabSnapshotGenerator backgroundColorForContentProvider:](self, "backgroundColorForContentProvider:", v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSnapshotGenerator contentRectForContentProvider:withSnapshotSize:](self, "contentRectForContentProvider:withSnapshotSize:", v6, v12, v14);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v44 = v24;
  v43 = -[TabSnapshotGenerator contentShouldUnderlapTopBackdropForContentProvider:](self, "contentShouldUnderlapTopBackdropForContentProvider:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "topBarsHeightForSnapshotGenerator:", self);
  v27 = v26;
  v45 = WeakRetained;
  objc_msgSend(WeakRetained, "contentSizeForSnapshotGenerator:", self);
  if (v28 == 0.0)
    v29 = 1.0;
  else
    v29 = v12 / v28;
  objc_msgSend(v9, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v47 = (void *)objc_msgSend(v30, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v32, "copy");

  }
  if ((v17 & 1) != 0)
    v33 = 1;
  else
    v33 = v10;
  if ((v33 & 1) != 0
    || (-[TabSnapshotGenerator _renderView:afterScreenUpdates:](self, "_renderView:afterScreenUpdates:", v9, (v17 & 0x20) != 0), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke;
    aBlock[3] = &unk_1E9CF4678;
    v67 = v43;
    v61 = v27;
    v62 = v29;
    v35 = v8;
    v59 = v35;
    v63 = v19;
    v64 = v21;
    v65 = v23;
    v66 = v44;
    v68 = v17 & 1;
    v60 = v9;
    v69 = (v17 & 0x20) >> 5;
    v36 = _Block_copy(aBlock);
    if ((v17 & 1) != 0)
    {
      -[TabSnapshotGenerator renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:](self, "renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:", v46, v17, v36, v12, v14, v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = self;
      v39 = v46;
      -[TabSnapshotGenerator _didFinishItem:withImage:](v38, "_didFinishItem:withImage:", v4, v37);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_snapshotRenderingQueue");
      v40 = objc_claimAutoreleasedReturnValue();
      block[0] = v34;
      block[1] = 3221225472;
      block[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke_2;
      block[3] = &unk_1E9CF46A0;
      v49 = v47;
      v50 = self;
      v54 = v12;
      v55 = v14;
      v39 = v46;
      v51 = v46;
      v56 = v16;
      v57 = v17;
      v53 = v36;
      v52 = v4;
      dispatch_async(v40, block);

      v37 = v49;
    }
    v41 = v45;

  }
  else
  {
    v42 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    v41 = v45;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[TabSnapshotGenerator _snapshotItem:].cold.1(v42);
    -[TabSnapshotGenerator _didFinishItem:withImage:](self, "_didFinishItem:withImage:", v4, 0);
    v39 = v46;
  }

LABEL_25:
}

void *__38__TabSnapshotGenerator__snapshotItem___block_invoke(uint64_t a1, CGContextRef c)
{
  void *result;

  if (*(_BYTE *)(a1 + 96))
    CGContextTranslateCTM(c, 0.0, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)));
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "drawInRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(_BYTE *)(a1 + 97))
    return (void *)objc_msgSend(*(id *)(a1 + 40), "drawViewHierarchyInRect:afterScreenUpdates:", *(unsigned __int8 *)(a1 + 98), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  return result;
}

void __38__TabSnapshotGenerator__snapshotItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke_3;
  block[3] = &unk_1E9CF2990;
  block[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __38__TabSnapshotGenerator__snapshotItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishItem:withImage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)backgroundColorForContentProvider:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "snapshotBackgroundColor"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (CGRect)contentRectForContentProvider:(id)a3 withSnapshotSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "snapshotContentRectInBounds:", 0.0, 0.0, width, height);
    v9 = v8;
    v7 = v10;
    width = v11;
    height = v12;
  }
  else
  {
    v9 = 0.0;
  }

  v13 = v9;
  v14 = v7;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)contentShouldUnderlapTopBackdropForContentProvider:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "snapshotContentShouldUnderlapTopBackdrop");
  else
    v4 = 1;

  return v4;
}

- (id)renderSnapshotWithSize:(CGSize)a3 backgroundColor:(id)a4 topBackdropHeight:(double)a5 options:(unint64_t)a6 drawing:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  _BOOL8 v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v33[4];
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize v40;
  double v41;
  unint64_t v42;

  v9 = a4;
  v10 = a7;
  v11 = _SFOnePixel();
  v14 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if ((a6 & 2) != 0)
    v17 = v12;
  else
    v17 = *MEMORY[0x1E0DC49E8];
  if ((a6 & 4) != 0)
    v18 = v12;
  else
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if ((a6 & 8) != 0)
    v19 = v12;
  else
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if ((a6 & 0x10) != 0)
    v20 = v12;
  else
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v21 = (void *)MEMORY[0x1D82A1AF4](v11);
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPreferredRange:", 2);
  if (v9)
  {
    objc_msgSend(v9, "alphaComponent");
    v24 = v18 == v13;
    if (v17 != v14)
      v24 = 0;
    if (v20 != v15)
      v24 = 0;
    if (v19 != v16)
      v24 = 0;
    v25 = v23 >= 1.0 && v24;
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v22, "setOpaque:", v25);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v22, a3.width + v18 + v20, a3.height + v17 + v19);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __97__TabSnapshotGenerator_renderSnapshotWithSize_backgroundColor_topBackdropHeight_options_drawing___block_invoke;
  v33[3] = &unk_1E9CF46C8;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v39 = v20;
  v40 = a3;
  v27 = v9;
  v34 = v27;
  v28 = v10;
  v35 = v28;
  v41 = a5;
  v42 = a6;
  objc_msgSend(v26, "imageWithActions:", v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v21);
  return v29;
}

void __97__TabSnapshotGenerator_renderSnapshotWithSize_backgroundColor_topBackdropHeight_options_drawing___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  CGImage *v9;
  CGImage *v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect ClipBoundingBox;
  CGRect v16;

  v13 = a2;
  v3 = (CGContext *)objc_msgSend(v13, "CGContext");
  CGContextTranslateCTM(v3, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 48));
  v14.size.width = *(CGFloat *)(a1 + 80);
  v14.size.height = *(CGFloat *)(a1 + 88);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGContextClipToRect(v3, v14);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "set");
    ClipBoundingBox = CGContextGetClipBoundingBox(v3);
    UIRectFill(ClipBoundingBox);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    CGContextSaveGState(v3);
    CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 96));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CGContextRestoreGState(v3);
  }
  if (*(double *)(a1 + 96) > 0.0 && (*(_BYTE *)(a1 + 104) & 0x40) == 0)
  {
    objc_msgSend(v13, "currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    v8 = objc_retainAutorelease(v5);
    v9 = (CGImage *)objc_msgSend(v8, "CGImage");
    v16.origin.x = v7 * *(double *)(a1 + 56);
    v16.origin.y = v7 * *(double *)(a1 + 48);
    v16.size.width = v7 * *(double *)(a1 + 80);
    v16.size.height = v7 * *(double *)(a1 + 96);
    v10 = CGImageCreateWithImageInRect(v9, v16);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v10, objc_msgSend(v8, "imageOrientation"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_applyBackdropViewStyle:includeTints:includeBlur:", 2020, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
    CGImageRelease(v10);

  }
}

- (id)_renderView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4)
    {
      objc_msgSend(v5, "nextResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "nextResponder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

      objc_msgSend(v8, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", v6);

      if (v10
        && (objc_msgSend(v6, "window"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        objc_msgSend(v8, "willMoveToParentViewController:", 0);
        objc_msgSend(v6, "removeFromSuperview");
        objc_msgSend(v8, "removeFromParentViewController");
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPreferredRange:", 2);
      if ((objc_msgSend(v6, "isOpaque") & 1) != 0)
      {
        objc_msgSend(v6, "backgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "alphaComponent");
        objc_msgSend(v16, "setOpaque:", v18 == 1.0);

      }
      else
      {
        objc_msgSend(v16, "setOpaque:", 0);
      }
      v19 = objc_alloc(MEMORY[0x1E0DC3828]);
      objc_msgSend(v6, "bounds");
      v20 = (void *)objc_msgSend(v19, "initWithBounds:format:", v16);
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __55__TabSnapshotGenerator__renderView_afterScreenUpdates___block_invoke;
      v28[3] = &unk_1E9CF46F0;
      v30 = &v32;
      v21 = v6;
      v29 = v21;
      v31 = a4;
      objc_msgSend(v20, "imageWithActions:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v10, "addChildViewController:", v8);
        objc_msgSend(v11, "subviews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v27 <= v24)
          objc_msgSend(v11, "insertSubview:atIndex:", v21);
        else
          objc_msgSend(v11, "addSubview:", v21);
        objc_msgSend(v8, "didMoveToParentViewController:", v10);
      }
      if (*((_BYTE *)v33 + 24))
        v25 = v22;
      else
        v25 = 0;
      v9 = v25;

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      objc_msgSend(v5, "_sf_snapshotImageFromIOSurface");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __55__TabSnapshotGenerator__renderView_afterScreenUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "bounds");
  result = objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (TabSnapshotGeneratorDelegate)delegate
{
  return (TabSnapshotGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (void)_snapshotItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Could not render snapshot content view", v1, 2u);
}

@end
