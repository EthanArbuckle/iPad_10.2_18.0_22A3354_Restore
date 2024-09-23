@implementation ICCRIndex

+ (id)indexWithPath:(id)a3
{
  id v3;
  ICCRIndex *v4;

  v3 = a3;
  v4 = objc_alloc_init(ICCRIndex);
  -[ICCRIndex setIndexPath:](v4, "setIndexPath:", v3);

  return v4;
}

- (ICCRIndex)init
{
  ICCRIndex *v2;
  NSArray *v3;
  NSArray *indexPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCRIndex;
  v2 = -[ICCRIndex init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    indexPath = v2->_indexPath;
    v2->_indexPath = v3;

  }
  return v2;
}

- (ICCRIndex)initWithICCRCoder:(id)a3
{
  id v4;
  ICCRIndex *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *indexPath;

  v4 = a3;
  v5 = -[ICCRIndex init](self, "init");
  v6 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v6 + 48) == 9)
  {
    v7 = *(_QWORD *)(v6 + 40);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(v7 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_DWORD *)(v7 + 48))
    {
      v9 = *(uint64_t **)(v7 + 40);
      do
      {
        v10 = *v9;
        if ((*(_BYTE *)(*v9 + 32) & 1) != 0)
        {
          objc_msgSend(v4, "decodeUUIDFromUUIDIndex:", *(_QWORD *)(v10 + 40));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        if ((*(_BYTE *)(v10 + 32) & 2) != 0)
          v12 = *(_QWORD *)(v10 + 48);
        else
          v12 = 0;
        +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v9;
      }
      while (v9 != (uint64_t *)(*(_QWORD *)(v7 + 40) + 8 * *(int *)(v7 + 48)));
    }
    v14 = objc_msgSend(v8, "copy");
    indexPath = v5->_indexPath;
    v5->_indexPath = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  CRDT::Index_Element *v16;
  uint64_t v17;
  int32x2_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForEncoding");
  v6 = v5;
  if (*(_DWORD *)(v5 + 48) == 9)
  {
    v7 = *(int **)(v5 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v5);
    *(_DWORD *)(v6 + 48) = 9;
    v7 = (int *)operator new();
    CRDT::Index::Index((CRDT::Index *)v7);
    *(_QWORD *)(v6 + 40) = v7;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ICCRIndex indexPath](self, "indexPath", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v13 = v7[13];
        v14 = v7[12];
        if ((int)v14 >= v13)
        {
          if (v13 == v7[14])
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 10, v13 + 1);
          v16 = google::protobuf::internal::GenericTypeHandler<CRDT::Index_Element>::New();
          v17 = *((_QWORD *)v7 + 5);
          v18 = *(int32x2_t *)(v7 + 12);
          *((int32x2_t *)v7 + 6) = vadd_s32(v18, (int32x2_t)0x100000001);
          *(_QWORD *)(v17 + 8 * v18.i32[0]) = v16;
        }
        else
        {
          v15 = *((_QWORD *)v7 + 5);
          v7[12] = v14 + 1;
          v16 = *(CRDT::Index_Element **)(v15 + 8 * v14);
        }
        objc_msgSend(v12, "replica");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v4, "encodeUUIDIndexFromUUID:", v19);
        *((_DWORD *)v16 + 8) |= 1u;
        *((_QWORD *)v16 + 5) = v20;

        v21 = objc_msgSend(v12, "integer");
        *((_DWORD *)v16 + 8) |= 2u;
        *((_QWORD *)v16 + 6) = v21;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

