@implementation NUIContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (void)performBatchUpdates:(id)a3
{
  -[NUIContainerView beginBatchUpdates]((uint64_t)self);
  (*((void (**)(id))a3 + 2))(a3);
  -[NUIContainerView endBatchUpdates]((uint64_t)self);
}

- (uint64_t)beginBatchUpdates
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 544);
    if ((~*(_DWORD *)(result + 544) & 0xF000000) == 0)
    {
      result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot nest more than 15 calls to performBatchUpdates:"));
      v2 = *(_QWORD *)(v1 + 544);
    }
    v3 = ((_DWORD)v2 + 0x1000000) & 0xF000000;
    *(_QWORD *)(v1 + 544) = v3 | v2 & 0xFFFFFFFFF0FFFFFFLL;
    if (v3 == 0x1000000)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v4 = *(void **)(v1 + 456);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v10;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
            if (objc_msgSend(v8, "_isContainerView"))
              -[NUIContainerView beginBatchUpdates](v8);
            ++v7;
          }
          while (v5 != v7);
          result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (double)_intrinsicSizeWithinSize:(double)a3
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  if (!a1)
    return 0.0;
  *(_BYTE *)(a1 + 416) = objc_msgSend((id)a1, "effectiveUserInterfaceLayoutDirection") == 1;
  v6 = *(_QWORD *)(a1 + 544);
  v7 = ((v6 >> 28) & 3) << 28;
  v8 = 0x10000000;
  if (((v6 >> 28) & 3) != 0)
    v8 = ((v6 >> 28) & 3) << 28;
  *(_QWORD *)(a1 + 544) = v8 | v6 & 0xFFFFFFFFCFFFFFFFLL;
  v9 = (id)objc_msgSend((id)a1, "delegate");
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 544);
  if ((v11 & 0x1000000000000) != 0)
  {
    objc_msgSend(v9, "containerView:willMeasureArrangedSubviewsFittingSize:forReason:", a1, 0, a2, a3);
    v11 = *(_QWORD *)(a1 + 544);
  }
  v12 = v11 & 0x30000000;
  if (((v11 >> 28) & 2) == 0)
    v12 = 0x20000000;
  v13 = v12 | v11 & 0xFFFFFFFFCFFFFFFFLL;
  *(_QWORD *)(a1 + 544) = v13;
  if (fabs(a2) < 0.001)
    a2 = 3.40282347e38;
  if (fabs(a3) < 0.001)
    a3 = 3.40282347e38;
  if ((v11 & 0x180000000000) != 0)
  {
    objc_msgSend((id)a1, "effectiveLayoutMargins");
    v16 = v14 + v15;
    a2 = a2 - (v14 + v15);
    v19 = v17 + v18;
    a3 = a3 - (v17 + v18);
    v13 = *(_QWORD *)(a1 + 544);
  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 8) + *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    v19 = *MEMORY[0x1E0CEB4B0] + *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  }
  *(_QWORD *)(a1 + 544) = v13 & 0xFFFFFFFF3FFFFFFFLL;
  objc_msgSend((id)a1, "calculateArrangedSizeFittingSize:", a2, a3);
  if ((*(_QWORD *)(a1 + 544) & 0x180000000000) != 0)
    v22 = v19;
  else
    v22 = -0.0;
  v23 = v21 + v22;
  if ((*(_QWORD *)(a1 + 544) & 0x180000000000) != 0)
    v24 = v16;
  else
    v24 = -0.0;
  v25 = v20 + v24;
  if (v20 + v24 < 0.0 || v23 < 0.0)
  {
    if (*MEMORY[0x1E0C9D820] > v25)
      v25 = *MEMORY[0x1E0C9D820];
    LODWORD(v26) = 1;
  }
  else
  {
    v26 = *(_QWORD *)&v20 >> 63;
  }
  objc_msgSend((id)a1, "_currentScreenScale");
  if (v27 == 1.0)
  {
    v28 = floor(v25);
    v29 = ceil(v25);
    if (v25 - v28 >= 0.001)
      v30 = v29;
    else
      v30 = v28;
  }
  else
  {
    v31 = floor(v25 * v27);
    v32 = ceil(v25 * v27);
    if (v25 * v27 - v31 < 0.001)
      v32 = v31;
    v30 = v32 / v27;
  }
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a1 + 544) & 0xFFFFFFFFCFFFFFFFLL | v7;

  if ((_DWORD)v26)
    objc_msgSend((id)a1, "setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached");
  return v30;
}

- (void)layoutSubviews
{
  NUIContainerViewDelegate *v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v5;
  uint64_t v6;
  $E75A57F832BD0FF3084D204B7E402DB5 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  NSObject *v14;
  NSString *v15;
  $E75A57F832BD0FF3084D204B7E402DB5 v16;
  objc_super v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  NUIContainerView *v21;
  uint64_t v22;
  CGSize v23;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[NUIContainerView delegate](self, "delegate");
  v17.receiver = self;
  v17.super_class = (Class)NUIContainerView;
  -[NUIContainerView layoutSubviews](&v17, sel_layoutSubviews);
  self->_isRTL = -[NUIContainerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  containerFlags = self->_containerFlags;
  v5 = ((*(unint64_t *)&containerFlags >> 28) & 3) << 28;
  v6 = 0x10000000;
  if (((*(unint64_t *)&containerFlags >> 28) & 3) != 0)
    v6 = ((*(unint64_t *)&containerFlags >> 28) & 3) << 28;
  v7 = ($E75A57F832BD0FF3084D204B7E402DB5)(v6 | *(_QWORD *)&containerFlags & 0xFFFFFFFFCFFFFFFFLL);
  self->_containerFlags = v7;
  if ((*(_QWORD *)&containerFlags & 0x1000000000000) != 0)
  {
    -[NUIContainerView bounds](self, "bounds");
    -[NUIContainerViewDelegate containerView:willMeasureArrangedSubviewsFittingSize:forReason:](v3, "containerView:willMeasureArrangedSubviewsFittingSize:forReason:", self, 1, v8, v9);
    v7 = self->_containerFlags;
  }
  self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(unint64_t *)&v7 | 0x30000000);
  -[NUIContainerView effectiveLayoutBounds](self, "effectiveLayoutBounds");
  v12 = v11;
  v13 = v10;
  *(_QWORD *)&self->_containerFlags &= 0xFFFFFFFF3FFFFFFFLL;
  if (v11 <= 0.0 || v10 <= 0.0)
  {
    if (_NUIIsDebuggerAttached::onceToken != -1)
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    if (_NUIIsDebuggerAttached::isDebugged)
    {
      if (_NUILog::onceToken != -1)
        dispatch_once(&_NUILog::onceToken, &__block_literal_global_1);
      v14 = _NUILog::log;
      if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_INFO))
      {
        v23.width = v12;
        v23.height = v13;
        v15 = NSStringFromCGSize(v23);
        *(_DWORD *)buf = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = self;
        _os_log_impl(&dword_1AA816000, v14, OS_LOG_TYPE_INFO, "Skipping layout in size %@ for view: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    -[NUIContainerView layoutArrangedSubviewsInBounds:](self, "layoutArrangedSubviewsInBounds:");
  }
  v16 = self->_containerFlags;
  self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&v16 & 0xFFFFFFFFCFFFFFFFLL | v5);
  if ((*(_QWORD *)&v16 & 0x4000000000000) != 0)
    -[NUIContainerViewDelegate containerViewDidLayoutArrangedSubviews:](v3, "containerViewDidLayoutArrangedSubviews:", self);

  -[NUIContainerView _updateDebugBoundingBoxesIfNeeded]((uint64_t)self);
}

