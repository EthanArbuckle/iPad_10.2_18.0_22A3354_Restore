@implementation PHASEAssetRegistry

- (NSDictionary)globalMetaParameters
{
  PHASEAssetRegistry *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2->_metaParameterDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (PHASEAssetRegistry)init
{
  -[PHASEAssetRegistry doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEAssetRegistry)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)sizeInBytes
{
  id *next;
  unint64_t v3;

  next = (id *)self->_assetLookup.__table_.__p1_.__value_.__next_;
  if (!next)
    return 0;
  v3 = 0;
  do
  {
    v3 += objc_msgSend(next[3], "sizeInBytes");
    next = (id *)*next;
  }
  while (next);
  return v3;
}

- (PHASEAssetRegistry)initWithEngine:(id)a3
{
  id v4;
  PHASEAssetRegistry *v5;
  PHASEAssetRegistry *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *metaParameterDictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASEAssetRegistry;
  v5 = -[PHASEAssetRegistry init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engine, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    metaParameterDictionary = v6->_metaParameterDictionary;
    v6->_metaParameterDictionary = v7;

  }
  return v6;
}

- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 uid:(id)a5 outError:(id *)a6
{
  -[PHASEAssetRegistry registerJSONDataBundleWithURL:assetBaseURL:identifier:error:](self, "registerJSONDataBundleWithURL:assetBaseURL:identifier:error:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)registerJSONDataBundleWithURL:(id)a3 assetBaseURL:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  Phase *v12;
  id WeakRetained;
  void *v14;
  NSString *v15;
  unint64_t StringHashId;
  unint64_t v17;
  unint64_t v18;
  Phase::Logger *v19;
  NSObject *v20;
  Phase *v21;
  uint64_t v22;
  uint64_t v23;
  PHASEDataBundleAsset *v24;
  id v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t *v28;
  PHASEAssetRegistry *v29;
  PHASESoundEventNodeAsset *v30;
  unint64_t v31;
  PHASESoundEventNodeAsset *v32;
  PHASESoundEventNodeAsset *v33;
  unint64_t v34;
  uint8x8_t v35;
  _QWORD *v36;
  _QWORD *i;
  unint64_t v38;
  _QWORD *v39;
  float v40;
  _BOOL8 v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  size_t v50;
  _BYTE *v51;
  void **v52;
  std::string *v53;
  __int128 v54;
  void *v55;
  int v56;
  void **v57;
  uint64_t v58;
  void **v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  uint8x8_t v68;
  _QWORD *v69;
  _QWORD *v70;
  unint64_t v71;
  _QWORD *v72;
  float v73;
  _BOOL8 v74;
  unint64_t v75;
  unint64_t v76;
  size_t v77;
  uint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  char v81;
  Phase::Logger *v82;
  NSObject *v83;
  uint64_t v85;
  uint64_t v86;
  Phase::Logger *v87;
  NSObject *v88;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t *v93;
  PHASEGlobalMetaParameterAsset *v94;
  PHASEAssetRegistry *v95;
  unint64_t v96;
  PHASEGlobalMetaParameterAsset *v97;
  PHASEGlobalMetaParameterAsset *v98;
  unint64_t v99;
  uint8x8_t v100;
  _QWORD *v101;
  _QWORD *j;
  unint64_t v103;
  _QWORD *v104;
  float v105;
  _BOOL8 v106;
  unint64_t v107;
  unint64_t v108;
  size_t v109;
  uint64_t v110;
  _QWORD *v111;
  unint64_t v112;
  Phase::Logger *v113;
  _QWORD *v114;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, PHASEAsset *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, PHASEAsset *>, void *>>> *p_p1;
  unint64_t v116;
  void *v117;
  unint64_t value;
  uint8x8_t v119;
  _QWORD *v120;
  _QWORD *v121;
  unint64_t v122;
  _QWORD *v123;
  float v124;
  float v125;
  _BOOL8 v126;
  unint64_t v127;
  unint64_t v128;
  size_t v129;
  void **v130;
  void **v131;
  unint64_t v132;
  PHASEDataBundleAsset *v133;
  _QWORD *v134;
  PHASEDataBundleAsset *v135;
  _QWORD *v136;
  Phase::StringPool *v137;
  Phase::Logger *v138;
  char v139;
  uint64_t v140;
  NSObject *v141;
  Phase *v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *n;
  Phase::Logger *v146;
  NSObject *v147;
  uint64_t v149;
  uint64_t v150;
  NSObject *v151;
  unint64_t String;
  uint64_t v154;
  _QWORD *ii;
  id v156;
  uint64_t v157;
  NSObject *v158;
  Phase *v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *m;
  uint64_t **k;
  unint64_t *v164;
  _QWORD *v165;
  unordered_map<unsigned long long, PHASEAsset *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PHASEAsset *>>> *v167;
  unint64_t v168;
  PHASEAssetRegistry *v169;
  id v170;
  void *v171;
  id *v172;
  void *v173;
  void *v174;
  Phase *v175;
  _QWORD *v176;
  void *__p[2];
  std::string::size_type v178;
  __int128 v179;
  __int128 v180;
  float v181;
  void *v182[2];
  unsigned __int8 v183;
  Phase::StringPool *v184;
  _QWORD *v185;
  _BYTE v186[28];
  __int16 v187;
  uint64_t v188;
  uint8_t buf[40];
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (Phase *)a5;
  if (a6)
    *a6 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v14 = WeakRetained;
  v173 = v11;
  v174 = v10;
  if (!WeakRetained || !objc_msgSend(WeakRetained, "implementation"))
  {
    v175 = v12;
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920802, 0);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    goto LABEL_260;
  }
  if (!v12)
  {
    -[PHASEAssetRegistry getUniqueIdentifier](self, "getUniqueIdentifier");
    v12 = (Phase *)objc_claimAutoreleasedReturnValue();
  }
  StringHashId = Phase::GetStringHashId(v12, v15);
  v17 = (unint64_t)v186;
  v18 = self;
  objc_sync_enter((id)v18);
  v19 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>((_QWORD *)(v18 + 16), StringHashId);
  if (v19)
  {
    v175 = v12;
    v20 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v19));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_retainAutorelease(v12);
      v22 = -[Phase UTF8String](v21, "UTF8String");
      v23 = -[Phase UTF8String](objc_retainAutorelease(v21), "UTF8String");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "PHASEAssetRegistry.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 519;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v22;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v23;
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", buf, 0x26u);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit((id)v18);

    v24 = 0;
    goto LABEL_260;
  }
  v168 = StringHashId;
  objc_sync_exit((id)v18);

  memset(buf, 0, 32);
  *(_DWORD *)&buf[32] = 1065353216;
  v175 = objc_retainAutorelease(v12);
  Phase::MakeDataBundleFromJSONFile((_BYTE *)-[Phase UTF8String](v175, "UTF8String"), v10, (uint64_t)buf, a6, &v185);
  if (!v185)
  {
    v24 = 0;
    goto LABEL_259;
  }
  v171 = v14;
  Phase::BuildStringPool((uint64_t)buf, (unint64_t **)&v184);
  v167 = (unordered_map<unsigned long long, PHASEAsset *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PHASEAsset *>>> *)(v18 + 16);
  v172 = a6;
  objc_msgSend(v11, "path");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v182, (char *)objc_msgSend(v25, "UTF8String"));

  v179 = 0u;
  v180 = 0u;
  v181 = 1.0;
  v26 = v185;
  if (v185[1])
  {
    v27 = 0;
    StringHashId = 0x24BDD1000uLL;
    while (1)
    {
      v28 = (unint64_t *)(v26[2] + 120 * v27);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Phase::StringPool::GetString(v184, *v28));
      v29 = (PHASEAssetRegistry *)objc_claimAutoreleasedReturnValue();
      v30 = -[PHASESoundEventNodeAsset initWithUID:actionTreeWeakReference:assetRegistry:details:]([PHASESoundEventNodeAsset alloc], "initWithUID:actionTreeWeakReference:assetRegistry:details:", v29, v28, v18, 0);
      v31 = *v28;
      v32 = v30;
      v33 = v32;
      v34 = *((_QWORD *)&v179 + 1);
      if (*((_QWORD *)&v179 + 1))
      {
        v35 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v179 + 8));
        v35.i16[0] = vaddlv_u8(v35);
        if (v35.u32[0] > 1uLL)
        {
          v17 = v31;
          if (*((_QWORD *)&v179 + 1) <= v31)
            v17 = v31 % *((_QWORD *)&v179 + 1);
        }
        else
        {
          v17 = (*((_QWORD *)&v179 + 1) - 1) & v31;
        }
        v36 = *(_QWORD **)(v179 + 8 * v17);
        if (v36)
        {
          for (i = (_QWORD *)*v36; i; i = (_QWORD *)*i)
          {
            v38 = i[1];
            if (v38 == v31)
            {
              if (i[2] == v31)
              {

                v88 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v87));
                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                {
                  v90 = -[PHASEAssetRegistry UTF8String](objc_retainAutorelease(v29), "UTF8String");
                  v91 = -[Phase UTF8String](objc_retainAutorelease(v175), "UTF8String");
                  *(_DWORD *)v186 = 136315906;
                  *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
                  *(_WORD *)&v186[12] = 1024;
                  *(_DWORD *)&v186[14] = 557;
                  *(_WORD *)&v186[18] = 2080;
                  *(_QWORD *)&v186[20] = v90;
                  v187 = 2080;
                  v188 = v91;
                  _os_log_impl(&dword_2164CC000, v88, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
                }

                if (v172)
                {
                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
                  *v172 = (id)objc_claimAutoreleasedReturnValue();
                }

LABEL_228:
                v24 = 0;
                goto LABEL_252;
              }
            }
            else
            {
              if (v35.u32[0] > 1uLL)
              {
                if (v38 >= *((_QWORD *)&v179 + 1))
                  v38 %= *((_QWORD *)&v179 + 1);
              }
              else
              {
                v38 &= *((_QWORD *)&v179 + 1) - 1;
              }
              if (v38 != v17)
                break;
            }
          }
        }
      }
      v39 = operator new(0x20uLL);
      *v39 = 0;
      v39[1] = v31;
      v39[2] = v31;
      v39[3] = v33;
      v40 = (float)(unint64_t)(*((_QWORD *)&v180 + 1) + 1);
      if (!v34 || (float)(v181 * (float)v34) < v40)
      {
        v41 = (v34 & (v34 - 1)) != 0;
        if (v34 < 3)
          v41 = 1;
        v42 = v41 | (2 * v34);
        v43 = vcvtps_u32_f32(v40 / v181);
        if (v42 <= v43)
          v44 = v43;
        else
          v44 = v42;
        std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>((uint64_t)&v179, v44);
        v34 = *((_QWORD *)&v179 + 1);
        if ((*((_QWORD *)&v179 + 1) & (*((_QWORD *)&v179 + 1) - 1)) != 0)
        {
          if (*((_QWORD *)&v179 + 1) <= v31)
            v17 = v31 % *((_QWORD *)&v179 + 1);
          else
            v17 = v31;
        }
        else
        {
          v17 = (*((_QWORD *)&v179 + 1) - 1) & v31;
        }
      }
      v45 = v179;
      v46 = *(_QWORD **)(v179 + 8 * v17);
      if (v46)
        break;
      *v39 = v180;
      *(_QWORD *)&v180 = v39;
      *(_QWORD *)(v45 + 8 * v17) = &v180;
      if (*v39)
      {
        v47 = *(_QWORD *)(*v39 + 8);
        if ((v34 & (v34 - 1)) != 0)
        {
          if (v47 >= v34)
            v47 %= v34;
        }
        else
        {
          v47 &= v34 - 1;
        }
        v46 = (_QWORD *)(v179 + 8 * v47);
        goto LABEL_55;
      }
