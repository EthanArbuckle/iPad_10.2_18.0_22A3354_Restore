@implementation CKResizableBalloonImage

void __CKResizableBalloonImage_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CKResizableBalloonImage_sResizableBalloonImages;
  CKResizableBalloonImage_sResizableBalloonImages = v1;

}

void __CKResizableBalloonImage_block_invoke_75(uint64_t a1, void *a2)
{
  CGContext *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _OWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  CGRect v23;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 74) == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 34) = 1;
    v5 = *(void **)(a1 + 32);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __CKResizableBalloonImage_block_invoke_2;
    v22[3] = &unk_1E2758198;
    v22[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "imageWithActions:", v22);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    CGContextClearRect(v3, *(CGRect *)(a1 + 152));
  }
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __CKResizableBalloonImage_block_invoke_3;
  v19[3] = &unk_1E274A4E8;
  v9 = *(void **)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v9, "imageWithActions:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextClearRect(v3, *(CGRect *)(a1 + 152));
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*(_BYTE *)(a1 + 144))
  {
    v13 = *(double *)(a1 + 184);
    v14 = *(double *)(a1 + 192);
    v15 = *(_OWORD *)(a1 + 120);
    v18[2] = *(_OWORD *)(a1 + 104);
    v18[3] = v15;
    v18[4] = *(_OWORD *)(a1 + 136);
    v16 = *(_OWORD *)(a1 + 88);
    v18[0] = *(_OWORD *)(a1 + 72);
    v18[1] = v16;
    CKResolvedBackgroundColorForBalloonDescriptor((uint64_t)v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFill");
    v23.origin.x = v11;
    v23.origin.y = v12;
    v23.size.width = v13;
    v23.size.height = v14;
    UIRectFill(v23);

  }
  objc_msgSend(v10, "drawAtPoint:", v11, v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "drawAtPoint:", v11, v12);

}

void __CKResizableBalloonImage_block_invoke_2(uint64_t a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  id v6;
  __int128 v7[5];

  v2 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = v2[5];
  v7[2] = v2[4];
  v7[3] = v3;
  v7[4] = v2[6];
  v4 = v2[3];
  v7[0] = v2[2];
  v7[1] = v4;
  CKResizableBalloonMask(v7);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "ck_colorWithCKColor:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKDrawColoredImageOnCurrentImageContext(v6, v5);

}

void __CKResizableBalloonImage_block_invoke_3(uint64_t a1)
{
  CKDrawColoredImageOnCurrentImageContext(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