- (NUIContainerViewDelegate)delegate
{
  return (NUIContainerViewDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (CGRect)effectiveLayoutBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[NUIContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x18) != 0)
  {
    -[NUIContainerView effectiveLayoutMargins](self, "effectiveLayoutMargins");
    v4 = v4 + v11;
    v6 = v6 + v12;
    v8 = v8 - (v11 + v13);
    v10 = v10 - (v12 + v14);
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (uint64_t)_updateDebugBoundingBoxesIfNeeded
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v4;
  void *v5;
  void **v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  void **v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void **v62;
  _QWORD *v63;
  unint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v86;
  void **v87;
  _QWORD *v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  void **v105;
  _QWORD *v106;
  unint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  double v118;
  id obj;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  uint64_t v126;
  CGRect v127;
  CGRect v128;

  v126 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(void ***)(result + 520);
    v3 = *(void ***)(result + 528);
    if (v2 != v3)
    {
      do
      {
        v4 = *v2++;
        result = objc_msgSend(v4, "removeFromSuperlayer");
      }
      while (v2 != v3);
      v2 = *(void ***)(v1 + 520);
    }
    *(_QWORD *)(v1 + 528) = v2;
    if ((*(_BYTE *)(v1 + 549) & 2) != 0)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor"), "colorWithAlphaComponent:"), "CGColor"));
      objc_msgSend(v5, "setBorderWidth:", 1.0);
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:atIndex:", v5, 0);
      v6 = (void **)(v1 + 520);
      v7 = *(_QWORD **)(v1 + 528);
      v8 = *(_QWORD *)(v1 + 536);
      if ((unint64_t)v7 >= v8)
      {
        v10 = ((char *)v7 - (_BYTE *)*v6) >> 3;
        if ((unint64_t)(v10 + 1) >> 61)
          goto LABEL_119;
        v11 = v8 - (_QWORD)*v6;
        v12 = v11 >> 2;
        if (v11 >> 2 <= (unint64_t)(v10 + 1))
          v12 = v10 + 1;
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v12;
        if (v13)
          v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 536, v13);
        else
          v14 = 0;
        v15 = &v14[8 * v10];
        v16 = &v14[8 * v13];
        *(_QWORD *)v15 = v5;
        v9 = v15 + 8;
        v18 = (char *)*v6;
        v17 = *(char **)(v1 + 528);
        if (v17 != *v6)
        {
          do
          {
            v19 = *((_QWORD *)v17 - 1);
            v17 -= 8;
            *((_QWORD *)v15 - 1) = v19;
            v15 -= 8;
          }
          while (v17 != v18);
          v17 = (char *)*v6;
        }
        *v6 = v15;
        *(_QWORD *)(v1 + 528) = v9;
        *(_QWORD *)(v1 + 536) = v16;
        if (v17)
          operator delete(v17);
      }
      else
      {
        *v7 = v5;
        v9 = v7 + 1;
      }
      *(_QWORD *)(v1 + 528) = v9;
      if ((*(_BYTE *)(v1 + 549) & 0x18) == 0)
        goto LABEL_41;
      objc_msgSend((id)v1, "effectiveLayoutBounds");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      objc_msgSend((id)v1, "bounds");
      v128.origin.x = v28;
      v128.origin.y = v29;
      v128.size.width = v30;
      v128.size.height = v31;
      v127.origin.x = v21;
      v127.origin.y = v23;
      v127.size.width = v25;
      v127.size.height = v27;
      if (CGRectEqualToRect(v127, v128))
      {
LABEL_41:
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        obj = (id)objc_msgSend((id)v1, "subviews");
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
        v47 = result;
        if (result)
        {
          v120 = *(_QWORD *)v122;
          v48 = (double *)MEMORY[0x1E0CEB4B0];
          v118 = 0.400000006;
          do
          {
            v49 = 0;
            do
            {
              if (*(_QWORD *)v122 != v120)
                objc_enumerationMutation(obj);
              v50 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v49);
              if (objc_msgSend((id)objc_msgSend((id)v1, "visibleArrangedSubviews", *(_QWORD *)&v118), "indexOfObject:", v50) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v51 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
                objc_msgSend(v50, "frame");
                v53 = v52;
                v55 = v54;
                v57 = v56;
                v59 = v58;
                objc_msgSend(v51, "setFrame:");
                if (objc_msgSend(v50, "_wantsConstraintBasedLayout"))
                  v60 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
                else
                  v60 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
                v61 = v60;
                objc_msgSend(v51, "setBorderColor:", objc_msgSend((id)objc_msgSend(v60, "colorWithAlphaComponent:", 0.699999988), "CGColor"));
                objc_msgSend(v51, "setBorderWidth:", 1.0);
                objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:above:", v51, objc_msgSend(v50, "layer"));
                v62 = (void **)(v1 + 520);
                v63 = *(_QWORD **)(v1 + 528);
                v64 = *(_QWORD *)(v1 + 536);
                if ((unint64_t)v63 >= v64)
                {
                  v66 = ((char *)v63 - (_BYTE *)*v62) >> 3;
                  if ((unint64_t)(v66 + 1) >> 61)
                    abort();
                  v67 = v64 - (_QWORD)*v62;
                  v68 = v67 >> 2;
                  if (v67 >> 2 <= (unint64_t)(v66 + 1))
                    v68 = v66 + 1;
                  if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8)
                    v69 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v69 = v68;
                  if (v69)
                    v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 536, v69);
                  else
                    v70 = 0;
                  v71 = &v70[8 * v66];
                  *(_QWORD *)v71 = v51;
                  v65 = v71 + 8;
                  v73 = (char *)*v62;
                  v72 = *(char **)(v1 + 528);
                  if (v72 != *v62)
                  {
                    do
                    {
                      v74 = *((_QWORD *)v72 - 1);
                      v72 -= 8;
                      *((_QWORD *)v71 - 1) = v74;
                      v71 -= 8;
                    }
                    while (v72 != v73);
                    v72 = (char *)*v62;
                  }
                  *v62 = v71;
                  *(_QWORD *)(v1 + 528) = v65;
                  *(_QWORD *)(v1 + 536) = &v70[8 * v69];
                  if (v72)
                    operator delete(v72);
                }
                else
                {
                  *v63 = v51;
                  v65 = v63 + 1;
                }
                *(_QWORD *)(v1 + 528) = v65;
                objc_msgSend(v50, "effectiveAlignmentRectInsets");
                v78 = v75;
                v80 = v79;
                v81 = v76;
                v82 = v77;
                if (v79 != v48[1] || v75 != *v48 || v77 != v48[3] || v76 != v48[2])
                {
                  v86 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
                  objc_msgSend(v86, "setFrame:", v53 + v80, v55 + v78, v57 - (v80 + v82), v59 - (v78 + v81));
                  objc_msgSend(v86, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "brownColor"), "colorWithAlphaComponent:", 0.699999988), "CGColor"));
                  objc_msgSend(v86, "setBorderWidth:", 1.0);
                  objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:below:", v86, v51);
                  v87 = (void **)(v1 + 520);
                  v88 = *(_QWORD **)(v1 + 528);
                  v89 = *(_QWORD *)(v1 + 536);
                  if ((unint64_t)v88 >= v89)
                  {
                    v91 = ((char *)v88 - (_BYTE *)*v87) >> 3;
                    if ((unint64_t)(v91 + 1) >> 61)
                      abort();
                    v92 = v89 - (_QWORD)*v87;
                    v93 = v92 >> 2;
                    if (v92 >> 2 <= (unint64_t)(v91 + 1))
                      v93 = v91 + 1;
                    if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8)
                      v94 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v94 = v93;
                    if (v94)
                      v95 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 536, v94);
                    else
                      v95 = 0;
                    v96 = &v95[8 * v91];
                    *(_QWORD *)v96 = v86;
                    v90 = v96 + 8;
                    v98 = (char *)*v87;
                    v97 = *(char **)(v1 + 528);
                    if (v97 != *v87)
                    {
                      do
                      {
                        v99 = *((_QWORD *)v97 - 1);
                        v97 -= 8;
                        *((_QWORD *)v96 - 1) = v99;
                        v96 -= 8;
                      }
                      while (v97 != v98);
                      v97 = (char *)*v87;
                    }
                    *v87 = v96;
                    *(_QWORD *)(v1 + 528) = v90;
                    *(_QWORD *)(v1 + 536) = &v95[8 * v94];
                    if (v97)
                      operator delete(v97);
                  }
                  else
                  {
                    *v88 = v86;
                    v90 = v88 + 1;
                  }
                  *(_QWORD *)(v1 + 528) = v90;
                }
                if (objc_msgSend((id)v1, "needsBaselineDebugBoundingBoxesForArrangedSubview:", v50))
                {
                  objc_msgSend(v50, "effectiveFirstBaselineOffsetFromTop");
                  v101 = v100;
                  objc_msgSend(v50, "effectiveBaselineOffsetFromBottom");
                  v103 = v102;
                  if (v101 != 0.0 || v102 != 0.0)
                  {
                    v104 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
                    objc_msgSend(v104, "setFrame:", v53 + 0.0, v55 + v101, v57, v59 - (v101 + v103 + -1.0));
                    objc_msgSend(v104, "setBorderColor:", objc_msgSend((id)objc_msgSend(v61, "colorWithAlphaComponent:", v118), "CGColor"));
                    objc_msgSend(v104, "setBorderWidth:", 1.0);
                    objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:above:", v104, v51);
                    v105 = (void **)(v1 + 520);
                    v106 = *(_QWORD **)(v1 + 528);
                    v107 = *(_QWORD *)(v1 + 536);
                    if ((unint64_t)v106 >= v107)
                    {
                      v109 = ((char *)v106 - (_BYTE *)*v105) >> 3;
                      if ((unint64_t)(v109 + 1) >> 61)
                        abort();
                      v110 = v107 - (_QWORD)*v105;
                      v111 = v110 >> 2;
                      if (v110 >> 2 <= (unint64_t)(v109 + 1))
                        v111 = v109 + 1;
                      if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8)
                        v112 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v112 = v111;
                      if (v112)
                        v113 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 536, v112);
                      else
                        v113 = 0;
                      v114 = &v113[8 * v109];
                      *(_QWORD *)v114 = v104;
                      v108 = v114 + 8;
                      v116 = (char *)*v105;
                      v115 = *(char **)(v1 + 528);
                      if (v115 != *v105)
                      {
                        do
                        {
                          v117 = *((_QWORD *)v115 - 1);
                          v115 -= 8;
                          *((_QWORD *)v114 - 1) = v117;
                          v114 -= 8;
                        }
                        while (v115 != v116);
                        v115 = (char *)*v105;
                      }
                      *v105 = v114;
                      *(_QWORD *)(v1 + 528) = v108;
                      *(_QWORD *)(v1 + 536) = &v113[8 * v112];
                      if (v115)
                        operator delete(v115);
                    }
                    else
                    {
                      *v106 = v104;
                      v108 = v106 + 1;
                    }
                    *(_QWORD *)(v1 + 528) = v108;
                  }
                }
              }
              ++v49;
            }
            while (v49 != v47);
            result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
            v47 = result;
          }
          while (result);
        }
        return result;
      }
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      objc_msgSend(v32, "setFrame:", v21, v23, v25, v27);
      objc_msgSend(v32, "setBorderColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor"), "colorWithAlphaComponent:", 0.400000006), "CGColor"));
      objc_msgSend(v32, "setBorderWidth:", 1.0);
      objc_msgSend((id)objc_msgSend((id)v1, "layer"), "insertSublayer:atIndex:", v32, 1);
      v33 = (void **)(v1 + 520);
      v34 = *(_QWORD **)(v1 + 528);
      v35 = *(_QWORD *)(v1 + 536);
      if ((unint64_t)v34 < v35)
      {
        *v34 = v32;
        v36 = v34 + 1;
LABEL_40:
        *(_QWORD *)(v1 + 528) = v36;
        goto LABEL_41;
      }
      v37 = ((char *)v34 - (_BYTE *)*v33) >> 3;
      if (!((unint64_t)(v37 + 1) >> 61))
      {
        v38 = v35 - (_QWORD)*v33;
        v39 = v38 >> 2;
        if (v38 >> 2 <= (unint64_t)(v37 + 1))
          v39 = v37 + 1;
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
          v40 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v40 = v39;
        if (v40)
          v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(v1 + 536, v40);
        else
          v41 = 0;
        v42 = &v41[8 * v37];
        v43 = &v41[8 * v40];
        *(_QWORD *)v42 = v32;
        v36 = v42 + 8;
        v45 = (char *)*v33;
        v44 = *(char **)(v1 + 528);
        if (v44 != *v33)
        {
          do
          {
            v46 = *((_QWORD *)v44 - 1);
            v44 -= 8;
            *((_QWORD *)v42 - 1) = v46;
            v42 -= 8;
          }
          while (v44 != v45);
          v44 = (char *)*v33;
        }
        *v33 = v42;
        *(_QWORD *)(v1 + 528) = v36;
        *(_QWORD *)(v1 + 536) = v43;
        if (v44)
          operator delete(v44);
        goto LABEL_40;
      }
