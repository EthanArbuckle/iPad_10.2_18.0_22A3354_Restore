@implementation MPVolumeViewController

- (MPVolumeViewController)init
{
  MPVolumeViewController *v2;
  MPVolumeView *v3;
  uint64_t v4;
  MPVolumeView *volumeView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPVolumeViewController;
  v2 = -[MPVolumeViewController init](&v7, sel_init);
  if (v2)
  {
    v3 = [MPVolumeView alloc];
    v4 = -[MPVolumeView initWithFrame:style:](v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    volumeView = v2->_volumeView;
    v2->_volumeView = (MPVolumeView *)v4;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MPVolumeViewController;
  -[MPVolumeViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[MPVolumeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeView setTranslatesAutoresizingMaskIntoConstraints:](self->_volumeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_volumeView);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_volumeView, 7, 0, v3, 7, 1.0, -31.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_volumeView, 8, 0, v3, 8, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_volumeView, 9, 0, v3, 9, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_volumeView, 10, 0, v3, 10, 1.0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v8);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MPVolumeView)volumeView
{
  return self->_volumeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeView, 0);
}

@end
