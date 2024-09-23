@implementation HMFVersion(HMB)

- (id)hmbData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("a");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "majorVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("i");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "minorVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("u");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "updateVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v6 = MEMORY[0x1D17B60D4](v5, 8, &v9);
  if (!v6)
    _HMFPreconditionFailure();
  v7 = (void *)v6;

  return v7;
}

+ (id)hmbVersionFromData:()HMB
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v3 = a3;
  v4 = (id)OPACKDecodeData();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D286E0]);
    objc_msgSend(v6, "objectForKey:", CFSTR("a"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("i"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("u"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithMajorVersion:minorVersion:updateVersion:", v9, v11, objc_msgSend(v12, "integerValue"));

    return v13;
  }
  else
  {
    v15 = _HMFPreconditionFailure();
    return (id)+[CKRecord(HMB) recordFromExternalData:error:](v15);
  }
}

@end
