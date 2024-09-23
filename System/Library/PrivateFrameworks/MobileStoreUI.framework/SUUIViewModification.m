@implementation SUUIViewModification

- (SUUIViewModification)initWithViewReusePool:(id)a3
{
  id v5;
  SUUIViewModification *v6;
  SUUIViewModification *v7;
  NSMutableArray *v8;
  NSMutableArray *views;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIViewModification;
  v6 = -[SUUIViewModification init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewPool, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    views = v7->_views;
    v7->_views = v8;

  }
  return v7;
}

- (id)addReusableViewWithReuseIdentifier:(id)a3
{
  void *v4;

  -[SUUIViewReusePool dequeueReusableViewWithReuseIdentifier:](self->_viewPool, "dequeueReusableViewWithReuseIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray addObject:](self->_views, "addObject:", v4);
  return v4;
}

- (void)addView:(id)a3
{
  -[NSMutableArray addObject:](self->_views, "addObject:", a3);
}

- (void)setTextProperties:(id)a3 forView:(id)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *allViewTextProperties;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_allViewTextProperties)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
    allViewTextProperties = self->_allViewTextProperties;
    self->_allViewTextProperties = v7;

  }
  v9 = self->_allViewTextProperties;
  if (v10)
    -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v10, v6);
  else
    -[NSMapTable removeObjectForKey:](v9, "removeObjectForKey:", v6);

}

- (NSMapTable)allViewTextProperties
{
  return self->_allViewTextProperties;
}

- (NSArray)views
{
  return &self->_views->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_viewPool, 0);
}

- (id)addBadgeViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "badgeType") != 1)
  {
    objc_msgSend(v8, "resourceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v16)
    {
      SUUIImageWithResourceName(v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v9, "requestIdentifierForViewElement:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v9, "resourceLoader");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "cachedResourceForRequestIdentifier:", objc_msgSend(v19, "unsignedIntegerValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11
            && (objc_msgSend(v20, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v19, "unsignedIntegerValue")) & 1) == 0)
          {
            objc_msgSend(v9, "loadTemplatedImageForBadgeElement:reason:", v8, 1);
          }

        }
        else
        {
          objc_msgSend(v9, "loadTemplatedImageForBadgeElement:reason:", v8, 1);
          v11 = 0;
        }

        goto LABEL_15;
      }
      objc_msgSend(v8, "fallbackImage");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v17;
LABEL_15:
    -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BBE8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityLabel:", v21);

    objc_msgSend(v12, "setImage:", v11);
    objc_msgSend(v8, "size");
    objc_msgSend(v12, "setImageSize:");
    objc_msgSend(v8, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v23);

    objc_msgSend(v12, "setUserInteractionEnabled:", 0);
    goto LABEL_16;
  }
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayout:", v11);
  objc_msgSend(v12, "setStringTreatment:", 1);
  objc_msgSend(v8, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ikBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTreatmentColor:", v15);

LABEL_16:
  return v12;
}

