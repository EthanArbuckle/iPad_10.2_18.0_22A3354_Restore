@implementation CKConversationListStandardCell

- (BOOL)_boundsShouldCollapseContent:(CGRect)a3
{
  double width;
  void *v4;
  double v5;
  BOOL v6;

  width = a3.size.width;
  if (!CKIsRunningInMacCatalyst())
    return 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapToMinConversationListCellWidth");
  v6 = width < v5;

  return v6;
}

- (BOOL)_shouldShowTypingIndicatorForConversation:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[CKConversationListCell shouldAppearAsRecoverableConversation](self, "shouldAppearAsRecoverableConversation")
    && (objc_msgSend(v4, "isPlaceholder") & 1) == 0
    && -[CKConversationListCell lastMessageIsTypingIndicator](self, "lastMessageIsTypingIndicator");

  return v5;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CKConversationListCell isMuted](self, "isMuted");
  v6.receiver = self;
  v6.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell setMuted:](&v6, sel_setMuted_, v3);
  if (v5 != v3)
    -[CKConversationListStandardCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateUnreadIndicatorWithImage:(id)a3 animated:(BOOL)a4
{
  id v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD aBlock[5];
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = -[CKConversationListStandardCell _shouldHideUnreadIndicatorForEditing:](self, "_shouldHideUnreadIndicatorForEditing:", -[CKConversationListStandardCell isEditing](self, "isEditing"));
  if (v6)
  {
    v8 = v7;
    -[UIImageView superview](self->_unreadIndicatorImageView, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[CKConversationListStandardCell addSubview:](self, "addSubview:", self->_unreadIndicatorImageView);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke;
    aBlock[3] = &unk_1E274E150;
    aBlock[4] = self;
    v17 = v8;
    v16 = v6;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);

    if (a4)
    {
      v11 = 0;
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v10, v11, 0.300000012);
LABEL_11:

      goto LABEL_12;
    }
    v10[2](v10);
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_2;
    v14[3] = &unk_1E274A208;
    v14[4] = self;
    v10 = (void (**)(_QWORD))_Block_copy(v14);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_3;
    v13[3] = &unk_1E274A1B8;
    v13[4] = self;
    v11 = _Block_copy(v13);
    if (a4)
      goto LABEL_7;
    v10[2](v10);
    if (v11)
    {
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, 1);
      goto LABEL_11;
    }
  }
LABEL_12:

}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "removeFromSuperview");
}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 0.0);
}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
  -[CKConversationListStandardCell updateUnreadIndicatorWithImage:animated:](self, "updateUnreadIndicatorWithImage:animated:", a3, 0);
}

- (void)_updateLabelVisibility
{
  _BOOL8 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[CKConversationListStandardCell _isCollapsed](self, "_isCollapsed");
  v4 = -[CKConversationListCell shouldHidePreviewSummary](self, "shouldHidePreviewSummary");
  -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v4 | v3);

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 | v3);

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v3);

}

