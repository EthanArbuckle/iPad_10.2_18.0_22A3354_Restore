@implementation ICCROneOf

- (ICCROneOf)init
{
  ICCROneOf *v2;
  uint64_t v3;
  NSMapTable *timestamps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCROneOf;
  v2 = -[ICCROneOf init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    timestamps = v2->_timestamps;
    v2->_timestamps = (NSMapTable *)v3;

  }
  return v2;
}

- (ICCROneOf)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCROneOf *v6;
  uint64_t v7;
  NSMapTable *timestamps;
  CRDT::OneOf *v9;
  uint64_t v10;
  ICCROneOf *v11;
  CRDT::OneOf_Element *v12;
  CRDT::OneOf_Element *v13;
  uint64_t *i;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ICCRTimestamp *v20;
  ICCRTimestamp *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  ICCROneOf *v26;
  ICCROneOf *v27;
  objc_super v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) != 12)
    goto LABEL_6;
  v28.receiver = self;
  v28.super_class = (Class)ICCROneOf;
  v6 = -[ICCROneOf init](&v28, sel_init);
  if (!v6)
  {
    self = 0;
LABEL_6:
    v11 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = objc_claimAutoreleasedReturnValue();
  timestamps = v6->_timestamps;
  v6->_timestamps = (NSMapTable *)v7;

  if (*(_DWORD *)(v5 + 48) == 12)
    v10 = *(_QWORD *)(v5 + 40);
  else
    v10 = CRDT::OneOf::default_instance(v9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(v10 + 48));
  v12 = (CRDT::OneOf_Element *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (*(_DWORD *)(v10 + 48))
  {
    for (i = *(uint64_t **)(v10 + 40); i != (uint64_t *)(*(_QWORD *)(v10 + 40) + 8 * *(int *)(v10 + 48)); ++i)
    {
      v15 = *i;
      v16 = *(_DWORD *)(*i + 32);
      if ((v16 & 1) != 0)
      {
        v19 = *(_QWORD *)(v15 + 40);
        if (!v19)
          v19 = *(_QWORD *)(CRDT::OneOf_Element::default_instance(v12) + 40);
        objc_msgSend(v4, "decodeObjectForProtobufObjectID:", v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(_DWORD *)(v15 + 32) & 2) != 0)
        {
LABEL_16:
          v20 = [ICCRTimestamp alloc];
          v21 = v20;
          v22 = *(_QWORD *)(v15 + 48);
          if (!v22)
            v22 = *(_QWORD *)(CRDT::OneOf_Element::default_instance((CRDT::OneOf_Element *)v20) + 48);
          v23 = -[ICCRTimestamp initWithProtobufTimestamp:decoder:](v21, "initWithProtobufTimestamp:decoder:", v22, v4);
          v18 = (void *)v23;
          if (v17 && v23)
          {
            -[CRDT::OneOf_Element addObject:](v13, "addObject:", v17);
            -[CRDT::OneOf_Element addObject:](v13, "addObject:", v18);
          }
          goto LABEL_21;
        }
      }
      else
      {
        v17 = 0;
        if ((v16 & 2) != 0)
          goto LABEL_16;
      }
      v18 = 0;
LABEL_21:

    }
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __31__ICCROneOf_initWithICCRCoder___block_invoke;
  v25[3] = &unk_1E76CB898;
  self = v13;
  v26 = self;
  v11 = v6;
  v27 = v11;
  objc_msgSend(v4, "addDecoderCompletionHandler:dependency:for:", v25, 0, v11);

LABEL_23:
  return v11;
}

void __31__ICCROneOf_initWithICCRCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i < v3; i += 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "timestamps");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v7);

    }
  }
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
  uint64_t i;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  CRDT::OneOf_Element *v16;
  uint64_t v17;
  int32x2_t v18;
  CRDT::ObjectID *v19;
  void *v20;
  void *v21;
  CRDT::Timestamp *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForEncoding");
  v6 = v5;
  if (*(_DWORD *)(v5 + 48) == 12)
  {
    v7 = *(int **)(v5 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v5);
    *(_DWORD *)(v6 + 48) = 12;
    v7 = (int *)operator new();
    CRDT::OneOf::OneOf((CRDT::OneOf *)v7);
    *(_QWORD *)(v6 + 40) = v7;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICCROneOf timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = v7[13];
        v14 = v7[12];
        if ((int)v14 >= v13)
        {
          if (v13 == v7[14])
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 10, v13 + 1);
          v16 = google::protobuf::internal::GenericTypeHandler<CRDT::OneOf_Element>::New();
          v17 = *((_QWORD *)v7 + 5);
          v18 = *(int32x2_t *)(v7 + 12);
          *((int32x2_t *)v7 + 6) = vadd_s32(v18, (int32x2_t)0x100000001);
          *(_QWORD *)(v17 + 8 * v18.i32[0]) = v16;
        }
        else
        {
          v15 = *((_QWORD *)v7 + 5);
          v7[12] = v14 + 1;
          v16 = *(CRDT::OneOf_Element **)(v15 + 8 * v14);
        }
        *((_DWORD *)v16 + 8) |= 1u;
        v19 = (CRDT::ObjectID *)*((_QWORD *)v16 + 5);
        if (!v19)
        {
          v19 = (CRDT::ObjectID *)operator new();
          CRDT::ObjectID::ObjectID(v19);
          *((_QWORD *)v16 + 5) = v19;
        }
        objc_msgSend(v4, "encodeObject:forObjectID:", v12, v19);
        -[ICCROneOf timestamps](self, "timestamps");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        *((_DWORD *)v16 + 8) |= 2u;
        v22 = (CRDT::Timestamp *)*((_QWORD *)v16 + 6);
        if (!v22)
        {
          v22 = (CRDT::Timestamp *)operator new();
          CRDT::Timestamp::Timestamp(v22);
          *((_QWORD *)v16 + 6) = v22;
        }
        objc_msgSend(v21, "encodeIntoProtobufTimestamp:coder:", v22, v4);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

}

