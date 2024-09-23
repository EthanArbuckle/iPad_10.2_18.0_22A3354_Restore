@implementation NSPersonNameComponentsFormatter

+ (uint64_t)contactsNameOrderFromFoundationNameOrder:(uint64_t)a1
{
  objc_opt_self();
  return a2;
}

- (id)stringFromContact:(id)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringFromPersonNameComponents:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (id)formatterWithCNContactStyle:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  objc_opt_self();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  v4 = v3;
  if (a2 > 999)
  {
    if (a2 == 1000)
    {
      v5 = 1;
    }
    else
    {
      if (a2 != 1001)
      {
        if (a2 == 1002)
        {
          objc_msgSend(v3, "setStyle:", 4);
          objc_msgSend(v4, "set_ignoresFallbacks:", 1);
        }
        return v4;
      }
      v5 = 31;
    }
LABEL_12:
    objc_msgSend(v3, "setStyle:", v5);
    return v4;
  }
  if (!a2)
  {
    v5 = 3;
    goto LABEL_12;
  }
  if (a2 == 1)
  {
    objc_msgSend(v3, "setStyle:", 3);
    objc_msgSend(v4, "setPhonetic:", 1);
  }
  return v4;
}

@end