- (void)layoutSubviews
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  _BOOL8 v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double MinX;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  uint64_t v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  void *v133;
  double v134;
  id v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  void *v158;
  double v159;
  double v160;
  void *v161;
  double MaxX;
  void *v163;
  double MaxY;
  void *v165;
  void *v166;
  void *v167;
  UIImageView *unreadIndicatorImageView;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  double v178;
  void *v179;
  void *v180;
  double v181;
  void *v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  double v188;
  void *v189;
  void *v190;
  objc_class *v191;
  void *v192;
  double v193;
  CGFloat v194;
  CGFloat v195;
  objc_super v196;
  _QWORD v197[3];
  _QWORD v198[4];
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  v198[3] = *MEMORY[0x1E0C80C00];
  v196.receiver = self;
  v196.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListStandardCell layoutSubviews](&v196, sel_layoutSubviews);
  -[CKConversationListCell cellLayout](self, "cellLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[CKConversationListStandardCell showDownloadingPendingMessages](self, "showDownloadingPendingMessages"))
    {
      -[CKConversationListStandardCell setShowDownloadingPendingMessages:](self, "setShowDownloadingPendingMessages:", 0);
      -[CKConversationListStandardCell _setupDownloadingPendingMessagesView](self, "_setupDownloadingPendingMessagesView");
    }
    if (-[CKConversationListStandardCell showTypingIndicator](self, "showTypingIndicator"))
    {
      -[CKConversationListStandardCell setShowTypingIndicator:](self, "setShowTypingIndicator:", 0);
      -[CKConversationListStandardCell _stopTypingIndicator](self, "_stopTypingIndicator");
      -[CKConversationListStandardCell _startTypingIndicator](self, "_startTypingIndicator");
    }
    v5 = -[CKConversationListStandardCell _isCollapsed](self, "_isCollapsed");
    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrientation:", v5);

    v7 = -[CKConversationListStandardCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CKConversationListStandardCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = -[CKConversationListStandardCell _boundsShouldCollapseContent:](self, "_boundsShouldCollapseContent:", v10, v12, v14, v16);
    v18 = -[CKConversationListCell showingEditControl](self, "showingEditControl");
    v19 = -[CKConversationListCell _editingPins](self, "_editingPins");
    -[CKConversationListStandardCell traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    v193 = v21;

    -[CKConversationListCell cellLayout](self, "cellLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = (objc_class *)objc_opt_class();
      NSStringFromClass(v191);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListStandardCell.m"), 416, CFSTR("%@ needs a cell layout."), v192);

    }
    -[CKConversationListCell delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widthForDeterminingAvatarVisibility");
    v25 = v24;

    if ((objc_msgSend(v22, "isValidForContentViewWidth:widthForDeterminingAvatarVisibility:showingEditControl:", v18, v14, v25) & 1) == 0)-[CKConversationListStandardCell _calculateLayoutFrames](self, "_calculateLayoutFrames");
    objc_msgSend(v22, "senderFrame");
    v194 = v26;
    v195 = v27;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v22, "dateFrame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[CKConversationListCell dateLabel](self, "dateLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeToFit");

    -[CKConversationListCell dateLabel](self, "dateLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;

    v44 = 0.0;
    if (!v19)
      v44 = v43;
    v45 = v29 + v37 - v44;
    v46 = v33;
    v47 = v35;
    v48 = v37;
    v49 = v39;
    if ((v7 & 1) != 0)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v46);
      v199.origin.x = v194;
      v51 = v195;
      v199.origin.y = v195;
      v199.size.width = v29;
      v199.size.height = v31;
      v52 = CGRectGetMaxX(v199) - v45;
    }
    else
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v46) - v43;
      v200.origin.x = v194;
      v51 = v195;
      v200.origin.y = v195;
      v200.size.width = v29;
      v200.size.height = v31;
      v52 = CGRectGetMinX(v200);
    }
    -[CKConversationListCell dateLabel](self, "dateLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", MinX, v35, v43, v39);

    -[CKConversationListCell fromLabel](self, "fromLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v52, v51, v45, v31);

    -[CKConversationListStandardCell avatarView](self, "avatarView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v22, "shouldShowAvatarView");
    if (v56)
    {
      objc_msgSend(v22, "avatarFrame");
      objc_msgSend(v55, "setFrame:");
    }
    objc_msgSend(v55, "setHidden:", v56 ^ 1u);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "showsConversationListCellChevronImage"))
      v58 = objc_msgSend(v22, "shouldShowChevron") ^ 1 | v18;
    else
      v58 = 1;

    -[CKConversationListCell chevronImageView](self, "chevronImageView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setHidden:", v58);

    objc_msgSend(v22, "chevronFrame");
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;
    -[CKConversationListCell chevronImageView](self, "chevronImageView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

    objc_msgSend(v22, "indicatorContainerFrame");
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;
    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "verticalOffsetForCenteringVisibleIndicators");
    v79 = v78;

    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v70, v72 - v79, v74, v76);

    objc_msgSend(v22, "summaryFrameIfAccessoryIndicatorHidden");
    v82 = v81;
    v84 = v83;
    v86 = v85;
    v88 = v87;
    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "widthForVisibleIndicators");
    v91 = v90;

    -[CKConversationListStandardCell contentView](self, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "effectiveUserInterfaceLayoutDirection");

    v94 = -0.0;
    if (v93 == 1)
      v94 = v91;
    v95 = v82 + v94;
    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setFrame:", v95, v84, v86 - v91, v88);

    objc_msgSend(v22, "summaryLabelCapFrameYOrigin");
    v98 = v97;
    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "_setFirstLineCapFrameOriginY:", v98);

    -[CKConversationListStandardCell _updateTypingIndicatorFrame:isCollapsed:](self, "_updateTypingIndicatorFrame:isCollapsed:", v7 ^ 1u, v17);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "showsHoverToDeleteButton");

    if (v101)
    {
      -[CKConversationListStandardCell contentView](self, "contentView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "frame");
      v104 = v103;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "conversationListCellCloseButtonWidth");
      v107 = v106 * 0.5;

      if ((v7 & 1) != 0)
      {
        objc_msgSend(v22, "trailingLayoutMarginSize");
        v109 = v108;
        if (v17)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "conversationListContactImageTrailingSpace");
          v112 = (v109 + v111) * 0.5;

          v109 = v112 - v107;
        }
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v197[0] = objc_msgSend(v113, "CGColor");
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v197[1] = objc_msgSend(v114, "CGColor");
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v197[2] = objc_msgSend(v115, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v197, 3);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCell gradient](self, "gradient");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setColors:", v116);

        -[CKConversationListCell gradient](self, "gradient");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setStartPoint:", 0.0, 0.0);

        -[CKConversationListCell gradient](self, "gradient");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setEndPoint:", 1.0, 0.0);

        -[CKConversationListCell gradient](self, "gradient");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v120;
        v122 = &unk_1E286F778;
      }
      else
      {
        if (v17)
        {
          objc_msgSend(v22, "trailingLayoutMarginSize");
          v124 = v123;
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "conversationListContactImageTrailingSpace");
          v127 = (v124 + v126) * -0.5;

          v109 = v104 + v127 - v107;
        }
        else
        {
          -[CKConversationListStandardCell contentView](self, "contentView");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "frame");
          v130 = v129;
          objc_msgSend(v22, "trailingLayoutMarginSize");
          v132 = v130 - v131;
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "conversationListCellCloseButtonWidth");
          v109 = v132 - v134;

        }
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v135 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v198[0] = objc_msgSend(v135, "CGColor");
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v136 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v198[1] = objc_msgSend(v136, "CGColor");
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v137 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v198[2] = objc_msgSend(v137, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 3);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCell gradient](self, "gradient");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setColors:", v138);

        -[CKConversationListCell gradient](self, "gradient");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setStartPoint:", 0.0, 0.0);

        -[CKConversationListCell gradient](self, "gradient");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setEndPoint:", 1.0, 0.0);

        -[CKConversationListCell gradient](self, "gradient");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v120;
        v122 = &unk_1E286F760;
      }
      objc_msgSend(v120, "setLocations:", v122);

      -[CKConversationListStandardCell contentView](self, "contentView");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "frame");
      v144 = v143 * 0.5;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "conversationListCellCloseButtonHeight");
      v147 = v144 - v146 * 0.5;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "conversationListCellCloseButtonWidth");
      v150 = v149;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "conversationListCellCloseButtonHeight");
      v153 = v152;

      -[CKConversationListCell closeButton](self, "closeButton");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setFrame:", round(v193 * v109) / v193, round(v193 * v147) / v193, round(v193 * v150) / v193, round(v193 * v153) / v193);

      -[CKConversationListCell summaryLabel](self, "summaryLabel");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "bounds");
      v157 = v156;
      -[CKConversationListCell summaryLabel](self, "summaryLabel");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "bounds");
      v160 = v159;
      -[CKConversationListCell summaryLabel](self, "summaryLabel");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "bounds");
      MaxX = CGRectGetMaxX(v201);
      -[CKConversationListStandardCell contentView](self, "contentView");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "bounds");
      MaxY = CGRectGetMaxY(v202);
      -[CKConversationListCell gradient](self, "gradient");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "setFrame:", v157, v160, MaxX, MaxY);

      -[CKConversationListStandardCell contentView](self, "contentView");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCell closeButton](self, "closeButton");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "bringSubviewToFront:", v167);

    }
    unreadIndicatorImageView = self->_unreadIndicatorImageView;
    objc_msgSend(v22, "unreadFrame");
    -[UIImageView setFrame:](unreadIndicatorImageView, "setFrame:");
    if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled")
      && -[CKConversationListCell shouldHidePreviewSummary](self, "shouldHidePreviewSummary"))
    {
      -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      if (v169)
      {
        -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCell summaryAttributedTextForBlockedConversationWithIcon:](self, "summaryAttributedTextForBlockedConversationWithIcon:", 0);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "setAttributedText:", v171);

        -[CKConversationListCell fromLabel](self, "fromLabel");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "_firstLineBaselineFrameOriginY");

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "senderSummaryConversationListSpace");

        UIRoundToViewScale();
        v175 = v174;
        -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "_capOffsetFromBoundsTop");
        v178 = v175 - v177;

        -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCell summaryAttributedTextForBlockedConversationWithIcon:](self, "summaryAttributedTextForBlockedConversationWithIcon:", 1);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "setAttributedText:", v180);

        v181 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "sizeThatFits:", v181, 600.0);
        v184 = v183;
        v186 = v185;

        -[CKConversationListCell fromLabel](self, "fromLabel");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "frame");
        v188 = CGRectGetMinX(v203);

        -[CKConversationListCell summaryBlockedLabel](self, "summaryBlockedLabel");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "setFrame:", v188, v178, v184, v186);

      }
    }
    -[CKConversationListStandardCell _updateLabelVisibility](self, "_updateLabelVisibility");

  }
}