- (id)addBarRatingWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;

  v7 = a5;
  v8 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BB48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratingValue");
  objc_msgSend(v9, "setRatingValue:");
  objc_msgSend(v8, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setTintColor:", v12);
  objc_msgSend(v7, "clientContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SUUIUserInterfaceIdiom(v13) != 1;

  objc_msgSend(v9, "setBarRatingStyle:", v14);
  return v9;
}

- (id)addButtonWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  SUUIButtonBorderStyle *v18;
  void *v19;
  SUUIButtonBorderStyle *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _BOOL8 v70;
  void *v71;
  void *v72;
  void *v73;
  int64_t v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  SUUIButtonBorderStyle *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "buttonViewType");
  switch(v10)
  {
    case 0:
    case 8:
    case 10:
    case 11:
    case 13:
      v11 = objc_msgSend(v8, "buttonViewSubType");
      if (v11 == 1)
      {
        -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BD48);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nonToggledText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNonToggledTitle:", v13);

        objc_msgSend(v8, "toggledText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setToggledTitle:", v14);

        v15 = v12;
        v16 = v15;
      }
      else
      {
        -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120A8C8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      if (v10 == 13)
        v17 = 7;
      else
        v17 = 0;
      objc_msgSend(v16, "setButtonType:", v17);
      v18 = [SUUIButtonBorderStyle alloc];
      objc_msgSend(v8, "style");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SUUIButtonBorderStyle initWithElementStyle:](v18, "initWithElementStyle:", v19);

      objc_msgSend(v16, "setBorderStyle:", v20);
      objc_msgSend(v9, "labelLayoutCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitleLayout:", v22);

      v23 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v16, "setEnabled:", v23);
      v24 = 0.4;
      if ((_DWORD)v23)
        v24 = 1.0;
      objc_msgSend(v16, "setAlpha:", v24);
      if (v11 == 1)
      {
        objc_msgSend(v8, "toggleItemIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
        {
          +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setToggleItemIdentifier:", v25);
          objc_msgSend(v26, "itemForIdentifier:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (!v27 || (objc_msgSend(v27, "toggled") & 0x80000000) != 0)
            v29 = objc_msgSend(v8, "isToggled");
          else
            v29 = objc_msgSend(v28, "toggled") == 1;
          objc_msgSend(v15, "setToggled:animated:", v29, 0);

        }
        else
        {
          objc_msgSend(v15, "setToggled:animated:", objc_msgSend(v8, "isToggled"), 0);
        }

      }
      v30 = v16;
      goto LABEL_48;
    case 1:
    case 7:
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120A8C8);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBorderStyle:", 0);
      if (v10 == 1)
        v31 = 3;
      else
        v31 = 4;
      objc_msgSend(v30, "setButtonType:", v31);
      objc_msgSend(v9, "labelLayoutCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTitleLayout:", v33);

      v34 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v30, "setEnabled:", v34);
      v35 = 0.4;
      if ((_DWORD)v34)
        v35 = 1.0;
      objc_msgSend(v30, "setAlpha:", v35);
      break;
    case 2:
    case 3:
      -[SUUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BC28);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setElement:", v8);
      goto LABEL_24;
    case 4:
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BC28);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      objc_msgSend(v8, "buyButtonDescriptor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientContext");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v37, v36, v38, 0);

      -[SUUIViewModification _styleItemOfferButton:forElement:context:](self, "_styleItemOfferButton:forElement:context:", v30, v8, v9);
      break;
    case 5:
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BBC8);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "imageView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "additionalImageView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonImage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v41, v9);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setContents:");
      objc_msgSend(v9, "sizeForImageElement:", v41);
      v114 = v39;
      objc_msgSend(v39, "setImageSize:");
      objc_msgSend(v8, "additionalButtonImage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v42, v9);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setContents:", v43);
      objc_msgSend(v9, "sizeForImageElement:", v42);
      objc_msgSend(v40, "setImageSize:");
      objc_msgSend(v41, "accessibilityText");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        objc_msgSend(v8, "accessibilityText");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "setAccessibilityLabel:", v44);
      v45 = objc_msgSend(v8, "isEnabled");
      v46 = 0.4;
      if ((_DWORD)v45)
        v46 = 1.0;
      objc_msgSend(v30, "setAlpha:", v46);
      objc_msgSend(v30, "setEnabled:", v45);
      objc_msgSend(v8, "style");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithStyle(v47, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTintColor:", v48);

      if (objc_msgSend(v8, "isBigHitButton"))
      {
        objc_msgSend(v30, "setUseBigHitTarget:", 1);
        objc_msgSend(v8, "bigHitSize");
        v50 = -v49;
        v51 = v49 == 0.0;
        v52 = -15.0;
        if (!v51)
          v52 = v50;
        objc_msgSend(v30, "setBigHitInsets:", v52, v52, v52, v52);
      }
      else
      {
        objc_msgSend(v30, "setUseBigHitTarget:", 0);
      }

      break;
    case 6:
      if (objc_msgSend(v8, "buttonViewSubType") == 1)
      {
        -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BD48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nonToggledText");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setNonToggledTitle:", v54);

        objc_msgSend(v8, "toggledText");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setToggledTitle:", v55);

        objc_msgSend(v53, "setAutoIncrement:", objc_msgSend(v8, "autoIncrementCount"));
        v15 = v53;
        v56 = v15;
      }
      else
      {
        -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120A8C8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      objc_msgSend(v56, "setBorderStyle:", 0);
      v74 = +[SUUIStyledButton buttonTypeForElement:](SUUIStyledButton, "buttonTypeForElement:", v8);
      if (objc_msgSend(v8, "isBigHitButton"))
      {
        objc_msgSend(v8, "bigHitSize");
        v76 = -v75;
        v51 = v75 == 0.0;
        v77 = -15.0;
        if (!v51)
          v77 = v76;
        objc_msgSend(v56, "setBigHitInsets:", v77, v77, v77, v77);
        objc_msgSend(v56, "setUseBigHitTarget:", 1);
      }
      objc_msgSend(v56, "setButtonType:", v74);
      objc_msgSend(v9, "labelLayoutCache");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setTitleLayout:", v79);

      objc_msgSend(v8, "style");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "elementPadding");
      objc_msgSend(v56, "setButtonPadding:");

      v81 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v56, "setEnabled:", v81);
      v82 = 0.4;
      if ((_DWORD)v81)
        v82 = 1.0;
      objc_msgSend(v56, "setAlpha:", v82);
      objc_msgSend(v56, "imageView");
      v20 = (SUUIButtonBorderStyle *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonImage");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      __RequestImage(v83, v9);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v15, "setElement:", v8);
        objc_msgSend(v8, "toggleItemIdentifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v85, "length"))
        {
          objc_msgSend(v15, "setToggleItemIdentifier:", v85);
          objc_msgSend(v113, "itemForIdentifier:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v86 = 0;
        }
        if ((objc_msgSend(v86, "toggled") & 0x80000000) != 0)
          v111 = objc_msgSend(v8, "isToggled");
        else
          v111 = objc_msgSend(v86, "count");
        v115 = v86;
        objc_msgSend(v8, "additionalButtonImage");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96)
        {
          objc_msgSend(v15, "setToggleButtonType:", 1);
          __RequestImage(v96, v9);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v15, "setToggleButtonType:", 0);
          v97 = 0;
        }
        if (objc_msgSend(v8, "autoIncrementCount") && objc_msgSend(v115, "toggled") == -1)
        {
          v105 = v20;
          v106 = v85;
          objc_msgSend(v15, "titleLayout");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "attributedString");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "string");
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          v110 = v102;
          if (objc_msgSend(v102, "length"))
          {
            if (addButtonWithElement_width_context__sOnceToken != -1)
              dispatch_once(&addButtonWithElement_width_context__sOnceToken, &__block_literal_global_27);
            v85 = v106;
            v20 = v105;
            objc_msgSend((id)addButtonWithElement_width_context__sNumberFormatter, "numberFromString:", v110);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            if (v103)
            {
              v107 = v103;
              v111 = objc_msgSend(v103, "integerValue");
              v103 = v107;
            }

          }
          else
          {
            v20 = v105;
            v85 = v106;
          }
          if (v111 < 1)
          {
            objc_msgSend(v15, "setButtonTitleText:", CFSTR(" "));
            objc_msgSend(v15, "setAutoIncrementCount:", v111);
          }
          else
          {
            objc_msgSend(v15, "setAutoIncrementCount:", v111);
            objc_msgSend(v15, "setButtonTitleText:", v110);
          }
          objc_msgSend(v15, "setAutoIncrementCount:", v111);
          objc_msgSend(v15, "setToggled:", objc_msgSend(v8, "isToggled"));

        }
        else if (objc_msgSend(v8, "autoIncrementCount"))
        {
          v108 = v96;
          objc_msgSend(v15, "setToggled:", objc_msgSend(v115, "toggled") == 1);
          if (v111 < 1)
          {
            objc_msgSend(v15, "setButtonTitleText:", CFSTR(" "));
          }
          else
          {
            objc_msgSend(v115, "toggledString");
            v98 = v84;
            v99 = v85;
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setButtonTitleText:", v100);

            v85 = v99;
            v84 = v98;
          }
          v96 = v108;
        }
        else
        {
          objc_msgSend(v15, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        objc_msgSend(v15, "setNonToggledContents:", v84);
        objc_msgSend(v15, "setToggledContents:", v97);
        if (objc_msgSend(v15, "isToggled"))
          v104 = v97;
        else
          v104 = v84;
        -[SUUIButtonBorderStyle setContents:](v20, "setContents:", v104);

      }
      else
      {
        -[SUUIButtonBorderStyle setContents:](v20, "setContents:", v84);
      }
      objc_msgSend(v9, "sizeForImageElement:", v83);
      -[SUUIButtonBorderStyle setImageSize:](v20, "setImageSize:");
      v30 = v56;

LABEL_48:
      break;
    case 9:
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120A8C8);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAlpha:", 1.0);
      objc_msgSend(v30, "setBorderStyle:", 0);
      v57 = 1;
      objc_msgSend(v30, "setButtonType:", 1);
      objc_msgSend(v9, "labelLayoutCache");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTitleLayout:", v59);

      -[SUUIViewModification _itemStateForButton:](self, "_itemStateForButton:", v8);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buyButtonDescriptor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v61, v60, v62, 0);

      if ((objc_msgSend(v30, "isUsingItemOfferAppearance") & 1) == 0)
        v57 = objc_msgSend(v8, "isEnabled");
      objc_msgSend(v30, "setEnabled:", v57);
      objc_msgSend(v8, "style");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithStyle(v63, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "setTintColor:", v64);
      goto LABEL_70;
    case 12:
      -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BC48);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sizeVariant");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("large"));

      objc_msgSend(v30, "setStyle:", v66);
      objc_msgSend(v8, "playItemIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isIndeterminate"))
        objc_msgSend(v30, "endIndeterminateAnimation");
      objc_msgSend(v30, "setShowOnDemand:", objc_msgSend(v8, "showOnDemand"));
      objc_msgSend(v30, "showPlayIndicator:", 1);
      objc_msgSend(v30, "setPlayItemIdentifier:", v60);
      objc_msgSend(v30, "setItemIdentifier:", objc_msgSend(v60, "longLongValue"));
      objc_msgSend(v30, "setBigHitInsets:", -15.0, -15.0, -15.0, -15.0);
      objc_msgSend(v8, "style");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "ikBackgroundColor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = objc_msgSend(v68, "colorType");
      if (v69 == 2)
      {
        v72 = 0;
        v73 = 0;
      }
      else
      {
        if (v69 == 3)
        {
          v70 = objc_msgSend(v68, "gradientDirectionType") == 2;
          objc_msgSend(v68, "gradientColors");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setBackgroundGradientColors:withGradientType:", v71, v70);
          v72 = 0;
          v73 = 0;
          v69 = 4;
        }
        else
        {
          objc_msgSend(v68, "color");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "style");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "ikColor");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "color");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = 1;
        }

      }
      objc_msgSend(v30, "setItemIdentifier:", objc_msgSend(v60, "longLongValue"));
      objc_msgSend(v30, "setBackgroundType:", v69);
      if (v72)
        objc_msgSend(v30, "setControlForegroundColor:", v72);
      if (v73)
        objc_msgSend(v30, "setControlColor:", v73);
      objc_msgSend(v30, "setElement:", v8);
      objc_msgSend(v30, "setEnabled:", objc_msgSend(v8, "isEnabled"));
      objc_msgSend(v30, "setDisabledButSelectable:", objc_msgSend(v8, "isDisabledButSelectable"));
      objc_msgSend(v30, "setHidden:", objc_msgSend(v30, "showOnDemand"));

