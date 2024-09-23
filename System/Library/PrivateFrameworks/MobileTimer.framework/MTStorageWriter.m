@implementation MTStorageWriter

- (unint64_t)mtType
{
  return 2;
}

- (MTStorageWriter)init
{
  MTStorageWriter *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *stack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTStorageWriter;
  v2 = -[MTStorageWriter init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "arrayWithObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)_encodeObject:(id)a3 forKey:(id)a4
{
  NSMutableArray *stack;
  id v6;
  id v7;
  id v8;

  stack = self->_stack;
  v6 = a4;
  v7 = a3;
  -[NSMutableArray lastObject](stack, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v9, v7);

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
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v8, v7);

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  MTStorageWriter *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v6;
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[MTStorageWriter _serializingProtocol](self, "_serializingProtocol");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "conformsToProtocol:", v16);

          if (v17)
          {
            -[MTStorageWriter _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

          }
          else
          {
            objc_msgSend(v9, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v12);
    }

    v19 = self;
    v20 = v9;
LABEL_25:
    -[MTStorageWriter _encodeObject:forKey:](v19, "_encodeObject:forKey:", v20, v7, v33);

    v6 = v34;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v7;
    v34 = v6;
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v21;
    v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v10);
          v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v10, "objectForKeyedSubscript:", v26, v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTStorageWriter _serializingProtocol](self, "_serializingProtocol");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "conformsToProtocol:", v28);

          if (v29)
          {
            -[MTStorageWriter _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, v26);

          }
          else
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, v26);
          }

        }
        v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v23);
    }

    v19 = self;
    v20 = v9;
    v7 = v33;
    goto LABEL_25;
  }
  -[MTStorageWriter _serializingProtocol](self, "_serializingProtocol");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "conformsToProtocol:", v31);

  if (v32)
    -[MTStorageWriter _encodeProtocolObject:forKey:](self, "_encodeProtocolObject:forKey:", v6, v7);
  else
    -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v6, v7);
LABEL_26:

}

- (void)_encodeProtocolObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MTStorageWriter _dictionaryForProtocolObject:](self, "_dictionaryForProtocolObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MTStorageWriter _encodeObject:forKey:](self, "_encodeObject:forKey:", v7, v6);

}

- (id)_serializingProtocol
{
  return &unk_1EE3E1F18;
}

- (id)_dictionaryForProtocolObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  -[NSMutableArray addObject:](self->_stack, "addObject:", v6);
  objc_msgSend(v4, "encodeWithCoder:", self);
  -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), CFSTR("$"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v10);
  return v5;
}

- (id)encodedDictionary
{
  void *v2;
  void *v3;

  -[NSMutableArray lastObject](self->_stack, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
