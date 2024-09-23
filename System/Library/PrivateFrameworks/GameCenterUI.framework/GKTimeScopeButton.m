@implementation GKTimeScopeButton

- (GKTimeScopeButton)initWithFrame:(CGRect)a3
{
  GKTimeScopeButton *v3;
  GKTimeScopeButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKTimeScopeButton;
  v3 = -[GKTimeScopeButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GKTimeScopeButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKTimeScopeButton;
  -[GKTimeScopeButton awakeFromNib](&v3, sel_awakeFromNib);
  -[GKTimeScopeButton _commonInit](self, "_commonInit");
}

- (void)_commonInit
{
  -[GKTimeScopeButton setTimeScope:](self, "setTimeScope:", 2);
}

- (void)setTimeScope:(int64_t)a3
{
  id v4;

  self->_timeScope = a3;
  objc_msgSend(MEMORY[0x1E0D25308], "localizedStringForTimeScope:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTimeScopeButton updateWithTitle:](self, "updateWithTitle:", v4);

}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  id v4;

  self->_leaderboardOccurrence = a3;
  objc_msgSend(MEMORY[0x1E0D25308], "localizedStringForLeaderboardOccurrence:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKTimeScopeButton updateWithTitle:](self, "updateWithTitle:", v4);

}

- (void)updateWithTitle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textAttachmentWithImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
  objc_msgSend(v6, "appendAttributedString:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v6, "appendAttributedString:", v11);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendAttributedString:", v12);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0D253F8])
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC1140];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v15;
  v18[0] = v13;
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v16, 0, objc_msgSend(v6, "length"));

  -[GKTimeScopeButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v6, 0);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

@end
