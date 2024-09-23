@implementation IOSurfaceRemotePerSurfaceGlobalState

+ (id)globalStateForSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v9;
  uint64_t ID;
  void *v11;
  IOSurfaceRemotePerSurfaceGlobalState *v12;

  v9 = a6;
  if (globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken != -1)
    dispatch_once(&globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken, &__block_literal_global_1);
  ID = IOSurfaceClientGetID((uint64_t)a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);
  objc_msgSend((id)globalStateForSurface_mappedAddress_mappedSize_extraData__table, "objectForKey:", v11);
  v12 = (IOSurfaceRemotePerSurfaceGlobalState *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[IOSurfaceRemotePerSurfaceGlobalState initWithSurfaceID:mappedAddress:mappedSize:extraData:]([IOSurfaceRemotePerSurfaceGlobalState alloc], "initWithSurfaceID:mappedAddress:mappedSize:extraData:", ID, a4, a5, v9);
    objc_msgSend((id)globalStateForSurface_mappedAddress_mappedSize_extraData__table, "setObject:forKey:", v12, v11);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);

  return v12;
}

void __97__IOSurfaceRemotePerSurfaceGlobalState_globalStateForSurface_mappedAddress_mappedSize_extraData___block_invoke()
{
  uint64_t v0;
  void *v1;

  globalStateForSurface_mappedAddress_mappedSize_extraData__lock = (uint64_t)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)globalStateForSurface_mappedAddress_mappedSize_extraData__table;
  globalStateForSurface_mappedAddress_mappedSize_extraData__table = v0;

}

- (IOSurfaceRemotePerSurfaceGlobalState)initWithSurfaceID:(unsigned int)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  IOSurfaceRemotePerSurfaceGlobalState *result;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)IOSurfaceRemotePerSurfaceGlobalState;
  result = -[IOSurfaceRemotePerSurfaceGlobalState init](&v10, sel_init, *(_QWORD *)&a3, a4, a5, a6);
  result->_csid = a3;
  result->_mapped_address = a4;
  result->_mapped_size = a5;
  return result;
}

- (id)mergeExtraData:(id)a3
{
  id v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  OS_xpc_object *extraData;
  _QWORD v9[4];
  OS_xpc_object *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_extraData;
  if (!v5)
  {
    v6 = (OS_xpc_object *)v4;
    extraData = self->_extraData;
    self->_extraData = v6;
    goto LABEL_5;
  }
  v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke;
    v9[3] = &unk_1E4DE7678;
    v6 = v5;
    v10 = v6;
    xpc_dictionary_apply(v4, v9);
    extraData = v10;
LABEL_5:

  }
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

uint64_t __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (void)dealloc
{
  void *mapped_address;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mapped_address = self->_mapped_address;
  if (mapped_address)
    munmap(mapped_address, self->_mapped_size);
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceRemotePerSurfaceGlobalState;
  -[IOSurfaceRemotePerSurfaceGlobalState dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraData, 0);
}

@end
