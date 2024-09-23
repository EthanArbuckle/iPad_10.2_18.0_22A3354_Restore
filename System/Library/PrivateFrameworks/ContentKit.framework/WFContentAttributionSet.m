@implementation WFContentAttributionSet

- (BOOL)isAllowedToBeSentToDestinationWithManagedLevel:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    v7 = 1;
    if (objc_msgSend(v5, "isOpenInRestrictionInEffect"))
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 1;
      -[WFContentAttributionSet attributions](self, "attributions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __74__WFContentAttributionSet_isAllowedToBeSentToDestinationWithManagedLevel___block_invoke;
      v10[3] = &unk_24C4DB3C0;
      v12 = &v14;
      v11 = v6;
      v13 = a3;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

      v7 = *((_BYTE *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isSupersetOfAttributionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  -[WFContentAttributionSet attributions](self, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_map:", &__block_literal_global_51);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCE70];
  -[WFContentAttributionSet attributions](self, "attributions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(v4, "attributions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke_2;
  v13[3] = &unk_24C4DB428;
  v11 = v9;
  v14 = v11;
  v15 = &v16;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  LOBYTE(v10) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v10;
}

- (BOOL)isMoreRestrictiveThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  -[WFContentAttributionSet attributions](self, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_map:", &__block_literal_global_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCE70];
  -[WFContentAttributionSet attributions](self, "attributions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(v4, "attributions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke_2;
  v13[3] = &unk_24C4DB428;
  v11 = v9;
  v14 = v11;
  v15 = &v16;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  LOBYTE(v10) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v10;
}

- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3
{
  void *v5;

  +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[WFContentAttributionSet isEligibleToShareWithResultManagedLevel:usingManagedConfigurationManager:](self, "isEligibleToShareWithResultManagedLevel:usingManagedConfigurationManager:", a3, v5);

  return (char)a3;
}

- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3 usingManagedConfigurationManager:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  if ((objc_msgSend(v6, "isOpenInRestrictionInEffect") & 1) != 0)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[WFContentAttributionSet attributions](self, "attributions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __100__WFContentAttributionSet_isEligibleToShareWithResultManagedLevel_usingManagedConfigurationManager___block_invoke;
    v11[3] = &unk_24C4DB470;
    v11[4] = &v12;
    v11[5] = &v16;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    if (*((_BYTE *)v17 + 24))
    {
      if (*((_BYTE *)v13 + 24))
      {
        if (objc_msgSend(v6, "mayOpenFromUnmanagedToManaged")
          && (objc_msgSend(v6, "mayOpenFromManagedToUnmanaged") & 1) == 0)
        {
          LOBYTE(v9) = 1;
          v8 = 2;
          if (!a3)
            goto LABEL_16;
        }
        else if ((objc_msgSend(v6, "mayOpenFromUnmanagedToManaged") & 1) != 0)
        {
          v8 = 0;
          LOBYTE(v9) = 0;
          if (!a3)
            goto LABEL_16;
        }
        else
        {
          v9 = objc_msgSend(v6, "mayOpenFromManagedToUnmanaged");
          v8 = v9;
          if (!a3)
            goto LABEL_16;
        }
        goto LABEL_15;
      }
      v8 = 1;
    }
    else
    {
      v8 = 2 * (*((_BYTE *)v13 + 24) != 0);
    }
    LOBYTE(v9) = 1;
    if (!a3)
    {
LABEL_16:
      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
      goto LABEL_17;
    }
LABEL_15:
    *a3 = v8;
    goto LABEL_16;
  }
  if (a3)
    *a3 = 0;
  LOBYTE(v9) = 1;
LABEL_17:

  return v9;
}

- (unint64_t)derivedDisclosureLevel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFContentAttributionSet attributions](self, "attributions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "disclosureLevel");
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)derivedManagedLevel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFContentAttributionSet attributions](self, "attributions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "origin");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= objc_msgSend(v8, "managedLevel");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allOrigins
{
  void *v2;
  void *v3;

  -[WFContentAttributionSet attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFContentAttributionSet)initWithAttribution:(id)a3
{
  id v5;
  void *v6;
  WFContentAttributionSet *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentAttributionSet.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentAttribution"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContentAttributionSet initWithAttributions:](self, "initWithAttributions:", v6);

  return v7;
}

- (WFContentAttributionSet)initWithAttributions:(id)a3
{
  id v4;
  WFContentAttributionSet *v5;
  uint64_t v6;
  NSArray *attributions;
  WFContentAttributionSet *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentAttributionSet;
  v5 = -[WFContentAttributionSet init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributions = v5->_attributions;
    v5->_attributions = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)attributionSetByReplacingAccountWithAppOrigins
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContentAttributionSet attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAttributions:shouldReduceAttributions:](WFContentAttributionSet, "attributionSetWithAttributions:shouldReduceAttributions:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributionSetByFilteringNeighborsOfContentItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[WFContentAttributionSet attributions](self, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__WFContentAttributionSet_attributionSetByFilteringNeighborsOfContentItem___block_invoke;
  v10[3] = &unk_24C4DB580;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAttributions:](WFContentAttributionSet, "attributionSetWithAttributions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFContentAttributionSet *v4;
  WFContentAttributionSet *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WFContentAttributionSet *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFContentAttributionSet attributions](self, "attributions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentAttributionSet attributions](v5, "attributions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToArray:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (WFContentAttributionSet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFContentAttributionSet *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentLocation allContentLocationClasses](WFContentLocation, "allContentLocationClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDisclosureWarning allDisclosureWarningClasses](WFDisclosureWarning, "allDisclosureWarningClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("attributions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self = -[WFContentAttributionSet initWithAttributions:](self, "initWithAttributions:", v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFContentAttributionSet attributions](self, "attributions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributions"));

}

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("attributions");
  -[WFContentAttributionSet attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)wfSerializedRepresentationWithPrivateItemIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("attributions");
  -[WFContentAttributionSet attributions](self, "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributions, 0);
}

uint64_t __79__WFContentAttributionSet_wfSerializedRepresentationWithPrivateItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfSerializedRepresentationWithPrivateItemIdentifiers");
}

uint64_t __53__WFContentAttributionSet_wfSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfSerializedRepresentation");
}

id __75__WFContentAttributionSet_attributionSetByFilteringNeighborsOfContentItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "privateItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachingIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDBCF00];
      objc_msgSend(*(id *)(a1 + 32), "cachingIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "orderedSetWithObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPrivateItemIdentifiers:", v9);

    }
  }

  return v3;
}

uint64_t __73__WFContentAttributionSet_attributionSetByReplacingAccountWithAppOrigins__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributionByReplacingAccountWithAppOrigin");
}

uint64_t __37__WFContentAttributionSet_allOrigins__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "origin");
}

