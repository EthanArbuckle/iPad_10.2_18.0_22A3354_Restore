@implementation MKCompactDeveloperPlaceCardLoadingView

+ (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 240.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MKCompactDeveloperPlaceCardLoadingView)init
{
  MKCompactDeveloperPlaceCardLoadingView *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MKCompactDeveloperPlaceCardLoadingView;
  v2 = -[MKCompactDeveloperPlaceCardLoadingView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:ofType:](MKDeveloperPlaceCardLoadingViewDecorator, "decorateView:ofType:", v2, 4);
    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("DeveloperPlaceCardCompactBackgroundColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCompactDeveloperPlaceCardLoadingView setBackgroundColor:](v2, "setBackgroundColor:", v4);

    -[MKCompactDeveloperPlaceCardLoadingView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[MKCompactDeveloperPlaceCardLoadingView widthAnchor](v2, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintGreaterThanOrEqualToConstant:", 240.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    -[MKCompactDeveloperPlaceCardLoadingView heightAnchor](v2, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", 100.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v10);

  }
  return v2;
}

@end
