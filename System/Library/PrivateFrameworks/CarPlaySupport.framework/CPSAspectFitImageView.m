@implementation CPSAspectFitImageView

- (CPSAspectFitImageView)init
{
  CPSAspectFitImageView *v3;
  objc_super v4;
  SEL v5;
  CPSAspectFitImageView *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CPSAspectFitImageView;
  v6 = -[CPSAspectFitImageView init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[CPSAspectFitImageView setContentMode:](v6, "setContentMode:", 1);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setImage:(id)a3
{
  objc_super v3;
  id location[2];
  CPSAspectFitImageView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSAspectFitImageView;
  -[CPSAspectFitImageView setImage:](&v3, sel_setImage_, location[0]);
  -[CPSAspectFitImageView _updateConstraints](v5, "_updateConstraints");
  objc_storeStrong(location, 0);
}

- (void)_updateConstraints
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  id v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *v24;
  id v25[8];
  char v26;
  id v27;
  uint64_t v28;
  double v29;
  char v30;
  id v31;
  SEL v32;
  CPSAspectFitImageView *v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32 = a2;
  v24 = -[CPSAspectFitImageView aspectConstraint](self, "aspectConstraint");

  if (v24)
  {
    v21 = (void *)MEMORY[0x24BDD1628];
    v23 = -[CPSAspectFitImageView aspectConstraint](v33, "aspectConstraint");
    v35[0] = v23;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    objc_msgSend(v21, "deactivateConstraints:");

    -[CPSAspectFitImageView setAspectConstraint:](v33, "setAspectConstraint:", 0);
  }
  v19 = (id)-[CPSAspectFitImageView image](v33, "image");
  v30 = 0;
  v26 = 0;
  v20 = 0;
  if (v19)
  {
    v31 = (id)-[CPSAspectFitImageView image](v33, "image");
    v30 = 1;
    objc_msgSend(v31, "size");
    v28 = v3;
    v29 = v2;
    v20 = 0;
    if (v2 > 0.0)
    {
      v27 = (id)-[CPSAspectFitImageView image](v33, "image", v2);
      v26 = 1;
      objc_msgSend(v27, "size");
      v25[6] = v4;
      v25[7] = v5;
      v20 = *(double *)&v4 > 0.0;
    }
  }
  if ((v26 & 1) != 0)

  if ((v30 & 1) != 0)
  if (v20)
  {
    v13 = (id)-[CPSAspectFitImageView image](v33, "image");
    objc_msgSend(v13, "size");
    v25[3] = v6;
    v25[4] = v7;
    v12 = *(double *)&v6;
    v11 = (id)-[CPSAspectFitImageView image](v33, "image");
    objc_msgSend(v11, "size");
    v25[1] = v8;
    v25[2] = v9;
    v14 = v12 / *(double *)&v9;

    v25[5] = *(id *)&v14;
    v16 = (id)-[CPSAspectFitImageView widthAnchor](v33, "widthAnchor");
    v15 = (id)-[CPSAspectFitImageView heightAnchor](v33, "heightAnchor");
    v25[0] = (id)objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v14);

    LODWORD(v10) = 1148846080;
    objc_msgSend(v25[0], "setPriority:", v10);
    v17 = (void *)MEMORY[0x24BDD1628];
    v34 = v25[0];
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    objc_msgSend(v17, "activateConstraints:");

    -[CPSAspectFitImageView setAspectConstraint:](v33, "setAspectConstraint:", v25[0]);
    objc_storeStrong(v25, 0);
  }
}

- (NSLayoutConstraint)aspectConstraint
{
  return self->_aspectConstraint;
}

- (void)setAspectConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_aspectConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectConstraint, 0);
}

@end
