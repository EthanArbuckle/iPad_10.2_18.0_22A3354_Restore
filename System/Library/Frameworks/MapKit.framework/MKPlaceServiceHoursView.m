@implementation MKPlaceServiceHoursView

- (id)_standardLabel
{
  _MKUILabel *v3;
  _MKUILabel *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = [_MKUILabel alloc];
  v4 = -[_MKUILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](v4, "setTextColor:", v5);

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](v4, "setFont:", v7);

  -[_MKUILabel setNumberOfLines:](v4, "setNumberOfLines:", 4);
  -[MKPlaceServiceHoursView addSubview:](self, "addSubview:", v4);
  return v4;
}

@end
