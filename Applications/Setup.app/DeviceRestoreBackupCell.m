@implementation DeviceRestoreBackupCell

- (DeviceRestoreBackupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSArray *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSArray *v31;
  DeviceRestoreBackupCell *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;
  id location[3];
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];

  v46 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v46;
  v46 = 0;
  v44.receiver = v4;
  v44.super_class = (Class)DeviceRestoreBackupCell;
  v46 = -[DeviceRestoreBackupCell initWithStyle:reuseIdentifier:](&v44, "initWithStyle:reuseIdentifier:", 3, location[0]);
  objc_storeStrong(&v46, v46);
  if (v46)
  {
    v5 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v6 = (void *)*((_QWORD *)v46 + 1);
    *((_QWORD *)v46 + 1) = v5;

    objc_msgSend(*((id *)v46 + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_msgSend(v46, "contentView");
    objc_msgSend(v7, "addSubview:", *((_QWORD *)v46 + 1));

    v37 = objc_msgSend(*((id *)v46 + 1), "leadingAnchor");
    v39 = objc_msgSend(v46, "contentView");
    v36 = objc_msgSend(v39, "leadingAnchor");
    v34 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", 2.0);
    v48[0] = v34;
    v8 = objc_msgSend(v46, "contentView");
    v9 = objc_msgSend(v8, "centerYAnchor");
    v10 = objc_msgSend(*((id *)v46 + 1), "centerYAnchor");
    v11 = objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
    v48[1] = v11;
    v12 = objc_msgSend(*((id *)v46 + 1), "widthAnchor");
    v13 = objc_msgSend(v12, "constraintEqualToConstant:", 39.0);
    v48[2] = v13;
    v14 = objc_msgSend(*((id *)v46 + 1), "heightAnchor");
    v15 = objc_msgSend(v14, "constraintEqualToConstant:", 39.0);
    v48[3] = v15;
    v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    v43 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v43, "setAxis:", 1);
    objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v18 = (void *)*((_QWORD *)v46 + 2);
    *((_QWORD *)v46 + 2) = v17;

    objc_msgSend(*((id *)v46 + 2), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v46 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v43, "addArrangedSubview:", *((_QWORD *)v46 + 2));
    objc_msgSend(v43, "setCustomSpacing:afterView:", *((_QWORD *)v46 + 2), 2.0);
    v19 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v20 = (void *)*((_QWORD *)v46 + 3);
    *((_QWORD *)v46 + 3) = v19;

    objc_msgSend(*((id *)v46 + 3), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v46 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v43, "addArrangedSubview:", *((_QWORD *)v46 + 3));
    v21 = objc_msgSend(v46, "contentView");
    objc_msgSend(v21, "addSubview:", v43);

    v42 = objc_msgSend(v46, "contentView");
    v41 = objc_msgSend(v42, "heightAnchor");
    v40 = objc_msgSend(v43, "heightAnchor");
    v38 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", 2.0 * 9.0);
    v47[0] = v38;
    v35 = objc_msgSend(v46, "contentView");
    v22 = objc_msgSend(v35, "trailingAnchor");
    v23 = objc_msgSend(v43, "trailingAnchor");
    v24 = objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v47[1] = v24;
    v25 = objc_msgSend(v43, "leadingAnchor");
    v26 = objc_msgSend(*((id *)v46 + 1), "trailingAnchor");
    v27 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 2.0);
    v47[2] = v27;
    v28 = objc_msgSend(v43, "centerYAnchor");
    v29 = objc_msgSend(v46, "centerYAnchor");
    v30 = objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v47[3] = v30;
    v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    objc_storeStrong(&v43, 0);
  }
  v32 = (DeviceRestoreBackupCell *)v46;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v46, 0);
  return v32;
}

- (id)imageView
{
  return self->_restoreDeviceImageView;
}

- (id)textLabel
{
  return self->_restoreNameLabel;
}

- (id)detailTextLabel
{
  return self->_restoreDescriptionLabel;
}

- (UIImageView)restoreDeviceImageView
{
  return self->_restoreDeviceImageView;
}

- (void)setRestoreDeviceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_restoreDeviceImageView, a3);
}

- (UILabel)restoreNameLabel
{
  return self->_restoreNameLabel;
}

- (void)setRestoreNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_restoreNameLabel, a3);
}

- (UILabel)restoreDescriptionLabel
{
  return self->_restoreDescriptionLabel;
}

- (void)setRestoreDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_restoreDescriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_restoreNameLabel, 0);
  objc_storeStrong((id *)&self->_restoreDeviceImageView, 0);
}

@end
