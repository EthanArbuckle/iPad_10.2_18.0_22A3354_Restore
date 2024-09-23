@implementation CKMessageAcknowledgmentPickerBarView

- (CKMessageAcknowledgmentPickerBarView)initWithGroupCounts:(id)a3 selectedType:(int64_t)a4 orientation:(char)a5 serviceName:(id)a6
{
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CKMessageAcknowledgmentPickerBarView *v19;
  CKMessageAcknowledgmentPickerBarView *v20;
  CALayer *v21;
  CALayer *anchorBubble;
  void *v23;
  double v24;
  void *v25;
  CALayer *v26;
  CALayer *intermediateBubble;
  void *v28;
  double v29;
  void *v30;
  UIView *v31;
  UIView *pillBubble;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t i;
  void *v46;
  CKMessageAcknowledgmentPickerBarItemViewPhone *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  NSObject *v57;
  id v58;
  int v59;
  void *v60;
  const __CFString *v61;
  NSObject *v62;
  id v63;
  void *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  __CFString *v70;
  void *v71;
  NSObject *v72;
  id v73;
  __CFString *v74;
  void *v75;
  id v77;
  id v78;
  id obj;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  const __CFString *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;
  CGPoint v93;
  CGPoint v94;
  CGPoint v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v92 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v78 = a6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C9D648];
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v11, "messageAcknowledgmentPickerBarSize");
  v16 = v15;
  v18 = v17;

  v84.receiver = self;
  v84.super_class = (Class)CKMessageAcknowledgmentPickerBarView;
  v19 = -[CKMessageAcknowledgmentPickerBarView initWithFrame:](&v84, sel_initWithFrame_, v13, v14, v16, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_groupAcknowledgmentCounts, a3);
    v20->_selectedAcknowledgment = a4;
    v20->_balloonOrientation = a5;
    v21 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    anchorBubble = v20->_anchorBubble;
    v20->_anchorBubble = v21;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageAcknowledgmentAnchorBubbleSize");
    -[CALayer setCornerRadius:](v20->_anchorBubble, "setCornerRadius:", v24 * 0.5);

    -[CKMessageAcknowledgmentPickerBarView layer](v20, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v20->_anchorBubble);

    v26 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    intermediateBubble = v20->_intermediateBubble;
    v20->_intermediateBubble = v26;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "messageAcknowledgmentIntermediateBubbleSize");
    -[CALayer setCornerRadius:](v20->_intermediateBubble, "setCornerRadius:", v29 * 0.5);

    -[CKMessageAcknowledgmentPickerBarView layer](v20, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSublayer:", v20->_intermediateBubble);

    -[CKMessageAcknowledgmentPickerBarView updateDynamicColorsForBubbleLayers](v20, "updateDynamicColorsForBubbleLayers");
    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    pillBubble = v20->_pillBubble;
    v20->_pillBubble = v31;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "theme");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "messageAcknowledgmentPickerBackgroundColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20->_pillBubble, "setBackgroundColor:", v35);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "messageAcknowledgmentPillBubbleSize");
    v38 = v37;
    -[UIView layer](v20->_pillBubble, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCornerRadius:", v38 * 0.5);

    -[CKMessageAcknowledgmentPickerBarView addSubview:](v20, "addSubview:", v20->_pillBubble);
    -[CKMessageAcknowledgmentPickerBarView setAutoresizesSubviews:](v20, "setAutoresizesSubviews:", 1);
    -[CKMessageAcknowledgmentPickerBarView setAccessibilityIdentifier:](v20, "setAccessibilityIdentifier:", CFSTR("AcknowledgmentPickerBar"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    +[CKMessageAcknowledgmentDraftDescriptor allMessageAcknowledgmentDescriptorsWithServiceName:](CKMessageAcknowledgmentDraftDescriptor, "allMessageAcknowledgmentDescriptorsWithServiceName:", v78);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v81;
      v43 = *(double *)(v12 + 16);
      v44 = *(double *)(v12 + 24);
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v81 != v42)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v47 = -[CKMessageAcknowledgmentPickerBarItemView initWithFrame:]([CKMessageAcknowledgmentPickerBarItemViewPhone alloc], "initWithFrame:", v13, v14, v43, v44);
          -[CKMessageAcknowledgmentPickerBarItemView configureWithMessageAcknowledgmentDescriptor:initiallySelected:](v47, "configureWithMessageAcknowledgmentDescriptor:initiallySelected:", v46, objc_msgSend(v46, "messageAcknowledgmentType") == v20->_selectedAcknowledgment);
          -[CKMessageAcknowledgmentPickerBarItemViewPhone frame](v47, "frame");
          v49 = v48;
          v51 = v50;
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize");
          v54 = v53;
          v56 = v55;

          -[CKMessageAcknowledgmentPickerBarItemViewPhone setFrame:](v47, "setFrame:", v49, v51, v54, v56);
          -[CKMessageAcknowledgmentPickerBarItemViewPhone setHidden:](v47, "setHidden:", 1);
          -[UIView addSubview:](v20->_pillBubble, "addSubview:", v47);
          objc_msgSend(obj, "addObject:", v47);

        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      }
      while (v41);
    }

    objc_storeStrong((id *)&v20->_acknowledgmentViews, obj);
    -[CKMessageAcknowledgmentPickerBarView setAnchorVerticalOrientation:](v20, "setAnchorVerticalOrientation:", 0);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        -[CKMessageAcknowledgmentPickerBarView frame](v20, "frame");
        NSStringFromCGRect(v96);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        v59 = -[CKMessageAcknowledgmentPickerBarView isHidden](v20, "isHidden");
        -[CKMessageAcknowledgmentPickerBarView alpha](v20, "alpha");
        v61 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v86 = v58;
        if (v59)
          v61 = CFSTR("YES");
        v87 = 2112;
        v88 = v61;
        v89 = 2048;
        v90 = v60;
        _os_log_impl(&dword_18DFCD000, v57, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView initWithGroupCounts:selectedType:orientation:] frame: %@, isHidden: %@, alpha: %.2f", buf, 0x20u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        -[UIView frame](v20->_pillBubble, "frame");
        NSStringFromCGRect(v97);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        -[UIView layer](v20->_pillBubble, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bounds");
        NSStringFromCGRect(v98);
        v65 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        -[UIView layer](v20->_pillBubble, "layer");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "position");
        NSStringFromCGPoint(v93);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v86 = v63;
        v87 = 2112;
        v88 = v65;
        v89 = 2112;
        v90 = v67;
        _os_log_impl(&dword_18DFCD000, v62, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (initWithGroupCounts:selectedType:orientation:) _pillBubble.frame: %@, _pillBubble.layer.bounds: %@, _pillBubble.layer.position: %@", buf, 0x20u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        -[CALayer frame](v20->_anchorBubble, "frame");
        NSStringFromCGRect(v99);
        v69 = (id)objc_claimAutoreleasedReturnValue();
        -[CALayer bounds](v20->_anchorBubble, "bounds");
        NSStringFromCGRect(v100);
        v70 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        -[CALayer position](v20->_anchorBubble, "position");
        NSStringFromCGPoint(v94);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v86 = v69;
        v87 = 2112;
        v88 = v70;
        v89 = 2112;
        v90 = v71;
        _os_log_impl(&dword_18DFCD000, v68, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (initWithGroupCounts:selectedType:orientation:) _anchorBubble.frame: %@, _anchorBubble.bounds: %@, _anchorBubble.position: %@", buf, 0x20u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        -[CALayer frame](v20->_intermediateBubble, "frame");
        NSStringFromCGRect(v101);
        v73 = (id)objc_claimAutoreleasedReturnValue();
        -[CALayer bounds](v20->_intermediateBubble, "bounds");
        NSStringFromCGRect(v102);
        v74 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        -[CALayer position](v20->_intermediateBubble, "position");
        NSStringFromCGPoint(v95);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v86 = v73;
        v87 = 2112;
        v88 = v74;
        v89 = 2112;
        v90 = v75;
        _os_log_impl(&dword_18DFCD000, v72, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (initWithGroupCounts:selectedType:orientation:) _intermediateBubble.frame: %@, _intermediateBubble.bounds: %@, _intermediateBubble.position: %@", buf, 0x20u);

      }
    }

  }
  return v20;
}

