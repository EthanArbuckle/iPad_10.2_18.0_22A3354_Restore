@implementation NSCachingFetchRequest

- (NSCachingFetchRequest)init
{
  NSCachingFetchRequest *v2;
  NSCachingFetchRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCachingFetchRequest;
  v2 = -[NSFetchRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_cachedInfo = CFDictionaryCreateMutable(0, 5, 0, MEMORY[0x1E0C9B3A0]);
    v3->_identifier = (id)objc_msgSend((id)objc_opt_class(), "_generateIdentifier");
    v3->_substitutionVariables = 0;
  }
  return v3;
}

+ (id)_generateIdentifier
{
  unint64_t v2;

  do
    v2 = __ldaxr(&_generateIdentifier_tracker);
  while (__stlxr(v2 + 1, &_generateIdentifier_tracker));
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2 + 1);
}

- (void)_disableSQLStatementCaching
{
  os_unfair_lock_s *p_lock;
  id cachedInfo;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
    CFRelease(cachedInfo);
  self->_cachedInfo = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_isCachingFetchRequest
{
  return self->_cachedInfo != 0;
}

- (id)_cachedInfoForRequestor:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  if (self->_cachedInfo)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v6 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cachedInfo, a3);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_cacheInfo:(id)a3 forRequestor:(id)a4
{
  os_unfair_lock_s *p_lock;

  if (self->_cachedInfo)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    CFDictionarySetValue((CFMutableDictionaryRef)self->_cachedInfo, a4, a3);
    os_unfair_lock_unlock(p_lock);
    -[NSFetchRequest _incrementInUseCounter](self, "_incrementInUseCounter");
  }
}

- (void)dealloc
{
  id cachedInfo;
  objc_super v4;

  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
    CFRelease(cachedInfo);
  self->_cachedInfo = 0;

  self->_identifier = 0;
  self->_substitutionVariables = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSCachingFetchRequest;
  -[NSFetchRequest dealloc](&v4, sel_dealloc);
}

- (void)setSubstitutionVariables:(id)a3
{
  NSDictionary *substitutionVariables;
  BOOL v6;
  NSDictionary *v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSDictionary *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSDictionary *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables == a3)
    return;
  if (!substitutionVariables)
  {
    v7 = 0;
    goto LABEL_27;
  }
  v6 = -[NSFetchRequest _isEditable](self, "_isEditable");
  v7 = self->_substitutionVariables;
  if (v6)
  {
LABEL_27:
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (!v19)
      goto LABEL_35;
    v20 = v19;
    v21 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v7);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", v23), "expressionType"))
        {
          v29 = (void *)MEMORY[0x1E0C99DA0];
          v30 = *MEMORY[0x1E0C99778];
          v25 = (void *)MEMORY[0x1E0CB3940];
          v32 = v23;
LABEL_39:
          v31 = objc_msgSend(v25, "stringWithFormat:", CFSTR("Unsupported substitution variable type for key %@"), v32);
          goto LABEL_40;
        }
      }
      v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (!v20)
        goto LABEL_35;
    }
  }
  v8 = -[NSDictionary count](self->_substitutionVariables, "count");
  if (v8 != objc_msgSend(a3, "count"))
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Mismatched variables dictionaries (count)");
LABEL_41:
    objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v26, 0));
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_substitutionVariables;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v14 = -[NSDictionary valueForKey:](self->_substitutionVariables, "valueForKey:", v13);
        v15 = objc_msgSend(a3, "valueForKey:", v13);
        if (v15)
        {
          v16 = (void *)v15;
          if (objc_msgSend(v14, "expressionType"))
          {
            v29 = (void *)MEMORY[0x1E0C99DA0];
            v30 = *MEMORY[0x1E0C99778];
            v25 = (void *)MEMORY[0x1E0CB3940];
            v32 = v13;
            goto LABEL_39;
          }
          v17 = (void *)objc_msgSend(v14, "constantValue");
          v18 = (void *)objc_msgSend(v16, "constantValue");
          if (((objc_msgSend(v17, "isNSArray") & 1) != 0
             || (objc_msgSend(v17, "isNSSet") & 1) != 0
             || objc_msgSend(v17, "isNSOrderedSet"))
            && (objc_msgSend(v18, "isNSArray") & 1) == 0
            && (objc_msgSend(v18, "isNSSet") & 1) == 0
            && (objc_msgSend(v18, "isNSOrderedSet") & 1) == 0)
          {
            v29 = (void *)MEMORY[0x1E0C99DA0];
            v30 = *MEMORY[0x1E0C99778];
            v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatch: that which was once a collection is no longer (%@)"), v13);
LABEL_40:
            v26 = (const __CFString *)v31;
            v27 = v29;
            v28 = v30;
            goto LABEL_41;
          }
        }
        else if ((!objc_msgSend(v13, "isEqual:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"))
                || !-[NSFetchRequest fetchLimit](self, "fetchLimit"))
               && (!objc_msgSend(v13, "isEqual:", CFSTR("FETCH_REQUEST_OFFSET_SUBSTITUTION"))
                || !-[NSFetchRequest fetchOffset](self, "fetchOffset")))
        {
          v27 = (void *)MEMORY[0x1E0C99DA0];
          v28 = *MEMORY[0x1E0C99778];
          v26 = CFSTR("Mismatched variables dictionaries (missing value)");
          goto LABEL_41;
        }
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v10);
  }
