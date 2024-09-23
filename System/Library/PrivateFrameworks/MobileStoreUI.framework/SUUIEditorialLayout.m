@implementation SUUIEditorialLayout

- (SUUIEditorialLayout)initWithEditorial:(id)a3 layoutCache:(id)a4
{
  id v7;
  id v8;
  SUUIEditorialLayout *v9;
  SUUIEditorialLayout *v10;
  int64x2_t v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIEditorialLayout;
  v9 = -[SUUIEditorialLayout init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editorial, a3);
    objc_storeStrong((id *)&v10->_textLayoutCache, a4);
    v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v10->_landscapeLinkLayoutIndex = v11;
    v10->_landscapeTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    *(int64x2_t *)&v10->_portraitLinkLayoutIndex = v11;
    v10->_portraitTitleLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)bodyTextLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeTextLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeTextLayoutIndex = self->_landscapeTextLayoutIndex;
  }
  else
  {
    landscapeTextLayoutIndex = self->_portraitTextLayoutIndex;
  }
  if (landscapeTextLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)layoutHeightForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  SUUIEditorialComponent *editorial;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  uint64_t v20;
  float v21;

  -[SUUIEditorialLayout bodyTextLayoutForOrientation:](self, "bodyTextLayoutForOrientation:");
  v7 = objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialLayout linkLayoutForOrientation:](self, "linkLayoutForOrientation:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialLayout titleTextLayoutForOrientation:](self, "titleTextLayoutForOrientation:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7 && !v8 && !v9)
  {
    v11 = 80.0;
    goto LABEL_18;
  }
  v21 = 0.0;
  v19 = 0u;
  v20 = 0;
  editorial = self->_editorial;
  if (editorial)
    -[SUUIEditorialComponent editorialStyle](editorial, "editorialStyle", (unsigned __int128)0, (unsigned __int128)0, 0);
  if (v7)
  {
    if (a4 || !objc_msgSend((id)v7, "requiresTruncation"))
      objc_msgSend((id)v7, "textSize", v19, v20);
    else
      objc_msgSend((id)v7, "truncatedSize");
    v11 = v13;
    if (v10)
      goto LABEL_13;
  }
  else
  {
    v11 = 0.0;
    if (v10)
    {
LABEL_13:
      objc_msgSend((id)v10, "textSize", v19, v20);
      v11 = v11 + v14 + v21;
    }
  }
  if (v8)
  {
    v15 = *((float *)&v20 + 1);
    if (!(v7 | v10))
      v15 = -0.0;
    v16 = v11 + v15;
    objc_msgSend(v8, "totalSize", v19, v20);
    v11 = v17 + v16;
  }
LABEL_18:

  return v11;
}

- (void)enqueueLayoutRequests
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  SUUILayoutCache *textLayoutCache;
  void *v10;
  void *v11;
  int64_t v12;
  SUUILayoutCache *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  SUUILayoutCache *v18;
  void *v19;
  void *v20;
  int64_t v21;
  SUUILayoutCache *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  SUUILayoutCache *v28;
  void *v29;
  void *v30;
  int64_t v31;
  SUUILayoutCache *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    v4 = self->_landscapeWidth > 0.00000011920929;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v4 = v6 > 375.0 && self->_landscapeWidth > 0.00000011920929;

  }
  -[SUUIEditorialComponent bodyText](self->_editorial, "bodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[SUUIEditorialComponent bodyAttributedText](self->_editorial, "bodyAttributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
  }
  textLayoutCache = self->_textLayoutCache;
  -[SUUIEditorialLayout _bodyTextLayoutRequestWithTotalWidth:](self, "_bodyTextLayoutRequestWithTotalWidth:", self->_portraitWidth);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUUILayoutCache addLayoutRequests:](textLayoutCache, "addLayoutRequests:", v11);

  self->_portraitTextLayoutIndex = v12;
  if (v4)
  {
    v13 = self->_textLayoutCache;
    -[SUUIEditorialLayout _bodyTextLayoutRequestWithTotalWidth:](self, "_bodyTextLayoutRequestWithTotalWidth:", self->_landscapeWidth);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUUILayoutCache addLayoutRequests:](v13, "addLayoutRequests:", v15);

    self->_landscapeTextLayoutIndex = v16;
  }
LABEL_12:
  -[SUUIEditorialComponent titleText](self->_editorial, "titleText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = self->_textLayoutCache;
    -[SUUIEditorialLayout _titleTextLayoutRequestWithTotalWidth:](self, "_titleTextLayoutRequestWithTotalWidth:", self->_portraitWidth);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SUUILayoutCache addLayoutRequests:](v18, "addLayoutRequests:", v20);

    self->_portraitTitleLayoutIndex = v21;
    if (v4)
    {
      v22 = self->_textLayoutCache;
      -[SUUIEditorialLayout _titleTextLayoutRequestWithTotalWidth:](self, "_titleTextLayoutRequestWithTotalWidth:", self->_landscapeWidth);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SUUILayoutCache addLayoutRequests:](v22, "addLayoutRequests:", v24);

      self->_landscapeTitleLayoutIndex = v25;
    }
  }
  -[SUUIEditorialComponent links](self->_editorial, "links");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    v28 = self->_textLayoutCache;
    -[SUUIEditorialLayout _linkLayoutRequestWithTotalWidth:](self, "_linkLayoutRequestWithTotalWidth:", self->_portraitWidth);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SUUILayoutCache addLayoutRequests:](v28, "addLayoutRequests:", v30);

    self->_portraitLinkLayoutIndex = v31;
    if (v4)
    {
      v32 = self->_textLayoutCache;
      -[SUUIEditorialLayout _linkLayoutRequestWithTotalWidth:](self, "_linkLayoutRequestWithTotalWidth:", self->_landscapeWidth);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SUUILayoutCache addLayoutRequests:](v32, "addLayoutRequests:", v34);

      self->_landscapeLinkLayoutIndex = v35;
    }
  }
}

