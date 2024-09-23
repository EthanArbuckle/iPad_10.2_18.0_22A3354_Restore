@implementation WFImageRotateAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

- (void)rotateImage:(id)a3 byDegrees:(double)a4 completion:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v7 = a5;
  v8 = v7;
  if (a3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke;
    v9[3] = &unk_24F8B4930;
    v11 = a4;
    v10 = v7;
    objc_msgSend(a3, "getFileRepresentation:forType:", v9, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)rotateMovie:(id)a3 byDegrees:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__WFImageRotateAction_rotateMovie_byDegrees_completion___block_invoke;
  v14[3] = &unk_24F8B4958;
  v10 = v8;
  v16 = v10;
  v17 = a4;
  v11 = v7;
  v15 = v11;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v12 = (void *)getAVMutableMovieClass_softClass;
  v22 = getAVMutableMovieClass_softClass;
  if (!getAVMutableMovieClass_softClass)
  {
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __getAVMutableMovieClass_block_invoke;
    v18[3] = &unk_24F8BB430;
    v18[4] = &v19;
    __getAVMutableMovieClass_block_invoke((uint64_t)v18);
    v12 = (void *)v20[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v11, "getObjectRepresentation:forClass:", v14, objc_opt_class());

}

void __56__WFImageRotateAction_rotateMovie_byDegrees_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  double MidX;
  CGFloat MidY;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CGAffineTransform v36[2];
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

    return;
  }
  if (objc_msgSend(v7, "hasProtectedContent"))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 0;
LABEL_7:
    WFImageRotateError(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v14);
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v7, "availableVideoDynamicRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", &unk_24F93A550);

  if (v13)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 1;
    goto LABEL_7;
  }
  t2.a = 0.0;
  *(_QWORD *)&t2.b = &t2;
  *(_QWORD *)&t2.c = 0x2020000000;
  v15 = (_QWORD *)getAVMediaTypeVideoSymbolLoc_ptr;
  *(_QWORD *)&t2.d = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    v16 = AVFoundationLibrary_21462();
    v15 = dlsym(v16, "AVMediaTypeVideo");
    *(_QWORD *)(*(_QWORD *)&t2.b + 24) = v15;
    getAVMediaTypeVideoSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&t2, 8);
  if (v15)
  {
    objc_msgSend(v7, "tracksWithMediaType:", *v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "preferredTransform");
    else
      memset(&v36[1], 0, sizeof(CGAffineTransform));
    v18 = *(double *)(a1 + 48);
    objc_msgSend(v14, "naturalSize");
    v20 = v19;
    v22 = v21;
    v37 = v36[1];
    t2 = v36[1];
    y = 0.0;
    if (CGAffineTransformIsIdentity(&t2))
    {
      height = v22;
      width = v20;
      x = 0.0;
    }
    else
    {
      t2 = v36[1];
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = v20;
      v43.size.height = v22;
      v44 = CGRectApplyAffineTransform(v43, &t2);
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
    }
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MidX = CGRectGetMidX(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    MidY = CGRectGetMidY(v46);
    CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
    t1 = v37;
    CGAffineTransformConcat(&v37, &t1, &t2);
    CGAffineTransformMakeRotation(&v40, v18 / 180.0 * 3.14159265);
    v39 = v37;
    CGAffineTransformConcat(&t1, &v39, &v40);
    v37 = t1;
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.width = v20;
    v47.size.height = v22;
    v48 = CGRectApplyAffineTransform(v47, &t1);
    CGAffineTransformMakeTranslation(&v39, v48.size.width * 0.5, v48.size.height * 0.5);
    v38 = v37;
    CGAffineTransformConcat(&t1, &v38, &v39);
    v37 = t1;
    v36[0] = t1;
    objc_msgSend(v14, "setPreferredTransform:", v36);
    v29 = (void *)MEMORY[0x24BE19360];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attributionSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "itemWithObject:named:attributionSet:", v7, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "preferredFileType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "getFileRepresentation:forType:", *(_QWORD *)(a1 + 40), v33);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFImageRotateAction.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
}

void __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGRect v12;

  v3 = a2;
  WFMetadataRotateImage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WFImageSizeFromFile();
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x24BDBEFB0];
    v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    CGAffineTransformMakeRotation(&v11, *(double *)(a1 + 40) / 180.0 * 3.14159265);
    v12.origin.x = v9;
    v12.origin.y = v10;
    v12.size.width = v6;
    v12.size.height = v8;
    CGRectApplyAffineTransform(v12, &v11);
    WFAsyncTransformedImageFromImage();
  }

}

void __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke_2(uint64_t a1, void *a2, id a3, double a4, double a5, double a6, double a7)
{
  id v11;
  CGContext *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v11 = objc_retainAutorelease(a3);
  v20 = a2;
  v12 = (CGContext *)objc_msgSend(v11, "CGContext");
  CGContextTranslateCTM(v12, a6 * 0.5, a7 * 0.5);
  CGContextRotateCTM(v12, *(CGFloat *)(a1 + 32));
  objc_msgSend(v20, "sizeInPoints");
  v14 = v13 * -0.5;
  objc_msgSend(v20, "sizeInPoints");
  v16 = v15 * -0.5;
  objc_msgSend(v20, "sizeInPoints");
  v18 = v17;
  objc_msgSend(v20, "sizeInPoints");
  objc_msgSend(v20, "drawInContext:inRect:", v11, v14, v16, v18, v19);

}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  float v9;
  double v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  uint64_t v15;
  double v16;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageRotateAmount"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    v11 = objc_msgSend(v6, "numberOfItems");
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTotalUnitCount:", v11);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_24F8B48E8;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_24F8BAFA8;
    v13[4] = v15;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v14, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v13 = v5;
  if (!v13)
  {
    v11 = 0;
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "rotateMovie:byDegrees:completion:", v11, v6, *(double *)(a1 + 40));
    v9 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v13;
  else
    v7 = 0;
  v8 = v7;

  v9 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v8)
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 32), "rotateImage:byDegrees:completion:", v8, v6, *(double *)(a1 + 40));
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);

}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
