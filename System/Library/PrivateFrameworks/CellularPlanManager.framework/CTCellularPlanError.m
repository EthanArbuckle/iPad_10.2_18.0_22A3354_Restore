@implementation CTCellularPlanError

+ (id)errorForCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorForCode:withDescription:");
}

+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("CTCellularPlanError"), a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "errorForCode:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
