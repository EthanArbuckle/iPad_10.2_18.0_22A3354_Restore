@implementation IKTextElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (IKTextElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKTextElement *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *textBadges;
  NSMutableArray *v15;
  NSMutableArray *textBadgeElements;
  NSMutableArray *v17;
  NSMutableArray *textSpanElements;
  void *v19;
  uint64_t v20;
  IKTextParser *textParser;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IKTextElement;
  v11 = -[IKViewElement initWithDOMElement:parent:elementFactory:](&v28, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1DF092260]();
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textBadges = v11->_textBadges;
    v11->_textBadges = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textBadgeElements = v11->_textBadgeElements;
    v11->_textBadgeElements = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textSpanElements = v11->_textSpanElements;
    v11->_textSpanElements = v17;

    objc_msgSend(v8, "nodeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_textStyle = -[IKTextElement _styleForTagName:](v11, "_styleForTagName:", v19);

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__IKTextElement_initWithDOMElement_parent_elementFactory___block_invoke;
    v23[3] = &unk_1E9F4DE38;
    objc_copyWeak(&v26, &location);
    v24 = v8;
    v25 = v10;
    +[IKTextParser textWithDOMElement:usingParseBlock:](IKTextParser, "textWithDOMElement:usingParseBlock:", v24, v23);
    v20 = objc_claimAutoreleasedReturnValue();
    textParser = v11->_textParser;
    v11->_textParser = (IKTextParser *)v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v12);
  }

  return v11;
}

