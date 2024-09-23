@implementation DKAudioOutputMonitor

uint64_t __29___DKAudioOutputMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "primaryValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
    goto LABEL_4;
  objc_msgSend(v4, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B028], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "metadata");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B028], "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = objc_msgSend(v11, "isEqual:", v14);
  if ((v12 & 1) != 0)
    v15 = 0;
  else
LABEL_4:
    v15 = -1;

  return v15;
}

void __56___DKAudioOutputMonitor_onAudioRouteChangeNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "portType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB16D0]))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "portType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB16D8]);

    if ((v9 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

@end
