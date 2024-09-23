@implementation NSCompoundPredicate(ABPredicateQueryCreation)

- (uint64_t)ab_hasCallback
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v1 = (void *)objc_msgSend(a1, "subpredicates");
  v2 = objc_msgSend(v1, "count");
  if (v2 < 1)
    return 0;
  v3 = v2;
  v4 = 1;
  do
  {
    result = objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", v4 - 1), "hasCallback");
    if (v4 >= v3)
      break;
    ++v4;
  }
  while (!(_DWORD)result);
  return result;
}

- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "subpredicates");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "ab_addCallbackContextToArray:", a3);
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindSelectClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  uint64_t v5;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  LODWORD(v5) = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a1, "subpredicates");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v10 = result;
    v5 = v5;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "ab_bindSelectClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 = result;
      v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindJoinClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  uint64_t v5;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  LODWORD(v5) = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a1, "subpredicates");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v10 = result;
    v5 = v5;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "ab_bindJoinClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 = result;
      v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (uint64_t)ab_bindWhereClauseComponentOfStatement:()ABPredicateQueryCreation withBindingOffset:predicateIdentifier:
{
  uint64_t v5;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  LODWORD(v5) = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a1, "subpredicates");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v10 = result;
    v5 = v5;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "ab_bindWhereClauseComponentOfStatement:withBindingOffset:predicateIdentifier:", a3, a4, v5 + v12);
        ++v12;
      }
      while (v10 != v12);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 = result;
      v5 = (v5 + v12);
    }
    while (result);
  }
  return result;
}

- (id)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:
{
  return +[ABPredicate newQueryFromCompoundPredicate:withSortOrder:ranked:addressBook:propertyIndices:](ABPredicate, "newQueryFromCompoundPredicate:withSortOrder:ranked:addressBook:propertyIndices:", a1, a3, a4, a5, a6);
}

@end
