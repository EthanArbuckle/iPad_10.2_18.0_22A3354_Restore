@implementation ZZN24SharedCacheSymbolicators26sharedCacheSymbolicatorMapEvENK3

_OWORD *___ZZN24SharedCacheSymbolicators26sharedCacheSymbolicatorMapEvENK3__0clEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *result;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;

  result = (_OWORD *)CSSymbolicatorGetSharedCacheUUID();
  v9 = result;
  if (result)
  {
    v6 = operator new();
    ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::ScopeGuard(v6, a2, a3);
    v8 = (_OWORD *)v6;
    std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__emplace_unique_impl<CFUUIDBytes const*&,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap, &v9, &v8);
    result = v8;
    v8 = 0;
    if (result)
    {
      v7 = ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard((uint64_t)result);
      return (_OWORD *)MEMORY[0x227696F98](v7, 0x1000C4057661CB1);
    }
  }
  return result;
}

@end
