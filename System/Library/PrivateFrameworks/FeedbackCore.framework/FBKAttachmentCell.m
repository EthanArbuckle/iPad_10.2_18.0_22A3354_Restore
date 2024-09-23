@implementation FBKAttachmentCell

+ (id)reuseIdentifier
{
  return CFSTR("FBKAttachmentCell");
}

- (void)awakeFromNib
{
  id v3;
  UILabel *v4;
  UILabel *accessoryLabel;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *doneLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FBKAttachmentCell;
  -[FBKAttachmentCell awakeFromNib](&v14, sel_awakeFromNib);
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  accessoryLabel = self->_accessoryLabel;
  self->_accessoryLabel = v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_accessoryLabel, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_accessoryLabel, "setFont:", v7);

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  doneLabel = self->_doneLabel;
  self->_doneLabel = v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_24E15EAF8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_doneLabel, "setText:", v11);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_doneLabel, "setTextColor:", v12);

  -[UILabel sizeToFit](self->_doneLabel, "sizeToFit");
  self->_showsIcon = 1;
  self->_showsFileSize = 0;
  self->_horizontalFrameInset = 0.0;
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_accessoryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_doneLabel, "setAdjustsFontSizeToFitWidth:", 1);
}

- (void)setFrame:(CGRect)a3
{
  double horizontalFrameInset;
  double v4;
  BOOL v5;
  double v6;
  objc_super v7;

  horizontalFrameInset = self->_horizontalFrameInset;
  v4 = a3.size.width + horizontalFrameInset * -2.0;
  v5 = horizontalFrameInset == 0.0;
  if (horizontalFrameInset == 0.0)
    horizontalFrameInset = -0.0;
  v6 = a3.origin.x + horizontalFrameInset;
  if (!v5)
    a3.size.width = v4;
  v7.receiver = self;
  v7.super_class = (Class)FBKAttachmentCell;
  -[FBKAttachmentCell setFrame:](&v7, sel_setFrame_, v6, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setShowsIcon:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_showsIcon = a3;
  v3 = !a3;
  -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)showGatheringState
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[FBKAttachmentCell attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileComesFromFBK");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("ATTACHING");
  else
    v8 = CFSTR("GATHERING");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24E15EAF8, CFSTR("CommonStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessoryText:](self, "setAccessoryText:", v9);

  -[FBKAttachmentCell attachment](self, "attachment");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

}

- (void)showGatheredState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[FBKAttachmentCell attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[FBKAttachmentCell attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "attachmentType");

  if (v7 != 6)
  {
    -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  -[FBKAttachmentCell attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "group");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[FBKAttachmentCell showsFileSize](self, "showsFileSize");

    if (v12)
    {
      v17 = (id)objc_opt_new();
      -[FBKAttachmentCell attachment](self, "attachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "group");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "totalFileSize");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromByteCount:", objc_msgSend(v15, "longLongValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell setAccessoryText:](self, "setAccessoryText:", v16);

      return;
    }
  }
  else
  {

  }
  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)showNotGatheredState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  if (-[FBKAttachmentCell attachmentType](self, "attachmentType") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GATHER_WITH_DIAGNOSTIC_NAME"), CFSTR("Gather %@"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x24BDD17C8];
    -[FBKAttachmentCell attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v22, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    -[FBKAttachmentCell attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isRequired");

    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REQUIRED"), CFSTR("Required"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKAttachmentCell setAccessoryText:](self, "setAccessoryText:", v13);
    }
    else
    {
      -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
      -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
    }
    -[FBKAttachmentCell attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isRequired");

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.circle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v16);

      -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = 0;
    }
    else
    {
      v21 = -[FBKAttachmentCell showsIcon](self, "showsIcon") ^ 1;
      -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = v21;
    }
    objc_msgSend(v18, "setHidden:", v20);

  }
}

- (void)showDeferredState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[FBKAttachmentCell attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[FBKAttachmentCell attachment](self, "attachment");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requirement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedWhenItWillGather");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessoryText:](self, "setAccessoryText:", v8);

}

- (void)updateDeferredStateWith:(id)a3
{
  id v4;

  objc_msgSend(a3, "localizedWhenItWillGather");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessoryText:](self, "setAccessoryText:", v4);

}

- (void)setAccessoryText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
    -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v7);

  -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", v6);

}

