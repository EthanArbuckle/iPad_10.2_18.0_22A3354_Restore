@implementation GCDevicePhysicalInputDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *elements;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *attributes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GCDevicePhysicalInputDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputDescription init](&v14, sel_init);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v14.receiver, v14.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("elements"));
  v7 = objc_claimAutoreleasedReturnValue();
  elements = v4->_elements;
  v4->_elements = (NSArray *)v7;

  v9 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("attributes"));
  v11 = objc_claimAutoreleasedReturnValue();

  attributes = v4->_attributes;
  v4->_attributes = (NSSet *)v11;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *elements;
  id v5;

  elements = self->_elements;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elements, CFSTR("elements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));

}

- (BOOL)validate:(id *)a3
{
  NSArray *elements;
  void *v6;
  BOOL v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  elements = self->_elements;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__GCDevicePhysicalInputDescription_validate___block_invoke;
  v22[3] = &unk_1EA4D2D68;
  v22[4] = &v23;
  -[NSArray enumerateObjectsUsingBlock:](elements, "enumerateObjectsUsingBlock:", v22);
  v6 = (void *)v24[5];
  if (a3 && v6)
    *a3 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v23, 8);

  if (v6)
    return 0;
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_elements;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "member:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (a3)
          {
            v29 = *MEMORY[0x1E0CB2D68];
            +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Multiple elements with identifier '%@'."), v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v15;
            +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDevicePhysicalInputError"), 0, v16);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          v7 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_18:

  return v7;
}

void __45__GCDevicePhysicalInputDescription_validate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  obj = 0;
  v8 = objc_msgSend(a2, "validate:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0)
  {
    v20[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "localizedFailureReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("GCFailingKeyPathErrorKey");
    v21[0] = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "gc_failingKeyPath");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x1E0C9AA60];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDevicePhysicalInputError"), 0, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_elements, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSet *attributes;
  NSArray *elements;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((attributes = self->_attributes, attributes == (NSSet *)v4[2])
     || -[NSSet isEqual:](attributes, "isEqual:")))
  {
    elements = self->_elements;
    if (elements == (NSArray *)v4[1])
      v7 = 1;
    else
      v7 = -[NSArray isEqual:](elements, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSSet allObjects](self->_attributes, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableString stringWithFormat:](&off_1F03AA990, "stringWithFormat:", CFSTR("Physical Input [%@] {"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_elements;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (-[NSArray count](self->_elements, "count"))
    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
