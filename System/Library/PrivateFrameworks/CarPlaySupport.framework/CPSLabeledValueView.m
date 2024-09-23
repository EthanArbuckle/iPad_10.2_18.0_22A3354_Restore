@implementation CPSLabeledValueView

- (CPSLabeledValueView)init
{
  double v2;
  CPSLabeledValueView *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
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
  objc_super v35;
  SEL v36;
  CPSLabeledValueView *v37;
  _QWORD v38[8];

  v38[7] = *MEMORY[0x24BDAC8D0];
  v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSLabeledValueView;
  v37 = -[CPSLabeledValueView init](&v35, sel_init);
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    -[CPSLabeledValueView setTranslatesAutoresizingMaskIntoConstraints:](v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v33 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v5 = v33;
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:");
    objc_msgSend(v5, "setFont:");

    objc_msgSend(v33, "setTextAlignment:");
    objc_msgSend(v33, "setTextColor:", v34);
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v37->_valueText, v33);
    -[CPSLabeledValueView addSubview:](v37, "addSubview:", v33);
    v32 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v7 = v32;
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7888]);
    objc_msgSend(v7, "setFont:");

    objc_msgSend(v32, "setTextAlignment:", 1);
    objc_msgSend(v32, "setTextColor:", v34);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v37->_label, v32);
    -[CPSLabeledValueView addSubview:](v37, "addSubview:", v32);
    v10 = (id)objc_msgSend(v32, "firstBaselineAnchor");
    v9 = (id)objc_msgSend(v33, "lastBaselineAnchor");
    v31 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", 14.0);

    LODWORD(v2) = 1148846080;
    objc_msgSend(v31, "setPriority:", v2);
    v11 = (void *)MEMORY[0x24BDD1628];
    v30 = (id)objc_msgSend(v33, "centerXAnchor");
    v29 = (id)-[CPSLabeledValueView centerXAnchor](v37, "centerXAnchor");
    v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v38[0] = v28;
    v27 = (id)objc_msgSend(v32, "centerXAnchor");
    v26 = (id)-[CPSLabeledValueView centerXAnchor](v37, "centerXAnchor");
    v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v38[1] = v25;
    v24 = (id)-[CPSLabeledValueView widthAnchor](v37, "widthAnchor");
    v23 = (id)objc_msgSend(v33, "widthAnchor");
    v22 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:");
    v38[2] = v22;
    v21 = (id)-[CPSLabeledValueView widthAnchor](v37, "widthAnchor");
    v20 = (id)objc_msgSend(v32, "widthAnchor");
    v19 = (id)objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:");
    v38[3] = v19;
    v38[4] = v31;
    v18 = (id)objc_msgSend(v33, "topAnchor");
    v17 = (id)-[CPSLabeledValueView topAnchor](v37, "topAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v38[5] = v16;
    v15 = (id)-[CPSLabeledValueView bottomAnchor](v37, "bottomAnchor");
    v14 = (id)objc_msgSend(v32, "bottomAnchor");
    v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v38[6] = v13;
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 7);
    objc_msgSend(v11, "activateConstraints:");

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  v4 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v4;
}

- (void)setTextColor:(id)a3
{
  UILabel *v3;
  UILabel *v4;
  id location[2];
  CPSLabeledValueView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSLabeledValueView valueText](v6, "valueText");
  -[UILabel setTextColor:](v3, "setTextColor:", location[0]);

  v4 = -[CPSLabeledValueView label](v6, "label");
  -[UILabel setTextColor:](v4, "setTextColor:", location[0]);

  objc_storeStrong(location, 0);
}

- (UILabel)valueText
{
  return self->_valueText;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
}

@end
