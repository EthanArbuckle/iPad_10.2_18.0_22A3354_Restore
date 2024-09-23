@implementation BTSDeviceConfigDigitalCrownController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BTSDeviceConfigDigitalCrownController;
  -[PSListItemsController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[BTSDeviceConfigDigitalCrownController setupTableViewHeader](self, "setupTableViewHeader");
}

- (void)setupTableViewHeader
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *rotationImage;
  id v7;
  double v8;
  double v9;
  double v10;
  UIImageView *v11;
  UIImageView *rotationImageView;
  void *v13;
  id v14;

  -[BTSDeviceConfigDigitalCrownController getRotationImageFileName:](self, "getRotationImageFileName:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805A0]));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v14, v4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  rotationImage = self->_rotationImage;
  self->_rotationImage = v5;

  v7 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[UIImage size](self->_rotationImage, "size");
  v9 = v8;
  -[UIImage size](self->_rotationImage, "size");
  v11 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, v9, v10 + 40.0);
  rotationImageView = self->_rotationImageView;
  self->_rotationImageView = v11;

  -[UIImageView setImage:](self->_rotationImageView, "setImage:", self->_rotationImage);
  -[UIImageView setContentMode:](self->_rotationImageView, "setContentMode:", 6);
  -[BTSDeviceConfigDigitalCrownController table](self, "table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTableHeaderView:", self->_rotationImageView);

}

- (void)listItemSelected:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTSDeviceConfigDigitalCrownController;
  v4 = a3;
  -[PSListItemsController listItemSelected:](&v6, sel_listItemSelected_, v4);
  v5 = objc_msgSend(v4, "row", v6.receiver, v6.super_class);

  -[BTSDeviceConfigDigitalCrownController updateRotateImage:](self, "updateRotateImage:", v5 + 1);
}

- (void)updateRotateImage:(int64_t)a3
{
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *rotationImage;
  id v8;

  -[BTSDeviceConfigDigitalCrownController getRotationImageFileName:](self, "getRotationImageFileName:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v8, v5);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  rotationImage = self->_rotationImage;
  self->_rotationImage = v6;

  -[UIImageView setImage:](self->_rotationImageView, "setImage:", self->_rotationImage);
}

- (id)getRotationImageFileName:(int64_t)a3
{
  const char *v3;

  v3 = "RotateBackToFrontGraphic";
  if (a3 == 2)
    v3 = "RotateFrontToBackGraphic";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationImageView, 0);
  objc_storeStrong((id *)&self->_rotationImage, 0);
}

@end
