@implementation MSVOPACKDecoder

- (double)decodeDoubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[MSVOPACKDecoder _decodeNumberForKey:](self, "_decodeNumberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[MSVOPACKDecoder _decodeNumberForKey:](self, "_decodeNumberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (id)_decodeNumberForKey:(id)a3
{
  NSMutableArray *wrapperStack;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  wrapperStack = self->_wrapperStack;
  v5 = a3;
  -[NSMutableArray lastObject](wrapperStack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E43FC748);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (_NSIsNSNumber() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (BOOL)containsValueForKey:(id)a3
{
  NSMutableArray *wrapperStack;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  wrapperStack = self->_wrapperStack;
  v4 = a3;
  -[NSMutableArray lastObject](wrapperStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E43FC748);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A1AFBB54]();
  if (!objc_msgSend(v8, "isEqual:", CFSTR("rootObject")))
  {
    -[NSMutableArray lastObject](self->_wrapperStack, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E43FC748);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  -[NSArray firstObject](self->_objects, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 305, CFSTR("No root object"));
LABEL_6:

    if (v7)
      goto LABEL_4;
LABEL_7:
    -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_4:
  -[NSMutableArray addObject:](self->_allowedClassesStack, "addObject:", v7);
  -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_allowedClassesStack, "removeLastObject");
LABEL_8:

  objc_autoreleasePoolPop(v9);
  return v11;
}

- (id)_decodeOPACKObject:(id)a3 ofClasses:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  objc_class *v28;
  const void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_67;
  }
  if (!_NSIsNSNumber() || (objc_msgSend(v7, "unsignedLongValue") & 0x80000000) == 0)
  {
    if (_NSIsNSArray())
    {
      v9 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v87 != v14)
              objc_enumerationMutation(v11);
            -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i), v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
        }
        while (v13);
      }

      goto LABEL_13;
    }
    if (!_NSIsNSDictionary())
    {
LABEL_66:
      -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);
      v10 = v7;
      goto LABEL_67;
    }
    v11 = v7;
    v17 = objc_msgSend(v11, "count");
    if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC748);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC760);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC778);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 207, CFSTR("Can't decode a partial object without a segmented decoder."));

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC760);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_1E43FC850, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            v27 = v25;

            v24 = v27;
          }
          v28 = NSClassFromString((NSString *)v24);
          -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", v28, v8);
          -[NSMutableArray addObject:](self->_wrapperStack, "addObject:", v11);
          v10 = (id)objc_msgSend([v28 alloc], "initWithCoder:", self);
          -[NSMutableArray removeLastObject](self->_wrapperStack, "removeLastObject");
          -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);

          goto LABEL_39;
        }
      }
      goto LABEL_65;
    }
    if (v17 == 1)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC790);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC790);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v23 = v32;
        v33 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v83 != v35)
                objc_enumerationMutation(v23);
              -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j), v8);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v37);

            }
            v34 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
          }
          while (v34);
        }

LABEL_38:
        -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);
LABEL_39:

        goto LABEL_14;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7A8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7A8);
        v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
        -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);
LABEL_14:

        goto LABEL_67;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7C0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7C0);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke;
        v79[3] = &unk_1E43E94A8;
        v79[4] = self;
        v41 = v8;
        v80 = v41;
        v81 = v40;
        v42 = v40;
        objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v79);
        -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v41);
        v10 = (id)objc_msgSend(v42, "copy");

        goto LABEL_39;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7D8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7D8);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke_29;
        v76[3] = &unk_1E43E94A8;
        v76[4] = self;
        v45 = v8;
        v77 = v45;
        v46 = v44;
        v78 = v46;
        objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v76);
        -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v45);
        v47 = v78;
        v10 = v46;

        goto LABEL_39;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7F0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC7F0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v49, "count"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v51 = v49;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v53; ++k)
            {
              if (*(_QWORD *)v73 != v54)
                objc_enumerationMutation(v51);
              -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k), v8);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v56);

            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
          }
          while (v53);
        }

        -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);
        v10 = (id)objc_msgSend(v50, "copy");

        goto LABEL_14;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC808);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E43FC808);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v58, "count"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v23 = v58;
        v59 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v69;
          do
          {
            for (m = 0; m != v60; ++m)
            {
              if (*(_QWORD *)v69 != v61)
                objc_enumerationMutation(v23);
              -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m), v8, (_QWORD)v68);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v63);

            }
            v60 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
          }
          while (v60);
        }

        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 289, CFSTR("Data key exists, but unknown object type."));

    }
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 291, CFSTR("Unknown encoded dictionary literal."));

    goto LABEL_66;
  }
  v29 = (const void *)(objc_msgSend(v7, "unsignedLongValue") ^ 0x80000000);
  NSMapGet(self->_objectLookupTable, v29);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[NSArray objectAtIndexedSubscript:](self->_objects, "objectAtIndexedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", v30, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    NSMapInsert(self->_objectLookupTable, v29, v10);

  }
  -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", objc_opt_class(), v8);
LABEL_67:

  return v10;
}

- (void)_validateClass:(Class)a3 fromSupportedClasses:(id)a4
{
  Class v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[objc_class supportsSecureCoding](a3, "supportsSecureCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 162, CFSTR("Class %@ does not support secure coding."), a3);

    }
    v7 = a3;
    while ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
    {
      v7 = (Class)-[objc_class superclass](v7, "superclass");
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 170, CFSTR("Class %@ does not match supported classes: %@"), a3, v10);

        break;
      }
    }
  }

}