- (CGSize)_ackViewsBoundsWidth
{
  NSArray *acknowledgmentViews;
  NSUInteger v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  CGSize result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  acknowledgmentViews = self->_acknowledgmentViews;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CKMessageAcknowledgmentPickerBarView__ackViewsBoundsWidth__block_invoke;
  v11[3] = &unk_1E275A1C8;
  v11[4] = &v16;
  v11[5] = &v12;
  -[NSArray enumerateObjectsUsingBlock:](acknowledgmentViews, "enumerateObjectsUsingBlock:", v11);
  v4 = -[NSArray count](self->_acknowledgmentViews, "count");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageAcknowledgmentButtonMargin");
  v17[3] = v17[3] + (double)(v4 - 1) * v6;

  v7 = v17[3];
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

void __60__CKMessageAcknowledgmentPickerBarView__ackViewsBoundsWidth__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Width;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  uint64_t v14;
  CGRect v15;
  CGRect v16;

  v3 = a2;
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v15);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  Height = CGRectGetHeight(v16);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Width
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v14 + 24) >= Height)
    Height = *(double *)(v14 + 24);
  *(double *)(v14 + 24) = Height;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKMessageAcknowledgmentPickerBarView;
  -[CKMessageAcknowledgmentPickerBarView layoutSubviews](&v2, sel_layoutSubviews);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentPickerBarSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_hasGroupCounts
{
  return self->_groupAcknowledgmentCounts != 0;
}

