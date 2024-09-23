@implementation AIAudiogramLoadingViewController

- (AIAudiogramLoadingViewController)initWithTitle:(id)a3 style:(int64_t)a4
{
  AIAudiogramLoadingViewController *v5;
  AIAudiogramLoadingViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AIAudiogramLoadingViewController;
  v5 = -[AIAudiogramLoadingViewController initWithTitle:detailText:icon:](&v8, sel_initWithTitle_detailText_icon_, a3, 0, 0);
  v6 = v5;
  if (v5)
    -[AIAudiogramLoadingViewController setStyle:](v5, "setStyle:", a4);
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  objc_super v80;
  _QWORD v81[11];

  v81[9] = *MEMORY[0x24BDAC8D0];
  v80.receiver = self;
  v80.super_class = (Class)AIAudiogramLoadingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v80, sel_viewDidLoad);
  -[AIAudiogramLoadingViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1036831949;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD8A0]), "initWithProgressViewStyle:", 0);
  -[AIAudiogramLoadingViewController setProgressView:](self, "setProgressView:", v5);

  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setProgress:", v8);

  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", -[AIAudiogramLoadingViewController style](self, "style") != 0);

  -[AIAudiogramLoadingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
  -[AIAudiogramLoadingViewController setActivityIndicator:](self, "setActivityIndicator:", v12);

  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", -[AIAudiogramLoadingViewController style](self, "style") != 1);

  v15 = -[AIAudiogramLoadingViewController style](self, "style");
  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 == 1)
    objc_msgSend(v16, "startAnimating");
  else
    objc_msgSend(v16, "stopAnimating");

  -[AIAudiogramLoadingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_opt_new();
  -[AIAudiogramLoadingViewController setProgressLabel:](self, "setProgressLabel:", v20);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextAlignment:", 1);

  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (!-[AIAudiogramLoadingViewController style](self, "style"))
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    aiLocString(CFSTR("AudiogramIngestionLoadingProgress"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v27, CFSTR("0"), CFSTR("%"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v28);

    goto LABEL_8;
  }
  if (-[AIAudiogramLoadingViewController style](self, "style") == 1)
  {
    aiLocString(CFSTR("AudiogramIngestionLoadingTitle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v25);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v27);
LABEL_8:

  }
  -[AIAudiogramLoadingViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  v60 = (void *)MEMORY[0x24BDD1628];
  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "centerYAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v75;
  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "centerXAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v70;
  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:multiplier:", v66, 0.8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v65;
  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v59;
  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v81[4] = v54;
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController activityIndicator](self, "activityIndicator");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 20.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v81[5] = v49;
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 20.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v81[6] = v44;
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:multiplier:", v35, 0.8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v81[7] = v36;
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81[8] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "activateConstraints:", v42);

}

- (void)setProgress:(float)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionLoadingProgress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)(a3 * 100.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7, CFSTR("%"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[AIAudiogramLoadingViewController progressView](self, "progressView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  objc_msgSend(v11, "setProgress:animated:", 1, v10);

}

- (void)showLoadingMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramLoadingViewController progressLabel](self, "progressLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (float)progress
{
  return self->_progress;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_progressLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
