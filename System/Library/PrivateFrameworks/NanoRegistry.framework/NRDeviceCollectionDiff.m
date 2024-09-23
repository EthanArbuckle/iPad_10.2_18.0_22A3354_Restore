@implementation NRDeviceCollectionDiff

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffDeviceDiffs, 0);
}

- (NRDeviceCollectionDiff)initWithDeviceCollectionDiffDeviceDiffs:(id)a3
{
  id v5;
  NRDeviceCollectionDiff *v6;
  NRDeviceCollectionDiff *v7;
  NRDeviceCollectionDiff *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRDeviceCollectionDiff;
  v6 = -[NRDeviceCollectionDiff init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_diffDeviceDiffs, a3), !objc_msgSend(v5, "count")))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (id)diffCollectionDiffForPairingID:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_diffDeviceDiffs, "objectForKeyedSubscript:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSDictionary countByEnumeratingWithState:objects:count:](self->_diffDeviceDiffs, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_diffDeviceDiffs, "count");
}

- (id)allPairingIDs
{
  return -[NSDictionary allKeys](self->_diffDeviceDiffs, "allKeys");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = *(id *)(a1 + 8);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v6, CFSTR("device collection diff type key"), v7, a1);

        objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v8, CFSTR("device collection diff type value"), v9, a1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

- (NRDeviceCollectionDiff)initWithCoder:(id)a3
{
  id v4;
  NRDeviceCollectionDiff *v5;
  uint64_t v6;
  void *v7;
  NRPBDeviceCollectionDiff *v8;
  NRDeviceCollectionDiff *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *diffDeviceDiffs;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDeviceCollectionDiff init](self, "init");
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("devices"));
    v13 = objc_claimAutoreleasedReturnValue();
    diffDeviceDiffs = v5->_diffDeviceDiffs;
    v5->_diffDeviceDiffs = (NSDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_diffDeviceDiffs, CFSTR("device collection diff type"), v5);
    -[NRDeviceCollectionDiff _createIndex]((uint64_t)v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDeviceCollectionDiff initWithData:]([NRPBDeviceCollectionDiff alloc], "initWithData:", v6);
  v9 = -[NRDeviceCollectionDiff initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRDeviceCollectionDiff protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (NRDeviceCollectionDiff)initWithProtobuf:(id)a3
{
  _QWORD *v4;
  NRDeviceCollectionDiff *v5;
  NRDeviceCollectionDiff *v6;
  void *v7;
  unint64_t v8;
  void *i;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NRDeviceDiffType *v16;
  void *v17;
  id v18;
  void *v19;
  NRDeviceDiffType *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NRDeviceCollectionDiff;
  v5 = -[NRDeviceCollectionDiff init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    v24 = (uint64_t)v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!v4)
      goto LABEL_12;
LABEL_3:
    for (i = (void *)v4[2]; ; i = 0)
    {
      v10 = i;
      v11 = objc_msgSend(v10, "count");

      if (v8 >= v11)
        break;
      if (v4)
        v12 = (void *)v4[2];
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length") == 16)
      {
        objc_msgSend(v14, "toUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [NRDeviceDiffType alloc];
        if (v4)
          v17 = (void *)v4[1];
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v18, "objectAtIndexedSubscript:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[NRDeviceDiffType initWithProtobuf:](v16, "initWithProtobuf:", v19);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v15);

      }
      ++v8;
      if (v4)
        goto LABEL_3;
LABEL_12:
      ;
    }
    v21 = objc_msgSend(v7, "copy");
    v6 = (NRDeviceCollectionDiff *)v24;
    v22 = *(void **)(v24 + 8);
    *(_QWORD *)(v24 + 8) = v21;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v6->_diffDeviceDiffs, CFSTR("device collection diff type"), v6);
    -[NRDeviceCollectionDiff _createIndex](v24);

  }
  return v6;
}

- (NRPBDeviceCollectionDiff)protobuf
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceCollectionDiff setPairingIDs:](v3, v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceCollectionDiff setDiffs:](v3, v5);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_diffDeviceDiffs;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[NSDictionary objectForKeyedSubscript:](self->_diffDeviceDiffs, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          v12 = *(id *)(v3 + 16);
          objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          v14 = *(void **)(v3 + 8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "fromUUID:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(0, "addObject:", v17);

          v14 = 0;
        }
        v15 = v14;
        objc_msgSend(v11, "protobuf");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);

        ++v9;
      }
      while (v7 != v9);
      v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 = v18;
    }
    while (v18);
  }

  return (NRPBDeviceCollectionDiff *)(id)v3;
}

- (unint64_t)hash
{
  NSDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_diffDeviceDiffs;
  v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9) - v6 + 32 * v6;
      }
      v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *diffDeviceDiffs;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NRDeviceCollectionDiff;
  if (-[NRDiffBase isEqual:](&v8, sel_isEqual_, v4))
  {
    diffDeviceDiffs = self->_diffDeviceDiffs;
    if (diffDeviceDiffs == (NSDictionary *)v4[1])
      v6 = 1;
    else
      v6 = -[NSDictionary isEqual:](diffDeviceDiffs, "isEqual:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSDictionary allKeys](self->_diffDeviceDiffs, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = &stru_1E4499C68;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[NSDictionary objectForKeyedSubscript:](self->_diffDeviceDiffs, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByPaddingToLength:withString:startingAtIndex:", 36, CFSTR(" "), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1E4499C68;
  }

  return v7;
}

uint64_t __37__NRDeviceCollectionDiff_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 0);
  return v7;
}

@end