id __58__IKTextElement_initWithDOMElement_parent_elementFactory___block_invoke(id *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  id *WeakRetained;
  id *v8;
  void *v10;
  void *v11;
  int v12;
  _QWORD *v13;
  IKTextBadgeAttachment *v14;
  IKTextStyleableElementAttachment *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  __int16 v24;

  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (a1[4] != v6 && WeakRetained != 0)
  {
    objc_msgSend(v6, "nodeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("badge"));

    if (v12)
    {
      objc_msgSend(a1[5], "elementForDOMElement:parent:", v6, v8);
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v14 = -[IKTextBadgeAttachment initWithBadgeElement:]([IKTextBadgeAttachment alloc], "initWithBadgeElement:", v13);
      if (v14)
      {
        v15 = (IKTextStyleableElementAttachment *)v14;
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8[29], "addObject:", v15);
        objc_msgSend(v8[30], "addObject:", v13);
        *a4 = 1;
LABEL_14:

        goto LABEL_15;
      }

    }
    else
    {
      objc_msgSend(v6, "nodeName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("span"));

      if (v17)
      {
        objc_msgSend(a1[5], "elementForDOMElement:parent:", v6, v8);
        v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8[31], "addObject:", v13);
        v15 = -[IKTextStyleableElementAttachment initWithTextElement:]([IKTextStyleableElementAttachment alloc], "initWithTextElement:", v13);
        objc_msgSend(v13, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        if (!objc_msgSend(v19, "length"))
        {
          v24 = -4;
          v20 = objc_alloc(MEMORY[0x1E0CB3778]);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v24, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "initWithString:", v21);

          v19 = (void *)v22;
        }
        objc_msgSend(v19, "addAttribute:value:range:", CFSTR("styleableElement"), v15, 0, objc_msgSend(v19, "length"));
        objc_msgSend(v8[29], "addObjectsFromArray:", v13[29]);
        *a4 = 0;
        v10 = (void *)objc_msgSend(v19, "copy");

        goto LABEL_14;
      }
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (IKTextElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  id *v8;
  id v9;
  IKTextElement *v10;
  IKTextElement *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  NSMutableArray *v17;
  NSMutableArray *textBadges;
  NSMutableArray *v19;
  NSMutableArray *textBadgeElements;
  NSMutableArray *v21;
  NSMutableArray *textSpanElements;
  void *v23;
  void *v24;
  uint64_t v25;
  IKTextElement *v26;
  uint64_t v27;
  IKTextParser *v28;
  IKTextElement *v29;
  uint64_t v30;
  IKTextParser *textParser;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(id *, void *, uint64_t, uint64_t);
  void *v36;
  IKTextElement *v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v8 = (id *)a3;
  v9 = a5;
  v41.receiver = self;
  v41.super_class = (Class)IKTextElement;
  v10 = -[IKViewElement initWithPrototypeElement:parent:appDataItem:](&v41, sel_initWithPrototypeElement_parent_appDataItem_, v8, a4, v9);
  v11 = v10;
  if (v10)
  {
    -[IKViewElement binding](v10, "binding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("textContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "valueForPropertyPath:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v15, "description");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = &stru_1E9F50578;
      }
      v29 = (IKTextElement *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
      +[IKTextParser textWithAttributedString:](IKTextParser, "textWithAttributedString:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      textParser = v11->_textParser;
      v11->_textParser = (IKTextParser *)v30;

    }
    else
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      textBadges = v11->_textBadges;
      v11->_textBadges = v17;

      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      textBadgeElements = v11->_textBadgeElements;
      v11->_textBadgeElements = v19;

      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      textSpanElements = v11->_textSpanElements;
      v11->_textSpanElements = v21;

      objc_msgSend(v8[28], "attributedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");
      v25 = objc_msgSend(v23, "length");
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke;
      v36 = &unk_1E9F4DE88;
      v26 = v11;
      v37 = v26;
      v38 = v9;
      v39 = v24;
      v40 = v23;
      v15 = v23;
      v16 = v24;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("styleableElement"), 0, v25, 2, &v33);
      +[IKTextParser textWithAttributedString:](IKTextParser, "textWithAttributedString:", v16, v33, v34, v35, v36);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v26->_textParser;
      v26->_textParser = (IKTextParser *)v27;

      v29 = v37;
    }

    v11->_textStyle = objc_msgSend(v8, "textStyle");
  }

  return v11;
}

void __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD *v8;
  IKTextStyleableElementAttachment *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;

  objc_msgSend(a2, "textElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPrototypeElement:parent:appDataItem:", v7, a1[4], a1[5]);
    objc_msgSend(*((id *)a1[4] + 31), "addObject:", v8);
    v9 = -[IKTextStyleableElementAttachment initWithTextElement:]([IKTextStyleableElementAttachment alloc], "initWithTextElement:", v8);
    objc_msgSend(v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!objc_msgSend(v11, "length"))
    {
      v23 = -4;
      v12 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithString:", v13);

      v11 = (void *)v14;
    }
    objc_msgSend(v11, "addAttribute:value:range:", CFSTR("styleableElement"), v9, 0, objc_msgSend(v11, "length"));
    objc_msgSend(*((id *)a1[4] + 29), "addObjectsFromArray:", v8[29]);
    objc_msgSend(a1[6], "replaceCharactersInRange:withAttributedString:", a3, a4, v11);

  }
  else
  {
    objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CEA050];
    v16 = objc_msgSend(v8, "length");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke_2;
    v17[3] = &unk_1E9F4DE60;
    v18 = a1[4];
    v19 = a1[5];
    v20 = a1[6];
    v21 = a3;
    v22 = a4;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v17);

  }
}

void __61__IKTextElement_initWithPrototypeElement_parent_appDataItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  IKTextBadgeAttachment *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "badge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPrototypeElement:parent:appDataItem:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v11 = -[IKTextBadgeAttachment initWithBadgeElement:]([IKTextBadgeAttachment alloc], "initWithBadgeElement:", v10);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "addObject:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 48), "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 56) + a3, a4, v12);

    }
    v8 = v13;
  }

}

