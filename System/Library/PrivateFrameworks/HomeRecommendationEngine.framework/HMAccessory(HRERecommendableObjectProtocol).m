@implementation HMAccessory(HRERecommendableObjectProtocol)

- (id)_containedRecommendableObjects
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(a1, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMAccessory_HRERecommendableObjectProtocol___containedRecommendableObjects__block_invoke;
  v7[3] = &unk_24F216998;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "na_each:", v7);

  return v5;
}

- (id)hre_actionTypes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_containedRecommendableObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "hre_actionTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "hre_characteristicTypeForActionType:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hre_primaryType
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hre_matchingTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "anyObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)hre_matchingTypes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_containedRecommendableObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_71);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hre_characteristics
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_containedRecommendableObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_72);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hre_isActionable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_containedRecommendableObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_74);

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 0;
}

@end
