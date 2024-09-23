@implementation CPSHairlineBorderedView

- (CPSHairlineBorderedView)initWithContentView:(id)a3 borderEdges:(unint64_t)a4
{
  CPSHairlineBorderedView *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *bottomConstraint;
  CPSHairlineBorderedView *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  unint64_t v52;
  id location[2];
  CPSHairlineBorderedView *v54;
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[4];

  v57[3] = *MEMORY[0x24BDAC8D0];
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = a4;
  v4 = v54;
  v54 = 0;
  v51.receiver = v4;
  v51.super_class = (Class)CPSHairlineBorderedView;
  v54 = -[CPSHairlineBorderedView init](&v51, sel_init);
  objc_storeStrong((id *)&v54, v54);
  if (v54)
  {
    -[CPSHairlineBorderedView setTranslatesAutoresizingMaskIntoConstraints:](v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v50 = (id)-[CPSHairlineBorderedView topAnchor](v54, "topAnchor");
    if ((v52 & 1) != 0)
    {
      v49 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
      -[CPSHairlineBorderedView addSubview:](v54, "addSubview:", v49);
      v37 = (void *)MEMORY[0x24BDD1628];
      v46 = (id)objc_msgSend(v49, "leadingAnchor");
      v45 = (id)-[CPSHairlineBorderedView leadingAnchor](v54, "leadingAnchor");
      v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
      v57[0] = v44;
      v43 = (id)objc_msgSend(v49, "trailingAnchor");
      v42 = (id)-[CPSHairlineBorderedView trailingAnchor](v54, "trailingAnchor");
      v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
      v57[1] = v41;
      v40 = (id)objc_msgSend(v49, "topAnchor");
      v39 = (id)objc_msgSend(v40, "constraintEqualToAnchor:", v50);
      v57[2] = v39;
      v38 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
      objc_msgSend(v37, "activateConstraints:");

      v5 = (id)objc_msgSend(v49, "bottomAnchor");
      v6 = v50;
      v50 = v5;

      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong((id *)&v54->_contentView, location[0]);
    -[CPSHairlineBorderedView addSubview:](v54, "addSubview:", location[0]);
    v27 = (void *)MEMORY[0x24BDD1628];
    v36 = (id)objc_msgSend(location[0], "leadingAnchor");
    v35 = (id)-[CPSHairlineBorderedView leadingAnchor](v54, "leadingAnchor");
    v34 = (id)objc_msgSend(v36, "constraintEqualToAnchor:");
    v56[0] = v34;
    v33 = (id)objc_msgSend(location[0], "trailingAnchor");
    v32 = (id)-[CPSHairlineBorderedView trailingAnchor](v54, "trailingAnchor");
    v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v56[1] = v31;
    v30 = (id)objc_msgSend(location[0], "topAnchor");
    v29 = (id)objc_msgSend(v30, "constraintEqualToAnchor:", v50);
    v56[2] = v29;
    v28 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
    objc_msgSend(v27, "activateConstraints:");

    v7 = (id)objc_msgSend(location[0], "bottomAnchor");
    v8 = v50;
    v50 = v7;

    if ((v52 & 4) != 0)
    {
      v48 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
      -[CPSHairlineBorderedView addSubview:](v54, "addSubview:", v48);
      v17 = (void *)MEMORY[0x24BDD1628];
      v26 = (id)objc_msgSend(v48, "leadingAnchor");
      v25 = (id)-[CPSHairlineBorderedView leadingAnchor](v54, "leadingAnchor");
      v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
      v55[0] = v24;
      v23 = (id)objc_msgSend(v48, "trailingAnchor");
      v22 = (id)-[CPSHairlineBorderedView trailingAnchor](v54, "trailingAnchor");
      v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
      v55[1] = v21;
      v20 = (id)objc_msgSend(v48, "topAnchor");
      v19 = (id)objc_msgSend(v20, "constraintEqualToAnchor:", v50);
      v55[2] = v19;
      v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 3);
      objc_msgSend(v17, "activateConstraints:");

      v9 = (id)objc_msgSend(v48, "bottomAnchor");
      v10 = v50;
      v50 = v9;

      objc_storeStrong(&v48, 0);
    }
    v15 = v50;
    v16 = (id)-[CPSHairlineBorderedView bottomAnchor](v54, "bottomAnchor");
    v11 = (NSLayoutConstraint *)(id)objc_msgSend(v15, "constraintEqualToAnchor:");
    bottomConstraint = v54->_bottomConstraint;
    v54->_bottomConstraint = v11;

    -[CPSHairlineBorderedView addConstraint:](v54, "addConstraint:", v54->_bottomConstraint);
    objc_storeStrong(&v50, 0);
  }
  v14 = v54;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v54, 0);
  return v14;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
