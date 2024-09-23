@implementation NSString(AXAudit)

- (id)axAuditStringForLog
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "isEqualToString:", CFSTR("\n")))
  {
    v2 = a1;
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v3, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] %@\n"), v5, a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (uint64_t)axAuditStringIsHumanReadable
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a1, "uppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", a1))
    v3 = objc_msgSend(a1, "containsString:", CFSTR("_"));
  else
    v3 = 0;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_25071BA38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isEqualToString:", v4))
    v5 = objc_msgSend(a1, "containsString:", CFSTR("."));
  else
    v5 = 0;
  if ((unint64_t)objc_msgSend(a1, "length") < 5)
    v6 = 1;
  else
    v6 = (v3 | v5) ^ 1u;

  return v6;
}

@end
