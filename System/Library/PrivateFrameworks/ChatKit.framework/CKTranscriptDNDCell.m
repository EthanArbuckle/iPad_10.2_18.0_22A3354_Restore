@implementation CKTranscriptDNDCell

+ (id)identifier
{
  return CFSTR("transcript-management-dnd-cell");
}

+ (double)preferredHeight
{
  return 44.0;
}

- (CKTranscriptDNDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKTranscriptDNDCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptDNDCell;
  v4 = -[CKTranscriptDNDCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEAA38]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKTranscriptDNDCell textLabel](v4, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    -[CKTranscriptDNDCell setMuteSwitch:](v4, "setMuteSwitch:", v6);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptDNDCell;
  -[CKTranscriptDNDCell layoutSubviews](&v22, sel_layoutSubviews);
  -[CKTranscriptDNDCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[CKTranscriptDNDCell muteSwitch](self, "muteSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKTranscriptDNDCell muteSwitch](self, "muteSwitch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;

    if ((-[CKTranscriptDNDCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      -[CKTranscriptDNDCell contentView](self, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = 20.0;
      if (v6 >= 20.0)
        v15 = v6;
      v4 = v14 - v15 - v10;

    }
    -[CKTranscriptDNDCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = (v17 - v12) * 0.5;
    if (CKMainScreenScale_once_78 != -1)
      dispatch_once(&CKMainScreenScale_once_78, &__block_literal_global_194);
    v19 = *(double *)&CKMainScreenScale_sMainScreenScale_78;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_78 == 0.0)
      v19 = 1.0;
    v20 = ceil(v18 * v19) / v19;

    -[CKTranscriptDNDCell muteSwitch](self, "muteSwitch");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v4, v20, v10, v12);

  }
}

- (void)setMuteSwitch:(id)a3
{
  UISwitch *v5;
  UISwitch *muteSwitch;
  void *v7;
  UISwitch *v8;

  v5 = (UISwitch *)a3;
  muteSwitch = self->_muteSwitch;
  v8 = v5;
  if (muteSwitch != v5)
  {
    -[UISwitch removeFromSuperview](muteSwitch, "removeFromSuperview");
    objc_storeStrong((id *)&self->_muteSwitch, a3);
    -[CKTranscriptDNDCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[CKTranscriptDNDCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UISwitch)muteSwitch
{
  return self->_muteSwitch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteSwitch, 0);
}

@end
