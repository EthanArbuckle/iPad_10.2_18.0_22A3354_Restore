@implementation CKRecordID(HMDStringRepresentation)

- (uint64_t)hmd_initWithCanonicalStringRepresentation:()HMDStringRepresentation
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;

  v3 = a3;
  if (HMDCKRecordIDEncodedCharacters__hmf_once_t2 != -1)
    dispatch_once(&HMDCKRecordIDEncodedCharacters__hmf_once_t2, &__block_literal_global_124017);
  v4 = (id)HMDCKRecordIDEncodedCharacters__hmf_once_v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v3);
  objc_msgSend(v5, "setCharactersToBeSkipped:", 0);
  v23 = 0;
  v6 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", v4, &v23);
  v7 = v23;
  v8 = v7;
  if (!v6)
  {
    v13 = 0;
    v9 = v7;
LABEL_17:
    v17 = 0;
    v19 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v7, "stringByRemovingPercentEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !objc_msgSend(v9, "length"))
  {
    v13 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "scanString:intoString:", CFSTR("/"), 0))
  {
    v13 = 0;
    goto LABEL_17;
  }
  v22 = 0;
  v10 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", v4, &v22);
  v11 = v22;
  v12 = v11;
  if (!v10)
  {
    v17 = 0;
    v13 = v11;
    goto LABEL_20;
  }
  objc_msgSend(v11, "stringByRemovingPercentEncoding");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || !objc_msgSend(v13, "length")
    || !objc_msgSend(v5, "scanString:intoString:", CFSTR("/"), 0))
  {
LABEL_19:
    v17 = 0;
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v21 = 0;
  v14 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", v4, &v21);
  v15 = v21;
  v16 = v15;
  if (!v14)
  {
    v19 = 0;
    v17 = v15;
    goto LABEL_21;
  }
  objc_msgSend(v15, "stringByRemovingPercentEncoding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || !objc_msgSend(v17, "length") || !objc_msgSend(v5, "isAtEnd"))
    goto LABEL_20;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91F8]), "initWithZoneName:ownerName:", v13, v9);
  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v17, v18);

LABEL_21:
  return v19;
}

- (id)hmd_canonicalStringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  HMDCKRecordIDSafeCharacters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
