@implementation CPSRatingView

- (CPSRatingView)initWithInformationItem:(id)a3 layout:(int64_t)a4
{
  CPSRatingView *v4;
  id v5;
  uint64_t v6;
  UIStackView *stackView;
  float v8;
  float v9;
  id v10;
  id v11;
  id v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CPSRatingView *v19;
  id v20;
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
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  BOOL v38;
  id v39;
  id v40;
  uint64_t v41;
  id v43;
  id v44;
  uint64_t i;
  uint64_t v46;
  id v47;
  BOOL v48;
  objc_super v49;
  int64_t v50;
  id location[2];
  CPSRatingView *v52;
  _QWORD v53[5];

  v53[4] = *MEMORY[0x24BDAC8D0];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = a4;
  v4 = v52;
  v52 = 0;
  v49.receiver = v4;
  v49.super_class = (Class)CPSRatingView;
  v52 = -[CPSRatingView initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    v48 = v50 == 1;
    v5 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    stackView = v52->_stackView;
    v52->_stackView = (UIStackView *)v6;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v52->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v52->_stackView, "setAlignment:", 1);
    -[UIStackView setDistribution:](v52->_stackView, "setDistribution:");
    -[UIStackView setAxis:](v52->_stackView, "setAxis:", 0);
    v39 = (id)-[CPSRatingView traitCollection](v52, "traitCollection");
    v47 = (id)CPUIImageStarRatingEmpty();

    v40 = (id)objc_msgSend(location[0], "rating");
    objc_msgSend(v40, "floatValue");
    v41 = (uint64_t)(float)(v8 * 2.0);

    v46 = v41;
    for (i = 0; ; ++i)
    {
      v36 = i;
      v37 = (id)objc_msgSend(location[0], "maximumRating");
      objc_msgSend(v37, "floatValue");
      v38 = v36 >= (uint64_t)(float)(v9 * 2.0);

      if (v38)
        break;
      if (i % 2 == 1)
      {
        if (i < v46)
        {
          v35 = (id)-[CPSRatingView traitCollection](v52, "traitCollection");
          v10 = (id)CPUIImageStarRatingFull();
          v11 = v47;
          v47 = v10;

        }
        v12 = objc_alloc(MEMORY[0x24BDF6AE8]);
        v44 = (id)objc_msgSend(v12, "initWithImage:", v47);
        objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 0);
        LODWORD(v13) = 1148846080;
        objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 1, v13);
        v33 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
        objc_msgSend(v44, "setTintColor:");

        -[UIStackView addArrangedSubview:](v52->_stackView, "addArrangedSubview:", v44);
        v34 = (id)-[CPSRatingView traitCollection](v52, "traitCollection");
        v14 = (id)CPUIImageStarRatingEmpty();
        v15 = v47;
        v47 = v14;

        objc_storeStrong(&v44, 0);
      }
      else if (i < v46)
      {
        v32 = (id)-[CPSRatingView traitCollection](v52, "traitCollection");
        v16 = (id)CPUIImageStarRatingHalf();
        v17 = v47;
        v47 = v16;

      }
    }
    -[CPSRatingView addSubview:](v52, "addSubview:", v52->_stackView);
    v31 = (id)-[UIStackView leadingAnchor](v52->_stackView, "leadingAnchor");
    v30 = (id)-[CPSRatingView leadingAnchor](v52, "leadingAnchor");
    v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v53[0] = v29;
    v28 = (id)-[UIStackView topAnchor](v52->_stackView, "topAnchor");
    v27 = (id)-[CPSRatingView topAnchor](v52, "topAnchor");
    v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v53[1] = v26;
    v25 = (id)-[UIStackView centerYAnchor](v52->_stackView, "centerYAnchor");
    v24 = (id)-[CPSRatingView centerYAnchor](v52, "centerYAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v53[2] = v23;
    v22 = (id)-[CPSRatingView widthAnchor](v52, "widthAnchor");
    v21 = (id)-[UIStackView widthAnchor](v52->_stackView, "widthAnchor");
    v20 = (id)objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:");
    v53[3] = v20;
    v43 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v43);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v47, 0);
  }
  v19 = v52;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v52, 0);
  return v19;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIStackView *v6;
  double v7;
  double v8;
  CGSize result;

  v6 = -[CPSRatingView stackView](self, "stackView");
  -[UIStackView frame](v6, "frame");
  v7 = v2;
  v8 = v3;

  v5 = v8;
  v4 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
