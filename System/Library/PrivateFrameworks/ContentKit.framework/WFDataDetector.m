@implementation WFDataDetector

+ (id)resultsForString:(id)a3 ofTypes:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  WFDataDetectorResults *v21;
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFDataDetector.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

    if ((_DWORD)a4)
      goto LABEL_3;
LABEL_15:
    v12 = (void *)MEMORY[0x24BDBD1A8];
    if ((a4 & 0x200000000) == 0)
      goto LABEL_12;
LABEL_16:
    WFNumberFromString(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x400000000) != 0)
      goto LABEL_13;
LABEL_17:
    v19 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  if (!(_DWORD)a4)
    goto LABEL_15;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((a4 & 0x20) != 0
    && !objc_msgSend(v11, "count")
    && objc_msgSend(v9, "rangeOfString:", CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17E8], "linkCheckingResultWithRange:URL:", 0, objc_msgSend(v9, "length"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObject:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }

  }
  if ((~(_BYTE)a4 & 0x30) == 0)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __49__WFDataDetector_resultsForString_ofTypes_error___block_invoke;
    v24[3] = &unk_24C4E1C70;
    v25 = v9;
    objc_msgSend(v12, "if_map:", v24);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }

  if ((a4 & 0x200000000) != 0)
    goto LABEL_16;
LABEL_12:
  v17 = 0;
  if ((a4 & 0x400000000) == 0)
    goto LABEL_17;
LABEL_13:
  v23 = 0;
  WFDictionariesFromString(v9, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;
LABEL_18:
  v21 = -[WFDataDetectorResults initWithTextCheckingResults:number:dictionaries:dictionaryType:]([WFDataDetectorResults alloc], "initWithTextCheckingResults:number:dictionaries:dictionaryType:", v12, v17, v18, v19);

  return v21;
}

+ (BOOL)hasResultForString:(id)a3 ofTypes:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a3;
  if (!v5)
    goto LABEL_9;
  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", a4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_8;
  }
  if ((a4 & 0x200000000) != 0
    && (WFNumberFromString(v5), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8)
    || (a4 & 0x400000000) != 0
    && (WFDictionariesFromString(v5, 0), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
LABEL_8:
    v10 = 1;
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

id __49__WFDataDetector_resultsForString_ofTypes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") != 32)
    goto LABEL_7;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("maps.apple.com")) & 1) == 0)
  {

LABEL_7:
    v12 = v3;
    goto LABEL_8;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsString:", CFSTR("maps.apple.com"));

  if ((v6 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 16, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v3, "range");
  objc_msgSend(v7, "matchesInString:options:range:", v8, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_7;
LABEL_8:

  return v12;
}

@end
