@implementation UIViewController(CFXAdditions)

- (void)displaySnapshot:()CFXAdditions atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:
{
  void (**v22)(_QWORD);
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a7;
  objc_msgSend(a1, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "_toWindowOrientation");

  objc_msgSend(a1, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "_fromWindowOrientation");

  objc_msgSend(a1, "counterRotationViewForSnapshot:atCenterPoint:toWindowOrientation:fromWindowOrientation:", v24, v27, v30, a2, a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "insertSubview:atIndex:", v31, a8);

  if (v22)
    v22[2](v22);
  objc_msgSend(a1, "animateCounterRotationView:fadeOut:toWindowOrientation:fromWindowOrientation:forTransitionToSize:withTransitionCoordinator:postTransitionBlock:postRemoveFromSuperviewBlock:", v31, a9, v27, v30, v33, v23, a4, a5, 0);

}

- (CFXCounterRotationView)counterRotationViewForSnapshot:()CFXAdditions atCenterPoint:toWindowOrientation:fromWindowOrientation:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFXCounterRotationView *v22;
  void *v23;
  CFXCounterRotationView *v24;
  id v25;
  void *v26;
  CFXCounterRotationView *v27;
  _QWORD v29[4];
  CFXCounterRotationView *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;

  v8 = a5;
  objc_msgSend(a1, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  UIRectGetCenter();
  v19 = v18;
  v21 = v20;
  v22 = objc_alloc_init(CFXCounterRotationView);
  -[CFXCounterRotationView setUserInteractionEnabled:](v22, "setUserInteractionEnabled:", 0);
  -[CFXCounterRotationView addSubview:](v22, "addSubview:", v8);
  v23 = (void *)MEMORY[0x24BDF6F90];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __121__UIViewController_CFXAdditions__counterRotationViewForSnapshot_atCenterPoint_toWindowOrientation_fromWindowOrientation___block_invoke;
  v29[3] = &unk_24EE57DF0;
  v24 = v22;
  v32 = v11;
  v33 = v13;
  v34 = v15;
  v35 = v17;
  v36 = v19;
  v37 = v21;
  v30 = v24;
  v31 = v8;
  v38 = a2;
  v39 = a3;
  v40 = 0;
  v25 = v8;
  objc_msgSend(v23, "performWithoutAnimation:", v29);
  v26 = v31;
  v27 = v24;

  return v27;
}

- (void)animateCounterRotationView:()CFXAdditions fadeOut:toWindowOrientation:fromWindowOrientation:forTransitionToSize:withTransitionCoordinator:postTransitionBlock:postRemoveFromSuperviewBlock:
{
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  char v32;
  _QWORD v33[4];
  id v34;
  double v35;
  double v36;
  double v37;

  v18 = a5;
  v19 = a10;
  v20 = a11;
  v21 = 0.0;
  v22 = 0.0;
  if (a7 != 1)
  {
    if (a7 == 3)
    {
      v22 = 1.57079633;
    }
    else if (a7 == 4)
    {
      v22 = -1.57079633;
    }
    else
    {
      v22 = 3.14159265;
      if (a7 != 2)
        v22 = 0.0;
    }
  }
  if (a8 != 1)
  {
    if (a8 == 3)
    {
      v21 = 1.57079633;
    }
    else if (a8 == 4)
    {
      v21 = -1.57079633;
    }
    else
    {
      v21 = 3.14159265;
      if (a8 != 2)
        v21 = 0.0;
    }
  }
  v23 = v21 - v22;
  v24 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke;
  v33[3] = &unk_24EE59158;
  v34 = v18;
  v35 = v23;
  v36 = a1;
  v37 = a2;
  v28[0] = v24;
  v28[1] = 3221225472;
  v28[2] = __206__UIViewController_CFXAdditions__animateCounterRotationView_fadeOut_toWindowOrientation_fromWindowOrientation_forTransitionToSize_withTransitionCoordinator_postTransitionBlock_postRemoveFromSuperviewBlock___block_invoke_2;
  v28[3] = &unk_24EE59180;
  v32 = a6;
  v29 = v34;
  v30 = v19;
  v31 = v20;
  v25 = v20;
  v26 = v34;
  v27 = v19;
  objc_msgSend(a9, "animateAlongsideTransition:completion:", v33, v28);

}

@end
