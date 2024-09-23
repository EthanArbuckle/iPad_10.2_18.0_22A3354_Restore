@implementation ACUITextWithLinkButtonFooterView

- (ACUITextWithLinkButtonFooterView)initWithSpecifier:(id)a3
{
  ACUITextWithLinkButtonFooterView *v3;
  ACUITextWithLinkButtonFooterView *v5;
  id v6;
  id v7;
  id location[2];
  ACUITextWithLinkButtonFooterView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUIFooterText"));
  v6 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUILinkButtonArray"));
  v3 = v9;
  v9 = 0;
  v9 = -[ACUITextWithLinkButtonFooterView initWithText:linkButtons:](v3, "initWithText:linkButtons:", v7, v6);
  v5 = v9;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButton:(id)a4
{
  id v6;
  ACUITextWithLinkButtonFooterView *v7;
  id v8;
  ACUITextWithLinkButtonFooterView *v9;
  id v10;
  id location[2];
  ACUITextWithLinkButtonFooterView *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = v12;
  v6 = location[0];
  v13[0] = v10;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = 0;
  v12 = -[ACUITextWithLinkButtonFooterView initWithText:linkButtons:](v7, "initWithText:linkButtons:", v6);
  v9 = v12;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButtons:(id)a4
{
  ACUITextWithLinkButtonFooterView *v4;
  uint64_t v5;
  NSString *footerText;
  id v7;
  uint64_t v8;
  UILabel *textLabel;
  ACUITextWithLinkButtonFooterView *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  UILabel *v16;
  id v17;
  UILabel *v18;
  id v19;
  UILabel *v20;
  id v21;
  NSArray *v22;
  uint64_t v23;
  ACUITextWithLinkButtonFooterView *v25;
  _QWORD __b[8];
  uint64_t v27;
  objc_super v28;
  id v29;
  id location[2];
  ACUITextWithLinkButtonFooterView *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v4 = v31;
  v31 = 0;
  v28.receiver = v4;
  v28.super_class = (Class)ACUITextWithLinkButtonFooterView;
  v25 = -[ACUITextWithLinkButtonFooterView init](&v28, sel_init);
  v31 = v25;
  objc_storeStrong((id *)&v31, v25);
  if (v25)
  {
    v5 = objc_msgSend(location[0], "copy");
    footerText = v31->_footerText;
    v31->_footerText = (NSString *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CEA700]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textLabel = v31->_textLabel;
    v31->_textLabel = (UILabel *)v8;

    -[UILabel setText:](v31->_textLabel, "setText:", v31->_footerText);
    v16 = v31->_textLabel;
    v17 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:");

    -[UILabel setNumberOfLines:](v31->_textLabel, "setNumberOfLines:", 0);
    v18 = v31->_textLabel;
    v19 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
    -[UILabel setTextColor:](v18, "setTextColor:");

    v20 = v31->_textLabel;
    v21 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
    -[UILabel setFont:](v20, "setFont:");

    -[UILabel setTextAlignment:](v31->_textLabel, "setTextAlignment:", 4);
    -[ACUITextWithLinkButtonFooterView addSubview:](v31, "addSubview:", v31->_textLabel);
    objc_storeStrong((id *)&v31->_linkButtons, v29);
    memset(__b, 0, sizeof(__b));
    v22 = v31->_linkButtons;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
    if (v23)
    {
      v13 = *(_QWORD *)__b[2];
      v14 = 0;
      v15 = v23;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)__b[2] != v13)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(__b[1] + 8 * v14);
        -[ACUITextWithLinkButtonFooterView addSubview:](v31, "addSubview:", v27);
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
          if (!v15)
            break;
        }
      }
    }

  }
  v11 = v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v31, 0);
  return v11;
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSArray *obj;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD __b[8];
  id v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  objc_super v34;
  SEL v35;
  ACUITextWithLinkButtonFooterView *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = self;
  v35 = a2;
  v34.receiver = self;
  v34.super_class = (Class)ACUITextWithLinkButtonFooterView;
  -[ACUITextWithLinkButtonFooterView layoutSubviews](&v34, sel_layoutSubviews);
  v33 = 0.0;
  -[ACUITextWithLinkButtonFooterView frame](v36, "frame");
  v29 = v2;
  v30 = v3;
  v31 = v4;
  v32 = v5;
  v33 = v4 - 28.0;
  v27 = 0u;
  v28 = 0u;
  v27 = *MEMORY[0x1E0C9D648];
  v28 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_QWORD *)&v27 = 14.0;
  *((_QWORD *)&v27 + 1) = 10.0;
  *(double *)&v28 = v4 - 28.0;
  -[ACUITextWithLinkButtonFooterView _heightForFooterTextConstrainedToWidth:](v36, "_heightForFooterTextConstrainedToWidth:", v4 - 28.0);
  *((double *)&v28 + 1) = v6;
  -[UILabel setFrame:](v36->_textLabel, "setFrame:", v27, *(double *)&v28, v6);
  v26 = 0.0;
  v25 = 0.0;
  memset(__b, 0, sizeof(__b));
  obj = v36->_linkButtons;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
  if (v18)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v18;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v15);
      objc_msgSend(v24, "frame");
      v21 = v7;
      if (objc_msgSend(MEMORY[0x1E0CEA238], "defaultWritingDirectionForLanguage:", 0) == 1)
      {
        -[ACUITextWithLinkButtonFooterView frame](v36, "frame");
        v19 = v8 - v21 - 14.0;
      }
      else
      {
        v19 = 14.0;
      }
      -[ACUITextWithLinkButtonFooterView _heightForEmptyLineConstrainedToWidth:](v36, "_heightForEmptyLineConstrainedToWidth:", v33, *((double *)&v28 + 1) + 10.0 + v26, v25 + 1.0);
      v20 = v11 + v12 * v9;
      -[ACUITextWithLinkButtonFooterView _heightForLinkButton:constrainedToWidth:](v36, "_heightForLinkButton:constrainedToWidth:", v24, v33);
      v22 = v10;
      objc_msgSend(v24, "setFrame:", v19, v20, v21, v10);
      v26 = v26 + v22;
      v25 = v25 + 1.0;
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
        if (!v16)
          break;
      }
    }
  }

}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSArray *obj;
  uint64_t v15;
  _QWORD __b[8];
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  SEL v21;
  ACUITextWithLinkButtonFooterView *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a3 - 28.0;
  v18 = 0.0;
  memset(__b, 0, sizeof(__b));
  obj = v22->_linkButtons;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v15)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(__b[1] + 8 * v12);
      -[ACUITextWithLinkButtonFooterView _heightForLinkButton:constrainedToWidth:](v22, "_heightForLinkButton:constrainedToWidth:", v17, v19);
      v18 = v18 + v3;
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v13)
          break;
      }
    }
  }

  -[ACUITextWithLinkButtonFooterView _heightForFooterTextConstrainedToWidth:](v22, "_heightForFooterTextConstrainedToWidth:", v19);
  v8 = v4 + 10.0;
  -[ACUITextWithLinkButtonFooterView _heightForEmptyLineConstrainedToWidth:](v22, "_heightForEmptyLineConstrainedToWidth:", v19);
  v9 = v5;
  v6 = -[NSArray count](v22->_linkButtons, "count");
  return v8 + v9 * (double)v6 + v18 + 10.0;
}

- (double)_heightForFooterTextConstrainedToWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  NSString *footerText;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  footerText = self->_footerText;
  CGSizeMake();
  v10 = v3;
  v11 = v4;
  v13 = *MEMORY[0x1E0CEA098];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v14[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13);
  -[NSString boundingRectWithSize:options:attributes:context:](footerText, "boundingRectWithSize:options:attributes:context:", 1, v10, v11);
  v12 = v5;

  return ceil(v12);
}

- (double)_heightForLinkButton:(id)a3 constrainedToWidth:(double)a4
{
  double v4;
  double v5;
  double v6;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id location[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)objc_msgSend(location[0], "acui_titleString");
  CGSizeMake();
  v11 = v4;
  v12 = v5;
  v15 = *MEMORY[0x1E0CEA098];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v16[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15);
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v11, v12);
  v13 = v6;

  objc_storeStrong(location, 0);
  return ceil(v13);
}

- (double)_heightForEmptyLineConstrainedToWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  CGSizeMake();
  v9 = v3;
  v10 = v4;
  v12 = *MEMORY[0x1E0CEA098];
  v8 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 8.0);
  v13[0] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12);
  objc_msgSend(CFSTR("A"), "boundingRectWithSize:options:attributes:context:", 1, v9, v10);
  v11 = v5;

  return ceil(v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_linkButtons, 0);
}

@end