LABEL_119:
      abort();
    }
  }
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *p_pair1;
  unint64_t v29;
  BOOL v30;
  char **v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double MaxX;
  double v55;
  double v56;
  double v57;
  double v58;
  double MinX;
  double v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "effectiveAlignmentRectInsets");
  if (v11 != *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    || v10 != *MEMORY[0x1E0CEB4B0]
    || v13 != *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    || v12 != *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    x = x - v11;
    y = y - v10;
    width = width - (-v13 - v11);
    height = height - (-v12 - v10);
  }
  -[NUIContainerView _currentScreenScale](self, "_currentScreenScale");
  v18 = v17;
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x80) != 0)
  {
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v19 = NUIRectRoundToScale(v61, v18);
    -[NUIContainerViewDelegate containerView:layoutFrameForArrangedSubview:withProposedFrame:](-[NUIContainerView delegate](self, "delegate"), "containerView:layoutFrameForArrangedSubview:withProposedFrame:", self, a3, v19, v20, v21, v22);
    x = v23;
    y = v24;
    width = v25;
    height = v26;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_25;
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v29 = *((_QWORD *)left + 4);
    v30 = v29 >= (unint64_t)a3;
    if (v29 >= (unint64_t)a3)
      v31 = (char **)left;
    else
      v31 = (char **)(left + 8);
    if (v30)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    left = *v31;
  }
  while (*v31);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
  {
    x = x + *(double *)&p_pair1[5].__value_.__left_;
    y = y + *(double *)&p_pair1[6].__value_.__left_;
  }
  else
  {
LABEL_25:
    if (_NUILog::onceToken != -1)
      dispatch_once(&_NUILog::onceToken, &__block_literal_global_1);
    v32 = _NUILog::log;
    if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_ERROR))
      -[NUIContainerView(NUISubclassHelpers) layoutFrameForArrangedSubview:withProposedContentFrame:].cold.1((uint64_t)a3, v32, v33, v34, v35, v36, v37, v38);
  }
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v39 = NUIRectRoundToScale(v62, v18);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  if (self->_isRTL)
  {
    -[NUIContainerView effectiveLayoutBounds](self, "effectiveLayoutBounds");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v63.origin.x = v39;
    v63.origin.y = v41;
    v63.size.width = v43;
    v63.size.height = v45;
    MinX = CGRectGetMinX(v63);
    v64.origin.x = v47;
    v64.origin.y = v49;
    v64.size.width = v51;
    v64.size.height = v53;
    v60 = MinX - CGRectGetMinX(v64);
    v65.origin.x = v47;
    v65.origin.y = v49;
    v65.size.width = v51;
    v65.size.height = v53;
    MaxX = CGRectGetMaxX(v65);
    v66.origin.x = v39;
    v66.origin.y = v41;
    v66.size.width = v43;
    v66.size.height = v45;
    v39 = MaxX - (v60 + CGRectGetWidth(v66));
  }
  v55 = v39;
  v56 = v41;
  v57 = v43;
  v58 = v45;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

- (uint64_t)endBatchUpdates
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (_QWORD *)result;
    v2 = *(_QWORD *)(result + 544);
    *(_QWORD *)(result + 544) = ((_DWORD)v2 + 251658240) & 0xF000000 | v2 & 0xFFFFFFFFF0FFFFFFLL;
    if ((((_DWORD)v2 + 251658240) & 0xF000000) == 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v3 = *(void **)(result + 456);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
            if (objc_msgSend(v8, "_isContainerView"))
              -[NUIContainerView endBatchUpdates](v8);
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v5);
      }
      return objc_msgSend(v1, "setNeedsInvalidation:", (uint64_t)(v1[68] << 40) >> 56);
    }
  }
  return result;
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v8;
  uint64_t v9;
  int containerFlags;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  id *v20;

  v19 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
    {
LABEL_12:
      if (-[NSMutableArray count](self->_arrangedSubviews, "count") < a4)
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
        if (v11)
          v12 = (const __CFString *)v11;
        else
          v12 = CFSTR("<Unknown File>");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stackIndex <= _arrangedSubviews.count"));
      }
      goto LABEL_13;
    }
    goto LABEL_47;
  }
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged && !a3)
  {
LABEL_47:
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
    if (v17)
      v18 = (const __CFString *)v17;
    else
      v18 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_12;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
    goto LABEL_12;
LABEL_13:
  -[NUIContainerView _addAsSubviewIfNeeded:]((uint64_t)self, a3);
  v8 = -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    if (v8 == a4)
      goto LABEL_24;
    -[NSMutableArray removeObjectAtIndex:](self->_arrangedSubviews, "removeObjectAtIndex:", v8);
    -[NUIContainerView didRemoveArrangedSubview:atIndex:](self, "didRemoveArrangedSubview:atIndex:", a3, v9);
    if (-[NSMutableArray count](self->_arrangedSubviews, "count") < a4)
      a4 = -[NSMutableArray count](self->_arrangedSubviews, "count");
    -[NSMutableArray insertObject:atIndex:](self->_arrangedSubviews, "insertObject:atIndex:", a3, a4);
    -[NUIContainerView didInsertArrangedSubview:atIndex:](self, "didInsertArrangedSubview:atIndex:", a3, a4);
LABEL_23:

    self->_visibleArrangedSubviews = 0;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
    goto LABEL_24;
  }
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 3, 0);
  -[NSMutableArray insertObject:atIndex:](self->_arrangedSubviews, "insertObject:atIndex:", a3, a4);
  v20 = &v19;
  std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>((uint64_t **)&self->_arrangedSubviewInfo, (unint64_t *)&v19, (uint64_t)&std::piecewise_construct, &v20);
  if ((*((_BYTE *)&self->_containerFlags + 3) & 0xF) != 0 && objc_msgSend(v19, "_isContainerView"))
    -[NUIContainerView beginBatchUpdates]((uint64_t)v19);
  -[NUIContainerView didInsertArrangedSubview:atIndex:](self, "didInsertArrangedSubview:atIndex:", v19, a4);
  if (!objc_msgSend(v19, "isHidden"))
    goto LABEL_23;
  ++*(_WORD *)&self->_containerFlags;
LABEL_24:
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_28;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_28:
    containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v13)
        v14 = (const __CFString *)v13;
      else
        v14 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 627, CFSTR("Hidden count mismatch"));
    }
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_33;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_33:
    if (-[NSMutableArray count](self->_arrangedSubviews, "count") != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v15)
        v16 = (const __CFString *)v15;
      else
        v16 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 628, CFSTR("Info caount mismatch"));
    }
  }
}

- (BOOL)setNeedsInvalidation:(int64_t)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v5;
  unint64_t v7;
  $E75A57F832BD0FF3084D204B7E402DB5 v8;
  objc_super v9;

  containerFlags = self->_containerFlags;
  v5 = *(_DWORD *)&containerFlags & 0xF000000;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | ((unint64_t)a3 << 16));
  }
  else
  {
    if (a3 >= 0)
      v7 = a3;
    else
      v7 = 15;
    -[NUIContainerView invalidateInternalStateForInvalidation:](self, "invalidateInternalStateForInvalidation:", v7);
    v8 = self->_containerFlags;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&v8 & 0xFFFFFFFFFF00FFFFLL);
    if (v7)
    {
      if (v7 == 1)
      {
        -[NUIContainerView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&v8 & 0xFFFFFEFFFF00FFFFLL);
        self->_firstBaselineView = 0;
        self->_lastBaselineView = 0;
        v9.receiver = self;
        v9.super_class = (Class)NUIContainerView;
        -[NUIContainerView invalidateIntrinsicContentSize](&v9, sel_invalidateIntrinsicContentSize);
        -[NUIContainerView setNeedsLayout](self, "setNeedsLayout");
        if (v7 >= 4)
          *(_QWORD *)&self->_containerFlags &= 0xFFFFFFFCFFFFFFFFLL;
      }
      if (_NUIIsDebuggerAttached::onceToken != -1)
        dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      if (_NUIIsDebuggerAttached::isDebugged)
        -[NUIContainerView _verifyInternalConsistencyWarningOnly:]((uint64_t)self, 0);
    }
  }
  return v5 == 0;
}

- (void)setNeedsLayout
{
  objc_super v3;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerView;
  -[NUIContainerView setNeedsLayout](&v3, sel_setNeedsLayout);
}

