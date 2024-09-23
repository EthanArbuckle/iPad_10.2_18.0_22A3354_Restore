@implementation UIView(QLPUDisplayVelocity)

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  id v29;
  __int128 v30;
  id v31;
  _OWORD v35[3];
  _QWORD v36[4];
  id v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;

  v29 = a11;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __151__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  v36[3] = &unk_24C726470;
  v37 = v29;
  v38 = a8;
  v39 = a9;
  v40 = a17;
  v41 = a13;
  v30 = a12[1];
  v35[0] = *a12;
  v35[1] = v30;
  v35[2] = a12[2];
  v31 = v29;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v31, v35, v36, a14, a2, a3, a4, a5, a6, a7, a18, a19, a20);

}

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  id v28;
  __int128 v29;
  id v30;
  _OWORD v32[3];
  _QWORD v33[4];
  id v34;
  double v35;
  uint64_t v36;

  v28 = a10;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __143__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v33[3] = &unk_24C726498;
  v34 = v28;
  v35 = a8;
  v36 = a12;
  v29 = a11[1];
  v32[0] = *a11;
  v32[1] = v29;
  v32[2] = a11[2];
  v30 = v28;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v30, v32, v33, a13, a2, a3, a4, a5, a6, a7, a16, a17, a18);

}

+ (void)qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:
{
  id v30;
  __int128 v31;
  id v32;
  _OWORD v36[3];
  _QWORD v37[4];
  id v38;
  double v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v30 = a11;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __162__UIView_QLPUDisplayVelocity__qlpu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke;
  v37[3] = &unk_24C7264C0;
  v38 = v30;
  v39 = a8;
  v40 = a9;
  v41 = a13;
  v42 = a17;
  v43 = a18;
  v31 = a12[1];
  v36[0] = *a12;
  v36[1] = v31;
  v36[2] = a12[2];
  v32 = v30;
  objc_msgSend(a1, "_qlpu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v32, v36, v37, a14, a2, a3, a4, a5, a6, a7, a19, a20, a21);

}

+ (void)_qlpu_animateView:()QLPUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  double Width;
  double v42;
  double Height;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __double2 v50;
  double v51;
  double v52;
  double v53;
  long double v54;
  double v55;
  double v56;
  __double2 v57;
  double v58;
  double v59;
  double v60;
  void **v61;
  void *v62;
  NSObject *v63;
  id v64;
  __int128 v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  id v73;
  NSObject *v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double ty;
  CGFloat v81;
  double tx;
  _QWORD v83[4];
  NSObject *v84;
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  _QWORD v93[4];
  NSObject *v94;
  _QWORD *v95;
  _QWORD v96[4];
  id v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  _QWORD v103[4];
  NSObject *v104;
  _QWORD *v105;
  _QWORD v106[4];
  id v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGAffineTransform t1;
  _QWORD v114[4];
  NSObject *v115;
  _QWORD *v116;
  _QWORD v117[4];
  id v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  _QWORD v123[4];
  NSObject *v124;
  _QWORD *v125;
  _QWORD v126[4];
  id v127;
  double v128;
  double v129;
  _QWORD v130[4];
  NSObject *v131;
  _QWORD *v132;
  _QWORD v133[4];
  id v134;
  double v135;
  double v136;
  _QWORD block[4];
  id v138;
  _QWORD *v139;
  _QWORD v140[3];
  char v141;
  CGAffineTransform v142;
  CGAffineTransform t2;
  uint64_t v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;

  v144 = *MEMORY[0x24BDAC8D0];
  v27 = a9;
  v28 = a11;
  v29 = a12;
  objc_msgSend(v27, "center");
  v31 = v30;
  v33 = v32;
  objc_msgSend(v27, "bounds");
  v79 = v35;
  v81 = v34;
  v75 = v37;
  v77 = v36;
  memset(&v142, 0, sizeof(v142));
  if (v27)
    objc_msgSend(v27, "transform");
  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x2020000000;
  v141 = 1;
  v38 = dispatch_group_create();
  dispatch_group_enter(v38);
  v39 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_24C7264E8;
  v40 = v29;
  v138 = v40;
  v139 = v140;
  dispatch_group_notify(v38, MEMORY[0x24BDAC9B8], block);
  if (a1 == v31)
  {
    a1 = v31;
  }
  else
  {
    dispatch_group_enter(v38);
    v133[0] = v39;
    v133[1] = 3221225472;
    v133[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v133[3] = &unk_24C724F90;
    v134 = v27;
    v135 = a1;
    v136 = v33;
    v130[0] = v39;
    v130[1] = 3221225472;
    v130[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v130[3] = &unk_24C726510;
    v132 = v140;
    v131 = v38;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v133, v130, a15 / (a1 - v31));

  }
  if (a2 != v33)
  {
    dispatch_group_enter(v38);
    v126[0] = v39;
    v126[1] = 3221225472;
    v126[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v126[3] = &unk_24C724F90;
    v127 = v27;
    v128 = a1;
    v129 = a2;
    v123[0] = v39;
    v123[1] = 3221225472;
    v123[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v123[3] = &unk_24C726510;
    v125 = v140;
    v124 = v38;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v126, v123, a16 / (a2 - v33));

  }
  v145.origin.x = a3;
  v145.origin.y = a4;
  v145.size.width = a5;
  v145.size.height = a6;
  v150.origin.y = v79;
  v150.origin.x = v81;
  v150.size.height = v75;
  v150.size.width = v77;
  if (!CGRectEqualToRect(v145, v150))
  {
    v146.origin.x = a3;
    v146.origin.y = a4;
    v146.size.width = a5;
    v146.size.height = a6;
    Width = CGRectGetWidth(v146);
    v147.origin.y = v79;
    v147.origin.x = v81;
    v147.size.height = v75;
    v147.size.width = v77;
    v42 = CGRectGetWidth(v147);
    v148.origin.x = a3;
    v148.origin.y = a4;
    v148.size.width = a5;
    v148.size.height = a6;
    Height = CGRectGetHeight(v148);
    v149.origin.y = v79;
    v149.origin.x = v81;
    v149.size.height = v75;
    v149.size.width = v77;
    v44 = Height / CGRectGetHeight(v149);
    v45 = 0.0;
    v46 = 0.0;
    if (Width / v42 != 1.0)
      v46 = a17 / (Width / v42 + -1.0);
    if (v44 != 1.0)
      v45 = a17 / (v44 + -1.0);
    v47 = (v46 + v45) * 0.5;
    dispatch_group_enter(v38);
    v117[0] = v39;
    v117[1] = 3221225472;
    v117[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v117[3] = &unk_24C724FB8;
    v118 = v27;
    v119 = a3;
    v120 = a4;
    v121 = a5;
    v122 = a6;
    v114[0] = v39;
    v114[1] = 3221225472;
    v114[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v114[3] = &unk_24C726510;
    v116 = v140;
    v115 = v38;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v117, v114, v47);

  }
  v48 = *(_OWORD *)(a10 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a10;
  *(_OWORD *)&t1.c = v48;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a10 + 32);
  t2 = v142;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v49 = *(_OWORD *)&v142.a;
    ty = v142.ty;
    tx = v142.tx;
    v76 = atan2(v142.b, v142.a);
    v50 = __sincos_stret(v76);
    if (fabs(v50.__cosval) <= fabs(v50.__sinval))
    {
      v51 = *((double *)&v49 + 1) / v50.__sinval;
      v52 = -v142.c / v50.__sinval;
    }
    else
    {
      v51 = *(double *)&v49 / v50.__cosval;
      v52 = v142.d / v50.__cosval;
    }
    v53 = *(double *)a10;
    v54 = *(double *)(a10 + 8);
    v56 = *(double *)(a10 + 32);
    v55 = *(double *)(a10 + 40);
    v78 = atan2(v54, *(long double *)a10);
    v57 = __sincos_stret(v78);
    if (fabs(v57.__cosval) <= fabs(v57.__sinval))
    {
      v58 = v54 / v57.__sinval;
      v59 = -*(double *)(a10 + 16) / v57.__sinval;
    }
    else
    {
      v58 = v53 / v57.__cosval;
      v59 = *(double *)(a10 + 24) / v57.__cosval;
    }
    v60 = v78;
    if (vabdd_f64(tx, v56) > 0.00000999999975 || vabdd_f64(ty, v55) > 0.00000999999975)
    {
      v61 = (void **)MEMORY[0x24BE7BF48];
      v62 = (void *)*MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v62 = *v61;
      }
      v63 = v62;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        t1 = v142;
        NSStringFromCGAffineTransform(&t1);
        v64 = (id)objc_claimAutoreleasedReturnValue();
        v65 = *(_OWORD *)(a10 + 16);
        *(_OWORD *)&t1.a = *(_OWORD *)a10;
        *(_OWORD *)&t1.c = v65;
        *(_OWORD *)&t1.tx = *(_OWORD *)(a10 + 32);
        NSStringFromCGAffineTransform(&t1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(t2.a) = 138412546;
        *(_QWORD *)((char *)&t2.a + 4) = v64;
        WORD2(t2.b) = 2112;
        *(_QWORD *)((char *)&t2.b + 6) = v66;
        _os_log_impl(&dword_20D4F5000, v63, OS_LOG_TYPE_INFO, "animation of translational transforms is not supported (%@ => %@) #Generic", (uint8_t *)&t2, 0x16u);

      }
    }
    if (v58 == v51 && v59 == v52)
    {
      v59 = v52;
      v58 = v51;
      v67 = v76;
    }
    else
    {
      v68 = v59 / v52;
      v69 = 0.0;
      v70 = 0.0;
      if (v58 / v51 != 1.0)
        v70 = a17 / (v58 / v51 + -1.0);
      if (v68 != 1.0)
        v69 = a17 / (v68 + -1.0);
      v71 = vabdd_f64(v70, v69);
      if (v71 > 0.00000999999975)
        v72 = v52;
      else
        v72 = v59;
      dispatch_group_enter(v38);
      v106[0] = v39;
      v106[1] = 3221225472;
      v106[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
      v106[3] = &unk_24C726538;
      v73 = v27;
      v107 = v73;
      v108 = tx;
      v109 = ty;
      v110 = v58;
      v111 = v72;
      v67 = v76;
      v112 = v76;
      v103[0] = v39;
      v103[1] = 3221225472;
      v103[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_5;
      v103[3] = &unk_24C726510;
      v105 = v140;
      v74 = v38;
      v104 = v74;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v106, v103, v70);
      v60 = v78;
      if (v71 > 0.00000999999975)
      {
        dispatch_group_enter(v74);
        v96[0] = v39;
        v96[1] = 3221225472;
        v96[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_6;
        v96[3] = &unk_24C726538;
        v97 = v73;
        v98 = tx;
        v99 = ty;
        v100 = v58;
        v101 = v59;
        v102 = v76;
        v93[0] = v39;
        v93[1] = 3221225472;
        v67 = v76;
        v93[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_7;
        v93[3] = &unk_24C726510;
        v95 = v140;
        v94 = v74;
        (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v96, v93, v69);

      }
    }
    if (v60 != v67)
    {
      dispatch_group_enter(v38);
      v86[0] = v39;
      v86[1] = 3221225472;
      v86[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_8;
      v86[3] = &unk_24C726538;
      v87 = v27;
      v88 = tx;
      v89 = ty;
      v90 = v58;
      v91 = v59;
      v92 = v60;
      v83[0] = v39;
      v83[1] = 3221225472;
      v83[2] = __127__UIView_QLPUDisplayVelocity___qlpu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_9;
      v83[3] = &unk_24C726510;
      v85 = v140;
      v84 = v38;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v28 + 2))(v28, v86, v83, a18 / (v60 - v67));

    }
  }
  dispatch_group_leave(v38);

  _Block_object_dispose(v140, 8);
}

@end