void __100__WFContentAttributionSet_isEligibleToShareWithResultManagedLevel_usingManagedConfigurationManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "managedLevel");

  if (v7 == 2)
  {
    v8 = a1 + 32;
  }
  else
  {
    objc_msgSend(v12, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "managedLevel");

    if (v10 != 1)
      goto LABEL_6;
    v8 = a1 + 40;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = 1;
LABEL_6:
  v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v11)
    v11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *a4 = v11;

}

void __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v14 = v6;
  objc_msgSend(v6, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "disclosureLevel");
    if (v10 >= objc_msgSend(v14, "disclosureLevel"))
    {
      objc_msgSend(v9, "origin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "managedLevel");
      objc_msgSend(v14, "origin");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12 == objc_msgSend(v13, "managedLevel");

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v14, "disclosureLevel") == 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

uint64_t __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "origin");
}

void __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v14 = v6;
  objc_msgSend(v6, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (v10 = objc_msgSend(v9, "disclosureLevel"), v10 >= objc_msgSend(v14, "disclosureLevel")))
  {
    objc_msgSend(v9, "origin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "managedLevel");
    objc_msgSend(v14, "origin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12 == objc_msgSend(v13, "managedLevel");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

uint64_t __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "origin");
}

void __74__WFContentAttributionSet_isAllowedToBeSentToDestinationWithManagedLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "managedLevel");

  if (!v7)
    goto LABEL_9;
  objc_msgSend(v11, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "managedLevel");

  if (v9 != 3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "mayOpenFromManagedToUnmanaged") & 1) == 0 && *(_QWORD *)(a1 + 48) == 1
      || (objc_msgSend(*(id *)(a1 + 32), "mayOpenFromUnmanagedToManaged") & 1) == 0 && *(_QWORD *)(a1 + 48) == 2)
    {
      objc_msgSend(v11, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "managedLevel") == *(_QWORD *)(a1 + 48);

      goto LABEL_10;
    }
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_10;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_10:
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  +[WFContentAttribution attributionWithDisclosureLevel:origin:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a4, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithAttribution:", v8);
  return v9;
}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  +[WFContentAttribution attributionWithDisclosureLevel:origin:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a4, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithAttribution:", v11);
  return v12;
}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  +[WFContentAttribution attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifier:", a4, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v13, "initWithAttribution:", v14);
  return v15;
}