- (void)setAnchorBubblePosition:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  self->_anchorBubblePosition = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentAnchorBubbleSize");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageAcknowledgmentAnchorBubbleSize");
  -[CALayer setFrame:](self->_anchorBubble, "setFrame:", 0.0, 0.0, v6, v8);

  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  -[CALayer setPosition:](self->_anchorBubble, "setPosition:");
}

- (void)performShowAnimation:(id)a3
{
  NSObject *v3;
  id v4;
  int v5;
  double v6;
  const __CFString *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  NSObject *v14;
  id v15;
  id v16;
  double v17;
  NSObject *v18;
  id v19;
  id v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
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
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  NSArray *acknowledgmentViews;
  uint64_t v159;
  id v160;
  double v161;
  uint64_t v162;
  void *v163;
  _QWORD v165[5];
  _QWORD v166[9];
  CATransform3D v167;
  CATransform3D v168;
  CATransform3D v169;
  CATransform3D v170;
  CATransform3D v171;
  CATransform3D v172;
  _BYTE buf[24];
  double v174;
  uint64_t v175;
  CGPoint v176;
  CGPoint v177;
  CGPoint v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;

  v175 = *MEMORY[0x1E0C80C00];
  v160 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKMessageAcknowledgmentPickerBarView frame](self, "frame");
      NSStringFromCGRect(v179);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = -[CKMessageAcknowledgmentPickerBarView isHidden](self, "isHidden");
      -[CKMessageAcknowledgmentPickerBarView alpha](self, "alpha");
      v7 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v4;
      if (v5)
        v7 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2048;
      v174 = v6;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView performShowAnimation:] started. frame: %@, isHidden: %@, alpha: %.2f", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[UIView frame](self->_pillBubble, "frame");
      NSStringFromCGRect(v180);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_pillBubble, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      NSStringFromCGRect(v181);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_pillBubble, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "position");
      NSStringFromCGPoint(v176);
      v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v174 = v13;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation start) _pillBubble.frame: %@, _pillBubble.layer.bounds: %@, _pillBubble.layer.position: %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[CALayer frame](self->_anchorBubble, "frame");
      NSStringFromCGRect(v182);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer bounds](self->_anchorBubble, "bounds");
      NSStringFromCGRect(v183);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer position](self->_anchorBubble, "position");
      NSStringFromCGPoint(v177);
      v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v174 = v17;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation start) _anchorBubble.frame: %@, _anchorBubble.bounds: %@, _anchorBubble.position: %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[CALayer frame](self->_intermediateBubble, "frame");
      NSStringFromCGRect(v184);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer bounds](self->_intermediateBubble, "bounds");
      NSStringFromCGRect(v185);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer position](self->_intermediateBubble, "position");
      NSStringFromCGPoint(v178);
      v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v174 = v21;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation start) _intermediateBubble.frame: %@, _intermediateBubble.bounds: %@, _intermediateBubble.position: %@", buf, 0x20u);

    }
  }
  -[CKMessageAcknowledgmentPickerBarView setHidden:](self, "setHidden:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageAcknowledgmentAnchorBubbleSize");
  v24 = v23;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "messageAcknowledgmentAnchorBubbleSize");
  -[CALayer setFrame:](self->_anchorBubble, "setFrame:", 0.0, 0.0, v24, v26);

  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  -[CALayer setPosition:](self->_anchorBubble, "setPosition:");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "messageAcknowledgmentIntermediateBubbleSize");
  v29 = v28;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "messageAcknowledgmentIntermediateBubbleSize");
  -[CALayer setFrame:](self->_intermediateBubble, "setFrame:", 0.0, 0.0, v29, v31);

  if (self->_balloonOrientation)
    v32 = -1.0;
  else
    v32 = 1.0;
  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  v34 = v33;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "messageAcknowledgmentIntermediateBubbleSize");
  v37 = v36;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "messageAcknowledgmentAnchorBubbleSize");
  v40 = v39;
  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  v42 = v41;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "messageAcknowledgmentIntermediateBubbleSize");
  v45 = v44;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "messageAcknowledgmentAnchorBubbleSize");
  -[CALayer setPosition:](self->_intermediateBubble, "setPosition:", v34 + v32 * (v37 - v40), v42 - (v45 - v47));

  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  v49 = v48;
  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  v51 = v50;
  -[CKMessageAcknowledgmentPickerBarView anchorBubblePosition](self, "anchorBubblePosition");
  v53 = v52;
  v55 = v54;
  v56 = v54 + -13.0;
  if (-[CKMessageAcknowledgmentPickerBarView anchorVerticalOrientation](self, "anchorVerticalOrientation") == 1)
  {
    -[CALayer frame](self->_anchorBubble, "frame");
    v57 = v53 + v32 * 8.0;
    v59 = v55 + v58 * 0.5;
    v60 = v53;
  }
  else
  {
    v60 = v53 + v32 * -8.0;
    v57 = v53;
    v53 = v49 + -37.0;
    v59 = v55 + -13.0;
    v56 = v55;
    v55 = v51 + -16.0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 2.0);
  -[CALayer convertTime:fromLayer:](self->_anchorBubble, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v161 = v61;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setBeginTime:", v161);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v53, v55);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setFromValue:", v62);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v57, v56);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setToValue:", v63);

  objc_msgSend(v163, "setMass:", 1.0);
  objc_msgSend(v163, "setStiffness:", 80.0);
  objc_msgSend(v163, "setDamping:", 50.0);
  objc_msgSend(v163, "setInitialVelocity:", 0.0);
  objc_msgSend(v163, "setDuration:", 1.5);
  v162 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v163, "setFillMode:");
  objc_msgSend(v163, "setRemovedOnCompletion:", 0);
  LODWORD(v64) = 1086828052;
  objc_msgSend(v163, "setSpeed:", v64);
  -[CALayer addAnimation:forKey:](self->_anchorBubble, "addAnimation:forKey:", v163, CFSTR("initial-pos-in-animation"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setBeginTime:", v161 + 0.00673076923);
  v66 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v172, 0.0, 0.0, 1.0);
  objc_msgSend(v66, "valueWithCATransform3D:", &v172);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFromValue:", v67);

  v68 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v171, 1.0, 1.0, 1.0);
  objc_msgSend(v68, "valueWithCATransform3D:", &v171);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setToValue:", v69);

  objc_msgSend(v65, "setMass:", 1.0);
  objc_msgSend(v65, "setStiffness:", 40.0);
  objc_msgSend(v65, "setDamping:", 8.0);
  objc_msgSend(v65, "setDuration:", 2.0);
  objc_msgSend(v65, "setFillMode:", v162);
  objc_msgSend(v65, "setRemovedOnCompletion:", 0);
  LODWORD(v70) = 1086828052;
  objc_msgSend(v65, "setSpeed:", v70);
  -[CALayer addAnimation:forKey:](self->_anchorBubble, "addAnimation:forKey:", v65, CFSTR("initial-scale-in-animation"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v72) = 1082465976;
  objc_msgSend(v71, "setSpeed:", v72);
  objc_msgSend(v71, "setBeginTime:", v161 + 0.0221153846);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v57, v56);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setFromValue:", v73);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v60, v59);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setToValue:", v74);

  objc_msgSend(v71, "setMass:", 1.0);
  objc_msgSend(v71, "setStiffness:", 80.0);
  objc_msgSend(v71, "setDamping:", 50.0);
  objc_msgSend(v71, "setInitialVelocity:", 0.0);
  objc_msgSend(v71, "setDuration:", 1.5);
  objc_msgSend(v71, "setFillMode:", v162);
  objc_msgSend(v71, "setRemovedOnCompletion:", 0);
  -[CALayer addAnimation:forKey:](self->_intermediateBubble, "addAnimation:forKey:", v71, CFSTR("initial-pos-in-animation"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setBeginTime:", v161 + 0.0221153846 + 0.0221153846);
  v76 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v170, 0.0, 0.0, 1.0);
  objc_msgSend(v76, "valueWithCATransform3D:", &v170);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFromValue:", v77);

  v78 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v169, 0.9, 0.9, 1.0);
  objc_msgSend(v78, "valueWithCATransform3D:", &v169);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setToValue:", v79);

  objc_msgSend(v75, "setMass:", 1.0);
  objc_msgSend(v75, "setStiffness:", 40.0);
  objc_msgSend(v75, "setDamping:", 8.0);
  objc_msgSend(v75, "setDuration:", 2.0);
  objc_msgSend(v75, "setFillMode:", v162);
  objc_msgSend(v75, "setRemovedOnCompletion:", 0);
  LODWORD(v80) = 1090854584;
  objc_msgSend(v75, "setSpeed:", v80);
  -[CALayer addAnimation:forKey:](self->_intermediateBubble, "addAnimation:forKey:", v75, CFSTR("initial-scale-in-animation"));
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "messageAcknowledgmentPickerBarPadding");
  v83 = v82;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "messageAcknowledgmentPillBubbleSize");
  v86 = v85;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "messageAcknowledgmentPillBubbleSize");
  v89 = v88;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "messageAcknowledgmentPillBubbleSize");
  v92 = v91;
  -[UIView layer](self->_pillBubble, "layer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setFrame:", 0.0, 0.0, v89, v92);

  -[UIView layer](self->_pillBubble, "layer");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setPosition:", v60, v56 - v83);

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setBeginTime:", v161 + 0.0769230769 + 0.00288461538);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v60, v56 - v83);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFromValue:", v96);

  v97 = v60 - v83;
  v98 = v83 + v86 * 0.5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setToValue:", v99);

  objc_msgSend(v95, "setMass:", 1.0);
  objc_msgSend(v95, "setStiffness:", 80.0);
  objc_msgSend(v95, "setDamping:", 50.0);
  objc_msgSend(v95, "setInitialVelocity:", 0.0);
  objc_msgSend(v95, "setDuration:", 1.5);
  LODWORD(v100) = 1086828052;
  objc_msgSend(v95, "setSpeed:", v100);
  objc_msgSend(v95, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v95, "setRemovedOnCompletion:", 0);
  -[UIView layer](self->_pillBubble, "layer");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addAnimation:forKey:", v95, CFSTR("initial-pos-in-animation"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setBeginTime:", v161 + 0.0769230769 + 0.00288461538);
  v103 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v168, 0.0, 0.0, 1.0);
  objc_msgSend(v103, "valueWithCATransform3D:", &v168);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setFromValue:", v104);

  v105 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v167, 1.0, 1.0, 1.0);
  objc_msgSend(v105, "valueWithCATransform3D:", &v167);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setToValue:", v106);

  objc_msgSend(v102, "setMass:", 1.0);
  objc_msgSend(v102, "setStiffness:", 80.0);
  objc_msgSend(v102, "setDamping:", 20.0);
  objc_msgSend(v102, "setDuration:", 1.5);
  objc_msgSend(v102, "setFillMode:", v162);
  objc_msgSend(v102, "setRemovedOnCompletion:", 0);
  LODWORD(v107) = 1090854584;
  objc_msgSend(v102, "setSpeed:", v107);
  -[UIView layer](self->_pillBubble, "layer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addAnimation:forKey:", v102, CFSTR("initial-scale-in-animation"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds.size.width"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v161 + 0.0769230769 + 0.0413461538;
  objc_msgSend(v109, "setBeginTime:", v110);
  v111 = (void *)MEMORY[0x1E0CB37E8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "messageAcknowledgmentPillBubbleSize");
  objc_msgSend(v111, "numberWithDouble:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setFromValue:", v114);

  v115 = (void *)MEMORY[0x1E0CB37E8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "messageAcknowledgmentPillBubbleSize");
  objc_msgSend(v115, "numberWithDouble:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setToValue:", v117);

  objc_msgSend(v109, "setMass:", 3.0);
  objc_msgSend(v109, "setStiffness:", 50.0);
  objc_msgSend(v109, "setDamping:", 17.0);
  objc_msgSend(v109, "settlingDuration");
  objc_msgSend(v109, "setDuration:");
  objc_msgSend(v109, "setFillMode:", v162);
  LODWORD(v118) = 1083556495;
  objc_msgSend(v109, "setSpeed:", v118);
  objc_msgSend(v109, "setRemovedOnCompletion:", 0);
  LODWORD(v119) = 0;
  LODWORD(v120) = 1.0;
  LODWORD(v121) = 1043207291;
  LODWORD(v122) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v121, v119, v122, v120);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setTimingFunction:", v123);

  -[UIView layer](self->_pillBubble, "layer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addAnimation:forKey:", v109, CFSTR("initial-size-in-animation"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setBeginTime:", v110);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v97);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setFromValue:", v126);

  v127 = (void *)MEMORY[0x1E0CB37E8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "messageAcknowledgmentPillBubbleSize");
  objc_msgSend(v127, "numberWithDouble:", v129 * 0.5);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setToValue:", v130);

  objc_msgSend(v125, "setMass:", 3.0);
  objc_msgSend(v125, "setStiffness:", 50.0);
  objc_msgSend(v125, "setDamping:", 17.0);
  objc_msgSend(v125, "setInitialVelocity:", 0.0);
  objc_msgSend(v125, "setDuration:", 1.5);
  LODWORD(v131) = 1083556495;
  objc_msgSend(v125, "setSpeed:", v131);
  objc_msgSend(v125, "setFillMode:", v162);
  objc_msgSend(v125, "setRemovedOnCompletion:", 0);
  LODWORD(v132) = 0;
  LODWORD(v133) = 1.0;
  LODWORD(v134) = 1043207291;
  LODWORD(v135) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v134, v132, v135, v133);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setTimingFunction:", v136);

  -[UIView layer](self->_pillBubble, "layer");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "addAnimation:forKey:", v125, CFSTR("initial-stretch-in-animation"));

  -[UIView bounds](self->_pillBubble, "bounds");
  v139 = v138;
  v141 = v140;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "messageAcknowledgmentPillBubbleSize");
  v144 = v143;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "messageAcknowledgmentPillBubbleSize");
  v147 = v146;

  -[UIView layer](self->_pillBubble, "layer");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setBounds:", v139, v141, v144, v147);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "messageAcknowledgmentPillBubbleSize");
  v151 = v150;
  -[UIView layer](self->_pillBubble, "layer");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setPosition:", v151 * 0.5, v98);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v174 = 0.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "messageAcknowledgmentPillBubbleSize");
  v155 = v154;
  -[CKMessageAcknowledgmentPickerBarView _ackViewsBoundsWidth](self, "_ackViewsBoundsWidth");
  v157 = v156;

  acknowledgmentViews = self->_acknowledgmentViews;
  v159 = MEMORY[0x1E0C809B0];
  v174 = v155 * 0.5 + v157 * -0.5;
  v166[0] = MEMORY[0x1E0C809B0];
  v166[1] = 3221225472;
  v166[2] = __61__CKMessageAcknowledgmentPickerBarView_performShowAnimation___block_invoke;
  v166[3] = &unk_1E275A1F0;
  *(double *)&v166[6] = v110;
  v166[7] = 0x3FDEC4EC4EC4EC4ELL;
  v166[4] = self;
  v166[5] = buf;
  *(double *)&v166[8] = v161;
  -[NSArray enumerateObjectsUsingBlock:](acknowledgmentViews, "enumerateObjectsUsingBlock:", v166);
  v165[0] = v159;
  v165[1] = 3221225472;
  v165[2] = __61__CKMessageAcknowledgmentPickerBarView_performShowAnimation___block_invoke_61;
  v165[3] = &unk_1E274A208;
  v165[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v165);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  _Block_object_dispose(buf, 8);

}

