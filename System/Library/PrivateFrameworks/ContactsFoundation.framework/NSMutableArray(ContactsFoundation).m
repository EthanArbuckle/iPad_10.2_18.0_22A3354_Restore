@implementation NSMutableArray(ContactsFoundation)

- (void)_cn_addNonNilObject:()ContactsFoundation
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)_cn_removeObjectsPassingTest:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__NSMutableArray_ContactsFoundation___cn_removeObjectsPassingTest___block_invoke;
  v7[3] = &unk_1E29B8FD8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v5);

}

- (void)_cn_insertNonNilObject:()ContactsFoundation atIndex:
{
  if (a3)
    return (void *)objc_msgSend(a1, "insertObject:atIndex:");
  return a1;
}

- (void)_cn_addObject:()ContactsFoundation count:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__NSMutableArray_ContactsFoundation___cn_addObject_count___block_invoke;
  v9[3] = &unk_1E29B8C10;
  v9[4] = a1;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "_cn_times:", v9);

}

- (void)_cn_rotateRange:()ContactsFoundation by:
{
  uint64_t v6;
  NSUInteger v9;
  NSRange v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;
  NSRange v22;

  if ((unint64_t)a4 >= 2)
  {
    v6 = (a4 & ((a5 % a4) >> 63)) + a5 % a4;
    if (v6)
    {
      v9 = objc_msgSend(a1, "count");
      v19.location = 0;
      v19.length = v9;
      v22.location = a3;
      v22.length = a4;
      v10 = NSIntersectionRange(v19, v22);
      if (a3 != v10.location || a4 != v10.length)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v20.location = a3;
        v20.length = a4;
        NSStringFromRange(v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21.location = 0;
        v21.length = v9;
        NSStringFromRange(v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("rotation range (%@) out of bounds (%@)"), v14, v15);
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], v16, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v17);
      }
      v11 = a3 + a4 - v6;
      objc_msgSend(a1, "subarrayWithRange:", v11, v6);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "removeObjectsInRange:", v11, v6);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertObjects:atIndexes:", v18, v12);

    }
  }
}

- (void)_cn_addNonNilObjectIfNotPresent:()ContactsFoundation
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(a1, "containsObject:") & 1) == 0)
    objc_msgSend(a1, "_cn_addNonNilObject:", v4);

}

- (uint64_t)_cn_addObject:()ContactsFoundation orPlaceholder:
{
  if (!a3)
    a3 = a4;
  return objc_msgSend(a1, "addObject:", a3);
}

- (void)_cn_reverseObjectsInRange:()ContactsFoundation
{
  void *v7;
  id v8;

  if (a4 >= 2)
  {
    objc_msgSend(a1, "subarrayWithRange:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cn_reversed");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v8);
  }
}

- (void)_cn_sortUsingAuxiliarySortOrder:()ContactsFoundation transform:
{
  id v2;

  +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:transform:](_CNSortsByPositionInAuxiliaryArray, "comparatorForSortingAccordingToAuxiliaryValues:transform:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sortUsingComparator:", v2);

}

@end
