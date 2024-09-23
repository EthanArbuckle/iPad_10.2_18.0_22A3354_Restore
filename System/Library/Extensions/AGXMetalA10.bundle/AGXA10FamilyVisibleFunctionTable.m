@implementation AGXA10FamilyVisibleFunctionTable

- (AGXA10FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 type:(int)a9
{
  char *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  _QWORD *v16;
  os_unfair_lock_s *v17;
  char *v18;
  _QWORD block[5];
  _BYTE v21[88];
  uint64_t v22;
  unint64_t v23;

  v22 = 0;
  v11 = initializeWithDevice<AGXA10FamilyVisibleFunctionTable>(self, a3, a5, a6, (uint64_t)v21);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__AGXA10FamilyVisibleFunctionTable_initWithDevice_functionCount_options_isSuballocDisabled_resourceIndex_pipelineState_type___block_invoke;
  block[3] = &unk_2504028D8;
  block[4] = a3;
  if (-[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]::once != -1)
    dispatch_once(&-[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]::once, block);
  v12 = (int)*MEMORY[0x24BE51650];
  *((_DWORD *)v11 + 89) = a9;
  v13 = (os_unfair_lock_s *)a8;
  *((_QWORD *)v11 + 45) = v13;
  if (*((_DWORD *)v11 + 89))
  {
    v14 = v13 + 36;
    v15 = v13 + 248;
    os_unfair_lock_lock(v13 + 248);
    v23 = objc_msgSend(v11, "resourceIndex");
    v16 = std::__hash_table<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v14[458], v23, &v23);
  }
  else
  {
    v17 = v13 + 16;
    v15 = v13 + 23;
    os_unfair_lock_lock(v13 + 23);
    v23 = objc_msgSend(v11, "resourceIndex");
    v16 = std::__hash_table<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v17[68], v23, &v23);
  }
  v16[3] = v11;
  os_unfair_lock_unlock(v15);
  v18 = &v11[v12];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 2) = *(_QWORD *)&v11[v12 + 16] & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000;
  return (AGXA10FamilyVisibleFunctionTable *)v11;
}

- (AGXA10FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 resourceIndex:(unint64_t)a7 pipelineState:(id)a8 stage:(unint64_t)a9
{
  if ((a9 & ((_DWORD)a9 - 1)) != 0)
    return 0;
  else
    return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:](self, "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", a3, a4, a5, a6, a7, a8);
}

- (AGXA10FamilyVisibleFunctionTable)initWithDevice:(id)a3 functionCount:(int64_t)a4 options:(unint64_t)a5 isSuballocDisabled:(BOOL)a6 clonedResourceIndex:(unint64_t)a7 clonedVisibleFunctionHeap:(DummyHeap *)a8 type:(int)a9
{
  AGXA10FamilyVisibleFunctionTable *result;
  _QWORD *v10;
  _BYTE v11[88];
  uint64_t v12;

  v12 = 0;
  result = (AGXA10FamilyVisibleFunctionTable *)initializeWithDevice<AGXA10FamilyVisibleFunctionTable>(self, a3, a5, a6, (uint64_t)v11);
  v10 = (Class *)((char *)&result->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
  *(&result->_type + 1) = a9;
  result->_pipelineState = 0;
  *v10 = 0;
  v10[2] = v10[2] & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000;
  return result;
}

- (id)clone:(id)a3 clonedResourceIndex:(unint64_t)a4 clonedVisibleFunctionHeap:(DummyHeap *)a5 cloneHandleMap:(void *)a6
{
  _QWORD *v10;
  AGXA10FamilyVisibleFunctionTable *v11;
  id result;
  uint64_t v13;

  v10 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]);
  v11 = [AGXA10FamilyVisibleFunctionTable alloc];
  LODWORD(v13) = *(&self->_type + 1);
  result = -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:clonedResourceIndex:clonedVisibleFunctionHeap:type:](v11, "initWithDevice:functionCount:options:isSuballocDisabled:clonedResourceIndex:clonedVisibleFunctionHeap:type:", a3, 0, 0, *(unsigned __int8 *)(*((_QWORD *)a3 + 101) + 6725), a4, a5, v13);
  *v10 = 0;
  v10[2] = v10[2] & 0x1FFFFFFFFFFFFFFFLL | 0x8000000000000000;
  return result;
}

- (void)dealloc
{
  os_unfair_lock_s *pipelineState;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  unint64_t v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;
  objc_super v9;

  pipelineState = (os_unfair_lock_s *)self->_pipelineState;
  if (pipelineState)
  {
    if (*(&self->_type + 1))
    {
      v4 = pipelineState + 36;
      v5 = pipelineState + 248;
      os_unfair_lock_lock(pipelineState + 248);
      v6 = -[AGXA10FamilyVisibleFunctionTable resourceIndex](self, "resourceIndex");
      v7 = (uint64_t *)&v4[458];
    }
    else
    {
      v8 = pipelineState + 16;
      v5 = pipelineState + 23;
      os_unfair_lock_lock(pipelineState + 23);
      v6 = -[AGXA10FamilyVisibleFunctionTable resourceIndex](self, "resourceIndex");
      v7 = (uint64_t *)&v8[68];
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXA10FamilyVisibleFunctionTable *>>>::__erase_unique<unsigned long long>(v7, v6);
    os_unfair_lock_unlock(v5);

  }
  v9.receiver = self;
  v9.super_class = (Class)AGXA10FamilyVisibleFunctionTable;
  -[IOGPUMetalBuffer dealloc](&v9, sel_dealloc);
}

- (unint64_t)uniqueIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super._label + (int)*MEMORY[0x24BE51650]);
}

- (unint64_t)resourceIndex
{
  return 0;
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)gpuAddress
{
  return 0;
}

uint64_t __125__AGXA10FamilyVisibleFunctionTable_initWithDevice_functionCount_options_isSuballocDisabled_resourceIndex_pipelineState_type___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 808);
  v2 = *(_QWORD *)(v1 + 5608);
  if (v2 != *(_QWORD *)(v1 + 5616))
    *(_QWORD *)(v1 + 5616) = v2;
  return result;
}

@end
