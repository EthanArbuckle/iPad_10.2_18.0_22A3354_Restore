@implementation NSError(HKVerifiableHealthRecordsParser)

- (id)mappedError
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.records.extraction"));

  if (!v3)
    return a1;
  v4 = objc_msgSend(a1, "code");
  if (v4 == 104)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE48930];
    v15 = *MEMORY[0x24BDD1398];
    v16 = a1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v13;
    v10 = 1;
    goto LABEL_7;
  }
  if (v4 != 103)
    return a1;
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE48930];
  v17 = *MEMORY[0x24BDD1398];
  v18[0] = a1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v6;
  v10 = 2;
LABEL_7:
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
