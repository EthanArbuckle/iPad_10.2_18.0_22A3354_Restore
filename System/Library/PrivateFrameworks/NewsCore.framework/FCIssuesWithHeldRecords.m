@implementation FCIssuesWithHeldRecords

FCIssue *__FCIssuesWithHeldRecords_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FCIssue *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "channelTagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_safeObjectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    v11 = -[FCIssue initWithIssueRecord:assetManager:interestToken:sourceChannel:]([FCIssue alloc], "initWithIssueRecord:assetManager:interestToken:sourceChannel:", v5, *(_QWORD *)(a1 + 40), v6, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
