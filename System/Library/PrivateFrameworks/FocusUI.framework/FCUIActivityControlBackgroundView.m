@implementation FCUIActivityControlBackgroundView

uint64_t __72___FCUIActivityControlBackgroundView__configureHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;

  v2 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = objc_msgSend(v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 424);
  *(_QWORD *)(v4 + 424) = v3;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 424);
  if (*(_QWORD *)(v6 + 416))
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x24BDE58E8];

  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[53];
  if (v10 == v11)
  {
    objc_msgSend(v12, "_continuousCornerRadius");
    objc_msgSend(v13, "_setContinuousCornerRadius:");
  }
  else
  {
    objc_msgSend(v12, "_cornerRadius");
    objc_msgSend(v13, "_setCornerRadius:");
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v14 + 416) == 2)
  {
    objc_msgSend(*(id *)(v14 + 424), "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowPathIsBounds:", 1);
    LODWORD(v16) = 1036831949;
    objc_msgSend(v15, "setShadowOpacity:", v16);
    objc_msgSend(v15, "setShadowOffset:", 0.0, 4.0);
    objc_msgSend(v15, "setShadowRadius:", 15.0);

    v14 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v14 + 424), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAutoresizingMask:", 18);
}

@end
