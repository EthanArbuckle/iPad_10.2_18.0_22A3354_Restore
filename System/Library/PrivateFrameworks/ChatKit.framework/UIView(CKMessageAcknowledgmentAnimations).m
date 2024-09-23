@implementation UIView(CKMessageAcknowledgmentAnimations)

- (void)messageAcknowledgmentBounceView:()CKMessageAcknowledgmentAnimations
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "transform");
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 0.95, 0.95);
  v13 = v14;
  objc_msgSend(a1, "setTransform:", &v13);
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v9[0] = MEMORY[0x1E0C809B0];
  v10 = v15;
  v11 = v16;
  v9[1] = 3221225472;
  v9[2] = __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke;
  v9[3] = &unk_1E274BD00;
  v9[4] = a1;
  v12 = v17;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentBounceView___block_invoke_2;
  v7[3] = &unk_1E274C308;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v9, v7, 0.5, 0.0, 1.0, -100.0);

}

- (void)messageAcknowledgmentShrinkViewToPoint:()CKMessageAcknowledgmentAnimations completion:
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  double Height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CATransform3D v26;
  CATransform3D v27;
  _QWORD v28[4];
  id v29;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  CATransform3D v35;
  CGRect v36;
  CGRect v37;

  v8 = a5;
  objc_msgSend(a1, "frame");
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "frame");
  Width = CGRectGetWidth(v36);
  objc_msgSend(a1, "frame");
  Height = CGRectGetHeight(v37);
  memset(&v35, 0, sizeof(v35));
  objc_msgSend(a1, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "transform");
  else
    memset(&v35, 0, sizeof(v35));

  memset(&v34, 0, sizeof(v34));
  CATransform3DMakeScale(&v34, 0.0, 0.0, 1.0);
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeTranslation(&v33, a2 - (v10 + Width * 0.5), a3 - (v12 + Height * 0.5), 0.0);
  memset(&v32, 0, sizeof(v32));
  a = v34;
  b = v33;
  CATransform3DConcat(&v32, &a, &b);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  a = v35;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v18);

  a = v32;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v19);

  objc_msgSend(v17, "setDuration:", 0.300000012);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v20 = (void *)MEMORY[0x1E0CD28B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __95__UIView_CKMessageAcknowledgmentAnimations__messageAcknowledgmentShrinkViewToPoint_completion___block_invoke;
  v28[3] = &unk_1E274AED0;
  v29 = v8;
  v21 = v8;
  objc_msgSend(v20, "setCompletionBlock:", v28);
  objc_msgSend(a1, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v17, CFSTR("transform"));

  v23 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAnimationTimingFunction:", v24);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.300000012);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v27 = v32;
  objc_msgSend(a1, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v27;
  objc_msgSend(v25, "setTransform:", &v26);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
