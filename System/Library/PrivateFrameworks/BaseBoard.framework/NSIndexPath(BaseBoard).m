@implementation NSIndexPath(BaseBoard)

- (id)bs_subpathFromPosition:()BaseBoard
{
  unint64_t v5;

  v5 = objc_msgSend(a1, "length");
  if (v5 <= a3)
    objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
  else
    objc_msgSend(a1, "bs_subpathWithRange:", a3, v5 - a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bs_emptyPath
{
  if (qword_1ECD39B10 != -1)
    dispatch_once(&qword_1ECD39B10, &__block_literal_global_30);
  return (id)_MergedGlobals_34;
}

- (id)bs_subpathWithRange:()BaseBoard
{
  char *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3 + a4 > (unint64_t)objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+BaseBoard.m"), 25, CFSTR("constraint violation: range.location(%lu) + range.length(%lu) <= self.length(%lu)"), a3, a4, objc_msgSend(a1, "length"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = (char *)v12 - ((8 * objc_msgSend(a1, "length") + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "getIndexes:", v8);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", &v8[8 * a3], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)bs_indexPathByAddingPrefix:()BaseBoard
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(a1, "length") + v5;
  if (v6)
  {
    objc_msgSend(v4, "getIndexes:", (char *)v9 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend(a1, "getIndexes:", (char *)&v9[v5] - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", (char *)v9 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (uint64_t)bs_indexPathByRemovingFirstIndex
{
  return objc_msgSend(a1, "bs_subpathFromPosition:", 1);
}

- (BOOL)bs_hasPrefix:()BaseBoard
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t i;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 <= objc_msgSend(a1, "length"))
  {
    if (v5)
    {
      v6 = 0;
      for (i = 0; i != v5; v6 = i >= v5)
      {
        v8 = objc_msgSend(a1, "indexAtPosition:", i);
        if (v8 != objc_msgSend(v4, "indexAtPosition:", i))
          break;
        ++i;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bs_nearestCommonAncestorWithIndexPath:()BaseBoard
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+BaseBoard.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  v6 = objc_msgSend(a1, "length");
  v7 = objc_msgSend(v5, "length");
  if (!v6 || !v7)
    goto LABEL_13;
  v8 = v6 >= v7 ? v7 : v6;
  v9 = (char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  for (i = 0; ; ++i)
  {
    v11 = objc_msgSend(a1, "indexAtPosition:", i);
    if (v11 != objc_msgSend(v5, "indexAtPosition:", i))
      break;
    *(_QWORD *)&v9[8 * i] = objc_msgSend(a1, "indexAtPosition:", i);
  }
  if (!i
    || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v9, i),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