LABEL_35:
  v24 = (NSDictionary *)objc_msgSend(a3, "copy");

  self->_substitutionVariables = v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  const __CFDictionary *cachedInfo;
  CFIndex Count;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSCachingFetchRequest;
  v4 = -[NSFetchRequest copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSDictionary mutableCopy](self->_substitutionVariables, "mutableCopy");

  *((_QWORD *)v4 + 14) = v5;
  os_unfair_lock_lock_with_options();
  v6 = (const void *)*((_QWORD *)v4 + 15);
  cachedInfo = (const __CFDictionary *)self->_cachedInfo;
  if (cachedInfo)
  {
    Count = CFDictionaryGetCount(cachedInfo);
    *((_QWORD *)v4 + 15) = CFDictionaryCreateMutableCopy(0, Count, (CFDictionaryRef)self->_cachedInfo);
    if (v6)
      CFRelease(v6);
  }
  else if (v6)
  {
    CFRelease(*((CFTypeRef *)v4 + 15));
    *((_QWORD *)v4 + 15) = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (NSDictionary)substitutionVariables
{
  NSDictionary *substitutionVariables;

  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables)
    return (NSDictionary *)(id)-[NSDictionary copy](substitutionVariables, "copy");
  else
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (NSCachingFetchRequest)initWithCoder:(id)a3
{
  NSCachingFetchRequest *v4;
  _QWORD *v5;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  _QWORD *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSCachingFetchRequest;
  v4 = -[NSFetchRequest initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v8 = __39__NSCachingFetchRequest_initWithCoder___block_invoke;
    v9 = &unk_1E1EDD520;
    v10 = v5;
    if (v5 && (v5[1] || v5[2]))
    {
      __39__NSCachingFetchRequest_initWithCoder___block_invoke((uint64_t)v7);
    }
    else
    {
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4B308));

      v4 = 0;
      v8((uint64_t)v7);
    }
  }
  return v4;
}

void __39__NSCachingFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{

}

- (id)_copyForDirtyContext
{
  id *v3;
  void *v4;
  NSUInteger v5;

  v3 = (id *)-[NSCachingFetchRequest copy](self, "copy");

  v3[16] = self->_identifier;
  v4 = (void *)-[NSDictionary mutableCopy](self->_substitutionVariables, "mutableCopy");
  if (!objc_msgSend(v4, "objectForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")))
  {
    v5 = -[NSFetchRequest fetchLimit](self, "fetchLimit");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"));
  }

  v3[14] = v4;
  objc_msgSend(v3, "_incrementInUseCounter");
  return v3;
}

- (id)_identifier
{
  return self->_identifier;
}

@end
