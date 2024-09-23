@implementation SUUIStackedPushTransition

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double MaxY;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
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
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double split;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  SUUIStackedBar *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  SUUIStackedBar *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  SUUIStackedBar *v80;
  double v81;
  double v82;
  id v83;
  id v84;
  id v85;
  SUUIStackedBar *v86;
  SUUIStackedBar *v87;
  id v88;
  id v89;
  id v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD v113[5];
  id v114;
  id v115;
  id v116;
  SUUIStackedBar *v117;
  SUUIStackedBar *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  double v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  SUUIStackedBar *v132;
  id v133;
  id v134;
  id v135;
  _QWORD v136[3];
  CGRect v137;
  CGRect v138;

  v136[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v4;
  objc_msgSend(v4, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v110);
  v9 = v8;
  v11 = v10;
  v105 = v13;
  v107 = v12;
  -[SUUIStackedBar setHidden:](self->_toBar, "setHidden:", 1);
  -[SUUIStackedBar frame](self->_toBar, "frame");
  MaxY = CGRectGetMaxY(v137);
  v135 = 0;
  SUUIGetImagesFromView(v5, 0, &v135, MaxY);
  v109 = v135;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v109);
  v16 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v109, "size");
  v18 = v17;
  objc_msgSend(v109, "size");
  v20 = (void *)objc_msgSend(v16, "initWithFrame:", 0.0, 0.0, v18, v19);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v21);

  v112 = v15;
  objc_msgSend(v7, "addSubview:", v15);
  v101 = v20;
  objc_msgSend(v7, "addSubview:", v20);
  objc_msgSend(v15, "frame");
  v23 = v22;
  v25 = v24;
  v26 = v11 + self->_split;
  objc_msgSend(v15, "setFrame:", v9, v26);
  v94 = v26;
  objc_msgSend(v20, "setFrame:", v9, v26, v23, v25);
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v28 = v11 + v27;
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v30 = v28 + v29;
  v31 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v33 = v32;
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v35 = v26 - (v33 + v34);
  v99 = v5;
  objc_msgSend(v5, "frame");
  objc_msgSend(v31, "setFrame:", v9, v35, v23);
  objc_msgSend(v7, "addSubview:", v31);
  objc_msgSend(v7, "sendSubviewToBack:", v31);
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v37 = v36;
  -[SUUIStackedBar frame](self->_toBar, "frame");
  v98 = v30 - (v37 + v38);
  v91 = v30;
  objc_msgSend(v5, "frame");
  objc_msgSend(v31, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v31, "addSubview:", v5);
  -[SUUIStackedBar setHidden:](self->_fromBar, "setHidden:", 1);
  split = self->_split;
  v133 = 0;
  v134 = 0;
  v40 = v6;
  v96 = v6;
  SUUIGetImagesFromView(v6, &v134, &v133, split);
  v103 = v134;
  v102 = v133;
  -[SUUIStackedBar setHidden:](self->_fromBar, "setHidden:", 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v103);
  objc_msgSend(v41, "frame");
  v97 = v11;
  v43 = v42;
  v45 = v44;
  objc_msgSend(v41, "setFrame:", v9, v11);
  objc_msgSend(v7, "addSubview:", v41);
  v95 = v30 - self->_split;
  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v102);
  objc_msgSend(v92, "frame");
  v47 = v46;
  v49 = v48;
  v138.origin.x = v9;
  v138.origin.y = v11;
  v138.size.width = v43;
  v138.size.height = v45;
  v50 = CGRectGetMaxY(v138);
  objc_msgSend(v92, "setFrame:", v9, v50, v47, v49);
  objc_msgSend(v7, "addSubview:", v92);
  v93 = v50 + v49;
  v51 = objc_alloc_init(SUUIStackedBar);
  -[SUUIStackedBar setSplitViewStyle:](v51, "setSplitViewStyle:", -[SUUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"));
  -[SUUIStackedBar setHidesStatusBar:](v51, "setHidesStatusBar:", 1);
  -[SUUIStackedBar items](self->_toBar, "items");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setAlwaysShowsBackButton:](v51, "setAlwaysShowsBackButton:", (unint64_t)objc_msgSend(v52, "count") > 1);

  -[SUUIStackedBar items](self->_toBar, "items");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "lastObject");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v54;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  SUUINavigationItemsShallowCopy(v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setItems:](v51, "setItems:", v56);

  -[SUUIStackedBar sizeToFit](v51, "sizeToFit");
  objc_msgSend(v7, "addSubview:", v51);
  -[SUUIStackedBar frame](v51, "frame");
  v58 = v57;
  -[SUUIStackedBar setFrame:](v51, "setFrame:", v9, v94 - v57, v23);
  -[SUUIStackedBar setAlpha:](v51, "setAlpha:", 0.0);
  v59 = objc_alloc_init(SUUIStackedBar);
  -[SUUIStackedBar setSplitViewStyle:](v59, "setSplitViewStyle:", -[SUUIStackedBar splitViewStyle](self->_fromBar, "splitViewStyle"));
  -[SUUIStackedBar items](self->_fromBar, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  SUUINavigationItemsShallowCopy(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setItems:](v59, "setItems:", v61);

  -[SUUIStackedBar frame](self->_fromBar, "frame");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  -[SUUIStackedBar superview](self->_fromBar, "superview");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", v70, v63, v65, v67, v69);
  -[SUUIStackedBar setFrame:](v59, "setFrame:");

  objc_msgSend(v7, "addSubview:", v59);
  objc_msgSend(v40, "removeFromSuperview");
  -[SUUIStackedBar setLastItemExpanded:animated:](v59, "setLastItemExpanded:animated:", 0, 1);
  v71 = SUUIStackedBarSpringAnimationForExpandCollapse(v51, v9, v91 - v58);
  v72 = SUUIStackedBarSpringAnimationForExpandCollapse(v31, v9, v98);
  v73 = SUUIStackedBarSpringAnimationForExpandCollapse(v112, v9, v91);
  v74 = SUUIStackedBarSpringAnimationForExpandCollapse(v101, v9, v91);
  v75 = SUUIStackedBarSpringAnimationForExpandCollapse(v41, v9, v95);
  v76 = SUUIStackedBarSpringAnimationForExpandCollapse(v92, v9, v93);
  v77 = (void *)MEMORY[0x24BEBDB00];
  v78 = MEMORY[0x24BDAC760];
  v130[0] = MEMORY[0x24BDAC760];
  v130[1] = 3221225472;
  v130[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke;
  v130[3] = &unk_2511F46D0;
  v79 = v41;
  v131 = v79;
  v80 = v51;
  v132 = v80;
  objc_msgSend(v77, "animateWithDuration:animations:", v130, 0.4);
  v100 = (void *)MEMORY[0x24BEBDB00];
  -[SUUIStackedPushTransition transitionDuration:](self, "transitionDuration:", v104);
  v82 = v81;
  v128[0] = v78;
  v128[1] = 3221225472;
  v128[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke_2;
  v128[3] = &unk_2511F47C0;
  v129 = v101;
  v113[0] = v78;
  v113[1] = 3221225472;
  v113[2] = __47__SUUIStackedPushTransition_animateTransition___block_invoke_3;
  v113[3] = &unk_2511F56A8;
  v113[4] = self;
  v114 = v31;
  v124 = v9;
  v125 = v97;
  v126 = v107;
  v127 = v105;
  v115 = v99;
  v116 = v7;
  v117 = v59;
  v118 = v80;
  v119 = v112;
  v120 = v79;
  v121 = v129;
  v122 = v92;
  v123 = v104;
  v108 = v104;
  v83 = v92;
  v106 = v129;
  v84 = v79;
  v85 = v112;
  v86 = v80;
  v87 = v59;
  v88 = v116;
  v89 = v99;
  v90 = v31;
  objc_msgSend(v100, "animateWithDuration:animations:completion:", v128, v113, v82);

}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __47__SUUIStackedPushTransition_animateTransition___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144));
  objc_msgSend(*(id *)(a1 + 56), "addSubview:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 88), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 104), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 112), "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.6;
}

- (double)split
{
  return self->_split;
}

- (void)setSplit:(double)a3
{
  self->_split = a3;
}

- (SUUIStackedBar)fromBar
{
  return self->_fromBar;
}

- (void)setFromBar:(id)a3
{
  objc_storeStrong((id *)&self->_fromBar, a3);
}

- (SUUIStackedBar)toBar
{
  return self->_toBar;
}

- (void)setToBar:(id)a3
{
  objc_storeStrong((id *)&self->_toBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBar, 0);
  objc_storeStrong((id *)&self->_fromBar, 0);
}

@end