- (void)showButtonState
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)showUnsatisfiedState
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)showFailedToGatherState
{
  id v3;

  -[FBKAttachmentCell doneLabel](self, "doneLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", v3);

}

- (void)showDownloadUnavailableState
{
  void *v3;
  id v4;

  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)showDownloadNotPermittedState
{
  void *v3;
  id v4;

  -[FBKAttachmentCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[FBKAttachmentCell setAccessoryType:](self, "setAccessoryType:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)setGatherState:(int64_t)a3
{
  self->_gatherState = a3;
  -[FBKAttachmentCell updateCell](self, "updateCell");
}

- (void)setAttachmentType:(int64_t)a3
{
  self->_attachmentType = a3;
  -[FBKAttachmentCell updateCell](self, "updateCell");
}

- (void)updateCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __CFString **v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  _BOOL8 v21;
  void *v22;
  __CFString *v23;

  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  switch(-[FBKAttachmentCell gatherState](self, "gatherState"))
  {
    case 1:
      -[FBKAttachmentCell showGatheringState](self, "showGatheringState");
      break;
    case 2:
      -[FBKAttachmentCell showGatheredState](self, "showGatheredState");
      break;
    case 3:
      -[FBKAttachmentCell showFailedToGatherState](self, "showFailedToGatherState");
      break;
    case 6:
      -[FBKAttachmentCell showDownloadUnavailableState](self, "showDownloadUnavailableState");
      break;
    case 7:
      -[FBKAttachmentCell showDownloadNotPermittedState](self, "showDownloadNotPermittedState");
      break;
    case 8:
      -[FBKAttachmentCell showDeferredState](self, "showDeferredState");
      break;
    default:
      -[FBKAttachmentCell showNotGatheredState](self, "showNotGatheredState");
      break;
  }
  v7 = -[FBKAttachmentCell attachmentType](self, "attachmentType") - 1;
  if (v7 < 6 && ((0x3Du >> v7) & 1) != 0)
  {
    v11 = off_24E15A870[v7];
  }
  else
  {
    -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isImageFile");

    if ((v10 & 1) != 0)
    {
      v11 = FBKSystemImageNamePhoto;
    }
    else
    {
      -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isVideoFile");

      v11 = FBKSystemImageNamePaper;
      if (v14)
        v11 = FBKSystemImageNameVideo;
    }
  }
  v23 = *v11;
  if (-[FBKAttachmentCell gatherState](self, "gatherState") == 6
    || -[FBKAttachmentCell gatherState](self, "gatherState") == 3)
  {
    v15 = CFSTR("exclamationmark.circle");

    v23 = v15;
  }
  if (-[FBKAttachmentCell showsIcon](self, "showsIcon"))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

    -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityIdentifier:", v23);

  }
  -[FBKAttachmentCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = !UIContentSizeCategoryIsAccessibilityCategory(v20);
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", v21);

  -[FBKAttachmentCell updateAccessibilityLabel](self, "updateAccessibilityLabel");
}

- (void)setAttachment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_storeStrong((id *)&self->_attachment, a3);
  v5 = a3;
  -[FBKAttachmentCell setSelectionStyle:](self, "setSelectionStyle:", 3);
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[FBKAttachmentCell setGatherState:](self, "setGatherState:", objc_msgSend(v5, "state"));
  v8 = objc_msgSend(v5, "attachmentType");

  -[FBKAttachmentCell setAttachmentType:](self, "setAttachmentType:", v8);
  v9 = -[FBKAttachmentCell accessibilityTraits](self, "accessibilityTraits");
  -[FBKAttachmentCell setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00] | v9);
}

- (void)updateSuperviewToAttachmentLabelSpacing:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[FBKAttachmentCell attachmentLabelSpacingToSuperview](self, "attachmentLabelSpacingToSuperview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", a3);

  -[FBKAttachmentCell attachmentLabelSpacingToSuperview](self, "attachmentLabelSpacingToSuperview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[FBKAttachmentCell attachmentIcon](self, "attachmentIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = a3 * 0.5 - v8 * 0.5;

  -[FBKAttachmentCell superviewToImageSpacing](self, "superviewToImageSpacing");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

}

