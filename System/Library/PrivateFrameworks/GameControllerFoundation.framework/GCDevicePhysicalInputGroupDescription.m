@implementation GCDevicePhysicalInputGroupDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputGroupDescription)initWithCoder:(id)a3
{
  id v3;
  GCDevicePhysicalInputGroupDescription *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSArray *physicalInputs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCDevicePhysicalInputGroupDescription;
  v3 = a3;
  v4 = -[GCDevicePhysicalInputGroupDescription init](&v10, sel_init);
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("physicalInputs"));
  v7 = objc_claimAutoreleasedReturnValue();

  physicalInputs = v4->_physicalInputs;
  v4->_physicalInputs = (NSArray *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_physicalInputs, CFSTR("physicalInputs"));
}

- (BOOL)validate:(id *)a3
{
  NSArray *physicalInputs;
  void *v6;
  BOOL v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  NSArray *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  physicalInputs = self->_physicalInputs;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__GCDevicePhysicalInputGroupDescription_validate___block_invoke;
  v27[3] = &unk_1EA4D2D90;
  v27[4] = &v28;
  -[NSArray enumerateObjectsUsingBlock:](physicalInputs, "enumerateObjectsUsingBlock:", v27);
  v6 = (void *)v29[5];
  if (a3 && v6)
    *a3 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v28, 8);

  if (v6)
    return 0;
  v8 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_physicalInputs;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          +[NSSet set](&off_1F03A7348, "set");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        objc_msgSend(v8, "member:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (a3)
          {
            v36 = *MEMORY[0x1E0CB2D68];
            +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Multiple physical inputs with attributes '%@'."), v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v20;
            +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDevicePhysicalInputError"), 0, v21);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_21;
        }
        objc_msgSend(v8, "addObject:", v16);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v38, 16);
      if (v10)
        continue;
      break;
    }
  }

  +[NSSet set](&off_1F03A7348, "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "member:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19 != 0;

  if (a3 != 0 && !v7)
  {
    v34 = *MEMORY[0x1E0CB2D68];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Missing physical input with default attributes."));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v35 = v9;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDevicePhysicalInputError"), 0, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    v7 = 0;
  }

  return v7;
}

void __50__GCDevicePhysicalInputGroupDescription_validate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (NSArray)physicalInputs
{
  return self->_physicalInputs;
}

- (void)setPhysicalInputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalInputs, 0);
}

@end