LABEL_56:
      ++*((_QWORD *)&v180 + 1);

      ++v27;
      v26 = v185;
      if (v27 >= v185[1])
        goto LABEL_57;
    }
    *v39 = *v46;
LABEL_55:
    *v46 = v39;
    goto LABEL_56;
  }
LABEL_57:
  if (!v26[3])
    goto LABEL_130;
  v48 = 0;
  v169 = (PHASEAssetRegistry *)v18;
  do
  {
    v49 = v26[4];
    if ((v183 & 0x80u) == 0)
      v50 = v183;
    else
      v50 = (size_t)v182[1];
    std::string::basic_string[abi:ne180100]((uint64_t)v186, v50 + 1);
    if (v186[23] >= 0)
      v51 = v186;
    else
      v51 = *(_BYTE **)v186;
    if (v50)
    {
      if ((v183 & 0x80u) == 0)
        v52 = v182;
      else
        v52 = (void **)v182[0];
      memmove(v51, v52, v50);
    }
    *(_WORD *)&v51[v50] = 47;
    v53 = std::string::append((std::string *)v186, (const std::string::value_type *)(v49 + 1064 * v48 + 8));
    v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
    v178 = v53->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v54;
    v53->__r_.__value_.__l.__size_ = 0;
    v53->__r_.__value_.__r.__words[2] = 0;
    v53->__r_.__value_.__r.__words[0] = 0;
    if ((v186[23] & 0x80000000) != 0)
      operator delete(*(void **)v186);
    v55 = (void *)MEMORY[0x24BDD17C8];
    v56 = SHIBYTE(v178);
    v57 = (void **)__p[0];
    v58 = objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding");
    if (v56 >= 0)
      v59 = __p;
    else
      v59 = v57;
    objc_msgSend(v55, "stringWithCString:encoding:", v59, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    StringHashId = objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", *(unsigned int *)(v49 + 1064 * v48 + 1056));
    v62 = v49 + 1064 * v48;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Phase::StringPool::GetString(v184, *(_QWORD *)v62));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18, "makeSoundAssetWithURL:uid:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:outError:", v61, v63, *(_QWORD *)(v62 + 1032), StringHashId, *(_QWORD *)(v62 + 1040), *MEMORY[0x24BDAEC58], *(double *)(v62 + 1048), v172);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (!v64)
      goto LABEL_118;
    v66 = *(_QWORD *)v62;
    v170 = v64;
    v67 = *((_QWORD *)&v179 + 1);
    if (!*((_QWORD *)&v179 + 1))
      goto LABEL_92;
    v68 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v179 + 8));
    v68.i16[0] = vaddlv_u8(v68);
    if (v68.u32[0] > 1uLL)
    {
      v18 = v66;
      if (*((_QWORD *)&v179 + 1) <= v66)
        v18 = v66 % *((_QWORD *)&v179 + 1);
    }
    else
    {
      v18 = (*((_QWORD *)&v179 + 1) - 1) & v66;
    }
    v69 = *(_QWORD **)(v179 + 8 * v18);
    if (!v69 || (v70 = (_QWORD *)*v69) == 0)
    {
LABEL_92:
      v72 = operator new(0x20uLL);
      *v72 = 0;
      v72[1] = v66;
      v72[2] = v66;
      v72[3] = v170;
      v73 = (float)(unint64_t)(*((_QWORD *)&v180 + 1) + 1);
      if (!v67 || (float)(v181 * (float)v67) < v73)
      {
        v74 = (v67 & (v67 - 1)) != 0;
        if (v67 < 3)
          v74 = 1;
        v75 = v74 | (2 * v67);
        v76 = vcvtps_u32_f32(v73 / v181);
        if (v75 <= v76)
          v77 = v76;
        else
          v77 = v75;
        std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>((uint64_t)&v179, v77);
        v67 = *((_QWORD *)&v179 + 1);
        if ((*((_QWORD *)&v179 + 1) & (*((_QWORD *)&v179 + 1) - 1)) != 0)
        {
          if (*((_QWORD *)&v179 + 1) <= v66)
            v18 = v66 % *((_QWORD *)&v179 + 1);
          else
            v18 = v66;
        }
        else
        {
          v18 = (*((_QWORD *)&v179 + 1) - 1) & v66;
        }
      }
      v78 = v179;
      v79 = *(_QWORD **)(v179 + 8 * v18);
      if (v79)
      {
        *v72 = *v79;
        v18 = (unint64_t)v169;
      }
      else
      {
        *v72 = v180;
        *(_QWORD *)&v180 = v72;
        *(_QWORD *)(v78 + 8 * v18) = &v180;
        v18 = (unint64_t)v169;
        if (!*v72)
        {
LABEL_113:
          ++*((_QWORD *)&v180 + 1);
          v81 = 1;
          goto LABEL_119;
        }
        v80 = *(_QWORD *)(*v72 + 8);
        if ((v67 & (v67 - 1)) != 0)
        {
          if (v80 >= v67)
            v80 %= v67;
        }
        else
        {
          v80 &= v67 - 1;
        }
        v79 = (_QWORD *)(v179 + 8 * v80);
      }
      *v79 = v72;
      goto LABEL_113;
    }
    while (1)
    {
      v71 = v70[1];
      if (v71 == v66)
        break;
      if (v68.u32[0] > 1uLL)
      {
        if (v71 >= *((_QWORD *)&v179 + 1))
          v71 %= *((_QWORD *)&v179 + 1);
      }
      else
      {
        v71 &= *((_QWORD *)&v179 + 1) - 1;
      }
      if (v71 != v18)
        goto LABEL_92;
LABEL_91:
      v70 = (_QWORD *)*v70;
      if (!v70)
        goto LABEL_92;
    }
    if (v70[2] != v66)
      goto LABEL_91;

    v18 = (unint64_t)v169;
    v83 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v82));
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v85 = objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
      v86 = -[Phase UTF8String](objc_retainAutorelease(v175), "UTF8String");
      *(_DWORD *)v186 = 136315906;
      *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
      *(_WORD *)&v186[12] = 1024;
      *(_DWORD *)&v186[14] = 605;
      *(_WORD *)&v186[18] = 2080;
      *(_QWORD *)&v186[20] = v85;
      v187 = 2080;
      v188 = v86;
      _os_log_impl(&dword_2164CC000, v83, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
    }

    if (v172)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
      v81 = 0;
      *v172 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_119;
    }
LABEL_118:
    v81 = 0;
LABEL_119:

    if (SHIBYTE(v178) < 0)
      operator delete(__p[0]);
    if ((v81 & 1) == 0)
    {
      v24 = 0;
      goto LABEL_253;
    }
    ++v48;
    v26 = v185;
  }
  while (v48 < v185[3]);
