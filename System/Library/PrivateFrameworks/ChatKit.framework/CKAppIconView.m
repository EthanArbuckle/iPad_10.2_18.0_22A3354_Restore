@implementation CKAppIconView

- (CKAppIconView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4
{
  CKAppIconView *v5;
  CKAppIconView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAppIconView;
  v5 = -[CKAppIconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKAppIconView setAppName:](v5, "setAppName:", a4);
    -[CKAppIconView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKAppIconView setUpSubviews](v6, "setUpSubviews");
  }
  return v6;
}

- (void)setUpSubviews
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  CKAppIconLinkView *v11;
  int64_t v12;
  CKAppIconLinkView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  switch(-[CKAppIconView appName](self, "appName"))
  {
    case 0:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("Syndication_Avatar1");
      goto LABEL_7;
    case 1:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("Syndication_Avatar2");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("HighlightPhotos"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Syndication_Avatar3"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
      -[CKAppIconView setActivityItemView:](self, "setActivityItemView:", v7);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v6);
      -[CKAppIconView setContactItemView:](self, "setContactItemView:", v8);

      goto LABEL_11;
    case 3:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = CFSTR("Syndication_Avatar4");
      goto LABEL_9;
    case 4:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("Syndication_Avatar5");
LABEL_7:
      objc_msgSend(v3, "ckImageNamed:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [CKAppIconLinkView alloc];
      v12 = -[CKAppIconView appName](self, "appName");
      v13 = -[CKAppIconLinkView initWithFrame:withAppName:](v11, "initWithFrame:withAppName:", v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKAppIconView setActivityItemView:](self, "setActivityItemView:", v13);

      goto LABEL_10;
    case 5:
      v9 = (void *)MEMORY[0x1E0CEA638];
      v10 = CFSTR("Syndication_Avatar6");
LABEL_9:
      objc_msgSend(v9, "ckImageNamed:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView setActivityItemView:](self, "setActivityItemView:", 0);
LABEL_10:
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
      -[CKAppIconView setContactItemView:](self, "setContactItemView:", v6);
LABEL_11:

      break;
    default:
      break;
  }
  -[CKAppIconView activityItemView](self, "activityItemView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CKAppIconView activityItemView](self, "activityItemView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppIconView addSubview:](self, "addSubview:", v15);

    -[CKAppIconView activityItemView](self, "activityItemView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  -[CKAppIconView contactItemView](self, "contactItemView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconView addSubview:](self, "addSubview:", v17);

  -[CKAppIconView contactItemView](self, "contactItemView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  _QWORD *v18;
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
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
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
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
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
  objc_super v84;
  _QWORD v85[4];
  _QWORD v86[8];
  _QWORD v87[4];
  _QWORD v88[8];
  _QWORD v89[8];
  _QWORD v90[10];

  v90[8] = *MEMORY[0x1E0C80C00];
  -[CKAppIconView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconView setConstraints:](self, "setConstraints:", v7);

  switch(-[CKAppIconView appName](self, "appName"))
  {
    case 0:
      -[CKAppIconView constraints](self, "constraints");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView activityItemView](self, "activityItemView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "widthAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v67, 2.8);
      v65 = objc_claimAutoreleasedReturnValue();
      v90[0] = v65;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "heightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:multiplier:", v63, 0.98);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v62 = objc_claimAutoreleasedReturnValue();
      v81 = v8;
      objc_msgSend(v8, "constraintEqualToAnchor:multiplier:", v62, 0.35);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v90[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "heightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v9;
      objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", 0.35);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v90[3] = v76;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView leadingAnchor](self, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v90[4] = v59;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "bottomAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView bottomAnchor](self, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v90[5] = v55;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v90[6] = v11;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -3.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v90[7] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v90;
      goto LABEL_9;
    case 1:
      -[CKAppIconView constraints](self, "constraints");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView activityItemView](self, "activityItemView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "widthAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v67, 2.17);
      v65 = objc_claimAutoreleasedReturnValue();
      v89[0] = v65;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "heightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:multiplier:", v63, 0.98);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v62 = objc_claimAutoreleasedReturnValue();
      v81 = v19;
      objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v62, 0.35);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "heightAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v20;
      objc_msgSend(v20, "constraintEqualToAnchor:multiplier:", 0.35);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v89[3] = v76;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView leadingAnchor](self, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v89[4] = v59;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "bottomAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView bottomAnchor](self, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v89[5] = v55;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "trailingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v89[6] = v11;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 5.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v89[7] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v89;
      goto LABEL_9;
    case 2:
      -[CKAppIconView constraints](self, "constraints");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView activityItemView](self, "activityItemView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "widthAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v68, 2.45);
      v66 = objc_claimAutoreleasedReturnValue();
      v88[0] = v66;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "heightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:multiplier:", v63, 2.1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v88[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v62 = objc_claimAutoreleasedReturnValue();
      v81 = v21;
      objc_msgSend(v21, "constraintEqualToAnchor:multiplier:", v62, 0.35);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v88[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "heightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v22;
      objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", 0.35);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v88[3] = v76;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView bottomAnchor](self, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v88[4] = v59;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView trailingAnchor](self, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v88[5] = v55;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "trailingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:constant:", v10, 30.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v88[6] = v11;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v23, -25.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v88[7] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v73;
      objc_msgSend(v73, "addObjectsFromArray:", v25);

      v27 = (void *)v66;
      v28 = (void *)v68;

      goto LABEL_10;
    case 3:
      -[CKAppIconView constraints](self, "constraints");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "widthAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v28, 0.35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v27;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "heightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v33, 0.35);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "centerXAnchor");
      v34 = objc_claimAutoreleasedReturnValue();
      -[CKAppIconView centerXAnchor](self, "centerXAnchor");
      v35 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v34;
      v36 = (void *)v34;
      v37 = (void *)v35;
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v87[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "centerYAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView centerYAnchor](self, "centerYAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v38;
      objc_msgSend(v38, "constraintEqualToAnchor:");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v87[3] = v76;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v87;
      goto LABEL_12;
    case 4:
      -[CKAppIconView constraints](self, "constraints");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView activityItemView](self, "activityItemView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "widthAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:multiplier:", v67, 2.345);
      v65 = objc_claimAutoreleasedReturnValue();
      v86[0] = v65;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "heightAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:multiplier:", v63, 0.98);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "widthAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v62 = objc_claimAutoreleasedReturnValue();
      v81 = v41;
      objc_msgSend(v41, "constraintEqualToAnchor:multiplier:", v62, 0.35);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v86[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "heightAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v42;
      objc_msgSend(v42, "constraintEqualToAnchor:multiplier:", 0.35);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v86[3] = v76;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView leadingAnchor](self, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v60);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v86[4] = v59;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "topAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView topAnchor](self, "topAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v86[5] = v55;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v86[6] = v11;
      -[CKAppIconView activityItemView](self, "activityItemView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 3.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v86[7] = v16;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = v86;
LABEL_9:
      objc_msgSend(v17, "arrayWithObjects:count:", v18, 8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v72;
      objc_msgSend(v72, "addObjectsFromArray:", v43);

      v27 = (void *)v65;
      v28 = (void *)v67;
LABEL_10:

      v33 = (void *)v63;
      v30 = v70;

      v32 = v64;
      v29 = v71;

      v31 = v69;
      v37 = (void *)v62;

      goto LABEL_13;
    case 5:
      -[CKAppIconView constraints](self, "constraints");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView contactItemView](self, "contactItemView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "widthAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v28, 0.35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v27;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "heightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView heightAnchor](self, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v33, 0.35);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v83;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "centerXAnchor");
      v44 = objc_claimAutoreleasedReturnValue();
      -[CKAppIconView centerXAnchor](self, "centerXAnchor");
      v45 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v44;
      v46 = (void *)v44;
      v37 = (void *)v45;
      objc_msgSend(v46, "constraintEqualToAnchor:", v45);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v80;
      -[CKAppIconView contactItemView](self, "contactItemView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "centerYAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconView centerYAnchor](self, "centerYAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v47;
      objc_msgSend(v47, "constraintEqualToAnchor:");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v76;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v85;
LABEL_12:
      objc_msgSend(v39, "arrayWithObjects:count:", v40, 4);
      v26 = v74;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addObjectsFromArray:");
LABEL_13:

      break;
    default:
      break;
  }
  -[CKAppIconView constraints](self, "constraints");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  if (v49)
  {
    v50 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconView constraints](self, "constraints");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v51);

  }
  v84.receiver = self;
  v84.super_class = (Class)CKAppIconView;
  -[CKAppIconView updateConstraints](&v84, sel_updateConstraints);
}

- (UIView)contactItemView
{
  return self->_contactItemView;
}

- (void)setContactItemView:(id)a3
{
  objc_storeStrong((id *)&self->_contactItemView, a3);
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (UIView)activityItemView
{
  return self->_activityItemView;
}

- (void)setActivityItemView:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_activityItemView, 0);
  objc_storeStrong((id *)&self->_contactItemView, 0);
}

@end
