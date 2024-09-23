@implementation NSDateComponents(HMFoundation)

+ (id)hmf_unarchiveFromData:()HMFoundation error:
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hmf_localTimeDescription
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "second"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ s, "), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v5);

  }
  if (objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "minute"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ m, "), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v8);

  }
  if (objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "hour"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ h, "), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v11);

  }
  if (objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ d, "), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v14);

  }
  if (objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "month"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ mo, "), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v17);

  }
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  v18 = (void *)objc_msgSend(v2, "copy");

  return v18;
}

@end
