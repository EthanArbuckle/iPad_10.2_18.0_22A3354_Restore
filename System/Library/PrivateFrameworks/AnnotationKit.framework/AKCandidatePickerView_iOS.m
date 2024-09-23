@implementation AKCandidatePickerView_iOS

- (AKCandidatePickerView_iOS)initWithFrame:(CGRect)a3 items:(id)a4 annotations:(id)a5 target:(id)a6 action:(SEL)a7 visualStyle:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  AKCandidatePickerView_iOS *v21;
  AKCandidatePickerView_iOS *v22;
  void *v23;
  uint64_t v24;
  UIVisualEffectView *visualEffectView;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  UIStackView *buttonContainer;
  void *v33;
  void *v34;
  double v35;
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
  int64_t v51;
  objc_super v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v52.receiver = self;
  v52.super_class = (Class)AKCandidatePickerView_iOS;
  v21 = -[AKCandidatePickerView_iOS initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    -[AKCandidatePickerView_iOS setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCandidatePickerView_iOS setBackgroundColor:](v22, "setBackgroundColor:", v23);

    v22->_blurStyle = a8;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", 0);
    visualEffectView = v22->_visualEffectView;
    v22->_visualEffectView = (UIVisualEffectView *)v24;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v22->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView layer](v22->_visualEffectView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerRadius:", 6.0);

    -[UIVisualEffectView layer](v22->_visualEffectView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](v22->_visualEffectView, "setBackgroundColor:", v28);

    -[AKCandidatePickerView_iOS addSubview:](v22, "addSubview:", v22->_visualEffectView);
    objc_storeStrong((id *)&v22->_itemTags, a4);
    objc_storeStrong((id *)&v22->_annotations, a5);
    objc_storeWeak(&v22->_target, v20);
    v22->_action = a7;
    v29 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v30 = objc_msgSend(v29, "initWithArrangedSubviews:", MEMORY[0x24BDBD1A8]);
    v51 = a8;
    v31 = v18;
    buttonContainer = v22->_buttonContainer;
    v22->_buttonContainer = (UIStackView *)v30;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v22->_buttonContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](v22->_buttonContainer, "setBackgroundColor:", v33);

    v34 = (void *)MEMORY[0x24BDD16E0];
    -[AKCandidatePickerView_iOS intrinsicContentSize](v22, "intrinsicContentSize");
    objc_msgSend(v34, "numberWithDouble:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("height, buttonMargin"), v36, &unk_24F1CFC90, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("_buttonContainer, _visualEffectView"), v22->_buttonContainer, v22->_visualEffectView, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_visualEffectView(height)]|"), 0, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v40);

    v41 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_visualEffectView]|"), 0, 0, v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v42);

    -[AKCandidatePickerView_iOS visualEffectView](v22, "visualEffectView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "addSubview:", v22->_buttonContainer);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(buttonMargin)-[_buttonContainer]-(buttonMargin)-|"), 0, v37, v38);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addConstraints:", v45);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(buttonMargin)-[_buttonContainer]-(buttonMargin)-|"), 0, v37, v38);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addConstraints:", v46);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22->_buttonContainer, 9, 0, v44, 9, 1.0, 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addConstraint:", v47);

    -[AKCandidatePickerView_iOS visualEffectView](v22, "visualEffectView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAlpha:", 0.0);

    v18 = v31;
    -[AKCandidatePickerView_iOS _createButtonsWithBlurStyle:](v22, "_createButtonsWithBlurStyle:", v51);
    -[AKCandidatePickerView_iOS setSelectedIndex:](v22, "setSelectedIndex:", 0);

  }
  return v22;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  unsigned int v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  id v18;
  double v19;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  v9 = !v6;
  if (v6)
    v10 = 0.1;
  else
    v10 = 0.18;
  if (v6)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", -[AKCandidatePickerView_iOS blurStyle](self, "blurStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (double)v9;
  if (v5)
  {
    v13 = (void *)MEMORY[0x24BDF6F90];
    v14 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_2290503B0;
    v17[3] = &unk_24F1A80F8;
    v17[4] = self;
    v19 = v12;
    v18 = v11;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = sub_229050430;
    v15[3] = &unk_24F1A8120;
    v16 = v8;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v17, v15, v10);

  }
  else
  {
    -[AKCandidatePickerView_iOS setAlpha:](self, "setAlpha:", v12);
    if (v8)
      v8[2](v8);
  }

}