- (void)_assertNotInLayoutPass:(uint64_t)a1
{
  uint64_t v2;
  NSObject *v3;

  if (a1)
  {
    if (_NUIIsDebuggerAttached::onceToken != -1)
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    if (_NUIIsDebuggerAttached::isDebugged && (*(_BYTE *)(a1 + 547) & 0x20) != 0)
    {
      v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ called while in a layout or measurement pass."), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), "objectAtIndex:", 1));
      if (_NUILog::onceToken != -1)
        dispatch_once(&_NUILog::onceToken, &__block_literal_global_1);
      v3 = _NUILog::log;
      if (os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_DEBUG))
        -[NUIContainerView _assertNotInLayoutPass:].cold.1(v2, v3);
    }
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v7;
  objc_super v8;

  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  if (-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:", a3))
  {
    v7 = (*(_QWORD *)&self->_containerFlags >> 28) & 3;
    if (v7)
    {
      if (v7 == 3)
        -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
    }
    else
    {
      -[NUIContainerView intrinsicContentSizeDidInvalidateForArrangedSubview:](self, "intrinsicContentSizeDidInvalidateForArrangedSubview:", a3);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NUIContainerView;
    -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v8, sel__intrinsicContentSizeInvalidatedForChildView_, a3);
  }
}

- (void)intrinsicContentSizeDidInvalidateForArrangedSubview:(id)a3
{
  if (a3)
  {
    if ((objc_msgSend(a3, "isHidden") & 1) == 0)
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (uint64_t)_addAsSubviewIfNeeded:(uint64_t)result
{
  _BYTE *v3;

  if (result)
  {
    v3 = (_BYTE *)result;
    result = objc_msgSend(a2, "superview");
    if ((_BYTE *)result != v3)
    {
      objc_msgSend(a2, "_setHostsLayoutEngine:", 1);
      result = objc_msgSend(v3, "addSubview:", a2);
    }
    if ((v3[548] & 0x20) != 0)
      return objc_msgSend(a2, "setHidden:", 0);
  }
  return result;
}

- (UIEdgeInsets)effectiveLayoutMargins
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if ((*((_BYTE *)&self->_containerFlags + 5) & 1) == 0)
  {
    -[NUIContainerView layoutMargins](self, "layoutMargins");
    v5 = v4;
    v6 = v3;
    v8 = v7;
    v10 = v9;
    if (v3 <= -1048576.0)
    {
      if (v3 == -1.79769313e308)
        v11 = 1.0;
      else
        v11 = (v3 + 1048576.0) * -0.00390625;
      objc_msgSend(-[NSArray firstObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "firstObject"), "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 2, (*(_QWORD *)&self->_containerFlags >> 42) & 1, v11);
      v6 = v12;
    }
    if (v10 <= -1048576.0)
    {
      if (v10 == -1.79769313e308)
        v13 = 1.0;
      else
        v13 = (v10 + 1048576.0) * -0.00390625;
      objc_msgSend(-[NSArray firstObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "firstObject"), "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 2, (*(_QWORD *)&self->_containerFlags >> 42) & 1, v13);
      v10 = v14;
    }
    if (v5 <= -1048576.0)
    {
      if (v5 == -1.79769313e308)
        v16 = 1.0;
      else
        v16 = (v5 + 1048576.0) * -0.00390625;
      v15 = -[NUIContainerView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout");
      objc_msgSend(v15, "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 1, (*(_QWORD *)&self->_containerFlags >> 42) & 1, v16);
      v5 = v17;
      if ((*((_BYTE *)&self->_containerFlags + 5) & 4) == 0)
      {
LABEL_21:
        if (v8 <= -1048576.0)
        {
          if (v8 == -1.79769313e308)
            v20 = 1.0;
          else
            v20 = (v8 + 1048576.0) * -0.00390625;
          v19 = -[NUIContainerView viewForLastBaselineLayout](self, "viewForLastBaselineLayout");
          objc_msgSend(v19, "systemSpacingToSuperView:edge:baselineRelative:multiplier:", self, 4, (*(_QWORD *)&self->_containerFlags >> 42) & 1, v20);
          v8 = v21;
          if ((*((_BYTE *)&self->_containerFlags + 5) & 4) == 0)
            goto LABEL_29;
        }
        else
        {
          if ((*((_BYTE *)&self->_containerFlags + 5) & 0x10) == 0)
          {
LABEL_29:
            self->_effectiveLayoutMargins.top = v5;
            self->_effectiveLayoutMargins.left = v6;
            self->_effectiveLayoutMargins.bottom = v8;
            self->_effectiveLayoutMargins.right = v10;
            *(_QWORD *)&self->_containerFlags |= 0x10000000000uLL;
            goto LABEL_30;
          }
          v19 = -[NUIContainerView viewForLastBaselineLayout](self, "viewForLastBaselineLayout");
        }
        objc_msgSend(v19, "effectiveBaselineOffsetFromBottom");
        v8 = v8 - v22;
        goto LABEL_29;
      }
    }
    else
    {
      if ((*((_BYTE *)&self->_containerFlags + 5) & 0x10) == 0)
        goto LABEL_21;
      v15 = -[NUIContainerView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout");
    }
    objc_msgSend(v15, "effectiveFirstBaselineOffsetFromTop");
    v5 = v5 - v18;
    goto LABEL_21;
  }
LABEL_30:
  top = self->_effectiveLayoutMargins.top;
  left = self->_effectiveLayoutMargins.left;
  bottom = self->_effectiveLayoutMargins.bottom;
  right = self->_effectiveLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)mustRestartMeasurement
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;

  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x200000000000) != 0)
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFDFFFFFFFFFFFLL);
  return (*(unint64_t *)&containerFlags >> 45) & 1;
}

- (BOOL)_isContainerView
{
  return 1;
}

- (NSDirectionalEdgeInsets)minimumSpacingAdjacentToView:(id)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *p_pair1;
  unint64_t v5;
  BOOL v6;
  char **v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDirectionalEdgeInsets result;

  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_12;
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v5 = *((_QWORD *)left + 4);
    v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3)
      v7 = (char **)left;
    else
      v7 = (char **)(left + 8);
    if (v6)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
  {
    v8 = *(double *)&p_pair1[7].__value_.__left_;
    v9 = *(double *)&p_pair1[8].__value_.__left_;
    v10 = *(double *)&p_pair1[9].__value_.__left_;
    v11 = *(double *)&p_pair1[10].__value_.__left_;
  }
  else
  {
LABEL_12:
    v8 = 1.79769313e308;
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
    v11 = 1.79769313e308;
  }
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  CGSize result;

  if (fabs(a3.width) >= 0.001)
    width = a3.width;
  else
    width = 3.40282347e38;
  if (fabs(a3.height) >= 0.001)
    height = a3.height;
  else
    height = 3.40282347e38;
  objc_msgSend(a4, "effectiveAlignmentRectInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v14 + width + v10;
  v17 = v12 + height + v8;
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x40) != 0)
  {
    -[NUIContainerViewDelegate containerView:systemLayoutSizeFittingSize:forArrangedSubview:](-[NUIContainerView delegate](self, "delegate"), "containerView:systemLayoutSizeFittingSize:forArrangedSubview:", self, a4, v16, v17);
  }
  else
  {
    v18 = 1.79769313e308;
    v19 = 1.79769313e308;
  }
  if (v18 == 1.79769313e308 && v19 == 1.79769313e308)
    objc_msgSend(a4, "effectiveLayoutSizeFittingSize:", v16, v17);
  if (v18 >= v16)
    v18 = v16;
  if (v19 >= v17)
    v19 = v17;
  v21 = v18 - (v11 + v15);
  v22 = v19 - (v9 + v13);
  result.height = v22;
  result.width = v21;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x2000000000000) != 0)
    return 1;
  if ((*(_QWORD *)&containerFlags & 0x300000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFFFFCFFFFFFFFLL | 0x100000000);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isLayoutSizeDependentOnPerpendicularAxis"))
          {
            self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFFFFFCFFFFFFFFLL | 0x200000000);
            return (*(_QWORD *)&self->_containerFlags & 0x300000000) == 0x200000000;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  return (*(_QWORD *)&self->_containerFlags & 0x300000000) == 0x200000000;
}

- (NSArray)arrangedSubviews
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;

  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  return (NSArray *)(id)-[NSMutableArray copy](self->_arrangedSubviews, "copy");
}

- (NSArray)visibleArrangedSubviews
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  NSArray **p_arrangedSubviews;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;

  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
    *(_WORD *)&containerFlags = self->_containerFlags;
  }
  if (!*(_WORD *)&containerFlags)
  {
    p_arrangedSubviews = (NSArray **)&self->_arrangedSubviews;
    return *p_arrangedSubviews;
  }
  p_arrangedSubviews = &self->_visibleArrangedSubviews;
  if (!self->_visibleArrangedSubviews)
  {
    v7 = (NSArray *)(id)-[NSMutableArray filteredArrayUsingPredicate:](self->_arrangedSubviews, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92));
    *p_arrangedSubviews = v7;
    if (_NUIEnableAPIMisuseAssertions)
      goto LABEL_14;
    if (_NUIIsDebuggerAttached::onceToken != -1)
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    if (_NUIIsDebuggerAttached::isDebugged)
    {
      v7 = *p_arrangedSubviews;
LABEL_14:
      v8 = -[NSArray count](v7, "count");
      if (v8 != -[NSMutableArray count](self->_arrangedSubviews, "count") - *(_WORD *)&self->_containerFlags)
      {
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
        if (v9)
          v10 = (const __CFString *)v9;
        else
          v10 = CFSTR("<Unknown File>");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 475, CFSTR("Mismatching visible arranged subviews count"));
      }
    }
  }
  return *p_arrangedSubviews;
}

- (BOOL)isBaselineRelativeArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 2) & 1;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  double v7;
  double v8;
  uint64_t v9;
  const __CFString *v10;
  objc_super v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_5;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_5:
    if ((*((_BYTE *)&self->_containerFlags + 4) & 0x80) != 0)
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v9)
        v10 = (const __CFString *)v9;
      else
        v10 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 841, CFSTR("effectiveLayoutSizeFittingSize: is not reentrant"));
    }
  }
  *(_QWORD *)&self->_containerFlags |= 0x8000000000uLL;
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerView;
  -[UIView effectiveLayoutSizeFittingSize:](&v11, sel_effectiveLayoutSizeFittingSize_, width, height);
  *(_QWORD *)&self->_containerFlags &= ~0x8000000000uLL;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)canCancelMeasurementForCompression
{
  return (*(_QWORD *)&self->_containerFlags & 0x2000080000000) == 0x2000000000000;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  if ((*((_BYTE *)&self->_containerFlags + 4) & 0x80) != 0)
    v4 = -[NUIContainerView _intrinsicSizeWithinSize:]((uint64_t)self, a3.width, a3.height);
  else
    -[NUIContainerView effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 55) = 0;
  *((_QWORD *)self + 54) = (char *)self + 440;
  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 67) = 0;
  *((_QWORD *)self + 65) = 0;
  return self;
}

