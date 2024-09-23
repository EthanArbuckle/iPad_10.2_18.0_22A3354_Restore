@implementation ACAccount(CalUserManagement)

- (id)cal_personaIdentifier
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  objc_opt_class();
  v2 = *MEMORY[0x1E0C8EFC8];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFC8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(a1, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      objc_msgSend(v6, "objectForKeyedSubscript:", v2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;

      v5 = v8;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
