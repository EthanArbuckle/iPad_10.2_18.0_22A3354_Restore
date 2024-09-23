@implementation CKDetailsContactsStandardTableViewCell

+ (double)preferredHeight
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailsContactCellMinimumHeight");
  v4 = v3;

  return v4;
}

- (CKDetailsContactsStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsContactsStandardTableViewCell *v4;
  CKDetailsContactsStandardTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  v4 = -[CKDetailsContactsTableViewCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsContactsTableViewCell nameLabel](v4, "nameLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineBreakMode:", 4);

    -[CKDetailsContactsStandardTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell nameLabel](v5, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detailsViewContactImageDiameter");
    v11 = v10;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailsViewContactImageDiameter");
    v14 = v13;
    -[CKDetailsContactsTableViewCell contactAvatarView](v5, "contactAvatarView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v11, v14);

    -[CKDetailsContactsStandardTableViewCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell contactAvatarView](v5, "contactAvatarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double MaxY;
  double v94;
  double v95;
  void *v96;
  void *v97;
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
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  objc_super v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v138.receiver = self;
  v138.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  -[CKDetailsContactsTableViewCell layoutSubviews](&v138, sel_layoutSubviews);
  v3 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsContactCellButtonWidth");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailsContactCellButtonHeight");
  v9 = v8;

  v10 = 3.0;
  if (CKIsRunningInMacCatalyst())
  {
    if (v3)
    {
LABEL_3:
      v11 = ceil(v10);
      goto LABEL_9;
    }
  }
  else
  {
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    if (CGRectGetWidth(v139) > 320.0)
      v10 = 8.0;
    else
      v10 = 6.0;

    if (v3)
      goto LABEL_3;
  }
  -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v11 = ceil(v14 - v10);

LABEL_9:
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailsInterGroupButtonPadding");
    v17 = v16 + v16;

  }
  else
  {
    v17 = 0.0;
  }
  -[CKDetailsContactsStandardTableViewCell visibleButtons](self, "visibleButtons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  v137 = v10;
  if (v19)
  {
    v20 = 0;
    v21 = ceil(v6 + v10 * 2.0);
    if (v3)
      v22 = v21;
    else
      v22 = -v21;
    v23 = ceil(v6);
    if (v3)
      v24 = v23;
    else
      v24 = -v23;
    v25 = floor(v6 * 0.5);
    do
    {
      if (v20)
        v26 = v22;
      else
        v26 = v24;
      v11 = v11 + v26;
      -[CKDetailsContactsStandardTableViewCell visibleButtons](self, "visibleButtons");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setBounds:", 0.0, 0.0, v6, v9);
      -[CKDetailsContactsStandardTableViewCell bounds](self, "bounds");
      v30 = floor(v29 * 0.5);
      v31 = v25 + v11 - v17;
      if (v3)
        v31 = v17 + v11 - v25;
      objc_msgSend(v28, "setCenter:", v31, v30);
      -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setHidden:", v32 != 0);
      ++v20;
      -[CKDetailsContactsStandardTableViewCell visibleButtons](self, "visibleButtons");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

    }
    while (v20 < v34);
  }
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;

  -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v3)
  {
    objc_msgSend(v40, "bounds");
    v43 = v42;
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMargins");
    v46 = v43 - v45 - v37;
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v49 = (v48 - v39) * 0.5;
    if (CKMainScreenScale_once_98 != -1)
      dispatch_once(&CKMainScreenScale_once_98, &__block_literal_global_250);
    v50 = *(double *)&CKMainScreenScale_sMainScreenScale_98;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_98 == 0.0)
      v50 = 1.0;
    v51 = floor(v46 * v50) / v50;
    v52 = floor(v49 * v50) / v50;

  }
  else
  {
    objc_msgSend(v40, "layoutMargins");
    v54 = v53;
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bounds");
    v56 = (v55 - v39) * 0.5;
    if (CKMainScreenScale_once_98 != -1)
      dispatch_once(&CKMainScreenScale_once_98, &__block_literal_global_250);
    v57 = *(double *)&CKMainScreenScale_sMainScreenScale_98;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_98 == 0.0)
      v57 = 1.0;
    v51 = floor(v54 * v57) / v57;
    v52 = floor(v56 * v57) / v57;
  }

  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFrame:", v51, v52, v37, v39);

  -[CKDetailsContactsTableViewCell entityName](self, "entityName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setText:", v59);

  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setNumberOfLines:", 1);

  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "detailsContactAvatarLabelSpacing");
    v64 = v51 - v63;

    v65 = ceil(v64 - (v17 + v11 + v137 * 2.0));
    -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    objc_msgSend(v66, "sizeThatFits:", v65, v67);
    v69 = v68;
    v71 = v70;

    if (v69 >= v65)
      v72 = v65;
    else
      v72 = v69;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "detailsContactAvatarLabelSpacing");
    v75 = ceil(v51 - v74 - v72);

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "detailsContactAvatarLabelSpacing");
    v75 = ceil(v37 + v51 + v77);

    v65 = ceil(v11 - v75 + v137 * -2.0 - v17);
    -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    objc_msgSend(v78, "sizeThatFits:", v65, v79);
    v72 = v80;
    v71 = v81;

    if (v72 >= v65)
      v72 = v65;
  }
  if (-[CKDetailsContactsTableViewCell showsTUConversationStatus](self, "showsTUConversationStatus"))
  {
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNumberOfLines:", 1);

    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    objc_msgSend(v83, "sizeThatFits:", v65, v84);
    v86 = v85;
    v88 = v87;

    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    v90 = (v89 - v71 - v88) * 0.5;
    if (CKMainScreenScale_once_98 != -1)
      dispatch_once(&CKMainScreenScale_once_98, &__block_literal_global_250);
    v91 = *(double *)&CKMainScreenScale_sMainScreenScale_98;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_98 == 0.0)
      v91 = 1.0;
    v92 = floor(v90 * v91) / v91;
    if (v86 < v65)
      v65 = v86;
    v140.origin.x = v75;
    v140.origin.y = v92;
    v140.size.width = v72;
    v140.size.height = v71;
    MaxY = CGRectGetMaxY(v140);
    v94 = v65 - v72;
    if (!v3)
      v94 = 0.0;
    v95 = v75 - v94;
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:
    v109 = v96;
    objc_msgSend(v96, "setFrame:", v95, MaxY, v65, v88);

    goto LABEL_66;
  }
  if (-[CKDetailsContactsTableViewCell showsLocation](self, "showsLocation"))
  {
    -[CKDetailsContactsTableViewCell locationString](self, "locationString");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setText:", v97);

    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setNumberOfLines:", 1);

    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    objc_msgSend(v100, "sizeThatFits:", v65, v101);
    v103 = v102;
    v88 = v104;

    -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
    v106 = (v105 - v71 - v88) * 0.5;
    if (CKMainScreenScale_once_98 != -1)
      dispatch_once(&CKMainScreenScale_once_98, &__block_literal_global_250);
    v107 = *(double *)&CKMainScreenScale_sMainScreenScale_98;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_98 == 0.0)
      v107 = 1.0;
    v92 = floor(v106 * v107) / v107;
    if (v103 < v65)
      v65 = v103;
    v141.origin.x = v75;
    v141.origin.y = v92;
    v141.size.width = v72;
    v141.size.height = v71;
    MaxY = CGRectGetMaxY(v141);
    v108 = v65 - v72;
    if (!v3)
      v108 = 0.0;
    v95 = v75 - v108;
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  -[CKDetailsContactsStandardTableViewCell frame](self, "frame");
  v71 = v110;
  v92 = 0.0;
