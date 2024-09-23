@implementation CKAttachmentSearchResultCell

- (CKAttachmentSearchResultCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAttachmentSearchResultCell *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CKSearchAvatarSupplementryView *v26;
  void *v27;
  void *v28;
  objc_super v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)CKAttachmentSearchResultCell;
  v7 = -[CKAttachmentSearchResultCell initWithFrame:](&v30, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v8, "setContentMode:", 1);
    -[CKEditableSearchResultCell setImageView:](v7, "setImageView:", v8);
    -[CKAttachmentSearchResultCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    v10 = objc_alloc(MEMORY[0x1E0CEA700]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchAttachmentResultLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v17);

    objc_msgSend(v15, "setNumberOfLines:", 2);
    objc_msgSend(v15, "setTextAlignment:", 1);
    -[CKAttachmentSearchResultCell setTitleLabel:](v7, "setTitleLabel:", v15);
    -[CKAttachmentSearchResultCell contentView](v7, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v15);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4E0]), "initWithFrame:", v11, v12, v13, v14);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "searchAttachmentResultDateLabelFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v21);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "theme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "spotlightAttachmentSecondaryColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v24);

    objc_msgSend(v19, "setNumberOfLines:", 1);
    objc_msgSend(v19, "setTextAlignment:", 1);
    -[CKAttachmentSearchResultCell setDateLabel:](v7, "setDateLabel:", v19);
    -[CKAttachmentSearchResultCell contentView](v7, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v19);

    v26 = -[CKSearchAvatarSupplementryView initWithFrame:]([CKSearchAvatarSupplementryView alloc], "initWithFrame:", v11, v12, v13, v14);
    -[CKSearchAvatarSupplementryView setParentContentType:](v26, "setParentContentType:", 3);
    -[CKAttachmentSearchResultCell setAvatarView:](v7, "setAvatarView:", v26);
    -[CKAttachmentSearchResultCell contentView](v7, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v26);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v7, sel__thumbnailGenerated_, CFSTR("CKSearchThumbnailDidChange"), 0);

  }
  return v7;
}