- (void)updateFromLabelWithText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)_stopTypingIndicator
{
  void *v3;
  void *v4;
  void *v5;

  -[CKConversationListStandardCell setShowTypingIndicator:](self, "setShowTypingIndicator:", 0);
  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimation");

    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CKConversationListCell setTypingIndicatorView:](self, "setTypingIndicatorView:", 0);
  }
}

- (void)setShowTypingIndicator:(BOOL)a3
{
  self->_showTypingIndicator = a3;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CKConversationListStandardCell;
  v6 = a3;
  -[CKConversationListCell updateContentsForConversation:fastPreview:](&v7, sel_updateContentsForConversation_fastPreview_, v6, v4);
  -[CKConversationListStandardCell _configureSummaryLabelAppearanceForConversation:](self, "_configureSummaryLabelAppearanceForConversation:", v6, v7.receiver, v7.super_class);
  -[CKConversationListStandardCell _configureDateLabelAppearanceForConversation:](self, "_configureDateLabelAppearanceForConversation:", v6);

  -[CKConversationListStandardCell _updateAvatarView](self, "_updateAvatarView");
  -[CKConversationListStandardCell updateAccessoryIndicatorsForCurrentState](self, "updateAccessoryIndicatorsForCurrentState");
}

- (void)_updateAvatarView
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  CKAvatarView *v11;
  CKAvatarView *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  CKAvatarView *avatarView;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  CKAvatarView *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CKAvatarView *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "canShowContactPhotosInConversationList") & 1) == 0)
  {

    goto LABEL_9;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contactPhotosEnabled");

  if (!v5)
  {
LABEL_9:
    -[CKAvatarView removeFromSuperview](self->_avatarView, "removeFromSuperview");
    avatarView = self->_avatarView;
    self->_avatarView = 0;

    return;
  }
  if (!self->_avatarView)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationListContactImageDiameter");
    v10 = v9;

    v11 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v6, v7, v10, v10);
    v12 = self->_avatarView;
    self->_avatarView = v11;

    -[CNAvatarView setAsynchronousRendering:](self->_avatarView, "setAsynchronousRendering:", 1);
    -[CKAvatarView setUserInteractionEnabled:](self->_avatarView, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setShowsContactOnTap:](self->_avatarView, "setShowsContactOnTap:", 0);
    -[CNAvatarView setDelegate:](self->_avatarView, "setDelegate:", self);
    -[CNAvatarView setBypassActionValidation:](self->_avatarView, "setBypassActionValidation:", 1);
    -[CKConversationListStandardCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_avatarView);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "avatarViewAllowsStaleRendering"))
  {
    v15 = -[CNAvatarView isDisplayingContent](self->_avatarView, "isDisplayingContent");

    if (v15)
      -[CNAvatarView setAllowStaleRendering:](self->_avatarView, "setAllowStaleRendering:", 1);
  }
  else
  {

  }
  -[CKConversationListCell conversation](self, "conversation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "chatIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarView _ck_setContextToken:](self->_avatarView, "_ck_setContextToken:", v19);

  v20 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v17, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CNAvatarView updateViewWithGroupIdentity:](self->_avatarView, "updateViewWithGroupIdentity:", v21);
  if (objc_msgSend(v17, "recipientCount") == 1)
  {
    -[CNAvatarView setName:](self->_avatarView, "setName:", 0);
    v23 = self->_avatarView;
    v24 = *MEMORY[0x1E0C97420];
    v30[0] = *MEMORY[0x1E0C97418];
    v30[1] = v24;
    v25 = *MEMORY[0x1E0C97428];
    v30[2] = *MEMORY[0x1E0C97430];
    v30[3] = v25;
    v30[4] = *MEMORY[0x1E0C97410];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setActionCategories:](v23, "setActionCategories:", v26);
  }
  else
  {
    if (objc_msgSend(v17, "hasDisplayName"))
      objc_msgSend(v17, "displayName");
    else
      objc_msgSend(v17, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setName:](self->_avatarView, "setName:", v26);
    v27 = self->_avatarView;
    v29 = *MEMORY[0x1E0C97420];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setActionCategories:](v27, "setActionCategories:", v28);

  }
  -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", objc_msgSend(v17, "shouldHaveRoundRectAvatar"));
  -[CKConversationListStandardCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_configureDateLabelAppearanceForConversation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (!-[CKConversationListCell shouldAppearAsRecoverableConversation](self, "shouldAppearAsRecoverableConversation"))
  {
    -[CKConversationListCell dateLabel](self, "dateLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");
    goto LABEL_6;
  }
  -[CKConversationListStandardCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

LABEL_6:
}

- (void)_configureSummaryLabelAppearanceForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CKConversationListStandardCell _shouldShowDownloadingPendingMessages](self, "_shouldShowDownloadingPendingMessages"))
  {
    -[CKConversationListStandardCell setShowDownloadingPendingMessages:](self, "setShowDownloadingPendingMessages:", 1);
LABEL_5:
    -[CKConversationListStandardCell setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_10;
  }
  if (-[CKConversationListStandardCell _shouldShowTypingIndicatorForConversation:](self, "_shouldShowTypingIndicatorForConversation:", v7))
  {
    -[CKConversationListStandardCell setShowTypingIndicator:](self, "setShowTypingIndicator:", 1);
    goto LABEL_5;
  }
  -[CKConversationListStandardCell _stopTypingIndicator](self, "_stopTypingIndicator");
  -[CKConversationListStandardCell _removeDownloadingPendingMessagesView](self, "_removeDownloadingPendingMessagesView");
  if (objc_msgSend(v7, "isPlaceholder")
    && !-[CKConversationListCell shouldAppearAsRecoverableConversation](self, "shouldAppearAsRecoverableConversation"))
  {
    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  else
  {
    -[CKConversationListStandardCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

  }
LABEL_10:

}

- (BOOL)_shouldHideUnreadIndicatorForEditing:(BOOL)a3
{
  _BOOL4 v3;
  CKConversationListStandardCell *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  v3 = a3;
  v4 = self;
  -[CKConversationListCell conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[CKConversationListCell shouldAlwaysHideUnreadIndicatorForConversation:](v4, "shouldAlwaysHideUnreadIndicatorForConversation:", v5);

  if ((v4 & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hidesUnreadIndicatorWhenEditing") & v3;

  }
  return v6;
}

- (void)updateForEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell updateForEditing:](&v5, sel_updateForEditing_);
  -[UIImageView setAlpha:](self->_unreadIndicatorImageView, "setAlpha:", (double)(-[CKConversationListStandardCell _shouldHideUnreadIndicatorForEditing:](self, "_shouldHideUnreadIndicatorForEditing:", v3) ^ 1));
}

- (BOOL)_isCollapsed
{
  CKConversationListStandardCell *v2;
  void *v3;

  v2 = self;
  -[CKConversationListStandardCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  LOBYTE(v2) = -[CKConversationListStandardCell _boundsShouldCollapseContent:](v2, "_boundsShouldCollapseContent:");

  return (char)v2;
}

- (BOOL)showTypingIndicator
{
  return self->_showTypingIndicator;
}

- (CKConversationListStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListStandardCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIImageView *unreadIndicatorImageView;
  _TtC7ChatKit32CKConversationListIndicatorsView *v12;
  void *v13;
  _TtC7ChatKit32CKConversationListIndicatorsView *indicatorContainerView;
  _TtC7ChatKit32CKConversationListIndicatorsView *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKConversationListStandardCell;
  v4 = -[CKConversationListCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unreadIndicatorImageViewSize");
    v7 = v6;
    v9 = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", 0.0, 0.0, v7, v9);
    unreadIndicatorImageView = v4->_unreadIndicatorImageView;
    v4->_unreadIndicatorImageView = (UIImageView *)v10;

    -[UIImageView setAccessibilityIdentifier:](v4->_unreadIndicatorImageView, "setAccessibilityIdentifier:", CFSTR("UnreadIndicatorImageView"));
    v12 = objc_alloc_init(_TtC7ChatKit32CKConversationListIndicatorsView);
    -[CKConversationListStandardCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v12);

    indicatorContainerView = v4->_indicatorContainerView;
    v4->_indicatorContainerView = v12;
    v15 = v12;

    LODWORD(indicatorContainerView) = -[CKConversationListStandardCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection");
    -[CKConversationListCell dateLabel](v4, "dateLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((_DWORD)indicatorContainerView)
      v18 = 0;
    else
      v18 = 2;
    objc_msgSend(v16, "setTextAlignment:", v18);

    -[CKConversationListCell dateLabel](v4, "dateLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "conversationListDateColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v22);

    -[CKConversationListStandardCell registerForEvents](v4, "registerForEvents");
  }
  return v4;
}

- (void)registerForEvents
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updateTypingIndicatorIfNeeded, *MEMORY[0x1E0CEB350], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_updateAccessoryIndicatorsForCurrentState, *MEMORY[0x1E0D35500], 0);

}

- (void)updateWithForwardedConfigurationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell updateWithForwardedConfigurationState:](&v10, sel_updateWithForwardedConfigurationState_, v4);
  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListStandardCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "useSelectedAppearanceForConversationCellState:traitCollection:", v4, v7);

    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v9, "isHighlighted");

    if (v8 != (_DWORD)v7)
      -[CKConversationListStandardCell _resetTypingIndicator](self, "_resetTypingIndicator");
  }

}