LABEL_130:
  if (v26[7])
  {
    v92 = 0;
    StringHashId = 0x24BDD1000uLL;
    while (1)
    {
      v93 = (unint64_t *)(v26[8] + 464 * v92);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Phase::StringPool::GetString(v184, *v93));
      v29 = (PHASEAssetRegistry *)objc_claimAutoreleasedReturnValue();
      v94 = -[PHASEGlobalMetaParameterAsset initWithUID:metaParameterWeakReference:assetRegistry:]([PHASEGlobalMetaParameterAsset alloc], "initWithUID:metaParameterWeakReference:assetRegistry:", v29, v93, v18);
      v95 = (PHASEAssetRegistry *)v18;
      v96 = *v93;
      v97 = v94;
      v98 = v97;
      v99 = *((_QWORD *)&v179 + 1);
      if (*((_QWORD *)&v179 + 1))
      {
        v100 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v179 + 8));
        v100.i16[0] = vaddlv_u8(v100);
        if (v100.u32[0] > 1uLL)
        {
          v18 = v96;
          if (*((_QWORD *)&v179 + 1) <= v96)
            v18 = v96 % *((_QWORD *)&v179 + 1);
        }
        else
        {
          v18 = (*((_QWORD *)&v179 + 1) - 1) & v96;
        }
        v101 = *(_QWORD **)(v179 + 8 * v18);
        if (v101)
        {
          for (j = (_QWORD *)*v101; j; j = (_QWORD *)*j)
          {
            v103 = j[1];
            if (v103 == v96)
            {
              if (j[2] == v96)
              {

                v147 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v146));
                if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
                {
                  v149 = -[PHASEAssetRegistry UTF8String](objc_retainAutorelease(v29), "UTF8String");
                  v150 = -[Phase UTF8String](objc_retainAutorelease(v175), "UTF8String");
                  *(_DWORD *)v186 = 136315906;
                  *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
                  *(_WORD *)&v186[12] = 1024;
                  *(_DWORD *)&v186[14] = 639;
                  *(_WORD *)&v186[18] = 2080;
                  *(_QWORD *)&v186[20] = v149;
                  v187 = 2080;
                  v188 = v150;
                  _os_log_impl(&dword_2164CC000, v147, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
                }

                if (v172)
                {
                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
                  *v172 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_228;
              }
            }
            else
            {
              if (v100.u32[0] > 1uLL)
              {
                if (v103 >= *((_QWORD *)&v179 + 1))
                  v103 %= *((_QWORD *)&v179 + 1);
              }
              else
              {
                v103 &= *((_QWORD *)&v179 + 1) - 1;
              }
              if (v103 != v18)
                break;
            }
          }
        }
      }
      v104 = operator new(0x20uLL);
      *v104 = 0;
      v104[1] = v96;
      v104[2] = v96;
      v104[3] = v98;
      v105 = (float)(unint64_t)(*((_QWORD *)&v180 + 1) + 1);
      if (!v99 || (float)(v181 * (float)v99) < v105)
      {
        v106 = (v99 & (v99 - 1)) != 0;
        if (v99 < 3)
          v106 = 1;
        v107 = v106 | (2 * v99);
        v108 = vcvtps_u32_f32(v105 / v181);
        if (v107 <= v108)
          v109 = v108;
        else
          v109 = v107;
        std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>((uint64_t)&v179, v109);
        v99 = *((_QWORD *)&v179 + 1);
        if ((*((_QWORD *)&v179 + 1) & (*((_QWORD *)&v179 + 1) - 1)) != 0)
        {
          if (*((_QWORD *)&v179 + 1) <= v96)
            v18 = v96 % *((_QWORD *)&v179 + 1);
          else
            v18 = v96;
        }
        else
        {
          v18 = (*((_QWORD *)&v179 + 1) - 1) & v96;
        }
      }
      v110 = v179;
      v111 = *(_QWORD **)(v179 + 8 * v18);
      if (v111)
        break;
      *v104 = v180;
      *(_QWORD *)&v180 = v104;
      *(_QWORD *)(v110 + 8 * v18) = &v180;
      v18 = (unint64_t)v95;
      if (*v104)
      {
        v112 = *(_QWORD *)(*v104 + 8);
        if ((v99 & (v99 - 1)) != 0)
        {
          if (v112 >= v99)
            v112 %= v99;
        }
        else
        {
          v112 &= v99 - 1;
        }
        v111 = (_QWORD *)(v179 + 8 * v112);
        goto LABEL_168;
      }
LABEL_169:
      ++*((_QWORD *)&v180 + 1);

      ++v92;
      v26 = v185;
      if (v92 >= v185[7])
        goto LABEL_170;
    }
    *v104 = *v111;
    v18 = (unint64_t)v95;
LABEL_168:
    *v111 = v104;
    goto LABEL_169;
  }
LABEL_170:
  v29 = (PHASEAssetRegistry *)(id)v18;
  v113 = (Phase::Logger *)objc_sync_enter(v29);
  v114 = (_QWORD *)v180;
  if (!(_QWORD)v180)
  {
LABEL_210:
    v133 = [PHASEDataBundleAsset alloc];
    v134 = v185;
    v185 = 0;
    v176 = v134;
    v135 = -[PHASEDataBundleAsset initWithURL:uid:dataBundle:assetRegistry:](v133, "initWithURL:uid:dataBundle:assetRegistry:", v174, v175, &v176, v29);
    v136 = v176;
    v176 = 0;
    if (v136)
      std::default_delete<Phase::DataBundle>::operator()[abi:ne180100]((uint64_t)&v176, v136);
    if (v135)
    {
      v137 = v184;
      v184 = 0;
      *(_QWORD *)v186 = v168;
      *(_QWORD *)&v186[8] = v137;
      v138 = (Phase::Logger *)std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::unique_ptr<Phase::StringPool>>>((uint64_t *)&v29->_stringPools, v168, (uint64_t *)v186);
      v139 = (char)v138;
      v140 = *(_QWORD *)&v186[8];
      *(_QWORD *)&v186[8] = 0;
      if (v140)
        std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&v186[8], v140);
      if ((v139 & 1) != 0)
      {
        v157 = std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,PHASEDataBundleAsset * {__strong}&>((uint64_t)v167, v168, v168, v135);
        if ((v157 & 1) != 0)
        {
          for (k = (uint64_t **)v180; k; k = (uint64_t **)*k)
          {
            -[PHASEAssetRegistry logAddAsset:](v29, "logAddAsset:", k[3]);
            objc_msgSend(k[3], "setOwningDataBundleIdentifier:", v175);
          }
          -[PHASEAssetRegistry logAddAsset:](v29, "logAddAsset:", v135);
          v24 = v135;
          goto LABEL_249;
        }
        v158 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr((Phase::Logger *)v157));
        if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
        {
          v159 = objc_retainAutorelease(v175);
          v160 = -[Phase UTF8String](v159, "UTF8String");
          v161 = -[Phase UTF8String](objc_retainAutorelease(v159), "UTF8String");
          *(_DWORD *)v186 = 136315906;
          *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
          *(_WORD *)&v186[12] = 1024;
          *(_DWORD *)&v186[14] = 755;
          *(_WORD *)&v186[18] = 2080;
          *(_QWORD *)&v186[20] = v160;
          v187 = 2080;
          v188 = v161;
          _os_log_impl(&dword_2164CC000, v158, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
        }

        for (m = (_QWORD *)v180; m; m = (_QWORD *)*m)
          std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__erase_unique<unsigned long long>(v167, m[2]);
        if (v172)
          goto LABEL_243;
      }
      else
      {
        v141 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v138));
        if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        {
          v142 = objc_retainAutorelease(v175);
          v143 = -[Phase UTF8String](v142, "UTF8String");
          v144 = -[Phase UTF8String](objc_retainAutorelease(v142), "UTF8String");
          *(_DWORD *)v186 = 136315906;
          *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
          *(_WORD *)&v186[12] = 1024;
          *(_DWORD *)&v186[14] = 721;
          *(_WORD *)&v186[18] = 2080;
          *(_QWORD *)&v186[20] = v143;
          v187 = 2080;
          v188 = v144;
          _os_log_impl(&dword_2164CC000, v141, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
        }

        for (n = (_QWORD *)v180; n; n = (_QWORD *)*n)
          std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__erase_unique<unsigned long long>(v167, n[2]);
        if (v172)
        {
LABEL_243:
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
          v156 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_244;
        }
      }
    }
    else if (v172)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, 0);
      v156 = (id)objc_claimAutoreleasedReturnValue();
LABEL_244:
      v24 = 0;
      *v172 = v156;
LABEL_249:

      goto LABEL_251;
    }
    v24 = 0;
    goto LABEL_249;
  }
  p_p1 = &v29->_assetLookup.__table_.__p1_;
  while (1)
  {
    v116 = v114[2];
    v117 = (void *)v114[3];
    value = v29->_assetLookup.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      v119 = (uint8x8_t)vcnt_s8((int8x8_t)value);
      v119.i16[0] = vaddlv_u8(v119);
      if (v119.u32[0] > 1uLL)
      {
        StringHashId = v114[2];
        if (value <= v116)
          StringHashId = v116 % value;
      }
      else
      {
        StringHashId = (value - 1) & v116;
      }
      v120 = v167->__table_.__bucket_list_.__ptr_.__value_[StringHashId];
      if (v120)
      {
        v121 = (_QWORD *)*v120;
        if (v121)
          break;
      }
    }
LABEL_188:
    v123 = operator new(0x20uLL);
    *v123 = 0;
    v123[1] = v116;
    v123[2] = v116;
    v113 = v117;
    v123[3] = v113;
    v124 = (float)(v29->_assetLookup.__table_.__p2_.__value_ + 1);
    v125 = v29->_assetLookup.__table_.__p3_.__value_;
    if (!value || (float)(v125 * (float)value) < v124)
    {
      v126 = (value & (value - 1)) != 0;
      if (value < 3)
        v126 = 1;
      v127 = v126 | (2 * value);
      v128 = vcvtps_u32_f32(v124 / v125);
      if (v127 <= v128)
        v129 = v128;
      else
        v129 = v127;
      std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>((uint64_t)v167, v129);
      value = v29->_assetLookup.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if ((value & (value - 1)) != 0)
      {
        if (value <= v116)
          StringHashId = v116 % value;
        else
          StringHashId = v116;
      }
      else
      {
        StringHashId = (value - 1) & v116;
      }
    }
    v130 = v167->__table_.__bucket_list_.__ptr_.__value_;
    v131 = (void **)v167->__table_.__bucket_list_.__ptr_.__value_[StringHashId];
    if (v131)
    {
      *v123 = *v131;
LABEL_208:
      *v131 = v123;
      goto LABEL_209;
    }
    *v123 = p_p1->__value_.__next_;
    p_p1->__value_.__next_ = v123;
    v130[StringHashId] = p_p1;
    if (*v123)
    {
      v132 = *(_QWORD *)(*v123 + 8);
      if ((value & (value - 1)) != 0)
      {
        if (v132 >= value)
          v132 %= value;
      }
      else
      {
        v132 &= value - 1;
      }
      v131 = &v167->__table_.__bucket_list_.__ptr_.__value_[v132];
      goto LABEL_208;
    }
LABEL_209:
    ++v29->_assetLookup.__table_.__p2_.__value_;
    v114 = (_QWORD *)*v114;
    if (!v114)
      goto LABEL_210;
  }
  while (1)
  {
    v122 = v121[1];
    if (v122 == v116)
      break;
    if (v119.u32[0] > 1uLL)
    {
      if (v122 >= value)
        v122 %= value;
    }
    else
    {
      v122 &= value - 1;
    }
    if (v122 != StringHashId)
      goto LABEL_188;
LABEL_187:
    v121 = (_QWORD *)*v121;
    if (!v121)
      goto LABEL_188;
  }
  if (v121[2] != v116)
    goto LABEL_187;
  v151 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v113));
  if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
  {
    String = Phase::StringPool::GetString(v184, v114[2]);
    v154 = -[Phase UTF8String](objc_retainAutorelease(v175), "UTF8String");
    *(_DWORD *)v186 = 136315906;
    *(_QWORD *)&v186[4] = "PHASEAssetRegistry.mm";
    *(_WORD *)&v186[12] = 1024;
    *(_DWORD *)&v186[14] = 670;
    *(_WORD *)&v186[18] = 2080;
    *(_QWORD *)&v186[20] = String;
    v187 = 2080;
    v188 = v154;
    _os_log_impl(&dword_2164CC000, v151, OS_LOG_TYPE_ERROR, "%25s:%-5d Asset %s already exists. Not loading databundle %s", v186, 0x26u);
  }

  for (ii = (_QWORD *)v180; ii; ii = (_QWORD *)*ii)
    std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__erase_unique<unsigned long long>(v167, ii[2]);
  if (v172)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
    v24 = 0;
    *v172 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