- (CGPoint)avatarOffsetLTR
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -6.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)avatarOffsetRTL
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 6.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)editModeHorizontalOffset
{
  return 4.0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double MaxX;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double MaxY;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
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
  double v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  objc_super v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v151.receiver = self;
  v151.super_class = (Class)CKAttachmentSearchResultCell;
  -[CKEditableSearchResultCell layoutSubviews](&v151, sel_layoutSubviews);
  -[CKAttachmentSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v150 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = -[CKAttachmentSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchAttachmentsImageTopPadding");
  v14 = v13;

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = v8;
  if (!v16)
  {
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setHidden:", 1);

    -[CKAttachmentSearchResultCell avatarView](self, "avatarView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHidden:", 1);
LABEL_19:

    goto LABEL_20;
  }
  v17 = *MEMORY[0x1E0C9D648];
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeToFit");

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;

  v24 = v8 / v21;
  v25 = 0.0;
  if (v21 == 0.0)
    v24 = 0.0;
  if (v23 != 0.0)
    v25 = v8 / v23;
  v26 = fmin(v24, v25);
  v27 = v21 * v26;
  v28 = v23 * v26;
  if (CKMainScreenScale_once_49 != -1)
    dispatch_once(&CKMainScreenScale_once_49, &__block_literal_global_119);
  v29 = *(double *)&CKMainScreenScale_sMainScreenScale_49;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_49 == 0.0)
    v29 = 1.0;
  v30 = v27 * v29;
  v31 = v28 * v29;
  v32 = v150 * v29 + floor((v8 * v29 - v27 * v29) * 0.5);
  v33 = v6 * v29 + floor((v10 * v29 - v28 * v29) * 0.5);
  v34 = 1.0 / v29;
  v35 = v34 * v32;
  v36 = v34 * v33;
  v37 = v30 * v34;
  v38 = v31 * v34;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "searchAttachmentsImageTopPadding");
  v41 = v40;
  v152.origin.x = v17;
  v152.origin.y = v14;
  v152.size.width = v8;
  v152.size.height = v8;
  v42 = v41 + CGRectGetHeight(v152);
  v153.origin.x = v35;
  v153.origin.y = v36;
  v153.size.width = v37;
  v153.size.height = v38;
  v43 = v42 - CGRectGetHeight(v153);

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v35, v43, v37, v38);

  -[CKAttachmentSearchResultCell avatarView](self, "avatarView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", -[CKAttachmentSearchResultCell suppressAvatars](self, "suppressAvatars"));

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "searchResultAvatarSize");
  v48 = v47;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "searchResultAvatarSize");
  v51 = v50;

  if ((v11 & 1) != 0)
  {
    -[CKAttachmentSearchResultCell avatarOffsetRTL](self, "avatarOffsetRTL");
    v53 = v35 + v52;
    -[CKAttachmentSearchResultCell avatarOffsetRTL](self, "avatarOffsetRTL");
  }
  else
  {
    v154.origin.x = v35;
    v154.origin.y = v43;
    v154.size.width = v37;
    v154.size.height = v38;
    MaxX = CGRectGetMaxX(v154);
    v155.origin.x = v35;
    v155.origin.y = v43;
    v155.size.width = v48;
    v155.size.height = v51;
    v58 = MaxX - CGRectGetWidth(v155);
    -[CKAttachmentSearchResultCell avatarOffsetLTR](self, "avatarOffsetLTR");
    v53 = v58 + v59;
    -[CKAttachmentSearchResultCell avatarOffsetLTR](self, "avatarOffsetLTR");
  }
  v60 = v43 + v54;
  -[CKAttachmentSearchResultCell avatarView](self, "avatarView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFrame:", v53, v60, v48, v51);

  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v149;
  if (v62)
  {
    -[CKAttachmentSearchResultCell editModeHorizontalOffset](self, "editModeHorizontalOffset");
    v148 = v63;
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setHidden:", 0);

    LODWORD(v64) = -[CKAttachmentSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[CKAttachmentSearchResultCell contentView](self, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bringSubviewToFront:", v66);

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "sizeToFit");

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "frame");
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;

    v77 = v35;
    v78 = v43;
    v79 = v37;
    v80 = v38;
    if ((_DWORD)v64)
    {
      v81 = v148 + CGRectGetMinX(*(CGRect *)&v77);
    }
    else
    {
      v147 = v43;
      v82 = v35;
      v83 = v38;
      v84 = v37;
      v85 = CGRectGetMaxX(*(CGRect *)&v77);
      v156.origin.x = v70;
      v156.origin.y = v72;
      v156.size.width = v74;
      v156.size.height = v76;
      v86 = v85 - CGRectGetWidth(v156);
      v37 = v84;
      v38 = v83;
      v35 = v82;
      v43 = v147;
      v81 = v86 - v148;
    }
    v157.origin.x = v35;
    v157.origin.y = v43;
    v157.size.width = v37;
    v157.size.height = v38;
    MaxY = CGRectGetMaxY(v157);
    v158.origin.x = v81;
    v158.origin.y = v72;
    v158.size.width = v74;
    v158.size.height = v76;
    v88 = MaxY - CGRectGetHeight(v158) + -4.0;
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFrame:", v81, v88, v74, v76);
    v8 = v149;
    goto LABEL_19;
  }
