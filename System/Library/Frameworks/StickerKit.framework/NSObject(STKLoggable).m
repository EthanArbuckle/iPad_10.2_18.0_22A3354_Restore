@implementation NSObject(STKLoggable)

- (id)stk_loggingDescription
{
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_2561BCFC0))
    objc_msgSend((id)objc_opt_class(), "stk_loggingDescriptionFromLoggable:isPretty:", a1, 0);
  else
    objc_msgSend(a1, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stk_prettyLoggingDescription
{
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_2561BCFC0))
    objc_msgSend((id)objc_opt_class(), "stk_loggingDescriptionFromLoggable:isPretty:", a1, 1);
  else
    objc_msgSend(a1, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)stk_loggingIdentifier
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), a1);
}

+ (id)stk_loggingDescriptionFromLoggable:()STKLoggable isPretty:
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  char v20;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD16A8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ "), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stk_loggingIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("%p"), v5);
    if (a4)
      goto LABEL_3;
LABEL_5:
    v11 = CFSTR(" %@=%@");
    goto LABEL_6;
  }
  objc_msgSend(v9, "appendString:", v10);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  v11 = CFSTR("\t%@ = %@\n");
LABEL_6:
  objc_msgSend(v5, "stk_loggingValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__NSObject_STKLoggable__stk_loggingDescriptionFromLoggable_isPretty___block_invoke;
  v17[3] = &unk_2505BD460;
  v20 = a4;
  v13 = v9;
  v18 = v13;
  v19 = v11;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  v14 = (__CFString *)v19;
  v15 = v13;

  return v15;
}

@end