LABEL_251:
  objc_sync_exit(v29);
LABEL_252:

LABEL_253:
  std::__hash_table<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>>>::~__hash_table((uint64_t)&v179);
  if ((char)v183 < 0)
    operator delete(v182[0]);
  v164 = (unint64_t *)v184;
  v184 = 0;
  if (v164)
    std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&v184, (uint64_t)v164);
  v165 = v185;
  v185 = 0;
  v14 = v171;
  if (v165)
    std::default_delete<Phase::DataBundle>::operator()[abi:ne180100]((uint64_t)&v185, v165);
LABEL_259:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)buf);
LABEL_260:

  return v24;
}

- (id)makeSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(double)a8 ownerTask:(unsigned int)a9 outError:(id *)a10
{
  uint64_t v10;
  id v17;
  Phase *v18;
  id v19;
  id WeakRetained;
  void *v21;
  NSString *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  PHASESoundAsset *v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t StringHashId;
  uint64_t v33[3];
  uint64_t v34;
  uint64_t v35;

  v10 = *(_QWORD *)&a9;
  v35 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = (Phase *)a4;
  v19 = a6;
  if (a10)
    *a10 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v21 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    if (!v18)
    {
      -[PHASEAssetRegistry getUniqueIdentifier](self, "getUniqueIdentifier");
      v18 = (Phase *)objc_claimAutoreleasedReturnValue();
    }
    StringHashId = Phase::GetStringHashId(v18, v22);
    if (a5)
    {
      if (a5 == 1)
      {
        v23 = operator new();
        *(_OWORD *)v23 = 0u;
        *(_OWORD *)(v23 + 16) = 0u;
        *(_OWORD *)(v23 + 32) = 0u;
        *(_OWORD *)(v23 + 48) = 0u;
        *(_DWORD *)(v23 + 36) = -65536;
        *(_QWORD *)v23 = &off_24D5816E8;
        *(_OWORD *)(v23 + 64) = 0u;
        v34 = v23;
        objc_msgSend(v21, "sampleRate");
        if ((Phase::Controller::StreamedSoundAssetInfo::InitWithURL(v23, StringHashId, a7, v17, v19, v24, a8, v10, (uint64_t)a10) & 1) == 0)
        {
          Phase::Controller::StreamedSoundAssetInfo::~StreamedSoundAssetInfo((Phase::Controller::StreamedSoundAssetInfo *)v23);
          v26 = 0x10A1C40D8F733ECLL;
LABEL_15:
          MEMORY[0x2199F9D70](v25, v26);
          goto LABEL_16;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Unhandled Asset Type: %lu"), a5);
        v23 = 0;
      }
    }
    else
    {
      v23 = operator new();
      *(_OWORD *)(v23 + 16) = 0u;
      *(_OWORD *)(v23 + 32) = 0u;
      *(_OWORD *)v23 = 0u;
      *(_DWORD *)(v23 + 36) = -65536;
      *(_QWORD *)v23 = &off_24D580CA0;
      *(_QWORD *)(v23 + 48) = 0;
      v34 = v23;
      objc_msgSend(v21, "sampleRate");
      if (!Phase::Controller::ResidentSoundAssetInfo::InitWithURL(v23, StringHashId, a7, v17, v19, v28, a8, v10, a10))
      {
        v29 = *(void **)(v23 + 48);
        *(_QWORD *)(v23 + 48) = 0;

        v25 = v23;
        v26 = 0x1081C407A1D6331;
        goto LABEL_15;
      }
    }
    v33[0] = v23;
    v27 = -[PHASESoundAsset initWithURL:uid:assetType:normalizationMode:soundAssetInfo:assetRegistry:]([PHASESoundAsset alloc], "initWithURL:uid:assetType:normalizationMode:soundAssetInfo:assetRegistry:", v17, v18, a5, a7, v33, self);
    v30 = v33[0];
    v33[0] = 0;
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
    if (!v27)
      std::terminate();
  }
  else
  {
    if (!a10)
    {
LABEL_16:
      v27 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920802, 0);
    v27 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return v27;
}

- (id)registerSoundAssetWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 referenceGainDBSPL:(double)a7 outError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = *MEMORY[0x24BDAEC58];
  -[PHASEAssetRegistry registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v13, v14, a5, v15, 1, v16, v19, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (PHASESoundAsset)registerSoundAssetAtURL:(NSURL *)url identifier:(NSString *)identifier assetType:(PHASEAssetType)assetType channelLayout:(AVAudioChannelLayout *)channelLayout normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error
{
  NSURL *v14;
  NSString *v15;
  AVAudioChannelLayout *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v14 = url;
  v15 = identifier;
  v16 = channelLayout;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = *MEMORY[0x24BDAEC58];
  -[PHASEAssetRegistry registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v14, v15, assetType, v16, normalizationMode, v17, v20, error);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHASESoundAsset *)v18;
}

- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 ownerTask:(unsigned int)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = a8;
  -[PHASEAssetRegistry registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetAtURL:identifier:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v15, v16, a5, v17, a7, v18, v21, a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)registerSoundAssetAtURL:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 channelLayout:(id)a6 normalizationMode:(int64_t)a7 targetLKFS:(id)a8 ownerTask:(unsigned int)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  Phase *v27;
  NSString *v28;
  BOOL v29;
  id v30;
  id v32;

  v32 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  if (a10)
    *a10 = 0;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v24 = PHASEGetPropertyBounded<double>(v21, v22, v23, -100.0, 0.0);

  -[PHASEAssetRegistry makeSoundAssetWithURL:uid:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:outError:](self, "makeSoundAssetWithURL:uid:assetType:channelLayout:normalizationMode:targetLKFS:ownerTask:outError:", v32, v17, a5, v18, a7, a9, v24, a10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25
    && (objc_msgSend(v25, "identifier"),
        v27 = (Phase *)objc_claimAutoreleasedReturnValue(),
        v29 = -[PHASEAssetRegistry addAssetInternal:assetId:outError:](self, "addAssetInternal:assetId:outError:", v26, Phase::GetStringHashId(v27, v28), a10), v27, v29))
  {
    v30 = v26;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)registerSoundAssetWithData:(id)a3 uid:(id)a4 format:(id)a5 referenceGainDBSPL:(double)a6 outError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEAssetRegistry registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:", v11, v12, v13, 1, v14, *MEMORY[0x24BDAEC58], a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PHASESoundAsset)registerSoundAssetWithData:(NSData *)data identifier:(NSString *)identifier format:(AVAudioFormat *)format normalizationMode:(PHASENormalizationMode)normalizationMode error:(NSError *)error
{
  NSData *v12;
  NSString *v13;
  AVAudioFormat *v14;
  void *v15;
  void *v16;

  v12 = data;
  v13 = identifier;
  v14 = format;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEAssetRegistry registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:", v12, v13, v14, normalizationMode, v15, *MEMORY[0x24BDAEC58], error);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHASESoundAsset *)v16;
}

- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 ownerTask:(unsigned int)a7 error:(id *)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEAssetRegistry registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithData:identifier:format:normalizationMode:targetLKFS:ownerTask:error:", v14, v15, v16, a6, v17, v9, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)registerSoundAssetWithData:(id)a3 identifier:(id)a4 format:(id)a5 normalizationMode:(int64_t)a6 targetLKFS:(id)a7 ownerTask:(unsigned int)a8 error:(id *)a9
{
  uint64_t v9;
  Phase *v16;
  id v17;
  id v18;
  PHASESoundAsset *v19;
  id WeakRetained;
  void *v21;
  NSString *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  PHASESoundAsset *v30;
  uint64_t v31;
  void *v32;
  uint64_t StringHashId;
  id v35;
  _QWORD v36[9];

  v9 = *(_QWORD *)&a8;
  v36[8] = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v16 = (Phase *)a4;
  v17 = a5;
  v18 = a7;
  if (!a9)
  {
    if (!v17)
    {
      v19 = 0;
      goto LABEL_25;
    }
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    v21 = WeakRetained;
    if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
    {
      if (!v16)
      {
        -[PHASEAssetRegistry getUniqueIdentifier](self, "getUniqueIdentifier");
        v16 = (Phase *)objc_claimAutoreleasedReturnValue();
      }
      StringHashId = Phase::GetStringHashId(v16, v22);
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v27 = PHASEGetPropertyBounded<double>(v24, v25, v26, -100.0, 0.0);

      v28 = operator new();
      *(_OWORD *)(v28 + 16) = 0u;
      *(_OWORD *)(v28 + 32) = 0u;
      *(_OWORD *)v28 = 0u;
      *(_DWORD *)(v28 + 36) = -65536;
      *(_QWORD *)v28 = &off_24D580CA0;
      *(_QWORD *)(v28 + 48) = 0;
      v36[3] = v28;
      objc_msgSend(v21, "sampleRate");
      if ((Phase::Controller::ResidentSoundAssetInfo::InitWithData(v28, StringHashId, a6, v35, v17, v29, v27, v9, a9) & 1) != 0)
      {
        v36[0] = v28;
        v30 = -[PHASESoundAsset initWithData:uid:normalizationMode:soundAssetInfo:assetRegistry:]([PHASESoundAsset alloc], "initWithData:uid:normalizationMode:soundAssetInfo:assetRegistry:", v35, v16, a6, v36, self);
        v31 = v36[0];
        v36[0] = 0;
        if (v31)
          (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        if (v30)
        {
          if (-[PHASEAssetRegistry addAssetInternal:assetId:outError:](self, "addAssetInternal:assetId:outError:", v30, StringHashId, a9))
          {
            v19 = v30;
LABEL_23:

            goto LABEL_24;
          }
        }
        else if (a9)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, 0);
          v19 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        v19 = 0;
        goto LABEL_23;
      }
      v32 = *(void **)(v28 + 48);
      *(_QWORD *)(v28 + 48) = 0;

      MEMORY[0x2199F9D70](v28, 0x1081C407A1D6331);
    }
    else if (a9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920802, 0);
      v19 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    v19 = 0;
    goto LABEL_24;
  }
  *a9 = 0;
  if (v17)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920803, 0);
  v19 = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v19;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v10 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = *MEMORY[0x24BDAEC58];
  -[PHASEAssetRegistry registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v14, v15, a5, v10, v16, 0, v17, v20, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 uid:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 referenceGainDBSPL:(double)a8 outError:(id *)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v11 = *(_QWORD *)&a6;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = *MEMORY[0x24BDAEC58];
  -[PHASEAssetRegistry registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v15, v16, a5, v11, v17, 1, v18, v21, a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 error:(id *)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v11 = *(_QWORD *)&a6;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = *MEMORY[0x24BDAEC58];
  -[PHASEAssetRegistry registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v15, v16, a5, v11, v17, a8, v18, v21, a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 ownerTask:(unsigned int)a9 error:(id *)a10
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v12 = *(_QWORD *)&a6;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = a9;
  -[PHASEAssetRegistry registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:](self, "registerSoundAssetWithAudioFileData:identifier:assetType:fileTypeHint:channelLayout:normalizationMode:targetLKFS:ownerTask:error:", v16, v17, a5, v12, v18, a8, v19, v22, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)registerSoundAssetWithAudioFileData:(id)a3 identifier:(id)a4 assetType:(int64_t)a5 fileTypeHint:(unsigned int)a6 channelLayout:(id)a7 normalizationMode:(int64_t)a8 targetLKFS:(id)a9 ownerTask:(unsigned int)a10 error:(id *)a11
{
  Phase *v18;
  id WeakRetained;
  void *v20;
  NSString *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  PHASESoundAsset *v31;
  double v32;
  void *v33;
  PHASESoundAsset *v34;
  uint64_t v35;
  uint64_t StringHashId;
  id v38;
  id v39;
  id v40;
  uint64_t v41[3];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v18 = (Phase *)a4;
  v38 = a7;
  v39 = a9;
  if (a11)
    *a11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v20 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    if (!v18)
    {
      -[PHASEAssetRegistry getUniqueIdentifier](self, "getUniqueIdentifier");
      v18 = (Phase *)objc_claimAutoreleasedReturnValue();
    }
    StringHashId = Phase::GetStringHashId(v18, v21);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "doubleValue");
    v26 = PHASEGetPropertyBounded<double>(v23, v24, v25, -100.0, 0.0);

    if (a5)
    {
      if (a5 == 1)
      {
        v27 = operator new();
        *(_OWORD *)v27 = 0u;
        *(_OWORD *)(v27 + 16) = 0u;
        *(_OWORD *)(v27 + 32) = 0u;
        *(_OWORD *)(v27 + 48) = 0u;
        *(_DWORD *)(v27 + 36) = -65536;
        *(_QWORD *)v27 = &off_24D5816E8;
        *(_OWORD *)(v27 + 64) = 0u;
        v42 = v27;
        objc_msgSend(v20, "sampleRate");
        if ((Phase::Controller::StreamedSoundAssetInfo::InitWithData(v27, StringHashId, a8, v40, a6, v38, v28, v26, a10, a11) & 1) == 0)
        {
          Phase::Controller::StreamedSoundAssetInfo::~StreamedSoundAssetInfo((Phase::Controller::StreamedSoundAssetInfo *)v27);
          v30 = 0x10A1C40D8F733ECLL;
LABEL_15:
          MEMORY[0x2199F9D70](v29, v30);
          goto LABEL_16;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Unhandled Asset Type: %lu"), a5);
        v27 = 0;
      }
    }
    else
    {
      v27 = operator new();
      *(_OWORD *)(v27 + 16) = 0u;
      *(_OWORD *)(v27 + 32) = 0u;
      *(_OWORD *)v27 = 0u;
      *(_DWORD *)(v27 + 36) = -65536;
      *(_QWORD *)v27 = &off_24D580CA0;
      *(_QWORD *)(v27 + 48) = 0;
      v42 = v27;
      objc_msgSend(v20, "sampleRate");
      if ((Phase::Controller::ResidentSoundAssetInfo::InitWithData(v27, StringHashId, a8, v40, a6, v38, v32, v26, a10, (uint64_t)a11) & 1) == 0)
      {
        v33 = *(void **)(v27 + 48);
        *(_QWORD *)(v27 + 48) = 0;

        v29 = v27;
        v30 = 0x1081C407A1D6331;
        goto LABEL_15;
      }
    }
    v41[0] = v27;
    v34 = -[PHASESoundAsset initWithData:uid:normalizationMode:soundAssetInfo:assetRegistry:]([PHASESoundAsset alloc], "initWithData:uid:normalizationMode:soundAssetInfo:assetRegistry:", v40, v18, a8, v41, self);
    v35 = v41[0];
    v41[0] = 0;
    if (v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
    if (v34)
    {
      if (-[PHASEAssetRegistry addAssetInternal:assetId:outError:](self, "addAssetInternal:assetId:outError:", v34, StringHashId, a11))
      {
        v31 = v34;
LABEL_26:

        goto LABEL_27;
      }
    }
    else if (a11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, 0);
      v31 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    v31 = 0;
    goto LABEL_26;
  }
  if (!a11)
  {
LABEL_16:
    v31 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920802, 0);
  v31 = 0;
  *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v31;
}

- (id)makeMetaParameterFromDefinition:(id)a3
{
  id v4;
  id v5;
  PHASENumberMetaParameter *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  PHASEStringMetaParameter *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [PHASENumberMetaParameter alloc];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v5, "minimum");
    v12 = v11;
    objc_msgSend(v5, "maximum");
    v14 = -[PHASENumberMetaParameter initWithUID:value:rangeMin:rangeMax:delegate:](v6, "initWithUID:value:rangeMin:rangeMax:delegate:", v7, self, v10, v12, v13);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v15 = v4;
    v16 = [PHASEStringMetaParameter alloc];
    objc_msgSend(v15, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PHASEStringMetaParameter initWithUID:value:delegate:](v16, "initWithUID:value:delegate:", v7, v8, self);
  }
  v17 = (void *)v14;

LABEL_7:
  return v17;
}

- (PHASEGlobalMetaParameterAsset)registerGlobalMetaParameter:(PHASEMetaParameterDefinition *)metaParameterDefinition error:(NSError *)error
{
  PHASEMetaParameterDefinition *v6;
  PHASEMetaParameterDefinition *v7;
  Phase *v8;
  NSString *v9;
  uint64_t StringHashId;
  PHASEAssetRegistry *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PHASEAssetRegistry *v20;
  NSMutableDictionary *metaParameterDictionary;
  void *v22;
  PHASEGlobalMetaParameterAsset *v23;
  void *v24;
  PHASEGlobalMetaParameterAsset *v25;
  void *v26;
  PHASEGlobalMetaParameterAsset *v27;
  uint64_t v29;
  void *v30;
  const void *v31;
  _OWORD v32[2];
  int v33;

  v6 = metaParameterDefinition;
  v7 = v6;
  if (error)
    *error = 0;
  -[PHASEDefinition identifier](v6, "identifier");
  v8 = (Phase *)objc_claimAutoreleasedReturnValue();
  StringHashId = Phase::GetStringHashId(v8, v9);

  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](v11->_metaParameterDictionary, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHASEActionTreeBuilder getParamArray:globalParamUIDs:outError:](PHASEActionTreeBuilder, "getParamArray:globalParamUIDs:outError:", v12, v13, error);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (v14)
  {
    memset(v32, 0, sizeof(v32));
    v33 = 1065353216;
    Phase::MakeGlobalMetaParameters(v14, (uint64_t)v32, error, (uint64_t *)&v31);
    v15 = v31;
    if (!v31)
    {
      v27 = 0;
LABEL_18:
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v32);
      goto LABEL_19;
    }
    v29 = (uint64_t)v31;
    v16 = (void *)operator new();
    memcpy(v16, v15, 0x1D0uLL);
    -[PHASEAssetRegistry makeMetaParameterFromDefinition:](v11, "makeMetaParameterFromDefinition:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = StringHashId;
    if (v17)
    {
      objc_msgSend(v17, "setDelegate:", v11);
      v20 = v11;
      objc_sync_enter(v20);
      metaParameterDictionary = v11->_metaParameterDictionary;
      objc_msgSend(v18, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](metaParameterDictionary, "setObject:forKey:", v18, v22);

      objc_sync_exit(v20);
    }
    v23 = [PHASEGlobalMetaParameterAsset alloc];
    -[PHASEDefinition identifier](v7, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v16;
    v25 = -[PHASEGlobalMetaParameterAsset initWithUID:ownedMetaParameter:assetRegistry:](v23, "initWithUID:ownedMetaParameter:assetRegistry:", v24, &v30, v11);
    v26 = v30;
    v30 = 0;
    if (v26)
      MEMORY[0x2199F9D70](v26, 0x1000C40D9B47DDELL);

    if (v25)
    {
      if (-[PHASEAssetRegistry addAssetInternal:assetId:stringPoolBuilder:outError:](v11, "addAssetInternal:assetId:stringPoolBuilder:outError:", v25, v19, v32, error))
      {
        v27 = v25;
LABEL_17:

        MEMORY[0x2199F9D4C](v29, 0x1000C80D9B47DDELL);
        goto LABEL_18;
      }
    }
    else if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, 0);
      v27 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v27 = 0;
    goto LABEL_17;
  }
  v27 = 0;
LABEL_19:

  return v27;
}

- (id)registerActionTreeWithRootNode:(id)a3 uid:(id)a4 outError:(id *)a5
{
  -[PHASEAssetRegistry registerSoundEventAssetWithRootNode:uid:error:](self, "registerSoundEventAssetWithRootNode:uid:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)registerSoundEventAssetWithRootNode:(id)a3 uid:(id)a4 error:(id *)a5
{
  -[PHASEAssetRegistry registerSoundEventAssetWithRootNode:identifier:error:](self, "registerSoundEventAssetWithRootNode:identifier:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PHASESoundEventNodeAsset)registerSoundEventAssetWithRootNode:(PHASESoundEventNodeDefinition *)rootNode identifier:(NSString *)identifier error:(NSError *)error
{
  PHASESoundEventNodeDefinition *v8;
  NSString *v9;
  id WeakRetained;
  void *v11;
  NSString *v12;
  uint64_t StringHashId;
  PHASEActionTreeBuilder *v14;
  PHASEAssetRegistry *v15;
  void *v16;
  void *v17;
  void *v18;
  ActionTreeProgrammaticDetails *v19;
  uint64_t v20;
  Phase::ActionTree *v21;
  PHASESoundEventNodeAsset *v22;
  PHASESoundEventNodeAsset *v23;
  Phase::ActionTree *v24;
  PHASESoundEventNodeAsset *v25;
  PHASEActionTreeBuilder *v27;
  Phase::ActionTree *v28;
  Phase::ActionTree *v29;
  _OWORD v30[2];
  int v31;

  v8 = rootNode;
  v9 = identifier;
  if (error)
    *error = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    if (!v9)
    {
      -[PHASEAssetRegistry getUniqueIdentifier](self, "getUniqueIdentifier");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    StringHashId = Phase::GetStringHashId((Phase *)v9, v12);
    v14 = objc_alloc_init(PHASEActionTreeBuilder);
    v15 = self;
    objc_sync_enter(v15);
    v27 = v14;
    -[NSMutableDictionary allKeys](v15->_metaParameterDictionary, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v15);

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEActionTreeBuilder createParseableDictionaryWithUID:rootNodes:globalParamUIDs:assetRegistry:outError:](v14, "createParseableDictionaryWithUID:rootNodes:globalParamUIDs:assetRegistry:outError:", v9, v17, v16, v15, error);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v25 = 0;
LABEL_26:

      goto LABEL_27;
    }
    memset(v30, 0, sizeof(v30));
    v31 = 1065353216;
    v19 = objc_alloc_init(ActionTreeProgrammaticDetails);
    v20 = StringHashId;
    Phase::MakeActionTree(v18, v19, error, (uint64_t *)&v29);
    v21 = v29;
    if (!v29)
    {
      v25 = 0;
LABEL_25:

      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v30);
      goto LABEL_26;
    }
    v22 = [PHASESoundEventNodeAsset alloc];
    v28 = v21;
    v29 = 0;
    v23 = -[PHASESoundEventNodeAsset initWithUID:ownedActionTree:assetRegistry:details:](v22, "initWithUID:ownedActionTree:assetRegistry:details:", v9, &v28, v15, v19);
    v24 = v28;
    v28 = 0;
    if (v24)
    {
      Phase::ActionTree::~ActionTree(v24);
      MEMORY[0x2199F9D70]();
    }
    if (v23)
    {
      if (-[PHASEAssetRegistry addAssetInternal:assetId:stringPoolBuilder:outError:](v15, "addAssetInternal:assetId:stringPoolBuilder:outError:", v23, v20, v30, error))
      {
        v25 = v23;
LABEL_24:

        v29 = 0;
        goto LABEL_25;
      }
      if (error)
      {
LABEL_22:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, 0);
        v25 = 0;
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else if (error)
    {
      goto LABEL_22;
    }
    v25 = 0;
    goto LABEL_24;
  }
  if (error)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920802, 0);
    v25 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_27:

  return v25;
}

- (id)getUniqueIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMetaParameter:(id)a3 value:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned int v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  _BYTE *v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  id v20;

  v20 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v8 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    v9 = Phase::Controller::TaskManager::GetService<Phase::GlobalMetaParameterManager>((Phase::Logger *)(objc_msgSend(v8, "implementation") + 48), 6);
    v10 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    if (v10 && (v11 = *v10, *v10))
    {
      v12 = 0xCBF29CE484222325;
      v13 = v10 + 1;
      do
      {
        v12 = 0x100000001B3 * (v12 ^ v11);
        v14 = *v13++;
        v11 = v14;
      }
      while (v14);
    }
    else
    {
      v12 = 0;
    }
    v15 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    if (v15 && (v16 = *v15, *v15))
    {
      v17 = 0xCBF29CE484222325;
      v18 = v15 + 1;
      do
      {
        v17 = 0x100000001B3 * (v17 ^ v16);
        v19 = *v18++;
        v16 = v19;
      }
      while (v19);
    }
    else
    {
      v17 = 0;
    }
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::GlobalMetaParameterManager,BOOL,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v9, v17, 2, v12, 0.0);
  }

}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  id WeakRetained;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned int v15;
  id v16;

  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v9 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    v10 = Phase::Controller::TaskManager::GetService<Phase::GlobalMetaParameterManager>((Phase::Logger *)(objc_msgSend(v9, "implementation") + 48), 6);
    v11 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    if (v11 && (v12 = *v11, *v11))
    {
      v13 = v11 + 1;
      v14 = 0xCBF29CE484222325;
      do
      {
        v14 = 0x100000001B3 * (v14 ^ v12);
        v15 = *v13++;
        v12 = v15;
      }
      while (v15);
    }
    else
    {
      v14 = 0;
    }
    Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::GlobalMetaParameterManager,BOOL,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v10, v14, 1, *(uint64_t *)&a4, a5);
  }

}

