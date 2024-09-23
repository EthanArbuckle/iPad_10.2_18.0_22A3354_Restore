@implementation NSString(AAMessage)

- (uint64_t)aa_appearsToBeEmail
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return objc_msgSend(a1, "_appearsToBeEmail");
  return result;
}

- (id)_phoneNumberDetector
{
  if (_phoneNumberDetector_onceToken != -1)
    dispatch_once(&_phoneNumberDetector_onceToken, &__block_literal_global_13);
  return (id)_phoneNumberDetector;
}

- (uint64_t)aa_appearsToBePhoneNumber
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    objc_msgSend(a1, "_phoneNumberDetector");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchesInString:options:range:", a1, 0, 0, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v4;
    v2 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "resultType", (_QWORD)v9) == 2048)
          {
            v2 = 1;
            goto LABEL_12;
          }
        }
        v2 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v2;
}

+ (id)aa_handleForIDSDestination:()AAMessage
{
  return (id)IDSCopyRawAddressForDestination();
}

@end
