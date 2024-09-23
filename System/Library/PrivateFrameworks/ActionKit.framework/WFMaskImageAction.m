@implementation WFMaskImageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (void)maskImageItems:(id)a3 usingType:(id)a4 cornerRadius:(double)a5 customMaskImage:(id)a6 customMaskImageContentAttributionSet:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke;
  v19[3] = &unk_24F8B8ED8;
  v23 = a5;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_5;
  v18[3] = &unk_24F8BAFA8;
  v18[4] = self;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  objc_msgSend(a3, "transformItemsUsingBlock:completionHandler:", v19, v18);

}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_2;
  v9[3] = &unk_24F8B8EB0;
  v14 = v6;
  v10 = *(id *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "getFileRepresentation:forType:", v9, 0);

}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    objc_msgSend(a1[4], "isEqualToString:", CFSTR("Icon"));
    objc_msgSend(v3, "wfType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF8438]) & 1) != 0
      || objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF8550]))
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v9 = a1[4];
    v10 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    v8 = a1[8];
    WFAsyncTransformedImageFromImage();

  }
  else
  {
    (*((void (**)(void))a1[8] + 2))();
  }

}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_3(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  CGContext *v14;
  const CGPath *Mutable;
  double v16;
  double v17;
  double v18;
  void *v19;
  const CGPath *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGColorSpace *DeviceGray;
  CGContext *v26;
  void *v27;
  void *v28;
  CGImage *Image;
  id v30;
  CGRect v31;
  CGRect v32;

  v30 = a2;
  v13 = objc_retainAutorelease(a3);
  v14 = (CGContext *)objc_msgSend(v13, "CGContext");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Rounded Rectangle")))
  {
    Mutable = WFCreateRoundedRectPath(a4, a5, a6, a7, *(double *)(a1 + 48));
LABEL_5:
    CGContextAddPath(v14, Mutable);
    CGContextClip(v14);
    CGPathRelease(Mutable);
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Ellipse")))
  {
    Mutable = CGPathCreateMutable();
    v31.origin.x = a4;
    v31.origin.y = a5;
    v31.size.width = a6;
    v31.size.height = a7;
    CGPathAddEllipseInRect(Mutable, 0, v31);
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Icon")))
  {
    objc_msgSend(v30, "sizeInPixels");
    v17 = (v16 - *(double *)(a1 + 56)) * 0.5;
    objc_msgSend(v30, "sizeInPixels");
    +[WFImageCropAction imageByCroppingImage:toRect:](WFImageCropAction, "imageByCroppingImage:toRect:", v30, v17, (v18 - *(double *)(a1 + 64)) * 0.5, a6, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = WFCreateRoundedRectPath(a4, a5, a6, a7, round((a6 * 0.224 + 0.02351) * 10.0) / 10.0);
    CGContextAddPath(v14, v20);
    CGContextClip(v14);
    CGPathRelease(v20);
    v30 = v19;
    objc_msgSend(v19, "drawInContext:inRect:", v13, a4, a5, a6, a7);
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Custom Image")))
  {
    objc_msgSend(*(id *)(a1 + 40), "sizeInPixels");
    v22 = v21;
    v24 = v23;
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v26 = CGBitmapContextCreate(0, (unint64_t)v22, (unint64_t)v24, 8uLL, 0, DeviceGray, 0);
    v27 = *(void **)(a1 + 40);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1378]), "initWithCGContext:scale:", v26, 1.0);
    objc_msgSend(v27, "drawInContext:inRect:", v28, 0.0, 0.0, v22, v24);

    Image = CGBitmapContextCreateImage(v26);
    CGContextRelease(v26);
    CGColorSpaceRelease(DeviceGray);
    v32.origin.x = a4;
    v32.origin.y = a5;
    v32.size.width = a6;
    v32.size.height = a7;
    CGContextClipToMask(v14, v32, Image);
  }
LABEL_6:
  objc_msgSend(v30, "drawInContext:inRect:", v13, a4, a5, a6, a7);
LABEL_7:

}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  if (a1[4])
  {
    v6 = (void *)MEMORY[0x24BE19428];
    v7 = (void *)a1[5];
    v8 = a3;
    v9 = a2;
    objc_msgSend(v7, "attributionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[4];
    v17[0] = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionSetByMergingAttributionSets:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)a1[5];
    v15 = a3;
    v16 = a2;
    objc_msgSend(v14, "attributionSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  double v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMaskType"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMaskCornerRadius"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = fmax(v11, 0.0);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFCustomMaskImage"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Custom Image")))
    {
      if (objc_msgSend(v13, "numberOfItems"))
      {
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke_2;
        v28[3] = &unk_24F8B8E60;
        v28[4] = *(_QWORD *)(a1 + 32);
        v29 = v6;
        v30 = v8;
        v32 = v12;
        v31 = v13;
        objc_msgSend(v31, "getObjectRepresentation:forClass:", v28, objc_opt_class());

        v14 = v29;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "parameterStateForKey:", CFSTR("WFCustomMaskImage"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "variable");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v15;
        if (v16)
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("The variable “%@” did not include an image to use for masking."));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "variable");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "nameIncludingPropertyName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v18, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          WFLocalizedString(CFSTR("Make sure to select a variable for the “Image Mask” option in the Mask Image action."));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BEC4270];
        v33[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("No Mask Provided"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = *MEMORY[0x24BDD0FC8];
        v34[0] = v24;
        v34[1] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 5, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v26);
        v14 = v27;
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "maskImageItems:usingType:cornerRadius:customMaskImage:customMaskImageContentAttributionSet:", v6, v8, 0, 0, v12);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  id v12;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v12 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 56), "attributionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maskImageItems:usingType:cornerRadius:customMaskImage:customMaskImageContentAttributionSet:", v8, v9, v12, v11, v10);

  }
  else
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }

}

@end