- (id)getAssetForUID:(id)a3
{
  -[PHASEAssetRegistry assetForIdentifier:](self, "assetForIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PHASEAsset)assetForIdentifier:(NSString *)identifier
{
  NSString *v4;
  PHASEAssetRegistry *v5;
  NSString *v6;
  unint64_t StringHashId;
  _QWORD *v8;
  id v9;

  v4 = identifier;
  v5 = self;
  objc_sync_enter(v5);
  StringHashId = Phase::GetStringHashId((Phase *)v4, v6);
  v8 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v5->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
  if (v8)
    v9 = (id)v8[3];
  else
    v9 = 0;
  objc_sync_exit(v5);

  return (PHASEAsset *)v9;
}

- (void)unregisterAssetWithIdentifier:(NSString *)identifier completion:(void *)handler
{
  NSString *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  Phase::Logger *InstancePtr;
  NSObject *v20;
  std::runtime_error *exception;
  BOOL v22;
  unint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = identifier;
  v7 = handler;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v9 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    -[PHASEAssetRegistry assetForIdentifier:](self, "assetForIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (atomic_load((unint64_t *)(objc_msgSend(v9, "implementation") + 24)))
      {
        v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::AssetUnloader>((Phase::Logger *)(objc_msgSend(v9, "implementation") + 48), 12);
        v13 = v10;
        v14 = _Block_copy(v7);
        v15 = **(_QWORD **)(v12 + 8);
        v23 = 0;
        v22 = 1;
        v16 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v15, 32, &v23, &v22);
        if (!v16)
        {
          InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
          Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
          v20 = objc_retainAutorelease(**(id **)(v15 + 48));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "CommandQueue.hpp";
            v26 = 1024;
            v27 = 100;
            _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; b"
              "uffer is full, unable to grow.\",
              buf,
              0x12u);
          }
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        }
        if (v22)
        {
          v17 = objc_retainAutorelease(**(id **)(v15 + 48));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v25 = "CommandQueue.hpp";
            v26 = 1024;
            v27 = 89;
            v28 = 2048;
            v29 = v23;
            v30 = 2048;
            v31 = 32;
            _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
          }
        }
        *v16 = &off_24D57F1F0;
        v16[1] = v12;
        v16[2] = v13;
        v16[3] = v14;
        Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v15, 32);
        atomic_store(0, (unsigned __int8 *)(v15 + 40));

        goto LABEL_15;
      }
      -[PHASEAssetRegistry removeAssetInternal:](self, "removeAssetInternal:", v10);
      if (v7)
        goto LABEL_14;
    }
    else if (v7)
    {
      v18 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "PHASEAssetRegistry.mm";
        v26 = 1024;
        v27 = 1601;
        _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Bad parameters when unregistering asset with identifier, aseet is nil.", buf, 0x12u);
      }
