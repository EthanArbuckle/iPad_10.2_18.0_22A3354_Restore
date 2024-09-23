@implementation NSError(CAF)

+ (id)CAF_errorWithCode:()CAF userInfo:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CAFErrorDateCreated);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CAFErrorDomain, a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)CAF_outOfRangeErrorForValue:()CAF range:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD16F0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setNumberStyle:", 1);
  v9 = (void *)MEMORY[0x24BDD1540];
  v20 = *MEMORY[0x24BDD0FC8];
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "stringFromNumber:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "minimum");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is out of range.  min=%@ max=%@"), v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CAF_errorWithCode:userInfo:", 100, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)CAF_outOfRangeErrorForValue:()CAF min:max:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDD16F0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "setNumberStyle:", 1);
  v12 = (void *)MEMORY[0x24BDD1540];
  v21 = *MEMORY[0x24BDD0FC8];
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "stringFromNumber:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringFromNumber:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringFromNumber:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is out of range.  min=%@ max=%@"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CAF_errorWithCode:userInfo:", 100, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)CAF_writeToReadonlyError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FC8];
  v5[0] = CFSTR("characteristic is not writable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 101, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)CAF_invalidDataForFormat:()CAF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Data format is not kCFPropertyListBinaryFormat_v1_0.  format=%@"), a3, *MEMORY[0x24BDD0FC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 102, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_errorWithCode:userInfo:", 102, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)CAF_plistConversionFailedForError:()CAF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Plist conversion failed. errorString=%@"), a3, *MEMORY[0x24BDD0FC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 103, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_errorWithCode:userInfo:", 103, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)CAF_elementParseFailedForDataSupportType:()CAF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed parsing element(s) for dataSupport type %@"), a3, *MEMORY[0x24BDD0FC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_errorWithCode:userInfo:", 104, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)CAF_elementParseFailedForCharacteristic:()CAF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed parsing element(s) for characteristic %@"), a3, *MEMORY[0x24BDD0FC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_errorWithCode:userInfo:", 104, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)CAF_groupRequestWithNoCharacteristics
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GroupRequest was performed with no characteristics"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 104, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)CAF_groupRequestAlreadyPerformed
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GroupRequest was already performed"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 104, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)CAF_groupRequestNilForCharacteristics:()CAF
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v10[0] = *MEMORY[0x24BDD0FC8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("GroupRequest was nil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CAFErrorCharacteristics;
  v11[0] = v6;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)CAF_groupRequestErrors:()CAF
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v10[0] = *MEMORY[0x24BDD0FC8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("GroupRequest multiple errors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CAFErrorErrors;
  v11[0] = v6;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
