@implementation ZL24

MPGaplessInfo *___ZL24_MPMLInitPropertySongMapv_block_invoke_17(uint64_t a1, void *a2, _QWORD *a3, int8x8_t *a4)
{
  id v6;
  unsigned __int8 *v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  void *v20;
  uint64_t v21;
  MPGaplessInfo *v22;
  void *__p[2];
  char v25;

  v6 = a2;
  std::string::basic_string[abi:ne180100]<0>(__p, "durationInSamples");
  v7 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v7)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v7 + 5), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  if (v25 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "gaplessEncodingDelay");
  v10 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v10)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v10 + 5), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (v25 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "gaplessEncodingDrain");
  v13 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v13)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v13 + 5), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v25 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "gaplessHeuristicInfo");
  v16 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v16)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v16 + 5), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v25 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "gaplessLastFrameResync");
  v19 = std::__hash_table<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,mlcore::ModelPropertyBase *>>>::find<std::string>(a3, (unsigned __int8 *)__p);
  if (!v19)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  MPMediaLibraryPropertyCacheValueForProperty(*((ModelPropertyBase **)v19 + 5), a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "longLongValue");

  if (v25 < 0)
    operator delete(__p[0]);
  if (v9 || (_DWORD)v12 || (_DWORD)v15 || (_DWORD)v18 || v21)
  {
    v22 = objc_alloc_init(MPGaplessInfo);
    -[MPGaplessInfo setHeuristicInfo:](v22, "setHeuristicInfo:", v18);
    -[MPGaplessInfo setDurationInFrames:](v22, "setDurationInFrames:", v9);
    -[MPGaplessInfo setEncodingDelayInFrames:](v22, "setEncodingDelayInFrames:", v12);
    -[MPGaplessInfo setEncodingDrainInFrames:](v22, "setEncodingDrainInFrames:", v15);
    -[MPGaplessInfo setLastPacketsResync:](v22, "setLastPacketsResync:", v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
