@implementation MCDNoContentView

- (MCDNoContentView)initWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MCDNoContentView *v8;

  MCDCarDisplayBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_CONTENT_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCDCarDisplayBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NO_CONTENT_SUBTITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCDNoContentView initWithTitle:subtitle:](self, "initWithTitle:subtitle:", v5, v7);

  return v8;
}

- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4
{
  return -[MCDNoContentView initWithTitle:subtitle:buttonText:](self, "initWithTitle:subtitle:buttonText:", a3, a4, 0);
}

- (MCDNoContentView)initWithTitle:(id)a3 subtitle:(id)a4 buttonText:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  MCDNoContentView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  MCDNoContentView *v56;
  void *v57;
  MCDNoContentView *v58;
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
  id v75;
  void *v76;
  id v77;
  id v78;
  objc_super v79;
  _QWORD v80[12];
  _QWORD v81[6];

  v81[4] = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  v77 = a4;
  v8 = a5;
  v79.receiver = self;
  v79.super_class = (Class)MCDNoContentView;
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v13 = -[MCDNoContentView initWithFrame:](&v79, sel_initWithFrame_, *MEMORY[0x24BDBF090], v10, v11, v12);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableBackgroundColor");
    v75 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDNoContentView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v9, v10, v11, v12);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v9, v10, v11, v12);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v9, v10, v11, v12);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "setHidden:", 1);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setText:", v78);
    objc_msgSend(v16, "setText:", v78);
    objc_msgSend(v16, "setText:", v77);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 28.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:");
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v18);

    objc_msgSend(v15, "setTextAlignment:", 1);
    objc_msgSend(v16, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v19);

    objc_msgSend(MEMORY[0x24BEBD4B8], "_carSystemSecondaryColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v20);

    objc_msgSend(v15, "setNumberOfLines:", 0);
    objc_msgSend(v16, "setNumberOfLines:", 0);
    -[MCDNoContentView addSubview:](v13, "addSubview:", v15);
    -[MCDNoContentView addSubview:](v13, "addSubview:", v16);
    -[MCDNoContentView addSubview:](v13, "addSubview:", v17);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 12, 0, v15, 11, 1.0, 28.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1148846080;
    v74 = v21;
    objc_msgSend(v21, "setPriority:", v22);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 2, 0, v17, 2, 1.0, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 1, 0, v17, 1, 1.0, 0.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 2, 0, v17, 2, 1.0, 0.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 1, 0, v17, 1, 1.0, 0.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v15;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, 0, v15, 3, 1.0, 0.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v16;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 0, v16, 4, 1.0, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD1628];
    -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 1, 0, v24, 1, 1.0, 12.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD1628];
    -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 2, 0, v26, 2, 1.0, -12.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDD1628];
    -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 10, 0, v28, 10, 1.0, -11.0);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x24BDD1628];
    -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, 1, v31, 3, 1.0, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BDD1628];
    -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, -1, v33, 4, 1.0, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0x24BDBC000uLL;
    if (v75)
    {
      v35 = (void *)objc_opt_new();
      objc_msgSend(v35, "titleLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _MCDNoContentFontWithTextStyle(*MEMORY[0x24BEBE1D8]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFont:", v37);

      objc_msgSend(v35, "setTitle:forState:", v75, 0);
      objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v35, "addTarget:action:forControlEvents:", v13, sel_buttonPressed_, 64);
      objc_msgSend(v35, "sizeToFit");
      -[MCDNoContentView addSubview:](v13, "addSubview:", v35);
      objc_msgSend(v35, "widthAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNoContentView widthAnchor](v13, "widthAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:multiplier:constant:", v39, 0.699999988, 0.0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "heightAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToConstant:", 40.0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "centerXAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "centerXAnchor");
      v43 = (void *)v29;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNoContentView safeAreaLayoutGuide](v13, "safeAreaLayoutGuide");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, -24.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v81[0] = v61;
      v81[1] = v60;
      v81[2] = v45;
      v81[3] = v49;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNoContentView addConstraints:](v13, "addConstraints:", v50);
      objc_msgSend(v35, "frame");
      v52 = v51;
      objc_msgSend(v43, "constant");
      v54 = v43;
      objc_msgSend(v43, "setConstant:", v53 - v52);
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, -1, v35, 3, 1.0, 0.0);
      v55 = objc_claimAutoreleasedReturnValue();

      v34 = 0x24BDBC000;
      v76 = (void *)v55;
      v56 = v13;
    }
    else
    {
      v56 = v13;
      v54 = (void *)v29;
    }
    v80[0] = v73;
    v80[1] = v72;
    v80[2] = v69;
    v80[3] = v68;
    v80[4] = v74;
    v80[5] = v76;
    v80[6] = v62;
    v80[7] = v71;
    v80[8] = v63;
    v80[9] = v54;
    v80[10] = v67;
    v80[11] = v65;
    objc_msgSend(*(id *)(v34 + 3632), "arrayWithObjects:count:", v80, 12, v60);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDNoContentView addConstraints:](v56, "addConstraints:", v57);
    v58 = v56;

    v8 = v75;
    v13 = v56;
  }

  return v13;
}

- (void)buttonPressed:(id)a3
{
  MCDNoContentViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "didTapButton:", self);

  }
}

- (MCDNoContentViewDelegate)delegate
{
  return (MCDNoContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