uint64_t __43__NUIContainerView_visibleArrangedSubviews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("NUIContainerViewDebug"));
    debugBoundingBoxes = objc_msgSend(v3, "BOOLValue");
    _NUIEnableAPIMisuseAssertions = (int)objc_msgSend(v3, "intValue") > 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v11;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  objc_super v14;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("hidden")))
  {
    v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    if ((objc_msgSend(v11, "isEqual:", objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8])) & 1) == 0)
    {
      containerFlags = self->_containerFlags;
      if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
      {
        self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
        -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
        *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
      }
      if (-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:", a4))
        -[NUIContainerView visibilityDidChangeForArrangedSubview:](self, "visibilityDidChangeForArrangedSubview:", a4);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NUIContainerView;
    -[NUIContainerView observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if ((*((_BYTE *)&self->_containerFlags + 4) & 0x80) != 0)
    v3 = -[NUIContainerView _intrinsicSizeWithinSize:]((uint64_t)self, a3.width, a3.height);
  else
    -[NUIContainerView effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUIContainerView;
  -[NUIContainerView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x18) != 0)
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[UIView effectiveFirstBaselineOffsetFromContentTop](self, "effectiveFirstBaselineOffsetFromContentTop", a3.width, a3.height);
  v5 = v4;
  -[UIView effectiveBaselineOffsetFromContentBottom](self, "effectiveBaselineOffsetFromContentBottom");
  v7 = 2.22507386e-308;
  if ((NUIContainerView *)self->_firstBaselineView == self)
    v8 = 2.22507386e-308;
  else
    v8 = v5;
  if ((NUIContainerView *)self->_lastBaselineView != self)
    v7 = v6;
  v9 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (id)viewForLastBaselineLayout
{
  id result;

  result = self->_lastBaselineView;
  if (!result)
  {
    result = -[NUIContainerView calculateViewForLastBaselineLayout](self, "calculateViewForLastBaselineLayout");
    self->_lastBaselineView = (UIView *)result;
  }
  return result;
}

- (id)viewForFirstBaselineLayout
{
  id result;

  result = self->_firstBaselineView;
  if (!result)
  {
    result = -[NUIContainerView calculateViewForFirstBaselineLayout](self, "calculateViewForFirstBaselineLayout");
    self->_firstBaselineView = (UIView *)result;
  }
  return result;
}

uint64_t __45__NUIContainerView_initWithArrangedSubviews___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)addArrangedSubview:(id)a3
{
  uint64_t v6;
  const __CFString *v7;

  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    if (_NUIIsDebuggerAttached::onceToken == -1)
    {
      if (a3)
        goto LABEL_7;
    }
    else
    {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      if (a3)
        goto LABEL_7;
    }
    if (!_NUIIsDebuggerAttached::isDebugged)
      goto LABEL_7;
  }
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("<Unknown File>");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));
LABEL_7:
  -[NUIContainerView insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", a3, -[NSMutableArray count](self->_arrangedSubviews, "count"));
}

uint64_t __40__NUIContainerView_setArrangedSubviews___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48;
  v8 = a2;
  std::__tree<UIView *>::__erase_unique<UIView *>(v6, &v8);
  return objc_msgSend(*(id *)(a1 + 32), "insertArrangedSubview:atIndex:", a2, a3);
}

- (void)setLayoutMarginsRelativeArrangement:(BOOL)a3
{
  _BOOL4 v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v6;

  v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if (((((*(_QWORD *)&containerFlags & 0x80000000000) == 0) ^ v3) & 1) == 0)
  {
    v6 = 0x80000000000;
    if (!v3)
      v6 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFF7FFFFFFFFFFLL | v6);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (NUIContainerView)initWithArrangedSubviews:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NUIContainerView *v8;
  NUIContainerView *v9;
  _QWORD v11[6];
  objc_super v12;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12.receiver = self;
  v12.super_class = (Class)NUIContainerView;
  v8 = -[NUIContainerView initWithFrame:](&v12, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    _NUIContainerViewCommonInit(v8);
    if (a3)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__NUIContainerView_initWithArrangedSubviews___block_invoke;
      v11[3] = &unk_1E57C6A10;
      v11[4] = a3;
      v11[5] = v9;
      -[NUIContainerView performBatchUpdates:](v9, "performBatchUpdates:", v11);
    }
  }
  return v9;
}

- (NUIContainerView)initWithFrame:(CGRect)a3
{
  NUIContainerView *v3;
  NUIContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUIContainerView;
  v3 = -[NUIContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _NUIContainerViewCommonInit(v3);
  return v4;
}

- (void)setDebugBoundingBoxesEnabled:(BOOL)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v4;

  containerFlags = self->_containerFlags;
  if (((((*(_QWORD *)&containerFlags & 0x20000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x20000000000;
    if (!a3)
      v4 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFFDFFFFFFFFFFLL | v4);
    -[NUIContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (BOOL)isDebugBoundingBoxesEnabled
{
  return debugBoundingBoxes;
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUIContainerView;
  -[NUIContainerView willRemoveSubview:](&v5, sel_willRemoveSubview_);
  if (self->_arrangedSubviews)
    -[NUIContainerView removeArrangedSubview:](self, "removeArrangedSubview:", a3);
}

- (void)setArrangedSubviews:(id)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  unint64_t v6;
  BOOL v7;
  NSMutableArray *arrangedSubviews;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t **v15;
  $E75A57F832BD0FF3084D204B7E402DB5 v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t **v24;
  uint64_t v25;
  _QWORD *(*v26)(_QWORD *, _QWORD *);
  void (*v27)(uint64_t);
  void *v28;
  _QWORD **v29;
  _QWORD *v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  v6 = (unint64_t)containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x1000000000) == 0)
  {
    v6 = *(_QWORD *)&containerFlags & 0xFFFFFFF3FFFFFFFFLL | 0x800000000;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)v6;
  }
  v7 = (v6 & 0xF000000) != 0 && (v6 & 0x4000000000) == 0;
  if (v7)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(v6 | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  v23 = 0;
  v24 = (uint64_t **)&v23;
  v25 = 0x4812000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v30[0] = 0;
  v30[1] = 0;
  v28 = &unk_1AA8398D5;
  v29 = v30;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  arrangedSubviews = self->_arrangedSubviews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](arrangedSubviews, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(arrangedSubviews);
        v22 = 0;
        v22 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        std::__tree<UIView *>::__emplace_unique_key_args<UIView *,UIView *&>(v24 + 6, (unint64_t *)&v22, &v22);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](arrangedSubviews, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v9);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__NUIContainerView_setArrangedSubviews___block_invoke;
  v17[3] = &unk_1E57C6A38;
  v17[4] = self;
  v17[5] = &v23;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v17);
  v12 = (uint64_t **)v24[6];
  v13 = v24 + 7;
  if (v12 != v24 + 7)
  {
    do
    {
      -[NUIContainerView removeArrangedSubview:](self, "removeArrangedSubview:", v12[4]);
      v14 = v12[1];
      if (v14)
      {
        do
        {
          v15 = (uint64_t **)v14;
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (uint64_t **)v12[2];
          v7 = *v15 == (uint64_t *)v12;
          v12 = v15;
        }
        while (!v7);
      }
      v12 = v15;
    }
    while (v15 != v13);
  }
  v16 = self->_containerFlags;
  if ((*(_QWORD *)&v16 & 0x1000000000) == 0)
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&v16 & 0xFFFFFFF3FFFFFFFFLL | *(_QWORD *)&containerFlags & 0xC00000000);
  _Block_object_dispose(&v23, 8);
  std::__tree<UIView *>::destroy((uint64_t)&v29, v30[0]);
}

- (int64_t)alignmentForView:(id)a3 inAxis:(int64_t)a4
{
  char *left;
  NUIContainerView *p_pair1;
  unint64_t v6;
  BOOL v7;
  char **v8;
  UITraitCollection **p_cachedTraitCollection;
  unint64_t cachedTraitCollection;

  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return -1;
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v6 = *((_QWORD *)left + 4);
    v7 = v6 >= (unint64_t)a3;
    if (v6 >= (unint64_t)a3)
      v8 = (char **)left;
    else
      v8 = (char **)(left + 8);
    if (v7)
      p_pair1 = (NUIContainerView *)left;
    left = *v8;
  }
  while (*v8);
  if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    && (cachedTraitCollection = (unint64_t)p_pair1->super._cachedTraitCollection,
        p_cachedTraitCollection = &p_pair1->super._cachedTraitCollection,
        cachedTraitCollection <= (unint64_t)a3))
  {
    return *((char *)p_cachedTraitCollection + a4 + 56);
  }
  else
  {
    return -1;
  }
}

- (void)invalidateIntrinsicContentSize
{
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", -1);
}

- (void)setAlignment:(int64_t)a3 forView:(id)a4 inAxis:(int64_t)a5
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  char *left;
  NUIContainerView *p_pair1;
  unint64_t v13;
  BOOL v14;
  char **v15;
  UITraitCollection **p_cachedTraitCollection;
  unint64_t cachedTraitCollection;
  char *v18;
  _BYTE *v19;
  uint64_t v20;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_18;
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v13 = *((_QWORD *)left + 4);
    v14 = v13 >= (unint64_t)a4;
    if (v13 >= (unint64_t)a4)
      v15 = (char **)left;
    else
      v15 = (char **)(left + 8);
    if (v14)
      p_pair1 = (NUIContainerView *)left;
    left = *v15;
  }
  while (*v15);
  if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    && (cachedTraitCollection = (unint64_t)p_pair1->super._cachedTraitCollection,
        p_cachedTraitCollection = &p_pair1->super._cachedTraitCollection,
        cachedTraitCollection <= (unint64_t)a4))
  {
    v18 = (char *)p_cachedTraitCollection + a5;
    v20 = v18[56];
    v19 = v18 + 56;
    if (v20 != a3)
    {
      *v19 = a3;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
    }
  }
  else
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View is not an arranged subviews %@."), a4);
  }
}

