@implementation FadeLayerThruBlack

void ___FadeLayerThruBlack_block_invoke(uint64_t a1)
{
  double v2;
  int v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend((Class)getCATransactionClass[0](), "begin");
  objc_msgSend((Class)getCATransactionClass[0](), "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  if (CGColorGetBlack_sOnce != -1)
    dispatch_once_f(&CGColorGetBlack_sOnce, &CGColorGetBlack_sContext, (dispatch_function_t)_CGColorCreateWithRGB);
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", CGColorGetBlack_sColor);
  LODWORD(v2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v2);
  v3 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "zPosition");
  v5 = -1.0;
  if (!v3)
    v5 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setZPosition:", v4 + v5);
  objc_msgSend(*(id *)(a1 + 40), "superlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", *(_QWORD *)(a1 + 32));

  objc_msgSend((Class)getCATransactionClass[0](), "commit");
  LODWORD(v7) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v7);
  objc_msgSend((Class)getCABasicAnimationClass[0](), "animationWithKeyPath:", CFSTR("opacity"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v9);

  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v11);

  v12 = (Class)getCAMediaTimingFunctionClass[0]();
  getkCAMediaTimingFunctionEaseOut[0]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class functionWithName:](v12, "functionWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v14);

  objc_msgSend(v15, "setDuration:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", v15, CFSTR("fadeToBlack"));

}

void ___FadeLayerThruBlack_block_invoke_2(uint64_t a1, double a2)
{
  id *v3;
  float v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  Class v11;
  void *v12;
  void *v13;
  CAAnimationDelegateBlockHelper *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  if (*(_BYTE *)(a1 + 72))
  {
    v3 = (id *)(a1 + 32);
    v4 = 1.0;
  }
  else
  {
    objc_msgSend((Class)getCATransactionClass[0](), "begin");
    objc_msgSend((Class)getCATransactionClass[0](), "setDisableActions:", 1);
    v4 = 0.0;
    LODWORD(v5) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v5);
    objc_msgSend((Class)getCATransactionClass[0](), "commit");
    v3 = (id *)(a1 + 40);
  }
  *(float *)&a2 = v4;
  objc_msgSend(*v3, "setOpacity:", a2);
  objc_msgSend((Class)getCABasicAnimationClass[0](), "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72))
    *(float *)&v7 = 0.0;
  else
    *(float *)&v7 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v8);

  if (*(_BYTE *)(a1 + 72))
    *(float *)&v9 = 1.0;
  else
    *(float *)&v9 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v10);

  v11 = (Class)getCAMediaTimingFunctionClass[0]();
  getkCAMediaTimingFunctionEaseIn[0]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class functionWithName:](v11, "functionWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v13);

  objc_msgSend(v6, "setDuration:", *(double *)(a1 + 64));
  v14 = objc_alloc_init(CAAnimationDelegateBlockHelper);
  objc_msgSend(v6, "setDelegate:", v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___FadeLayerThruBlack_block_invoke_3;
  v17[3] = &unk_1E25DBBF8;
  v18 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 48);
  -[CAAnimationDelegateBlockHelper setAnimationDidStopBlock:](v14, "setAnimationDidStopBlock:", v17);
  v15 = 32;
  if (*(_BYTE *)(a1 + 72))
  {
    v16 = CFSTR("fadeInTarget");
  }
  else
  {
    v15 = 40;
    v16 = CFSTR("fadeOutBlack");
  }
  objc_msgSend(*(id *)(a1 + v15), "addAnimation:forKey:", v6, v16);

}

void ___FadeLayerThruBlack_block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___FadeLayerThruBlack_block_invoke_4;
    block[3] = &unk_1E25DF300;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t ___FadeLayerThruBlack_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
