@implementation SUUIStackedPopTransition

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  SUUIStackedBar *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  SUUIStackedBar *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  double v72;
  id v73;
  id v74;
  id v75;
  id v76;
  SUUIStackedBar *v77;
  SUUIStackedBar *v78;
  id v79;
  id v80;
  void *v81;
  double MaxY;
  double split;
  dispatch_time_t when;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double rect;
  id recta;
  void *v98;
  void *v99;
  _QWORD block[4];
  id v101;
  id v102;
  SUUIStackedBar *v103;
  SUUIStackedBar *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  double v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  _QWORD v121[3];
  CGRect v122;

  v121[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v5;
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v4;
  v94 = v6;
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v11 = v10;
  v13 = v12;
  rect = v12;
  v88 = v15;
  v89 = v14;
  -[SUUIStackedBar setHidden:](self->_fromBar, "setHidden:", 1);
  -[SUUIStackedBar bounds](self->_fromBar, "bounds");
  objc_msgSend(v8, "convertRect:fromView:", self->_fromBar);
  v17 = v16;
  -[SUUIStackedBar frame](self->_fromBar, "frame");
  v120 = 0;
  SUUIGetImagesFromView(v8, 0, &v120, v17 + v18);
  v19 = v120;
  -[SUUIStackedBar setHidden:](self->_fromBar, "setHidden:", 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v19);
  v21 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v19, "size");
  v23 = v22;
  v93 = v19;
  objc_msgSend(v19, "size");
  v25 = (void *)objc_msgSend(v21, "initWithFrame:", 0.0, 0.0, v23, v24);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  objc_msgSend(v25, "setAlpha:", 0.0);
  objc_msgSend(v9, "addSubview:", v20);
  objc_msgSend(v9, "addSubview:", v25);
  objc_msgSend(v20, "frame");
  v28 = v27;
  v30 = v29;
  -[SUUIStackedBar frame](self->_fromBar, "frame");
  v32 = v13 + v31;
  -[SUUIStackedBar bounds](self->_fromBar, "bounds");
  v99 = v8;
  objc_msgSend(v8, "convertRect:fromView:", self->_fromBar);
  v34 = v32 + v33;
  v98 = v20;
  objc_msgSend(v20, "setFrame:", v11, v32 + v33, v28, v30);
  objc_msgSend(v25, "setFrame:", v11, v34, v28, v30);
  split = self->_split;
  -[SUUIStackedBar setHidden:](self->_toBar, "setHidden:", 1);
  v35 = self->_split;
  v118 = 0;
  v119 = 0;
  v92 = v7;
  SUUIGetImagesFromView(v7, &v119, &v118, v35);
  v36 = v119;
  v37 = v118;
  -[SUUIStackedBar setHidden:](self->_toBar, "setHidden:", 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v36);
  objc_msgSend(v38, "frame");
  v40 = v39;
  v42 = v41;
  v43 = v34 - self->_split;
  objc_msgSend(v38, "setFrame:", v11, v43);
  v85 = v38;
  objc_msgSend(v9, "addSubview:", v38);
  v86 = v37;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v37);
  objc_msgSend(v44, "frame");
  v46 = v45;
  v48 = v47;
  v122.origin.x = v11;
  v122.origin.y = rect;
  v122.size.width = v40;
  v122.size.height = v42;
  MaxY = CGRectGetMaxY(v122);
  objc_msgSend(v44, "setFrame:", v11, MaxY + v48, v46, v48);
  v49 = v44;
  objc_msgSend(v9, "addSubview:", v44);
  v50 = objc_alloc_init(SUUIStackedBar);
  -[SUUIStackedBar setSplitViewStyle:](v50, "setSplitViewStyle:", -[SUUIStackedBar splitViewStyle](self->_fromBar, "splitViewStyle"));
  -[SUUIStackedBar setHidesStatusBar:](v50, "setHidesStatusBar:", 1);
  -[SUUIStackedBar items](self->_fromBar, "items");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setAlwaysShowsBackButton:](v50, "setAlwaysShowsBackButton:", (unint64_t)objc_msgSend(v51, "count") > 1);

  -[SUUIStackedBar items](self->_fromBar, "items");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "lastObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  SUUINavigationItemsShallowCopy(v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setItems:](v50, "setItems:", v55);

  -[SUUIStackedBar sizeToFit](v50, "sizeToFit");
  objc_msgSend(v9, "addSubview:", v50);
  -[SUUIStackedBar frame](v50, "frame");
  v57 = v56;
  -[SUUIStackedBar setFrame:](v50, "setFrame:", v11, v34 - v56, v28);
  v87 = v36;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v36);
  objc_msgSend(v58, "setFrame:", v11, v43, v40, v42);
  objc_msgSend(v58, "setAlpha:", 0.0);
  objc_msgSend(v9, "addSubview:", v58);
  v59 = objc_alloc_init(SUUIStackedBar);
  -[SUUIStackedBar setSplitViewStyle:](v59, "setSplitViewStyle:", -[SUUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"));
  -[SUUIStackedBar items](self->_toBar, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  SUUINavigationItemsShallowCopy(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStackedBar setItems:](v59, "setItems:", v61);

  -[SUUIStackedBar setLastItemExpanded:](v59, "setLastItemExpanded:", 0);
  if (-[SUUIStackedBar splitViewStyle](self->_toBar, "splitViewStyle"))
    -[SUUIStackedBar setZeroHeightWhenFirstChildExpanded:](v59, "setZeroHeightWhenFirstChildExpanded:", 1);
  -[SUUIStackedBar frame](v59, "frame");
  -[SUUIStackedBar sizeThatFits:](v59, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  -[SUUIStackedBar frame](self->_fromBar, "frame");
  -[SUUIStackedBar setFrame:](v59, "setFrame:", v11);
  v81 = v9;
  objc_msgSend(v9, "addSubview:", v59);
  objc_msgSend(v99, "removeFromSuperview");
  -[SUUIStackedBar setLastItemExpanded:animated:](v59, "setLastItemExpanded:animated:", 1, 1);
  v62 = SUUIStackedBarSpringAnimationForExpandCollapse(v50, v11, rect + split - v57 + -1.0);
  v63 = SUUIStackedBarSpringAnimationForExpandCollapse(v98, v11, rect + split);
  v64 = SUUIStackedBarSpringAnimationForExpandCollapse(v25, v11, rect + split);
  v65 = SUUIStackedBarSpringAnimationForExpandCollapse(v85, v11, rect);
  v66 = SUUIStackedBarSpringAnimationForExpandCollapse(v58, v11, rect);
  v67 = SUUIStackedBarSpringAnimationForExpandCollapse(v49, v11, MaxY);
  v68 = (void *)MEMORY[0x24BEBDB00];
  v69 = MEMORY[0x24BDAC760];
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __46__SUUIStackedPopTransition_animateTransition___block_invoke;
  v115[3] = &unk_2511F46D0;
  v70 = v58;
  v116 = v70;
  v71 = v25;
  v117 = v71;
  objc_msgSend(v68, "animateWithDuration:animations:", v115, 0.2);
  -[SUUIStackedPopTransition transitionDuration:](self, "transitionDuration:", v90);
  when = dispatch_time(0, (uint64_t)(v72 * 1000000000.0));
  block[0] = v69;
  block[1] = 3221225472;
  block[2] = __46__SUUIStackedPopTransition_animateTransition___block_invoke_2;
  block[3] = &unk_2511F56D0;
  v111 = v11;
  v112 = rect;
  v113 = v89;
  v114 = v88;
  v101 = v92;
  v102 = v81;
  v103 = v59;
  v104 = v50;
  v105 = v98;
  v106 = v85;
  v107 = v70;
  v108 = v71;
  v109 = v49;
  v110 = v90;
  recta = v90;
  v73 = v49;
  v91 = v71;
  v74 = v70;
  v75 = v85;
  v76 = v98;
  v77 = v50;
  v78 = v59;
  v79 = v81;
  v80 = v92;
  dispatch_after(when, MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__SUUIStackedPopTransition_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __46__SUUIStackedPopTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 80), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 88), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 96), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 104), "completeTransition:", 1);
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
