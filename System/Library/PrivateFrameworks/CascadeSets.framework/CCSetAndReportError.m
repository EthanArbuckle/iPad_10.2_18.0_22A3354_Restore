@implementation CCSetAndReportError

id __CCSetAndReportError_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingErrors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("domain");
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("underlyingCode");
  if (v3)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "code"));
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("description");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  return v9;
}

@end
