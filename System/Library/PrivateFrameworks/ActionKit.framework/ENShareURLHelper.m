@implementation ENShareURLHelper

+ (id)shareURLStringForNoteGUID:(id)a3 shardId:(id)a4 shareKey:(id)a5 serviceHost:(id)a6 encodedAdditionalString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v46 = -1;
  if ((unint64_t)objc_msgSend(v12, "length") >= 2 && objc_msgSend(v12, "hasPrefix:", CFSTR("s")))
  {
    objc_msgSend(v12, "substringFromIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "scanInteger:", &v46) & 1) == 0 || v46 >= 0x10000)
      v46 = -1;

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
  if ((unint64_t)objc_msgSend(v13, "length") < 0x10)
  {
    v27 = 0;
LABEL_37:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/shard/%@/sh/%@/%@"), v14, v12, v11, v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  objc_msgSend(v13, "substringToIndex:", 16);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "length") & 1) != 0)
  {
    v27 = 0;
  }
  else
  {
    v43 = v15;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", (unint64_t)objc_msgSend(v19, "length") >> 1);
    if (objc_msgSend(v19, "length"))
    {
      v21 = 0;
      while (1)
      {
        v22 = objc_msgSend(v19, "characterAtIndex:", v21);
        v23 = v22 - 87;
        if (v22 >= 0x67)
          v23 = -1;
        if (v22 <= 0x46)
          v23 = v22 - 55;
        if (v22 <= 0x39)
          v24 = v22 - 48;
        else
          v24 = v23;
        v25 = v21 + 1;
        v26 = objc_msgSend(v19, "characterAtIndex:", v21 + 1);
        v27 = 0;
        v28 = v26 - 87;
        if (v26 >= 0x67)
          v28 = -1;
        if (v26 <= 0x46)
          v28 = v26 - 55;
        if (v26 <= 0x39)
          v28 = v26 - 48;
        if (v24 < 0 || v28 < 0)
          break;
        LOBYTE(v47[0]) = v28 | (16 * v24);
        objc_msgSend(v20, "appendBytes:length:", v47, 1);
        v21 = v25 + 1;
        if (v25 + 1 >= (unint64_t)objc_msgSend(v19, "length"))
          goto LABEL_27;
      }
    }
    else
    {
LABEL_27:
      v27 = v20;
    }

    v15 = v43;
  }

  if (v46 < 0 || !v18 || !v27)
    goto LABEL_37;
  v29 = objc_msgSend(v27, "length") + 18;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", v29);
  v45 = bswap32((unsigned __int16)v46) >> 16;
  objc_msgSend(v30, "appendBytes:length:", &v45, 2);
  v47[0] = 0;
  v47[1] = 0;
  objc_msgSend(v18, "getUUIDBytes:", v47);
  objc_msgSend(v30, "appendBytes:length:", v47, 16);
  objc_msgSend(v30, "appendData:", v27);
  objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "substringToIndex:", objc_msgSend(v31, "length") - 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/l/%@"), v14, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v35, "stringByAppendingFormat:", CFSTR("/%@"), v15);
    v44 = v12;
    v36 = v13;
    v37 = v11;
    v38 = v18;
    v39 = v14;
    v40 = v15;
    v41 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v41;
    v15 = v40;
    v14 = v39;
    v18 = v38;
    v11 = v37;
    v13 = v36;
    v12 = v44;
  }

LABEL_38:
  return v35;
}

@end