- (void)setSelectedIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  -[AKCandidatePickerView_iOS buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[AKCandidatePickerView_iOS buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[AKCandidatePickerView_iOS _selectBackground:animated:](self, "_selectBackground:animated:", v8, 0);
  }
}

- (int64_t)tagForCandidateItemAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[AKCandidatePickerView_iOS buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[AKCandidatePickerView_iOS buttons](self, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "tag");
  return v9;
}

- (void)_createButtonsWithBlurStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id obj;
  uint64_t v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[AKCandidatePickerView_iOS buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[AKCandidatePickerView_iOS annotations](self, "annotations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v5)
  {
    v6 = v5;
    v39 = *(_QWORD *)v47;
    v7 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v11);
        -[AKCandidatePickerView_iOS annotations](self, "annotations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObject:", v12);

        -[AKCandidatePickerView_iOS itemTags](self, "itemTags");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        +[AKAnnotationImageHelper imageOfSize:forAnnotation:](AKAnnotationImageHelper, "imageOfSize:forAnnotation:", v12, 32.0, 32.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageWithRenderingMode:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", v7, v8, v9, v10);
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBackgroundColor:", v21);

        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v20, "setTag:", v17);
        objc_msgSend(v20, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCornerRadius:", 3.0);

        if (a3 == 2)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTintColor:", v23);

        }
        objc_msgSend(v20, "setImage:forState:", v19, 0);
        -[AKCandidatePickerView_iOS target](self, "target");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTarget:action:forControlEvents:", v24, -[AKCandidatePickerView_iOS action](self, "action"), 64);

        objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__selectBackground_, 1);
        -[AKCandidatePickerView_iOS buttonContainer](self, "buttonContainer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSubview:", v20);

        _NSDictionaryOfVariableBindings(CFSTR("button, size"), v20, &unk_24F1CFCA8, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[button(size)]|"), 0, v26, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activateConstraints:", v28);

        v29 = (void *)MEMORY[0x24BDD1628];
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[button(size)]"), 0, v26, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activateConstraints:", v30);

        objc_msgSend(v41, "addObject:", v20);
        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v6);
  }

  -[AKCandidatePickerView_iOS setButtons:](self, "setButtons:", v41);
  if (objc_msgSend(v41, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[AKCandidatePickerView_iOS buttons](self, "buttons");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v43;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v43 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v35);
          -[AKCandidatePickerView_iOS buttonContainer](self, "buttonContainer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addArrangedSubview:", v36);

          ++v35;
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v33);
    }

  }
  -[AKCandidatePickerView_iOS layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)_selectBackground:(id)a3
{
  -[AKCandidatePickerView_iOS _selectBackground:animated:](self, "_selectBackground:animated:", a3, 1);
}

- (void)_selectBackground:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;

  v4 = a4;
  v6 = a3;
  v7 = self->_blurStyle == 2;
  -[AKCandidatePickerView_iOS buttons](self, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v6);
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_229050B50;
  v18[3] = &unk_24F1A8148;
  v11 = v6;
  v19 = v11;
  v21 = v7;
  v12 = v9;
  v20 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x22E2C12D0](v18);
  v14 = v13;
  if (v4)
  {
    v15 = (void *)MEMORY[0x24BDF6F90];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = sub_229050CFC;
    v16[3] = &unk_24F1A7630;
    v17 = v13;
    objc_msgSend(v15, "animateWithDuration:animations:completion:", v16, 0, 0.18);

  }
  else
  {
    v13[2](v13);
  }

}

- (UIStackView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (NSArray)itemTags
{
  return self->_itemTags;
}

- (void)setItemTags:(id)a3
{
  objc_storeStrong((id *)&self->_itemTags, a3);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_itemTags, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
}

@end