- (void)_calculateLayoutFrames
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double *v34;
  CGRectEdge v35;
  CGRectEdge v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  double v41;
  _BOOL8 v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CKAvatarView *avatarView;
  double v51;
  double v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  double v70;
  CGFloat v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  void *v79;
  CGFloat v80;
  void *v81;
  double v82;
  double v83;
  double MinX;
  double MinY;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  CGFloat v112;
  void *v113;
  double v114;
  CGFloat v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  void *v157;
  int v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  objc_class *v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double height;
  double width;
  double y;
  double x;
  double v206;
  double v207;
  double v208;
  double v209;
  int v210;
  uint64_t v211;
  double v212;
  uint64_t v213;
  void *v214;
  void *v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  CGSize v222;
  double v223;
  CGPoint v224;
  double v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect slice;
  CGRect remainder;
  CGRect v234;

  -[CKConversationListCell cellLayout](self, "cellLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = (objc_class *)objc_opt_class();
    NSStringFromClass(v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListStandardCell.m"), 681, CFSTR("%@ needs a cell layout."), v185);

  }
  -[CKConversationListStandardCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = (void *)objc_msgSend(v9, "copy");

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = (void *)objc_msgSend(v11, "copy");

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = objc_msgSend(v13, "copy");

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = objc_msgSend(v15, "copy");

  v16 = -[CKConversationListStandardCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  LODWORD(v8) = -[CKConversationListCell shouldAppearAsRecoverableConversation](self, "shouldAppearAsRecoverableConversation");
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19 = MEMORY[0x1E0C9AA70];
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", CFSTR("A"), MEMORY[0x1E0C9AA70]);
  objc_msgSend(v17, "setAttributedText:", v20);

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("A\nA"), v19);
  objc_msgSend(v21, "setAttributedText:", v22);

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v210 = (int)v8;
  if ((_DWORD)v8)
  {
    objc_msgSend(v23, "setTextForOverride:", CFSTR("A"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDate:", v25);

  }
  v26 = -[CKConversationListCell showingEditControl](self, "showingEditControl");
  -[CKConversationListStandardCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v30 = *MEMORY[0x1E0C9D820];
  v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[CKConversationListCell sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], v31);
  v33 = v32;

  remainder.origin.x = 0.0;
  remainder.origin.y = 0.0;
  remainder.size.width = v29;
  remainder.size.height = v33;
  v34 = (double *)MEMORY[0x1E0C9D648];
  v222 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v224 = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v222;
  if (v16)
    v35 = CGRectMaxXEdge;
  else
    v35 = CGRectMinXEdge;
  if (v16)
    v36 = CGRectMinXEdge;
  else
    v36 = CGRectMaxXEdge;
  +[CKConversationListStandardCell leadingLayoutMargin](CKConversationListStandardCell, "leadingLayoutMargin");
  v38 = v37;
  -[CKConversationListCell delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthForDeterminingAvatarVisibility");
  v41 = v40;

  v208 = v41;
  v42 = -[CKConversationListStandardCell _shouldShowAvatarForWidth:](self, "_shouldShowAvatarForWidth:", v41);
  v234.origin.x = 0.0;
  v234.origin.y = 0.0;
  v209 = v29;
  v234.size.width = v29;
  v234.size.height = v33;
  CGRectDivide(v234, &slice, &remainder, v38, v35);
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "conversationListCellRightMargin");
    v45 = v44;

  }
  else
  {
    -[CKConversationListStandardCell layoutMargins](self, "layoutMargins");
    v45 = v46;
  }
  objc_msgSend(v4, "setTrailingLayoutMarginSize:", v45);
  CGRectDivide(remainder, &slice, &remainder, v45, v36);
  v47 = *v34;
  v48 = v34[1];
  v49 = v34[2];
  v221 = v34[3];
  avatarView = self->_avatarView;
  v220 = *v34;
  if (v42)
  {
    if (avatarView
      || (-[CKConversationListStandardCell _updateAvatarView](self, "_updateAvatarView"),
          v216 = v221,
          v217 = v48,
          v51 = v49,
          v52 = v47,
          self->_avatarView))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "conversationListContactImageDiameter");
      v55 = v54;

      v231.origin = v224;
      v231.size = v222;
      CGRectDivide(remainder, &v231, &remainder, v55, v35);
      v52 = round(v7 * CGRectGetMinX(v231)) / v7;
      v217 = round(v7 * floor(CGRectGetMidY(v231) + v55 * -0.5)) / v7;
      v56 = v31;
      v57 = v30;
      v58 = round(v7 * v55) / v7;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "conversationListContactImageTrailingSpace");
      v61 = v60;

      CGRectDivide(remainder, &slice, &remainder, v61, v35);
      v216 = v58;
      v51 = v58;
      v30 = v57;
      v31 = v56;
    }
  }
  else
  {
    -[CKAvatarView frame](avatarView, "frame");
    v52 = v62;
    v216 = v64;
    v217 = v63;
  }
  x = remainder.origin.x;
  v206 = v51;
  width = remainder.size.width;
  y = remainder.origin.y;
  height = remainder.size.height;
  v231 = remainder;
  v230 = remainder;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = v49;
  v219 = v48;
  v207 = v52;
  if ((objc_msgSend(v65, "showsConversationListCellChevronImage") & 1) == 0)
  {

    v67 = 0;
    v229.origin = v224;
    v229.size = v222;
    goto LABEL_24;
  }
  v66 = objc_msgSend(v4, "shouldShowChevron");

  v229.origin = v224;
  v229.size = v222;
  if (((v66 ^ 1 | v26) & 1) != 0)
  {
    v67 = 0;
LABEL_24:
    v186 = v30;
    v187 = v31;
    goto LABEL_26;
  }
  -[CKConversationListCell chevronImageView](self, "chevronImageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "image");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "size");
  v71 = v70;
  v187 = v72;

  CGRectDivide(v230, &v229, &v230, v71, v36);
  CGRectDivide(v230, &slice, &v230, 10.0, v36);
  v186 = v71;
  CGRectDivide(v231, &v229, &v231, v71, v36);
  CGRectDivide(v231, &slice, &v231, 10.0, v36);
  v67 = 1;
LABEL_26:
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sizeToFit");

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "frame");
  v76 = v75;
  v78 = v77;

  v228.origin = v224;
  v228.size = v222;
  CGRectDivide(v230, &v228, &v230, v76, v36);
  v227.origin = v224;
  v227.size = v222;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "conversationListSenderToDateHorizontalPadding");
  CGRectDivide(v230, &slice, &v227, v80, v36);

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "sizeThatFits:", v227.size.width, 300.0);
  v83 = v82;

  MinX = CGRectGetMinX(v227);
  MinY = CGRectGetMinY(v227);
  v86 = round(v7 * CGRectGetWidth(v227)) / v7;
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFrame:", round(v7 * MinX) / v7, round(v7 * MinY) / v7, v86, round(v7 * v83) / v7);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "topConversationListSpace");
  v90 = round(v7 * v89) / v7;

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "_setFirstLineCapFrameOriginY:", v90);

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "frame");
  v200 = v94;
  v201 = v93;
  v198 = v96;
  v199 = v95;

  v97 = round(v7 * v228.origin.x) / v7;
  v98 = round(v7 * v228.origin.y) / v7;
  v99 = round(v7 * v228.size.width) / v7;
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setFrame:", v97, v98, v99, round(v7 * v78) / v7);

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "_firstLineBaselineFrameOriginY");
  v103 = v102;

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "_setFirstLineBaselineFrameOriginY:", v103);

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "frame");
  v196 = v107;
  v197 = v106;
  v194 = v109;
  v195 = v108;

  -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "sizeThatFits:", v30, v31);
  v112 = v111;

  v226.origin = v224;
  v226.size = v222;
  if ((_DWORD)v67)
  {
    v226 = v229;
  }
  else
  {
    CGRectDivide(v231, &v226, &v231, v112, v36);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "conversationListAccessoryIndicatorToSummaryLabelPadding");
    v115 = v114;

    CGRectDivide(v231, &slice, &v231, v115, v36);
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "senderSummaryConversationListSpace");
  v118 = v117;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "conversationListSenderFont");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "_scaledValueForValue:useLanguageAwareScaling:", 1, v118);
  v122 = v121;

  v123 = round(v7 * (v103 + v122)) / v7;
  -[CKConversationListStandardCell _calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:](self, "_calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:", v231.origin.x, v231.origin.y, v231.size.width, v231.size.height, v123, v7);
  v225 = v124;
  v223 = v125;
  v192 = v127;
  v193 = v126;
  LODWORD(v119) = -[CKConversationListStandardCell _isCollapsed](self, "_isCollapsed");
  -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "sizeThatFits:", v30, v31);
  v130 = v129;
  v132 = v131;

  v133 = (double *)MEMORY[0x1E0CEB4B0];
  if ((_DWORD)v119)
  {
    if (v16)
    {
      v134 = *MEMORY[0x1E0CEB4B0];
      v135 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v136 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v137 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    }
    else
    {
      v135 = 1.0;
      v137 = 0.0;
      v136 = 0.0;
      v134 = 0.0;
    }
    v144 = (void *)v211;
    -[CKConversationListStandardCell _calculateIndicatorFrameForSize:trailing:displayScale:insets:](self, "_calculateIndicatorFrameForSize:trailing:displayScale:insets:", v16 ^ 1, v130, v132, v7, v134, v135, v136, v137);
    v190 = v146;
    v191 = v145;
    v188 = v148;
    v189 = v147;
  }
  else
  {
    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKMainScreenScale_once_51 != -1)
      dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_125);
    v139 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0)
      v139 = 1.0;
    -[CKConversationListStandardCell _calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyAlignedWithColumn:wantsCenteringColumnAlignment:size:offset:](self, "_calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyAlignedWithColumn:wantsCenteringColumnAlignment:size:offset:", v138, v67, v226.origin.x, v226.origin.y, v226.size.width, v226.size.height, v130, v132, 0.0, floor(v139) / v139);
    v190 = v141;
    v191 = v140;
    v188 = v143;
    v189 = v142;

    v144 = (void *)v211;
  }
  v149 = v123;
  -[CKConversationListStandardCell _calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:](self, "_calculateSummaryLabelFrameForColumn:summaryLabelCapFrameYOrigin:displayScale:", x, y, width, height, v123, v7);
  v151 = v150;
  v153 = v152;
  v212 = v154;
  v156 = v155;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "showsConversationListCellChevronImage");

  if (v158)
  {
    -[CKConversationListCell dateLabel](self, "dateLabel");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKMainScreenScale_once_51 != -1)
      dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_125);
    v160 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0)
      v160 = 1.0;
    -[CKConversationListStandardCell _calculateRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyCenteredInColumn:size:offset:](self, "_calculateRectVerticallyCenteredWithFirstTextLineOfLabel:horizontallyCenteredInColumn:size:offset:", v159, v229.origin.x, v229.origin.y, v229.size.width, v229.size.height, v186, v187, 0.0, floor(v160 * 0.5) / v160);
    v219 = v162;
    v220 = v161;
    v218 = v163;
    v221 = v164;

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "unreadIndicatorImageViewSize");
  v167 = v166;
  v169 = v168;

  -[CKConversationListStandardCell _calculateIndicatorFrameForSize:trailing:displayScale:insets:](self, "_calculateIndicatorFrameForSize:trailing:displayScale:insets:", v16, v167, v169, v7, *v133, v133[1], v133[2], v133[3]);
  v171 = v170;
  v173 = v172;
  v175 = v174;
  v177 = v176;
  objc_msgSend(v4, "setShouldShowAvatarView:", v42);
  objc_msgSend(v4, "setAvatarFrame:", v207, v217, v206, v216);
  objc_msgSend(v4, "setSummaryLabelCapFrameYOrigin:", v149);
  objc_msgSend(v4, "setSummaryFrameIfAccessoryIndicatorHidden:", v151, v153, v212, v156);
  objc_msgSend(v4, "setSummaryFrameIfAccessoryIndicatorVisible:", v225, v223, v193, v192);
  objc_msgSend(v4, "setSenderFrame:", v201, v200, v199, v198);
  objc_msgSend(v4, "setDateFrame:", v197, v196, v195, v194);
  objc_msgSend(v4, "setIndicatorContainerFrame:", v191, v190, v189, v188);
  objc_msgSend(v4, "setChevronFrame:", v220, v219, v218, v221);
  objc_msgSend(v4, "setUnreadFrame:", v171, v173, v175, v177);
  objc_msgSend(v4, "markAsValidForContentViewWidth:widthForDeterminingAvatarVisibility:showingEditControl:", v26, v209, v208);
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setAttributedText:", v215);

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "setAttributedText:", v214);

  -[CKConversationListCell dateLabel](self, "dateLabel");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v180;
  if (v210)
  {
    objc_msgSend(v180, "setTextForOverride:", v144);
    v182 = (void *)v213;
  }
  else
  {
    v182 = (void *)v213;
    objc_msgSend(v180, "setDate:", v213);
  }

}

