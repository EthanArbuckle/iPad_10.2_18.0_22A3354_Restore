@implementation HKConcept(Medications)

- (uint64_t)_meds_isA:()Medications
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "relationships", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 1015)
        {
          objc_msgSend(v9, "destination");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "rawIdentifier");

          if (v12 == a3)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (uint64_t)meds_isSpecificProduct
{
  return objc_msgSend(a1, "_meds_isA:", 841);
}

- (uint64_t)meds_isIngredientProduct
{
  return objc_msgSend(a1, "_meds_isA:", 844);
}

- (uint64_t)meds_isClinicalProduct
{
  return objc_msgSend(a1, "_meds_isA:", 842);
}

- (uint64_t)meds_isRoutedDoseFormProduct
{
  return objc_msgSend(a1, "_meds_isA:", 843);
}

- (uint64_t)meds_isTradeNameProduct
{
  return objc_msgSend(a1, "_meds_isA:", 845);
}

- (id)meds_preferredNameForFirstObjectOfRelationshipType:()Medications
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "firstConceptOfRelationshipType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedPreferredName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)meds_englishUSName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "firstAttributeForType:", 960);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
