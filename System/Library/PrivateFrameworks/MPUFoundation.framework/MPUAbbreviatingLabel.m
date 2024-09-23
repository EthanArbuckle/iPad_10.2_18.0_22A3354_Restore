@implementation MPUAbbreviatingLabel

- (void)setTextRepresentations:(id)a3
{
  NSArray *v4;
  NSArray *textRepresentations;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_textRepresentations, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    textRepresentations = self->_textRepresentations;
    self->_textRepresentations = v4;

    -[MPUAbbreviatingLabel _calculateTextSizes](self, "_calculateTextSizes");
  }

}

- (void)setFont:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUAbbreviatingLabel;
  -[MPUAbbreviatingLabel setFont:](&v4, sel_setFont_, a3);
  -[MPUAbbreviatingLabel _calculateTextSizes](self, "_calculateTextSizes");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)MPUAbbreviatingLabel;
  -[MPUAbbreviatingLabel setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
    -[MPUAbbreviatingLabel _selectBestRepresentation](self, "_selectBestRepresentation");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)MPUAbbreviatingLabel;
  -[MPUAbbreviatingLabel setBounds:](&v20, sel_setBounds_, x, y, width, height);
  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
    -[MPUAbbreviatingLabel _selectBestRepresentation](self, "_selectBestRepresentation");
}

- (void)_calculateTextSizes
{
  NSMutableArray *v3;
  NSMutableArray *textRepresentationSizes;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  textRepresentationSizes = self->_textRepresentationSizes;
  self->_textRepresentationSizes = v3;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_textRepresentations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[MPUAbbreviatingLabel _setTextRepresentation:](self, "_setTextRepresentation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = self->_textRepresentationSizes;
        v11 = (void *)MEMORY[0x24BDD1968];
        -[MPUAbbreviatingLabel intrinsicContentSize](self, "intrinsicContentSize");
        objc_msgSend(v11, "valueWithCGSize:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v10, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[MPUAbbreviatingLabel _selectBestRepresentation](self, "_selectBestRepresentation");
}

- (void)_selectBestRepresentation
{
  double v3;
  double v4;
  BOOL v5;
  NSArray *textRepresentations;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  NSArray *v12;
  id v13;
  CGRect v14;

  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v4 = v3;
  -[MPUAbbreviatingLabel bounds](self, "bounds");
  v5 = CGRectEqualToRect(v14, *MEMORY[0x24BDBF090]);
  textRepresentations = self->_textRepresentations;
  if (v5)
  {
    -[NSArray firstObject](textRepresentations, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[NSArray count](textRepresentations, "count"))
  {
    v8 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_textRepresentationSizes, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "CGSizeValue");
      v11 = v10;

      v12 = self->_textRepresentations;
      if (v11 <= v4)
        break;
      if (++v8 >= -[NSArray count](v12, "count"))
        goto LABEL_7;
    }
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    -[NSArray lastObject](self->_textRepresentations, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v7;
  -[MPUAbbreviatingLabel _setTextRepresentation:](self, "_setTextRepresentation:");

}

- (void)_setTextRepresentation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char **v7;
  MPUAbbreviatingLabel **v8;
  void *v9;
  char v10;
  MPUAbbreviatingLabel *v11;
  MPUAbbreviatingLabel *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPUAbbreviatingLabel attributedText](self, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToAttributedString:", v4);

    if ((v6 & 1) == 0)
    {
      v12 = self;
      v7 = &selRef_setAttributedText_;
      v8 = &v12;
LABEL_6:
      v8[1] = (MPUAbbreviatingLabel *)MPUAbbreviatingLabel;
      objc_msgSendSuper2((objc_super *)v8, *v7, v4, v11);
    }
  }
  else
  {
    -[MPUAbbreviatingLabel text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if ((v10 & 1) == 0)
    {
      v11 = self;
      v7 = &selRef_setText_;
      v8 = &v11;
      goto LABEL_6;
    }
  }

}

- (NSArray)textRepresentations
{
  return self->_textRepresentations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRepresentations, 0);
  objc_storeStrong((id *)&self->_textRepresentationSizes, 0);
}

@end
