@implementation HKFullMedicationSearchResult

- (HKFullMedicationSearchResult)initWithProductId:(id)a3 packagingName:(id)a4 packagingNDC:(id)a5 productBrandName:(id)a6 productGenericName:(id)a7 route:(id)a8 doseForm:(id)a9
{
  id v16;
  id v17;
  HKFullMedicationSearchResult *v18;
  HKFullMedicationSearchResult *v19;
  void *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v16 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v17 = a9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsSearchResult.m"), 113, CFSTR("productId cannot be nil"));

  }
  v28.receiver = self;
  v28.super_class = (Class)HKFullMedicationSearchResult;
  v18 = -[HKFullMedicationSearchResult init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_productId, a3);
    objc_storeStrong((id *)&v19->_packagingName, a4);
    objc_storeStrong((id *)&v19->_packagingNDC, a5);
    objc_storeStrong((id *)&v19->_productGenericName, a7);
    objc_storeStrong((id *)&v19->_productBrandName, a6);
    objc_storeStrong((id *)&v19->_route, a8);
    objc_storeStrong((id *)&v19->_doseForm, a9);
  }

  return v19;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[8];
  _QWORD v38[8];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HKFullMedicationSearchResult ingredients](self, "ingredients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }

  v37[0] = CFSTR("productId");
  -[HKFullMedicationSearchResult productId](self, "productId");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("(null)");
  v38[0] = v12;
  v37[1] = CFSTR("packagingNDC");
  -[HKFullMedicationSearchResult packagingNDC](self, "packagingNDC");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("(null)");
  v38[1] = v15;
  v37[2] = CFSTR("productGenericName");
  -[HKFullMedicationSearchResult productGenericName](self, "productGenericName");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("(null)");
  v38[2] = v18;
  v37[3] = CFSTR("productBrandName");
  -[HKFullMedicationSearchResult productBrandName](self, "productBrandName");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("(null)");
  v38[3] = v21;
  v37[4] = CFSTR("packagingName");
  -[HKFullMedicationSearchResult packagingName](self, "packagingName");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("(null)");
  v38[4] = v24;
  v37[5] = CFSTR("route");
  -[HKFullMedicationSearchResult route](self, "route");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = CFSTR("(null)");
  v38[5] = v27;
  v37[6] = CFSTR("doseForm");
  -[HKFullMedicationSearchResult doseForm](self, "doseForm");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (const __CFString *)v28;
  else
    v30 = CFSTR("(null)");
  v37[7] = CFSTR("ingredients");
  v38[6] = v30;
  v38[7] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (NSString)productId
{
  return self->_productId;
}

- (NSString)packagingName
{
  return self->_packagingName;
}

- (NSString)packagingNDC
{
  return self->_packagingNDC;
}

- (NSString)productBrandName
{
  return self->_productBrandName;
}

- (NSString)productGenericName
{
  return self->_productGenericName;
}

- (NSString)route
{
  return self->_route;
}

- (NSString)doseForm
{
  return self->_doseForm;
}

- (NSArray)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_doseForm, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_productGenericName, 0);
  objc_storeStrong((id *)&self->_productBrandName, 0);
  objc_storeStrong((id *)&self->_packagingNDC, 0);
  objc_storeStrong((id *)&self->_packagingName, 0);
  objc_storeStrong((id *)&self->_productId, 0);
}

@end