- (id)linkLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeLinkLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeLinkLayoutIndex = self->_landscapeLinkLayoutIndex;
  }
  else
  {
    landscapeLinkLayoutIndex = self->_portraitLinkLayoutIndex;
  }
  if (landscapeLinkLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLayoutWidth:(double)a3 forOrientation:(int64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
  {
    v4 = 40;
  }
  else
  {
    if (a4)
      return;
    v4 = 72;
  }
  *(double *)((char *)&self->super.isa + v4) = a3;
}

- (id)titleTextLayoutForOrientation:(int64_t)a3
{
  int64_t landscapeTitleLayoutIndex;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    landscapeTitleLayoutIndex = self->_landscapeTitleLayoutIndex;
  }
  else
  {
    landscapeTitleLayoutIndex = self->_portraitTitleLayoutIndex;
  }
  if (landscapeTitleLayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bodyTextLayoutRequestWithTotalWidth:(double)a3
{
  SUUITextLayoutRequest *v5;
  SUUIEditorialComponent *editorial;
  void *v7;
  void *v8;
  uint64_t v10;
  unint64_t v11;

  v5 = objc_alloc_init(SUUITextLayoutRequest);
  v10 = 0;
  editorial = self->_editorial;
  if (editorial)
  {
    -[SUUIEditorialComponent editorialStyle](editorial, "editorialStyle", 0);
    editorial = self->_editorial;
  }
  -[SUUIEditorialComponent bodyAttributedText](editorial, "bodyAttributedText", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITextLayoutRequest setAttributedText:](v5, "setAttributedText:", v7);

  -[SUUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0);
  -[SUUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", -[SUUIEditorialComponent maximumBodyLines](self->_editorial, "maximumBodyLines"));
  -[SUUIEditorialComponent bodyText](self->_editorial, "bodyText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITextLayoutRequest setText:](v5, "setText:", v8);

  -[SUUITextLayoutRequest setTextAlignment:](v5, "setTextAlignment:", SUUICTTextAlignmentForPageComponentAlignment(v11));
  -[SUUITextLayoutRequest setWidth:](v5, "setWidth:", a3);
  if (0.0 > 0.00000011921)
    -[SUUITextLayoutRequest setFontSize:](v5, "setFontSize:", 0.0);
  return v5;
}

- (id)_linkLayoutRequestWithTotalWidth:(double)a3
{
  SUUIEditorialLinkLayoutRequest *v5;
  void *v6;

  v5 = objc_alloc_init(SUUIEditorialLinkLayoutRequest);
  -[SUUIEditorialComponent links](self->_editorial, "links");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialLinkLayoutRequest setLinks:](v5, "setLinks:", v6);

  -[SUUIEditorialLinkLayoutRequest setWidth:](v5, "setWidth:", a3);
  return v5;
}

- (id)_titleTextLayoutRequestWithTotalWidth:(double)a3
{
  SUUITextLayoutRequest *v5;
  SUUIEditorialComponent *editorial;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  unint64_t v15;

  v5 = objc_alloc_init(SUUITextLayoutRequest);
  v14 = 0;
  editorial = self->_editorial;
  if (editorial)
    -[SUUIEditorialComponent editorialStyle](editorial, "editorialStyle", (unsigned __int128)0, 0);
  -[SUUITextLayoutRequest setFontWeight:](v5, "setFontWeight:", 0, v14);
  -[SUUIEditorialComponent titleText](self->_editorial, "titleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITextLayoutRequest setText:](v5, "setText:", v7);

  -[SUUITextLayoutRequest setTextAlignment:](v5, "setTextAlignment:", SUUICTTextAlignmentForPageComponentAlignment(v15));
  -[SUUITextLayoutRequest setWidth:](v5, "setWidth:", a3);
  LODWORD(v8) = 0;
  if (0.0 <= 0.00000011921)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1)
      v12 = &kSUUITextBoxLayoutTitleFontSizeIPad;
    else
      v12 = &kSUUITextBoxLayoutTitleFontSizeIPhone;
    v9 = *(double *)v12;
  }
  else
  {
    v9 = 0.0;
  }
  -[SUUITextLayoutRequest setFontSize:](v5, "setFontSize:", v9);
  return v5;
}

- (SUUIEditorialComponent)editorialComponent
{
  return self->_editorial;
}

- (SUUILayoutCache)layoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
}

@end
