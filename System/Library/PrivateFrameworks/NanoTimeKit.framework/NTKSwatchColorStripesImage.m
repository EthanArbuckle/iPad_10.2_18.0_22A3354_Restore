@implementation NTKSwatchColorStripesImage

void __NTKSwatchColorStripesImage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGContext *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (CGContext *)objc_msgSend(v3, "CGContext");
  CGContextTranslateCTM(v13, v10 * 0.5, v12 * 0.5);
  CGContextRotateCTM(v13, *(CGFloat *)(a1 + 40));
  CGContextTranslateCTM(v13, -(v10 * 0.5), -(v12 * 0.5));
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  CGContextAddEllipseInRect(v13, v26);
  CGContextClip(v13);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = *(id *)(a1 + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    v18 = 0.0;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19), "setFill", (_QWORD)v20);
        v27.size.height = *(CGFloat *)(a1 + 48);
        v27.origin.x = 0.0;
        v27.origin.y = v18;
        v27.size.width = v10;
        CGContextFillRect(v13, v27);
        v18 = v18 + *(double *)(a1 + 48);
        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

@end
