@implementation MCLVariantGroupView

- (MCLVariantGroupView)initWithFrame:(CGRect)a3
{
  objc_class *v3;
  Class buttonClass;
  NSMutableArray *v5;
  NSMutableArray *buttons;
  NSMutableArray *v7;
  NSMutableArray *buttonConstraints;
  MCLVariantGroupView *v10;
  objc_super v11;
  SEL v12;
  MCLVariantGroupView *v13;
  CGRect v14;

  v14 = a3;
  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)MCLVariantGroupView;
  v13 = -[MCLVariantGroupView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v3 = (objc_class *)(id)objc_opt_class();
    buttonClass = v13->_buttonClass;
    v13->_buttonClass = v3;

    v13->_buttonType = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    buttons = v13->_buttons;
    v13->_buttons = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    buttonConstraints = v13->_buttonConstraints;
    v13->_buttonConstraints = v7;

    v13->_selectedIndex = -1;
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (void)reloadData
{
  unint64_t v2;
  double v3;
  double v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  NSMutableArray *buttonConstraints;
  id v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  id v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  id v24;
  NSMutableArray *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSMutableArray *v30;
  id v31;
  id v32;
  id v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  id v37;
  NSMutableArray *v38;
  id v39;
  id v40;
  id v41;
  NSMutableArray *v42;
  id v43;
  id v44;
  id v45;
  MCLVariantGroupView *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t i;
  id v52;
  double v53;
  double v54;
  id v55[2];
  MCLVariantGroupView *v56;
  _QWORD v57[3];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v56 = self;
  v55[1] = (id)a2;
  if ((-[objc_class isSubclassOfClass:](self->_buttonClass, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    && v56->_variantCount > 0
    && v56->_variantsPerLine > 0)
  {
    if (-[NSMutableArray count](v56->_buttons, "count"))
      -[MCLVariantGroupView clearVariants](v56, "clearVariants");
    v55[0] = 0;
    v54 = 0.0;
    v54 = (float)(1.0 / (float)v56->_variantsPerLine);
    v53 = 0.0;
    v53 = 8.0 * (double)(v56->_variantsPerLine - 1) / (double)v56->_variantsPerLine;
    while ((unint64_t)-[NSMutableArray count](v56->_buttons, "count") > v56->_variantCount)
      -[NSMutableArray removeLastObject](v56->_buttons, "removeLastObject");
    while (1)
    {
      v2 = -[NSMutableArray count](v56->_buttons, "count");
      if (v2 >= v56->_variantCount)
        break;
      v52 = -[MCLVariantGroupView createVariantButton:type:](v56, "createVariantButton:type:", v56->_buttonClass, v56->_buttonType);
      LODWORD(v3) = 1148846080;
      objc_msgSend(v52, "setContentCompressionResistancePriority:forAxis:", 1, v3);
      -[NSMutableArray addObject:](v56->_buttons, "addObject:", v52);
      objc_storeStrong(&v52, 0);
    }
    for (i = 0; i < v56->_variantCount; ++i)
    {
      v50 = (id)-[NSMutableArray objectAtIndexedSubscript:](v56->_buttons, "objectAtIndexedSubscript:", i);
      -[MCLVariantGroupView addSubview:](v56, "addSubview:", v50);
      v46 = v56;
      v57[0] = v50;
      v48 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      v57[1] = v48;
      v47 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
      -[MCLVariantGroupView emitTMLSignal:withArguments:](v46, "emitTMLSignal:withArguments:", CFSTR("configureVariant"));

      if ((objc_msgSend(v50, "isSelected") & 1) != 0)
        v56->_selectedIndex = i;
      if (i % v56->_variantsPerLine)
      {
        if (v55[0])
        {
          buttonConstraints = v56->_buttonConstraints;
          v12 = (id)objc_msgSend(v50, "topAnchor");
          v11 = (id)objc_msgSend(v55[0], "topAnchor");
          v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](buttonConstraints, "addObject:");

          v13 = v56->_buttonConstraints;
          v16 = (id)objc_msgSend(v50, "leadingAnchor");
          v15 = (id)objc_msgSend(v55[0], "trailingAnchor");
          v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 8.0);
          -[NSMutableArray addObject:](v13, "addObject:");

          v17 = v56->_buttonConstraints;
          v20 = (id)objc_msgSend(v50, "widthAnchor");
          v19 = (id)objc_msgSend(v55[0], "widthAnchor");
          v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v17, "addObject:");

          v21 = v56->_buttonConstraints;
          v24 = (id)objc_msgSend(v50, "heightAnchor");
          v23 = (id)objc_msgSend(v55[0], "heightAnchor");
          v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v21, "addObject:");

        }
      }
      else
      {
        if (v55[0])
        {
          v38 = v56->_buttonConstraints;
          v41 = (id)objc_msgSend(v50, "topAnchor");
          v40 = (id)objc_msgSend(v55[0], "bottomAnchor");
          v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:", 8.0);
          -[NSMutableArray addObject:](v38, "addObject:");

          v42 = v56->_buttonConstraints;
          v45 = (id)objc_msgSend(v50, "heightAnchor");
          v44 = (id)objc_msgSend(v55[0], "heightAnchor");
          v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v42, "addObject:");

        }
        else
        {
          v34 = v56->_buttonConstraints;
          v37 = (id)objc_msgSend(v50, "topAnchor");
          v36 = (id)-[MCLVariantGroupView topAnchor](v56, "topAnchor");
          v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
          -[NSMutableArray addObject:](v34, "addObject:");

        }
        v25 = v56->_buttonConstraints;
        v28 = (id)objc_msgSend(v50, "leadingAnchor");
        v27 = (id)-[MCLVariantGroupView leadingAnchor](v56, "leadingAnchor");
        v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
        -[NSMutableArray addObject:](v25, "addObject:");

        v29 = (id)objc_msgSend(v50, "heightAnchor");
        v49 = (id)objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 80.0);

        LODWORD(v4) = 1144750080;
        objc_msgSend(v49, "setPriority:", v4);
        -[NSMutableArray addObject:](v56->_buttonConstraints, "addObject:", v49);
        v30 = v56->_buttonConstraints;
        v33 = (id)objc_msgSend(v50, "widthAnchor");
        v32 = (id)-[MCLVariantGroupView widthAnchor](v56, "widthAnchor");
        v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:multiplier:constant:", v54, -v53);
        -[NSMutableArray addObject:](v30, "addObject:");

        objc_storeStrong(&v49, 0);
      }
      if (i == v56->_variantCount - 1)
      {
        v5 = v56->_buttonConstraints;
        v8 = (id)objc_msgSend(v50, "bottomAnchor");
        v7 = (id)-[MCLVariantGroupView bottomAnchor](v56, "bottomAnchor");
        v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
        -[NSMutableArray addObject:](v5, "addObject:");

      }
      objc_storeStrong(v55, v50);
      objc_storeStrong(&v50, 0);
    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v56->_buttonConstraints);
    objc_storeStrong(v55, 0);
  }
}

