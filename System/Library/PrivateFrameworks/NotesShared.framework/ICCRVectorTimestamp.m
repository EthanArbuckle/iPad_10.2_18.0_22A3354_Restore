@implementation ICCRVectorTimestamp

- (ICCRVectorTimestamp)init
{
  ICCRVectorTimestamp *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *clock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCRVectorTimestamp;
  v2 = -[ICCRVectorTimestamp init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clock = v2->_clock;
    v2->_clock = v3;

  }
  return v2;
}

- (unint64_t)clockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clock");

  return v4;
}

- (ICCRVectorTimestamp)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCRVectorTimestamp *v6;
  ICCRVectorTimestamp *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 8)
    v6 = -[ICCRVectorTimestamp initWithProtobufTimestamp:decoder:](self, "initWithProtobufTimestamp:decoder:", *(_QWORD *)(v5 + 40), v4);
  else
    v6 = -[ICCRVectorTimestamp init](self, "init");
  v7 = v6;

  return v7;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::VectorTimestamp *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 8)
  {
    v6 = *(CRDT::VectorTimestamp **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 8;
    v6 = (CRDT::VectorTimestamp *)operator new();
    CRDT::VectorTimestamp::VectorTimestamp(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCRVectorTimestamp encodeIntoProtobufTimestamp:coder:](self, "encodeIntoProtobufTimestamp:coder:", v6, v7);

}

- (ICCRVectorTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4
{
  id v6;
  ICCRVectorTimestamp *v7;
  int v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  ICCRVectorTimestampElement *v13;
  ICCRVectorTimestampElement *v14;
  int v15;

  v6 = a4;
  v7 = -[ICCRVectorTimestamp init](self, "init");
  if (v7)
  {
    v8 = *((_DWORD *)a3 + 12);
    if (v8)
    {
      v9 = (uint64_t *)*((_QWORD *)a3 + 5);
      v10 = v9;
      do
      {
        v11 = *v10;
        if ((*(_BYTE *)(*v10 + 32) & 1) != 0)
        {
          objc_msgSend(v6, "decodeUUIDFromUUIDIndex:", *(_QWORD *)(v11 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc_init(ICCRVectorTimestampElement);
          v14 = v13;
          v15 = *(_DWORD *)(v11 + 32);
          if ((v15 & 2) != 0)
          {
            -[ICCRVectorTimestampElement setClock:](v13, "setClock:", *(_QWORD *)(v11 + 48));
            v15 = *(_DWORD *)(v11 + 32);
          }
          if ((v15 & 4) != 0)
            -[ICCRVectorTimestampElement setSubclock:](v14, "setSubclock:", *(_QWORD *)(v11 + 56));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_clock, "setObject:forKeyedSubscript:", v14, v12);

          v9 = (uint64_t *)*((_QWORD *)a3 + 5);
          v8 = *((_DWORD *)a3 + 12);
        }
        ++v10;
      }
      while (v10 != &v9[v8]);
    }
  }

  return v7;
}

- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  CRDT::VectorTimestamp_Element *v16;
  uint64_t v17;
  int32x2_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_clock, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *((_DWORD *)a3 + 13);
        v14 = *((int *)a3 + 12);
        if ((int)v14 >= v13)
        {
          if (v13 == *((_DWORD *)a3 + 14))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 10, v13 + 1);
          v16 = google::protobuf::internal::GenericTypeHandler<CRDT::VectorTimestamp_Element>::New();
          v17 = *((_QWORD *)a3 + 5);
          v18 = *(int32x2_t *)((char *)a3 + 48);
          *((int32x2_t *)a3 + 6) = vadd_s32(v18, (int32x2_t)0x100000001);
          *(_QWORD *)(v17 + 8 * v18.i32[0]) = v16;
        }
        else
        {
          v15 = *((_QWORD *)a3 + 5);
          *((_DWORD *)a3 + 12) = v14 + 1;
          v16 = *(CRDT::VectorTimestamp_Element **)(v15 + 8 * v14);
        }
        v19 = objc_msgSend(v6, "encodeUUIDIndexFromUUID:", v11);
        *((_DWORD *)v16 + 8) |= 1u;
        *((_QWORD *)v16 + 5) = v19;
        if (objc_msgSend(v12, "clock"))
        {
          v20 = objc_msgSend(v12, "clock");
          *((_DWORD *)v16 + 8) |= 2u;
          *((_QWORD *)v16 + 6) = v20;
        }
        if (objc_msgSend(v12, "subclock"))
        {
          v21 = objc_msgSend(v12, "subclock");
          *((_DWORD *)v16 + 8) |= 4u;
          *((_QWORD *)v16 + 7) = v21;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCRVectorTimestamp *v4;

  v4 = -[ICCRVectorTimestamp init](+[ICCRVectorTimestamp allocWithZone:](ICCRVectorTimestamp, "allocWithZone:", a3), "init");
  -[ICCRVectorTimestamp mergeWith:](v4, "mergeWith:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ICCRVectorTimestamp compare:](self, "compare:", v4) == 0;

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_clock, "count");
}

- (id)timestampForReplica:(id)a3
{
  id v4;
  ICCRTimestamp *v5;

  v4 = a3;
  v5 = -[ICCRTimestamp initWithReplica:andCounter:]([ICCRTimestamp alloc], "initWithReplica:andCounter:", v4, -[ICCRVectorTimestamp clockForUUID:](self, "clockForUUID:", v4));

  return v5;
}

- (id)clockElementForUUID:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)subclockForUUID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "subclock");

  return v4;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4
{
  ICCRVectorTimestampElement *v6;
  id v7;

  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:");
  v6 = (ICCRVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = objc_alloc_init(ICCRVectorTimestampElement);
  -[ICCRVectorTimestampElement setClock:](v6, "setClock:", a3);
  -[NSMutableDictionary setObject:forKey:](self->_clock, "setObject:forKey:", v6, v7);

}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  ICCRVectorTimestampElement *v8;
  id v9;

  v9 = a5;
  v8 = objc_alloc_init(ICCRVectorTimestampElement);
  -[ICCRVectorTimestampElement setClock:](v8, "setClock:", a3);
  -[ICCRVectorTimestampElement setSubclock:](v8, "setSubclock:", a4);
  -[NSMutableDictionary setObject:forKey:](self->_clock, "setObject:forKey:", v8, v9);

}

