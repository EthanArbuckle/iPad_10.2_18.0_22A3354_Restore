@implementation SCNNodeGetBoundingSphere

uint64_t __SCNNodeGetBoundingSphere_block_invoke(uint64_t a1)
{
  return C3DSceneUnlock(*(_QWORD *)(a1 + 32));
}

uint64_t __SCNNodeGetBoundingSphere_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = a2;
  if (std::__hash_table<std::__hash_value_type<__C3DNode *,SCNNode *>,std::__unordered_map_hasher<__C3DNode *,std::__hash_value_type<__C3DNode *,SCNNode *>,std::hash<__C3DNode *>,std::equal_to<__C3DNode *>,true>,std::__unordered_map_equal<__C3DNode *,std::__hash_value_type<__C3DNode *,SCNNode *>,std::equal_to<__C3DNode *>,std::hash<__C3DNode *>,true>,std::allocator<std::__hash_value_type<__C3DNode *,SCNNode *>>>::find<__C3DNode *>((_QWORD *)(a1 + 32), &v4))
  {
    return 1;
  }
  C3D::Array<unsigned long long,32u,C3D::MallocAllocator>::push_back<unsigned long long const&>(*(_QWORD *)(a1 + 72), &v4);
  return 0;
}

@end
