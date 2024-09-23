@implementation CPPointOfInterest

+ (CGSize)pinImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)selectedPinImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage selectedPinImage:(UIImage *)selectedPinImage
{
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  UIImage *v24;
  UIImage *v25;
  CPPointOfInterest *v26;
  uint64_t v27;
  NSUUID *identifier;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  NSString *v38;
  uint64_t v39;
  NSString *v40;
  MKMapItem *v42;
  objc_super v43;

  v42 = location;
  v18 = title;
  v19 = subtitle;
  v20 = summary;
  v21 = detailTitle;
  v22 = detailSubtitle;
  v23 = detailSummary;
  v24 = pinImage;
  v25 = selectedPinImage;
  v43.receiver = self;
  v43.super_class = (Class)CPPointOfInterest;
  v26 = -[CPPointOfInterest init](&v43, sel_init);
  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = objc_claimAutoreleasedReturnValue();
    identifier = v26->_identifier;
    v26->_identifier = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_location, location);
    v29 = -[NSString copy](v18, "copy");
    v30 = v26->_title;
    v26->_title = (NSString *)v29;

    v31 = -[NSString copy](v19, "copy");
    v32 = v26->_subtitle;
    v26->_subtitle = (NSString *)v31;

    v33 = -[NSString copy](v20, "copy");
    v34 = v26->_summary;
    v26->_summary = (NSString *)v33;

    v35 = -[NSString copy](v21, "copy");
    v36 = v26->_detailTitle;
    v26->_detailTitle = (NSString *)v35;

    v37 = -[NSString copy](v22, "copy");
    v38 = v26->_detailSubtitle;
    v26->_detailSubtitle = (NSString *)v37;

    v39 = -[NSString copy](v23, "copy");
    v40 = v26->_detailSummary;
    v26->_detailSummary = (NSString *)v39;

    -[CPPointOfInterest setPinImage:](v26, "setPinImage:", v24);
    -[CPPointOfInterest setSelectedPinImage:](v26, "setSelectedPinImage:", v25);
  }

  return v26;
}