- (void)clearVariants
{
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_buttonConstraints);
  -[NSMutableArray removeAllObjects](self->_buttonConstraints, "removeAllObjects");
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_buttons, "enumerateObjectsUsingBlock:", &__block_literal_global_8);
  self->_selectedIndex = -1;
}

void __36__MCLVariantGroupView_clearVariants__block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_storeStrong(location, 0);
}

- (id)createVariantButton:(Class)a3 type:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8[4];
  MCLVariantGroupView *v9;

  v9 = self;
  v8[3] = (id)a2;
  v8[2] = a3;
  v8[1] = (id)a4;
  v8[0] = (id)-[objc_class buttonWithType:](a3, "buttonWithType:", a4);
  objc_msgSend(v8[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = v8[0];
  v6 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  objc_msgSend(v5, "setTitleColor:forState:");

  objc_msgSend(v8[0], "addTarget:action:forControlEvents:", v9, sel_selectVariant_, 64);
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (void)selectVariant:(id)a3
{
  MCLVariantGroupView *v3;
  id v4;
  id v5;
  uint64_t v6;
  id location[2];
  MCLVariantGroupView *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[NSMutableArray indexOfObject:](v8->_buttons, "indexOfObject:", location[0]);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && (v6 != v8->_selectedIndex || v8->_actionVariant))
  {
    -[MCLVariantGroupView selectItemAtIndex:](v8, "selectItemAtIndex:", v6);
    v3 = v8;
    v9[0] = location[0];
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v9[1] = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    -[MCLVariantGroupView emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", CFSTR("didSelectVariant"));

  }
  objc_storeStrong(location, 0);
}

- (void)selectItemAtIndex:(int64_t)a3
{
  unint64_t v3;
  id v4;
  id v5;
  int64_t v6;
  SEL v7;
  MCLVariantGroupView *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  if (self->_selectedIndex >= 0)
  {
    v5 = (id)-[NSMutableArray objectAtIndexedSubscript:](v8->_buttons, "objectAtIndexedSubscript:", v8->_selectedIndex);
    objc_msgSend(v5, "setSelected:", 0);
    objc_storeStrong(&v5, 0);
  }
  if (v6 >= 0)
  {
    v3 = v6;
    if (v3 < -[NSMutableArray count](v8->_buttons, "count"))
    {
      v4 = (id)-[NSMutableArray objectAtIndexedSubscript:](v8->_buttons, "objectAtIndexedSubscript:", v6);
      objc_msgSend(v4, "setSelected:", 1);
      v8->_selectedIndex = v6;
      objc_storeStrong(&v4, 0);
    }
  }
}

- (Class)buttonClass
{
  return self->_buttonClass;
}

- (void)setButtonClass:(Class)a3
{
  objc_storeStrong((id *)&self->_buttonClass, a3);
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)variantCount
{
  return self->_variantCount;
}

- (void)setVariantCount:(int64_t)a3
{
  self->_variantCount = a3;
}

- (int64_t)variantsPerLine
{
  return self->_variantsPerLine;
}

- (void)setVariantsPerLine:(int64_t)a3
{
  self->_variantsPerLine = a3;
}

- (BOOL)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(BOOL)a3
{
  self->_actionVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonClass, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
