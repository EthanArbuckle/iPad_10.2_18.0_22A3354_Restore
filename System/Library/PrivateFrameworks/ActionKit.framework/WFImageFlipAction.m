@implementation WFImageFlipAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  v4 = a3;
  -[WFImageFlipAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImageFlipDirection"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Horizontal")) ^ 1;
  v7 = objc_opt_class();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B3570;
  v8[4] = self;
  v8[5] = v6;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v7, v8);

}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &__block_descriptor_40_e43_v24__0__WFContentItem_8___v_____NSError__16l;
    v8 = *(_QWORD *)(a1 + 32);
    v10[4] = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_5;
    v9[3] = &unk_24F8BAFA8;
    v9[4] = v8;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v10, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_24F8B4930;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v8, 0);

}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, id a3, double a4, double a5, CGFloat a6, CGFloat a7)
{
  id v11;
  CGContext *v12;
  CGContext *v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v11 = objc_retainAutorelease(a3);
  v20 = a2;
  v12 = (CGContext *)objc_msgSend(v11, "CGContext");
  v13 = v12;
  if (*(_QWORD *)(a1 + 32))
  {
    CGContextTranslateCTM(v12, 0.0, a7);
    v14 = 1.0;
    v15 = -1.0;
  }
  else
  {
    CGContextTranslateCTM(v12, a6, 0.0);
    v14 = -1.0;
    v15 = 1.0;
  }
  CGContextScaleCTM(v13, v14, v15);
  v16 = *MEMORY[0x24BDBEFB0];
  v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v20, "sizeInPoints");
  objc_msgSend(v20, "drawInContext:inRect:", v11, v16, v17, v18, v19);

}

@end