- (unint64_t)depth
{
  void *v2;
  unint64_t v3;

  -[ICCRIndex indexPath](self, "indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)nextIndexForReplica:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t __buf;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICCRIndex indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  v8 = __buf;
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 % 0x7FFFFFFFFFFFFLL + 1;
  v11 = objc_msgSend(v9, "integer") + v10;

  if (v11 < 0x2000000000000000)
  {
    objc_msgSend(v7, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInteger:", objc_msgSend(v12, "integer") + v10);
  }
  else
  {
    +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", v10, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);
  }

  +[ICCRIndex indexWithPath:](ICCRIndex, "indexWithPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)previousIndexForReplica:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  unint64_t __buf;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICCRIndex indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  v8 = __buf;
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 % 0x7FFFFFFFFFFFFLL;
  v11 = objc_msgSend(v9, "integer") - v10;

  if (v11 > (uint64_t)0xDFFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInteger:", objc_msgSend(v12, "integer") - v10);
  }
  else
  {
    +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", -(uint64_t)v10, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);
  }

  +[ICCRIndex indexWithPath:](ICCRIndex, "indexWithPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)indexAtDepth:(unint64_t)a3 withInteger:(int64_t)a4 replica:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICCRIndex indexPath](self, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICCRIndex depth](self, "depth");
  if (v11 >= a3)
    v12 = a3;
  else
    v12 = v11;
  objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v13, 1);

  while (1)
  {

    if (objc_msgSend(v14, "count") >= a3)
      break;
    +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);
  }
  +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", a4, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  +[ICCRIndex indexWithPath:](ICCRIndex, "indexWithPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)indexForReplica:(id)a3 betweenIndex:(id)a4 andIndex:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  int64_t v34;
  id v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  unint64_t __buf;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v48 = v9;
  if (v8 && v9)
  {
    if (objc_msgSend(v8, "compare:", v9) != -1)
      __assert_rtn("+[ICCRIndex indexForReplica:betweenIndex:andIndex:]", "ICCRIndex.mm", 204, "[before compare:after] == NSOrderedAscending");
    v45 = v7;
    v11 = 0;
    v12 = -1;
    do
    {
      v13 = v12 + 1;
      if (v12 + 1 >= (unint64_t)objc_msgSend(v8, "depth"))
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v8, "indexPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v12 + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integer");

      }
      if (v13 >= objc_msgSend(v10, "depth"))
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v10, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v12 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integer");

      }
      v20 = 0x2000000000000000;
      if ((v11 & 1) == 0)
        v20 = 0;
      v21 = 0xE000000000000000;
      if ((v11 & 1) == 0)
        v21 = 0;
      v22 = v20 + v19 + ~(v16 + v21);
      if (v22 == -1 && v13 < objc_msgSend(v8, "depth") && v13 < objc_msgSend(v10, "depth"))
      {
        objc_msgSend(v8, "indexPath");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndexedSubscript:", v12 + 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "replica");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "indexPath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v12 + 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "replica");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v23, "isEqual:", v26) ^ 1;

      }
      else
      {
        LOBYTE(v27) = 0;
      }
      if (v22)
        v11 = v27;
      else
        v11 = 1;
      ++v12;
      v10 = v48;
    }
    while (v22 < 1);
    __buf = 0;
    v7 = v45;
    arc4random_buf(&__buf, 8uLL);
    if (v22 >= 0x7FFFFFFFFFFFFLL)
      v28 = 0x7FFFFFFFFFFFFLL;
    else
      v28 = v22;
    v29 = __buf;
    v30 = arc4random();
    v31 = v29 % v28 + 1;
    v32 = v31 + v16;
    if (v31 + v16 <= 0x1FFFFFFFFFFFFFFFLL)
      v33 = v8;
    else
      v33 = v48;
    if (v31 + v16 > 0x1FFFFFFFFFFFFFFFLL)
      v32 = v31 + v16 - 0x3FFFFFFFFFFFFFFFLL;
    v34 = v19 - v31;
    if (v34 >= (uint64_t)0xE000000000000000)
      v35 = v48;
    else
      v35 = v8;
    if (v34 < (uint64_t)0xE000000000000000)
      v34 = ~v34;
    v36 = (v30 & 1) == 0;
    if ((v30 & 1) != 0)
      v37 = v35;
    else
      v37 = v33;
    if (v36)
      v38 = v32;
    else
      v38 = v34;
    objc_msgSend(v37, "indexAtDepth:withInteger:replica:", v12, v38, v45);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v48;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "nextIndexForReplica:", v7);
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v9)
      {
        v42 = (void *)MEMORY[0x1E0C99D20];
        +[ICCRIndexElement elementWithInteger:replica:](ICCRIndexElement, "elementWithInteger:replica:", 0, v7);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "arrayWithObject:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICCRIndex indexWithPath:](ICCRIndex, "indexWithPath:", v44);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_49;
      }
      objc_msgSend(v9, "previousIndexForReplica:", v7);
      v40 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (void *)v40;
  }
LABEL_49:

  return v39;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;

  v4 = a3;
  v5 = -[ICCRIndex depth](self, "depth");
  v6 = objc_msgSend(v4, "depth");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      -[ICCRIndex indexPath](self, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "compare:", v12);

      if (v13)
        break;
      if (v7 == ++v8)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v14 = -[ICCRIndex depth](self, "depth");
    if (v14 >= objc_msgSend(v4, "depth"))
    {
      v17 = objc_msgSend(v4, "depth");
      if (v17 >= -[ICCRIndex depth](self, "depth"))
      {
        v13 = 0;
        goto LABEL_16;
      }
      -[ICCRIndex indexPath](self, "indexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v4, "depth"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_msgSend(v16, "integer") >> 63) | 1;
    }
    else
    {
      objc_msgSend(v4, "indexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", -[ICCRIndex depth](self, "depth"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "integer") >= 0)
        v13 = -1;
      else
        v13 = 1;
    }

  }
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICCRIndex indexPath](self, "indexPath", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "hash");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ICCRIndex compare:](self, "compare:", v4) == 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICCRIndex indexPath](self, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIndexPath:", v6);

  return v4;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot calculate deltas for ICCRIndex."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICCRIndex indexPath](self, "indexPath", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "replica");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v12)
        {
          objc_msgSend(v4, "replica");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setReplica:", v13);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICCRIndex indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "replica");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CR_shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("(%@:%lld) "), v13, objc_msgSend(v11, "integer"));

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (NSArray)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
