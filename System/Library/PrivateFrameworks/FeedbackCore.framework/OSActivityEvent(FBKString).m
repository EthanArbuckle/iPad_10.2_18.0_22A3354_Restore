@implementation OSActivityEvent(FBKString)

- (id)fba_toString
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "subsystem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "subsystem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = &stru_24E15EAF8;
    }

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fba_toString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "process");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "processID");
    objc_msgSend(a1, "eventMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@[%d]:%@ %@"), v8, v10, v13, v5, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "timestamp");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString fba_toString](v5, "fba_toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "process");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "processID");
    objc_msgSend(a1, "eventMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@[%d]: %@"), v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
