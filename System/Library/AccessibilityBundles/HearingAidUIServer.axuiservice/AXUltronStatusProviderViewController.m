@implementation AXUltronStatusProviderViewController

- (void)viewDidLoad
{
  id v3;
  AXDispatchTimer *v4;
  AXDispatchTimer *clearTimer;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UILabel *v40;
  UILabel *listenType;
  void *v42;
  UILabel *v43;
  void *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UILabel *v52;
  UILabel *confidence;
  void *v54;
  UILabel *v55;
  void *v56;
  void *v57;
  UILabel *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)AXUltronStatusProviderViewController;
  -[AXUltronStatusProviderViewController viewDidLoad](&v68, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BE005F0]);
  v4 = (AXDispatchTimer *)objc_msgSend(v3, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
  clearTimer = self->_clearTimer;
  self->_clearTimer = v4;

  v6 = objc_alloc(MEMORY[0x24BDF6F90]);
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AXUltronStatusProviderViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  -[AXUltronStatusProviderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD1628];
  -[AXUltronStatusProviderViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 7, 0, v15, 7, 0.25, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v16);

  -[AXUltronStatusProviderViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 8, 0, 0, 0, 1.0, 40.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraint:", v18);

  -[AXUltronStatusProviderViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD1628];
  -[AXUltronStatusProviderViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, 0, v21, 6, 1.0, -10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v22);

  -[AXUltronStatusProviderViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD1628];
  -[AXUltronStatusProviderViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 3, 0, v25, 3, 1.0, 10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraint:", v26);

  objc_msgSend(v11, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCornerRadius:", 8.0);

  objc_msgSend(v11, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBorderWidth:", 3.0);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colorWithAlphaComponent:", 1.0);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  objc_msgSend(v11, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBorderColor:", v31);

  objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "colorWithAlphaComponent:", 0.85);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v34);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v7, v8, v9, v10);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", v35);
  -[AXUltronStatusProviderViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 7, 0, v11, 7, 1.0, -20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addConstraint:", v37);

  -[AXUltronStatusProviderViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 10, 0, v11, 10, 1.0, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addConstraint:", v39);

  v40 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  listenType = self->_listenType;
  self->_listenType = v40;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7808], 32770, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = self->_listenType;
  v44 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v42, "pointSize");
  objc_msgSend(v44, "fontWithDescriptor:size:", v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v43, "setFont:", v45);

  v46 = self->_listenType;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v46, "setTextColor:", v47);

  -[UILabel setTextAlignment:](self->_listenType, "setTextAlignment:", 0);
  -[UILabel setText:](self->_listenType, "setText:", CFSTR("Sound Detections"));
  -[UILabel setClipsToBounds:](self->_listenType, "setClipsToBounds:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_listenType, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v35, "addSubview:", self->_listenType);
  -[AXUltronStatusProviderViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_listenType, 5, 0, v35, 5, 1.0, 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addConstraint:", v49);

  -[AXUltronStatusProviderViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_listenType, 10, 0, v35, 10, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addConstraint:", v51);

  v52 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  confidence = self->_confidence;
  self->_confidence = v52;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7850], 0x8000, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = self->_confidence;
  v56 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v54, "pointSize");
  objc_msgSend(v56, "fontWithDescriptor:size:", v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v55, "setFont:", v57);

  v58 = self->_confidence;
  objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v58, "setTextColor:", v59);

  -[UILabel setTextAlignment:](self->_confidence, "setTextAlignment:", 0);
  -[UILabel setClipsToBounds:](self->_confidence, "setClipsToBounds:", 0);
  -[UILabel setNumberOfLines:](self->_confidence, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_confidence, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v35, "addSubview:", self->_confidence);
  -[AXUltronStatusProviderViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_confidence, 5, 0, self->_listenType, 6, 1.0, 5.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addConstraint:", v61);

  -[AXUltronStatusProviderViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_confidence, 10, 0, v35, 10, 1.0, 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addConstraint:", v63);

  -[AXUltronStatusProviderViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 8, 1, self->_listenType, 8, 1.0, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addConstraint:", v65);

  -[AXUltronStatusProviderViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 8, 1, self->_confidence, 8, 1.0, 0.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addConstraint:", v67);

}

- (void)updateDisplay:(id)a3 confidence:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  AXDispatchTimer *clearTimer;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  AXUltronStatusProviderViewController *v14;
  double v15;

  v6 = a3;
  -[AXDispatchTimer cancel](self->_clearTimer, "cancel");
  v7 = (void *)MEMORY[0x24BDF6F90];
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke;
  v12[3] = &unk_24FEF0C88;
  v13 = v6;
  v14 = self;
  v15 = a4;
  v9 = v6;
  objc_msgSend(v7, "animateWithDuration:animations:", v12, 0.2);
  clearTimer = self->_clearTimer;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_2;
  v11[3] = &unk_24FEF0C60;
  v11[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](clearTimer, "afterDelay:processBlock:", v11, 5.0);

}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDFF200]))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    v3 = CFSTR("Baby Crying");
LABEL_5:
    objc_msgSend(v2, "setText:", v3);
    goto LABEL_6;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDFF250]) & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    v3 = CFSTR("Shouting");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "sizeToFit");
  AXFormatFloatWithPercentage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "setText:", v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "sizeToFit");
}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_3;
  v2[3] = &unk_24FEF0C60;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.2);
}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setText:", CFSTR("Listening"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "sizeToFit");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setText:", &stru_24FEF0E50);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearTimer, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_listenType, 0);
}

@end
