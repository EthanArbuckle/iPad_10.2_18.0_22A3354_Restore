@implementation CNPRUISPosterTitleStyleAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  CNPRUISPosterTitleStyleAttributes *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD aBlock[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = MEMORY[0x1E0C809B0];
    v9 = (void *)MEMORY[0x1E0D13A40];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke;
    v28[3] = &unk_1E2050050;
    v28[4] = self;
    v29 = v7;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_2;
    aBlock[3] = &unk_1E2050050;
    aBlock[4] = self;
    v10 = v29;
    v27 = v10;
    v11 = _Block_copy(aBlock);
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_3;
    v24[3] = &unk_1E2050050;
    v24[4] = self;
    v12 = v10;
    v25 = v12;
    v13 = _Block_copy(v24);
    v18 = v8;
    v19 = 3221225472;
    v20 = __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_4;
    v21 = &unk_1E2050050;
    v22 = self;
    v23 = v12;
    v14 = v12;
    v15 = _Block_copy(&v18);
    v16 = objc_msgSend(v9, "isObject:equalToOther:withBlocks:", self, v14, v28, v11, v13, v15, 0, v18, v19, v20, v21, v22);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CNPRUISPosterTitleStyleAttributes)initWithPosterTitleStyleAttributes:(id)a3
{
  id v5;
  CNPRUISPosterTitleStyleAttributes *v6;
  CNPRUISPosterTitleStyleAttributes *v7;
  CNPRUISPosterTitleStyleAttributes *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPRUISPosterTitleStyleAttributes;
  v6 = -[CNPRUISPosterTitleStyleAttributes init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wrappedPosterTitleStyleAttributes, a3);
    v8 = v7;
  }

  return v7;
}

- (id)titleColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PRUISPosterTitleStyleAttributes titleColor](self->_wrappedPosterTitleStyleAttributes, "titleColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)titleFont
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PRUISPosterTitleStyleAttributes titleFont](self->_wrappedPosterTitleStyleAttributes, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (unint64_t)preferredTitleLayout
{
  return -[PRUISPosterTitleStyleAttributes preferredTitleLayout](self->_wrappedPosterTitleStyleAttributes, "preferredTitleLayout");
}

- (unint64_t)preferredTitleAlignment
{
  return -[PRUISPosterTitleStyleAttributes preferredTitleAlignment](self->_wrappedPosterTitleStyleAttributes, "preferredTitleAlignment");
}

- (PRUISPosterTitleStyleAttributes)wrappedPosterTitleStyleAttributes
{
  return self->_wrappedPosterTitleStyleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedPosterTitleStyleAttributes, 0);
}

uint64_t __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "titleColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "titleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

BOOL __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "preferredTitleLayout");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "preferredTitleLayout");
}

BOOL __45__CNPRUISPosterTitleStyleAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "preferredTitleAlignment");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "preferredTitleAlignment");
}

+ (id)attributesFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNPRUISPosterConfigurationUtilities titleStyleAttributesForCNConfiguration:error:](CNPRUISPosterConfigurationUtilities, "titleStyleAttributesForCNConfiguration:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)attributesForCNConfiguration:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[CNPRUISPosterConfigurationUtilities titleStyleAttributesForCNConfiguration:error:](CNPRUISPosterConfigurationUtilities, "titleStyleAttributesForCNConfiguration:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    CNUILogPosters();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch attributes for configuration: %@", buf, 0xCu);

    }
  }

  return v3;
}

@end
