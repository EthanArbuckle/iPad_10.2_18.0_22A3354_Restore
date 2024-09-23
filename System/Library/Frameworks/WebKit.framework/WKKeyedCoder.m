@implementation WKKeyedCoder

- (WKKeyedCoder)init
{
  WKKeyedCoder *v2;
  uint64_t v3;
  void *m_ptr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKKeyedCoder;
  v2 = -[WKKeyedCoder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    m_ptr = v2->m_dictionary.m_ptr;
    v2->m_dictionary.m_ptr = (void *)v3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v2;
}

- (WKKeyedCoder)initWithDictionary:(id)a3
{
  WKKeyedCoder *v4;
  uint64_t v5;
  void *m_ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKKeyedCoder;
  v4 = -[WKKeyedCoder init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "mutableCopy");
    m_ptr = v4->m_dictionary.m_ptr;
    v4->m_dictionary.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (IPC::isSerializableValue((IPC *)a3, (objc_object *)a2))
      objc_msgSend(self->m_dictionary.m_ptr, "setObject:forKey:", a3, a4);
  }
}

- (BOOL)containsValueForKey:(id)a3
{
  return objc_msgSend(self->m_dictionary.m_ptr, "objectForKey:", a3) != 0;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  void *v4;

  if (self->m_failedDecoding)
    return 0;
  v4 = (void *)objc_msgSend(self->m_dictionary.m_ptr, "objectForKey:", a4);
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    self->m_failedDecoding = 1;
  }
  return v4;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  void *v4;
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
  if (self->m_failedDecoding)
    return 0;
  v4 = (void *)objc_msgSend(self->m_dictionary.m_ptr, "objectForKey:", a4);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(a3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v4 = 0;
      self->m_failedDecoding = 1;
    }
  }
  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  return (id)objc_msgSend(self->m_dictionary.m_ptr, "objectForKey:", a3);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  -[WKKeyedCoder encodeObject:forKey:](self, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), a4);
}

- (BOOL)decodeBoolForKey:(id)a3
{
  return objc_msgSend(-[WKKeyedCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3), "BOOLValue");
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  -[WKKeyedCoder encodeObject:forKey:](self, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3), a4);
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  return objc_msgSend(-[WKKeyedCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3), "longLongValue");
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  -[WKKeyedCoder encodeObject:forKey:](self, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), a4);
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  return objc_msgSend(-[WKKeyedCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), a3), "integerValue");
}

- (id)accumulatedDictionary
{
  return self->m_dictionary.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->m_dictionary.m_ptr;
  self->m_dictionary.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