LABEL_70:
      break;
    default:
      v30 = 0;
      break;
  }
  objc_msgSend(v8, "attributes");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("privacy"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v90 = v89;
  else
    v90 = 0;
  objc_msgSend(v30, "setAdPrivacyData:", v90);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = v30;
    objc_msgSend(v8, "buttonTitleStyle");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v92;
    if (!v92)
    {
      objc_msgSend(v8, "style");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v93, "ikColor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setUsesTintColor:", objc_msgSend(v94, "colorType") == 1);

    if (!v92)
  }

  return v30;
}

uint64_t __80__SUUIViewModification_SUUIViewElementView__addButtonWithElement_width_context___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)addButtonWithElement_width_context__sNumberFormatter;
  addButtonWithElement_width_context__sNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)addButtonWithElement_width_context__sNumberFormatter, "setNumberStyle:", 1);
}

- (id)addDividerWithElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x251201708);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 || objc_msgSend(v6, "dividerType") == 3)
  {
    if (objc_msgSend(v6, "dividerType") == 3)
    {

      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setDividerColor:", v11);

  return v8;
}

- (id)addHeaderViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120AAC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addHorizontalListWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BB68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementPadding");
  objc_msgSend(v10, "setContentInset:");

  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v10;
}

- (id)addHorizontalLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BBA8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addImageDeckViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120AB08);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addImageGridViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120AB28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addImageViewWithElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v27;
  _BYTE v28[48];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageTreatment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SUUIImageTreatmentForString(v9);

  if (v10 == 13)
  {
    -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x25120BC68, v6, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "transform");
      objc_msgSend(v11, "setTransform:", v28);
    }
    SUUIViewElementPlainColorWithStyle(v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v13);

    objc_msgSend(v8, "elementPadding");
    objc_msgSend(v11, "setImagePadding:");
    objc_msgSend(v8, "ikBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v14);

  }
  else if (v10 == 7)
  {
    -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x25120BCC8, v6, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "borderDrawingCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderDrawingCache:", v12);

  }
  else
  {
    objc_msgSend(v6, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x25120BAE8, v6, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      objc_msgSend(v11, "reloadWithViewElement:width:context:", v6, v7);
    }
    else
    {
      objc_msgSend(v6, "shadowOffset");
      if (v18 == *MEMORY[0x24BDBF148] && v17 == *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x25120BBE8, v6, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "layerShadowOpacity");
        if (v20 != 0.0)
        {
          objc_msgSend(v11, "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setMasksToBounds:", 0);

          objc_msgSend(v11, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowOpacity");
          objc_msgSend(v22, "setShadowOpacity:");

          objc_msgSend(v11, "layer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowOffset");
          objc_msgSend(v23, "setShadowOffset:");

        }
        objc_msgSend(v6, "layerShadowRadius");
        if (v24 != 0.0)
        {
          objc_msgSend(v11, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "layerShadowRadius");
          objc_msgSend(v25, "setShadowRadius:");

        }
      }
      else
      {
        -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x25120BC08, v6, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContentMode:", 4);
      }
    }
    if (v8)
    {
      objc_msgSend(v8, "transform");
      objc_msgSend(v11, "setTransform:", &v27);
    }
    SUUIViewElementPlainColorWithStyle(v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);
  }

  return v11;
}