- (CGRect)_calculateSummaryLabelFrameForColumn:(CGRect)a3 summaryLabelCapFrameYOrigin:(double)a4 displayScale:(double)a5
{
  double width;
  double y;
  double x;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKConversationListCell summaryLabel](self, "summaryLabel", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, 600.0);
  v13 = v12;

  -[CKConversationListCell summaryLabel](self, "summaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setFirstLineCapFrameOriginY:", a4);

  v15 = round(x * a5) / a5;
  v16 = round(y * a5) / a5;
  v17 = round(width * a5) / a5;
  v18 = round((v13 + 5.0) * a5) / a5;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_calculateRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyCenteredInColumn:(CGRect)a4 size:(CGSize)a5 offset:(CGPoint)a6
{
  double height;
  double width;
  double v8;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
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
  double v26;
  double v27;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v8 = a4.size.width;
  x = a4.origin.x;
  v10 = a3;
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "_capOffsetFromBoundsTop");
  v16 = v15;
  objc_msgSend(v10, "_firstLineBaselineOffsetFromBoundsTop");
  v18 = v17;

  if (CKMainScreenScale_once_51 != -1)
    dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_125);
  v19 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0)
    v19 = 1.0;
  v20 = height * v19;
  v21 = 1.0 / v19;
  v22 = 1.0 / v19 * (x * v19 + floor((v8 * v19 - width * v19) * 0.5));
  v23 = 1.0 / v19 * ((v16 + v12) * v19 + floor(((v14 - (v16 + v14 - v18)) * v19 - height * v19) * 0.5));
  v24 = width * v19 * (1.0 / v19);
  v25 = v20 * v21;
  v26 = a6.x + v22;
  v27 = a6.y + v23;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)_shouldShowAvatarForWidth:(double)a3
{
  void *v5;
  char v6;

  if (-[CKConversationListCell shouldAlwaysHideAvatar](self, "shouldAlwaysHideAvatar"))
    return 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowAvatarForWidth:", a3);

  return v6;
}

