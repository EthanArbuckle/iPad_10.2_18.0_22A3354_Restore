@implementation ZL29

void *___ZL29_MPMLInitPropertyTVEpisodeMapv_block_invoke_12(uint64_t a1, void *a2, _QWORD *a3, int8x8_t *a4)
{
  id v6;
  unsigned __int8 *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *__p[2];
  char v13;

  v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "episodeType");
  v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v13 < 0)
    operator delete(__p[0]);
  if ((unint64_t)(v9 - 1) >= 6)
    v10 = &unk_1E31E4E70;
  else
    v10 = (void *)qword_1E3161280[v9 - 1];

  return v10;
}

@end