- (id)addImageViewWithVideoElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "thumbnailImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEnabled");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v8, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewModification _addImageViewWithReuseIdentifier:viewElement:context:](self, "_addImageViewWithReuseIdentifier:viewElement:context:", 0x251200FC8, v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "transform");
      objc_msgSend(v11, "setTransform:", &v13);
    }

  }
  else
  {
    -[SUUIViewModification addImageViewWithElement:context:](self, "addImageViewWithElement:context:", v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)addLabelViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayout:", v11);
  objc_msgSend(v12, "setContainsLinks:", objc_msgSend(v8, "containsLinks"));
  if (objc_msgSend(v8, "containsLinks"))
  {
    objc_msgSend(v8, "linkDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLinkDelegate:", v13);

  }
  objc_msgSend(v12, "setStringTreatment:", 0);
  objc_msgSend(v12, "setTreatmentColor:", 0);
  objc_msgSend(v8, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ikColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColorFollowsTintColor:", objc_msgSend(v15, "colorType") == 1);

  if (v11)
  {
    objc_msgSend(v8, "trailingBadges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "badgeImageLoader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "badges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v27 = v16;
      v28 = v9;
      LOBYTE(v21) = 0;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (v21)
          {
            v21 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "image");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v25 == 0;

          }
          objc_msgSend(v17, "loadImageForBadge:layout:reason:", v24, v11, 1, v27, v28);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
      v16 = v27;
      v9 = v28;
      if (v21)
        objc_msgSend(v17, "connectStringView:", v12);
    }

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v12, "setRequiredBadges:", v16);
  objc_msgSend(v12, "setBadgePlacement:", objc_msgSend(v8, "badgePlacement") == 1);

  return v12;
}

- (id)addLabelViewWithOrdinalElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a5, "labelLayoutCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutForWidth:viewElement:", (uint64_t)a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewModification _attributedStringViewForLayout:](self, "_attributedStringViewForLayout:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayout:", v10);
  objc_msgSend(v11, "setStringTreatment:", 0);
  objc_msgSend(v11, "setTreatmentColor:", 0);
  objc_msgSend(v8, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColorFollowsTintColor:", objc_msgSend(v13, "colorType") == 1);

  return v11;
}

- (id)addMenuButtonWithTitleItem:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120A8C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderStyle:", 0);
  objc_msgSend(v10, "setButtonType:", 2);
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  objc_msgSend(v8, "labelLayoutCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "layoutForWidth:viewElement:", (uint64_t)a4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTitleLayout:", v12);
  objc_msgSend(v10, "setUsesTintColor:", 1);
  return v10;
}

- (id)addOfferViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x2512025E8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addStackListViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120B048);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementPadding");
  objc_msgSend(v10, "setContentInset:");

  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v10;
}

- (id)addStackItemViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x251208348);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementPadding");
  objc_msgSend(v10, "setContentInset:");

  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);
  return v10;
}

- (id)addReviewListTitleViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BC88);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addResponseViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120AE88);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addStarRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120B088);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setElementSpacing:", 3);
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addStarRatingControlViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BCE8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addTabularLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BD08);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)addTextViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a3;
  v9 = a5;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120BD28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editorialLayoutForLabelElement:width:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bodyTextLayoutForOrientation:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  objc_msgSend(v10, "setEnabled:", 0);
  objc_msgSend(v10, "setFixedWidthTextFrame:", objc_msgSend(v12, "textFrame"));
  objc_msgSend(v8, "moreButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMoreButtonTitle:", v13);

  v14 = objc_msgSend(v12, "requiresTruncation");
  v15 = 0;
  if (v14)
  {
    if ((objc_msgSend(v9, "isEditorialLayoutExpanded:", v11) & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v8, "isEnabled");
  }
  objc_msgSend(v10, "setUserInteractionEnabled:", v15);
  if ((objc_msgSend(v9, "isEditorialLayoutExpanded:", v11) & 1) != 0)
    v16 = 0;
  else
    v16 = objc_msgSend(v8, "numberOfLines");
  objc_msgSend(v10, "setNumberOfVisibleLines:", v16);

  return v10;
}

