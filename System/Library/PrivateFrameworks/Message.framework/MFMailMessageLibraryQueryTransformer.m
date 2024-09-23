@implementation MFMailMessageLibraryQueryTransformer

- (MFMailMessageLibraryQueryTransformer)initWithMessagePersistence:(id)a3
{
  id v4;
  MFMailMessageLibraryQueryTransformer *v5;
  MFMessageCriterionConverter *v6;
  MFMessageCriterionConverter *criterionConverter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryQueryTransformer;
  v5 = -[MFMailMessageLibraryQueryTransformer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MFMessageCriterionConverter);
    criterionConverter = v5->_criterionConverter;
    v5->_criterionConverter = v6;

    -[MFMessageCriterionConverter setDelegate:](v5->_criterionConverter, "setDelegate:", v5);
    objc_storeWeak((id *)&v5->_messagePersistence, v4);
  }

  return v5;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MFMailMessageLibraryQueryTransformer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1)
    dispatch_once(&log_onceToken_16, block);
  return (OS_os_log *)(id)log_log_16;
}

void __43__MFMailMessageLibraryQueryTransformer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;

}

- (int64_t)messageCriterionConverter:(id)a3 criterionTypeForKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = a4;
  if (messageCriterionConverter_criterionTypeForKey__onceToken != -1)
    dispatch_once(&messageCriterionConverter_criterionTypeForKey__onceToken, &__block_literal_global_44);
  objc_msgSend((id)messageCriterionConverter_criterionTypeForKey__mapping, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

void __86__MFMailMessageLibraryQueryTransformer_messageCriterionConverter_criterionTypeForKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[24];
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D1DD48];
  v14[0] = *MEMORY[0x1E0D1DFC0];
  v14[1] = v0;
  v15[0] = &unk_1E4F69D48;
  v15[1] = &unk_1E4F69D60;
  v1 = *MEMORY[0x1E0D1DD60];
  v14[2] = *MEMORY[0x1E0D1DDF8];
  v14[3] = v1;
  v15[2] = &unk_1E4F69D78;
  v15[3] = &unk_1E4F69D90;
  v2 = *MEMORY[0x1E0D1DDE0];
  v14[4] = *MEMORY[0x1E0D1DD68];
  v14[5] = v2;
  v15[4] = &unk_1E4F69DA8;
  v15[5] = &unk_1E4F69DC0;
  v3 = *MEMORY[0x1E0D1DE10];
  v14[6] = *MEMORY[0x1E0D1DE18];
  v14[7] = v3;
  v15[6] = &unk_1E4F69DD8;
  v15[7] = &unk_1E4F69DF0;
  v4 = *MEMORY[0x1E0D1DDC0];
  v14[8] = *MEMORY[0x1E0D1DE20];
  v14[9] = v4;
  v15[8] = &unk_1E4F69E08;
  v15[9] = &unk_1E4F69E20;
  v5 = *MEMORY[0x1E0D1DDD0];
  v14[10] = *MEMORY[0x1E0D1DDD8];
  v14[11] = v5;
  v15[10] = &unk_1E4F69E38;
  v15[11] = &unk_1E4F69E50;
  v6 = *MEMORY[0x1E0D1DDE8];
  v14[12] = *MEMORY[0x1E0D1DD50];
  v14[13] = v6;
  v15[12] = &unk_1E4F69E68;
  v15[13] = &unk_1E4F69E80;
  v7 = *MEMORY[0x1E0D1DFB8];
  v14[14] = *MEMORY[0x1E0D1DFC8];
  v14[15] = v7;
  v15[14] = &unk_1E4F69E98;
  v15[15] = &unk_1E4F69EB0;
  v8 = *MEMORY[0x1E0D1DE30];
  v14[16] = *MEMORY[0x1E0D1DE28];
  v14[17] = v8;
  v15[16] = &unk_1E4F69EC8;
  v15[17] = &unk_1E4F69EE0;
  v9 = *MEMORY[0x1E0D1DD98];
  v14[18] = *MEMORY[0x1E0D1DE48];
  v14[19] = v9;
  v15[18] = &unk_1E4F69EF8;
  v15[19] = &unk_1E4F69F10;
  v10 = *MEMORY[0x1E0D1DD88];
  v14[20] = *MEMORY[0x1E0D1DD90];
  v14[21] = v10;
  v15[20] = &unk_1E4F69F28;
  v15[21] = &unk_1E4F69F40;
  v11 = *MEMORY[0x1E0D1DD30];
  v14[22] = *MEMORY[0x1E0D1DE98];
  v14[23] = v11;
  v15[22] = &unk_1E4F69F58;
  v15[23] = &unk_1E4F69F70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 24);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)messageCriterionConverter_criterionTypeForKey__mapping;
  messageCriterionConverter_criterionTypeForKey__mapping = v12;

}

- (id)messageCriterionConverter:(id)a3 expressionForConstantValue:(id)a4 withCriterionType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  if (a5 == 23)
  {
    -[MFMailMessageLibraryQueryTransformer messagePersistence](self, "messagePersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageObjectIDCriterionExpressionForPredicateValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)mailAccountForIdentifier:(id)a3
{
  +[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)criterionForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MFMailMessageLibraryQueryTransformer criterionConverter](self, "criterionConverter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageCriterionFromPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)optionsForQuery:(id)a3
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (optionsForQuery__onceToken != -1)
    dispatch_once(&optionsForQuery__onceToken, &__block_literal_global_33);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v15, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = (void *)optionsForQuery__mapping;
        objc_msgSend(v8, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v11, "unsignedIntegerValue");
          if (objc_msgSend(v8, "ascending"))
            v13 = 1024;
          else
            v13 = 0;
          v4 |= v13 | v12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v4;
}

void __56__MFMailMessageLibraryQueryTransformer_optionsForQuery___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D1DD60];
  v4[0] = *MEMORY[0x1E0D1DD68];
  v4[1] = v0;
  v5[0] = &unk_1E4F69F88;
  v5[1] = &unk_1E4F69FA0;
  v1 = *MEMORY[0x1E0D1DE48];
  v4[2] = *MEMORY[0x1E0D1DE28];
  v4[3] = v1;
  v5[2] = &unk_1E4F69FB8;
  v5[3] = &unk_1E4F69FD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)optionsForQuery__mapping;
  optionsForQuery__mapping = v2;

}

- (MFMessageCriterionConverter)criterionConverter
{
  return self->_criterionConverter;
}

- (void)setCriterionConverter:(id)a3
{
  objc_storeStrong((id *)&self->_criterionConverter, a3);
}

- (EDMessagePersistence)messagePersistence
{
  return (EDMessagePersistence *)objc_loadWeakRetained((id *)&self->_messagePersistence);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_criterionConverter, 0);
}

@end
