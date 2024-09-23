@implementation RBSProcessStateHasForegroundAssertion

void ____RBSProcessStateHasForegroundAssertion_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = objc_msgSend(v19, "type");
  if (v5 == 3)
  {
    v14 = objc_msgSend(v19, "reason");
    if (v14 == 7 || v14 == 10008 || v14 == 9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v19, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v19, "reason"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "explanation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@(%@):%@"), v9, v10, v13);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      goto LABEL_9;
    }
  }
  else if (v5 == 2)
  {
    objc_msgSend(v19, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.siri:IntentStartupGrant"));

    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v19, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "explanation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
LABEL_9:

      *a3 = 1;
    }
  }

}

@end
