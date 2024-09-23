@implementation NSDictionary(PickableRoute)

- (uint64_t)matchesUID:()PickableRoute
{
  void *v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a1, "objectForKey:", AVController_RouteDescriptionKey_RouteUID);
  if (v5 && objc_msgSend(v5, "rangeOfString:", a3) != 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  result = objc_msgSend(a1, "objectForKey:", AVController_RouteDescriptionKey_AlternateUIDs);
  if (result)
  {
    v7 = (void *)result;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    result = objc_msgSend((id)result, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v13;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (v11)
        {
          if (objc_msgSend(v11, "rangeOfString:", a3) != 0x7FFFFFFFFFFFFFFFLL)
            return 1;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          result = 0;
          if (v8)
            goto LABEL_6;
          return result;
        }
      }
    }
  }
  return result;
}

@end