- (IKTextElement)initWithOriginalElement:(id)a3
{
  id v4;
  IKTextElement *v5;
  IKTextElement *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextElement;
  v5 = -[IKViewElement initWithOriginalElement:](&v8, sel_initWithOriginalElement_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_textBadges, *((id *)v4 + 29));
    objc_storeStrong((id *)&v6->_textBadgeElements, *((id *)v4 + 30));
    objc_storeStrong((id *)&v6->_textSpanElements, *((id *)v4 + 31));
    objc_storeStrong((id *)&v6->_textParser, *((id *)v4 + 28));
    v6->_textStyle = *((_QWORD *)v4 + 32);
  }

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IKTextElement;
  -[IKViewElement debugDescription](&v15, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[IKViewElement elementName](self, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("</%@>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "length");
  v8 = v7 - objc_msgSend(v6, "length");
  v9 = objc_msgSend(v6, "length");
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[IKTextParser string](self->_textParser, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIColor)color
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (int64_t)maxLines
{
  void *v3;
  void *v4;
  int64_t v5;

  -[IKViewElement style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IKViewElement style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maxTextLines");

  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (unint64_t)alignment
{
  void *v2;
  unint64_t v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (NSArray)badges
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_textBadges, "copy");
}

- (NSAttributedString)text
{
  return -[IKTextParser attributedString](self->_textParser, "attributedString");
}

- (id)accessibilityText
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKTextElement;
  -[IKViewElement accessibilityText](&v5, sel_accessibilityText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IKTextParser string](self->_textParser, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)appDocumentDidMarkStylesDirty
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)IKTextElement;
  -[IKViewElement appDocumentDidMarkStylesDirty](&v24, sel_appDocumentDidMarkStylesDirty);
  v3 = (void *)-[NSMutableArray mutableCopy](self->_textBadges, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_textSpanElements;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "appDocumentDidMarkStylesDirty");
        objc_msgSend(v3, "removeObjectsInArray:", v9[29]);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "badge", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appDocumentDidMarkStylesDirty");

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v12);
  }

}

- (id)attributedStringWithFont:(id)a3
{
  IKTextParser *textParser;
  id v5;
  void *v6;
  void *v7;

  textParser = self->_textParser;
  v5 = a3;
  -[IKViewElement style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFont:style:](textParser, "attributedStringWithFont:style:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributedStringWithFontHandler:(id)a3
{
  IKTextParser *textParser;
  id v5;
  void *v6;
  void *v7;

  textParser = self->_textParser;
  v5 = a3;
  -[IKViewElement style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFontHandler:style:](textParser, "attributedStringWithFontHandler:style:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributedStringWithFontHandler:(id)a3 defaultAttributes:(id *)a4
{
  IKTextParser *textParser;
  id v7;
  void *v8;
  void *v9;

  textParser = self->_textParser;
  v7 = a3;
  -[IKViewElement style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFontHandler:style:defaultAttributes:](textParser, "attributedStringWithFontHandler:style:defaultAttributes:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  IKTextParser *textParser;
  id v9;
  id v10;
  void *v11;
  void *v12;

  textParser = self->_textParser;
  v9 = a4;
  v10 = a3;
  -[IKViewElement style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFont:foregroundColor:textAlignment:style:](textParser, "attributedStringWithFont:foregroundColor:textAlignment:style:", v10, v9, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  IKTextParser *textParser;
  id v9;
  id v10;
  void *v11;
  void *v12;

  textParser = self->_textParser;
  v9 = a4;
  v10 = a3;
  -[IKViewElement style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFontHandler:style:foregroundColor:textAlignment:](textParser, "attributedStringWithFontHandler:style:foregroundColor:textAlignment:", v10, v11, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 defaultAttributes:(id *)a6
{
  IKTextParser *textParser;
  id v11;
  id v12;
  void *v13;
  void *v14;

  textParser = self->_textParser;
  v11 = a4;
  v12 = a3;
  -[IKViewElement style](self, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser attributedStringWithFontHandler:style:foregroundColor:textAlignment:defaultAttributes:](textParser, "attributedStringWithFontHandler:style:foregroundColor:textAlignment:defaultAttributes:", v12, v13, v11, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)_styleForTagName:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("subtitle")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("description")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("decorationLabel")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("copyright")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("textBox")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSpanElements, 0);
  objc_storeStrong((id *)&self->_textBadgeElements, 0);
  objc_storeStrong((id *)&self->_textBadges, 0);
  objc_storeStrong((id *)&self->_textParser, 0);
}

@end