void __61__CKMessageAcknowledgmentPickerBarView_performShowAnimation___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double Width;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;
  CGRect v40;

  v5 = a2;
  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBeginTime:", *(double *)(a1 + 48) + 0.0192307692);
  objc_msgSend(v38, "setDuration:", 0.1);
  objc_msgSend(v38, "setFromValue:", &unk_1E28719B0);
  objc_msgSend(v38, "setToValue:", &unk_1E28719C0);
  v6 = 1.0 / *(double *)(a1 + 56);
  *(float *)&v6 = v6;
  objc_msgSend(v38, "setSpeed:", v6);
  objc_msgSend(v38, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v38, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v38, CFSTR("initial-alpha-in-animation"));

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setOpacity:", v9);

  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v5, "bounds");
  v11 = v10 + CGRectGetWidth(v39) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = round(v11 * v13) / v13;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBeginTime:", *(double *)(a1 + 48));
  v16 = (void *)MEMORY[0x1E0CB37E8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageAcknowledgmentPillBubbleSize");
  objc_msgSend(v16, "numberWithDouble:", v18 * 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v15, "setMass:", 3.0);
  objc_msgSend(v15, "setStiffness:", 70.0);
  objc_msgSend(v15, "setDamping:", 20.0);
  objc_msgSend(v15, "setDuration:", 1.5);
  v21 = 1.0 / *(double *)(a1 + 56) * 2.5;
  *(float *)&v21 = v21;
  objc_msgSend(v15, "setSpeed:", v21);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  LODWORD(v22) = 1043207291;
  LODWORD(v23) = 1051931443;
  LODWORD(v24) = 0;
  LODWORD(v25) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v22, v24, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v26);

  objc_msgSend(v5, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAnimation:forKey:", v15, CFSTR("initial-pos-in-animation"));

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "messageAcknowledgmentPillBubbleSize");
  v30 = v29 * 0.5;
  objc_msgSend(v5, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPosition:", v14, v30);

  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v40);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "messageAcknowledgmentButtonMargin");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = Width
                                                              + v34
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

  objc_msgSend(v5, "acknowledgmentGlyphView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = *(double *)(a1 + 64) + (float)((float)((float)a3 * 0.05) + 0.15);
  objc_msgSend(v35, "animationDuration");
  objc_msgSend(v35, "animateWithBeginTime:completionDelay:completion:", 0, v36, v37);

}

