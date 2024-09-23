@implementation MCMXPCMessageWithConcreteContainersArrayBase

- (MCMXPCMessageWithConcreteContainersArrayBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageWithConcreteContainersArrayBase *v10;
  void *v11;
  uint64_t container_object_array;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  MCMConcreteContainerIdentityForLibsystem *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  MCMConcreteContainerIdentityForLibsystem *v21;
  uint64_t v22;
  NSArray *concreteContainerIdentities;
  void *v25;
  id v26;
  unint64_t *v27;
  objc_super v28;
  unint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30[0] = 1;
  v28.receiver = self;
  v28.super_class = (Class)MCMXPCMessageWithConcreteContainersArrayBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v28, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    xpc_dictionary_get_array(v8, "ContainersArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    container_object_array = container_xpc_decode_create_container_object_array();
    if (container_object_array)
    {
      v13 = container_object_array;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v25 = v11;
        v26 = v8;
        v27 = a5;
        v15 = 0;
        while (1)
        {
          v16 = [MCMConcreteContainerIdentityForLibsystem alloc];
          v17 = *(_QWORD *)(v13 + 8 * v15);
          objc_msgSend(v9, "clientIdentity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "userIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "userIdentityCache");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](v16, "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:", v17, v19, v20, v30);

          if (!v21)
            break;
          objc_msgSend(v14, "addObject:", v21);

          if (++v15 >= v29)
          {
            v8 = v26;
            a5 = v27;
            goto LABEL_10;
          }
        }
        v30[0] = 38;

        v10 = 0;
        v8 = v26;
        a5 = v27;
LABEL_10:
        v11 = v25;
      }
      if (v30[0] == 1)
      {
        v22 = objc_msgSend(v14, "copy");
        concreteContainerIdentities = v10->_concreteContainerIdentities;
        v10->_concreteContainerIdentities = (NSArray *)v22;

      }
      container_free_array_of_containers();
    }
    else
    {

      v10 = 0;
    }
  }
  if (a5 && v30[0] != 1)
    *a5 = v30[0];

  return v10;
}

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteContainerIdentities, 0);
}

@end
