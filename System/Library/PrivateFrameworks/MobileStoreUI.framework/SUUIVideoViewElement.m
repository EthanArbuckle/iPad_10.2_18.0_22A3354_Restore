@implementation SUUIVideoViewElement

- (SUUIVideoViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  SUUIVideoViewElement *v10;
  void *v11;
  void *v12;
  SUUIImageViewElement *v13;
  SUUIImageViewElement *thumbnailImage;
  void *v15;
  SUUIImageViewElement *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v8 = a3;
  v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SUUIVideoViewElement;
  v10 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v37, sel_initWithDOMElement_parent_elementFactory_, v8, a4, v9);
  if (!v10)
    goto LABEL_31;
  objc_msgSend(v8, "getAttribute:", CFSTR("playback"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("inline")))
    v10->_playbackStyle = 1;
  -[SUUIViewElement firstChildForElementType:](v10, "firstChildForElementType:", 49);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend(v12, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("video"), 49);
    v13 = -[SUUIImageViewElement initWithDOMElement:parent:elementFactory:]([SUUIImageViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v10, v9);
    thumbnailImage = v10->_thumbnailImage;
    v10->_thumbnailImage = v13;

    -[SUUIImageViewElement URL](v10->_thumbnailImage, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = v10->_thumbnailImage;
      v10->_thumbnailImage = 0;

    }
    v17 = (void *)objc_opt_class();
    objc_msgSend(v17, "registerClass:forElementName:elementType:", objc_opt_class(), CFSTR("video"), 152);
  }
  objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
    v19 = objc_msgSend(v18, "BOOLValue") ^ 1;
  else
    v19 = -1;
  v34 = v18;
  v10->_enabled = v19;
  objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
    v10->_itemIdentifier = objc_msgSend(v20, "longLongValue");
  objc_msgSend(v8, "getAttribute:", CFSTR("data-metrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v36 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;
    v23 = v22;
    if (v22)
    {
      v24 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v22, "dataUsingEncoding:", 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "JSONObjectWithData:options:error:", v25, 0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
  }
  else
  {
    v23 = 0;
  }
  v26 = 0;
LABEL_18:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = 0;
    goto LABEL_22;
  }
  v27 = v26;
  v28 = v27;
  if (!v27)
  {
LABEL_22:
    v29 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v27, "objectForKey:", CFSTR("kind"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("movie")) & 1) != 0)
  {
    v31 = 1;
  }
  else
  {
    v32 = objc_msgSend(v30, "isEqualToString:", CFSTR("tvEpisode"));
    v31 = 2;
    if (!v32)
      v31 = 0;
  }
  v10->_kind = v31;

LABEL_31:
  return v10;
}

- (NSArray)assets
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__SUUIVideoViewElement_assets__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __30__SUUIVideoViewElement_assets__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SUUIImageViewElement)thumbnailImage
{
  SUUIImageViewElement *thumbnailImage;

  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    return thumbnailImage;
  -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
  return (SUUIImageViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIVideoViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SUUIVideoViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIVideoViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SUUIVideoViewElement itemIdentifier](v4, "itemIdentifier");
    self->_playbackStyle = -[SUUIVideoViewElement playbackStyle](v4, "playbackStyle");
    objc_storeStrong((id *)&self->_thumbnailImage, v4->_thumbnailImage);
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIVideoViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end
