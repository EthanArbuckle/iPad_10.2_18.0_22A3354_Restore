@implementation ICNotesGetNoteMentionedByActivity

void __ICNotesGetNoteMentionedByActivity_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D63F58];
    v16 = *MEMORY[0x1E0D63F70];
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = *(void **)(a1 + 32);
    v9 = a2;
    objc_msgSend(v8, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_1EA7E9860;
    if (v9)
      v13 = v9;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Can't find note with userInfo: %@, %@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, a3, v15);
    **(_QWORD **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();

  }
}

@end