- (void).cxx_destruct
{
  vector<CALayer *, std::allocator<CALayer *>> *p_debugBoundingBoxLayers;
  __end_ **begin;

  p_debugBoundingBoxLayers = &self->_debugBoundingBoxLayers;
  begin = self->_debugBoundingBoxLayers.__begin_;
  if (begin)
  {
    p_debugBoundingBoxLayers->var0 = begin;
    operator delete(begin);
  }
  std::__tree<UIView *>::destroy((uint64_t)&self->_arrangedSubviewInfo, (_QWORD *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_);
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  _BOOL4 v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v6;

  v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if (((((*(_QWORD *)&containerFlags & 0x40000000000) == 0) ^ v3) & 1) == 0)
  {
    v6 = 0x40000000000;
    if (!v3)
      v6 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFFBFFFFFFFFFFLL | v6);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)setArrangedSubviewRemovalPolicy:(int64_t)a3
{
  self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFFFFE3FFFFFFFFLL | ((unint64_t)(a3 & 3) << 34) | 0x1000000000);
}

- (void)dealloc
{
  NSMutableArray *arrangedSubviews;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_delegate, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  arrangedSubviews = self->_arrangedSubviews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](arrangedSubviews, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(arrangedSubviews);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "removeObserver:forKeyPath:", self, CFSTR("hidden"));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](arrangedSubviews, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->_arrangedSubviews = 0;
  self->_visibleArrangedSubviews = 0;
  self->_debugBoundingBoxLayers.var0 = self->_debugBoundingBoxLayers.__begin_;
  v8.receiver = self;
  v8.super_class = (Class)NUIContainerView;
  -[NUIContainerView dealloc](&v8, sel_dealloc);
}

- (void)visibilityDidChangeForArrangedSubview:(id)a3
{
  __int16 v5;
  int containerFlags;
  uint64_t v7;
  const __CFString *v8;

  if (objc_msgSend(a3, "isHidden"))
    v5 = 1;
  else
    v5 = -1;
  *(_WORD *)&self->_containerFlags = *(_DWORD *)&self->_containerFlags + v5;

  self->_visibleArrangedSubviews = 0;
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_8;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_8:
    containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v7)
        v8 = (const __CFString *)v7;
      else
        v8 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 1399, CFSTR("Hidden count mismatch"));
    }
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  if (a5 == 1000.0)
    v5 = (a4 == 1000.0) | 2;
  else
    v5 = a4 == 1000.0;
  -[NUIContainerView _layoutSizeThatFits:fixedAxes:](self, "_layoutSizeThatFits:fixedAxes:", v5, a3.width, a3.height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setDelegate:(id)a3
{
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_delegate != a3)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    v5 = objc_opt_respondsToSelector();
    v6 = 0x400000000000;
    if ((v5 & 1) == 0)
      v6 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFFBFFFFFFFFFFFLL | v6);
    v7 = objc_opt_respondsToSelector();
    v8 = 0x800000000000;
    if ((v7 & 1) == 0)
      v8 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFF7FFFFFFFFFFFLL | v8);
    v9 = objc_opt_respondsToSelector();
    v10 = 0x1000000000000;
    if ((v9 & 1) == 0)
      v10 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFEFFFFFFFFFFFFLL | v10);
    v11 = objc_opt_respondsToSelector();
    v12 = 0x2000000000000;
    if ((v11 & 1) == 0)
      v12 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFDFFFFFFFFFFFFLL | v12);
    v13 = objc_opt_respondsToSelector();
    v14 = 0x4000000000000;
    if ((v13 & 1) == 0)
      v14 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFBFFFFFFFFFFFFLL | v14);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void)removeArrangedSubview:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;

  v15 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  v6 = -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("hidden"));
    -[NSMutableArray removeObjectAtIndex:](self->_arrangedSubviews, "removeObjectAtIndex:", v7);
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_arrangedSubviewInfo, (unint64_t *)&v15);
    if ((*((_BYTE *)&self->_containerFlags + 3) & 0xF) != 0 && objc_msgSend(v15, "_isContainerView"))
      -[NUIContainerView endBatchUpdates]((uint64_t)v15);
    -[NUIContainerView didRemoveArrangedSubview:atIndex:](self, "didRemoveArrangedSubview:atIndex:", v15, v7);
    if (objc_msgSend(v15, "isHidden"))
    {
      containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(*(_QWORD *)&self->_containerFlags - 1));
      self->_containerFlags = containerFlags;
    }
    else
    {

      self->_visibleArrangedSubviews = 0;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
      containerFlags = self->_containerFlags;
    }
    v9 = (*(unint64_t *)&containerFlags >> 34) & 3;
    if ((_DWORD)v9 == 2)
    {
      objc_msgSend(v15, "removeFromSuperview");
    }
    else if ((_DWORD)v9 == 1)
    {
      objc_msgSend(v15, "setHidden:", 1);
    }
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_16;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_16:
    v10 = (int)self->_containerFlags;
    if (v10 != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v11)
        v12 = (const __CFString *)v11;
      else
        v12 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 572, CFSTR("Hidden count mismatch"));
    }
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_21;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_21:
    if (-[NSMutableArray count](self->_arrangedSubviews, "count") != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v13)
        v14 = (const __CFString *)v13;
      else
        v14 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 573, CFSTR("Info count mismatch"));
    }
  }
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x10) == 0)
    return 0;
  if (-[NUIContainerView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout") == a3)
    return 1;
  return -[NUIContainerView viewForLastBaselineLayout](self, "viewForLastBaselineLayout") == a3;
}

- (NUIContainerView)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("-%@ %@ not yet supported."), v8, NSStringFromSelector(a2));
  return -[NUIContainerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (uint64_t)_verifyInternalConsistencyWarningOnly:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", *(_QWORD *)(result + 456));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v10, "superview") == v3)
          {
            if ((unint64_t)objc_msgSend(v4, "countForObject:", v10) >= 2)
              objc_msgSend(v5, "appendFormat:", CFSTR("View is represented %lu times: %@\n"), objc_msgSend(v4, "countForObject:", v10), v10);
          }
          else
          {
            objc_msgSend(v5, "appendFormat:", CFSTR("View is not a subview: %@\n"), v10, v18);
          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }
    if (!objc_msgSend(v5, "length"))
      return 1;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v5);
      return 0;
    }
    if (_NUILog::onceToken != -1)
      dispatch_once(&_NUILog::onceToken, &__block_literal_global_1);
    v11 = _NUILog::log;
    result = os_log_type_enabled((os_log_t)_NUILog::log, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      -[NUIContainerView _verifyInternalConsistencyWarningOnly:].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
      return 0;
    }
  }
  return result;
}

- (int64_t)arrangedSubviewRemovalPolicy
{
  return (*(_QWORD *)&self->_containerFlags >> 34) & 3;
}

- (void)setArrangedSubviewAdditionPolicy:(int64_t)a3
{
  self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&self->_containerFlags & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(a3 & 1) << 37));
}

- (int64_t)arrangedSubviewAdditionPolicy
{
  return (*(_QWORD *)&self->_containerFlags >> 37) & 1;
}

- (uint64_t)_countHiddenArrangesSubviews
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a1[68];
  if ((v2 & 0xF000000) != 0 && (v2 & 0x4000000000) == 0)
  {
    a1[68] = v2 | 0x4000000000;
    objc_msgSend(a1, "ensureArrangedSubviewsAreValid");
    a1[68] &= ~0x4000000000uLL;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)a1[57];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  LODWORD(v7) = 0;
  v8 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v4);
      v7 = v7 + objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isHidden");
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v6);
  return v7;
}

- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4
{
  id v8;
  void *v9;
  int v10;
  __int16 v11;
  int containerFlags;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  id v22;
  id *v23;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a4)
    {
LABEL_11:
      if (-[NSMutableArray count](self->_arrangedSubviews, "count") <= a3)
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
        if (v13)
          v14 = (const __CFString *)v13;
        else
          v14 = CFSTR("<Unknown File>");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 635, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < _arrangedSubviews.count"));
      }
      goto LABEL_12;
    }
    goto LABEL_45;
  }
  if (_NUIIsDebuggerAttached::onceToken == -1)
  {
    if (a4)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
    if (a4)
      goto LABEL_7;
  }
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_45:
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
    if (v19)
      v20 = (const __CFString *)v19;
    else
      v20 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v20, 634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newView != nil"));
  }
LABEL_7:
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_11;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
    goto LABEL_11;