- (CPPointOfInterest)initWithLocation:(MKMapItem *)location title:(NSString *)title subtitle:(NSString *)subtitle summary:(NSString *)summary detailTitle:(NSString *)detailTitle detailSubtitle:(NSString *)detailSubtitle detailSummary:(NSString *)detailSummary pinImage:(UIImage *)pinImage
{
  return -[CPPointOfInterest initWithLocation:title:subtitle:summary:detailTitle:detailSubtitle:detailSummary:pinImage:selectedPinImage:](self, "initWithLocation:title:subtitle:summary:detailTitle:detailSubtitle:detailSummary:pinImage:selectedPinImage:", location, title, subtitle, summary, detailTitle, detailSubtitle, detailSummary, pinImage, pinImage);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointOfInterest)initWithCoder:(id)a3
{
  id v4;
  CPPointOfInterest *v5;
  uint64_t v6;
  MKMapItem *location;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *summary;
  uint64_t v14;
  CPImageSet *pinImageSet;
  uint64_t v16;
  CPImageSet *selectedPinImageSet;
  uint64_t v18;
  NSString *detailTitle;
  uint64_t v20;
  NSString *detailSubtitle;
  uint64_t v22;
  NSString *detailSummary;
  uint64_t v24;
  CPTextButton *primaryButton;
  uint64_t v26;
  CPTextButton *secondaryButton;
  uint64_t v28;
  NSUUID *identifier;

  v4 = a3;
  v5 = -[CPPointOfInterest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestLocation"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (MKMapItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestSubtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestSummaryKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    summary = v5->_summary;
    v5->_summary = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestMapMarkerKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    pinImageSet = v5->_pinImageSet;
    v5->_pinImageSet = (CPImageSet *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestSelectedMapMarkerKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    selectedPinImageSet = v5->_selectedPinImageSet;
    v5->_selectedPinImageSet = (CPImageSet *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestDetailTitleKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    detailTitle = v5->_detailTitle;
    v5->_detailTitle = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestDetailSubtitleKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    detailSubtitle = v5->_detailSubtitle;
    v5->_detailSubtitle = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestDetailSummaryKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    detailSummary = v5->_detailSummary;
    v5->_detailSummary = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestDetailPrimaryButtonKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (CPTextButton *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointOfInterestDetailSecondayButtonKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (CPTextButton *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPPointOfInterestIdentifierKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v15;
  id v16;

  v4 = a3;
  -[CPPointOfInterest location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPPointOfInterestLocation"));

  -[CPPointOfInterest title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPPointOfInterestTitle"));

  -[CPPointOfInterest subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPPointOfInterestSubtitle"));

  -[CPPointOfInterest summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CPPointOfInterestSummaryKey"));

  -[CPPointOfInterest pinImageSet](self, "pinImageSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CPPointOfInterestMapMarkerKey"));

  -[CPPointOfInterest selectedPinImageSet](self, "selectedPinImageSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("CPPointOfInterestSelectedMapMarkerKey"));

  -[CPPointOfInterest detailTitle](self, "detailTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("CPPointOfInterestDetailTitleKey"));

  -[CPPointOfInterest detailSubtitle](self, "detailSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("CPPointOfInterestDetailSubtitleKey"));

  -[CPPointOfInterest detailSummary](self, "detailSummary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("CPPointOfInterestDetailSummaryKey"));

  -[CPPointOfInterest primaryButton](self, "primaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("CPPointOfInterestDetailPrimaryButtonKey"));

  -[CPPointOfInterest secondaryButton](self, "secondaryButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("CPPointOfInterestDetailSecondayButtonKey"));

  -[CPPointOfInterest identifier](self, "identifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("kCPPointOfInterestIdentifierKey"));

}

- (void)setPinImage:(UIImage *)pinImage
{
  UIImage *v4;
  CPImageSet *v5;
  CPImageSet *v6;
  CPImageSet *pinImageSet;
  _QWORD v8[5];

  v4 = pinImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __33__CPPointOfInterest_setPinImage___block_invoke;
    v8[3] = &unk_24C77D488;
    v8[4] = self;
    v6 = -[CPImageSet initWithImage:treatmentBlock:](v5, "initWithImage:treatmentBlock:", v4, v8);
    pinImageSet = self->_pinImageSet;
    self->_pinImageSet = v6;
  }
  else
  {
    pinImageSet = self->_pinImageSet;
    self->_pinImageSet = 0;
  }

}

id __33__CPPointOfInterest_setPinImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "pinImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIImage)pinImage
{
  void *v2;
  void *v3;

  -[CPPointOfInterest pinImageSet](self, "pinImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setSelectedPinImage:(UIImage *)selectedPinImage
{
  UIImage *v4;
  CPImageSet *v5;
  CPImageSet *v6;
  CPImageSet *selectedPinImageSet;
  _QWORD v8[5];

  v4 = selectedPinImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __41__CPPointOfInterest_setSelectedPinImage___block_invoke;
    v8[3] = &unk_24C77D488;
    v8[4] = self;
    v6 = -[CPImageSet initWithImage:treatmentBlock:](v5, "initWithImage:treatmentBlock:", v4, v8);
    selectedPinImageSet = self->_selectedPinImageSet;
    self->_selectedPinImageSet = v6;
  }
  else
  {
    selectedPinImageSet = self->_selectedPinImageSet;
    self->_selectedPinImageSet = 0;
  }

}

id __41__CPPointOfInterest_setSelectedPinImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "selectedPinImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIImage)selectedPinImage
{
  void *v2;
  void *v3;

  -[CPPointOfInterest selectedPinImageSet](self, "selectedPinImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CPPointOfInterest isEqualToPointOfInterest:](self, "isEqualToPointOfInterest:", v4);

  return v5;
}

- (BOOL)isEqualToPointOfInterest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;

  v4 = a3;
  -[CPPointOfInterest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_10;
  -[CPPointOfInterest title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
    goto LABEL_10;
  -[CPPointOfInterest subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (!v13)
    goto LABEL_10;
  -[CPPointOfInterest summary](self, "summary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v16)
    goto LABEL_10;
  -[CPPointOfInterest detailTitle](self, "detailTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if (!v19)
    goto LABEL_10;
  -[CPPointOfInterest detailSubtitle](self, "detailSubtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailSubtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (!v22)
    goto LABEL_10;
  -[CPPointOfInterest detailSummary](self, "detailSummary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailSummary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if (!v25)
    goto LABEL_10;
  -[CPPointOfInterest pinImageSet](self, "pinImageSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinImageSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if (v28)
  {
    -[CPPointOfInterest location](self, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

  }
  else
  {
LABEL_10:
    v31 = 0;
  }

  return v31;
}

- (MKMapItem)location
{
  return self->_location;
}

- (void)setLocation:(MKMapItem *)location
{
  objc_storeStrong((id *)&self->_location, location);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_setProperty_nonatomic_copy(self, a2, subtitle, 24);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
  objc_setProperty_nonatomic_copy(self, a2, summary, 32);
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(NSString *)detailTitle
{
  objc_setProperty_nonatomic_copy(self, a2, detailTitle, 40);
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(NSString *)detailSubtitle
{
  objc_setProperty_nonatomic_copy(self, a2, detailSubtitle, 48);
}

- (NSString)detailSummary
{
  return self->_detailSummary;
}

- (void)setDetailSummary:(NSString *)detailSummary
{
  objc_setProperty_nonatomic_copy(self, a2, detailSummary, 56);
}

- (CPTextButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(CPTextButton *)primaryButton
{
  objc_storeStrong((id *)&self->_primaryButton, primaryButton);
}

- (CPTextButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(CPTextButton *)secondaryButton
{
  objc_storeStrong((id *)&self->_secondaryButton, secondaryButton);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPImageSet)pinImageSet
{
  return self->_pinImageSet;
}

- (void)setPinImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_pinImageSet, a3);
}

- (CPImageSet)selectedPinImageSet
{
  return self->_selectedPinImageSet;
}

- (void)setSelectedPinImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPinImageSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPinImageSet, 0);
  objc_storeStrong((id *)&self->_pinImageSet, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailSummary, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