- (id)timestampForNewItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  ICCRTimestamp *v12;
  void *v13;
  void *v14;
  void *v15;
  ICCRTimestamp *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICCROneOf set](self, "set", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        -[ICCROneOf timestamps](self, "timestamps");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4 || objc_msgSend(v4, "compare:", v10) == 1)
        {
          v11 = v10;

          v4 = v11;
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v12 = [ICCRTimestamp alloc];
  -[ICCROneOf set](self, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "document");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replica");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICCRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v15, objc_msgSend(v4, "counter") - 1);

  return v16;
}

- (void)setSet:(id)a3
{
  ICCRSet *v5;
  ICCRSet *set;
  ICCRSet *v7;

  v5 = (ICCRSet *)a3;
  set = self->_set;
  v7 = v5;
  if (set != v5)
  {
    -[ICCRSet removeObserver:](set, "removeObserver:", self);
    objc_storeStrong((id *)&self->_set, a3);
    -[ICCRSet addObserver:](v7, "addObserver:", self);
  }

}

- (void)setUpdated:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICCROneOf set](self, "set", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[ICCROneOf timestamps](self, "timestamps");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          -[ICCROneOf timestamps](self, "timestamps");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCROneOf timestampForNewItem](self, "timestampForNewItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v12, v8);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)addItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ICCROneOf timestamps](self, "timestamps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCROneOf timestampForNewItem](self, "timestampForNewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

- (id)contents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICCROneOf set](self, "set", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[ICCROneOf timestamps](self, "timestamps");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5 || objc_msgSend(v5, "compare:", v11) == -1)
        {
          v12 = v11;

          v13 = v9;
          v4 = v13;
          v5 = v12;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)setContents:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  ICCRTimestamp *v9;
  void *v10;
  void *v11;
  void *v12;
  ICCRTimestamp *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[ICCROneOf set](self, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v22);

  if ((v5 & 1) != 0)
  {
    -[ICCROneOf timestamps](self, "timestamps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCROneOf contents](self, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [ICCRTimestamp alloc];
    -[ICCROneOf set](self, "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replica");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICCRTimestamp initWithReplica:andCounter:](v9, "initWithReplica:andCounter:", v12, objc_msgSend(v8, "counter") + 1);

    -[ICCROneOf timestamps](self, "timestamps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mergeWith:", v13);

    v16 = -[ICCRTimestamp counter](v13, "counter");
    -[ICCROneOf set](self, "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "document");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unserializedReplicaClock");

    if (v16 <= v19)
      v16 = v19;
    -[ICCROneOf set](self, "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "document");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUnserializedReplicaClock:", v16);

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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge ICCROneOf, classes must be equal for merge."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "timestamps", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "timestamps");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICCROneOf timestamps](self, "timestamps");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "mergeWith:", v11);
        }
        else
        {
          -[ICCROneOf timestamps](self, "timestamps");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v11, v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (ICCRSet)set
{
  return self->_set;
}

- (NSMapTable)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end
