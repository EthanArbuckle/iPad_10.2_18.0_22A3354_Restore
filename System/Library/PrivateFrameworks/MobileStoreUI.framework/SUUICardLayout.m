@implementation SUUICardLayout

+ (BOOL)allowsViewElement:(id)a3
{
  return 1;
}

+ (id)layoutWithCardViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v21 = 0;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("programmed"));

  if ((v9 & 1) != 0)
  {
    v10 = objc_opt_class();
    v19[3] = v10;
    if (!v10)
      goto LABEL_6;
  }
  else if (!v19[3])
  {
LABEL_6:
    v19[3] = objc_opt_class();
    goto LABEL_7;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__SUUICardLayout_layoutWithCardViewElement_context___block_invoke;
  v17[3] = &unk_2511F4B90;
  v17[4] = &v18;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v17);
  if (!v19[3])
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v5, "firstChildForElementType:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init((Class)v19[3]);
  v13 = (void *)v12[1];
  v12[1] = v5;
  v14 = v5;

  v15 = (void *)v12[2];
  v12[2] = v6;

  *((_BYTE *)v12 + 24) = v11 != 0;
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __52__SUUICardLayout_layoutWithCardViewElement_context___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "allowsViewElement:", a2);
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (id)attributedStringForButton:(id)a3
{
  return 0;
}

- (id)attributedStringForLabel:(id)a3
{
  return 0;
}

- (double)bottomInsetForLastViewElement:(id)a3 width:(double)a4
{
  double result;

  result = 15.0;
  if (!self->_hasBackground)
    return 0.0;
  return result;
}

- (double)horizontalContentInset
{
  return 0.0;
}

- (int64_t)layoutStyle
{
  return 0;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a3;
  v7 = objc_msgSend(v6, "elementType");
  if (v7 <= 65)
  {
    if (v7 == 7)
    {
      objc_msgSend(v6, "firstChildForElementType:", 49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", v15, a4);
      v13 = v16;
      v14 = v17;

      goto LABEL_17;
    }
    if (v7 == 50 && -[SUUICardViewElement isAdCard](self->_cardViewElement, "isAdCard"))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_16:
        v13 = 0.0;
        v14 = 5.0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceIdiom");

      if (!v10)
        goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (v7 == 108)
  {
    v13 = *MEMORY[0x24BDBF148];
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
    goto LABEL_17;
  }
  if (v7 != 66)
  {
LABEL_11:
    -[SUUIViewElementLayoutContext sizeForViewElement:width:](self->_layoutContext, "sizeForViewElement:width:", v6, a4);
    goto LABEL_12;
  }
  +[SUUIHorizontalLockupView sizeThatFitsWidth:viewElement:context:](SUUIHorizontalLockupView, "sizeThatFitsWidth:viewElement:context:", v6, self->_layoutContext, a4);
LABEL_12:
  v13 = v11;
  v14 = v12;
LABEL_17:

  v18 = v13;
  v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)topInsetForViewElement:(id)a3 previousViewElement:(id)a4 width:(double)a5
{
  id v7;
  id v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = 12.0;
    if (objc_msgSend(v7, "elementType") == 131)
      goto LABEL_8;
    v10 = objc_msgSend(v8, "elementType") == 131;
    v11 = 10.0;
    v12 = 12.0;
  }
  else
  {
    v10 = !self->_hasBackground;
    v11 = 15.0;
    v12 = 0.0;
  }
  if (v10)
    v9 = v12;
  else
    v9 = v11;
LABEL_8:

  return v9;
}

- (SUUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (SUUICardViewElement)cardViewElement
{
  return self->_cardViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_cardViewElement, 0);
}

@end
