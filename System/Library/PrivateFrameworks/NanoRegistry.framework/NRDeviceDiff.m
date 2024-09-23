@implementation NRDeviceDiff

- (NRDeviceDiff)initWithDiffPropertyDiffs:(id)a3
{
  id v5;
  NRDeviceDiff *v6;
  NRDeviceDiff *v7;
  NRDeviceDiff *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRDeviceDiff;
  v6 = -[NRDeviceDiff init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_diffPropertyDiffs, a3), !objc_msgSend(v5, "count")))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (id)diffPropertyDiffForName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_diffPropertyDiffs, "objectForKeyedSubscript:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSDictionary countByEnumeratingWithState:objects:count:](self->_diffPropertyDiffs, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_diffPropertyDiffs, "count");
}

- (id)allPropertyNames
{
  return -[NSDictionary allKeys](self->_diffPropertyDiffs, "allKeys");
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
  +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", *(_QWORD *)(a1 + 8), CFSTR("device property diff type"), a1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v6, CFSTR("device property diff type key"), v7, a1);

        objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v8, CFSTR("device property diff type property"), v9, a1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

- (NRDeviceDiff)initWithCoder:(id)a3
{
  id v4;
  NRDeviceDiff *v5;
  uint64_t v6;
  void *v7;
  NRPBDeviceDiff *v8;
  NRDeviceDiff *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *diffPropertyDiffs;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDeviceDiff init](self, "init");
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("properties"));
    v13 = objc_claimAutoreleasedReturnValue();
    diffPropertyDiffs = v5->_diffPropertyDiffs;
    v5->_diffPropertyDiffs = (NSDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_diffPropertyDiffs, CFSTR("device property diff type"), v5);
    -[NRDeviceDiff _createIndex]((uint64_t)v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDeviceDiff initWithData:]([NRPBDeviceDiff alloc], "initWithData:", v6);
  v9 = -[NRDeviceDiff initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRDeviceDiff protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (NRDeviceDiff)initWithProtobuf:(id)a3
{
  _QWORD *v4;
  NRDeviceDiff *v5;
  void *v6;
  unint64_t v7;
  void *i;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NRDevicePropertyDiffType *v17;
  uint64_t v18;
  NSDictionary *diffPropertyDiffs;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRDeviceDiff;
  v5 = -[NRDeviceDiff init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v4)
      goto LABEL_10;
LABEL_3:
    for (i = (void *)v4[2]; ; i = 0)
    {
      v9 = i;
      v10 = objc_msgSend(v9, "count");

      if (v7 >= v10)
        break;
      if (v4)
        v11 = (void *)v4[2];
      else
        v11 = 0;
      v12 = v11;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        v14 = (void *)v4[1];
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[NRDevicePropertyDiffType initWithProtobuf:]([NRDevicePropertyDiffType alloc], "initWithProtobuf:", v16);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v13);

      ++v7;
      if (v4)
        goto LABEL_3;
LABEL_10:
      ;
    }
    v18 = objc_msgSend(v6, "copy");
    diffPropertyDiffs = v5->_diffPropertyDiffs;
    v5->_diffPropertyDiffs = (NSDictionary *)v18;

    -[NRDeviceDiff _createIndex]((uint64_t)v5);
  }

  return v5;
}

- (NRPBDeviceDiff)protobuf
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NRDeviceDiff *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  NRMiniUUIDSet *v21;
  NRDevicePropertyDiff *v22;
  NRDevicePropertyDiffType *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceDiff setNames:](v3, v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceDiff setDiffs:](v3, v5);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = 8;
  obj = self->_diffPropertyDiffs;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v10 = CFSTR("capabilities");
    v30 = CFSTR("capabilities");
    v31 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      v32 = v8;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "objectForKeyedSubscript:", v12, v30, v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v10))
        {
          v14 = v6;
          v15 = self;
          objc_msgSend(v13, "diff");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v13, "diff");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = -[NRMiniUUIDSet initWithUUIDSet:]([NRMiniUUIDSet alloc], "initWithUUIDSet:", v20);
            v22 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v21);
            v23 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v22, objc_msgSend(v13, "changeType"));

            v13 = v23;
          }
          self = v15;
          v6 = v14;
          v9 = v31;
          v8 = v32;
          v10 = v30;
        }
        if (v3)
        {
          v24 = *(id *)(v3 + 16);
          objc_msgSend(v24, "addObject:", v12);

          v25 = *(void **)(v3 + 8);
        }
        else
        {
          objc_msgSend(0, "addObject:", v12);
          v25 = 0;
        }
        v26 = v25;
        objc_msgSend(v13, "protobuf");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v27);

        ++v11;
      }
      while (v8 != v11);
      v28 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v8 = v28;
    }
    while (v28);
  }

  return (NRPBDeviceDiff *)(id)v3;
}

- (unint64_t)hash
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
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
  v3 = self->_diffPropertyDiffs;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_diffPropertyDiffs, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hash") - v7 + 32 * v7;
        v7 = objc_msgSend(v10, "hash") - v11 + 32 * v11;

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *diffPropertyDiffs;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NRDeviceDiff;
  if (-[NRDiffBase isEqual:](&v8, sel_isEqual_, v4))
  {
    diffPropertyDiffs = self->_diffPropertyDiffs;
    if (diffPropertyDiffs == (NSDictionary *)v4[1])
      v6 = 1;
    else
      v6 = -[NSDictionary isEqual:](diffPropertyDiffs, "isEqual:");
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
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSDictionary allKeys](self->_diffPropertyDiffs, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = &stru_1E4499C68;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        -[NSDictionary objectForKeyedSubscript:](self->_diffPropertyDiffs, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR(" "), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v14);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1E4499C68;
  }

  return v7;
}

uint64_t __27__NRDeviceDiff_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffPropertyDiffs, 0);
}

@end
