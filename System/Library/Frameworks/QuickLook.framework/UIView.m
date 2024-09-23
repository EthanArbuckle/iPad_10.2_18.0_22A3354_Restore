@implementation UIView

void __151__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BEBDB00];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "qlpu_animateViews:withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v11, *(_QWORD *)(a1 + 64), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), a4, v12, v13);

}

void __143__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BEBDB00];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "qlpu_animateViews:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", v11, *(_QWORD *)(a1 + 48), v10, v9, *(double *)(a1 + 40), a4, v12, v13);

}

void __162__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BEBDB00];
  v12 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "qlpu_animateViews:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v11, *(_QWORD *)(a1 + 56), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), a4, v12, v13);

}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4(double *a1)
{
  void *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;

  v1 = (void *)*((_QWORD *)a1 + 4);
  v2 = a1[7];
  v3 = a1[8];
  v4 = a1[9];
  v5 = a1[5];
  v6 = a1[6];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v10 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v11.a = v10;
  *(_OWORD *)&v11.c = v9;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v11.tx = v8;
  *(_OWORD *)&v14.a = v10;
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = v8;
  CGAffineTransformTranslate(&v11, &v14, v5, v6);
  *(_OWORD *)&t1.a = v10;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = v8;
  t2 = v11;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v11 = v14;
  t1 = v14;
  CGAffineTransformRotate(&v14, &t1, v4);
  v11 = v14;
  t1 = v14;
  CGAffineTransformScale(&v14, &t1, v2, v3);
  v11 = v14;
  return objc_msgSend(v1, "setTransform:", &v11);
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_6(double *a1)
{
  void *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;

  v1 = (void *)*((_QWORD *)a1 + 4);
  v2 = a1[7];
  v3 = a1[8];
  v4 = a1[9];
  v5 = a1[5];
  v6 = a1[6];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v10 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v11.a = v10;
  *(_OWORD *)&v11.c = v9;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v11.tx = v8;
  *(_OWORD *)&v14.a = v10;
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = v8;
  CGAffineTransformTranslate(&v11, &v14, v5, v6);
  *(_OWORD *)&t1.a = v10;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = v8;
  t2 = v11;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v11 = v14;
  t1 = v14;
  CGAffineTransformRotate(&v14, &t1, v4);
  v11 = v14;
  t1 = v14;
  CGAffineTransformScale(&v14, &t1, v2, v3);
  v11 = v14;
  return objc_msgSend(v1, "setTransform:", &v11);
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_8(double *a1)
{
  void *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;

  v1 = (void *)*((_QWORD *)a1 + 4);
  v2 = a1[7];
  v3 = a1[8];
  v4 = a1[9];
  v5 = a1[5];
  v6 = a1[6];
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v10 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v11.a = v10;
  *(_OWORD *)&v11.c = v9;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v11.tx = v8;
  *(_OWORD *)&v14.a = v10;
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = v8;
  CGAffineTransformTranslate(&v11, &v14, v5, v6);
  *(_OWORD *)&t1.a = v10;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = v8;
  t2 = v11;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v11 = v14;
  t1 = v14;
  CGAffineTransformRotate(&v14, &t1, v4);
  v11 = v14;
  t1 = v14;
  CGAffineTransformScale(&v14, &t1, v2, v3);
  v11 = v14;
  return objc_msgSend(v1, "setTransform:", &v11);
}

void __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_9(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __142__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __134__UIView_QLPUAnimationGroup__qlpu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __147__UIView_QLPUAnimationGroup__qlpu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

uint64_t __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeIfNeeded");
}

@end
