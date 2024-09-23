@implementation AKSegmentedCtrl

- (AKSegmentedCtrl)initWithImages:(id)a3
{
  id v4;
  AKSegmentedCtrl *v5;
  uint64_t v6;
  NSArray *images;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSegmentedCtrl;
  v5 = -[AKSegmentedCtrl initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    images = v5->_images;
    v5->_images = (NSArray *)v6;

    -[AKSegmentedCtrl _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (AKSegmentedCtrl)initWithFrame:(CGRect)a3
{
  return -[AKSegmentedCtrl initWithImages:](self, "initWithImages:", MEMORY[0x24BDBD1A8], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_commonInit
{
  NSArray *v3;
  NSArray *buttons;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttons = self->_buttons;
  self->_buttons = v3;

  self->_selectedSegment = 0x7FFFFFFFFFFFFFFFLL;
  MEMORY[0x24BEDD108](self, sel__configureForNewImages);
}

- (void)_configureForNewImages
{
  NSArray *buttons;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  AKToggleButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  AKSegmentedCtrl *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  AKSegmentedCtrl *v31;
  void *v32;
  double v33;
  AKSegmentedCtrl *v34;
  AKSegmentedCtrl *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  uint64_t v47;
  NSArray *obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[AKSegmentedCtrl setSelectedSegment:](self, "setSelectedSegment:", 0x7FFFFFFFFFFFFFFFLL);
  buttons = self->_buttons;
  v47 = 488;
  self->_buttons = 0;

  -[AKSegmentedCtrl subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = self->_images;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v54;
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v54 != v8)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        v15 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", v14, 1, v9, v10, v11, v12);
        -[AKToggleButton setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AKToggleButton setShouldTintNormalImage:](v15, "setShouldTintNormalImage:", 1);
        -[AKToggleButton layer](v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCornerRadius:", 3.0);

        -[AKToggleButton widthAnchor](v15, "widthAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintEqualToConstant:", 29.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setActive:", 1);

        -[AKToggleButton heightAnchor](v15, "heightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", 29.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActive:", 1);

        -[AKToggleButton setImage:forState:](v15, "setImage:forState:", v14, 0);
        -[AKToggleButton addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
        objc_msgSend(v5, "addObject:", v15);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v7);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v50;
    v26 = *MEMORY[0x24BDBF090];
    v27 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v30 = 0;
      v31 = v24;
      do
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v21);
        v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v30);
        v24 = (AKSegmentedCtrl *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v26, v27, v28, v29);
        -[AKSegmentedCtrl setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AKSegmentedCtrl addSubview:](self, "addSubview:", v24);
        if (v31)
        {
          v33 = 0.0;
          v34 = v24;
          v35 = v31;
          v36 = 2;
        }
        else
        {
          v33 = -10.0;
          v34 = v24;
          v35 = self;
          v36 = 1;
        }
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 1, 0, v35, v36, 1.0, v33, v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setActive:", 1);

        objc_msgSend(v21, "lastObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 == v38)
        {
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 2, 0, self, 2, 1.0, 10.0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setActive:", 1);

        }
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 3, 0, self, 3, 1.0, 0.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setActive:", 1);

        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 4, 0, self, 4, 1.0, 0.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setActive:", 1);

        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 7, 0, v31, 7, 1.0, 0.0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setActive:", 1);

        }
        -[AKSegmentedCtrl addSubview:](v24, "addSubview:", v32);
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 9, 0, v24, 9, 1.0, 0.0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setActive:", 1);

        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 10, 0, v24, 10, 1.0, 0.0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setActive:", 1);

        ++v30;
        v31 = v24;
      }
      while (v23 != v30);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v23);

  }
  v45 = (objc_class *)objc_msgSend(v21, "copy");
  v46 = *(Class *)((char *)&self->super.super.super.super.isa + v47);
  *(Class *)((char *)&self->super.super.super.super.isa + v47) = v45;

}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[AKSegmentedCtrl buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v6);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AKSegmentedCtrl _setSelected:forSegment:](self, "_setSelected:forSegment:", objc_msgSend(v6, "isSelected"), v5);
    -[AKSegmentedCtrl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (void)_setSelected:(BOOL)a3 forSegment:(unint64_t)a4
{
  _BOOL8 v4;
  void *v6;
  NSArray *buttons;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSelected") != v4)
    objc_msgSend(v6, "setSelected:", v4);
  if (!-[AKSegmentedCtrl selectionType](self, "selectionType"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_buttons;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (v13 != v6
            && objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isSelected", (_QWORD)v14))
          {
            objc_msgSend(v13, "setSelected:", 0);
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    if (-[NSMutableOrderedSet count](self->_selectionStack, "count") == 1 && (objc_msgSend(v6, "isSelected") & 1) == 0)
      objc_msgSend(v6, "setSelected:", 1);
    buttons = self->_buttons;
    goto LABEL_20;
  }
  if (-[AKSegmentedCtrl selectionType](self, "selectionType") == 1)
  {
    buttons = self->_buttons;
LABEL_20:
    -[AKSegmentedCtrl setSelectedSegment:](self, "setSelectedSegment:", -[NSArray indexOfObject:](buttons, "indexOfObject:", v6, (_QWORD)v14));
  }

}

- (void)setSelected:(BOOL)a3 forSegment:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  unint64_t v8;
  id v9;

  v5 = a3;
  -[AKSegmentedCtrl buttons](self, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    NSLog(CFSTR("Segment index %lu is out of bounds."), a4);
  }
  else
  {
    -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isSelected") != v5)
      -[AKSegmentedCtrl _setSelected:forSegment:](self, "_setSelected:forSegment:", v5, a4);

  }
}

- (BOOL)isSelectedForSegment:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;

  -[AKSegmentedCtrl buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSelected");

  return v8;
}

- (void)selectSegmentWithTag:(int64_t)a3
{
  NSUInteger v4;
  id v5;

  -[AKSegmentedCtrl segmentForTag:](self, "segmentForTag:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray indexOfObject:](self->_buttons, "indexOfObject:", v5);
  if ((objc_msgSend(v5, "isSelected") & 1) == 0)
    -[AKSegmentedCtrl _setSelected:forSegment:](self, "_setSelected:forSegment:", 1, v4);

}

- (void)deselectAllSegments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[AKSegmentedCtrl selectionType](self, "selectionType") == 1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[AKSegmentedCtrl buttons](self, "buttons", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v8, "isSelected"))
            -[AKSegmentedCtrl _setSelected:forSegment:](self, "_setSelected:forSegment:", 0, -[NSArray indexOfObject:](self->_buttons, "indexOfObject:", v8));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (BOOL)isEnabledForSegment:(unint64_t)a3
{
  void *v3;
  char v4;

  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (id)segmentAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[AKSegmentedCtrl buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[AKSegmentedCtrl buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  id v5;

  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTag:", a3);

}

- (int64_t)tagForSegment:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[AKSegmentedCtrl segmentAtIndex:](self, "segmentAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tag");

  return v4;
}

- (id)segmentForTag:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_buttons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "tag", (_QWORD)v13) == a3)
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)segmentCount
{
  void *v2;
  unint64_t v3;

  -[AKSegmentedCtrl buttons](self, "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
}

- (unint64_t)selectedSegment
{
  return self->_selectedSegment;
}

- (void)setSelectedSegment:(unint64_t)a3
{
  self->_selectedSegment = a3;
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSMutableOrderedSet)selectionStack
{
  return self->_selectionStack;
}

- (void)setSelectionStack:(id)a3
{
  objc_storeStrong((id *)&self->_selectionStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionStack, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
