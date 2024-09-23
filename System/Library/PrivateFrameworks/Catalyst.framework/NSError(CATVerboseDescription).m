@implementation NSError(CATVerboseDescription)

- (id)verboseDescriptionWithIdentation:()CATVerboseDescription
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  objc_msgSend(&stru_24C1C6B98, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@%@: %p\n"), v4, objc_opt_class(), a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedDescription");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@Desc   : %@\n"), v4, v8);
  objc_msgSend(a1, "localizedRecoverySuggestion");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@Sugg   : %@\n"), v4, v10);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSDescription"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@US Desc: %@\n"), v4, v12);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSRecoverySuggestion"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@US Sugg: %@\n"), v4, v14);
  objc_msgSend(a1, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@Domain : %@\n"), v4, v16);

  objc_msgSend(a1, "formattedCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@Code   : %@\n"), v4, v17);

  objc_msgSend(a1, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDD1398];
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDD1398]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "verboseDescriptionWithIdentation:", a3 + 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("%@...Underlying error:\n%@"), v4, v21);

  }
  objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x24BDD0FC8]);
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSDescription"));
  objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x24BDD0FF0]);
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSRecoverySuggestion"));
  objc_msgSend(v6, "removeObjectForKey:", v19);
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "appendFormat:", CFSTR("%@Extra info:\n%@"), v4, v6);

  return v7;
}

- (uint64_t)verboseDescription
{
  return objc_msgSend(a1, "verboseDescriptionWithIdentation:", 0);
}

+ (id)formattedCode:()CATVerboseDescription
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3 >> 26;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%lX (%ld)"), a3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [sys = 0x%1$lX, sub = 0x%2$lX, code = 0x%3$lX (%3$ld)]"), v4, (a3 >> 14) & 0xFFF, a3 & 0x3FFF);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (uint64_t)formattedCode
{
  return objc_msgSend(MEMORY[0x24BDD1540], "formattedCode:", objc_msgSend(a1, "code"));
}

@end
