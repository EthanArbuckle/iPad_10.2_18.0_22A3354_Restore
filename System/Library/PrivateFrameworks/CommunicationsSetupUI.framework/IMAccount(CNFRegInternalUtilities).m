@implementation IMAccount(CNFRegInternalUtilities)

- (uint64_t)CNFRegRegisteringLocalPhoneNumberSentinelAlias
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!CNFRegSupportsLocalPhoneNumberSentinelAlias()
    || objc_msgSend(a1, "accountType") != 1
    || objc_msgSend(a1, "registrationStatus") < 3)
  {
    return 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "aliases", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x24BE50A38];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToIgnoringCase:", v7))
          v5 = 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
    v9 = v5 & 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)CNFRegSignInComplete
{
  return objc_msgSend(a1, "registrationStatus") == 5;
}

- (uint64_t)CNFRegIsSignedOut
{
  if ((objc_msgSend(a1, "isOperational") & 1) != 0 || (objc_msgSend(a1, "canSendMessages") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "BOOLForKey:", CFSTR("AccountSignedOut"));
}

- (BOOL)CNFRegSignInFailed
{
  return objc_msgSend(a1, "registrationStatus") == -1;
}

@end
