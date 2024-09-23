@implementation MSAccountToEmailProvider

+ (int64_t)accountStatisticsKindToIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (accountStatisticsKindToIdentifier__onceToken != -1)
    dispatch_once(&accountStatisticsKindToIdentifier__onceToken, &__block_literal_global);
  objc_msgSend((id)accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = (int)objc_msgSend(v4, "intValue");
  else
    v6 = 0;

  return v6;
}

void __62__MSAccountToEmailProvider_accountStatisticsKindToIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("aol");
  v2[1] = CFSTR("icloud");
  v3[0] = &unk_1E7177AB0;
  v3[1] = &unk_1E7177AC8;
  v2[2] = CFSTR("hotmail");
  v2[3] = CFSTR("exchange");
  v3[2] = &unk_1E7177AE0;
  v3[3] = &unk_1E7177AF8;
  v2[4] = CFSTR("gmail");
  v2[5] = CFSTR("netease");
  v3[4] = &unk_1E7177B10;
  v3[5] = &unk_1E7177B28;
  v2[6] = CFSTR("qq");
  v2[7] = CFSTR("yahoo");
  v3[6] = &unk_1E7177B40;
  v3[7] = &unk_1E7177B58;
  v2[8] = CFSTR("imap");
  v2[9] = CFSTR("pop");
  v3[8] = &unk_1E7177B70;
  v3[9] = &unk_1E7177B88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping;
  accountStatisticsKindToIdentifier___statisticsKindToAccountTypeMapping = v0;

}

@end
