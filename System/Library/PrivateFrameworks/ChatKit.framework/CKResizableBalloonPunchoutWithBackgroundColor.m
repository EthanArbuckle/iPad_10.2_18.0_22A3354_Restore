@implementation CKResizableBalloonPunchoutWithBackgroundColor

void __CKResizableBalloonPunchoutWithBackgroundColor_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CKResizableBalloonPunchoutWithBackgroundColor_resizableBalloonMasks;
  CKResizableBalloonPunchoutWithBackgroundColor_resizableBalloonMasks = v1;

}

void __CKResizableBalloonPunchoutWithBackgroundColor_block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int16 v32;
  char v33;
  _BYTE v34[13];
  char v35;
  _BYTE v36[7];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  char v42;
  _BYTE v43[7];
  _BYTE v44[7];
  __int128 v45;
  _DWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v31 = *(id *)(a1 + 32);
  objc_msgSend(v31, "set");
  UIRectFill(*(CGRect *)(a1 + 48));
  v2 = *(double *)(a1 + 80);
  v3 = *(double *)(a1 + 88);
  v4 = *(double *)(a1 + 48) + v3;
  v5 = *(double *)(a1 + 56) + v2;
  v6 = *(double *)(a1 + 64) - (v3 + *(double *)(a1 + 104));
  v7 = *(double *)(a1 + 72) - (v2 + *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 23, v4, v5, v6, v7, 1.0);
  v8 = *(_QWORD *)(a1 + 120);
  if ((~v8 & 0xF) != 0)
  {
    v9 = ~(_BYTE)v8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "balloonMaskTailSizeForTailShape:", *(char *)(a1 + 113));
    v12 = v6 - v11;

    CKRectFillCornersUsingBlendMode(v9, kCGBlendModeDestinationOut, v4, v5, v12, v7);
  }
  else if (*(_BYTE *)(a1 + 114) == 1)
  {
    v15 = *(_WORD *)(a1 + 192);
    v13 = a1 + 192;
    v14 = v15;
    v47[0] = *(_QWORD *)(v13 + 3);
    *(_QWORD *)((char *)v47 + 5) = *(_QWORD *)(v13 + 8);
    v46[0] = *(_DWORD *)(v13 + 17);
    *(_DWORD *)((char *)v46 + 3) = *(_DWORD *)(v13 + 20);
    v16 = *(_QWORD *)(v13 + 24);
    v17 = *(_QWORD *)(v13 + 32);
    v18 = *(_QWORD *)(v13 + 40);
    v19 = *(_QWORD *)(v13 + 48);
    v45 = *(_OWORD *)(v13 + 56);
    v20 = *(_DWORD *)(v13 + 73);
    *(_DWORD *)&v44[3] = *(_DWORD *)(v13 + 76);
    *(_DWORD *)v44 = v20;
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isScheduledMessagesCoreEnabled");

    if ((v22 & 1) == 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "theme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unfilledBalloonColorForColorType:", 0xFFFFFFFFLL);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ckColor");
      v16 = v26;
      v17 = v27;
      v18 = v28;
      v19 = v29;

    }
    v32 = v14;
    v33 = 1;
    *(_QWORD *)v34 = v47[0];
    *(_QWORD *)&v34[5] = *(_QWORD *)((char *)v47 + 5);
    v35 = -1;
    *(_DWORD *)v36 = v46[0];
    *(_DWORD *)&v36[3] = *(_DWORD *)((char *)v46 + 3);
    v37 = v16;
    v38 = v17;
    v39 = v18;
    v40 = v19;
    v41 = v45;
    v42 = 0;
    *(_DWORD *)v43 = *(_DWORD *)v44;
    *(_DWORD *)&v43[3] = *(_DWORD *)&v44[3];
    CKResizableBalloonImage((uint64_t)&v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "drawInRect:blendMode:alpha:", 0, v4, v5, v6, v7, 1.0);

  }
}

@end
