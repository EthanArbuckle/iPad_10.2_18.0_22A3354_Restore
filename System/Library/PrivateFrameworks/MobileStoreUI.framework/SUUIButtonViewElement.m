@implementation SUUIButtonViewElement

- (SUUIButtonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUUIButtonViewElement *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSString *sizeVariant;
  uint64_t v18;
  NSString *confirmationText;
  void *v20;
  SUUIStoreIdentifier *v21;
  SUUIStoreIdentifier *storeIdentifier;
  uint64_t v23;
  SUUIViewElementText *buttonText;
  uint64_t v25;
  NSString *bundleIdentifier;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *badgeResourceName;
  void *v31;
  int v32;
  void *v33;
  __CFString *v34;
  NSString *variantIdentifier;
  uint64_t v36;
  uint64_t v37;
  NSString *playItemIdentifier;
  uint64_t v39;
  NSString *toggledText;
  uint64_t v41;
  NSString *nonToggledText;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSString *toggleItemIdentifier;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  _QWORD v69[5];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  objc_super v74;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v74.receiver = self;
  v74.super_class = (Class)SUUIButtonViewElement;
  v12 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v74, sel_initWithDOMElement_parent_elementFactory_, v9, v10, v11);
  if (!v12)
    goto LABEL_53;
  v62 = v11;
  v63 = v10;
  objc_msgSend(v9, "getAttribute:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12->_buttonViewType = SUUIButtonViewTypeForString(v13);

  objc_msgSend(v9, "getAttribute:", CFSTR("sub-type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("toggle"));

  v12->_buttonViewSubType = v15;
  objc_msgSend(v9, "getAttribute:", CFSTR("size-variant"));
  v16 = objc_claimAutoreleasedReturnValue();
  sizeVariant = v12->_sizeVariant;
  v12->_sizeVariant = (NSString *)v16;

  objc_msgSend(v9, "getAttribute:", CFSTR("confirm-text"));
  v18 = objc_claimAutoreleasedReturnValue();
  confirmationText = v12->_confirmationText;
  v12->_confirmationText = (NSString *)v18;

  objc_msgSend(v9, "getAttribute:", CFSTR("data-content-id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v12->_itemIdentifier = objc_msgSend(v20, "longLongValue");

  v21 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", v12->_itemIdentifier);
  storeIdentifier = v12->_storeIdentifier;
  v12->_storeIdentifier = v21;

  objc_storeStrong((id *)&v12->_xml, a3);
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __66__SUUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
  v69[3] = &unk_2511F4B90;
  v69[4] = &v70;
  -[SUUIViewElement enumerateChildrenUsingBlock:](v12, "enumerateChildrenUsingBlock:", v69);
  if (!*((_BYTE *)v71 + 24))
  {
    -[SUUIButtonViewElement _parseButtonText](v12, "_parseButtonText");
    v23 = objc_claimAutoreleasedReturnValue();
    buttonText = v12->_buttonText;
    v12->_buttonText = (SUUIViewElementText *)v23;

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("data-feed-url"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "length"))
    -[SUUIStoreIdentifier setPodcastFeedURLIdentifier:](v12->_storeIdentifier, "setPodcastFeedURLIdentifier:", v66);
  objc_msgSend(v9, "getAttribute:", CFSTR("bundle-id"));
  v25 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v12->_bundleIdentifier;
  v12->_bundleIdentifier = (NSString *)v25;

  if (-[NSString length](v12->_bundleIdentifier, "length"))
    -[SUUIStoreIdentifier setBundleIdentifier:](v12->_storeIdentifier, "setBundleIdentifier:", v12->_bundleIdentifier);
  objc_msgSend(v9, "getAttribute:", CFSTR("selected"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v12->_selected = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v9, "getAttribute:", CFSTR("badge"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v64);
    objc_msgSend(v28, "host");
    v29 = objc_claimAutoreleasedReturnValue();
    badgeResourceName = v12->_badgeResourceName;
    v12->_badgeResourceName = (NSString *)v29;

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("disabled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v31;
  if (objc_msgSend(v31, "length"))
    v32 = objc_msgSend(v31, "BOOLValue") ^ 1;
  else
    LOBYTE(v32) = -1;
  v12->_enabled = v32;
  objc_msgSend(v9, "getAttribute:", CFSTR("data-type"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAttribute:", CFSTR("data-variant"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
  {
    v68 = v33;
    if ((-[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("redownload")) & 1) != 0
      || (-[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("get")) & 1) != 0
      || (-[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("preorder")) & 1) != 0
      || (-[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("purchased")) & 1) != 0)
    {

    }
    else
    {
      v60 = -[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("update"));

      if (!v60)
        goto LABEL_22;
    }
    v68 = CFSTR("buy");
  }
  else
  {
    v68 = 0;
  }

LABEL_22:
  if (objc_msgSend(v67, "length") && !objc_msgSend(v67, "isEqualToString:", CFSTR("PLUS")))
  {
    if (v68 && v67)
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_%@"), v68, v67, v61);
      variantIdentifier = v12->_variantIdentifier;
      v12->_variantIdentifier = (NSString *)v36;
      goto LABEL_30;
    }
  }
  else
  {

    v67 = 0;
  }
  if (v68)
  {
    v34 = v68;
    variantIdentifier = v12->_variantIdentifier;
    v12->_variantIdentifier = &v34->isa;
LABEL_30:

  }
  if (v12->_buttonViewType == 12)
  {
    objc_msgSend(v9, "getAttribute:", CFSTR("data-content-id"));
    v37 = objc_claimAutoreleasedReturnValue();
    playItemIdentifier = v12->_playItemIdentifier;
    v12->_playItemIdentifier = (NSString *)v37;

  }
  if (v12->_buttonViewSubType == 1)
  {
    objc_msgSend(v9, "getAttribute:", CFSTR("toggled-text"));
    v39 = objc_claimAutoreleasedReturnValue();
    toggledText = v12->_toggledText;
    v12->_toggledText = (NSString *)v39;

    objc_msgSend(v9, "getAttribute:", CFSTR("non-toggled-text"));
    v41 = objc_claimAutoreleasedReturnValue();
    nonToggledText = v12->_nonToggledText;
    v12->_nonToggledText = (NSString *)v41;

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("big-hit-size"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v65, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v65, "floatValue");
    v12->_bigHitSize = v43;
  }
  objc_msgSend(v9, "getAttribute:", CFSTR("big-hit"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "length"))
  {
    objc_msgSend(v44, "lowercaseString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_bigHitButton = objc_msgSend(v45, "isEqualToString:", CFSTR("true"));

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("show-on-demand"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "length"))
  {
    objc_msgSend(v46, "lowercaseString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_showOnDemand = objc_msgSend(v47, "isEqualToString:", CFSTR("true"));

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("toggled"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "length"))
  {
    objc_msgSend(v48, "lowercaseString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_toggled = objc_msgSend(v49, "isEqualToString:", CFSTR("true"));

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("toggle-id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "length"))
  {
    objc_msgSend(v9, "getAttribute:", CFSTR("toggle-id"));
    v51 = objc_claimAutoreleasedReturnValue();
    toggleItemIdentifier = v12->_toggleItemIdentifier;
    v12->_toggleItemIdentifier = (NSString *)v51;

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("auto-increment-count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "length"))
  {
    objc_msgSend(v53, "lowercaseString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_autoIncrementCount = objc_msgSend(v54, "isEqualToString:", CFSTR("true"));

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("disabled-but-selectable"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "length"))
  {
    objc_msgSend(v55, "lowercaseString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_disabledButSelectable = objc_msgSend(v56, "isEqualToString:", CFSTR("true"));

  }
  objc_msgSend(v9, "getAttribute:", CFSTR("suppress-cloud-restore"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "length"))
  {
    objc_msgSend(v57, "lowercaseString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_suppressCloudRestore = objc_msgSend(v58, "isEqualToString:", CFSTR("true"));

  }
  _Block_object_dispose(&v70, 8);
  v11 = v62;
  v10 = v63;
LABEL_53:

  return v12;
}

void __66__SUUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 138)
  {
    objc_msgSend(v7, "elementName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("span"));

    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (void)dealloc
{
  IKDOMElement *xml;
  void *v4;
  IKDOMElement *v5;
  objc_super v6;

  xml = self->_xml;
  if (xml)
  {
    -[SUUIButtonViewElement appDocument](self, "appDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementTextDeadlockFix(xml, v4);

    v5 = self->_xml;
    self->_xml = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIButtonViewElement;
  -[SUUIViewElement dealloc](&v6, sel_dealloc);
}

- (SUUIImageViewElement)buttonImage
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SUUIImageViewElement)additionalButtonImage
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[3];
  char v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__97;
  v9 = __Block_byref_object_dispose__97;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SUUIButtonViewElement_additionalButtonImage__block_invoke;
  v4[3] = &unk_2511FC628;
  v4[4] = v11;
  v4[5] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return (SUUIImageViewElement *)v2;
}

void __46__SUUIButtonViewElement_additionalButtonImage__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;

  if (objc_msgSend(a2, "elementType") == 49)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v6 + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
    else
    {
      *(_BYTE *)(v6 + 24) = 1;
    }
  }
}

- (SUUIViewElementText)buttonText
{
  SUUIViewElementText *buttonText;
  SUUIViewElementText *v4;
  SUUIViewElementText *v5;

  buttonText = self->_buttonText;
  if (!buttonText)
  {
    -[SUUIButtonViewElement _parseButtonText](self, "_parseButtonText");
    v4 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();
    v5 = self->_buttonText;
    self->_buttonText = v4;

    buttonText = self->_buttonText;
  }
  return buttonText;
}

- (IKViewElementStyle)buttonTitleStyle
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "elementName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("span")),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (IKViewElementStyle *)v6;
}

- (SUUIBuyButtonDescriptor)buyButtonDescriptor
{
  unint64_t v3;
  SUUIBuyButtonDescriptor *v4;
  uint64_t v5;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  SUUIBuyButtonDescriptor *v7;
  SUUIBuyButtonDescriptor *v8;
  SUUIBuyButtonDescriptor *v9;
  void *v10;
  void *v11;
  SUUIBuyButtonDescriptor *v12;
  void *v13;
  SUUIBuyButtonDescriptor *v14;
  void *v15;
  SUUIBuyButtonDescriptor *v16;
  void *v17;

  v3 = -[SUUIButtonViewElement buttonViewType](self, "buttonViewType") - 2;
  if (v3 <= 7 && ((0x87u >> v3) & 1) != 0)
  {
    v5 = qword_241EFCFB0[v3];
    buyButtonDescriptor = self->_buyButtonDescriptor;
    if (!buyButtonDescriptor)
    {
      v7 = objc_alloc_init(SUUIBuyButtonDescriptor);
      v8 = self->_buyButtonDescriptor;
      self->_buyButtonDescriptor = v7;

      buyButtonDescriptor = self->_buyButtonDescriptor;
    }
    -[SUUIBuyButtonDescriptor setButtonType:](buyButtonDescriptor, "setButtonType:", v5);
    v9 = self->_buyButtonDescriptor;
    -[SUUIButtonViewElement buttonText](self, "buttonText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBuyButtonDescriptor setButtonText:](v9, "setButtonText:", v11);

    v12 = self->_buyButtonDescriptor;
    -[SUUIButtonViewElement confirmationText](self, "confirmationText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBuyButtonDescriptor setConfirmationText:](v12, "setConfirmationText:", v13);

    -[SUUIBuyButtonDescriptor setElementType:](self->_buyButtonDescriptor, "setElementType:", -[SUUIButtonViewElement elementType](self, "elementType"));
    -[SUUIBuyButtonDescriptor setItemIdentifier:](self->_buyButtonDescriptor, "setItemIdentifier:", -[SUUIButtonViewElement itemIdentifier](self, "itemIdentifier"));
    v14 = self->_buyButtonDescriptor;
    -[SUUIButtonViewElement storeIdentifier](self, "storeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBuyButtonDescriptor setStoreIdentifier:](v14, "setStoreIdentifier:", v15);

    v16 = self->_buyButtonDescriptor;
    -[SUUIButtonViewElement variantIdentifier](self, "variantIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBuyButtonDescriptor setVariantIdentifier:](v16, "setVariantIdentifier:", v17);

    -[SUUIBuyButtonDescriptor setShouldSuppressCloudRestore:](self->_buyButtonDescriptor, "setShouldSuppressCloudRestore:", -[SUUIButtonViewElement suppressCloudRestore](self, "suppressCloudRestore"));
    v4 = self->_buyButtonDescriptor;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIButtonViewElement *v4;
  SUUIButtonViewElement *v5;
  SUUIButtonViewElement *v6;
  NSString *v7;
  NSString *badgeResourceName;
  SUUIViewElementText *v9;
  SUUIViewElementText *buttonText;
  SUUIBuyButtonDescriptor *v11;
  SUUIBuyButtonDescriptor *buyButtonDescriptor;
  NSString *v13;
  NSString *confirmationText;
  NSString *v15;
  NSString *nonToggledText;
  SUUIStoreIdentifier *v17;
  SUUIStoreIdentifier *storeIdentifier;
  NSString *v19;
  NSString *toggledText;
  NSString *v21;
  NSString *variantIdentifier;
  NSString *v23;
  void *bundleIdentifier;
  objc_super v26;

  v4 = (SUUIButtonViewElement *)a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIButtonViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v26, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SUUIButtonViewElement badgeResourceName](v4, "badgeResourceName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    badgeResourceName = self->_badgeResourceName;
    self->_badgeResourceName = v7;

    -[SUUIButtonViewElement buttonText](v4, "buttonText");
    v9 = (SUUIViewElementText *)objc_claimAutoreleasedReturnValue();
    buttonText = self->_buttonText;
    self->_buttonText = v9;

    self->_buttonViewType = -[SUUIButtonViewElement buttonViewType](v4, "buttonViewType");
    -[SUUIButtonViewElement buyButtonDescriptor](v4, "buyButtonDescriptor");
    v11 = (SUUIBuyButtonDescriptor *)objc_claimAutoreleasedReturnValue();
    buyButtonDescriptor = self->_buyButtonDescriptor;
    self->_buyButtonDescriptor = v11;

    -[SUUIButtonViewElement confirmationText](v4, "confirmationText");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    confirmationText = self->_confirmationText;
    self->_confirmationText = v13;

    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SUUIButtonViewElement itemIdentifier](v4, "itemIdentifier");
    -[SUUIButtonViewElement nonToggledText](v4, "nonToggledText");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    nonToggledText = self->_nonToggledText;
    self->_nonToggledText = v15;

    self->_selected = -[SUUIButtonViewElement isSelected](v4, "isSelected");
    -[SUUIButtonViewElement storeIdentifier](v4, "storeIdentifier");
    v17 = (SUUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v17;

    -[SUUIButtonViewElement toggledText](v4, "toggledText");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    toggledText = self->_toggledText;
    self->_toggledText = v19;

    -[SUUIButtonViewElement variantIdentifier](v4, "variantIdentifier");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    variantIdentifier = self->_variantIdentifier;
    self->_variantIdentifier = v21;

    -[SUUIButtonViewElement bundleIdentifier](v4, "bundleIdentifier");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v23;
LABEL_6:

    goto LABEL_7;
  }
  if (v5 != self)
  {
    -[SUUIButtonViewElement buyButtonDescriptor](self, "buyButtonDescriptor");
    bundleIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIButtonViewElement setBuyButtonDescriptor:](v4, "setBuyButtonDescriptor:", bundleIdentifier);
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIButtonViewElement;
  -[SUUIButtonViewElement description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Type: %ld, ID: %lld, Variant: %@"), v4, self->_buttonViewType, self->_itemIdentifier, self->_variantIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)elementType
{
  unint64_t v2;

  v2 = self->_buttonViewType - 2;
  if (v2 > 7)
    return 12;
  else
    return qword_241EFCFF0[v2];
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIButtonViewElement;
  return -[SUUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (id)personalizationLibraryItems
{
  SUUILibraryItem *v3;
  void *v4;

  if (self->_itemIdentifier)
  {
    v3 = objc_alloc_init(SUUILibraryItem);
    -[SUUILibraryItem setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_parseButtonText
{
  IKDOMElement *xml;
  _QWORD v4[5];

  xml = self->_xml;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUUIButtonViewElement__parseButtonText__block_invoke;
  v4[3] = &unk_2511F7328;
  v4[4] = self;
  +[IKTextParser textWithDOMElement:usingParseBlock:](SUUIViewElementText, "textWithDOMElement:usingParseBlock:", xml, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__SUUIButtonViewElement__parseButtonText__block_invoke(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "nodeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("span"));

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "getAttribute:", *MEMORY[0x24BE51828]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "elementWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      SUUILabelStringAttributesWithSpanElement(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v6, "textContent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  *a4 = v15 == 0;

  return v15;
}

- (BOOL)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (BOOL)isBigHitButton
{
  return self->_bigHitButton;
}

- (double)bigHitSize
{
  return self->_bigHitSize;
}

- (void)setBuyButtonDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonDescriptor, a3);
}

- (int64_t)buttonViewType
{
  return self->_buttonViewType;
}

- (int64_t)buttonViewSubType
{
  return self->_buttonViewSubType;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (NSString)nonToggledText
{
  return self->_nonToggledText;
}

- (NSString)toggledText
{
  return self->_toggledText;
}

- (NSString)badgeResourceName
{
  return self->_badgeResourceName;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)dataPlaybackId
{
  return self->_dataPlaybackId;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (NSString)sizeVariant
{
  return self->_sizeVariant;
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
}

- (BOOL)suppressCloudRestore
{
  return self->_suppressCloudRestore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeVariant, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentfier, 0);
  objc_storeStrong((id *)&self->_toggledText, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonToggledText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_badgeResourceName, 0);
}

@end