- (id)addTomatoRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", 0x25120B0A8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v9, v8, a4);

  return v10;
}

- (id)_addImageViewWithReuseIdentifier:(id)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v8 = a5;
  v9 = a4;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(v9, "isEnabled"));
  __RequestImage(v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContents:", v12);
  objc_msgSend(v8, "sizeForImageElement:", v9);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v10, "setImageSize:", v14, v16);
  return v10;
}

- (id)_itemStateForButton:(id)a3
{
  id v3;
  uint64_t v4;
  SUUIStoreIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "itemIdentifier");
  objc_msgSend(v3, "storeIdentifier");
  v5 = (SUUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v4)
    v5 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", v4);
  if (v5)
  {
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateForItemWithStoreIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v3, "buyButtonDescriptor"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "canPersonalizeUsingItemState:", v7),
          v8,
          v9))
    {
      v10 = v7;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_styleItemOfferButton:(id)a3 forElement:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  objc_msgSend(a5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setTintColor:", v10);
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    do
    {
      v14 = v13;
      objc_msgSend(v13, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ikBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIViewElementPlainColorWithIKColor(v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v13 && !v17);
  }
  else
  {
    v17 = 0;
    v13 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "cloudTintColorForBackgroundColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCloudTintColor:", v18);

  objc_msgSend(v20, "setElement:", v12);
  objc_msgSend(v20, "setEnabled:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v20, "setDisabledButSelectable:", objc_msgSend(v12, "isDisabledButSelectable"));
  objc_msgSend(v12, "badgeResourceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUniversal:", objc_msgSend(v19, "isEqualToString:", CFSTR("plus")));

}

- (id)_attributedStringViewForLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v10;
  __CFString **v11;

  objc_msgSend(a3, "edgeInsetsForShadow");
  v10 = v7 == *(double *)(MEMORY[0x24BEBE158] + 16)
     && v6 == *(double *)(MEMORY[0x24BEBE158] + 24)
     && v4 == *MEMORY[0x24BEBE158]
     && v5 == *(double *)(MEMORY[0x24BEBE158] + 8);
  v11 = SUUIViewReuseAttributedStringIdentifier;
  if (!v10)
    v11 = SUUIViewReuseAttributedStringWrapperIdentifier;
  -[SUUIViewModification addReusableViewWithReuseIdentifier:](self, "addReusableViewWithReuseIdentifier:", *v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
