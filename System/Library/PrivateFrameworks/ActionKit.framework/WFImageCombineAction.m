@implementation WFImageCombineAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  _QWORD *v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;

  v4 = a3;
  -[WFImageCombineAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImageCombineMode"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Horizontally"));

  -[WFImageCombineAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImageCombineMode"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("In a Grid"));

  -[WFImageCombineAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImageCombineMode"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Vertically"));

  -[WFImageCombineAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImageCombineSpacing"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_23402, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfItems");

  objc_msgSend(v4, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_121, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfItems");

  v18 = (_QWORD *)MEMORY[0x24BDF8438];
  if (v15 < v17)
    v18 = (_QWORD *)MEMORY[0x24BDF84F8];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8 | v6;
  v21 = objc_opt_class();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_3;
  v23[3] = &unk_24F8B4DF0;
  v26 = v8;
  v27 = v20;
  v25 = v13;
  v28 = v10;
  v23[4] = self;
  v24 = v19;
  v22 = v19;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v21, v23);

}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _BOOL4 v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  int v54;
  int v55;
  void *v56;
  CGColorSpace *DeviceRGB;
  CGContext *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  size_t v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint64_t v70;
  CGContext *v71;
  void *v72;
  unint64_t v73;
  double v74;
  double v75;
  size_t v76;
  CGColorSpace *v77;
  int v78;
  _QWORD v79[11];
  char v80;
  __int16 v81;
  _QWORD v82[4];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _QWORD v89[2];
  _QWORD v90[5];

  v90[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v65 = a3;
  v66 = a4;
  if (objc_msgSend(v7, "numberOfItems"))
  {
    v8 = objc_msgSend(v7, "numberOfItems");
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v7, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    v12 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v13 = v11;
    v14 = *MEMORY[0x24BDBF148];
    v15 = v11;
    v16 = *MEMORY[0x24BDBF148];
    if (v10)
    {
      v17 = *(_QWORD *)v85;
      v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
      v14 = *MEMORY[0x24BDBF148];
      v15 = v13;
      v16 = *MEMORY[0x24BDBF148];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v85 != v17)
            objc_enumerationMutation(v9);
          v19 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          if (*(_BYTE *)(a1 + 56))
          {
            v20 = v15 == v11 && v16 == v12;
            objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "size");
            if (v20)
            {
              v15 = v22;
              v16 = v21;
            }
            else
            {
              if (v16 >= v21)
                v16 = v21;
              objc_msgSend(v19, "size");
              if (v15 >= v27)
                v15 = v27;
            }
          }
          else
          {
            v23 = *(_BYTE *)(a1 + 57) == 0;
            objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "size");
            v25 = v24;
            if (v23)
            {
              objc_msgSend(v19, "size");
              if (v13 == 0.0)
                v29 = 0.0;
              else
                v29 = *(double *)(a1 + 48);
              v14 = fmax(v14, v25);
              v13 = v13 + v28 + v29;
            }
            else
            {
              if (v14 == 0.0)
                v26 = 0.0;
              else
                v26 = *(double *)(a1 + 48);
              objc_msgSend(v19, "size");
              v14 = v14 + v25 + v26;
              v13 = fmax(v13, v30);
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      }
      while (v10);
    }

    if (*(_BYTE *)(a1 + 56))
    {
      v31 = *(_BYTE *)(a1 + 57) == 0;
      v32 = objc_msgSend(v7, "numberOfItems");
      v33 = v32;
      v34 = vcvtpd_u64_f64(sqrt((double)v8));
      if (v31)
      {
        v45 = objc_msgSend(v7, "numberOfItems");
        v37 = ceil((double)v33 / (double)v34);
        if (v45 >= v34)
          v46 = v34;
        else
          v46 = v45;
        v38 = (double)v46;
      }
      else
      {
        if (v32 >= v34)
          v35 = v34;
        else
          v35 = v32;
        v36 = objc_msgSend(v7, "numberOfItems");
        v37 = (double)v35;
        v38 = ceil((double)v36 / (double)v34);
      }
      v47 = *(double *)(a1 + 48);
      v14 = -(v47 - v37 * (v16 + v47));
      v13 = -(v47 - v38 * (v15 + v47));
    }
    if (v14 == v12 && v13 == v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }
    else
    {
      v48 = (void *)MEMORY[0x24BE19628];
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringByAppendingPathExtension:", CFSTR("raw"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "createTemporaryFileWithFilename:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = objc_retainAutorelease(v52);
      v54 = open((const char *)objc_msgSend(v53, "fileSystemRepresentation"), 514, 420);
      v55 = v54;
      if (v54 == -1
        || ftruncate(v54, (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0))) == -1
        || (v56 = mmap(0, (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0)), 3, 1, v55, 0),
            v56 == (void *)-1))
      {
        v62 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "finishRunningWithError:", v63);

      }
      else
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v64 = vcvtd_n_u64_f64(v14, 2uLL);
        v58 = CGBitmapContextCreate(v56, (unint64_t)v14, (unint64_t)v13, 8uLL, v64, DeviceRGB, 1u);
        CGContextTranslateCTM(v58, 0.0, v13);
        CGContextScaleCTM(v58, 1.0, -1.0);
        v82[0] = 0;
        v82[1] = v82;
        v82[2] = 0x3010000000;
        v82[3] = &unk_22D71EEA1;
        v83 = *MEMORY[0x24BDBEFB0];
        objc_msgSend(v7, "items");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x24BDAC760];
        v79[1] = 3221225472;
        v79[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_4;
        v79[3] = &unk_24F8B4DA0;
        v80 = *(_BYTE *)(a1 + 56);
        v79[4] = v82;
        v79[5] = v58;
        *(double *)&v79[6] = v16;
        *(double *)&v79[7] = v15;
        v81 = *(_WORD *)(a1 + 57);
        v79[8] = *(_QWORD *)(a1 + 48);
        *(double *)&v79[9] = v14;
        *(double *)&v79[10] = v13;
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_7;
        v67[3] = &unk_24F8B4DC8;
        v71 = v58;
        v72 = v56;
        v73 = (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0));
        v74 = v14;
        v75 = v13;
        v76 = v64;
        v77 = DeviceRGB;
        v68 = *(id *)(a1 + 40);
        v78 = v55;
        v60 = v53;
        v61 = *(_QWORD *)(a1 + 32);
        v69 = v60;
        v70 = v61;
        objc_msgSend(v59, "if_enumerateAsynchronouslyInSequence:completionHandler:", v79, v67);

        _Block_object_dispose(v82, 8);
      }

    }
  }
  else
  {
    v39 = *(void **)(a1 + 32);
    v40 = (void *)MEMORY[0x24BDD1540];
    v89[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Cannot run Combine Images"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v41;
    v89[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No images were provided to combine."));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "finishRunningWithError:", v44);

  }
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  __int128 v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  char v16;
  __int16 v17;

  v6 = a4;
  v10[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_5;
  v10[3] = &unk_24F8B4D78;
  v16 = *(_BYTE *)(a1 + 88);
  v13 = v7;
  v17 = *(_WORD *)(a1 + 89);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 72);
  v11 = v6;
  v8 = v6;
  v9 = a2;
  objc_msgSend(v9, "getObjectRepresentations:forClass:", v10, objc_opt_class());

}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  CGContext *v4;
  id v5;
  CGDataProvider *v6;
  CGImage *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  CGImageDestination *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFURL *url;

  v4 = *(CGContext **)(a1 + 56);
  v5 = a3;
  CGContextRelease(v4);
  v6 = CGDataProviderCreateWithData(0, *(const void **)(a1 + 64), *(_QWORD *)(a1 + 72), 0);
  v7 = CGImageCreate((unint64_t)*(double *)(a1 + 80), (unint64_t)*(double *)(a1 + 88), 8uLL, 0x20uLL, *(_QWORD *)(a1 + 96), *(CGColorSpaceRef *)(a1 + 104), 1u, v6, 0, 0, kCGRenderingIntentDefault);
  v8 = (void *)MEMORY[0x24BE19628];
  objc_msgSend(MEMORY[0x24BE194F8], "proposedFilenameForFile:ofType:", 0, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proposedTemporaryFileURLForFilename:", v9);
  url = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "utType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = CGImageDestinationCreateWithURL(url, v11, 1uLL, 0);

  CGImageDestinationAddImage(v12, v7, 0);
  CGImageDestinationFinalize(v12);
  if (v12)
    CFRelease(v12);
  CGDataProviderRelease(v6);
  CGImageRelease(v7);
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 104));
  munmap(*(void **)(a1 + 64), *(_QWORD *)(a1 + 72));
  close(*(_DWORD *)(a1 + 112));
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 48), "output");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:ofType:", url, 1, *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addFile:", v15);

  objc_msgSend(*(id *)(a1 + 48), "finishRunningWithError:", v5);
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  __int128 v6;
  id v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  __int16 v14;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_6;
  v8[3] = &unk_24F8B4D50;
  v13 = *(_BYTE *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v6;
  v14 = *(_WORD *)(a1 + 97);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_OWORD *)(a1 + 80);
  v7 = a4;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double *v21;
  uint64_t v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = a2;
  objc_msgSend(v3, "sizeInPixels");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1378]), "initWithCGContext:scale:", *(_QWORD *)(a1 + 40), 1.0);
  if (*(_BYTE *)(a1 + 88))
  {
    CGContextSaveGState(*(CGContextRef *)(a1 + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(double *)(v9 + 32);
    v11 = *(double *)(v9 + 40);
    v12 = *(double *)(a1 + 48);
    v13 = *(double *)(a1 + 56);
    v14 = fmax(v13 / v7, v12 / v5);
    CGAffineTransformMakeScale(&v23, v14, v14);
    v15 = v7 * v23.c + v23.a * v5;
    v16 = v7 * v23.d + v23.b * v5;
    v24.origin.x = v10;
    v24.origin.y = v11;
    v24.size.width = v12;
    v24.size.height = v13;
    CGContextClipToRect(*(CGContextRef *)(a1 + 40), v24);
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = v12;
    v25.size.height = v13;
    v26 = CGRectInset(v25, (v15 - *(double *)(a1 + 48)) * -0.5, (v16 - *(double *)(a1 + 56)) * -0.5);
    objc_msgSend(v3, "drawInContext:inRect:", v8, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
    CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
    v17 = *(double *)(a1 + 64);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(a1 + 89))
    {
      *(double *)(v18 + 32) = *(double *)(a1 + 48) + v17 + *(double *)(v18 + 32);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (*(double *)(v19 + 32) >= *(double *)(a1 + 72))
      {
        *(_QWORD *)(v19 + 32) = 0;
        v20 = *(double *)(a1 + 56) + *(double *)(a1 + 64);
LABEL_9:
        v21 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_12:
        *v21 = v20 + *v21;
      }
    }
    else
    {
      *(double *)(v18 + 40) = *(double *)(a1 + 56) + v17 + *(double *)(v18 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (*(double *)(v22 + 40) >= *(double *)(a1 + 80))
      {
        *(_QWORD *)(v22 + 40) = 0;
        v20 = *(double *)(a1 + 48) + *(double *)(a1 + 64);
        v21 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
        goto LABEL_12;
      }
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 89))
    {
      objc_msgSend(v3, "drawInContext:inRect:", v8, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5, v7);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v5
                                                                  + *(double *)(a1 + 64)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 32);
    }
    if (*(_BYTE *)(a1 + 90))
    {
      objc_msgSend(v3, "drawInContext:inRect:", v8, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5, v7);
      v20 = v7 + *(double *)(a1 + 64);
      goto LABEL_9;
    }
  }

}

uint64_t __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "preferredFileType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToUTType:", *MEMORY[0x24BDF84F8]);

  return v3;
}

uint64_t __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "preferredFileType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToUTType:", *MEMORY[0x24BDF8438]);

  return v3;
}

@end