- (CGRect)_calculateIndicatorFrameForSize:(CGSize)a3 trailing:(BOOL)a4 displayScale:(double)a5 insets:(UIEdgeInsets)a6
{
  _BOOL4 v7;
  double height;
  double width;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
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
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double right;
  double left;
  CGRect result;

  right = a6.right;
  left = a6.left;
  v7 = a4;
  height = a3.height;
  width = a3.width;
  -[CKConversationListStandardCell safeAreaInsets](self, "safeAreaInsets", a3.width, a3.height, a5, a6.top, a6.left, a6.bottom);
  v37 = v11;
  v38 = v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conversationListCellLeftMargin");
  v15 = v14;

  -[CKConversationListCell containerBounds](self, "containerBounds");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_opt_class();
  -[CKConversationListStandardCell traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  objc_msgSend(v20, "cellHeightForDisplayScale:");
  v23 = v22;

  if (CKMainScreenScale_once_51 != -1)
    dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_125);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0)
    v24 = 1.0;
  else
    v24 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
  v25 = width * v24;
  v26 = v17 * v24 + floor((v15 * v24 - width * v24) * 0.5);
  v27 = 1.0 / v24;
  v28 = 1.0 / v24 * v26;
  v29 = v25 * (1.0 / v24);
  if (v7)
  {
    -[CKConversationListStandardCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = left + v31 - v28 - v29 - v38;

  }
  else
  {
    v32 = right + v37 + v28;
  }
  v33 = round(v32 * a5) / a5;
  v34 = round(v27 * (v19 * v24 + floor((v23 * v24 - height * v24) * 0.5)) * a5) / a5;
  v35 = round(v29 * a5) / a5;
  v36 = round(height * v24 * v27 * a5) / a5;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (double)leadingLayoutMargin
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationListCellLeftMargin");
  v4 = v3;

  return v4;
}

