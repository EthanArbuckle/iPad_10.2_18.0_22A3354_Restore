@implementation SUUITomatoRatingViewElement

- (SUUITomatoRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUITomatoRatingViewElement *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  SUUITomatoRatingViewElement *v16;
  uint64_t v17;
  SUUIViewElementText *ratingText;
  _QWORD v20[4];
  SUUITomatoRatingViewElement *v21;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUITomatoRatingViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v22, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v9->_tomatoRating = v11;

    objc_msgSend(v8, "getAttribute:", CFSTR("freshness"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("certified")))
      {
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("fresh")))
          goto LABEL_9;
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("rotten")))
          goto LABEL_11;
LABEL_13:
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __72__SUUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
        v20[3] = &unk_2511F7328;
        v16 = v9;
        v21 = v16;
        +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, v20);
        v17 = objc_claimAutoreleasedReturnValue();
        ratingText = v16->_ratingText;
        v16->_ratingText = (SUUIViewElementText *)v17;

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("certified"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (!v14)
      {
        if (v9->_tomatoRating >= 0.6)
        {
LABEL_9:
          v15 = 1;
LABEL_12:
          v9->_freshness = v15;
          goto LABEL_13;
        }
LABEL_11:
        v15 = 2;
        goto LABEL_12;
      }
    }
    v9->_freshness = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

id __72__SUUITomatoRatingViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;

  if (!_block_invoke_sRatingFormatter)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v7 = (void *)_block_invoke_sRatingFormatter;
    _block_invoke_sRatingFormatter = (uint64_t)v6;

    objc_msgSend((id)_block_invoke_sRatingFormatter, "setNumberStyle:", 3);
    objc_msgSend((id)_block_invoke_sRatingFormatter, "setMaximumFractionDigits:", 0);
  }
  *a4 = 0;
  v8 = objc_alloc(MEMORY[0x24BDD16E0]);
  LODWORD(v9) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288);
  v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
  objc_msgSend((id)_block_invoke_sRatingFormatter, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUITomatoRatingViewElement *v4;
  void *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = (SUUITomatoRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITomatoRatingViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_freshness = -[SUUITomatoRatingViewElement freshness](v4, "freshness");
    -[SUUITomatoRatingViewElement tomatoRating](v4, "tomatoRating");
    self->_tomatoRating = v7;
  }

  return v6;
}

- (int64_t)freshness
{
  return self->_freshness;
}

- (float)tomatoRating
{
  return self->_tomatoRating;
}

- (SUUIViewElementText)ratingText
{
  return self->_ratingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingText, 0);
}

@end