void __61__CKMessageAcknowledgmentPickerBarView_performShowAnimation___block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGPoint v28;
  CGPoint v29;
  CGPoint v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v27 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "frame");
      NSStringFromCGRect(v31);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(*(id *)(a1 + 32), "isHidden");
      objc_msgSend(*(id *)(a1 + 32), "alpha");
      v6 = CFSTR("NO");
      v21 = 138412802;
      v22 = v3;
      if (v4)
        v6 = CFSTR("YES");
      v23 = 2112;
      v24 = v6;
      v25 = 2048;
      v26 = v5;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView performShowAnimation:] completed. frame: %@, isHidden: %@, alpha: %.2f", (uint8_t *)&v21, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "frame");
      NSStringFromCGRect(v32);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      NSStringFromCGRect(v33);
      v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "position");
      NSStringFromCGPoint(v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation end) _pillBubble.frame: %@, _pillBubble.layer.bounds: %@, _pillBubble.layer.position: %@", (uint8_t *)&v21, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "frame");
      NSStringFromCGRect(v34);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "bounds");
      NSStringFromCGRect(v35);
      v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "position");
      NSStringFromCGPoint(v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation end) _anchorBubble.frame: %@, _anchorBubble.bounds: %@, _anchorBubble.position: %@", (uint8_t *)&v21, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
      NSStringFromCGRect(v36);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "bounds");
      NSStringFromCGRect(v37);
      v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "position");
      NSStringFromCGPoint(v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (show animation end) _intermediateBubble.frame: %@, _intermediateBubble.bounds: %@, _intermediateBubble.position: %@", (uint8_t *)&v21, 0x20u);

    }
  }
}

