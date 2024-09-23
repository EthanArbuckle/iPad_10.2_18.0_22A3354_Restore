@implementation CNDDonorExtension

- (CNDDonorExtension)initWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNDDonorExtension *v7;

  v4 = a3;
  +[CNDonationLoggerProvider defaultProvider](CNDonationLoggerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNDDonorExtension initWithExtension:logger:](self, "initWithExtension:logger:", v4, v6);
  return v7;
}

- (CNDDonorExtension)initWithExtension:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  CNDDonorExtension *v9;
  CNDDonorExtension *v10;
  CNDDonorExtension *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNDDonorExtension;
  v9 = -[CNDDonorExtension init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDDonorExtension extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  CNDDonorExtension *v20;
  id v21;
  _QWORD v22[5];

  v6 = a3;
  v7 = a4;
  -[CNDDonorExtension logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willRenewDonation:", v6);

  -[CNDDonorExtension extension](self, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cnd_requestWithInputItems:", MEMORY[0x24BDBD1A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke;
  v22[3] = &unk_24C2365B0;
  v22[4] = self;
  objc_msgSend(v10, "flatMap:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_2;
  v18[3] = &unk_24C236600;
  v13 = v6;
  v19 = v13;
  v20 = self;
  v21 = v7;
  v14 = v7;
  objc_msgSend(v12, "addSuccessBlock:", v18);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_4;
  v16[3] = &unk_24C236330;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v12, "addFailureBlock:", v16);

}

id __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionContextForUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE19280];
  objc_msgSend(v6, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_3;
  v6[3] = &unk_24C2365D8;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "renewExpirationDateForDonatedValue:acknowledgementHandler:", v4, v6);

}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = (void *)a1[4];
  v6 = a3;
  v10 = a2;
  objc_msgSend(v5, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (a2)
    objc_msgSend(v7, "didRenewDonation:untilDate:", v9, v10);
  else
    objc_msgSend(v7, "didExpireDonation:withError:", v9, v6);

  (*(void (**)(void))(a1[6] + 16))();
}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "couldNotRenewDonation:error:", *(_QWORD *)(a1 + 40), v4);

}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[5];

  -[CNDDonorExtension logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willRedonateValuesWithReason:", a3);

  -[CNDDonorExtension extension](self, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cnd_requestWithInputItems:", MEMORY[0x24BDBD1A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke;
  v12[3] = &unk_24C2365B0;
  v12[4] = self;
  objc_msgSend(v7, "flatMap:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_2;
  v11[3] = &unk_24C236628;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v9, "addSuccessBlock:", v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_3;
  v10[3] = &unk_24C236650;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend(v9, "addFailureBlock:", v10);

}

id __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_extensionContextForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_auxiliaryConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE19280];
  objc_msgSend(v9, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "redonateAllValuesWithReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didRedonateValuesWithReason:", *(_QWORD *)(a1 + 40));

}

void __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "couldNotRedonateValuesWithReason:error:", *(_QWORD *)(a1 + 40), v4);

}

- (NSExtension)extension
{
  return self->_extension;
}

- (CNDonationExtensionLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
