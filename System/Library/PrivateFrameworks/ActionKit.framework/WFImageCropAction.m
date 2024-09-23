@implementation WFImageCropAction

+ (id)imageByCroppingImage:(id)a3 toRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  int v9;
  double v10;
  double v11;
  CGAffineTransform *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGImage *v22;
  CGImage *v23;
  void *v24;
  double v25;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  memset(&v33, 0, sizeof(v33));
  v9 = objc_msgSend(v8, "orientation");
  switch(v9)
  {
    case 3:
      CGAffineTransformMakeRotation(&v30, -3.14159265);
      objc_msgSend(v8, "sizeInPoints");
      v15 = -v14;
      objc_msgSend(v8, "sizeInPoints");
      v11 = -v16;
      v12 = &v30;
      v13 = v15;
      break;
    case 6:
      CGAffineTransformMakeRotation(&v31, -1.57079633);
      objc_msgSend(v8, "sizeInPoints");
      v13 = -v17;
      v12 = &v31;
      v11 = 0.0;
      break;
    case 8:
      CGAffineTransformMakeRotation(&v32, 1.57079633);
      objc_msgSend(v8, "sizeInPoints");
      v11 = -v10;
      v12 = &v32;
      v13 = 0.0;
      break;
    default:
      v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v33.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v33.c = v18;
      *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      goto LABEL_9;
  }
  CGAffineTransformTranslate(&v33, v12, v13, v11);
LABEL_9:
  objc_msgSend(v8, "scale");
  v20 = v19;
  objc_msgSend(v8, "scale");
  v28 = v33;
  CGAffineTransformScale(&v29, &v28, v20, v21);
  v33 = v29;
  v22 = (CGImage *)objc_msgSend(v8, "CGImage");
  v29 = v33;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectApplyAffineTransform(v34, &v29);
  v23 = CGImageCreateWithImageInRect(v22, v35);
  v24 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(v8, "scale");
  objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v8, "orientation"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v23);

  return v26;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  float v19;
  double v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCropPosition"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCropWidth"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = fmax(v10, 0.0);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCropHeight"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = fmax(v13, 0.0);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCropX"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = fmax(v16, 0.0);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCropY"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = fmax(v19, 0.0);

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_2;
    v24[3] = &unk_24F8B32A8;
    v27 = v11;
    v28 = v14;
    v29 = v17;
    v30 = v20;
    v21 = *(_QWORD *)(a1 + 32);
    v25 = v8;
    v26 = v21;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_6;
    v23[3] = &unk_24F8BAFA8;
    v23[4] = v21;
    v22 = v8;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v24, v23);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_3;
  v12[3] = &unk_24F8B3280;
  v16 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 48);
  v18 = v8;
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v9;
  v15 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v10, "getFileRepresentation:forType:", v12, 0);

}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    if (!objc_msgSend(a1[4], "isEqualToString:", CFSTR("Center"))
      && !objc_msgSend(a1[4], "isEqualToString:", CFSTR("Top Right"))
      && !objc_msgSend(a1[4], "isEqualToString:", CFSTR("Bottom Left"))
      && !objc_msgSend(a1[4], "isEqualToString:", CFSTR("Bottom Right")))
    {
      objc_msgSend(a1[4], "isEqualToString:", CFSTR("Custom"));
    }
    v5 = a1[7];
    v4 = a1[6];
    WFAsyncTransformedImageFromImage();

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }

}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_4(double *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;

  v13 = a3;
  v14 = a2;
  objc_msgSend((id)objc_opt_class(), "imageByCroppingImage:toRect:", v14, a1[5], a1[6], a1[7], a1[8]);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "drawInContext:inRect:", v13, a4, a5, a6, a7);
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE19450];
    v8 = *(void **)(a1 + 32);
    v9 = a3;
    objc_msgSend(v8, "attributionSet");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWithFile:attributionSet:", v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v9);

  }
  else
  {
    v12 = *(void (**)(uint64_t, _QWORD, id))(v6 + 16);
    v10 = a3;
    v12(v6, 0, v10);
  }

}

@end