+ (id)identifierForConversation:(id)a3
{
  if ((unint64_t)objc_msgSend(a3, "recipientCount") <= 1)
    return CFSTR("CKConversationListStandardCellIdentifier");
  else
    return CFSTR("CKConversationListStandardCellGroupIdentifier");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell dealloc](&v4, sel_dealloc);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[CKConversationListStandardCell _stopTypingIndicator](self, "_stopTypingIndicator");
  -[CKConversationListStandardCell _removeDownloadingPendingMessagesView](self, "_removeDownloadingPendingMessagesView");
  -[CKConversationListStandardCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowStaleRendering:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)updateContentsForConversation:(id)a3
{
  -[CKConversationListStandardCell updateContentsForConversation:fastPreview:](self, "updateContentsForConversation:fastPreview:", a3, 0);
}

- (void)updateTypingIndicatorIfNeeded
{
  void *v3;

  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKConversationListStandardCell _resetTypingIndicator](self, "_resetTypingIndicator");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListStandardCell traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[CKConversationListStandardCell _resetTypingIndicator](self, "_resetTypingIndicator");
}

- (void)_startTypingIndicator
{
  void *v3;
  CKConversationListTypingIndicatorView *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!-[CKConversationListCell shouldHidePreviewSummary](self, "shouldHidePreviewSummary"))
  {
    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(CKConversationListTypingIndicatorView);
      -[CKConversationListCell setTypingIndicatorView:](self, "setTypingIndicatorView:", v4);

      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CKConversationListStandardCell isHighlighted](self, "isHighlighted"))
        v6 = +[CKApplicationState isApplicationActive](CKApplicationState, "isApplicationActive");
      else
        v6 = 0;
      objc_msgSend(v5, "setHighlightedState:", v6);

      if (CKIsRunningInMacCatalyst())
      {
        -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTypingIndicatorScale:", 1.0);
      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "conversationListCellTypingIndicatorScale");
        v9 = v8;
        -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTypingIndicatorScale:", v9);

      }
    }
    -[CKConversationListStandardCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimation");

    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startPulseAnimation");

    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

  }
}

- (void)_resetTypingIndicator
{
  -[CKConversationListStandardCell setShowTypingIndicator:](self, "setShowTypingIndicator:", 1);
  -[CKConversationListStandardCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setupDownloadingPendingMessagesView
{
  void *v3;
  CKDownloadingPendingMessagesView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;

  -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CKDownloadingPendingMessagesView);
    -[CKConversationListCell setDownloadingPendingMessagesView:](self, "setDownloadingPendingMessagesView:", v4);

    -[CKConversationListStandardCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[CKConversationListCell summaryLabel](self, "summaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  -[CKConversationListCell conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pendingIncomingSatelliteMessageCount");

  -[CKConversationListCell conversation](self, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListStandardCell setTotalSatelliteMessageCount:](self, "setTotalSatelliteMessageCount:", objc_msgSend(v12, "totalSatelliteMessageCount"));

  v13 = -[CKConversationListStandardCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount") - v10 + 1;
  v14 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NUMBER_OF_REMAINING_PENDING_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, v13, -[CKConversationListStandardCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceLayoutDirection");

  if (v19 == 1)
    v20 = CFSTR("\u200F");
  else
    v20 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v17);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v23);
  objc_msgSend(v21, "updateMessageCountWith:", v22);

}

- (void)_removeDownloadingPendingMessagesView
{
  void *v3;

  -[CKConversationListStandardCell setShowDownloadingPendingMessages:](self, "setShowDownloadingPendingMessages:", 0);
  -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKConversationListCell setDownloadingPendingMessagesView:](self, "setDownloadingPendingMessagesView:", 0);
}

- (BOOL)_shouldShowDownloadingPendingMessages
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  -[CKConversationListCell conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDownloadingPendingSatelliteMessages");

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isSatelliteConnectionActive") & v4;

  return (char)v3;
}

uint64_t __74__CKConversationListStandardCell_updateUnreadIndicatorWithImage_animated___block_invoke(uint64_t a1)
{
  double v2;

  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)updateAccessoryIndicatorsColorForTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  -[CKConversationListCell unreadIndicatorImageForVisibility:withMuteState:](self, "unreadIndicatorImageForVisibility:withMuteState:", a3, objc_msgSend(a4, "isMuted"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListStandardCell updateUnreadIndicatorWithImage:animated:](self, "updateUnreadIndicatorWithImage:animated:", v7, v5);

}

- (void)_updateTypingIndicatorFrame:(BOOL)a3 isCollapsed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v18;
  void *v19;
  double MaxY;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v4 = a4;
  v5 = a3;
  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_13;
  }
  else
  {
    -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_13;
  }
  v26 = v8;
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  if (v5)
  {
    v18 = v14 + -5.0;

    -[CKConversationListCell fromLabel](self, "fromLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    MaxY = CGRectGetMaxY(v27) + 2.0;
  }
  else
  {
    v18 = CGRectGetMaxX(*(CGRect *)&v14) - v10 + 5.0;

    -[CKConversationListCell fromLabel](self, "fromLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    MaxY = CGRectGetMaxY(v28);
  }

  -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFlipForRTLLayout:", !v5);

    -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", v4);

  }
  -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CKConversationListCell downloadingPendingMessagesView](self, "downloadingPendingMessagesView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateForLayoutDirectionWithScale:", 0.8);

  }
  objc_msgSend(v26, "setFrame:", v18, MaxY, v10, v12);
  v8 = v26;
