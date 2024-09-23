@implementation HFItemSection

uint64_t __28__HFItemSection_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

uint64_t __28__HFItemSection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributedHeaderTitle");
}

uint64_t __28__HFItemSection_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "headerTitle");
}

uint64_t __49__HFItemSection_filterSections_toDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __28__HFItemSection_na_identity__block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v7, "appendCharacteristic:", &__block_literal_global_45);
  v1 = (id)objc_msgSend(v7, "appendCharacteristic:withRole:", &__block_literal_global_46_3, 2);
  v2 = (id)objc_msgSend(v7, "appendCharacteristic:withRole:", &__block_literal_global_47_1, 2);
  v3 = (id)objc_msgSend(v7, "appendCharacteristic:withRole:", &__block_literal_global_48, 2);
  v4 = (id)objc_msgSend(v7, "appendCharacteristic:withRole:", &__block_literal_global_49_0, 2);
  objc_msgSend(v7, "build");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_236;
  _MergedGlobals_236 = v5;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED378EF0 != -1)
    dispatch_once(&qword_1ED378EF0, &__block_literal_global_42_0);
  return (NAIdentity *)(id)_MergedGlobals_236;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  -[HFItemSection headerTitle](self, "headerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("headerTitle"));

  -[HFItemSection headerSecondaryText](self, "headerSecondaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("headerSecondaryText"));

  -[HFItemSection attributedHeaderTitle](self, "attributedHeaderTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("attributedHeaderTitle"));

  -[HFItemSection headerAccessoryButtonTitle](self, "headerAccessoryButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("headerAccessoryButtonTitle"));

  -[HFItemSection headerAccessoryButtonDelegate](self, "headerAccessoryButtonDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("headerAccessoryButtonDelegate"));

  v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection hideAccessoryButton](self, "hideAccessoryButton"), CFSTR("hideAccessoryButton"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection hideHeaderText](self, "hideHeaderText"), CFSTR("hideHeaderText"));
  v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFItemSection forceShowHeaderTitle](self, "forceShowHeaderTitle"), CFSTR("forceShowHeaderTitle"));
  -[HFItemSection footerTitle](self, "footerTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:withName:", v19, CFSTR("footerTitle"));

  -[HFItemSection attributedFooterTitle](self, "attributedFooterTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:withName:", v21, CFSTR("attributedFooterTitle"));

  -[HFItemSection items](self, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendObject:withName:", v23, CFSTR("items"));

  -[HFItemSection userInfo](self, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "appendObject:withName:", v25, CFSTR("userInfo"));

  objc_msgSend(v3, "build");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

- (id)_createCopyMutable:(BOOL)a3
{
  __objc2_class **v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = off_1EA722240;
  if (!a3)
    v4 = off_1EA7220C8;
  v5 = objc_alloc(*v4);
  -[HFItemSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  -[HFItemSection headerTitle](self, "headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderTitle:", v8);

  -[HFItemSection headerSecondaryText](self, "headerSecondaryText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderSecondaryText:", v9);

  -[HFItemSection attributedHeaderTitle](self, "attributedHeaderTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedHeaderTitle:", v10);

  -[HFItemSection headerAccessoryButtonTitle](self, "headerAccessoryButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderAccessoryButtonTitle:", v11);

  -[HFItemSection headerAccessoryButtonDelegate](self, "headerAccessoryButtonDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderAccessoryButtonDelegate:", v12);

  objc_msgSend(v7, "setHideAccessoryButton:", -[HFItemSection hideAccessoryButton](self, "hideAccessoryButton"));
  objc_msgSend(v7, "setHideHeaderText:", -[HFItemSection hideHeaderText](self, "hideHeaderText"));
  objc_msgSend(v7, "setForceShowHeaderTitle:", -[HFItemSection forceShowHeaderTitle](self, "forceShowHeaderTitle"));
  -[HFItemSection footerTitle](self, "footerTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFooterTitle:", v13);

  -[HFItemSection attributedFooterTitle](self, "attributedFooterTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedFooterTitle:", v14);

  -[HFItemSection items](self, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v15);

  -[HFItemSection userInfo](self, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfo:", v16);

  return v7;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (NSAttributedString)attributedFooterTitle
{
  return self->_attributedFooterTitle;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

id __49__HFItemSection_filterSections_toDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__HFItemSection_filterSections_toDisplayedItems___block_invoke_2;
  v14[3] = &unk_1EA7295B8;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_filter:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v3, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    v9 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v9, "setItems:", v5);

    v3 = v9;
  }
  objc_msgSend(v3, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (NSArray)items
{
  if (self->_items)
    return self->_items;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)hideHeaderText
{
  return self->_hideHeaderText;
}

- (BOOL)hideAccessoryButton
{
  return self->_hideAccessoryButton;
}

- (NSString)headerSecondaryText
{
  return self->_headerSecondaryText;
}

- (NSString)headerAccessoryButtonTitle
{
  return self->_headerAccessoryButtonTitle;
}

- (HFItemSectionAccessoryButtonHeaderDelegate)headerAccessoryButtonDelegate
{
  return (HFItemSectionAccessoryButtonHeaderDelegate *)objc_loadWeakRetained((id *)&self->_headerAccessoryButtonDelegate);
}

- (BOOL)forceShowHeaderTitle
{
  return self->_forceShowHeaderTitle;
}

- (NSAttributedString)attributedHeaderTitle
{
  return self->_attributedHeaderTitle;
}

- (void)setFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setHideHeaderText:(BOOL)a3
{
  self->_hideHeaderText = a3;
}

- (void)setHideAccessoryButton:(BOOL)a3
{
  self->_hideAccessoryButton = a3;
}

- (void)setHeaderSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHeaderAccessoryButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHeaderAccessoryButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headerAccessoryButtonDelegate, a3);
}

- (void)setForceShowHeaderTitle:(BOOL)a3
{
  self->_forceShowHeaderTitle = a3;
}

- (void)setAttributedHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAttributedFooterTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  -[HFItemSection _createCopyMutable:](self, "_createCopyMutable:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_attributedFooterTitle, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_destroyWeak((id *)&self->_headerAccessoryButtonDelegate);
  objc_storeStrong((id *)&self->_headerAccessoryButtonTitle, 0);
  objc_storeStrong((id *)&self->_attributedHeaderTitle, 0);
  objc_storeStrong((id *)&self->_headerSecondaryText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HFItemSection)initWithIdentifier:(id)a3
{
  id v5;
  HFItemSection *v6;
  uint64_t v7;
  NSString *identifier;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemSection.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HFItemSection;
  v6 = -[HFItemSection init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

  }
  return v6;
}

+ (id)filterSections:(id)a3 toDisplayedItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__HFItemSection_filterSections_toDisplayedItems___block_invoke;
  v9[3] = &unk_1EA72D070;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HFItemSection)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithIdentifier_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemSection.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemSection init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  -[HFItemSection _createCopyMutable:](self, "_createCopyMutable:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultItemComparator
{
  return &__block_literal_global_51;
}

uint64_t __38__HFItemSection_defaultItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = -1;
  else
    v9 = v8 != 0;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);

  return v9;
}

+ (id)itemResultManualSortComparator
{
  return &__block_literal_global_40;
}

uint64_t __47__HFItemSection_itemResultManualSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("manualSortKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("manualSortKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = -1;
  else
    v9 = v8 != 0;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __28__HFItemSection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "footerTitle");
}

uint64_t __28__HFItemSection_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributedFooterTitle");
}

@end
