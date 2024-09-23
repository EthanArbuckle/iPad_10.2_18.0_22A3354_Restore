@implementation LAUIPKGlyphWrapper

+ (id)glyphWithStyle:(int64_t)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  LAUIPKGlyphWrapper *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = +[LAUIPKGlyphWrapper _loadClassFromString:](LAUIPKGlyphWrapper, "_loadClassFromString:", CFSTR("PKGlyphView"));
  if ((unint64_t)a3 >= 4)
  {
    LA_LOG_LAUIPKGlyphWrapper();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[LAUIPKGlyphWrapper glyphWithStyle:frame:].cold.1(a3, v11);

    v10 = 1;
  }
  else
  {
    v10 = qword_209E30B58[a3];
  }
  v12 = (void *)objc_msgSend([v9 alloc], "initWithStyle:", v10);
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  v13 = -[LAUIPKGlyphWrapper initWithGlyphView:]([LAUIPKGlyphWrapper alloc], "initWithGlyphView:", v12);

  return v13;
}

- (LAUIPKGlyphWrapper)initWithGlyphView:(id)a3
{
  id v5;
  LAUIPKGlyphWrapper *v6;
  LAUIPKGlyphWrapper *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *glyphQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAUIPKGlyphWrapper;
  v6 = -[LAUIPKGlyphWrapper init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_glyphView, a3);
    objc_storeStrong((id *)&v7->_view, a3);
    v8 = (void *)MEMORY[0x24BE606C0];
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDefaultQueueWithIdentifier:concurrencyAttribute:", CFSTR("glyphQueue"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    glyphQueue = v7->_glyphQueue;
    v7->_glyphQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (double)_minimumAnimationDurationForState:(int64_t)a3
{
  double result;

  result = 0.15;
  if (a3 == 1)
    result = 0.75;
  if (a3 == 5)
    return 0.5;
  return result;
}

- (void)setState:(int64_t)a3 idleTouchID:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16[2];
  BOOL v17;
  BOOL v18;
  BOOL v19;
  id location;

  v10 = a6;
  v11 = -[LAUIPKGlyphWrapper fastAnimations](self, "fastAnimations");
  objc_initWeak(&location, self);
  -[LAUIPKGlyphWrapper glyphQueue](self, "glyphQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke;
  v14[3] = &unk_24C27EBA0;
  v17 = !v11;
  v18 = a4;
  v14[4] = self;
  v16[1] = (id)a3;
  objc_copyWeak(v16, &location);
  v19 = a5;
  v15 = v10;
  v13 = v10;
  dispatch_async(v12, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6[2];
  char v7;
  char v8;
  char v9;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "glyphQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v2);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2;
  block[3] = &unk_24C27EBA0;
  v7 = *(_BYTE *)(a1 + 65);
  v3 = *(void **)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 32);
  v6[1] = v3;
  v8 = *(_BYTE *)(a1 + 64);
  block[1] = 3221225472;
  objc_copyWeak(v6, (id *)(a1 + 48));
  v9 = *(_BYTE *)(a1 + 66);
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v6);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  _BOOL8 v10;
  void *v11;
  _BYTE *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27[2];
  char v28;

  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "idleTouchID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(+[LAUIPKGlyphWrapper _loadClassFromString:](LAUIPKGlyphWrapper, "_loadClassFromString:", CFSTR("PKGlyphView"))), "initWithStyle:", 0);
    objc_msgSend(*(id *)(a1 + 32), "glyphView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v3, "setFrame:");

    objc_msgSend(*(id *)(a1 + 32), "glyphView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v3;

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v9 = *(_BYTE **)(a1 + 32);
    v10 = 1;
  }
  else
  {
LABEL_6:
    v9 = *(_BYTE **)(a1 + 32);
    v10 = v9[8] != 0;
  }
  objc_msgSend(v9, "glyphView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  v12 = *(_BYTE **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    v13 = v12[8] != 0;
  else
    v13 = 1;
  objc_msgSend(v12, "idleTouchID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG_LAUIPKGlyphWrapper();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_cold_1(a1, v16);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "glyphView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(a1 + 56);
  v20 = *(unsigned __int8 *)(a1 + 66);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_5;
  v23[3] = &unk_24C27EB78;
  v27[1] = v19;
  v28 = *(_BYTE *)(a1 + 65);
  objc_copyWeak(v27, (id *)(a1 + 48));
  v21 = v15;
  v24 = v21;
  v22 = *(id *)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = v22;
  objc_msgSend(v18, "setState:animated:completionHandler:", v19, v20, v23);

  objc_destroyWeak(v27);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_5(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  dispatch_time_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  char v22;

  LA_LOG_LAUIPKGlyphWrapper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_5_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  if (*(_BYTE *)(a1 + 72))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_minimumAnimationDurationForState:", *(_QWORD *)(a1 + 64));
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    v15 = v13 + v14;

    v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6;
    v19[3] = &unk_24C27EB30;
    v21 = *(_QWORD *)(a1 + 64);
    v18 = *(id *)(a1 + 48);
    v22 = a2;
    v19[4] = *(_QWORD *)(a1 + 40);
    v20 = v18;
    dispatch_after(v16, v17, v19);

  }
  else
  {
    if (*(_QWORD *)(a1 + 64) == 11)
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  LA_LOG_LAUIPKGlyphWrapper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  if (*(_QWORD *)(a1 + 48) == 11)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "glyphQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

}

uint64_t __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_7()
{
  return -[objc_class invokeSuccessFeedback](+[LAUIPKGlyphWrapper _loadClassFromString:](LAUIPKGlyphWrapper, "_loadClassFromString:", CFSTR("PKGlyphView")), "invokeSuccessFeedback");
}

uint64_t __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_9()
{
  return -[objc_class invokeSuccessFeedback](+[LAUIPKGlyphWrapper _loadClassFromString:](LAUIPKGlyphWrapper, "_loadClassFromString:", CFSTR("PKGlyphView")), "invokeSuccessFeedback");
}

+ (void)_loadPKUI
{
  if (_loadPKUI_onceToken != -1)
    dispatch_once(&_loadPKUI_onceToken, &__block_literal_global_12);
  return (void *)_loadPKUI_libPKUI;
}

void *__31__LAUIPKGlyphWrapper__loadPKUI__block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PassKitUIFoundation.framework/PassKitUIFoundation", 1);
  _loadPKUI_libPKUI = (uint64_t)result;
  return result;
}

+ (Class)_loadClassFromString:(id)a3
{
  NSString *v3;
  Class v4;
  objc_class *v5;

  v3 = (NSString *)a3;
  v4 = +[LAUIPKGlyphWrapper _loadPKUI](LAUIPKGlyphWrapper, "_loadPKUI");
  if (v4)
    v4 = NSClassFromString(v3);
  v5 = v4;

  return v5;
}

- (void)setGrayedOut:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;

  v3 = a3;
  LA_LOG_LAUIPKGlyphWrapper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[LAUIPKGlyphWrapper setGrayedOut:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

  if (v3)
    v12 = 0.5;
  else
    v12 = 1.0;
  -[LAUIPKGlyphWrapper glyphView](self, "glyphView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v12);

  self->_grayedOut = v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_hidden = a3;
  -[LAUIPKGlyphWrapper glyphView](self, "glyphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[LAUIPKGlyphWrapper idleTouchID](self, "idleTouchID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

}

- (UIView)view
{
  return self->_view;
}

- (BOOL)fastAnimations
{
  return self->_fastAnimations;
}

- (void)setFastAnimations:(BOOL)a3
{
  self->_fastAnimations = a3;
}

- (BOOL)grayedOut
{
  return self->_grayedOut;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (GlyphMethods)glyphView
{
  return self->_glyphView;
}

- (GlyphMethods)idleTouchID
{
  return self->_idleTouchID;
}

- (OS_dispatch_queue)glyphQueue
{
  return self->_glyphQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphQueue, 0);
  objc_storeStrong((id *)&self->_idleTouchID, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

+ (void)glyphWithStyle:(int)a1 frame:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_209E00000, a2, OS_LOG_TYPE_ERROR, "Unhandled style: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned __int8 *)(a1 + 65);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_209E00000, a2, OS_LOG_TYPE_DEBUG, "setting glyph state: %d full animation: %d", (uint8_t *)v4, 0xEu);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209E00000, a2, a3, "glyph state: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209E00000, a2, a3, "animation complete for state: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setGrayedOut:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209E00000, a2, a3, "grayedOut: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
