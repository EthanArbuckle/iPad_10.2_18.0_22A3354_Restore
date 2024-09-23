@implementation ICNAAccountReportToDevice

void __48___ICNAAccountReportToDevice_accountTypeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ICASAccountTypeItemData *v11;
  ICASAccountType *v12;
  uint64_t v13;
  ICASAccountType *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  ICASAccountTypeItemData *v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "countOfNotesByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = [ICASAccountTypeItemData alloc];
  v12 = [ICASAccountType alloc];
  v13 = objc_msgSend(v7, "integerValue");

  v14 = -[ICASAccountType initWithAccountType:](v12, "initWithAccountType:", v13);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v15, "numberWithInteger:", ICNARoundTo2SigFigsInt(v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v10));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ICASAccountTypeItemData initWithAccountType:countOfAccounts:countOfNotes:](v11, "initWithAccountType:countOfAccounts:countOfNotes:", v14, v17, v18);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v19);
}

@end
