@implementation AVAssetSerializableCreationOptions

- (AVAssetSerializableCreationOptions)initWithCreationOptions:(id)a3
{
  AVAssetSerializableCreationOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetSerializableCreationOptions;
  v4 = -[AVAssetSerializableCreationOptions init](&v6, sel_init);
  if (v4)
    v4->_creationOptions = (NSDictionary *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetSerializableCreationOptions;
  -[AVAssetSerializableCreationOptions dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, v19), 0);
    objc_exception_throw(v18);
  }
  v11 = (id)-[NSDictionary mutableCopy](self->_creationOptions, "mutableCopy");
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("AVURLAssetHTTPCookiesKey"));
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("assetCreationOptions"));
  v12 = -[NSDictionary objectForKeyedSubscript:](self->_creationOptions, "objectForKeyedSubscript:", CFSTR("AVURLAssetHTTPCookiesKey"));
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "properties"));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
    objc_msgSend(a3, "encodeObject:forKey:", v13, CFSTR("httpCookies"));
  }
}

- (AVAssetSerializableCreationOptions)initWithCoder:(id)a3
{
  AVAssetSerializableCreationOptions *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *v25;
  AVAssetSerializableCreationOptions *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v27 = self;
    v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v28, v29, v30, v31, v32, v34), 0);
    objc_exception_throw(v33);
  }
  v39.receiver = self;
  v39.super_class = (Class)AVAssetSerializableCreationOptions;
  v6 = -[AVAssetSerializableCreationOptions init](&v39, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v6->_creationOptions = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0), CFSTR("assetCreationOptions"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0), CFSTR("httpCookies"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v36;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v19);
            objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C92C00], "cookieWithProperties:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24++)));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v22);
      }
      v25 = (NSDictionary *)-[NSDictionary mutableCopy](v6->_creationOptions, "mutableCopy");
      -[NSDictionary setObject:forKey:](v25, "setObject:forKey:", v20, CFSTR("AVURLAssetHTTPCookiesKey"));

      v6->_creationOptions = v25;
    }
  }
  return v6;
}

- (id)creationOptions
{
  return self->_creationOptions;
}

@end
