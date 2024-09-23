@implementation NSError(AEAdditions)

- (uint64_t)ae_verboseDescription
{
  return objc_msgSend(a1, "verboseDescriptionWithIndentation:", 0);
}

- (id)verboseDescriptionWithIndentation:()AEAdditions
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  objc_msgSend(&stru_24FA22038, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@%@: %@\n"), v5, objc_opt_class(), a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@Desc   : %@\n"), v5, v10);

    objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x24BDD0FC8]);
  }
  objc_msgSend(a1, "localizedRecoverySuggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "localizedRecoverySuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@Sugg   : %@\n"), v5, v12);

    objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x24BDD0FF0]);
  }
  objc_msgSend(a1, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSDescription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(a1, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@US Desc: %@\n"), v5, v16);

    objc_msgSend(v7, "removeObjectForKey:", CFSTR("NSDescription"));
  }
  objc_msgSend(a1, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("NSRecoverySuggestion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("NSRecoverySuggestion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@US Sugg: %@\n"), v5, v20);

    objc_msgSend(v7, "removeObjectForKey:", CFSTR("NSRecoverySuggestion"));
  }
  objc_msgSend(a1, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@Domain : %@\n"), v5, v21);

  objc_msgSend((id)objc_opt_class(), "formattedCode:", objc_msgSend(a1, "code"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@Code   : %@\n"), v5, v22);

  objc_msgSend(a1, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDD1398];
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "verboseDescriptionWithIndentation:", a3 + 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@...Underlying error:\n%@"), v5, v26);

    objc_msgSend(v7, "removeObjectForKey:", v24);
  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v8, "appendFormat:", CFSTR("%@Extra info:\n%@"), v5, v7);

  return v8;
}

+ (id)formattedCode:()AEAdditions
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

@end
