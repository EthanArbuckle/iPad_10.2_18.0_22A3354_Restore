@implementation CDRichComplicationRingMeteredView

+ (BOOL)isXL
{
  return 0;
}

- (id)customizeMeterLayerBlock
{
  void *v3;
  int v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "isXL");
  v5 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
    if (v8 == v5)
    {
      v9 = objc_msgSend(v5, "version");
      v10 = _LayoutConstants___previousCLKDeviceVersion_0;

      if (v9 == v10)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_0, v5);
  _LayoutConstants___previousCLKDeviceVersion_0 = objc_msgSend(v5, "version");

  ___LayoutConstants_block_invoke_0(v12, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  v20 = _LayoutConstants___constants;
  v21 = *(_OWORD *)&qword_254B6FDD0;
  v22 = xmmword_254B6FDE0;
  if (v4)
  {
    v20 = _LayoutConstants___constantsXL;
    v21 = xmmword_254B6FE00;
    v22 = xmmword_254B6FE10;
  }

  aBlock[1] = 3221225472;
  v17 = v20;
  v18 = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[2] = __61__CDRichComplicationRingMeteredView_customizeMeterLayerBlock__block_invoke;
  aBlock[3] = &unk_24CF21240;
  v19 = v22;
  aBlock[4] = self;
  v13 = _Block_copy(aBlock);
  v14 = _Block_copy(v13);

  return v14;
}

void __61__CDRichComplicationRingMeteredView_customizeMeterLayerBlock__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  CGPath *Mutable;
  __int128 v18;
  CGFloat v19;
  double v20;
  CGAffineTransform v21;
  CGAffineTransform m;

  v6 = *(double *)(a1 + 56);
  if (a5)
    v6 = v6 + *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 80) + a3;
  v9 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);
  v10 = v8 * -0.5;
  v11 = v6 * 0.5;
  v12 = v9 * -0.5;
  v13 = v6 * -0.5;
  v14 = v9 * 0.5;
  v15 = v8 * 0.5;
  v16 = a2;
  Mutable = CGPathCreateMutable();
  memset(&m, 0, sizeof(m));
  *(float *)&v7 = v7;
  objc_msgSend(*(id *)(a1 + 32), "rotationAngleAtProgress:", COERCE_DOUBLE((unint64_t)LODWORD(v7)));
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformRotate(&m, &v21, v19);
  CGPathMoveToPoint(Mutable, &m, 0.0, v11);
  CGPathAddArcToPoint(Mutable, &m, v10, v11, v12, v13, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v12, v13, v14, v13, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v14, v13, v15, v11, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v15, v11, v10, v11, *(CGFloat *)(a1 + 72));
  CGPathCloseSubpath(Mutable);
  objc_msgSend(v16, "setPath:", Mutable);
  CGPathRelease(Mutable);
  LODWORD(v20) = LODWORD(v7);
  objc_msgSend(*(id *)(a1 + 32), "pointAtProgress:", v20);
  objc_msgSend(v16, "setPosition:");

}

@end
