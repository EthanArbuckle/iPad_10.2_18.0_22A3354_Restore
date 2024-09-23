@implementation UpdateContainers

void __UpdateContainers_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __UpdateContainers_block_invoke_2;
  v5[3] = &unk_24C365080;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, a2, v5);

}

void __UpdateContainers_block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = (objc_class *)MEMORY[0x24BDBCEF0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = MEMORY[0x24BDAC760];
  v7 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __UpdateContainers_block_invoke_3;
  v15[3] = &unk_24C365030;
  v16 = v5;
  v8 = v5;
  objc_msgSend(v7, "databaseConnectionAllowingWrites:withBlock:", 0, v15);

  v10 = v6;
  v11 = 3221225472;
  v12 = __UpdateContainers_block_invoke_5;
  v13 = &unk_24C365058;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = v14;
  +[HSResponseDataParser enumerateItemsInResponseData:usingHandler:](HSResponseDataParser, "enumerateItemsInResponseData:usingHandler:", v4, &v10);

  objc_msgSend(v9, "isEqualToSet:", v8, v10, v11, v12, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __UpdateContainers_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT ROWID FROM container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __UpdateContainers_block_invoke_4;
  v4[3] = &unk_24C365008;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

void __UpdateContainers_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = a3;
    v5 = (_QWORD *)(a2 + 16);
    do
    {
      if (*((_DWORD *)v5 - 4) == 1835624804)
      {
        v6 = 0xFFFFFFFFLL;
        v7 = (unsigned int *)*(v5 - 1);
        switch(*v5)
        {
          case 1:
            v6 = *(unsigned __int8 *)v7;
            break;
          case 2:
            v6 = __rev16(*(unsigned __int16 *)v7);
            break;
          case 4:
            v8 = *v7;
            goto LABEL_9;
          case 8:
            v8 = v7[1];
LABEL_9:
            v6 = bswap32(v8);
            break;
          default:
            break;
        }
        v9 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      v5 += 4;
      --v3;
    }
    while (v3);
  }
}

void __UpdateContainers_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "numberForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
