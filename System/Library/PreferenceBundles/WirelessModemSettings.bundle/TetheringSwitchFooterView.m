@implementation TetheringSwitchFooterView

- (TetheringSwitchFooterView)initWithSpecifier:(id)a3
{
  id v4;
  TetheringSwitchFooterView *v5;
  NSMutableArray *v6;
  NSMutableArray *labels;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TetheringSwitchFooterView;
  v5 = -[TetheringSwitchFooterView init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    labels = v5->_labels;
    v5->_labels = v6;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TetheringSwitchFooterView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    objc_msgSend(v4, "propertyForKey:", CFSTR("TextFooterInitialText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TetheringSwitchFooterView setText:](v5, "setText:", v9);

  }
  return v5;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[TetheringSwitchFooterView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_labels, "removeAllObjects");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = objc_alloc_init(MEMORY[0x24BEBD708]);
        PreferencesTableViewFooterColor();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTextColor:", v16);

        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBackgroundColor:", v17);

        objc_msgSend(v15, "setLineBreakMode:", 0);
        PreferencesTableViewFooterFont();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFont:", v18);

        objc_msgSend(v15, "setNumberOfLines:", 0);
        objc_msgSend(v15, "setText:", v14);
        -[NSMutableArray addObject:](self->_labels, "addObject:", v15);
        v21.receiver = self;
        v21.super_class = (Class)TetheringSwitchFooterView;
        -[TetheringSwitchFooterView addSubview:](&v21, sel_addSubview_, v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v11);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5
{
  _BOOL4 v5;
  double width;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSMutableArray *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;
  CGSize result;
  CGRect v40;
  CGRect v41;

  v5 = a5;
  width = a3.width;
  v38 = *MEMORY[0x24BDAC8D0];
  PreferencesTableViewCellLeftPad();
  v9 = v8;
  PreferencesTableViewCellLeftPad();
  v11 = v10;
  PreferencesTableViewCellRightPad();
  v13 = v12;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_labels;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = width - v11 - v13;
    v17 = v9;
    v18 = *(_QWORD *)v32;
    v19 = *MEMORY[0x24BEBB360];
    v20 = 6.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v22, "frame");
        objc_msgSend(v22, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v19;
        objc_msgSend(v22, "font");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v16, 3.40282347e38);
        v27 = v26;

        if (v5)
        {
          v40.origin.x = v17;
          v40.origin.y = v20;
          v40.size.width = v16;
          v40.size.height = v27;
          v41 = CGRectIntegral(v40);
          objc_msgSend(v22, "setFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
        }
        v20 = v20 + v27 + 6.0;
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v15);
  }
  else
  {
    v20 = 6.0;
  }

  v28 = width;
  v29 = v20;
  result.height = v29;
  result.width = v28;
  return result;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4;

  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", a4, 0, a3, 0.0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TetheringSwitchFooterView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v6, 0, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TetheringSwitchFooterView;
  -[TetheringSwitchFooterView layoutSubviews](&v8, sel_layoutSubviews);
  -[TetheringSwitchFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[TetheringSwitchFooterView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v7, 1, v4, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
