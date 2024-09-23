@implementation EFPriorityDesignator

- (unint64_t)priority
{
  return self->_priority;
}

+ (id)installNewDesignator
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("EFThreadPriorityDesignator"));
  return v2;
}

+ (EFPriorityDesignator)currentDesignator
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "currentDesignatorIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "installNewDesignator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (EFPriorityDesignator *)v6;
}

+ (id)currentDesignatorIfExists
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EFThreadPriorityDesignator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)destroyCurrentDesignator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", CFSTR("EFThreadPriorityDesignator"));
  objc_msgSend(a1, "currentDesignatorStackIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("EFThreadPriorityDesignator"));

    objc_msgSend(v5, "removeLastObject");
    if (!objc_msgSend(v5, "count"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("EFThreadPriorityDesignatorStack"));
  }

}

+ (id)currentDesignatorStackIfExists
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EFThreadPriorityDesignatorStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

+ (id)currentDesignatorStack
{
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "currentDesignatorStackIfExists");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("EFThreadPriorityDesignatorStack"));

  }
  return v2;
}

+ (id)pushNewDesignator
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "currentDesignatorIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "currentDesignatorStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

    objc_msgSend(a1, "installNewDesignator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "currentDesignator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
