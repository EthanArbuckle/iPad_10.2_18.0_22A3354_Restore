@implementation MDMAnalyticsSendCommandEvent

id __MDMAnalyticsSendCommandEvent_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[9];
  _QWORD v19[10];

  v19[9] = *MEMORY[0x24BDAC8D0];
  v2 = (id)*MEMORY[0x24BE60EC0];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)v4;
  }
  else
  {
    v5 = &unk_24EB77A98;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    v6 = *MEMORY[0x24BE60EB8];
  v7 = *MEMORY[0x24BE60E48];
  v18[0] = *MEMORY[0x24BE60E40];
  v18[1] = v7;
  v19[0] = v6;
  v19[1] = v5;
  v8 = *MEMORY[0x24BE60E50];
  v19[2] = v2;
  v9 = *MEMORY[0x24BE60ED0];
  v18[2] = v8;
  v18[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v10;
  v18[4] = *MEMORY[0x24BE60E78];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  v18[5] = *MEMORY[0x24BE60E98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  v18[6] = *MEMORY[0x24BE60EA0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 51));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v13;
  v18[7] = *MEMORY[0x24BE60EB0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v14;
  v18[8] = *MEMORY[0x24BE60EA8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 53));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
