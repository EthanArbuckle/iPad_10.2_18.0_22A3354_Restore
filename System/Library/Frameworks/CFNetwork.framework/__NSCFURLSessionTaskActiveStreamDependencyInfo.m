@implementation __NSCFURLSessionTaskActiveStreamDependencyInfo

- (uint64_t)removeStreamWithStreamID:(uint64_t)a3 requestURLString:
{
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(*(id *)(result + 8), "isEqualToNumber:", a2))
      objc_setProperty_nonatomic((id)v5, v6, 0, 8);
    v7 = *(id *)(v5 + 16);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(v5 + 16) = v7;
    }
    objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "removeObject:", a2);
    v8 = *(id *)(v5 + 16);
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(v5 + 16) = v8;
    }
    result = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a3), "count");
    if (!result)
    {
      v9 = *(id *)(v5 + 16);
      if (!v9)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *(_QWORD *)(v5 + 16) = v9;
      }
      result = objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, a3);
    }
    if (*(_QWORD *)(v5 + 24))
    {
      result = +[NSURLSessionTaskDependencyTree mimeTypeForURLString:]((uint64_t)NSURLSessionTaskDependencyTree, a3);
      if (result)
      {
        v10 = result;
        result = objc_msgSend(*(id *)(v5 + 24), "objectForKey:", result);
        if (result)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "removeObject:", a2);
          result = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "count");
          if (!result)
            return objc_msgSend(*(id *)(v5 + 24), "setObject:forKeyedSubscript:", 0, v10);
        }
      }
    }
  }
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v1;
  id v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = *(id *)(result + 16);
    if (!v2)
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(v1 + 16) = v2;
    }
    if (objc_msgSend(v2, "count"))
    {
      return 0;
    }
    else
    {
      v3 = *(void **)(v1 + 24);
      return !v3 || objc_msgSend(v3, "count") == 0;
    }
  }
  return result;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  objc_super v5;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSCFURLSessionTaskActiveStreamDependencyInfo;
  -[__NSCFURLSessionTaskActiveStreamDependencyInfo dealloc](&v5, sel_dealloc);
}

- (__NSCFURLSessionTaskActiveStreamDependencyInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLSessionTaskActiveStreamDependencyInfo;
  return -[__NSCFURLSessionTaskActiveStreamDependencyInfo init](&v3, sel_init);
}

- (uint64_t)parentStreamIDForURLString:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = *(id *)(result + 16);
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(v3 + 16) = v4;
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", a2), "lastObject"), "intValue");
  }
  return result;
}

- (uint64_t)parentStreamIDForMimeType:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (!*(_QWORD *)(result + 24))
    {
      *(_QWORD *)(result + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v4 = *(id *)(v3 + 16);
      if (!v4)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *(_QWORD *)(v3 + 16) = v4;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
            v10 = +[NSURLSessionTaskDependencyTree mimeTypeForURLString:]((uint64_t)NSURLSessionTaskDependencyTree, v9);
            if (v10)
            {
              v11 = v10;
              v12 = *(id *)(v3 + 16);
              if (!v12)
              {
                v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                *(_QWORD *)(v3 + 16) = v12;
              }
              objc_msgSend(*(id *)(v3 + 24), "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v9, (_QWORD)v13), "mutableCopy"), v11);
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 24), "objectForKeyedSubscript:", a2, (_QWORD)v13), "lastObject"), "intValue");
  }
  return result;
}

@end
