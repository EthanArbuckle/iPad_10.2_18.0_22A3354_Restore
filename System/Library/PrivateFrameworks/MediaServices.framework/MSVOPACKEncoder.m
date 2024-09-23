@implementation MSVOPACKEncoder

+ (id)encodedDataWithRootObject:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MSVOPACKEncoder *v9;
  MSVOPACKEncoder *v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MSVOPACKEncoder);
  v10 = v9;
  if (v7)
    v11 = v7;
  else
    v11 = (id)MEMORY[0x1E0C9AA70];
  -[MSVOPACKEncoder msv_setUserInfo:](v9, "msv_setUserInfo:", v11);

  -[MSVOPACKEncoder encodeRootObject:](v10, "encodeRootObject:", v8);
  -[MSVOPACKEncoder encodedDataWithError:](v10, "encodedDataWithError:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder _encodeNumber:forKey:](self, "_encodeNumber:forKey:", v8, v7);

}

- (void)_encodeNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "unsignedLongValue") & 0x80000000) != 0)
  {
    -[NSMutableArray lastObject](self->_wrapperStack, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E43FC6B8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &unk_1E43FC700;
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

  }
  else
  {
    -[MSVOPACKEncoder encodeObject:forKey:](self, "encodeObject:forKey:", v6, v7);
  }

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *objects;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (!-[NSMutableArray count](self->_objects, "count"))
  {
    if ((objc_msgSend(v7, "isEqual:", CFSTR("rootObject")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKEncoder.m"), 105, CFSTR("Missing wrapper when not root object"));

    }
    objects = self->_objects;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](objects, "addObject:", v12);

    -[MSVOPACKEncoder _convertObject:](self, "_convertObject:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_objects, "replaceObjectAtIndex:withObject:", 0, v8);
    goto LABEL_7;
  }
  if (v14)
  {
    -[NSMutableArray lastObject](self->_wrapperStack, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E43FC6B8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVOPACKEncoder _convertObject:](self, "_convertObject:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

LABEL_7:
  }

}

- (id)_convertObject:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[2];
  _QWORD v53[2];
  void *v54;
  void *v55;
  _BYTE v56[128];
  void *v57;
  id v58;
  void *v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_NSIsNSArray())
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          -[MSVOPACKEncoder _convertObject:](self, "_convertObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v10);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = &unk_1E43FC718;
      v60 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v7;
    }
    v21 = v14;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  if (_NSIsNSDictionary())
  {
    v15 = (void *)MEMORY[0x1E0C99E08];
    v16 = v5;
    objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __34__MSVOPACKEncoder__convertObject___block_invoke;
    v46[3] = &unk_1E43E9098;
    v46[4] = self;
    v47 = v17;
    v18 = v17;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v46);
    objc_opt_class();
    LOBYTE(v15) = objc_opt_isKindOfClass();

    if ((v15 & 1) != 0)
      v19 = 4;
    else
      v19 = 3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v20;
    v58 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (_NSIsNSSet())
    {
      v23 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v8 = v23;
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(v8);
            -[MSVOPACKEncoder _convertObject:](self, "_convertObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v28);

          }
          v25 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        }
        while (v25);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = 8;
      else
        v29 = 7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v30;
      v55 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    if ((_NSIsNSData() & 1) != 0
      || (_NSIsNSDate() & 1) != 0
      || (_NSIsNSNumber() & 1) != 0
      || (_NSIsNSString() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (_NSIsNSNumber())
      {
        -[MSVOPACKEncoder _convertNumber:](self, "_convertNumber:", v5);
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = v5;
      }
      v21 = v31;
    }
    else
    {
      v32 = NSMapGet(self->_objectLookupTable, v5);
      if (v32)
      {
        v33 = (unint64_t)v32 - 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v5, "classForCoder");
        do
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            break;
          if (!objc_msgSend(v35, "supportsSecureCoding"))
            break;
          NSStringFromClass((Class)v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v36);

          v35 = (void *)objc_msgSend(v35, "superclass");
        }
        while (v35);
        v52[0] = &unk_1E43FC6D0;
        v52[1] = &unk_1E43FC6B8;
        v53[0] = v34;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = -[NSMutableArray count](self->_objects, "count");
        NSMapInsert(self->_objectLookupTable, v5, (const void *)(v33 + 1));
        -[NSMutableArray addObject:](self->_objects, "addObject:", v38);
        if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5A79E8)
          || (objc_msgSend((id)objc_msgSend(v5, "classForCoder"), "supportsSecureCoding") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKEncoder.m"), 275, CFSTR("Objects must support secure coding: %@"), objc_msgSend(v5, "classForCoder"));

        }
        -[NSMutableArray addObject:](self->_wrapperStack, "addObject:", v38);
        objc_msgSend(v5, "encodeWithCoder:", self);
        -[NSMutableArray removeLastObject](self->_wrapperStack, "removeLastObject");

      }
      if (v33 >= -[NSMutableArray count](self->_objects, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKEncoder.m"), 280, CFSTR("index out of bounds"));

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v33 | 0x80000000);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v21, "unsignedLongValue") ^ 0x80000000;
      if (v39 >= -[NSMutableArray count](self->_objects, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKEncoder.m"), 282, CFSTR("index out of bounds"));
        goto LABEL_19;
      }
    }
  }
