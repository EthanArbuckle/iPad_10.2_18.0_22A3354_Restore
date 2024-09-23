@implementation PKSecureElementPass(NanoPassKit)

- (unint64_t)npkSupportsBluetooth
{
  return ((unint64_t)objc_msgSend(a1, "allSupportedTechnologies") >> 1) & 1;
}

- (uint64_t)npkSupportsNFC
{
  return objc_msgSend(a1, "allSupportedTechnologies") & 1;
}

- (uint64_t)npkExclusivelyTransactsOverBluetooth
{
  uint64_t result;

  result = objc_msgSend(a1, "npkSupportsBluetooth");
  if ((_DWORD)result)
    return objc_msgSend(a1, "npkSupportsMultipleRadioTypes") ^ 1;
  return result;
}

- (uint64_t)npkExclusivelyTransactsOverNFC
{
  uint64_t result;

  result = objc_msgSend(a1, "npkSupportsNFC");
  if ((_DWORD)result)
    return objc_msgSend(a1, "npkSupportsMultipleRadioTypes") ^ 1;
  return result;
}

- (id)npkSubcredentials
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "devicePrimaryContactlessPaymentApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subcredentials");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)npkSupportUWBSecureRanging
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "devicePrimaryContactlessPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(a1, "npkSupportsBluetooth"))
  {
    objc_msgSend(v2, "state");
    v3 = PKPaymentApplicationStateIsPersonalized() != 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)allSupportedTechnologies
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "paymentApplications");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v7, "subcredentials", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "supportedRadioTechnologies");
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)npkSupportsMultipleRadioTypes
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "allSupportedTechnologies");
  return ((objc_msgSend(a1, "allSupportedTechnologies") - 1) & v2) != 0;
}

- (BOOL)npkIsBankConnectEligible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "paymentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKBankConnectAvailableForPass())
  {
    objc_msgSend(a1, "primaryAccountIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)npkProvidesLinkedAccountFeatureIdentifier
{
  return objc_msgSend(a1, "npkLinkedAccountFeatureIdentifier") != 0;
}

- (uint64_t)npkLinkedAccountFeatureIdentifier
{
  void *v1;
  int v2;

  objc_msgSend(a1, "secureElementPass");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAppleCardPass");

  if (v2)
    return 5;
  else
    return 0;
}

- (uint64_t)npkIsPrecursorPass
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE6EE80], "secureElementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isPrecursorPass:", v2);

  return v3;
}

- (BOOL)npkIsInLostMode
{
  return objc_msgSend(a1, "effectiveContactlessPaymentApplicationState") == 7;
}

@end