- (void)updateSuperviewToSeparatorSpacing:(double)a3
{
  void *v5;
  id v6;

  -[FBKAttachmentCell attachmentLabelSpacingToSuperview](self, "attachmentLabelSpacingToSuperview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", a3);

  -[FBKAttachmentCell attachmentLabelSpacingToSuperview](self, "attachmentLabelSpacingToSuperview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

}

- (void)updateContentInsetWithValue:(double)a3
{
  void *v5;
  id v6;

  -[FBKAttachmentCell superviewToImageSpacing](self, "superviewToImageSpacing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", a3);

  -[FBKAttachmentCell attachmentLabelSpacingToSuperview](self, "attachmentLabelSpacingToSuperview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

}

- (void)updateAccessibilityLabel
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  -[FBKAttachmentCell setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00]);
  v3 = -[FBKAttachmentCell gatherState](self, "gatherState");
  if ((unint64_t)(v3 - 6) < 2)
  {
    v10 = -[FBKAttachmentCell accessibilityTraits](self, "accessibilityTraits");
    -[FBKAttachmentCell setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BEBDF20] | v10);
  }
  else
  {
    if (v3 == 2)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      FBKAttachmentTypeToString(-[FBKAttachmentCell attachmentType](self, "attachmentType"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: %@"), v26, v19, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v22);

LABEL_16:
      goto LABEL_17;
    }
    if (v3 == 1)
    {
      -[FBKAttachmentCell attachment](self, "attachment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "fileComesFromFBK");

      objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        v8 = CFSTR("ATTACHING_ATTACHMENT_AX");
        v9 = CFSTR("Attaching %@: %@");
      }
      else
      {
        v8 = CFSTR("GATHERING_ATTACHMENT_AX");
        v9 = CFSTR("Gathering %@: %@");
      }
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      FBKAttachmentTypeToString(-[FBKAttachmentCell attachmentType](self, "attachmentType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v26, v18, v20, 0);
      goto LABEL_15;
    }
  }
  -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell accessoryLabel](self, "accessoryLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@, %@"), v18, v20, v25);
LABEL_15:
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachmentCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v24);

      goto LABEL_16;
    }
  }
  else
  {

  }
  -[FBKAttachmentCell attachmentDisplayName](self, "attachmentDisplayName");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachmentCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v18);
LABEL_17:

}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (int64_t)gatherState
{
  return self->_gatherState;
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (BOOL)showsIcon
{
  return self->_showsIcon;
}

- (BOOL)showsFileSize
{
  return self->_showsFileSize;
}

- (void)setShowsFileSize:(BOOL)a3
{
  self->_showsFileSize = a3;
}

- (double)horizontalFrameInset
{
  return self->_horizontalFrameInset;
}

- (void)setHorizontalFrameInset:(double)a3
{
  self->_horizontalFrameInset = a3;
}

- (FBKAttachment)attachment
{
  return self->_attachment;
}

- (UILabel)attachmentDisplayName
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_attachmentDisplayName);
}

- (void)setAttachmentDisplayName:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentDisplayName, a3);
}

- (UIImageView)attachmentIcon
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_attachmentIcon);
}

- (void)setAttachmentIcon:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentIcon, a3);
}

- (UILabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLabel, a3);
}

- (UILabel)doneLabel
{
  return self->_doneLabel;
}

- (void)setDoneLabel:(id)a3
{
  objc_storeStrong((id *)&self->_doneLabel, a3);
}

- (NSLayoutConstraint)superviewToImageSpacing
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_superviewToImageSpacing);
}

- (void)setSuperviewToImageSpacing:(id)a3
{
  objc_storeWeak((id *)&self->_superviewToImageSpacing, a3);
}

- (NSLayoutConstraint)attachmentLabelSpacingToSuperview
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_attachmentLabelSpacingToSuperview);
}

- (void)setAttachmentLabelSpacingToSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentLabelSpacingToSuperview, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachmentLabelSpacingToSuperview);
  objc_destroyWeak((id *)&self->_superviewToImageSpacing);
  objc_storeStrong((id *)&self->_doneLabel, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_destroyWeak((id *)&self->_attachmentIcon);
  objc_destroyWeak((id *)&self->_attachmentDisplayName);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