LABEL_13:

}

- (void)increaseContrastDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKConversationListStandardCell;
  -[CKConversationListCell increaseContrastDidChange](&v7, sel_increaseContrastDidChange);
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationListDateColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

}

- (CGRect)_calculateIndicatorViewRectVerticallyCenteredWithFirstTextLineOfLabel:(id)a3 horizontallyAlignedWithColumn:(CGRect)a4 wantsCenteringColumnAlignment:(BOOL)a5 size:(CGSize)a6 offset:(CGPoint)a7
{
  double x;
  double width;
  _BOOL4 v9;
  double v10;
  double v11;
  id v13;
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
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double height;
  double y;
  CGRect result;

  height = a6.height;
  y = a7.y;
  x = a7.x;
  width = a6.width;
  v9 = a5;
  v10 = a4.size.width;
  v11 = a4.origin.x;
  v13 = a3;
  objc_msgSend(v13, "frame");
  v39 = v14;
  v16 = v15;
  objc_msgSend(v13, "_capOffsetFromBoundsTop");
  v18 = v17;
  objc_msgSend(v13, "_firstLineBaselineOffsetFromBoundsTop");
  v38 = v19;

  if (CKMainScreenScale_once_51 != -1)
    dispatch_once(&CKMainScreenScale_once_51, &__block_literal_global_125);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_51 == 0.0)
    v20 = 1.0;
  else
    v20 = *(double *)&CKMainScreenScale_sMainScreenScale_51;
  v21 = width * v20;
  v22 = v11 * v20 + floor((v10 * v20 - width * v20) * 0.5);
  v23 = 1.0 / v20;
  v24 = x + 1.0 / v20 * v22;
  if (v9)
  {
    -[CKConversationListStandardCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "effectiveUserInterfaceLayoutDirection");

    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v29 = v28;

    -[CKConversationListStandardCell indicatorContainerView](self, "indicatorContainerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "xOriginForCenteringWithTrailingSlot");
    v32 = v29 - v31;

    v33 = -v32;
    if (v26 == 1)
      v33 = v32;
    v24 = v24 + v33;
  }
  v34 = v21 * v23;
  v35 = height * v20 * v23;
  v36 = y + v23 * ((v18 + v39) * v20 + floor(((v16 - (v18 + v16 - v38)) * v20 - height * v20) * 0.5));
  v37 = v24;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v36;
  result.origin.x = v37;
  return result;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return (id)objc_msgSend(a3, "presentingViewController");
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0C97420]) && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[CKConversationListCell conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v42)
    {
      v12 = *(_QWORD *)v51;
      v45 = *MEMORY[0x1E0C966A8];
      v44 = *MEMORY[0x1E0C967C0];
      v40 = v9;
      v41 = v7;
      v38 = *(_QWORD *)v51;
      v39 = v11;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v51 != v12)
            objc_enumerationMutation(v11);
          v43 = v13;
          v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
          objc_msgSend(v14, "cnContactWithKeys:", MEMORY[0x1E0C9AA60], v38);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v19 = v7;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v47;
LABEL_11:
              v23 = 0;
              while (1)
              {
                if (*(_QWORD *)v47 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v23);
                objc_msgSend(v24, "key");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", v45);

                if (v26)
                {
                  objc_msgSend(v24, "value");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v24, "key");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "isEqualToString:", v44);

                  if (v29)
                  {
                    objc_msgSend(v24, "value");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "stringValue");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v27 = 0;
                  }
                }
                IMStripFormattingFromAddress();
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v14, "rawAddress");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                IMStripFormattingFromAddress();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = MEMORY[0x193FF417C](v31, v33);

                if ((v34 & 1) != 0)
                  break;

                if (v21 == ++v23)
                {
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                  if (v21)
                    goto LABEL_11;
                  goto LABEL_22;
                }
              }
              v35 = v24;

              v9 = v40;
              v7 = v41;
              v12 = v38;
              v11 = v39;
              if (!v35)
                goto LABEL_24;

              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "removeObject:", v35);
              objc_msgSend(v36, "insertObject:atIndex:", v35, 0);
              v11 = v35;
              goto LABEL_29;
            }
LABEL_22:

            v9 = v40;
            v7 = v41;
            v12 = v38;
            v11 = v39;
          }
LABEL_24:
          v13 = v43 + 1;
        }
        while (v43 + 1 != v42);
        v42 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v42)
          continue;
        break;
      }
    }
    v36 = 0;
LABEL_29:

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[CKConversationListCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

    -[CKConversationListCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avatarHeaderWasTappedForConversation:inCell:", v11, self);

  }
  return (v7 & 1) == 0;
}

- (id)contactsForPreviewInteractionForAvatarView:(id)a3 suggestedKeysToFetch:(id)a4
{
  void *v4;
  void *v5;

  -[CKConversationListCell conversation](self, "conversation", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedContactsForAvatar3DTouchUIWithKeysToFetch:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)overrideImageDataForPreviewInteractionForAvatarView:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CKConversationListCell conversation](self, "conversation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v3, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldShowSlashSatelliteIcon
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMessagingActiveOverSatellite");

    if (v6)
    {
      if (-[CKConversationListCell isGroupConversation](self, "isGroupConversation"))
        return 1;
      -[CKConversationListCell conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recipient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rawAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((IMStringIsEmail() & 1) != 0)
      {
        -[CKConversationListCell conversation](self, "conversation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "chat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D38F70]);

        if (!v14)
          return 1;
      }
      else
      {

      }
    }
  }
  return 0;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIImageView)unreadIndicatorImageView
{
  return self->_unreadIndicatorImageView;
}

- (void)setUnreadIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, a3);
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (void)setIndicatorContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorContainerView, a3);
}

- (BOOL)showDownloadingPendingMessages
{
  return self->_showDownloadingPendingMessages;
}

- (void)setShowDownloadingPendingMessages:(BOOL)a3
{
  self->_showDownloadingPendingMessages = a3;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

- (void)updateAccessoryIndicatorsForCurrentState
{
  CKConversationListStandardCell *v2;

  v2 = self;
  CKConversationListStandardCell.updateAccessoryIndicatorsForCurrentState()();

}

@end