LABEL_14:
      (*((void (**)(void *, BOOL))v7 + 2))(v7, v10 != 0);
    }
LABEL_15:

  }
}

- (void)unregisterAssetWithUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PHASEAssetRegistry_unregisterAssetWithUID_completionHandler___block_invoke;
  aBlock[3] = &unk_24D57F198;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  -[PHASEAssetRegistry unregisterAssetWithIdentifier:completion:](self, "unregisterAssetWithIdentifier:completion:", v8, v9);

}

uint64_t __63__PHASEAssetRegistry_unregisterAssetWithUID_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)unregisterAssetWithUID:(id)a3
{
  -[PHASEAssetRegistry unregisterAssetWithIdentifier:completion:](self, "unregisterAssetWithIdentifier:completion:", a3, 0);
}

- (id)getMixerInformationForActionTreeWithUID:(id)a3
{
  -[PHASEAssetRegistry mixerInformationForActionTreeWithIdentifier:](self, "mixerInformationForActionTreeWithIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mixerInformationForActionTreeWithIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  PHASEMixerInformation *v13;
  Phase *v15;

  v15 = (Phase *)a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = -[PHASEAssetRegistry getActionTree:](self, "getActionTree:", Phase::GetStringHashId(v15, v5));
  v7 = v6;
  if (v6 && v6[24])
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *((_QWORD *)v7 + 13);
      v11 = -[PHASEAssetRegistry getStringEmpty:](self, "getStringEmpty:", *(_QWORD *)(v10 + v8));
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(PHASEMixerInformation);
        -[PHASEMixerInformation setMixerType:](v13, "setMixerType:", *(_QWORD *)(v10 + v8 + 8));
        -[PHASEMixerInformation setIdentifier:](v13, "setIdentifier:", v12);
        objc_msgSend(v4, "addObject:", v13);

      }
      ++v9;
      v8 += 5944;
    }
    while (v9 < v7[24]);
  }

  return v4;
}

- (const)getString:(unint64_t)a3
{
  const char *result;

  result = -[PHASEAssetRegistry getStringEmpty:](self, "getStringEmpty:", a3);
  if (!result)
    return "<invalid>";
  return result;
}

