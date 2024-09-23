@implementation NSError(sqlite3)

+ (id)errorWithSQLite3Context:()sqlite3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BE3EBB0];
  v11[0] = CFSTR("extcode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_errcode(db));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("text");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_errmsg(db));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithSQLite3Context:()sqlite3 statement:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BE3EBB0];
  v14[0] = CFSTR("extcode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_errcode(db));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = CFSTR("text");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_errmsg(db));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  v14[2] = CFSTR("statement");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithSQLite3Statement:()sqlite3
{
  void *v4;
  uint64_t v5;
  void *v6;
  sqlite3 *v7;
  void *v8;
  void *v9;
  sqlite3 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BE3EBB0];
  v16[0] = CFSTR("extcode");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = sqlite3_db_handle(a3);
  objc_msgSend(v6, "numberWithInt:", sqlite3_errcode(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v16[1] = CFSTR("text");
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = sqlite3_db_handle(a3);
  objc_msgSend(v9, "stringWithUTF8String:", sqlite3_errmsg(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  v16[2] = CFSTR("statement");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_sql(a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