- (void)incrementClockForUUID:(id)a3
{
  id v4;

  v4 = a3;
  -[ICCRVectorTimestamp setClock:forUUID:](self, "setClock:forUUID:", -[ICCRVectorTimestamp clockForUUID:](self, "clockForUUID:") + 1, v4);

}

- (void)maxClock:(unint64_t)a3 forUUID:(id)a4
{
  ICCRVectorTimestampElement *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:");
  v6 = (ICCRVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = objc_alloc_init(ICCRVectorTimestampElement);
  v7 = -[ICCRVectorTimestampElement clock](v6, "clock");
  if (v7 <= a3)
    v8 = a3;
  else
    v8 = v7;
  -[ICCRVectorTimestampElement setClock:](v6, "setClock:", v8);
  -[NSMutableDictionary setObject:forKey:](self->_clock, "setObject:forKey:", v6, v9);

}

- (void)removeUUID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_clock, "removeObjectForKey:", a3);
}

- (id)allUUIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_clock, "allKeys");
}

- (id)sortedUUIDs
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_clock, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_CR_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[ICCRVectorTimestamp allUUIDs](self, "allUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
  {

    v22 = 0;
    goto LABEL_21;
  }
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v27;
  v24 = 4;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
      -[ICCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clockElementForUUID:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "clock");
      if (v17 < objc_msgSend(v16, "clock"))
      {
LABEL_7:
        v11 = 1;
        goto LABEL_12;
      }
      v18 = objc_msgSend(v15, "clock");
      if (v18 <= objc_msgSend(v16, "clock"))
      {
        v19 = objc_msgSend(v15, "subclock");
        if (v19 < objc_msgSend(v16, "subclock"))
          goto LABEL_7;
        v20 = objc_msgSend(v15, "subclock");
        v10 |= v20 > objc_msgSend(v16, "subclock");
      }
      else
      {
        v10 = 1;
      }
LABEL_12:

      if ((v11 & v10 & 1) != 0)
      {
        LOBYTE(v11) = 1;
        goto LABEL_19;
      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
      continue;
    break;
  }
  v21 = 4;
  if ((v10 & 1) == 0)
    v21 = 0;
  v24 = v21;
LABEL_19:

  v22 = v24 | v11 & 1;
LABEL_21:

  return v22;
}

- (void)minusVectorTimestamp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allUUIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[ICCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clockElementForUUID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "clock");
        if (v12 < objc_msgSend(v11, "clock")
          || (v13 = objc_msgSend(v10, "clock"), v13 == objc_msgSend(v11, "clock"))
          && (v14 = objc_msgSend(v10, "subclock"), v14 <= objc_msgSend(v11, "subclock")))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_clock, "removeObjectForKey:", v9);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)mergeWith:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allUUIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[ICCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clockElementForUUID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "clock");
        if (v12 > objc_msgSend(v11, "clock")
          || (v15 = objc_msgSend(v10, "clock"), v15 == objc_msgSend(v11, "clock"))
          && (v16 = objc_msgSend(v10, "subclock"), v16 > objc_msgSend(v11, "subclock")))
        {
          v13 = objc_msgSend(v10, "clock");
          v14 = objc_msgSend(v10, "subclock");
        }
        else
        {
          v13 = objc_msgSend(v11, "clock");
          v14 = objc_msgSend(v11, "subclock");
        }
        -[ICCRVectorTimestamp setClock:subclock:forUUID:](self, "setClock:subclock:forUUID:", v13, v14, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot calculate deltas for vector timestamps."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)tombstone
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot tombstone a non-value / non-identified object."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)shortDescription
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[ICCRVectorTimestamp count](self, "count"))
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("{"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[ICCRVectorTimestamp sortedUUIDs](self, "sortedUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[ICCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "CR_shortDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@:%lu "), v10, objc_msgSend(v9, "clock"));

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    -[__CFString replaceCharactersInRange:withString:](v3, "replaceCharactersInRange:withString:", -[__CFString length](v3, "length") - 1, 1, CFSTR("}"));
  }
  else
  {
    v3 = CFSTR("{}");
  }
  return v3;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p (\n"), v5, self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICCRVectorTimestamp sortedUUIDs](self, "sortedUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[ICCRVectorTimestamp clockElementForUUID:](self, "clockElementForUUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@:%lu.%lu\n"), v10, objc_msgSend(v11, "clock"), objc_msgSend(v11, "subclock"));

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")>"));
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