- (const)getStringEmpty:(unint64_t)a3
{
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *>>> *p_p1;
  const char *result;

  p_p1 = &self->_stringPools.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::unique_ptr<Phase::StringPool>>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    result = (const char *)Phase::StringPool::GetString((Phase::StringPool *)p_p1[3].__value_.__next_, a3);
    if (result)
      return result;
  }
  return 0;
}

- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 outError:(id *)a5
{
  char *v5;
  _QWORD *v6;
  void **v7;
  unsigned __int8 *v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *v15;
  unint64_t v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8x8_t v24;
  void *v25;
  void *v26;
  void **v27;
  unint64_t v28;
  BOOL v29;
  id v31;
  id v34;
  __int128 v36;
  __int128 v37;
  float v38;
  _QWORD *v39;
  __int128 *v40;
  char v41;

  v34 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 1.0;
  objc_msgSend(v34, "identifier");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (char *)objc_msgSend(v31, "UTF8String");
  v6 = operator new(0x28uLL);
  v39 = v6;
  v40 = &v37;
  v41 = 0;
  *v6 = 0;
  v6[1] = 0;
  std::string::basic_string[abi:ne180100]<0>(v6 + 2, v5);
  v41 = 1;
  v6[1] = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v37 + 8, (uint64_t)(v6 + 2));
  v7 = (void **)v39;
  v8 = (unsigned __int8 *)(v39 + 2);
  v9 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v37 + 8, (uint64_t)(v39 + 2));
  v7[1] = (void *)v9;
  if (!*((_QWORD *)&v36 + 1))
    goto LABEL_17;
  v10 = v9;
  v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v36 + 8));
  v11.i16[0] = vaddlv_u8(v11);
  v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    v13 = v9;
    if (*((_QWORD *)&v36 + 1) <= v9)
      v13 = v9 % *((_QWORD *)&v36 + 1);
  }
  else
  {
    v13 = (*((_QWORD *)&v36 + 1) - 1) & v9;
  }
  v14 = *(unsigned __int8 ***)(v36 + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_17:
    v17 = (float)(unint64_t)(*((_QWORD *)&v37 + 1) + 1);
    if (!*((_QWORD *)&v36 + 1) || (float)(v38 * (float)*((unint64_t *)&v36 + 1)) < v17)
    {
      v18 = 1;
      if (*((_QWORD *)&v36 + 1) >= 3uLL)
        v18 = (*((_QWORD *)&v36 + 1) & (*((_QWORD *)&v36 + 1) - 1)) != 0;
      v19 = v18 | (2 * *((_QWORD *)&v36 + 1));
      v20 = vcvtps_u32_f32(v17 / v38);
      if (v19 <= v20)
        v21 = v20;
      else
        v21 = v19;
      std::__hash_table<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::__unordered_map_hasher<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::hash<Phase::SpatialCategory>,std::equal_to<Phase::SpatialCategory>,true>,std::__unordered_map_equal<Phase::SpatialCategory,std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>,std::equal_to<Phase::SpatialCategory>,std::hash<Phase::SpatialCategory>,true>,std::allocator<std::__hash_value_type<Phase::SpatialCategory,Phase::Controller::SpatialCategoryParameters>>>::__rehash<true>((uint64_t)&v36, v21);
    }
    v22 = *((_QWORD *)&v36 + 1);
    v23 = (unint64_t)v7[1];
    v24 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v36 + 8));
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      v25 = v34;
      v26 = v31;
      if (v23 >= *((_QWORD *)&v36 + 1))
        v23 %= *((_QWORD *)&v36 + 1);
    }
    else
    {
      v23 &= *((_QWORD *)&v36 + 1) - 1;
      v25 = v34;
      v26 = v31;
    }
    v27 = *(void ***)(v36 + 8 * v23);
    if (v27)
    {
      *v7 = *v27;
    }
    else
    {
      *v7 = (void *)v37;
      *(_QWORD *)&v37 = v7;
      *(_QWORD *)(v36 + 8 * v23) = &v37;
      if (!*v7)
      {
LABEL_38:
        ++*((_QWORD *)&v37 + 1);
        goto LABEL_39;
      }
      v28 = *((_QWORD *)*v7 + 1);
      if (v24.u32[0] > 1uLL)
      {
        if (v28 >= v22)
          v28 %= v22;
      }
      else
      {
        v28 &= v22 - 1;
      }
      v27 = (void **)(v36 + 8 * v28);
    }
    *v27 = v7;
    goto LABEL_38;
  }
  while (1)
  {
    v16 = *((_QWORD *)v15 + 1);
    if (v16 == v10)
      break;
    if (v12 > 1)
    {
      if (v16 >= *((_QWORD *)&v36 + 1))
        v16 %= *((_QWORD *)&v36 + 1);
    }
    else
    {
      v16 &= *((_QWORD *)&v36 + 1) - 1;
    }
    if (v16 != v13)
      goto LABEL_17;
LABEL_16:
    v15 = *(unsigned __int8 **)v15;
    if (!v15)
      goto LABEL_17;
  }
  if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&v38, v15 + 16, v8) & 1) == 0)
    goto LABEL_16;
  v39 = 0;
  v25 = v34;
  v26 = v31;
  if (v7)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]((uint64_t)&v40, v7);
LABEL_39:

  v29 = -[PHASEAssetRegistry addAssetInternal:assetId:stringPoolBuilder:outError:](self, "addAssetInternal:assetId:stringPoolBuilder:outError:", v25, a4, &v36, a5);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v36);

  return v29;
}

- (void)logAddAsset:(id)a3
{
  Phase::Logger *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (Phase::Logger *)a3;
  v5 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v4));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[Phase::Logger identifier](v4, "identifier");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "UTF8String");
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = 136316418;
    v11 = "PHASEAssetRegistry.mm";
    v12 = 1024;
    v13 = 1731;
    v14 = 2080;
    v15 = v7;
    v16 = 2080;
    v17 = objc_msgSend(v9, "UTF8String");
    v18 = 2048;
    v19 = (float)((float)(unint64_t)-[Phase::Logger sizeInBytes](v4, "sizeInBytes") / 1000000.0);
    v20 = 2048;
    v21 = (float)((float)-[PHASEAssetRegistry sizeInBytes](self, "sizeInBytes") / 1000000.0);
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Added Asset with name: %s, type: %s, size: %1.3f MB (total size: %1.3f MB)", (uint8_t *)&v10, 0x3Au);

  }
}

- (void)logRemoveAsset:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  Phase::Logger *v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (Phase::Logger *)objc_msgSend(v4, "sizeInBytes");
  v8 = objc_retainAutorelease(**(id **)Phase::Logger::GetInstancePtr(v7));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = 136316418;
    v11 = "PHASEAssetRegistry.mm";
    v12 = 1024;
    v13 = 1743;
    v14 = 2080;
    v15 = objc_msgSend(v9, "UTF8String");
    v16 = 2080;
    v17 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v18 = 2048;
    v19 = (float)((float)(unint64_t)v7 / 1000000.0);
    v20 = 2048;
    v21 = (float)((float)-[PHASEAssetRegistry sizeInBytes](self, "sizeInBytes") / 1000000.0);
    _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed Asset with name: %s, type: %s, size: %1.3f MB (total size: %1.3f MB)", (uint8_t *)&v10, 0x3Au);

  }
}

- (BOOL)addAssetInternal:(id)a3 assetId:(unint64_t)a4 stringPoolBuilder:(void *)a5 outError:(id *)a6
{
  unint64_t v6;
  id v11;
  PHASEAssetRegistry *v12;
  char v13;
  uint64_t v14;
  unordered_map<unsigned long long, PHASEAsset *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PHASEAsset *>>> *p_assetLookup;
  id v16;
  id v17;
  unint64_t value;
  uint8x8_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  float v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  void **v30;
  void **v31;
  unint64_t v32;
  BOOL v33;
  unint64_t *v34;
  unint64_t v36;
  unint64_t *v37;
  unint64_t *v38;

  v11 = a3;
  if (a6)
    *a6 = 0;
  Phase::BuildStringPool((uint64_t)a5, &v38);
  v12 = self;
  objc_sync_enter(v12);
  v37 = v38;
  v38 = 0;
  v36 = a4;
  v13 = std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::unique_ptr<Phase::StringPool>>>((uint64_t *)&v12->_stringPools, a4, (uint64_t *)&v36);
  v14 = (uint64_t)v37;
  v37 = 0;
  if (v14)
    std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&v37, v14);
  if (a6 && (v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  p_assetLookup = &v12->_assetLookup;
  v16 = v11;
  v17 = v16;
  value = v12->_assetLookup.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_25;
  v19 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v19.i16[0] = vaddlv_u8(v19);
  if (v19.u32[0] > 1uLL)
  {
    v6 = a4;
    if (value <= a4)
      v6 = a4 % value;
  }
  else
  {
    v6 = (value - 1) & a4;
  }
  v20 = p_assetLookup->__table_.__bucket_list_.__ptr_.__value_[v6];
  if (!v20 || (v21 = (_QWORD *)*v20) == 0)
  {
LABEL_25:
    v23 = operator new(0x20uLL);
    *v23 = 0;
    v23[1] = a4;
    v23[2] = a4;
    v23[3] = v17;
    v24 = (float)(v12->_assetLookup.__table_.__p2_.__value_ + 1);
    v25 = v12->_assetLookup.__table_.__p3_.__value_;
    if (!value || (float)(v25 * (float)value) < v24)
    {
      v26 = 1;
      if (value >= 3)
        v26 = (value & (value - 1)) != 0;
      v27 = v26 | (2 * value);
      v28 = vcvtps_u32_f32(v24 / v25);
      if (v27 <= v28)
        v29 = v28;
      else
        v29 = v27;
      std::__hash_table<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,Phase::Controller::OptionalProperties::Property>>>::__rehash<true>((uint64_t)&v12->_assetLookup, v29);
      value = v12->_assetLookup.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if ((value & (value - 1)) != 0)
      {
        if (value <= a4)
          v6 = a4 % value;
        else
          v6 = a4;
      }
      else
      {
        v6 = (value - 1) & a4;
      }
    }
    v30 = p_assetLookup->__table_.__bucket_list_.__ptr_.__value_;
    v31 = (void **)p_assetLookup->__table_.__bucket_list_.__ptr_.__value_[v6];
    if (v31)
    {
      *v23 = *v31;
    }
    else
    {
      *v23 = v12->_assetLookup.__table_.__p1_.__value_.__next_;
      v12->_assetLookup.__table_.__p1_.__value_.__next_ = v23;
      v30[v6] = &v12->_assetLookup.__table_.__p1_;
      if (!*v23)
      {
LABEL_46:
        ++v12->_assetLookup.__table_.__p2_.__value_;
        -[PHASEAssetRegistry logAddAsset:](v12, "logAddAsset:", v17);
        v33 = 1;
        goto LABEL_47;
      }
      v32 = *(_QWORD *)(*v23 + 8);
      if ((value & (value - 1)) != 0)
      {
        if (v32 >= value)
          v32 %= value;
      }
      else
      {
        v32 &= value - 1;
      }
      v31 = &p_assetLookup->__table_.__bucket_list_.__ptr_.__value_[v32];
    }
    *v31 = v23;
    goto LABEL_46;
  }
  while (1)
  {
    v22 = v21[1];
    if (v22 == a4)
      break;
    if (v19.u32[0] > 1uLL)
    {
      if (v22 >= value)
        v22 %= value;
    }
    else
    {
      v22 &= value - 1;
    }
    if (v22 != v6)
      goto LABEL_25;
LABEL_24:
    v21 = (_QWORD *)*v21;
    if (!v21)
      goto LABEL_25;
  }
  if (v21[2] != a4)
    goto LABEL_24;

  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v12->_stringPools.__table_.__bucket_list_.__ptr_.__value_, a4);
  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920804, 0);
    v33 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_47:
  objc_sync_exit(v12);

  v34 = v38;
  v38 = 0;
  if (v34)
    std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)&v38, (uint64_t)v34);

  return v33;
}

