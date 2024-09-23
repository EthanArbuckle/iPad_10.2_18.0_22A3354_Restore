@implementation CNNameListBuilder

- (CNNameListBuilder)initWithDelegate:(id)a3
{
  id v4;
  CNNameListBuilder *v5;
  CNNameListBuilder *v6;
  CNNameListBuilder *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNNameListBuilder;
  v5 = -[CNNameListBuilder init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)build
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "countOfNamesForBuilder:", self);

  +[_CNComposeAddressConcatenator defaultRecipientListConcatenator](_CNComposeAddressConcatenator, "defaultRecipientListConcatenator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __26__CNNameListBuilder_build__block_invoke;
  v11[3] = &unk_1E62BF600;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__CNNameListBuilder_build__block_invoke_2;
  v10[3] = &unk_1E62BF370;
  objc_msgSend(v5, "commaSeparatedAddressListWithAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", v4, 0, v11, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNNameListBuilder shouldStripEllipses](self, "shouldStripEllipses"))
  {
    if (build_cn_once_token_1 != -1)
      dispatch_once(&build_cn_once_token_1, &__block_literal_global_5);
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", build_cn_once_object_1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

id __26__CNNameListBuilder_build__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "builder:nameAtIndex:", *(_QWORD *)(a1 + 32), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __26__CNNameListBuilder_build__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(WeakRetained, "builder:isValidLengthOfString:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

void __26__CNNameListBuilder_build__block_invoke_3()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("…"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)build_cn_once_object_1;
  build_cn_once_object_1 = v0;

}

- (BOOL)shouldStripEllipses
{
  return self->_shouldStripEllipses;
}

- (void)setShouldStripEllipses:(BOOL)a3
{
  self->_shouldStripEllipses = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