- (BOOL)decodeBoolForKey:(id)a3
{
  NSMutableArray *wrapperStack;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  wrapperStack = self->_wrapperStack;
  v4 = a3;
  -[NSMutableArray lastObject](wrapperStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E43FC748);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");
  return (char)v4;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)initForReadingFromData:(id)a3 error:(id *)a4
{
  return -[MSVOPACKDecoder initForReadingFromData:userInfo:error:](self, "initForReadingFromData:userInfo:error:", a3, 0, a4);
}

- (id)initForReadingFromData:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MSVOPACKDecoder *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *objects;
  uint64_t v16;
  NSMapTable *objectLookupTable;
  uint64_t v18;
  NSMutableArray *wrapperStack;
  uint64_t v20;
  NSMutableArray *allowedClassesStack;
  MSVOPACKDecoder *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSVOPACKDecoder;
  v10 = -[MSVOPACKDecoder init](&v27, sel_init);
  if (!v10)
    goto LABEL_6;
  v11 = objc_msgSend(v9, "copy");
  v12 = (void *)v11;
  v13 = (void *)(v11 ? v11 : MEMORY[0x1E0C9AA70]);
  objc_storeStrong((id *)&v10->_userInfo, v13);

  v14 = OPACKDecodeData();
  objects = v10->_objects;
  v10->_objects = (NSArray *)v14;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  objectLookupTable = v10->_objectLookupTable;
  v10->_objectLookupTable = (NSMapTable *)v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  wrapperStack = v10->_wrapperStack;
  v10->_wrapperStack = (NSMutableArray *)v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = objc_claimAutoreleasedReturnValue();
  allowedClassesStack = v10->_allowedClassesStack;
  v10->_allowedClassesStack = (NSMutableArray *)v20;

  if ((_NSIsNSArray() & 1) == 0)
  {
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = MSVOPACKDecoderErrorDomain;
      v28 = *MEMORY[0x1E0CB2938];
      v29[0] = CFSTR("Decoded OPACK data did not contain an array as the root object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
  }
  else
  {
LABEL_6:
    v22 = v10;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_wrapperStack, 0);
  objc_storeStrong((id *)&self->_objectLookupTable, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_allowedClassesStack, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)finishDecodingPartialTopLevelObject
{
  -[NSMutableArray removeLastObject](self->_wrapperStack, "removeLastObject");
}

- (void)beginDecodingPartialTopLevelObjectOfClasses:(id)a3
{
  NSArray *objects;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSString *v10;
  Class v11;
  void *v12;
  id v13;

  objects = self->_objects;
  v6 = a3;
  -[NSArray firstObject](objects, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E43FC778);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVOPACKDecoder.m"), 366, CFSTR("Can't decode a partial object if it isn't."));

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E43FC760);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = NSClassFromString(v10);

  -[MSVOPACKDecoder _validateClass:fromSupportedClasses:](self, "_validateClass:fromSupportedClasses:", v11, v6);
  -[NSMutableArray addObject:](self->_wrapperStack, "addObject:", v13);

}

- (void)msv_setUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *userInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v4;

}

- (id)allowedClasses
{
  return (id)-[NSMutableArray lastObject](self->_allowedClassesStack, "lastObject");
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (int64_t)decodingFailurePolicy
{
  return 1;
}

- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVOPACKDecoder decodeRootObjectOfClasses:error:](self, "decodeRootObjectOfClasses:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4
{
  return (id)-[MSVOPACKDecoder decodeTopLevelObjectOfClasses:forKey:error:](self, "decodeTopLevelObjectOfClasses:forKey:error:", a3, CFSTR("rootObject"), a4);
}

- (int)decodeIntForKey:(id)a3
{
  void *v3;
  int v4;

  -[MSVOPACKDecoder _decodeNumberForKey:](self, "_decodeNumberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  void *v3;
  int v4;

  -[MSVOPACKDecoder _decodeNumberForKey:](self, "_decodeNumberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[MSVOPACKDecoder _decodeNumberForKey:](self, "_decodeNumberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  NSMutableArray *wrapperStack;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;

  wrapperStack = self->_wrapperStack;
  v6 = a3;
  -[NSMutableArray lastObject](wrapperStack, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E43FC748);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_msgSend(v9, "length");
  v10 = objc_retainAutorelease(v9);
  v11 = (const char *)objc_msgSend(v10, "bytes");

  return v11;
}

- (id)msv_userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  else
    return MEMORY[0x1E0C9AA70];
}

- (MSVOPACKDecoderDelegate)delegate
{
  return (MSVOPACKDecoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)allowedClassesStack
{
  return self->_allowedClassesStack;
}

- (NSArray)objects
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

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSError)decodeError
{
  return self->_decodeError;
}

- (void)setDecodeError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

void __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "_decodeOPACKObject:ofClasses:", a2, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_decodeOPACKObject:ofClasses:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v9);
}

void __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "_decodeOPACKObject:ofClasses:", a2, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_decodeOPACKObject:ofClasses:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v9);
}

+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "decodedObjectOfClass:fromData:userInfo:error:", a3, a4, 0, a5);
}

+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "setWithObject:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodedObjectOfClasses:fromData:userInfo:error:", v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "decodedObjectOfClasses:fromData:userInfo:error:", a3, a4, 0, a5);
}

+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[MSVOPACKDecoder initForReadingFromData:userInfo:error:]([MSVOPACKDecoder alloc], "initForReadingFromData:userInfo:error:", v10, v9, a6);

  objc_msgSend(v12, "decodeRootObjectOfClasses:error:", v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