- (BOOL)removeAssetInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Phase::Logger *v7;
  PHASEAssetRegistry *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t next;
  void *v13;
  void *v14;
  id v15;
  NSMutableDictionary *metaParameterDictionary;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  Phase *v21;
  NSString *v22;
  unint64_t v23;
  uint64_t *v24;
  Phase *v25;
  NSString *v26;
  unint64_t StringHashId;
  Phase *v28;
  NSString *v29;
  unint64_t v30;
  uint64_t *v31;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "owningDataBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v8 = (PHASEAssetRegistry *)objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "owningDataBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 136315906;
        v34 = "PHASEAssetRegistry.mm";
        v35 = 1024;
        v36 = 1823;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_2164CC000, &v8->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Trying to remove asset %@ that is owned by a data bundle %@.  Remove the data bundle to remove the asset.  Ignoring.", (uint8_t *)&v33, 0x26u);

      }
      goto LABEL_5;
    }
    v8 = self;
    objc_sync_enter(v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v5, "getDataBundle"))
        std::terminate();
      next = (uint64_t)v8->_assetLookup.__table_.__p1_.__value_.__next_;
      while (next)
      {
        objc_msgSend(*(id *)(next + 24), "owningDataBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
        {
          v15 = *(id *)(next + 24);
          next = std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)next);
          -[PHASEAssetRegistry logRemoveAsset:](v8, "logRemoveAsset:", v15);

        }
        else
        {
          next = *(_QWORD *)next;
        }
      }
      objc_msgSend(v5, "identifier");
      v25 = (Phase *)objc_claimAutoreleasedReturnValue();
      StringHashId = Phase::GetStringHashId(v25, v26);

      std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::__erase_unique<unsigned long long>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
      std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, StringHashId);
      -[PHASEAssetRegistry logRemoveAsset:](v8, "logRemoveAsset:", v5);
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      metaParameterDictionary = v8->_metaParameterDictionary;
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](metaParameterDictionary, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "setDelegate:", 0);
        v19 = v8->_metaParameterDictionary;
        objc_msgSend(v5, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

      }
      objc_msgSend(v5, "identifier");
      v21 = (Phase *)objc_claimAutoreleasedReturnValue();
      v23 = Phase::GetStringHashId(v21, v22);

      v24 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v23);
      if (v24)
      {
        std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v24);
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, v23);
        -[PHASEAssetRegistry logRemoveAsset:](v8, "logRemoveAsset:", v5);

LABEL_22:
        objc_sync_exit(v8);
        v11 = 1;
        goto LABEL_23;
      }

    }
    else
    {
      objc_msgSend(v5, "identifier");
      v28 = (Phase *)objc_claimAutoreleasedReturnValue();
      v30 = Phase::GetStringHashId(v28, v29);

      v31 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v30);
      if (v31)
      {
        std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(&v8->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, v31);
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<Phase::StringPool>>>>::__erase_unique<unsigned long long>(&v8->_stringPools.__table_.__bucket_list_.__ptr_.__value_, v30);
        -[PHASEAssetRegistry logRemoveAsset:](v8, "logRemoveAsset:", v5);
        goto LABEL_22;
      }
    }
    objc_sync_exit(v8);
LABEL_5:
    v11 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

- (void)removeAll
{
  uint64_t *next;
  unordered_map<unsigned long long, PHASEAsset *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, PHASEAsset *>>> *p_assetLookup;
  uint64_t *v5;

  next = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_assetLookup = &self->_assetLookup;
    do
    {
      while (1)
      {
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          next = (uint64_t *)*next;
          if (!next)
            goto LABEL_10;
        }
        if (!-[PHASEAssetRegistry removeAssetInternal:](self, "removeAssetInternal:", next[3]))
          break;
        next = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
        if (!next)
          goto LABEL_10;
      }
      next = (uint64_t *)std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(p_assetLookup, next);
    }
    while (next);
LABEL_10:
    while (1)
    {
      v5 = (uint64_t *)self->_assetLookup.__table_.__p1_.__value_.__next_;
      if (!v5)
        break;
      while (!-[PHASEAssetRegistry removeAssetInternal:](self, "removeAssetInternal:", v5[3]))
      {
        v5 = (uint64_t *)std::__hash_table<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PHASEAsset * {__strong}>>>::erase(p_assetLookup, v5);
        if (!v5)
          return;
      }
    }
  }
}

- (id)assetInfoString:(int64_t)a3
{
  id v5;
  id *i;
  AssetInfo *v7;
  uint64_t v8;
  NSString *identifier;
  objc_class *v10;
  uint64_t v11;
  NSString *type;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = (id *)self->_assetLookup.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    v7 = objc_alloc_init(AssetInfo);
    objc_msgSend(i[3], "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->identifier;
    v7->identifier = (NSString *)v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    type = v7->type;
    v7->type = (NSString *)v11;

    v7->sizeInBytes = objc_msgSend(i[3], "sizeInBytes");
    objc_msgSend(v5, "addObject:", v7);

  }
  if (a3 == 1935753580)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:selector:", CFSTR("identifier"), 1, sel_caseInsensitiveCompare_);
    v29[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingDescriptors:", v14);
  }
  else
  {
    if (a3 != 1935758451)
      goto LABEL_8;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("type"), 1);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("sizeInBytes"), 0);
    v28[0] = v13;
    v28[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingDescriptors:", v15);

  }
LABEL_8:
  v16 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v16, "appendString:", CFSTR("\n=== Asset Registry ===\n"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("asset name: %@, type: %@, size: %1.3f MB\n"), *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20) + 8), *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20) + 16), (float)((float)*(unint64_t *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20) + 24) / 1000000.0));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  objc_msgSend(v16, "appendString:", CFSTR("\n"));
  return v16;
}

- (const)getSoundAssetInfo:(unint64_t)a3
{
  PHASEAssetRegistry *v4;
  _QWORD *v5;
  id v6;
  const SoundAssetInfo *v7;

  v4 = self;
  objc_sync_enter(v4);
  v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    v6 = (id)v5[3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (const SoundAssetInfo *)objc_msgSend(v6, "getAssetInfo");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (const)getActionTree:(unint64_t)a3
{
  PHASEAssetRegistry *v4;
  _QWORD *v5;
  id v6;
  const void *v7;

  v4 = self;
  objc_sync_enter(v4);
  v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    v6 = (id)v5[3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (const void *)objc_msgSend(v6, "getActionTree");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (const)getChannelMapping:(unint64_t)a3
{
  PHASEAssetRegistry *v3;

  v3 = self;
  objc_sync_enter(v3);
  objc_sync_exit(v3);

  return 0;
}

- (id)getGlobalMetaParameter:(unint64_t)a3
{
  PHASEAssetRegistry *v4;
  _QWORD *v5;
  id v6;
  id v7;

  v4 = self;
  objc_sync_enter(v4);
  v5 = std::__hash_table<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::__unordered_map_hasher<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::hash<PHASETapType>,std::equal_to<PHASETapType>,true>,std::__unordered_map_equal<PHASETapType,std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>,std::equal_to<PHASETapType>,std::hash<PHASETapType>,true>,std::allocator<std::__hash_value_type<PHASETapType,std::unique_ptr<Phase::TapSourceRegistry::TapSourceInfo>>>>::find<PHASETapType>(&v4->_assetLookup.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v5)
  {
    v6 = (id)v5[3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v4);

  return v7;
}

- (NSMutableDictionary)metaParameterDictionary
{
  return self->_metaParameterDictionary;
}

- (void)setMetaParameterDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metaParameterDictionary, a3);
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  uint64_t v5;
  void **value;

  objc_storeStrong((id *)&self->_metaParameterDictionary, 0);
  next = self->_stringPools.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      v5 = next[3];
      next[3] = 0;
      if (v5)
        std::default_delete<Phase::StringPool>::operator()[abi:ne180100]((uint64_t)(next + 3), v5);
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_stringPools.__table_.__bucket_list_.__ptr_.__value_;
  self->_stringPools.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  std::__hash_table<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,void({block_pointer} {__strong})(AudioTimeStamp const*,unsigned int)>>>::~__hash_table((uint64_t)&self->_assetLookup);
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

- (uint64_t)unregisterAssetWithIdentifier:(uint64_t)a1 completion:
{

  return a1;
}

- (void)unregisterAssetWithIdentifier:(uint64_t)a1 completion:
{

  JUMPOUT(0x2199F9D70);
}

- (void)unregisterAssetWithIdentifier:completion:
{
  Phase::Controller::AssetUnloader::UnregisterAsset(*(_QWORD **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24));
}

@end