LABEL_12:
  v8 = (id)-[NSMutableArray objectAtIndex:](self->_arrangedSubviews, "objectAtIndex:", a3);
  v22 = v8;
  if (v8 != a4)
  {
    v9 = v8;
    -[NUIContainerView _addAsSubviewIfNeeded:]((uint64_t)self, a4);
    objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("hidden"));
    objc_msgSend(a4, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 3, 0);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_arrangedSubviews, "replaceObjectAtIndex:withObject:", a3, a4);
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_arrangedSubviewInfo, (unint64_t *)&v22);
    -[NUIContainerView didRemoveArrangedSubview:atIndex:](self, "didRemoveArrangedSubview:atIndex:", v22, a3);
    v21 = a4;
    v23 = &v21;
    std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>((uint64_t **)&self->_arrangedSubviewInfo, (unint64_t *)&v21, (uint64_t)&std::piecewise_construct, &v23);
    -[NUIContainerView didInsertArrangedSubview:atIndex:](self, "didInsertArrangedSubview:atIndex:", a4, a3);
    v10 = objc_msgSend(v22, "isHidden");
    if (v10 != objc_msgSend(a4, "isHidden"))
    {
      if (objc_msgSend(a4, "isHidden"))
        v11 = 1;
      else
        v11 = -1;
      *(_WORD *)&self->_containerFlags = *(_DWORD *)&self->_containerFlags + v11;
    }
    if (!objc_msgSend(v22, "isHidden") || (objc_msgSend(a4, "isHidden") & 1) == 0)
    {

      self->_visibleArrangedSubviews = 0;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
    }
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_25;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_25:
    containerFlags = (int)self->_containerFlags;
    if (containerFlags != -[NUIContainerView _countHiddenArrangesSubviews](self))
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v15)
        v16 = (const __CFString *)v15;
      else
        v16 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 659, CFSTR("Hidden count mismatch"));
    }
  }
  if (_NUIEnableAPIMisuseAssertions)
    goto LABEL_30;
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  if (_NUIIsDebuggerAttached::isDebugged)
  {
LABEL_30:
    if (-[NSMutableArray count](self->_arrangedSubviews, "count") != self->_arrangedSubviewInfo.__tree_.__pair3_.__value_)
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
      if (v17)
        v18 = (const __CFString *)v17;
      else
        v18 = CFSTR("<Unknown File>");
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 660, CFSTR("Info caount mismatch"));
    }
  }
}

- (void)replaceArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  -[NUIContainerView replaceArrangedSubviewAtIndex:withView:](self, "replaceArrangedSubviewAtIndex:withView:", a4, a3);
}

- (unint64_t)indexOfArrangedSubview:(id)a3
{
  uint64_t v7;
  const __CFString *v8;

  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
      return -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
  }
  else
  {
    if (_NUIIsDebuggerAttached::onceToken == -1)
    {
      if (a3)
        return -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
    }
    else
    {
      dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
      if (a3)
        return -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
    }
    if (!_NUIIsDebuggerAttached::isDebugged)
      return -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerView.mm");
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = CFSTR("<Unknown File>");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));
  return -[NSMutableArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", a3);
}

- (BOOL)isLayoutMarginsRelativeArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 3) & 1;
}

- (void)setBaselineRelativeLayoutMarginsForArrangement:(BOOL)a3
{
  _BOOL4 v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v6;

  v3 = a3;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if (((((*(_QWORD *)&containerFlags & 0x100000000000) == 0) ^ v3) & 1) == 0)
  {
    v6 = 0x100000000000;
    if (!v3)
      v6 = 0;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFEFFFFFFFFFFFLL | v6);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (BOOL)hasBaselineRelativeLayoutMarginsForArrangement
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 4) & 1;
}

- (CGPoint)positionAdjustmentOffsetForView:(id)a3
{
  char *left;
  double *v4;
  NUIContainerView *p_pair1;
  unint64_t v6;
  BOOL v7;
  char **v8;
  double *v9;
  BOOL v10;
  double *p_animationInfo;
  double *p_swiftAnimationInfo;
  double v13;
  double v14;
  CGPoint result;

  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  v4 = (double *)MEMORY[0x1E0C9D538];
  if (left)
  {
    p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
    do
    {
      v6 = *((_QWORD *)left + 4);
      v7 = v6 >= (unint64_t)a3;
      if (v6 >= (unint64_t)a3)
        v8 = (char **)left;
      else
        v8 = (char **)(left + 8);
      if (v7)
        p_pair1 = (NUIContainerView *)left;
      left = *v8;
    }
    while (*v8);
    v9 = (double *)(MEMORY[0x1E0C9D538] + 8);
    if (p_pair1 != (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_)
    {
      v10 = p_pair1->super._cachedTraitCollection > a3;
      p_animationInfo = (double *)&p_pair1->super._animationInfo;
      p_swiftAnimationInfo = (double *)&p_pair1->super._swiftAnimationInfo;
      if (!v10)
      {
        v4 = p_animationInfo;
        v9 = p_swiftAnimationInfo;
      }
    }
  }
  else
  {
    v9 = (double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v13 = *v9;
  v14 = *v4;
  result.y = v13;
  result.x = v14;
  return result;
}

- (void)setPositionAdjustmentOffset:(CGPoint)a3 forView:(id)a4
{
  double y;
  double x;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *p_pair1;
  unint64_t v12;
  BOOL v13;
  char **v14;

  y = a3.y;
  x = a3.x;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_18;
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v12 = *((_QWORD *)left + 4);
    v13 = v12 >= (unint64_t)a4;
    if (v12 >= (unint64_t)a4)
      v14 = (char **)left;
    else
      v14 = (char **)(left + 8);
    if (v13)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    left = *v14;
  }
  while (*v14);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a4)
  {
    if (*(double *)&p_pair1[5].__value_.__left_ != x || *(double *)&p_pair1[6].__value_.__left_ != y)
    {
      *(double *)&p_pair1[5].__value_.__left_ = x;
      *(double *)&p_pair1[6].__value_.__left_ = y;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
    }
  }
  else
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View is not an arranged subviews %@."), a4);
  }
}

- (void)setMinimumSpacing:(NSDirectionalEdgeInsets)a3 adjacentToView:(id)a4
{
  double trailing;
  double bottom;
  double leading;
  double top;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *p_pair1;
  unint64_t v14;
  BOOL v15;
  char **v16;
  double v17;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_18;
  p_pair1 = &self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v14 = *((_QWORD *)left + 4);
    v15 = v14 >= (unint64_t)a4;
    if (v14 >= (unint64_t)a4)
      v16 = (char **)left;
    else
      v16 = (char **)(left + 8);
    if (v15)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, _NUIContainerViewArrangedSubview>, void *>>> *)left;
    left = *v16;
  }
  while (*v16);
  if (p_pair1 != &self->_arrangedSubviewInfo.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a4)
  {
    v17 = *(double *)&p_pair1[7].__value_.__left_;
    if (*(double *)&p_pair1[8].__value_.__left_ != leading
      || v17 != top
      || *(double *)&p_pair1[10].__value_.__left_ != trailing
      || *(double *)&p_pair1[9].__value_.__left_ != bottom)
    {
      *(double *)&p_pair1[7].__value_.__left_ = top;
      *(double *)&p_pair1[8].__value_.__left_ = leading;
      *(double *)&p_pair1[9].__value_.__left_ = bottom;
      *(double *)&p_pair1[10].__value_.__left_ = trailing;
      -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2, v17);
    }
  }
  else
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View is not an arranged subviews %@."), a4);
  }
}

- (id)description
{
  id v3;
  void *v4;
  NSArray *visibleArrangedSubviews;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUIContainerView;
  v3 = -[NUIContainerView description](&v11, sel_description);
  v4 = (void *)objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
  visibleArrangedSubviews = self->_visibleArrangedSubviews;
  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = -[NSMutableArray count](self->_arrangedSubviews, "count");
  if (visibleArrangedSubviews)
    v8 = objc_msgSend(v6, "stringWithFormat:", CFSTR("arrangedSubviews = %lu[%lu];"),
           v7,
           -[NSArray count](self->_visibleArrangedSubviews, "count"));
  else
    v8 = objc_msgSend(v6, "stringWithFormat:", CFSTR("arrangedSubviews = %lu[-];"), v7, v10);
  return (id)objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@>"), v8);
}

- (id)debugDescription
{
  id v3;

  v3 = -[NUIContainerView description](self, "description");
  return (id)objc_msgSend((id)objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1), "stringByAppendingFormat:", CFSTR(" %@>"), -[NUIContainerView arrangedDebugDescription](self, "arrangedDebugDescription"));
}

- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3
{
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  int v4;
  unint64_t v7;
  $E75A57F832BD0FF3084D204B7E402DB5 v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x2000000000000) != 0)
  {
    if (!(*(_QWORD *)&self->_containerFlags & 0xC0000000 | a3)
      || (LOBYTE(v4) = 0, a3 == 1) && (*(_DWORD *)&containerFlags & 0x80000000) == 0)
    {
      v7 = *(unint64_t *)&containerFlags >> 28;
      self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFFFFFCFFFFFFFLL | 0x10000000);
      v4 = -[NUIContainerViewDelegate containerView:shouldRestartMeasurementDueToCompressionInAxis:forReason:](-[NUIContainerView delegate](self, "delegate"), "containerView:shouldRestartMeasurementDueToCompressionInAxis:forReason:", self, a3, ((*(unint64_t *)&containerFlags >> 28) & 3) == 3);
      v8 = self->_containerFlags;
      v9 = *(_QWORD *)&v8 & 0xFFFFDFFFCFFFFFFFLL | ((v7 & 3) << 28);
      v10 = (v4 | (*(unint64_t *)&v8 >> 45) & 1) == 0;
      v11 = 0x200000000000;
      if (v10)
        v11 = 0;
      containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(v11 | v9);
    }
    v12 = *(_DWORD *)&containerFlags >> 30;
    v13 = 1;
    if (a3)
      v13 = 2;
    if (v12 <= v13)
      v12 = v13;
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags & 0xFFFFFFFF3FFFFFFFLL | (v12 << 30));
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  double v8;
  double v9;
  CGSize result;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("-[%@ %@] not implemented."), v7, NSStringFromSelector(a2));
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)calculateViewForFirstBaselineLayout
{
  id result;

  result = -[NSArray firstObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "firstObject");
  if (!result)
    return self;
  return result;
}

- (id)calculateViewForLastBaselineLayout
{
  id result;

  result = -[NSArray lastObject](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "lastObject");
  if (!result)
    return self;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("-[%@ %@] not implemented."), v7, NSStringFromSelector(a2));
}

- (BOOL)isInBatchUpdate
{
  return (*((_BYTE *)&self->_containerFlags + 3) & 0xF) != 0;
}

- (void)assertNotInLayoutPass:(BOOL)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
}

+ (BOOL)enableAPIMisuseAssertions
{
  return _NUIEnableAPIMisuseAssertions;
}

+ (void)setEnableAPIMisuseAssertions:(BOOL)a3
{
  _NUIEnableAPIMisuseAssertions = a3;
}