LABEL_66:
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setFrame:", v75, v92, v72, v71);

  -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    -[CKDetailsContactsStandardTableViewCell visibleButtons](self, "visibleButtons");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "lastObject");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "center");
    objc_msgSend(v115, "setCenter:");

    -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "startAnimating");

  }
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "frame");
  v119 = v118;
  v121 = v120;
  v123 = v122;

  -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "layoutMargins");
  v126 = v125;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "detailsContactAvatarLabelSpacing");
  v129 = v126 + v128;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "detailsViewContactImageDiameter");
  v132 = v129 + v131;

  v133 = v132;
  if (v3)
  {
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "layoutMargins");
    v133 = v135;

  }
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setFrame:", v133, v119, v121 - v132, v123);

}

- (void)setShowsLocation:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  -[CKDetailsContactsTableViewCell setShowsLocation:](&v10, sel_setShowsLocation_, a3);
  -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

    }
  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDetailsContactsStandardTableViewCell;
  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](&v8, sel_setShowsTUConversationStatus_, a3);
  -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

  }
}

- (void)_updateVisibleButtons
{
  NSMutableArray *visibleButtons;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;

  visibleButtons = self->_visibleButtons;
  if (!visibleButtons)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_visibleButtons;
    self->_visibleButtons = v4;

    visibleButtons = self->_visibleButtons;
  }
  -[NSMutableArray removeAllObjects](visibleButtons, "removeAllObjects");
  if (-[CKDetailsContactsTableViewCell showPhoneButton](self, "showPhoneButton"))
  {
    v6 = self->_visibleButtons;
    -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  else
  {
    -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");
  }

  if (-[CKDetailsContactsTableViewCell showMessageButton](self, "showMessageButton"))
  {
    v10 = self->_visibleButtons;
    -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

  }
  else
  {
    -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");
  }

  if (-[CKDetailsContactsTableViewCell showFaceTimeVideoButton](self, "showFaceTimeVideoButton"))
  {
    v14 = self->_visibleButtons;
    -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v15);

    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

  }
  else
  {
    -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");
  }

  if (-[CKDetailsContactsTableViewCell showScreenSharingButton](self, "showScreenSharingButton"))
  {
    v18 = self->_visibleButtons;
    -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    -[CKDetailsContactsStandardTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

  }
  else
  {
    -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeFromSuperview");
  }

  -[CKDetailsContactsStandardTableViewCell layoutSubviews](self, "layoutSubviews");
}

- (void)_hideAllButtons
{
  NSMutableArray *visibleButtons;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  visibleButtons = self->_visibleButtons;
  if (!visibleButtons)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_visibleButtons;
    self->_visibleButtons = v4;

    visibleButtons = self->_visibleButtons;
  }
  -[NSMutableArray removeAllObjects](visibleButtons, "removeAllObjects");
  if (-[CKDetailsContactsTableViewCell showPhoneButton](self, "showPhoneButton"))
  {
    -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  if (-[CKDetailsContactsTableViewCell showMessageButton](self, "showMessageButton"))
  {
    -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  if (-[CKDetailsContactsTableViewCell showFaceTimeVideoButton](self, "showFaceTimeVideoButton"))
  {
    -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

  }
  if (-[CKDetailsContactsTableViewCell showScreenSharingButton](self, "showScreenSharingButton"))
  {
    -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

  }
  -[CKDetailsContactsStandardTableViewCell layoutSubviews](self, "layoutSubviews");
}

- (NSMutableArray)visibleButtons
{
  return self->_visibleButtons;
}

- (void)setVisibleButtons:(id)a3
{
  objc_storeStrong((id *)&self->_visibleButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleButtons, 0);
}

@end
