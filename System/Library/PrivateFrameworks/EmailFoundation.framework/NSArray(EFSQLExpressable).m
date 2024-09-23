@implementation NSArray(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v6 = v4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      v12 = -v9;
      v17 = v9 + v8;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void EFRenderSQLExpression(NSString *__strong, __strong id<NSFastEnumeration>, NSMutableString *__strong, NSString *__strong)");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("EFSQLExpressable.m"), 104, CFSTR("Objects in the %@ must conform to protocol EFSQLValueExpressable"), CFSTR("array"));

        }
        if (v12 != v11)
          objc_msgSend(v6, "appendString:", CFSTR(", "));
        objc_msgSend(v13, "ef_SQLIsolatedExpression");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ef_renderSQLExpressionInto:", v6);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v17;
    }
    while (v8);
  }

}

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable conjoiner:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = v6;
  v10 = v7;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      v16 = -v13;
      v21 = v13 + v12;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void EFRenderSQLExpression(NSString *__strong, __strong id<NSFastEnumeration>, NSMutableString *__strong, NSString *__strong)");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("EFSQLExpressable.m"), 104, CFSTR("Objects in the %@ must conform to protocol EFSQLValueExpressable"), CFSTR("array"));

        }
        if (v16 != v15)
          objc_msgSend(v9, "appendString:", v10);
        objc_msgSend(v17, "ef_SQLIsolatedExpression");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ef_renderSQLExpressionInto:", v9);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v13 = v21;
    }
    while (v12);
  }

}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:](EFParenthesizedSQLExpression, "parenthesizedValueCollectionExpressable:", a1);
}

- (id)ef_SQLExpression
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end