- (BOOL)isDebugBoundingBoxesEnabled
{
  return (*((unsigned __int8 *)&self->_containerFlags + 5) >> 1) & 1;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  NUIContainerViewDelegate *v23;
  id v24;
  uint64_t v25;
  id v26;
  NUIContainerView *firstBaselineView;
  UIView *v28;
  NUIContainerView *v29;
  NUIContainerView *lastBaselineView;
  UIView *v31;
  NUIContainerView *v32;
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_opt_class(), CFSTR("class"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", -[NUIContainerView debugDictionaryForVisibleArrangedSubview:](self, "debugDictionaryForVisibleArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i)));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("visibleArrangedSubviews"));
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = -[NUIContainerView arrangedSubviews](self, "arrangedSubviews");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        if (objc_msgSend(v14, "_wantsConstraintBasedLayout"))
          objc_msgSend(v9, "addObject:", v14);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("arrangedSubviewsWantingAutolayout"));
  v15 = -[UIView debugSizeCacheDict](self, "debugSizeCacheDict");
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cachedSizes"));
  if ((*((_BYTE *)&self->_containerFlags + 5) & 0x18) != 0)
  {
    -[NUIContainerView layoutMargins](self, "layoutMargins");
    v34[0] = v16;
    v34[1] = v17;
    v34[2] = v18;
    v34[3] = v19;
    v20 = objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v34, "{UIEdgeInsets=dddd}");
    if ((*(_QWORD *)&self->_containerFlags & 0x100000000000) != 0)
      v21 = CFSTR("baselineLayoutMargins");
    else
      v21 = CFSTR("layoutMargins");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v21);
  }
  if (-[NUIContainerView delegate](self, "delegate"))
  {
    v22 = (void *)MEMORY[0x1E0C99E08];
    v45[0] = CFSTR("delegate");
    v23 = -[NUIContainerView delegate](self, "delegate");
    v45[1] = CFSTR("respondsTo");
    v46[0] = v23;
    v24 = -[NUIContainerView debugSetDelegateRespondsToSelectors](self, "debugSetDelegateRespondsToSelectors");
    v44 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v46[1] = objc_msgSend(v24, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v22, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2)), CFSTR("delegate"));
  }
  v25 = *((_BYTE *)&self->_containerFlags + 3) & 0xF;
  if ((*((_BYTE *)&self->_containerFlags + 3) & 0xF) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25), CFSTR("batchDepth"));
  v26 = -[NUIContainerView debugSetEnabledFlags](self, "debugSetEnabledFlags", v25);
  if (objc_msgSend(v26, "count"))
  {
    v43 = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v26, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1)), CFSTR("flags"));
  }
  firstBaselineView = (NUIContainerView *)self->_firstBaselineView;
  if (firstBaselineView)
  {
    if (firstBaselineView == self)
      v28 = (UIView *)CFSTR("self");
    else
      v28 = self->_firstBaselineView;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("cachedFirstBaselineView"));
  }
  else
  {
    v29 = -[NUIContainerView calculateViewForFirstBaselineLayout](self, "calculateViewForFirstBaselineLayout");
    if (v29 != self)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("firstBaselineView"));
  }
  lastBaselineView = (NUIContainerView *)self->_lastBaselineView;
  if (lastBaselineView)
  {
    if (lastBaselineView == self)
      v31 = (UIView *)CFSTR("self");
    else
      v31 = self->_lastBaselineView;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("cachedLastBaselineView"));
  }
  else
  {
    v32 = -[NUIContainerView calculateViewForLastBaselineLayout](self, "calculateViewForLastBaselineLayout", v29);
    if (v32 != self)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("lastBaselineView"));
  }
  -[NUIContainerView _verifyInternalConsistencyWarningOnly:]((uint64_t)self, 0);
  return (id)objc_msgSend(v3, "copy");
}

- (id)arrangedDebugDescription
{
  void *v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x180000000000) != 0)
  {
    -[NUIContainerView layoutMargins](self, "layoutMargins");
    objc_msgSend(v3, "appendFormat:", CFSTR(" layoutMarginsRelative = {%f, %f, %f, %f};"), v5, v6, v7, v8);
    containerFlags = self->_containerFlags;
  }
  if ((*(_QWORD *)&containerFlags & 0x40000000000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" baselineRelative = YES;"));
  return v3;
}

+ (id)debugVersion
{
  return CFSTR("AppSupportUI-42.2 (UIKit)");
}

- (id)debugDictionaryForVisibleArrangedSubview:(id)a3
{
  void *v5;
  NSUInteger v6;
  void *v7;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;
  char *left;
  NUIContainerView *p_pair1;
  unint64_t v12;
  BOOL v13;
  char **v14;
  void *v15;
  uint64_t v16;
  UITraitCollection **p_cachedTraitCollection;
  const __CFString *v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v33;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", a3, CFSTR("view"));
  v6 = -[NSArray indexOfObject:](-[NUIContainerView arrangedSubviews](self, "arrangedSubviews"), "indexOfObject:", a3);
  if (v6 != -[NSArray indexOfObject:](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews"), "indexOfObject:", a3))objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6), CFSTR("index"));
  v7 = (void *)objc_msgSend(a3, "debugSizeCacheDict");
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("cachedSizes"));
  v33 = v5;
  containerFlags = self->_containerFlags;
  if ((*(_DWORD *)&containerFlags & 0xF000000) != 0 && (*(_QWORD *)&containerFlags & 0x4000000000) == 0)
  {
    self->_containerFlags = ($E75A57F832BD0FF3084D204B7E402DB5)(*(_QWORD *)&containerFlags | 0x4000000000);
    -[NUIContainerView ensureArrangedSubviewsAreValid](self, "ensureArrangedSubviewsAreValid");
    *(_QWORD *)&self->_containerFlags &= ~0x4000000000uLL;
  }
  left = (char *)self->_arrangedSubviewInfo.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_22;
  p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  do
  {
    v12 = *((_QWORD *)left + 4);
    v13 = v12 >= (unint64_t)a3;
    if (v12 >= (unint64_t)a3)
      v14 = (char **)left;
    else
      v14 = (char **)(left + 8);
    if (v13)
      p_pair1 = (NUIContainerView *)left;
    left = *v14;
  }
  while (*v14);
  if (p_pair1 == (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_
    || p_pair1->super._cachedTraitCollection > a3)
  {
LABEL_22:
    p_pair1 = (NUIContainerView *)&self->_arrangedSubviewInfo.__tree_.__pair1_;
  }
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = 0;
  p_cachedTraitCollection = &p_pair1->super._cachedTraitCollection;
  v18 = CFSTR("horizonral");
  v19 = 1;
  do
  {
    v20 = v19;
    v21 = *((char *)p_cachedTraitCollection + v16 + 56);
    if (v21 != -1)
    {
      if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
        dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_376);
      v22 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21));
      if (!v22)
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v21);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v18);
    }
    v19 = 0;
    v18 = CFSTR("vertical");
    v16 = 1;
  }
  while ((v20 & 1) != 0);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, CFSTR("alignment"));
  -[NUIContainerView minimumSpacingAdjacentToView:](self, "minimumSpacingAdjacentToView:", a3);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (v24 < 1.79769313e308)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v24), CFSTR("top"));
  if (v26 < 1.79769313e308)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v26), CFSTR("leading"));
  if (v28 < 1.79769313e308)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v28), CFSTR("bottom"));
  if (v30 < 1.79769313e308)
    objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v30), CFSTR("trailing"));
  if (objc_msgSend(v31, "count"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, CFSTR("minimumSpacing"));
  return v33;
}

- (id)debugSetDelegateRespondsToSelectors
{
  void *v3;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x400000000000) != 0)
  {
    objc_msgSend(v3, "addObject:", NSStringFromSelector(sel_containerView_systemLayoutSizeFittingSize_forArrangedSubview_));
    containerFlags = self->_containerFlags;
    if ((*(_QWORD *)&containerFlags & 0x800000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&containerFlags & 0x1000000000000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_QWORD *)&containerFlags & 0x800000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", NSStringFromSelector(sel_containerView_layoutFrameForArrangedSubview_withProposedFrame_));
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x1000000000000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&containerFlags & 0x2000000000000) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "addObject:", NSStringFromSelector(sel_containerView_shouldRestartMeasurementDueToCompressionInAxis_forReason_));
    if ((*(_QWORD *)&self->_containerFlags & 0x4000000000000) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", NSStringFromSelector(sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_));
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x2000000000000) != 0)
    goto LABEL_11;
LABEL_5:
  if ((*(_QWORD *)&containerFlags & 0x4000000000000) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", NSStringFromSelector(sel_containerViewDidLayoutArrangedSubviews_));
  return v3;
}

- (id)debugSetEnabledFlags
{
  void *v3;
  void *v4;
  $E75A57F832BD0FF3084D204B7E402DB5 containerFlags;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = v3;
  containerFlags = self->_containerFlags;
  if ((*(_QWORD *)&containerFlags & 0x20000000000) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("debugBoundingBoxes"));
    containerFlags = self->_containerFlags;
  }
  if ((*(_QWORD *)&containerFlags & 0x40000000000) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("baselineRelative"));
    containerFlags = self->_containerFlags;
  }
  if ((int)(*(_DWORD *)&containerFlags << 8) >> 24 >= 1)
  {
    objc_msgSend(v4, "addObject:", CFSTR("delayedInvalidation"));
    containerFlags = self->_containerFlags;
  }
  if ((*(_DWORD *)&containerFlags & 0x30000000) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("inLayoutPass"));
    containerFlags = self->_containerFlags;
  }
  if ((*(_DWORD *)&containerFlags & 0xC0000000) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("inMeasurementPass"));
    containerFlags = self->_containerFlags;
  }
  if ((*(_QWORD *)&containerFlags & 0x200000000000) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("mustRestartMeasurement"));
  return v4;
}

- (void)_verifyInternalConsistencyWarningOnly:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA816000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_assertNotInLayoutPass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA816000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
