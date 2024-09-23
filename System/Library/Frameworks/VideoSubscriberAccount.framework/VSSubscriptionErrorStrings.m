@implementation VSSubscriptionErrorStrings

void __VSSubscriptionErrorStrings_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[8];
  _QWORD v19[10];

  v19[8] = *MEMORY[0x1E0C80C00];
  v18[0] = &unk_1E93CC5A0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_ACCESS_NOT_GRANTED"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v18[1] = &unk_1E93CC5B8;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_UNSUPPORTED_PROVIDER"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  v18[2] = &unk_1E93CC5D0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_USER_CANCELLED"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  v18[3] = &unk_1E93CC5E8;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_SERVICE_TEMPORARILY_UNAVAILABLE"), 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v1;
  v18[4] = &unk_1E93CC600;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_PROVIDER_REJECTED"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = &unk_1E93CC618;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_INVALID_VERIFICATION_TOKEN"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v5;
  v18[6] = &unk_1E93CC630;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_REJECTED"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v7;
  v18[7] = &unk_1E93CC648;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_UNSUPPORTED"), 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)VSSubscriptionErrorStrings_errorStrings;
  VSSubscriptionErrorStrings_errorStrings = v10;

}

@end
