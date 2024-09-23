@implementation HMAccessory(HMUAdditions)

- (BOOL)hmu_isEndpoint
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "siriEndpointProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)hmu_isHomePod
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD49E0]);
  return v3;
}

- (uint64_t)hmu_isAppleTV
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD49A0]);
  return v3;
}

- (uint64_t)hmu_isPartOfHome:()HMUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "isEqual:", v7);
  return v8;
}

+ (uint64_t)hmu_accessoriesExcludingCurrentAccessoryFromAccessories:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_2);
}

+ (id)hmu_accessoriesFromAccessories:()HMUAdditions excludingStereoCompanionForAccessory:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  char v34;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v41 = a4;
  objc_msgSend(v41, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v36 = v6;
    v37 = v5;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v6, "mediaSystems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v40)
    {
      v39 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v51 != v39)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v10 = (void *)objc_opt_new();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v9, "components");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v47 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                objc_msgSend(v16, "role");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "type") == 1)
                {

                }
                else
                {
                  objc_msgSend(v16, "role");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "type");

                  if (v19 != 2)
                    goto LABEL_19;
                }
                objc_msgSend(v16, "mediaProfile");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "accessory");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  objc_msgSend(v21, "uniqueIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "addObject:", v22);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
            }
            while (v13);
          }
LABEL_19:

          objc_msgSend(v41, "uniqueIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v10, "containsObject:", v23);

          if (v24)
          {
            objc_msgSend(v41, "uniqueIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeObject:", v26);

            v25 = (id)objc_opt_new();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v27 = v37;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v43;
              do
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v43 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
                  objc_msgSend(v32, "uniqueIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v10, "containsObject:", v33);

                  if ((v34 & 1) == 0)
                    objc_msgSend(v25, "addObject:", v32);
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
              }
              while (v29);
            }

            v5 = v37;
            goto LABEL_33;
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v40)
          continue;
        break;
      }
    }

    v5 = v37;
    v25 = v37;
LABEL_33:
    v7 = v36;
  }
  else
  {
    v25 = v5;
  }

  return v25;
}

+ (uint64_t)hmu_announceAccessoriesFromAccessories:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_1);
}

@end