- (void)performSelectedAnimation:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_acknowledgmentViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSelected", (_QWORD)v16))
        {
          objc_msgSend(v10, "acknowledgmentGlyphView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
          v14 = v13 + 0.05;

          objc_msgSend(v11, "animationDuration");
          objc_msgSend(v11, "animateWithBeginTime:completionDelay:completion:", v4, v14, v15);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)performSendAnimation:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView performSendAnimation:]", v6, 2u);
    }

  }
  -[CKMessageAcknowledgmentPickerBarView performCancelAnimation:](self, "performCancelAnimation:", v4);

}

- (void)performCancelAnimation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKMessageAcknowledgmentPickerBarView frame](self, "frame");
      NSStringFromCGRect(v39);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = -[CKMessageAcknowledgmentPickerBarView isHidden](self, "isHidden");
      -[CKMessageAcknowledgmentPickerBarView alpha](self, "alpha");
      v9 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v30 = v6;
      if (v7)
        v9 = CFSTR("YES");
      v31 = 2112;
      v32 = v9;
      v33 = 2048;
      v34 = v8;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView performCancelAnimation:] started. frame: %@, isHidden: %@, alpha: %.2f", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[UIView frame](self->_pillBubble, "frame");
      NSStringFromCGRect(v40);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_pillBubble, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      NSStringFromCGRect(v41);
      v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_pillBubble, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "position");
      NSStringFromCGPoint(v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v11;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation start) _pillBubble.frame: %@, _pillBubble.layer.bounds: %@, _pillBubble.layer.position: %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[CALayer frame](self->_anchorBubble, "frame");
      NSStringFromCGRect(v42);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer bounds](self->_anchorBubble, "bounds");
      NSStringFromCGRect(v43);
      v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CALayer position](self->_anchorBubble, "position");
      NSStringFromCGPoint(v37);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation start) _anchorBubble.frame: %@, _anchorBubble.bounds: %@, _anchorBubble.position: %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[CALayer frame](self->_intermediateBubble, "frame");
      NSStringFromCGRect(v44);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer bounds](self->_intermediateBubble, "bounds");
      NSStringFromCGRect(v45);
      v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CALayer position](self->_intermediateBubble, "position");
      NSStringFromCGPoint(v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation start) _intermediateBubble.frame: %@, _intermediateBubble.bounds: %@, _intermediateBubble.position: %@", buf, 0x20u);

    }
  }
  v24 = (void *)MEMORY[0x1E0CEABB0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__CKMessageAcknowledgmentPickerBarView_performCancelAnimation___block_invoke;
  v28[3] = &unk_1E274A208;
  v28[4] = self;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__CKMessageAcknowledgmentPickerBarView_performCancelAnimation___block_invoke_2;
  v26[3] = &unk_1E274C780;
  v26[4] = self;
  v27 = v4;
  v25 = v4;
  objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 0, v28, v26, 0.150000006, 0.0);

}

