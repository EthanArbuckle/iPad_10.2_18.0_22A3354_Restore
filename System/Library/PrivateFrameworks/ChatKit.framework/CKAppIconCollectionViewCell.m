@implementation CKAppIconCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKAppIconCollectionViewCell_reuseIdentifier");
}

- (void)configureWithAppName:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CKAppIconView *v19;
  int64_t v20;
  CKAppIconView *v21;
  void *v22;
  id v23;

  -[CKAppIconCollectionViewCell setAppName:](self, "setAppName:");
  if ((unint64_t)a3 > 5)
  {
    v23 = 0;
  }
  else
  {
    -[CKAppIconCollectionViewCell appIconForBundleID:](self, "appIconForBundleID:", off_1E2758FC8[a3]);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v23);
  -[CKAppIconCollectionViewCell setAppIconView:](self, "setAppIconView:", v5);

  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1050253722;
  objc_msgSend(v11, "setShadowOpacity:", v12);

  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowRadius:", 4.0);

  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowOffset:", 0.0, 1.0);

  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v19 = [CKAppIconView alloc];
  v20 = -[CKAppIconCollectionViewCell appName](self, "appName");
  v21 = -[CKAppIconView initWithFrame:withAppName:](v19, "initWithFrame:withAppName:", v20, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKAppIconView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKAppIconView setSemanticContentAttribute:](v21, "setSemanticContentAttribute:", 3);
  -[CKAppIconCollectionViewCell setAppContentView:](self, "setAppContentView:", v21);
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

  -[CKAppIconCollectionViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v21);
  -[CKAppIconCollectionViewCell setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

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
  CKAppIconCollectionViewCell *v18;
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
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
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
  CKAppIconCollectionViewCell *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[8];

  v75[6] = *MEMORY[0x1E0C80C00];
  -[CKAppIconCollectionViewCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconCollectionViewCell constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell setConstraints:](self, "setConstraints:", v7);

  -[CKAppIconCollectionViewCell constraints](self, "constraints");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v57;
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v52;
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v47;
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v42;
  -[CKAppIconCollectionViewCell appContentView](self, "appContentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v11;
  -[CKAppIconCollectionViewCell appContentView](self, "appContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppIconCollectionViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v65 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v17);

  v18 = v65;
  switch(-[CKAppIconCollectionViewCell appName](v65, "appName"))
  {
    case 0:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "centerXAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v20;
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v74;
      goto LABEL_10;
    case 1:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "centerXAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v31;
      objc_msgSend(v31, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v73;
      goto LABEL_10;
    case 2:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v32;
      objc_msgSend(v32, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v72;
      goto LABEL_10;
    case 3:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v33;
      objc_msgSend(v33, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v71;
      goto LABEL_10;
    case 4:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v34;
      objc_msgSend(v34, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v70;
      goto LABEL_10;
    case 5:
      -[CKAppIconCollectionViewCell constraints](v65, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contactItemView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v35;
      objc_msgSend(v35, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v22;
      -[CKAppIconCollectionViewCell appContentView](v65, "appContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactItemView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAppIconCollectionViewCell appIconView](v65, "appIconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v28;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = v69;
LABEL_10:
      objc_msgSend(v29, "arrayWithObjects:count:", v30, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v36);

      v18 = v65;
      break;
    default:
      break;
  }
  -[CKAppIconCollectionViewCell constraints](v18, "constraints");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconCollectionViewCell constraints](v18, "constraints");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v40);

  }
  v68.receiver = v18;
  v68.super_class = (Class)CKAppIconCollectionViewCell;
  -[CKAppIconCollectionViewCell updateConstraints](&v68, sel_updateConstraints);
}

- (id)appIconForBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CEA950];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 60.0, 60.0, v7);
  v10 = (id)objc_msgSend(v8, "prepareImageForDescriptor:", v9);
  objc_msgSend(v8, "imageForDescriptor:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(v11, "CGImage"), 0, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKAppIconCollectionViewCell;
  -[CKAppIconCollectionViewCell prepareForReuse](&v9, sel_prepareForReuse);
  -[CKAppIconCollectionViewCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[CKAppIconCollectionViewCell constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  -[CKAppIconCollectionViewCell appIconView](self, "appIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[CKAppIconCollectionViewCell appContentView](self, "appContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[CKAppIconCollectionViewCell setAppIconView:](self, "setAppIconView:", 0);
  -[CKAppIconCollectionViewCell setAppContentView:](self, "setAppContentView:", 0);
  -[CKAppIconCollectionViewCell setAppName:](self, "setAppName:", -1);
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (CKAppIconView)appContentView
{
  return self->_appContentView;
}

- (void)setAppContentView:(id)a3
{
  objc_storeStrong((id *)&self->_appContentView, a3);
}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (void)setAppIconView:(id)a3
{
  objc_storeStrong((id *)&self->_appIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_appContentView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
