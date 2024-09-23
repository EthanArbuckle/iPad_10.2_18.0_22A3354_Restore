@implementation HMServiceGroup(HFReordering)

- (id)hf_displayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_serviceNameComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "composedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  HFServiceNameComponents *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "services", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "room");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (v6)
          {
            if ((objc_msgSend(v6, "isEqual:", v10) & 1) == 0)
            {

              goto LABEL_14;
            }
          }
          else
          {
            v6 = v10;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
LABEL_14:
    v6 = 0;
  }

  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:]([HFServiceNameComponents alloc], "initWithRawServiceName:rawRoomName:", v2, v11);

  return v12;
}

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end
