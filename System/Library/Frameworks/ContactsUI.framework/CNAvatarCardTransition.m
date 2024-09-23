@implementation CNAvatarCardTransition

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  double v75;
  double v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
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
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  double v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  double v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  CNAvatarCardTransition *v183;
  void *v184;
  id v185;
  void *v186;
  _QWORD v187[4];
  id v188;
  id v189;
  CNAvatarCardTransition *v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  _QWORD v197[4];
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  CNAvatarCardTransition *v203;
  id v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v6 = objc_claimAutoreleasedReturnValue();
  v175 = v4;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v7 = objc_claimAutoreleasedReturnValue();
  v180 = (void *)v7;
  if (-[CNAvatarCardTransition reversed](self, "reversed"))
    v8 = (void *)v6;
  else
    v8 = (void *)v7;
  v9 = v8;
  objc_msgSend(v9, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cardViewControllerTransitioning");
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[CNAvatarCardTransition reversed](self, "reversed"))
    v13 = v9;
  else
    v13 = (void *)v12;
  v14 = v13;
  v177 = (void *)v12;
  if (-[CNAvatarCardTransition reversed](self, "reversed"))
    v15 = (void *)v12;
  else
    v15 = v9;
  v16 = v15;
  objc_msgSend(v10, "presentedView");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vibrancyView");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameOfPresentedViewInContainerView");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  if (!-[CNAvatarCardTransition reversed](self, "reversed"))
  {
    v25 = v5;
    v26 = v16;
    v27 = v11;
    v28 = v9;
    v29 = v25;
    objc_msgSend(v25, "addSubview:", v184);
    objc_msgSend(v10, "dimmingView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlpha:", 0.0);

    v31 = v29;
    v9 = v28;
    v11 = v27;
    v16 = v26;
    objc_msgSend(v184, "setFrame:", v18, v20, v22, v24);
    v5 = v31;
    objc_msgSend(v31, "layoutIfNeeded");
  }
  v32 = *MEMORY[0x1E0C9D648];
  v33 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  v34 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  v35 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  if (v14)
    v36 = v16 == 0;
  else
    v36 = 1;
  v181 = (void *)v6;
  v176 = v14;
  v183 = self;
  if (!v36)
  {
    objc_msgSend(v14, "transitioningImage");
    v37 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitioningImageFrame");
    v40 = v39;
    v170 = v35;
    v172 = v34;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend(v14, "transitioningView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromView:", v47, v40, v42, v44, v46);
    v168 = v48;
    v164 = v49;
    v51 = v50;
    v53 = v52;

    objc_msgSend(v16, "transitioningImage");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitioningImageFrame");
    v55 = v54;
    v57 = v56;
    v58 = v33;
    v60 = v59;
    v61 = v32;
    v63 = v62;
    objc_msgSend(v16, "transitioningView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v60;
    v33 = v58;
    v34 = v172;
    v66 = v63;
    v32 = v61;
    objc_msgSend(v5, "convertRect:fromView:", v64, v55, v57, v65, v66);
    v167 = v67;
    v69 = v68;
    v71 = v70;
    v73 = v72;

    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v38);
    objc_msgSend(v5, "addSubview:", v74);
    v75 = v51;
    v35 = v170;
    v76 = v53;
    v77 = v73;
    objc_msgSend(v74, "setFrame:", v168, v164, v75, v76);
    objc_msgSend(v14, "setTransitioningImageVisible:", 0);
    objc_msgSend(v16, "setTransitioningImageVisible:", 0);
    objc_msgSend(v10, "setOriginalTransitioning:", v14);

    v11 = v37;
    self = v183;
    v78 = 0;
LABEL_19:
    v79 = v35;
    v162 = v33;
    v163 = v34;
    v161 = v32;
    goto LABEL_21;
  }
  if (-[CNAvatarCardTransition reversed](self, "reversed"))
  {
    v174 = 0;
    v74 = 0;
    v78 = 0;
    v77 = v35;
    v71 = v34;
    v69 = v33;
    v167 = v32;
    goto LABEL_19;
  }
  objc_msgSend(v10, "sourceView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceRect");
  objc_msgSend(v80, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sourceRect");
  v82 = v81;
  v71 = v34;
  v84 = v83;
  v85 = v35;
  v87 = v86;
  v89 = v88;
  objc_msgSend(v10, "sourceView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v84;
  v34 = v71;
  v92 = v87;
  v35 = v85;
  objc_msgSend(v186, "convertRect:fromView:", v90, v82, v91, v92, v89);
  objc_msgSend(v78, "setFrame:");

  objc_msgSend(v16, "transitioningView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transitioningFrame");
  objc_msgSend(v93, "convertRect:toView:", v186);
  v161 = v94;
  v162 = v95;
  v163 = v96;
  v79 = v97;

  objc_msgSend(v186, "addSubview:", v78);
  v174 = 0;
  v74 = 0;
  v77 = v85;
  v69 = v33;
  v167 = v32;
LABEL_21:
  v182 = v5;
  v178 = v11;
  v179 = v9;
  v173 = v78;
  v169 = v69;
  v171 = v71;
  v166 = v16;
  v165 = v79;
  if (-[CNAvatarCardTransition reversed](self, "reversed"))
  {
    v98 = 0;
    v99 = 0;
    v157 = v34;
    v158 = v35;
    v155 = v32;
    v156 = v33;
  }
  else
  {
    objc_msgSend(v16, "transitioningView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitioningContentFrame");
    v102 = v101;
    v104 = v103;
    v106 = v105;
    v159 = v77;
    v108 = v107;
    objc_msgSend(v100, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceRect");
    v110 = v109;
    v112 = v111;
    v114 = v113;
    v116 = v115;
    objc_msgSend(v10, "sourceView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "convertRect:fromView:", v117, v110, v112, v114, v116);
    objc_msgSend(v99, "setFrame:");

    objc_msgSend(v99, "setAlpha:", 0.0);
    objc_msgSend(v186, "convertRect:fromView:", v100, v102, v104, v106, v108);
    v155 = v118;
    v156 = v119;
    v157 = v120;
    v158 = v121;
    objc_msgSend(v186, "addSubview:", v99);
    objc_msgSend(v16, "transitioningFrame");
    v123 = v122;
    v125 = v124;
    v127 = v126;
    v129 = v128;
    objc_msgSend(v100, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceRect");
    v131 = v130;
    v133 = v132;
    v135 = v134;
    v137 = v136;
    objc_msgSend(v10, "sourceView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v131;
    v77 = v159;
    objc_msgSend(v186, "convertRect:fromView:", v138, v139, v133, v135, v137);
    objc_msgSend(v98, "setFrame:");

    objc_msgSend(v98, "setAlpha:", 0.0);
    objc_msgSend(v186, "convertRect:fromView:", v100, v123, v125, v127, v129);
    v32 = v140;
    v33 = v141;
    v34 = v142;
    v35 = v143;
    objc_msgSend(v186, "addSubview:", v98);

  }
  v160 = (void *)MEMORY[0x1E0DC3F10];
  -[CNAvatarCardTransition transitionDuration:](v183, "transitionDuration:", v175);
  v145 = v144;
  if (-[CNAvatarCardTransition reversed](v183, "reversed"))
    v146 = 1.0;
  else
    v146 = 0.8;
  v197[0] = MEMORY[0x1E0C809B0];
  v197[1] = 3221225472;
  v197[2] = __44__CNAvatarCardTransition_animateTransition___block_invoke;
  v197[3] = &unk_1E20502C8;
  v206 = v167;
  v207 = v169;
  v208 = v171;
  v209 = v77;
  v198 = v74;
  v199 = v174;
  v200 = v173;
  v210 = v161;
  v211 = v162;
  v212 = v163;
  v213 = v165;
  v201 = v99;
  v214 = v155;
  v215 = v156;
  v216 = v157;
  v217 = v158;
  v218 = v32;
  v219 = v33;
  v220 = v34;
  v221 = v35;
  v202 = v98;
  v203 = v183;
  v204 = v10;
  v205 = v184;
  v187[0] = MEMORY[0x1E0C809B0];
  v187[1] = 3221225472;
  v187[2] = __44__CNAvatarCardTransition_animateTransition___block_invoke_2;
  v187[3] = &unk_1E2050318;
  v188 = v198;
  v189 = v16;
  v190 = v183;
  v191 = v204;
  v192 = v200;
  v193 = v201;
  v194 = v202;
  v195 = v205;
  v196 = v175;
  v147 = v175;
  v148 = v205;
  v149 = v202;
  v185 = v201;
  v150 = v200;
  v151 = v204;
  v152 = v166;
  v153 = v198;
  v154 = v174;
  objc_msgSend(v160, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v197, v187, v145, 0.0, v146, 0.0);

}

- (BOOL)reversed
{
  return self->_reversed;
}

- (void)setReversed:(BOOL)a3
{
  self->_reversed = a3;
}

- (UIPanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (UIViewControllerContextTransitioning)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIView)presentedView
{
  return self->_presentedView;
}

- (void)setPresentedView:(id)a3
{
  objc_storeStrong((id *)&self->_presentedView, a3);
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

void __44__CNAvatarCardTransition_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    objc_msgSend(v3, "setFrame:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
    objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    objc_msgSend(v4, "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184));
    objc_msgSend(*(id *)(a1 + 64), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216));
  }
  if ((objc_msgSend(*(id *)(a1 + 72), "reversed") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 88), "setAlpha:", 0.0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "dimmingView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

  }
}

void __44__CNAvatarCardTransition_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__CNAvatarCardTransition_animateTransition___block_invoke_3;
  v11 = &unk_1E20502F0;
  v12 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 88);
  objc_msgSend(v4, "performWithoutAnimation:", &v8);
  objc_msgSend(*(id *)(a1 + 96), "completeTransition:", a2, v8, v9, v10, v11);

}

uint64_t __44__CNAvatarCardTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "setTransitioningImageVisible:", 1);
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "reversed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "cardView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

  }
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 88), "setAlpha:", 1.0);
}

@end
