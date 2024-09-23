@implementation HFCompoundLocalizableStringKey

- (HFCompoundLocalizableStringKey)initWithFormat:(id)a3 localizableStrings:(id)a4
{
  id v7;
  id v8;
  id v9;
  HFCompoundLocalizableStringKey *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (qword_1F03ED350 != -1)
    dispatch_once(&qword_1F03ED350, &__block_literal_global_69_2);
  v9 = (id)qword_1F03ED358;
  v14.receiver = self;
  v14.super_class = (Class)HFCompoundLocalizableStringKey;
  v10 = -[HFLocalizableStringKey initWithKey:argumentKeys:](&v14, sel_initWithKey_argumentKeys_, v9, 0);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_format, a3);
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_localizableStrings, v12);
    if (!v11)

  }
  return v10;
}

void __68__HFCompoundLocalizableStringKey_initWithFormat_localizableStrings___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1F03ED358;
  qword_1F03ED358 = (uint64_t)&stru_1EA741FF8;

}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HFCompoundLocalizableStringKey format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCompoundLocalizableStringKey localizableStrings](self, "localizableStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HFCompoundLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke;
  v12[3] = &unk_1EA738E78;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_stringWithFormat:arguments:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __67__HFCompoundLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStringWithArgumentBlock:", *(_QWORD *)(a1 + 32));
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSMutableArray)localizableStrings
{
  return self->_localizableStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizableStrings, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