+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", a3, a4, 0);
}

+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContentAttribution attributionWithDisclosureLevel:origin:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a4, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v10, "initWithAttribution:", v12);
  return v13;
}

+ (id)attributionSetWithAccountBasedAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 originalItemIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  +[WFAccountContentLocation locationWithAccountIdentifier:appDescriptor:](WFAccountContentLocation, "locationWithAccountIdentifier:appDescriptor:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContentAttribution attributionWithDisclosureLevel:origin:originalItemIdentifier:](WFContentAttribution, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a5, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithAttribution:", v15);
  return v16;
}

+ (id)attributionSetByMergingAttributionSets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "if_flatMap:", &__block_literal_global_23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reducedAttributionsFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributions:", v5);
  return v6;
}

+ (id)attributionSetWithAttributions:(id)a3
{
  return (id)objc_msgSend(a1, "attributionSetWithAttributions:shouldReduceAttributions:", a3, 1);
}

+ (id)attributionSetWithAttributions:(id)a3 shouldReduceAttributions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(a1, "reducedAttributionsFrom:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributions:", v7);

  return v8;
}

+ (id)shortcutsAppAttributionSet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[WFContentAttribution shortcutsAppAttribution](WFContentAttribution, "shortcutsAppAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithAttribution:", v3);

  return v4;
}

+ (id)shortcutsAppAttributionSetWithDisclosureLevel:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  +[WFContentAttribution shortcutsAppAttributionWithDisclosureLevel:](WFContentAttribution, "shortcutsAppAttributionWithDisclosureLevel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAttribution:", v5);

  return v6;
}

+ (id)combiningAttributions:(id)a3 withAttributions:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reducedAttributionsFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)compactAttributionsFrom:(id)a3 disclosureLevel:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  SEL v40;
  unint64_t v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  unint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v39 = a1;
    v40 = a2;
    v41 = a4;
    v43 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v42 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v15, "disclosureWarnings", v39, v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17)
          {
            objc_msgSend(v15, "disclosureWarnings");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionOrderedSet:", v18);

          }
          objc_msgSend(v15, "privateItemIdentifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v15, "origin");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "privateItemIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v21)
            {
              objc_msgSend(v21, "unionOrderedSet:", v22);
            }
            else
            {
              v24 = (void *)objc_msgSend(v22, "mutableCopy");
              objc_msgSend(v15, "origin");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKey:", v24, v25);

            }
          }
          else
          {
            objc_msgSend(v43, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v12);
    }

    if (VCIsInternalBuild())
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v26 = v43;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v49 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "origin", v39, v40);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v40, v39, CFSTR("WFContentAttributionSet.m"), 274, CFSTR("Attempting to compact attributions with mix of nonnull and nil privateItemIdentifiers is not supported"));

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v28);
      }

    }
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __67__WFContentAttributionSet_compactAttributionsFrom_disclosureLevel___block_invoke;
    v44[3] = &unk_24C4DB518;
    v47 = v41;
    v45 = v8;
    v34 = v43;
    v46 = v34;
    v35 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v44);
    v36 = v46;
    v37 = v34;

    v7 = v42;
  }
  else
  {
    v37 = (id)MEMORY[0x24BDBD1A8];
  }

  return v37;
}

+ (id)reducedAttributionsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v12, "disclosureLevel", (_QWORD)v18) == 1)
            v13 = v6;
          else
            v13 = v5;
          objc_msgSend(v13, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(a1, "compactAttributionsFrom:disclosureLevel:", v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "compactAttributionsFrom:disclosureLevel:", v6, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_44);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "attributionSetWithAttributions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __64__WFContentAttributionSet_objectWithWFSerializedRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentAttribution objectWithWFSerializedRepresentation:](WFContentAttribution, "objectWithWFSerializedRepresentation:", a2);
}

void __67__WFContentAttributionSet_compactAttributionsFrom_disclosureLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttribution attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:](WFContentAttribution, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v5, v8, v9, v7, objc_msgSend(v7, "count"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

uint64_t __66__WFContentAttributionSet_attributionSetByMergingAttributionSets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributions");
}

@end
