@implementation MPUFallAnimator

+ (void)animateFallForView:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  _MPUFallAnimatorDynamicItem *v17;
  __int128 v18;
  _MPUFallAnimatorDynamicSystem *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  double MinX;
  CGFloat v36;
  double MaxX;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  long double v43;
  long double v44;
  double v45;
  long double v46;
  CGFloat v47;
  __int128 v48;
  void *v49;
  void *v50;
  char v51;
  char v52;
  void *v53;
  id v54;
  void *v55;
  float v56;
  uint64_t v57;
  void *v58;
  float v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _MPUFallAnimatorDynamicSystem *v66;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  CATransform3D v81;
  CATransform3D v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _MPUFallAnimatorDynamicItem *v86;
  _MPUFallAnimatorDynamicItem *v87;
  _QWORD v88[4];
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v88[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v67 = v6;
    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 1.0);
    objc_msgSend(v8, "position");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "bounds");
    v65 = v8;
    objc_msgSend(v8, "setPosition:", v10, v12 + CGRectGetHeight(v89) * 0.5);
    v13 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v5, "bounds");
    v14 = (void *)objc_msgSend(v13, "initWithFrame:");
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    v16 = 0.0;
    objc_msgSend(v14, "setAlpha:", 0.0);
    v68 = v5;
    v63 = v14;
    objc_msgSend(v5, "addSubview:", v14);
    v17 = objc_alloc_init(_MPUFallAnimatorDynamicItem);
    -[_MPUFallAnimatorDynamicItem setBounds:](v17, "setBounds:", 0.0, 0.0, 5.0, 100.0);
    -[_MPUFallAnimatorDynamicItem setCenter:](v17, "setCenter:", 50.0, 100.0);
    v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v82.m11 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v82.m13 = v18;
    *(_OWORD *)&v82.m21 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[_MPUFallAnimatorDynamicItem setTransform:](v17, "setTransform:", &v82);
    v19 = objc_alloc_init(_MPUFallAnimatorDynamicSystem);
    -[_MPUFallAnimatorDynamicSystem bounds](v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v66 = v19;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A18]), "initWithReferenceSystem:", v19);
    objc_msgSend(v28, "_setAlwaysDisableDisplayLink:", 1);
    v29 = objc_alloc(MEMORY[0x24BDF6AA8]);
    v88[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithItems:", v30);

    v64 = (void *)v31;
    objc_msgSend(v28, "addBehavior:", v31);
    v32 = objc_alloc(MEMORY[0x24BDF6940]);
    v87 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithItems:", v33);

    v90.origin.x = v21;
    v90.origin.y = v23;
    v90.size.width = v25;
    v90.size.height = v27;
    MinX = CGRectGetMinX(v90);
    v91.origin.x = 0.0;
    v91.origin.y = 0.0;
    v91.size.width = 5.0;
    v91.size.height = 100.0;
    v36 = CGRectGetHeight(v91) * 0.5 + 100.0;
    v92.origin.x = v21;
    v92.origin.y = v23;
    v92.size.width = v25;
    v92.size.height = v27;
    MaxX = CGRectGetMaxX(v92);
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    v93.size.width = 5.0;
    v93.size.height = 100.0;
    objc_msgSend(v34, "addBoundaryWithIdentifier:fromPoint:toPoint:", CFSTR("floor"), MinX, v36, MaxX, CGRectGetHeight(v93) * 0.5 + 100.0);
    v62 = v34;
    objc_msgSend(v28, "addBehavior:", v34);
    v38 = objc_alloc(MEMORY[0x24BDF6D00]);
    v86 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithItems:mode:", v39, 1);

    objc_msgSend(v40, "setTargetPoint:forItem:", v17, 0.0, 5.0);
    objc_msgSend(v40, "setXComponent:yComponent:", 1.0, 0.0);
    v61 = v40;
    objc_msgSend(v28, "addBehavior:", v40);
    v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    v43 = 0.0;
    v44 = 0.0;
    if (v17)
    {
      -[_MPUFallAnimatorDynamicItem transform](v17, "transform", 0.0, 0.0);
      v44 = *((double *)&v83 + 1);
      v43 = *(double *)&v83;
    }
    v45 = atan2(v44, v43);
    if (v45 >= -1.57079633)
    {
      v46 = v45;
      v74 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v75 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v47 = *(double *)(MEMORY[0x24BDE5598] + 80);
      v72 = *MEMORY[0x24BDE5598];
      v73 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v70 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v71 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v69 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v48 = 0uLL;
      do
      {
        *(_OWORD *)&v81.m21 = v75;
        *(_OWORD *)&v81.m23 = v74;
        *(_OWORD *)&v81.m31 = v73;
        *(_OWORD *)&v81.m11 = v72;
        *(_OWORD *)&v81.m13 = v71;
        *(_OWORD *)&v81.m41 = v70;
        *(_OWORD *)&v81.m43 = v69;
        *(_OWORD *)&v82.m41 = v48;
        *(_OWORD *)&v82.m43 = v48;
        *(_OWORD *)&v82.m31 = v48;
        *(_OWORD *)&v82.m33 = v48;
        *(_OWORD *)&v82.m21 = v48;
        *(_OWORD *)&v82.m23 = v48;
        *(_OWORD *)&v82.m11 = v48;
        *(_OWORD *)&v82.m13 = v48;
        v81.m33 = v47;
        v81.m34 = -0.004;
        CATransform3DRotate(&v82, &v81, v46, 1.0, 0.0, 0.0);
        v81 = v82;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v81);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v49);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmin(fmax(v46 / -1.57079633 * 0.8, 0.0), 1.0));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v50);

        v51 = objc_msgSend(v28, "_animatorStep:", 0.0166666667);
        if (v17)
          -[_MPUFallAnimatorDynamicItem transform](v17, "transform");
        else
          memset(&v81, 0, 48);
        v16 = v16 + 0.0166666667;
        v83 = *(_OWORD *)&v81.m11;
        v84 = *(_OWORD *)&v81.m13;
        v85 = *(_OWORD *)&v81.m21;
        v46 = atan2(v81.m12, v81.m11);
        if (v46 >= -1.57079633)
          v52 = v51;
        else
          v52 = 0;
        v48 = 0uLL;
      }
      while ((v52 & 1) != 0);
    }
    objc_msgSend(v28, "removeAllBehaviors");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v53 = (void *)MEMORY[0x24BDE57D8];
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __60__MPUFallAnimator_animateFallForView_withCompletionHandler___block_invoke;
    v77[3] = &unk_24DD6DFC8;
    v78 = v63;
    v79 = v65;
    v7 = v67;
    v80 = v67;
    v76 = v65;
    v54 = v63;
    objc_msgSend(v53, "setCompletionBlock:", v77);
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setValues:", v41);
    UIAnimationDragCoefficient();
    objc_msgSend(v55, "setDuration:", v16 * v56);
    v57 = *MEMORY[0x24BDE5970];
    objc_msgSend(v55, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v55, "setRemovedOnCompletion:", 0);
    objc_msgSend(v76, "addAnimation:forKey:", v55, CFSTR("fallingAnimation"));
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setValues:", v42);
    UIAnimationDragCoefficient();
    objc_msgSend(v58, "setDuration:", v16 * v59);
    objc_msgSend(v58, "setFillMode:", v57);
    objc_msgSend(v58, "setRemovedOnCompletion:", 0);
    objc_msgSend(v54, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addAnimation:forKey:", v58, CFSTR("fallingAnimation"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v5 = v68;
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }

}

uint64_t __60__MPUFallAnimator_animateFallForView_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[8];

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setAnchorPoint:", 0.5, 0.5);
  v2 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v8[0] = *MEMORY[0x24BDE5598];
  v8[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 40), "removeAnimationForKey:", CFSTR("fallingAnimation"));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
