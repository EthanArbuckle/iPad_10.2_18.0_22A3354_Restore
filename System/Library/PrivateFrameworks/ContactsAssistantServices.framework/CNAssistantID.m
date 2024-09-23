@implementation CNAssistantID

+ (id)assistantIDOfType:(id)a3 recordID:(int)a4 databaseID:(id)a5 identifier:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDBCEB8];
  v12 = a3;
  objc_msgSend(v11, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%d"), CFSTR("recordID"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("databaseID"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

  }
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("&"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("com.apple.contacts"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("?"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)databaseID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "identifierWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)assistantIDFromContactID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CNAssistantID databaseID](CNAssistantID, "databaseID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v11[0] = *MEMORY[0x24BDBA2D8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactWithIdentifier:keysToFetch:error:", v3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "iOSLegacyIdentifier");
  else
    v8 = 0;
  +[CNAssistantID assistantIDOfType:recordID:databaseID:identifier:](CNAssistantID, "assistantIDOfType:recordID:databaseID:identifier:", CFSTR("contact"), v8, v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)assistantIDFromContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isKeyAvailable:", *MEMORY[0x24BDBA2E0]))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAssistantID databaseID](CNAssistantID, "databaseID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDBA2D8];
    if ((objc_msgSend(v3, "isKeyAvailable:", *MEMORY[0x24BDBA2D8]) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v9 = (void *)objc_opt_new();
      v13[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v7 = objc_msgSend(v11, "iOSLegacyIdentifier");
      else
        v7 = 0;

    }
    +[CNAssistantID assistantIDOfType:recordID:databaseID:identifier:](CNAssistantID, "assistantIDOfType:recordID:databaseID:identifier:", CFSTR("contact"), v7, v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)assistantIDFromContainer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "iOSLegacyIdentifier");

  +[CNAssistantID databaseID](CNAssistantID, "databaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAssistantID assistantIDOfType:recordID:databaseID:identifier:](CNAssistantID, "assistantIDOfType:recordID:databaseID:identifier:", CFSTR("container"), v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)assistantIDFromGroup:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "iOSLegacyIdentifier");

  +[CNAssistantID databaseID](CNAssistantID, "databaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAssistantID assistantIDOfType:recordID:databaseID:identifier:](CNAssistantID, "assistantIDOfType:recordID:databaseID:identifier:", CFSTR("group"), v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contactIDFromAssistantID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.contacts")))
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("contact"));

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    GetURLParameters(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

+ (id)containerIDFromAssistantID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.contacts")))
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("container"));

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    GetURLParameters(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

+ (id)groupIDFromAssistantID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.contacts")))
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("group"));

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    GetURLParameters(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

+ (id)assistantIDFromExternalIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.contacts://externalPerson?externalIdentifier=%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)externalIdentifierFromAssistantID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.contacts"));

  if (v5)
  {
    GetURLParameters(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("externalIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