LABEL_20:

  return v21;
}

- (id)_convertNumber:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "unsignedLongValue") & 0x80000000) != 0)
  {
    v7 = &unk_1E43FC700;
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)msv_setUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *userInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v4;

}

- (id)encodedDataWithError:(id *)a3
{
  if (!-[MSVOPACKEncoder hasFinished](self, "hasFinished"))
    -[MSVOPACKEncoder finishEncodingWithError:](self, "finishEncodingWithError:", a3);
  return self->_encodedData;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (BOOL)finishEncodingWithError:(id *)a3
{
  BOOL v5;
  NSData *v6;
  NSData *encodedData;
  BOOL v8;
  int v10;

  if (-[MSVOPACKEncoder hasFinished](self, "hasFinished"))
    return 1;
  v10 = 0;
  v6 = (NSData *)MEMORY[0x1A1AFB32C](self->_objects, 0, &v10);
  encodedData = self->_encodedData;
  self->_encodedData = v6;

  if (a3)
    v8 = v10 == 0;
  else
    v8 = 1;
  v5 = v8;
  if (!v8)
  {
    NSErrorWithOSStatusF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MSVOPACKEncoder setHasFinished:](self, "setHasFinished:", 1);
  return v5;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (void)encodeRootObject:(id)a3
{
  -[MSVOPACKEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, CFSTR("rootObject"));
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "encodedDataWithRootObject:userInfo:error:", a3, 0, a4);
}

- (MSVOPACKEncoder)init
{
  MSVOPACKEncoder *v2;
  uint64_t v3;
  NSMutableArray *wrapperStack;
  uint64_t v5;
  NSMutableArray *objects;
  uint64_t v7;
  NSMapTable *objectLookupTable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSVOPACKEncoder;
  v2 = -[MSVOPACKEncoder init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    wrapperStack = v2->_wrapperStack;
    v2->_wrapperStack = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "msvIndexMapTableWithCapacity:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objectLookupTable = v2->_objectLookupTable;
    v2->_objectLookupTable = (NSMapTable *)v7;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_wrapperStack, 0);
  objc_storeStrong((id *)&self->_objectLookupTable, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_encodedData, 0);
}

- (void)finishEncoding
{
  -[MSVOPACKEncoder finishEncodingWithError:](self, "finishEncodingWithError:", 0);
}

- (NSData)encodedData
{
  return (NSData *)-[MSVOPACKEncoder encodedDataWithError:](self, "encodedDataWithError:", 0);
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder encodeObject:forKey:](self, "encodeObject:forKey:", v8, v7);

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder _encodeNumber:forKey:](self, "_encodeNumber:forKey:", v8, v7);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder _encodeNumber:forKey:](self, "_encodeNumber:forKey:", v8, v7);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder _encodeNumber:forKey:](self, "_encodeNumber:forKey:", v9, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder _encodeNumber:forKey:](self, "_encodeNumber:forKey:", v8, v7);

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99D50];
  v9 = a5;
  objc_msgSend(v8, "dataWithBytes:length:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKEncoder encodeObject:forKey:](self, "encodeObject:forKey:", v10, v9);

}

- (BOOL)hasTopLevelData
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NSMutableArray firstObject](self->_objects, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E43FC6B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)beginEncodingPartialTopLevelObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "classForCoder");
  do
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      break;
    if (!objc_msgSend(v6, "supportsSecureCoding"))
      break;
    NSStringFromClass((Class)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    v6 = (void *)objc_msgSend(v6, "superclass");
  }
  while (v6);
  v11[0] = v5;
  v10[0] = &unk_1E43FC6D0;
  v10[1] = &unk_1E43FC6B8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = &unk_1E43FC6E8;
  v11[1] = v8;
  v11[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_wrapperStack, "addObject:", v9);
  -[NSMutableArray addObject:](self->_objects, "addObject:", v9);

}

- (void)finishEncodingPartialTopLevelObject
{
  -[NSMutableArray removeLastObject](self->_wrapperStack, "removeLastObject");
}

- (id)msv_userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  else
    return MEMORY[0x1E0C9AA70];
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (NSMapTable)objectLookupTable
{
  return self->_objectLookupTable;
}

- (NSMutableArray)wrapperStack
{
  return self->_wrapperStack;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

void __34__MSVOPACKEncoder__convertObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_convertObject:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_convertObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
}

@end
