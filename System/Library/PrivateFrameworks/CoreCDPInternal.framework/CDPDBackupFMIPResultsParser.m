@implementation CDPDBackupFMIPResultsParser

- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "recoveredInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE17C18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = *MEMORY[0x24BE1A320];
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v6;
}

@end
