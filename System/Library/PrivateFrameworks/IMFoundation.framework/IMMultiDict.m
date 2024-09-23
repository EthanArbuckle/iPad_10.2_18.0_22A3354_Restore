@implementation IMMultiDict

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  ++self->_count;
  objc_msgSend_dictionary(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, (uint64_t)v6);
  }
  objc_msgSend_addObject_(v16, v13, (uint64_t)v18, v15);

}

- (IMMultiDict)init
{
  IMMultiDict *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMMultiDict;
  v2 = -[IMMultiDict init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_dictionary(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)peekObjectForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastObject(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)popObjectForKey:(id)a3
{
  unint64_t count;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  count = self->_count;
  if (count)
    self->_count = count - 1;
  v5 = a3;
  objc_msgSend_dictionary(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastObject(v12, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend_removeLastObject(v12, v16, v17, v18);

  return v19;
}

- (void)enqueueObject:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_pushObject_forKey_, a3, a4);
}

- (id)headObjectForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v11, v12, v13, v14))
  {
    objc_msgSend_objectAtIndex_(v11, v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)dequeueObjectForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  --self->_count;
  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v11, v12, v13, v14))
  {
    objc_msgSend_objectAtIndex_(v11, v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectAtIndex_(v11, v18, 0, v19);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)objectsForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)removeObjectsForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v16, v8, (uint64_t)v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_count -= objc_msgSend_count(v10, v11, v12, v13);

  objc_msgSend_removeObjectForKey_(v16, v14, (uint64_t)v4, v15);
}

- (void)removeAllObjects
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  self->_count = 0;
  objc_msgSend_dictionary(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v4, v5, v6);

}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionary(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v12, (uint64_t)v6, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v16, v14, (uint64_t)v7, v15);
}

- (unint64_t)countForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_count(v11, v12, v13, v14);
  return v15;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1906B5900;
  v12[3] = &unk_1E2C46660;
  v13 = v4;
  v11 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v9, (uint64_t)v12, v10);

}

- (NSArray)allKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1906B5AB4;
  v14[3] = &unk_1E2C46688;
  v10 = v5;
  v15 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v14, v12);

  return (NSArray *)v10;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
