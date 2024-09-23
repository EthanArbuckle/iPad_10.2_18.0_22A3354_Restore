@implementation NSArray(ITK)

+ (id)itk_arrayFromNonNilObject:()ITK
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return MEMORY[0x24BDBD1A8];
  v7[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itk_randomObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)itk_randomizedArray
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "itk_randomize");
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)itk_generateAllPermutations
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend((id)objc_opt_class(), "heapsAlgorithm:k:result:", v3, objc_msgSend(v3, "count"), v2);
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

+ (void)heapsAlgorithm:()ITK k:result:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (a4 == 1)
  {
    v9 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (a4 >= 1)
  {
    v10 = 0;
    do
    {
      objc_msgSend(a1, "heapsAlgorithm:k:result:", v12, a4 - 1, v8);
      if ((a4 & 1) != 0)
        v11 = 0;
      else
        v11 = v10;
      objc_msgSend(v12, "exchangeObjectAtIndex:withObjectAtIndex:", v11, a4 - 1);
      ++v10;
    }
    while (a4 != v10);
  }

}

- (id)itk_objectPassingTest:()ITK
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)itk_countOfObjectsPassingTest:()ITK
{
  unsigned int (**v4)(id, _QWORD, uint64_t, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v5);
      v9 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), v8 + v11, &v17);
      if (v17)
        break;
      if (v7 == ++v11)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        v8 += v11;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)itk_arrayFromReplacingObject:()ITK withObject:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = a1;
  v8 = objc_msgSend(v7, "indexOfObject:", a3);
  if (v6)
  {
    v9 = v8;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v6);
      v11 = objc_msgSend(v10, "copy");

      v7 = (id)v11;
    }
  }
  else
  {
    +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ITKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "newObject", "-[NSArray(ITK) itk_arrayFromReplacingObject:withObject:]", 0, 0, CFSTR("itk_arrayFromReplacingObject, Trying to replace an object with nil."));
  }

  return v7;
}

- (BOOL)itk_containsObjectPassingTest:()ITK
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "itk_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)itk_objectsPassingTest:()ITK
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itk_objectsOfClass:()ITK
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__NSArray_ITK__itk_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "itk_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itk_firstObjectOfClass:()ITK
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "itk_objectsOfClass:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)itk_safeObjectAtIndex:()ITK
{
  void *v5;

  if ((a3 & 0x8000000000000000) != 0)
  {
    v5 = 0;
  }
  else if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)itk_objectsConformingToProtocol:()ITK
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__NSArray_ITK__itk_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_250F9E4D0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "itk_objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itk_arrayByGroupingIntoArraysWithMaxCount:()ITK
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v9, "count", (_QWORD)v16);
        if (!v9 || v13 >= a3)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
          v9 = (void *)v14;
        }
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)itk_indexOfSortedObject:()ITK insertionIndex:usingComparator:
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4)
    *a4 = v10;
  if (v10 >= objc_msgSend(a1, "count")
    || (objc_msgSend(a1, "objectAtIndexedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) == 0))
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)itk_indexIsValid:()ITK
{
  return (a3 & 0x8000000000000000) == 0 && objc_msgSend(a1, "count") > a3;
}

- (uint64_t)itk_objectBefore:()ITK
{
  return objc_msgSend(a1, "itk_objectBefore:wrap:", a3, 0);
}

- (uint64_t)itk_objectAfter:()ITK
{
  return objc_msgSend(a1, "itk_objectAfter:wrap:", a3, 0);
}

- (id)itk_objectBefore:()ITK wrap:
{
  uint64_t v6;
  void *v7;
  int v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  v7 = 0;
  if (v6)
    v8 = 1;
  else
    v8 = a4;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v6 + objc_msgSend(a1, "count") - 1) % (unint64_t)objc_msgSend(a1, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)itk_objectAfter:()ITK wrap:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v7 = v6, (a4 & 1) == 0) && v6 == objc_msgSend(a1, "count") - 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v7 + 1) % (unint64_t)objc_msgSend(a1, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)itk_arrayByAddingNonNilObject:()ITK
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "arrayByAddingObject:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)itk_arrayByAddingObjectsFromNonNilArray:()ITK
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)itk_compactMap:()ITK
{
  void (**v4)(id, void *, _QWORD, uint64_t);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, void *, _QWORD, uint64_t);
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == 1)
  {
    objc_msgSend(a1, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v16[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __31__NSArray_ITK__itk_compactMap___block_invoke;
    v12[3] = &unk_250F9E4F8;
    v14 = v4;
    v15 = v9;
    v13 = v10;
    v7 = v10;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  return v8;
}

- (id)itk_map:()ITK
{
  void (**v4)(id, id, _QWORD, uint64_t);
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, id, _QWORD, uint64_t);
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == 1)
  {
    objc_msgSend(a1, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __24__NSArray_ITK__itk_map___block_invoke;
    v12[3] = &unk_250F9E4F8;
    v14 = v4;
    v15 = v9;
    v13 = v10;
    v6 = v10;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
    v8 = (void *)objc_msgSend(v6, "copy");

  }
  return v8;
}

- (id)itk_flatMap:()ITK
{
  void (**v4)(id, id, _QWORD, uint64_t);
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, id, _QWORD, uint64_t);
  uint64_t v14;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == 1)
  {
    objc_msgSend(a1, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __28__NSArray_ITK__itk_flatMap___block_invoke;
    v11[3] = &unk_250F9E4F8;
    v13 = v4;
    v14 = v8;
    v12 = v9;
    v6 = v9;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  return v7;
}

@end
