@implementation MCMXPCMessageWithOwnersAndGroupsBase

- (MCMXPCMessageWithOwnersAndGroupsBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageWithOwnersAndGroupsBase *v9;
  MCMXPCMessageWithOwnersAndGroupsBase *v10;
  NSSet *ownerIdentifiers;
  NSSet *groupIdentifiers;
  uint64_t uint64;
  void *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSSet *v21;
  NSSet *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  objc_super v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MCMXPCMessageWithOwnersAndGroupsBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v32, sel_initWithXPCObject_context_error_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v31 = 1;
    v9->_containerClass = 0;
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = 0;

    groupIdentifiers = v10->_groupIdentifiers;
    v10->_groupIdentifiers = 0;

    uint64 = xpc_dictionary_get_uint64(v8, "ContainerClass");
    v10->_containerClass = uint64;
    if (uint64 - 1 >= 0xE)
    {
      v14 = 0;
      v22 = 0;
      v23 = 20;
LABEL_29:
      v31 = v23;
      goto LABEL_30;
    }
    v10->_containerClass = container_class_normalized();
    -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v10, "nsObjectFromXPCObject:key:error:", v8, "OwnerIdentifiersArray", &v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = 0;
LABEL_28:
        v23 = 110;
        goto LABEL_29;
      }
      v30 = v14;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = v14;
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v22 = 0;
              v31 = 110;
              goto LABEL_38;
            }
          }
          v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v10->_ownerIdentifiers;
      v10->_ownerIdentifiers = (NSSet *)v20;

    }
    else
    {
      v23 = v31;
      if (v31 != 1)
      {
        v14 = 0;
        v22 = 0;
        goto LABEL_30;
      }
    }
    -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:](v10, "nsObjectFromXPCObject:key:error:", v8, "GroupIdentifiers", &v31);
    v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v14;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v22 = v22;
      v24 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v35;
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v35 != v26)
              objc_enumerationMutation(v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v31 = 110;
              v15 = v22;
              goto LABEL_38;
            }
          }
          v25 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
          if (v25)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
      v28 = objc_claimAutoreleasedReturnValue();
      v15 = v10->_groupIdentifiers;
      v10->_groupIdentifiers = (NSSet *)v28;
LABEL_38:

      v14 = v30;
LABEL_39:
      v23 = v31;
      if (v31 == 1)
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_30:
      if (a5)
        *a5 = v23;

      v10 = 0;
      goto LABEL_33;
    }
    goto LABEL_28;
  }
LABEL_34:

  return v10;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
}

@end
