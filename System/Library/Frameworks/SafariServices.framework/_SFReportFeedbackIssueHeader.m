@implementation _SFReportFeedbackIssueHeader

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("feedbackSectionHeader");
}

- (_SFReportFeedbackIssueHeader)initWithFrame:(CGRect)a3
{
  _SFReportFeedbackIssueHeader *v3;
  UILabel *v4;
  UILabel *sectionHeaderLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFReportFeedbackIssueHeader *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_SFReportFeedbackIssueHeader;
  v3 = -[_SFReportFeedbackIssueHeader initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    sectionHeaderLabel = v3->_sectionHeaderLabel;
    v3->_sectionHeaderLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC4B98]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_sectionHeaderLabel, "setFont:", v6);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_sectionHeaderLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_sectionHeaderLabel, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](v3->_sectionHeaderLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_sectionHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFReportFeedbackIssueHeader addSubview:](v3, "addSubview:", v3->_sectionHeaderLabel);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_sectionHeaderLabel, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportFeedbackIssueHeader topAnchor](v3, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    -[UILabel leadingAnchor](v3->_sectionHeaderLabel, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportFeedbackIssueHeader leadingAnchor](v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    -[UILabel trailingAnchor](v3->_sectionHeaderLabel, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportFeedbackIssueHeader trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v12;
    -[UILabel bottomAnchor](v3->_sectionHeaderLabel, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportFeedbackIssueHeader bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

    v17 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_sectionHeaderLabel, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_sectionHeaderLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderLabel, 0);
}

@end
