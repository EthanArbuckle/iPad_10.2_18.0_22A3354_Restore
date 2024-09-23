@implementation AXSSWordDescriptionManager_zh

- (id)descriptionForWord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  AXSSWordDescriptionManager_zh *v15;
  id v16;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__AXSSWordDescriptionManager_zh_descriptionForWord___block_invoke;
  v14 = &unk_1E5F99998;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, &v11);

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("，"), v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)descriptionForCharacter:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  -[AXSSWordDescriptionManager managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Entry"));
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("character == %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);
    v20 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v9, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("zh-Hans")) & 1) != 0)
    {
      v13 = CFSTR("simplifiedExemplar");
    }
    else if ((objc_msgSend(v7, "hasPrefix:", CFSTR("zh-Hant")) & 1) != 0)
    {
      v13 = CFSTR("traditionalExemplar");
    }
    else
    {
      if (!objc_msgSend(v7, "hasPrefix:", CFSTR("yue-Hant")))
      {
        v15 = 0;
        goto LABEL_12;
      }
      v13 = CFSTR("cantoneseExemplar");
    }
    objc_msgSend(v12, "valueForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    if (objc_msgSend(v15, "length"))
    {
      if ((unint64_t)objc_msgSend(v15, "length") >= 3
        && (v16 = objc_msgSend(v15, "rangeOfString:options:", CFSTR("的"), 4), v16 == objc_msgSend(v15, "length") - 2))
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@的%@"), v15, v6);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v17;
    }
    else
    {
      objc_msgSend(v12, "valueForKey:", CFSTR("components"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v18, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {

        v14 = 0;
      }
    }

    goto LABEL_22;
  }
  v14 = 0;
LABEL_23:

  return v14;
}

- (id)componentDescriptionForCharacter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  -[AXSSWordDescriptionManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Entry"));
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("character == %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);
    v12 = 0;
    objc_msgSend(v5, "executeFetchRequest:error:", v6, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("components"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {

        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