LABEL_20:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", *(_QWORD *)&v147);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "theme");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "attachmentBalloonRichIconOutlineColor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "layer");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = objc_retainAutorelease(v91);
  objc_msgSend(v93, "setBorderColor:", objc_msgSend(v94, "CGColor"));
  if (CKPixelWidth_once_8 != -1)
    dispatch_once(&CKPixelWidth_once_8, &__block_literal_global_148);
  objc_msgSend(v93, "setBorderWidth:", *(double *)&CKPixelWidth_sPixel_8);
  -[CKAttachmentSearchResultCell bounds](self, "bounds");
  v96 = v95;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "searchAttachmentsCellPadding");
  v99 = v96 + v98 * -2.0;

  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "sizeThatFits:", v99, 1.79769313e308);
  v102 = v101;
  v104 = v103;

  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "searchAttachmentsTitleTopPadding");
  objc_msgSend(v105, "drawTextInRect:", 0.0, 0.0, v102 + v107, v104);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "searchAttachmentsTitleTopPadding");
  v110 = v102 + v109;

  if (CKMainScreenScale_once_49 != -1)
    dispatch_once(&CKMainScreenScale_once_49, &__block_literal_global_119);
  v111 = *(double *)&CKMainScreenScale_sMainScreenScale_49;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_49 == 0.0)
    v111 = 1.0;
  v112 = v110 * v111;
  v113 = v104 * v111;
  v114 = v150 * v111 + floor((v8 * v111 - v110 * v111) * 0.5);
  v115 = 1.0 / v111;
  v116 = v115 * v114;
  v117 = v112 * v115;
  v118 = v113 * v115;
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "frame");
  v120 = CGRectGetMaxY(v159);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "searchAttachmentsTitleTopPadding");
  v123 = v120 + v122;

  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setFrame:", v116, v123, v117, v118);

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "sizeThatFits:", v99, 1.79769313e308);
  v127 = v126;
  v129 = v128;

  if (CKMainScreenScale_once_49 != -1)
    dispatch_once(&CKMainScreenScale_once_49, &__block_literal_global_119);
  v130 = *(double *)&CKMainScreenScale_sMainScreenScale_49;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_49 == 0.0)
    v130 = 1.0;
  v131 = v127 * v130;
  v132 = v129 * v130;
  v133 = v150 * v130 + floor((v149 * v130 - v127 * v130) * 0.5);
  v134 = 1.0 / v130;
  v135 = v134 * v133;
  v136 = v131 * v134;
  v137 = v132 * v134;
  v160.origin.x = v116;
  v160.origin.y = v123;
  v160.size.width = v117;
  v160.size.height = v118;
  v138 = CGRectGetMaxY(v160);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "searchAttachmentsCellDatePadding");
  v141 = v138 + v140;

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setFrame:", v135, v141, v136, v137);

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v161.origin.x = v116;
  v161.origin.y = v123;
  v161.size.width = v117;
  v161.size.height = v118;
  v144 = CGRectGetMaxY(v161);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "searchAttachmentsCellDatePadding");
  objc_msgSend(v143, "_setFirstLineCapFrameOriginY:", v144 + v146);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v7, sel_prepareForReuse);
  -[CKAttachmentSearchResultCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  -[CKAttachmentSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", 0);
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", 0);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CGRect v22;

  v4 = a3;
  objc_msgSend(v4, "frame");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  v8 = CGRectGetWidth(v22);
  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
  v11 = v10;

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v8, 1.79769313e308);
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchAttachmentsImageTopPadding");
  v17 = v14 + v11 + width + v16;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchAttachmentsTitleTopPadding");
  v20 = v17 + v19 * 3.0;

  objc_msgSend(v4, "setFrame:", x, y, width, v20);
  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("AttachmentSearchCell");
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CKAttachmentSearchResultCell *v42;
  void *v43;
  id v44;

  v44 = a3;
  v7 = a4;
  objc_msgSend(v44, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", v8);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasCachedPreviewForQueryResult:", v44);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v11, "generatePreviewForQueryResult:", v44);
    v13 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v11, "cachedPreviewForQueryResult:", v44);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CKEditableSearchResultCell imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKEditableSearchResultCell imageView](self, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setContentMode:", 2);

      -[CKEditableSearchResultCell imageView](self, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClipsToBounds:", 1);
LABEL_6:

    }
  }
  objc_msgSend(v44, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributeSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "__ck_spotlightItemSnippet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByDeletingPathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "theme");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "searchAttachmentsTitleTextColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "searchResultLabelFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v43 = v17;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conversationListSenderColor");
    v42 = self;
    v24 = v13;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "searchResultLabelFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v22, v19, v38, v20, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v24;
    self = v42;

    v7 = v22;
    v17 = v43;

    -[CKAttachmentSearchResultCell titleLabel](v42, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAttributedText:", v28);

  }
  objc_msgSend(v17, "contentCreationDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDate:", v30);

  +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v44);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentSearchResultCell avatarView](self, "avatarView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setContact:", v32);

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "searchAttachmentsCellCornerRadius");
  objc_msgSend(v35, "setCornerRadius:");

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setClipsToBounds:", 1);

  -[CKAttachmentSearchResultCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_thumbnailGenerated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedPreviewForQueryResult:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKEditableSearchResultCell imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v8);

      if (CKIsRunningInMacCatalyst())
      {
        -[CKEditableSearchResultCell imageView](self, "imageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setContentMode:", 2);

        -[CKEditableSearchResultCell imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setClipsToBounds:", 1);

      }
    }
    -[CKAttachmentSearchResultCell setNeedsLayout](self, "setNeedsLayout");
    -[CKAttachmentSearchResultCell layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAttachmentSearchResultCell;
  -[CKEditableSearchResultCell setSelected:](&v3, sel_setSelected_, a3);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (BOOL)suppressAvatars
{
  return self->_suppressAvatars;
}

- (void)setSuppressAvatars:(BOOL)a3
{
  self->_suppressAvatars = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (CKSearchAvatarSupplementryView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
