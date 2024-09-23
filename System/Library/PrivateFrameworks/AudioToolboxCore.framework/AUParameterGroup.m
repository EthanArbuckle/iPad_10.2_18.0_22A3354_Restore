@implementation AUParameterGroup

- (void)_indexChildren
{
  NSMutableDictionary *childIndicesByIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  childIndicesByIdentifier = self->_childIndicesByIdentifier;
  if (!childIndicesByIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_childIndicesByIdentifier;
    self->_childIndicesByIdentifier = v4;

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_children;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "setIndexInGroup:", v7 + i);
        if (!childIndicesByIdentifier)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11 && objc_msgSend(v11, "length"))
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_childIndicesByIdentifier, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              v16 = (void *)MEMORY[0x1E0C99DA0];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multiple nodes with identifier '%@'"), v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "exceptionWithName:reason:userInfo:", CFSTR("AUInvalidNodeInfoException"), v17, 0);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v18);
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + i);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_childIndicesByIdentifier, "setObject:forKeyedSubscript:", v15, v12);

          }
        }
        objc_msgSend(v10, "setParentNode:", self);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 += i;
    }
    while (v6);
  }

}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  AUParameterGroup *v5;
  void *v6;
  void *v7;
  AUParameterGroup *v8;

  v5 = [AUParameterGroup alloc];
  -[AUParameterNode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameterNode displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AUParameterGroup initWithTemplate:identifier:name:addressOffset:](v5, "initWithTemplate:identifier:name:addressOffset:", self, v6, v7, a3);

  return v8;
}

- (AUParameterGroup)initWithID:(id)a3 name:(id)a4 children:(id)a5
{
  id v8;
  id v9;
  id v10;
  AUParameterGroup *v11;
  AUParameterGroup *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AUParameterGroup;
  v11 = -[AUParameterNode initWithID:name:](&v14, sel_initWithID_name_, v8, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_children, a5);
    -[AUParameterGroup _indexChildren](v12, "_indexChildren");
  }

  return v12;
}

- (AUParameterGroup)initWithChildren:(id)a3
{
  return -[AUParameterGroup initWithID:name:children:](self, "initWithID:name:children:", &stru_1E2923288, &stru_1E2923288, a3);
}

- (AUParameterGroup)initWithTemplate:(id)a3 identifier:(id)a4 name:(id)a5 addressOffset:(unint64_t)a6
{
  id v10;
  AUParameterGroup *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *childIndicesByIdentifier;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AUParameterGroup;
  v11 = -[AUParameterNode initWithID:name:](&v26, sel_initWithID_name_, a4, a5);
  if (v11)
  {
    objc_msgSend(v10, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    objc_storeStrong((id *)&v11->_children, v13);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "copyNodeWithOffset:", a6, (_QWORD)v22);
          objc_msgSend(v13, "addObject:", v18);
          objc_msgSend(v18, "setParentNode:", v11);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }

    objc_msgSend(v10, "childIndicesByIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    childIndicesByIdentifier = v11->_childIndicesByIdentifier;
    v11->_childIndicesByIdentifier = (NSMutableDictionary *)v19;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUParameterGroup;
  -[AUParameterNode dealloc](&v2, sel_dealloc);
}

- (BOOL)isGroup
{
  return 1;
}

- (NSArray)allParameters
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_children;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isGroup", (_QWORD)v11))
        {
          objc_msgSend(v8, "allParameters");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        }
        else
        {
          objc_msgSend(v3, "addObject:", v8);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_children;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_observersChanged:deltaCount:", v5, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)valueForKey:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[NSMutableDictionary objectForKey:](self->_childIndicesByIdentifier, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "unsignedIntegerValue"),
        -[AUParameterGroup children](self, "children"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 < v8))
  {
    -[AUParameterGroup children](self, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AUParameterNode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("id"));

  -[AUParameterNode displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_childIndicesByIdentifier, CFSTR("childIndex"));
  -[AUParameterGroup children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("children"));

}

- (AUParameterGroup)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AUParameterGroup *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUParameterGroup initWithCoder:]::childIndexClasses = objc_msgSend(v15, "initWithObjects:", v16, v17, v18, 0);

  }
  {
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUParameterGroup initWithCoder:]::childrenClasses = objc_msgSend(v19, "initWithObjects:", v20, v21, v22, v23, v24, 0);

  }
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25.receiver = self;
  v25.super_class = (Class)AUParameterGroup;
  v11 = -[AUParameterNode initWithID:name:](&v25, sel_initWithID_name_, v8, v10);
  if (v11)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[AUParameterGroup initWithCoder:]::childIndexClasses, CFSTR("childIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_childIndicesByIdentifier, v12);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[AUParameterGroup initWithCoder:]::childrenClasses, CFSTR("children"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_children, v13);

    -[AUParameterGroup _indexChildren](v11, "_indexChildren");
  }

  return v11;
}

- (void)_serialize:(CASerializer *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AUParameterGroup children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = 0;
        v12 = objc_msgSend(v8, "isGroup");
        CASerializer::Write(a3, &v12);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        operator<<();

        if (v12)
        {
          objc_msgSend(v8, "_serialize:", a3);
        }
        else
        {
          LODWORD(v11) = 0;
          objc_msgSend(v8, "value", v11);
          LODWORD(v11) = v10;
          CASerializer::Write(a3, &v11);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  LOBYTE(v11) = -1;
  CASerializer::Write(a3, &v11);
}

- (void)_deserialize:(CADeserializer *)a3 fromSetFullState:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  int v16;
  CFTypeRef cf;
  unsigned __int8 v18;

  v4 = a4;
  v7 = *MEMORY[0x1E0C99768];
  if (a4)
    v8 = 6;
  else
    v8 = 0;
  while (1)
  {
    v18 = 0;
    CADeserializer::Read(a3, &v18);
    if (v18 == 255)
      break;
    if (v18 >= 2u)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      -[AUParameterNode keyPath](self, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v7, CFSTR("Archive under %@: corrupt type: %d"), v10, v18);

    }
    cf = 0;
    operator>>();
    -[AUParameterGroup valueForKey:](self, "valueForKey:", cf);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (cf)
      CFRelease(cf);
    if (v11)
    {
      v12 = v18;
      if (v12 != objc_msgSend(v11, "isGroup"))
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(v11, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v7, CFSTR("Is-group inconsistency in archive for %@"), v14);

      }
      if (v18)
      {
        objc_msgSend(v11, "_deserialize:fromSetFullState:", a3, v4);
      }
      else
      {
        v16 = 0;
        CADeserializer::Read(a3, &v16);
        LODWORD(v15) = v16;
        objc_msgSend(v11, "setValue:originator:", v8, v15);
      }
    }

  }
}

- (NSArray)children
{
  return self->_children;
}

- (NSMutableDictionary)childIndicesByIdentifier
{
  return self->_childIndicesByIdentifier;
}

- (void)setChildIndicesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_childIndicesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childIndicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
