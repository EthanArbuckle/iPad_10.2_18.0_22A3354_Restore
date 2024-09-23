@implementation PDFMarkupStyleView

- (PDFMarkupStyleView)initWithHandler:(id)a3
{
  PDFMarkupStyleView *v4;
  PDFMarkupStyleView *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PDFMarkupStyleView *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  objc_super v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PDFMarkupStyleView;
  v4 = -[PDFMarkupStyleView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v34 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    while (1)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", 0.0, 0.0, 33.0, 33.0);
      v9 = PDFMarkupMenuColorMenuIconForMarkupStyle(v7 - 1);
      v10 = v9;
      if ((unint64_t)(v7 - 1) >= 5)
      {
        if (v7 == 6)
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "largeUnderlinePot");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v7 != 7)
          {
            v13 = 0;
            goto LABEL_11;
          }
          objc_msgSend(MEMORY[0x24BDF6AC8], "largeStrikeOutPot");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v14;
      }
      else
      {
        v11 = (void *)MEMORY[0x24BDF6AC8];
        PDFMarkupMenuColorForMenuIcon(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "largeColorPotForColor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_11:
      objc_msgSend(v8, "setImage:forState:", v13, 0);
      PDFMarkupMenuString(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v15);

      v16 = (void *)MEMORY[0x24BDF67B8];
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __38__PDFMarkupStyleView_initWithHandler___block_invoke;
      v36[3] = &unk_24C25CAD8;
      v37 = v35;
      v38 = v7 - 1;
      objc_msgSend(v16, "actionWithHandler:", v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:forControlEvents:", v17, 64);
      objc_msgSend(v8, "setTag:", v7);
      objc_msgSend(v6, "addObject:", v8);

      if (++v7 == 8)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v6);
        objc_msgSend(v18, "setAxis:", 0);
        objc_msgSend(v18, "setAlignment:", 3);
        objc_msgSend(v18, "setDistribution:", 3);
        objc_msgSend(v18, "setSpacing:", 1.0);
        objc_msgSend(v18, "setLayoutMargins:", 0.0, 4.0, 0.0, 4.0);
        objc_msgSend(v18, "setLayoutMarginsRelativeArrangement:", 1);
        v5 = v34;
        -[PDFMarkupStyleView addSubview:](v34, "addSubview:", v18);
        objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v28 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(v18, "leadingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFMarkupStyleView leadingAnchor](v34, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintEqualToAnchor:", v32);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v31;
        objc_msgSend(v18, "trailingAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFMarkupStyleView trailingAnchor](v34, "trailingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:", v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v27;
        objc_msgSend(v18, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFMarkupStyleView topAnchor](v34, "topAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40[2] = v21;
        objc_msgSend(v18, "bottomAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFMarkupStyleView bottomAnchor](v34, "bottomAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40[3] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "activateConstraints:", v25);

        break;
      }
    }
  }

  return v5;
}

uint64_t __38__PDFMarkupStyleView_initWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
