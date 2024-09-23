@implementation QLSlideTransitionDriver

- (void)animateTransition
{
  void *v3;
  void *v4;
  CGAffineTransform v5;

  -[QLTransitionDriver gestureTracker](self, "gestureTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "trackedTransform"), CGAffineTransformIsIdentity(&v5))
    || -[QLTransitionDriver presenting](self, "presenting"))
  {
    -[QLSlideTransitionDriver _animateTransition](self, "_animateTransition");
  }
  else
  {
    -[QLSlideTransitionDriver _animateTransitionUserSlideDismissal](self, "_animateTransitionUserSlideDismissal");
  }

}

- (void)_animateTransition
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat Height;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  memset(&v20, 0, sizeof(v20));
  if (-[QLTransitionDriver presenting](self, "presenting"))
  {
    v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v20.c = v3;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  else
  {
    -[QLTransitionDriver destinationView](self, "destinationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "transform");
    else
      memset(&v20, 0, sizeof(v20));

  }
  v19 = v20;
  if (-[QLTransitionDriver presenting](self, "presenting"))
  {
    -[QLTransitionDriver transitionContainer](self, "transitionContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    Height = CGRectGetHeight(v21);
    v17 = v20;
    CGAffineTransformTranslate(&v18, &v17, 0.0, Height);
    v20 = v18;
  }
  else
  {
    -[QLTransitionDriver transitionContainer](self, "transitionContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = CGRectGetHeight(v22);
    -[QLTransitionDriver destinationView](self, "destinationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v18 = v19;
    CGAffineTransformTranslate(&v19, &v18, 0.0, v8 - v10);

  }
  v16 = v20;
  -[QLTransitionDriver destinationView](self, "destinationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  objc_msgSend(v11, "setTransform:", &v15);

  -[QLTransitionDriver presenting](self, "presenting");
  v12 = (void *)MEMORY[0x24BEBDB00];
  -[QLTransitionDriver duration](self, "duration");
  v13[1] = 3221225472;
  v14 = v19;
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __45__QLSlideTransitionDriver__animateTransition__block_invoke;
  v13[3] = &unk_24C726FD0;
  v13[4] = self;
  objc_msgSend(v12, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v13, 0);
}

uint64_t __45__QLSlideTransitionDriver__animateTransition__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CAFrameRateRange v9;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__QLSlideTransitionDriver__animateTransition__block_invoke_2;
  v5[3] = &unk_24C726FD0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097155, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

void __45__QLSlideTransitionDriver__animateTransition__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "destinationView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

- (void)_animateTransitionUserSlideDismissal
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  -[QLTransitionDriver gestureTracker](self, "gestureTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackedVelocity");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v13 = v11 * 1.5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v17 = v15 * 1.5;

  if (v5 >= v13)
    v18 = v13;
  else
    v18 = v5;
  if (v18 >= -(v12 * 1.5))
    v19 = v18;
  else
    v19 = -(v12 * 1.5);
  if (v7 >= v17)
    v20 = v17;
  else
    v20 = v7;
  memset(&v37.c, 0, 32);
  if (v20 >= -(v16 * 1.5))
    v21 = v20;
  else
    v21 = -(v16 * 1.5);
  *(_OWORD *)&v37.a = 0uLL;
  -[QLTransitionDriver destinationView](self, "destinationView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    objc_msgSend(v22, "transform");
  else
    memset(&v37, 0, sizeof(v37));

  v36 = v37;
  -[QLTransitionDriver duration](self, "duration");
  v25 = v19 * v24;
  -[QLTransitionDriver duration](self, "duration");
  v35 = v36;
  CGAffineTransformTranslate(&v36, &v35, v25, v21 * v26);
  v34 = v36;
  CGAffineTransformScale(&v35, &v34, 0.3, 0.3);
  v36 = v35;
  if (v9 != 0.0)
  {
    -[QLTransitionDriver duration](self, "duration");
    v34 = v36;
    CGAffineTransformRotate(&v35, &v34, v9 * v27 + v9 * v27);
    v36 = v35;
  }
  v33 = v37;
  -[QLTransitionDriver destinationView](self, "destinationView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v33;
  objc_msgSend(v28, "setTransform:", &v32);

  v29 = (void *)MEMORY[0x24BEBDB00];
  -[QLTransitionDriver duration](self, "duration");
  v30[1] = 3221225472;
  v31 = v36;
  v30[0] = MEMORY[0x24BDAC760];
  v30[2] = __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke;
  v30[3] = &unk_24C726FD0;
  v30[4] = self;
  objc_msgSend(v29, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, v30, 0);
}

uint64_t __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CAFrameRateRange v9;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke_2;
  v5[3] = &unk_24C726FD0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097155, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

void __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "destinationView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

@end
