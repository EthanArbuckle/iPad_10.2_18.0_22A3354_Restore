@implementation ZN15USDKitConverter31textureFileWithMaterialPropertyEP19SCNMaterialProperty

void *___ZN15USDKitConverter31textureFileWithMaterialPropertyEP19SCNMaterialProperty_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v12;
  unint64_t *v13;

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(v6 + 16), "stringByAppendingPathComponent:", CFSTR("textures")), 1, 0, 0);
  v7 = (void *)objc_msgSend(CFSTR("textures"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("texgen_%lu"), *(_QWORD *)(v6 + 184)), "stringByAppendingPathExtension:", a2));
  v8 = objc_msgSend(*(id *)(v6 + 16), "stringByAppendingPathComponent:", v7);
  v12 = objc_msgSend(*(id *)(a1 + 32), "contents");
  v13 = &v12;
  std::__tree<std::__value_type<__C3DMesh *,WireframeMesh *>,std::__map_value_compare<__C3DMesh *,std::__value_type<__C3DMesh *,WireframeMesh *>,std::less<__C3DMesh *>,true>,std::allocator<std::__value_type<__C3DMesh *,WireframeMesh *>>>::__emplace_unique_key_args<__C3DMesh *,std::piecewise_construct_t const&,std::tuple<__C3DMesh * const&>,std::tuple<>>((uint64_t **)(v6 + 168), &v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v13)[5] = (uint64_t)v7;
  v9 = objc_msgSend(v7, "UTF8String");
  v13 = (unint64_t *)(a1 + 48);
  v10 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>((uint64_t **)(v6 + 192), (unint64_t *)(a1 + 48), (uint64_t)&std::piecewise_construct, (uint64_t **)&v13);
  MEMORY[0x1DF0D40B8](v10 + 5, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a3, v8))
    return v7;
  else
    return 0;
}

@end
