@implementation FIUICrossFadeZoomTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  UIView *v64;
  UIView *v65;
  id v66;
  UIView *v67;
  UIView *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id animationCompletionBlock;
  void *v74;
  double v75;
  double v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  UIView *v126;
  UIView *v127;
  id v128;
  UIView *v129;
  UIView *v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void (**v160)(void);
  void *v161;
  _QWORD v162[4];
  id v163;
  id v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _QWORD v170[4];
  id v171;
  id v172;
  UIView *v173;
  UIView *v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  _QWORD v180[4];
  id v181;
  id v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD v188[4];
  id v189;
  id v190;
  UIView *v191;
  UIView *v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id location;
  _QWORD v199[4];
  id v200;
  FIUICrossFadeZoomTransitionAnimator *v201;
  id v202;
  _QWORD v203[4];
  id v204;
  FIUICrossFadeZoomTransitionAnimator *v205;
  id v206;
  _QWORD aBlock[4];
  id v208;
  FIUICrossFadeZoomTransitionAnimator *v209;
  id v210;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke;
  aBlock[3] = &unk_24CF30628;
  v8 = v5;
  v208 = v8;
  v209 = self;
  v9 = v6;
  v210 = v9;
  v10 = _Block_copy(aBlock);
  v203[0] = v7;
  v203[1] = 3221225472;
  v203[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_2;
  v203[3] = &unk_24CF30628;
  v11 = v8;
  v204 = v11;
  v205 = self;
  v12 = v9;
  v206 = v12;
  v160 = (void (**)(void))_Block_copy(v203);
  v199[0] = v7;
  v199[1] = 3221225472;
  v199[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_3;
  v199[3] = &unk_24CF30628;
  v13 = v11;
  v200 = v13;
  v201 = self;
  v14 = v12;
  v202 = v14;
  v161 = _Block_copy(v199);
  LODWORD(v12) = self->_zoomingUp;
  objc_msgSend(v4, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v13;
  v159 = v10;
  v157 = v14;
  if ((_DWORD)v12)
  {
    objc_msgSend(v13, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    objc_msgSend(v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    objc_msgSend(v13, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUserInteractionEnabled:", 0);

    objc_msgSend(v14, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUserInteractionEnabled:", 0);

    objc_msgSend(v13, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v14, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

    (*((void (**)(void *))v10 + 2))(v10);
    -[UIView superview](self->_smallView, "superview");
    v31 = objc_claimAutoreleasedReturnValue();
    -[UIView superview](self->_largeView, "superview");
    v32 = objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_smallView, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[UIView frame](self->_largeView, "frame");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    objc_msgSend(v4, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = (void *)v31;
    objc_msgSend(v49, "convertRect:fromView:", v31, v34, v36, v38, v40);
    v151 = v51;
    v153 = v50;
    v147 = v53;
    v149 = v52;

    objc_msgSend(v4, "containerView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = (void *)v32;
    objc_msgSend(v54, "convertRect:fromView:", v32, v42, v44, v46, v48);
    v143 = v56;
    v145 = v55;
    v139 = v58;
    v141 = v57;

    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD960]), "initWithFrame:", v34, v36, v38, v40);
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD960]), "initWithFrame:", v42, v44, v46, v48);
    objc_msgSend(v59, "captureSnapshotOfView:withSnapshotType:", self->_smallView, 1);
    objc_msgSend(v60, "captureSnapshotOfView:withSnapshotType:", self->_largeView, 0);
    objc_msgSend(v4, "containerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v59);

    objc_msgSend(v4, "containerView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSubview:", v60);

    -[UIView setHidden:](self->_smallView, "setHidden:", 1);
    -[UIView setHidden:](self->_largeView, "setHidden:", 1);
    objc_msgSend(v14, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAlpha:", 0.0);

    objc_msgSend(v59, "setFrame:", v153, v151, v149, v147);
    objc_msgSend(v60, "setFrame:", v153, v151, v149, v147);
    objc_msgSend(v60, "setAlpha:", 0.0);
    v64 = self->_smallView;
    v65 = self->_largeView;
    objc_initWeak(&location, self);
    v188[0] = v7;
    v188[1] = 3221225472;
    v188[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_4;
    v188[3] = &unk_24CF31588;
    objc_copyWeak(&v197, &location);
    v189 = v13;
    v66 = v14;
    v190 = v66;
    v67 = v64;
    v191 = v67;
    v68 = v65;
    v192 = v68;
    v69 = v59;
    v193 = v69;
    v70 = v60;
    v194 = v70;
    v71 = v4;
    v195 = v71;
    v196 = v161;
    v72 = _Block_copy(v188);
    animationCompletionBlock = self->_animationCompletionBlock;
    self->_animationCompletionBlock = v72;

    v74 = (void *)MEMORY[0x24BEBDB00];
    -[FIUICrossFadeZoomTransitionAnimator transitionDuration:](self, "transitionDuration:", v71);
    v76 = v75;
    v180[0] = MEMORY[0x24BDAC760];
    v180[1] = 3221225472;
    v180[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_5;
    v180[3] = &unk_24CF315B0;
    v181 = v66;
    v77 = v69;
    v182 = v77;
    v184 = v145;
    v185 = v143;
    v186 = v141;
    v187 = v139;
    v78 = v70;
    v183 = v78;
    objc_msgSend(v74, "animateWithDuration:animations:completion:", v180, self->_animationCompletionBlock, v76);

    objc_destroyWeak(&v197);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v14, "view");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v79);

    objc_msgSend(v4, "containerView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addSubview:", v81);

    objc_msgSend(v13, "view");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setUserInteractionEnabled:", 0);

    objc_msgSend(v14, "view");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setUserInteractionEnabled:", 0);

    objc_msgSend(v13, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "frame");
    v86 = v85;
    v88 = v87;
    v90 = v89;
    v92 = v91;
    objc_msgSend(v14, "view");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setFrame:", v86, v88, v90, v92);

    (*((void (**)(void *))v10 + 2))(v10);
    -[UIView superview](self->_smallView, "superview");
    v94 = objc_claimAutoreleasedReturnValue();
    -[UIView superview](self->_largeView, "superview");
    v95 = objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_smallView, "frame");
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v103 = v102;
    -[UIView frame](self->_largeView, "frame");
    v105 = v104;
    v107 = v106;
    v109 = v108;
    v111 = v110;
    objc_msgSend(v4, "containerView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = (void *)v95;
    objc_msgSend(v112, "convertRect:fromView:", v95, v105, v107, v109, v111);
    v152 = v114;
    v154 = v113;
    v148 = v116;
    v150 = v115;

    objc_msgSend(v4, "containerView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = (void *)v94;
    objc_msgSend(v117, "convertRect:fromView:", v94, v97, v99, v101, v103);
    v144 = v119;
    v146 = v118;
    v140 = v121;
    v142 = v120;

    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD960]), "initWithFrame:", v97, v99, v101, v103);
    v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD960]), "initWithFrame:", v105, v107, v109, v111);
    objc_msgSend(v122, "captureSnapshotOfView:withSnapshotType:", self->_smallView, 0);
    objc_msgSend(v123, "captureSnapshotOfView:withSnapshotType:", self->_largeView, 1);
    objc_msgSend(v4, "containerView");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "addSubview:", v122);

    objc_msgSend(v4, "containerView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "addSubview:", v123);

    -[UIView setHidden:](self->_smallView, "setHidden:", 1);
    -[UIView setHidden:](self->_largeView, "setHidden:", 1);
    objc_msgSend(v122, "setAlpha:", 0.0);
    objc_msgSend(v122, "setFrame:", v154, v152, v150, v148);
    objc_msgSend(v123, "setFrame:", v154, v152, v150, v148);
    objc_initWeak(&location, self);
    v126 = self->_smallView;
    v127 = self->_largeView;
    v170[0] = v7;
    v170[1] = 3221225472;
    v170[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_6;
    v170[3] = &unk_24CF31588;
    objc_copyWeak(&v179, &location);
    v128 = v13;
    v171 = v128;
    v172 = v14;
    v129 = v126;
    v173 = v129;
    v130 = v127;
    v174 = v130;
    v131 = v122;
    v175 = v131;
    v132 = v123;
    v176 = v132;
    v133 = v4;
    v177 = v133;
    v178 = v161;
    v134 = _Block_copy(v170);
    v135 = self->_animationCompletionBlock;
    self->_animationCompletionBlock = v134;

    v136 = (void *)MEMORY[0x24BEBDB00];
    -[FIUICrossFadeZoomTransitionAnimator transitionDuration:](self, "transitionDuration:", v133);
    v138 = v137;
    v162[0] = MEMORY[0x24BDAC760];
    v162[1] = 3221225472;
    v162[2] = __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_7;
    v162[3] = &unk_24CF315B0;
    v163 = v128;
    v77 = v131;
    v164 = v77;
    v166 = v146;
    v167 = v144;
    v168 = v142;
    v169 = v140;
    v78 = v132;
    v165 = v78;
    objc_msgSend(v136, "animateWithDuration:animations:completion:", v162, self->_animationCompletionBlock, v138);
    v160[2]();

    objc_destroyWeak(&v179);
    objc_destroyWeak(&location);
  }

}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "zoomTransitionAnimatorWillBeginTransition:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "zoomTransitionAnimatorWillBeginTransition:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "zoomTransitionAnimatorDidBeginTransition:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "zoomTransitionAnimatorDidBeginTransition:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "zoomTransitionAnimatorDidCompleteTransition:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "zoomTransitionAnimatorDidCompleteTransition:", *(_QWORD *)(a1 + 40));
  return result;
}