uint64_t __63__CKMessageAcknowledgmentPickerBarView_performCancelAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __63__CKMessageAcknowledgmentPickerBarView_performCancelAnimation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  void *v20;
  uint64_t result;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  CGPoint v29;
  CGPoint v30;
  CGPoint v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "frame");
      NSStringFromCGRect(v32);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(*(id *)(a1 + 32), "isHidden");
      objc_msgSend(*(id *)(a1 + 32), "alpha");
      v6 = CFSTR("NO");
      v22 = 138412802;
      v23 = v3;
      if (v4)
        v6 = CFSTR("YES");
      v24 = 2112;
      v25 = v6;
      v26 = 2048;
      v27 = v5;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-[CKMessageAcknowledgementPickerView performCancelAnimation:] completed. frame: %@, isHidden: %@, alpha: %.2f", (uint8_t *)&v22, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "frame");
      NSStringFromCGRect(v33);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      NSStringFromCGRect(v34);
      v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "position");
      NSStringFromCGPoint(v29);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation end) _pillBubble.frame: %@, _pillBubble.layer.bounds: %@, _pillBubble.layer.position: %@", (uint8_t *)&v22, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "frame");
      NSStringFromCGRect(v35);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "bounds");
      NSStringFromCGRect(v36);
      v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "position");
      NSStringFromCGPoint(v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation end) _anchorBubble.frame: %@, _anchorBubble.bounds: %@, _anchorBubble.position: %@", (uint8_t *)&v22, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
      NSStringFromCGRect(v37);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "bounds");
      NSStringFromCGRect(v38);
      v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "position");
      NSStringFromCGPoint(v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKMessageAcknowledgementPickerView (cancel animation end) _intermediateBubble.frame: %@, _intermediateBubble.bounds: %@, _intermediateBubble.position: %@", (uint8_t *)&v22, 0x20u);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateDynamicColorsForBubbleLayers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentPickerBackgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CKMessageAcknowledgmentPickerBarView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedColorWithTraitCollection:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");

  -[CALayer setBackgroundColor:](self->_anchorBubble, "setBackgroundColor:", v7);
  -[CALayer setBackgroundColor:](self->_intermediateBubble, "setBackgroundColor:", v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageAcknowledgmentPickerBarView;
  -[CKMessageAcknowledgmentPickerBarView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKMessageAcknowledgmentPickerBarView updateDynamicColorsForBubbleLayers](self, "updateDynamicColorsForBubbleLayers");
}

- (NSArray)acknowledgmentViews
{
  return self->_acknowledgmentViews;
}

- (void)setAcknowledgmentViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (CGPoint)anchorBubblePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorBubblePosition.x;
  y = self->_anchorBubblePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (char)anchorVerticalOrientation
{
  return self->_anchorVerticalOrientation;
}

- (void)setAnchorVerticalOrientation:(char)a3
{
  self->_anchorVerticalOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgmentViews, 0);
  objc_storeStrong((id *)&self->_groupAcknowledgmentCounts, 0);
  objc_storeStrong((id *)&self->_pillBubble, 0);
  objc_storeStrong((id *)&self->_intermediateBubble, 0);
  objc_storeStrong((id *)&self->_anchorBubble, 0);
}

@end
