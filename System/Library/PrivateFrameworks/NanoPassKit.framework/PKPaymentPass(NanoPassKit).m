@implementation PKPaymentPass(NanoPassKit)

- (BOOL)npkHasUserSelectableContactlessPaymentApplications
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "contactlessActivationGroupingType") != 2)
    return 0;
  objc_msgSend(a1, "deviceContactlessPaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)npkHasMultiplePaymentApplications
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "devicePaymentApplications");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

- (id)npkSortedDeviceContactlessPaymentApplications
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "deviceContactlessPaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sortedPaymentApplications:ascending:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)npkDevicePaymentApplicationForAID:()NanoPassKit
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  objc_msgSend(a1, "devicePaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaymentPass_NanoPassKit__npkDevicePaymentApplicationForAID___block_invoke;
  v9[3] = &unk_24CFE7EE0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)npkPreferredContactlessPaymentApplication
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "deviceContactlessPaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "devicePrimaryContactlessPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "npkHasUserSelectableContactlessPaymentApplications"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE6ED30]);
    objc_msgSend(a1, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultPaymentApplicationForPassUniqueIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v2, "containsObject:", v6))
    {
      v7 = v6;

      v3 = v7;
    }

  }
  return v3;
}

- (void)npkSetPreferredPaymentApplication:()NanoPassKit
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "devicePaymentApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE6ED30]);
    objc_msgSend(a1, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultPaymentApplication:forPassUniqueIdentifier:completion:", v8, v7, 0);

  }
}

- (BOOL)npkIsInActivatingState
{
  return objc_msgSend(a1, "effectiveContactlessPaymentApplicationState") == 2;
}

- (BOOL)npkIsInActivatedState
{
  objc_msgSend(a1, "effectiveContactlessPaymentApplicationState");
  return PKPaymentApplicationStateIsPersonalized() != 0;
}

- (BOOL)npkIsInSuspendedState
{
  objc_msgSend(a1, "effectiveContactlessPaymentApplicationState");
  return PKPaymentApplicationStateIsSuspended() != 0;
}

- (uint64_t)npkHasTransitNetworkIdentifiers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "devicePaymentApplications", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "supportedTransitNetworkIdentifiers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");

        if (v6)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

@end
