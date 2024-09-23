@implementation MSVSegmentedDecoder

- (double)decodeDoubleForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v4);
  v7 = v6;

  return v7;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "decodeInt64ForKey:", v4);

  return v6;
}

- (id)_coderForKey:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_subcoders;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsValueForKey:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

void __55__MSVSegmentedDecoder_decodeRootObjectOfClasses_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "didRestoreVersion:forSegment:", objc_msgSend(a3, "integerValue"), v5);

}

- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 error:(id *)a4
{
  return -[MSVSegmentedDecoder initWithCodingPackage:userInfo:error:](self, "initWithCodingPackage:userInfo:error:", a3, 0, a4);
}

- (BOOL)containsValueForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_subcoders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "decodeObjectOfClasses:forKey:", v6, v7, (_QWORD)v16);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVSegmentedDecoder decodeRootObjectOfClasses:error:](self, "decodeRootObjectOfClasses:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4
{
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(v7, "containsObject:", self->_rootClass) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSegmentedEncoder.m"), 223, CFSTR("Attempt to decode package of archived class: %@"), self->_rootClass);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_subcoders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "beginDecodingPartialTopLevelObjectOfClasses:", v7);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(objc_alloc(self->_rootClass), "initWithCoder:", self);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = self->_subcoders;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "finishDecodingPartialTopLevelObject");
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v14);
  }

  -[MSVSegmentedCodingPackage allVersions](self->_package, "allVersions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__MSVSegmentedDecoder_decodeRootObjectOfClasses_error___block_invoke;
  v23[3] = &unk_1E43E8710;
  v18 = v12;
  v24 = v18;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v23);

  -[MSVSegmentedDecoder error](self, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    if (a4)
      *a4 = objc_retainAutorelease(v19);
    -[MSVSegmentedDecoder __setError:](self, "__setError:", 0);
    v18 = 0;
  }
  else if (a4 && !v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0CB28A8], 4865, CFSTR("failed to decode root object"));
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v18;

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subcoders, 0);
  objc_storeStrong((id *)&self->_rootClass, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  MSVSegmentedDecoder *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  Class rootClass;
  MSVSegmentedCodingPackage *package;
  uint64_t v19;
  id v20;
  NSArray *subcoders;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  MSVSegmentedDecoder *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MSVSegmentedDecoder;
  v11 = -[MSVSegmentedDecoder init](&v34, sel_init);
  if (!v11)
    goto LABEL_17;
  v12 = objc_msgSend(v10, "copy");
  v13 = (void *)v12;
  v14 = (id)MEMORY[0x1E0C9AA70];
  if (v12)
    v15 = (void *)v12;
  else
    v15 = (void *)MEMORY[0x1E0C9AA70];
  objc_storeStrong((id *)&v11->_userInfo, v15);

  objc_storeStrong((id *)&v11->_package, a3);
  -[MSVSegmentedCodingPackage archivedClass](v11->_package, "archivedClass");
  v16 = objc_claimAutoreleasedReturnValue();
  rootClass = v11->_rootClass;
  v11->_rootClass = (Class)v16;

  package = v11->_package;
  v33 = 0;
  -[MSVSegmentedCodingPackage decodersWithError:](package, "decodersWithError:", &v33);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v33;
  subcoders = v11->_subcoders;
  v11->_subcoders = (NSArray *)v19;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v11->_subcoders;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    if (v10)
      v14 = v10;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "msv_setUserInfo:", v14, (_QWORD)v29);
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v24);
  }

  if (v20)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v20);

    v27 = 0;
  }
  else
  {
LABEL_17:
    v27 = v11;
  }

  return v27;
}

- (int64_t)decodingFailurePolicy
{
  return 1;
}

- (id)error
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
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
  v3 = self->_subcoders;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "error", (_QWORD)v11);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v10 = (void *)v8;

          return v10;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[MSVSegmentedDecoder decodeError](self, "decodeError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "decodeBoolForKey:", v4);

  return v6;
}

- (int)decodeIntForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "decodeIntForKey:", v4);

  return v6;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "decodeInt32ForKey:", v4);

  return v6;
}

- (float)decodeFloatForKey:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  -[MSVSegmentedDecoder _coderForKey:](self, "_coderForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeFloatForKey:", v4);
  v7 = v6;

  return v7;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_subcoders;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        v13 = objc_msgSend(v12, "decodeBytesForKey:returnedLength:", v6, a4, (_QWORD)v16);
        if (v13)
        {
          v14 = (const char *)v13;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)msv_userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  else
    return MEMORY[0x1E0C9AA70];
}

- (void)msv_setUserInfo:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *userInfo;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_subcoders;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "msv_setUserInfo:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (MSVSegmentedCodingPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (Class)rootClass
{
  return self->_rootClass;
}

- (void)setRootClass:(Class)a3
{
  objc_storeStrong((id *)&self->_rootClass, a3);
}

- (NSArray)subcoders
{
  return self->_subcoders;
}

- (void)setSubcoders:(id)a3
{
  objc_storeStrong((id *)&self->_subcoders, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)decodeError
{
  return self->_decodeError;
}

- (void)setDecodeError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "decodedObjectOfClass:fromPackage:userInfo:error:", a3, a4, 0, a5);
}

+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6
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
  objc_msgSend(a1, "decodedObjectOfClasses:fromPackage:userInfo:error:", v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "decodedObjectOfClasses:fromPackage:userInfo:error:", a3, a4, 0, a5);
}

+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  MSVSegmentedDecoder *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v19 = 0;
  v12 = -[MSVSegmentedDecoder initWithCodingPackage:userInfo:error:]([MSVSegmentedDecoder alloc], "initWithCodingPackage:userInfo:error:", v11, v10, &v19);

  v13 = v19;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
  }
  else
  {
    v18 = 0;
    -[MSVSegmentedDecoder decodeRootObjectOfClasses:error:](v12, "decodeRootObjectOfClasses:error:", v9, &v18);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (!v14)
    {
      v15 = v15;
      v16 = v15;
      goto LABEL_8;
    }
  }
  if (a6)
  {
    v14 = objc_retainAutorelease(v14);
    v16 = 0;
    *a6 = v14;
  }
  else
  {
    v16 = 0;
  }
LABEL_8:

  return v16;
}

@end
