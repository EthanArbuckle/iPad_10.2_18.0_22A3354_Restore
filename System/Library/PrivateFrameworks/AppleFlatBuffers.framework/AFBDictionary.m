@implementation AFBDictionary

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*((void (**)(void))self->_objectForValidKey + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AFBDictionary)initWithBufRef:(id)a3 count:(unint64_t)a4 keyClass:(Class)a5 keyAtIndex:(id)a6 tableAtIndex:(id)a7 objectForValidKey:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  AFBDictionary *v19;
  AFBDictionary *v20;
  uint64_t v21;
  id keyAtIndex;
  uint64_t v23;
  id tableAtIndex;
  uint64_t v25;
  id objectForValidKey;
  objc_super v28;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)AFBDictionary;
  v19 = -[AFBDictionary init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bufRef, a3);
    v20->_count = a4;
    v20->_keyClass = a5;
    v21 = MEMORY[0x2207C94F0](v16);
    keyAtIndex = v20->_keyAtIndex;
    v20->_keyAtIndex = (id)v21;

    v23 = MEMORY[0x2207C94F0](v17);
    tableAtIndex = v20->_tableAtIndex;
    v20->_tableAtIndex = (id)v23;

    v25 = MEMORY[0x2207C94F0](v18);
    objectForValidKey = v20->_objectForValidKey;
    v20->_objectForValidKey = (id)v25;

  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectForValidKey, 0);
  objc_storeStrong(&self->_tableAtIndex, 0);
  objc_storeStrong(&self->_keyAtIndex, 0);
  objc_storeStrong((id *)&self->_bufRef, 0);
}

- (AFBDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  AFBDictionary *v6;

  v6 = (AFBDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:count:", a3, a4, a5);

  return v6;
}

- (AFBDictionary)initWithCoder:(id)a3
{
  AFBDictionary *result;

  result = (AFBDictionary *)a3;
  __break(1u);
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyEnumerator
{
  return -[AFBDictionaryEnumerator initWithDictionary:]([AFBDictionaryEnumerator alloc], "initWithDictionary:", self);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *, _BYTE *);
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (void (**)(id, void *, void *, _BYTE *))a4;
  if (self->_count)
  {
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x2207C93E8]();
      v10 = 0;
      (*((void (**)(void))self->_keyAtIndex + 2))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))self->_tableAtIndex + 2))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v8, v9, &v10);

      LODWORD(v8) = v10;
      objc_autoreleasePoolPop(v7);
      if ((_DWORD)v8)
        break;
      ++v6;
    }
    while (v6 < self->_count);
  }

}

- (id)allKeys
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_count);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__AFBDictionary_allKeys__block_invoke;
  v7[3] = &unk_24E436B68;
  v8 = v3;
  v4 = v3;
  -[AFBDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __24__AFBDictionary_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)allValues
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_count);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__AFBDictionary_allValues__block_invoke;
  v7[3] = &unk_24E436B68;
  v8 = v3;
  v4 = v3;
  -[AFBDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __26__AFBDictionary_allValues__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)allKeysForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4 && self->_count)
  {
    v5 = (void *)objc_opt_new();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __34__AFBDictionary_allKeysForObject___block_invoke;
    v12 = &unk_24E436B90;
    v13 = v4;
    v14 = v5;
    v6 = v5;
    -[AFBDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

void __34__AFBDictionary_allKeysForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", a3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (BOOL)isEqualToDictionary:(id)a3
{
  AFBDictionary *v4;
  AFBDictionary *v5;
  uint64_t v6;
  AFBDictionary *v7;
  AFBDictionary *v8;
  BOOL v9;
  _QWORD v11[4];
  AFBDictionary *v12;
  uint64_t *v13;
  _QWORD v14[4];
  AFBDictionary *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = (AFBDictionary *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = -[AFBDictionary count](v4, "count"), v6 == -[AFBDictionary count](self, "count")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 1;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __37__AFBDictionary_isEqualToDictionary___block_invoke;
      v14[3] = &unk_24E436BB8;
      v8 = v7;
      v15 = v8;
      v16 = v18;
      v17 = &v19;
      -[AFBDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v14);
      v9 = *((_BYTE *)v20 + 24) != 0;

      _Block_object_dispose(v18, 8);
      _Block_object_dispose(&v19, 8);

    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 1;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __37__AFBDictionary_isEqualToDictionary___block_invoke_2;
      v11[3] = &unk_24E436BE0;
      v12 = v5;
      v13 = &v19;
      -[AFBDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v11);
      v9 = *((_BYTE *)v20 + 24) != 0;

      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __37__AFBDictionary_isEqualToDictionary___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  void *v10;

  v6 = *(_QWORD *)(a1[4] + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v9 = a3;
  v8(v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqual:", v10);

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
}

void __37__AFBDictionary_isEqualToDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (_QWORD)keyAtIndex:(_QWORD *)a1
{
  if (a1)
  {
    (*(void (**)(void))(a1[4] + 16))();
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