void __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained && !WeakRetained[16])
  {
    WeakRetained[16] = 1;
    v8 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 48), "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 80), "completeTransition:", a2);
    v7 = (void *)v8[1];
    v8[1] = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    WeakRetained = v8;
  }

}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
}

void __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_6(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained && !WeakRetained[16])
  {
    WeakRetained[16] = 1;
    v8 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 48), "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", 0);
    objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 80), "completeTransition:", a2);
    v7 = (void *)v8[1];
    v8[1] = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    WeakRetained = v8;
  }

}

uint64_t __57__FIUICrossFadeZoomTransitionAnimator_animateTransition___block_invoke_7(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

- (void)animationEnded:(BOOL)a3
{
  self->_transitionCompleted = 1;
}

- (void)completeTransitionImmediately
{
  void (**animationCompletionBlock)(id, uint64_t);
  id v4;

  animationCompletionBlock = (void (**)(id, uint64_t))self->_animationCompletionBlock;
  if (animationCompletionBlock)
  {
    animationCompletionBlock[2](animationCompletionBlock, 1);
    v4 = self->_animationCompletionBlock;
    self->_animationCompletionBlock = 0;

  }
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (UIView)smallView
{
  return self->_smallView;
}

- (void)setSmallView:(id)a3
{
  objc_storeStrong((id *)&self->_smallView, a3);
}

- (UIView)largeView
{
  return self->_largeView;
}

- (void)setLargeView:(id)a3
{
  objc_storeStrong((id *)&self->_largeView, a3);
}

- (BOOL)zoomingUp
{
  return self->_zoomingUp;
}

- (void)setZoomingUp:(BOOL)a3
{
  self->_zoomingUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeView, 0);
  objc_storeStrong((id *)&self->_smallView, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_animationCompletionBlock, 0);
}

@end
