@implementation ASAccessoryInfoHeaderView

- (ASAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  ASAccessoryInfoHeaderView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  UIImageView *imageView;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  UIImageView *v25;
  void *v26;
  UILabel *v27;
  UILabel *displayNameLabel;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UILabel *v33;
  UILabel *otaNameLabel;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  objc_super v99;
  _QWORD v100[11];
  _QWORD v101[3];
  _BYTE v102[128];
  uint64_t v103;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v103 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v99.receiver = self;
  v99.super_class = (Class)ASAccessoryInfoHeaderView;
  v10 = -[ASAccessoryInfoHeaderView initWithFrame:](&v99, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[ASAccessoryInfoHeaderView setLayoutMargins:](v10, "setLayoutMargins:", top, left, bottom, right);
  objc_msgSend(v9, "displayImageFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 1;
  v12 = container_system_group_path_for_identifier();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v12, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    free(v13);
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.DeviceAccess"), 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "URLByAppendingPathComponent:isDirectory:", CFSTR("AccessorySetup"), 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "URLByAppendingPathComponent:isDirectory:", CFSTR("DADevices"), 1);
  v15 = objc_claimAutoreleasedReturnValue();
  v92 = v11;
  objc_msgSend(v11, "lastPathComponent");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:");
  v16 = objc_claimAutoreleasedReturnValue();
  v91 = v14;
  v84 = (void *)v16;
  if (v16
    && (objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v16), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v17;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v17);
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v19;

    -[UIImageView setContentMode:](v10->_imageView, "setContentMode:", 1);
    -[UIImageView layer](v10->_imageView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsEdgeAntialiasing:", 1);

  }
  else
  {
    v22 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("dot.radiowaves.left.and.right"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithImage:", v23);
    v25 = v10->_imageView;
    v10->_imageView = (UIImageView *)v24;

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 100.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v10->_imageView, "setPreferredSymbolConfiguration:", v26);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10->_imageView, "setTintColor:", v18);
  }

  v27 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  displayNameLabel = v10->_displayNameLabel;
  v10->_displayNameLabel = v27;

  v29 = (void *)MEMORY[0x24BEBD5E0];
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pointSize");
  objc_msgSend(v29, "systemFontOfSize:weight:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10->_displayNameLabel, "setFont:", v31);

  objc_msgSend(v9, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10->_displayNameLabel, "setText:", v32);

  -[UILabel setTextAlignment:](v10->_displayNameLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v10->_displayNameLabel, "setNumberOfLines:", 1);
  v33 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  otaNameLabel = v10->_otaNameLabel;
  v10->_otaNameLabel = v33;

  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10->_otaNameLabel, "setFont:", v35);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10->_otaNameLabel, "setTextColor:", v36);

  objc_msgSend(v9, "bluetoothOTAName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v9, "bluetoothOTAName");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "SSID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_13;
    objc_msgSend(v9, "SSID");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v38;
  -[UILabel setText:](v10->_otaNameLabel, "setText:", v38);

LABEL_13:
  v93 = v9;
  -[UILabel setTextAlignment:](v10->_otaNameLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v10->_otaNameLabel, "setNumberOfLines:", 1);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v101[0] = v10->_imageView;
  v101[1] = v10->_displayNameLabel;
  v101[2] = v10->_otaNameLabel;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v95 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[ASAccessoryInfoHeaderView addSubview:](v10, "addSubview:", v46);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v43);
  }

  v72 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](v10->_imageView, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView topAnchor](v10, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v81;
  -[UIImageView centerXAnchor](v10->_imageView, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v78;
  -[UIImageView heightAnchor](v10->_imageView, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToConstant:", 100.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v76;
  -[UIImageView widthAnchor](v10->_imageView, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToConstant:", 180.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v74;
  -[UILabel topAnchor](v10->_displayNameLabel, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](v10->_imageView, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71, 8.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v70;
  -[UILabel centerXAnchor](v10->_displayNameLabel, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v100[5] = v67;
  -[UILabel leadingAnchor](v10->_displayNameLabel, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView leadingAnchor](v10, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:constant:", v65, v47);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v100[6] = v64;
  -[UILabel topAnchor](v10->_otaNameLabel, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v10->_displayNameLabel, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 0.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v100[7] = v61;
  -[UILabel centerXAnchor](v10->_otaNameLabel, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v100[8] = v49;
  -[UILabel leadingAnchor](v10->_otaNameLabel, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView leadingAnchor](v10, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v100[9] = v53;
  -[UILabel bottomAnchor](v10->_otaNameLabel, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView bottomAnchor](v10, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:constant:", v55, -v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v100[10] = v57;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 11);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "activateConstraints:", v58);

  return v10;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameLabel, a3);
}

- (UILabel)otaNameLabel
{
  return self->_otaNameLabel;
}

- (void)setOtaNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_otaNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaNameLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
