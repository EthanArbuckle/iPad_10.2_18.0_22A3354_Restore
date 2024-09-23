@implementation GTBatchedCounterManager

- (GTBatchedCounterManager)initWithEncoderBatchPriorityList:(id)a3
{
  id v4;
  GTBatchedCounterManager *v5;
  GTBatchedCounterManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTBatchedCounterManager;
  v5 = -[GTBatchedCounterManager init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[GTBatchedCounterManager _initializeData:](v5, "_initializeData:", v4);
    atomic_store(1u, (unsigned __int8 *)&v6->_paused);
  }

  return v6;
}

- (void)cleanup
{
  NSObject *v2;
  NSObject *v3;

  gInitialized = 0;
  -[GTBatchedCounterManager _clearData](self, "_clearData");
  v2 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore"));
  dispatch_semaphore_signal(v2);

  v3 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphoreRequests](GTBatchedCounterManager, "semaphoreRequests"));
  dispatch_semaphore_signal(v3);

}

- (void)_clearData
{
  uint64_t end;
  void *begin;
  uint64_t i;
  void *v6;

  end = (uint64_t)self->_processedBatches.__end_;
  begin = self->_processedBatches.__begin_;
  while ((void *)end != begin)
    end = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(end - 40);
  self->_processedBatches.__end_ = begin;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  v6 = self->_perEncoderBatchQueue.__begin_;
  for (i = (uint64_t)self->_perEncoderBatchQueue.__end_;
        (void *)i != v6;
  self->_perEncoderBatchQueue.__end_ = v6;
}

- (void)_initializeData:(id)a3
{
  unint64_t value;
  float v5;
  unordered_map<unsigned int, unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned int>>> *p_batchToEncoderMap;
  unsigned int v7;
  int v8;
  void *v9;
  char *v10;
  char *end;
  void *v12;
  char *begin;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  void *v26;
  _BYTE *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  float *v38;
  unint64_t v39;
  float v40;
  _QWORD *v41;
  id v42;
  id v43;
  _QWORD *v44;
  char **v45;
  void *v46;
  unsigned int v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  int64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  BOOL v78;
  size_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  void *v100;
  _QWORD *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id obj;
  GTBatchedCounterManager *v114;
  uint64_t v115;
  id v116;
  void *v117;
  unordered_map<unsigned int, unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned int>>> *v118;
  int v119;
  id v120;
  uint64_t v121;
  id v122;
  unsigned int v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  void *v135;
  _BYTE v136[128];
  _BYTE v137[128];

  v111 = a3;
  value = self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
    v5 = (float)self->_batchToEncoderMap.__table_.__p2_.__value_ / (float)value;
  else
    v5 = 0.0;
  self->_batchToEncoderMap.__table_.__p3_.__value_ = fmaxf(v5, 0.4);
  p_batchToEncoderMap = &self->_batchToEncoderMap;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&self->_batchToEncoderMap, vcvtps_u32_f32((float)(unint64_t)((_QWORD)objc_msgSend(v111, "count", v111) << 8)/ self->_batchToEncoderMap.__table_.__p3_.__value_));
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v112;
  v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
  if (v116)
  {
    v7 = 0;
    v8 = 0;
    v115 = *(_QWORD *)v132;
    v114 = self;
    v118 = &self->_batchToEncoderMap;
    do
    {
      v117 = 0;
      do
      {
        if (*(_QWORD *)v132 != v115)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)v117);
        v129 = 0u;
        v130 = 0u;
        v128 = 0u;
        end = (char *)self->_perEncoderBatchQueue.__end_;
        v10 = (char *)self->_perEncoderBatchQueue.__end_cap_.__value_;
        if (end >= v10)
        {
          begin = (char *)self->_perEncoderBatchQueue.__begin_;
          v14 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4) + 1;
          if (v14 > 0x555555555555555)
            abort();
          v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - begin) >> 4);
          if (2 * v15 > v14)
            v14 = 2 * v15;
          if (v15 >= 0x2AAAAAAAAAAAAAALL)
            v16 = 0x555555555555555;
          else
            v16 = v14;
          if (v16)
          {
            if (v16 > 0x555555555555555)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v17 = (char *)operator new(48 * v16);
          }
          else
          {
            v17 = 0;
          }
          v18 = &v17[16 * ((end - begin) >> 4)];
          *(_OWORD *)v18 = 0u;
          *((_OWORD *)v18 + 1) = 0u;
          v128 = 0u;
          v129 = 0u;
          v19 = &v17[48 * v16];
          *((_QWORD *)v18 + 4) = 0;
          *((_QWORD *)v18 + 5) = 0;
          v130 = 0uLL;
          v12 = v18 + 48;
          if (end == begin)
          {
            self->_perEncoderBatchQueue.__begin_ = v18;
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
          }
          else
          {
            v20 = 0;
            do
            {
              v21 = &v18[v20];
              v22 = &end[v20];
              *((_QWORD *)v21 - 6) = *(_QWORD *)&end[v20 - 48];
              *((_QWORD *)v21 - 5) = *(_QWORD *)&end[v20 - 40];
              *((_QWORD *)v21 - 4) = *(_QWORD *)&end[v20 - 32];
              *((_QWORD *)v21 - 3) = *(_QWORD *)&end[v20 - 24];
              *((_OWORD *)v22 - 3) = 0uLL;
              *((_OWORD *)v22 - 2) = 0uLL;
              *((_QWORD *)v21 - 2) = *(_QWORD *)&end[v20 - 16];
              *((_QWORD *)v21 - 1) = *(_QWORD *)&end[v20 - 8];
              *((_QWORD *)v22 - 2) = 0;
              *((_QWORD *)v22 - 1) = 0;
              v20 -= 48;
            }
            while (&end[v20] != begin);
            end = (char *)self->_perEncoderBatchQueue.__begin_;
            v23 = (uint64_t)self->_perEncoderBatchQueue.__end_;
            self->_perEncoderBatchQueue.__begin_ = &v18[v20];
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
            while ((char *)v23 != end)
              v23 = std::deque<unsigned int>::~deque[abi:nn180100](v23 - 48);
          }
          if (end)
            operator delete(end);
        }
        else
        {
          *(_QWORD *)end = 0;
          *((_QWORD *)end + 1) = *((_QWORD *)&v128 + 1);
          *((_OWORD *)end + 1) = v129;
          v128 = 0uLL;
          v129 = 0uLL;
          *((_OWORD *)end + 2) = v130;
          v130 = 0uLL;
          v12 = end + 48;
        }
        self->_perEncoderBatchQueue.__end_ = v12;
        std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)&v128);
        v128 = 0u;
        v129 = 0u;
        LODWORD(v130) = 1065353216;
        v24 = self->_processedBatches.__end_;
        v25 = self->_processedBatches.__end_cap_.__value_;
        if (v24 < v25)
        {
          v26 = (void *)(std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)v24, (uint64_t *)&v128)+ 40);
          self->_processedBatches.__end_ = v26;
          goto LABEL_49;
        }
        v27 = self->_processedBatches.__begin_;
        v28 = 0xCCCCCCCCCCCCCCCDLL * ((v24 - v27) >> 3);
        v29 = v28 + 1;
        if (v28 + 1 > 0x666666666666666)
          abort();
        v30 = 0xCCCCCCCCCCCCCCCDLL * ((v25 - v27) >> 3);
        if (2 * v30 > v29)
          v29 = 2 * v30;
        if (v30 >= 0x333333333333333)
          v31 = 0x666666666666666;
        else
          v31 = v29;
        if (v31)
        {
          if (v31 > 0x666666666666666)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v32 = (char *)operator new(40 * v31);
        }
        else
        {
          v32 = 0;
        }
        v33 = &v32[40 * v31];
        v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)&v32[40 * v28], (uint64_t *)&v128);
        v26 = v34 + 40;
        v36 = (uint64_t *)self->_processedBatches.__begin_;
        v35 = (uint64_t *)self->_processedBatches.__end_;
        if (v35 == v36)
        {
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35)
            goto LABEL_48;
        }
        else
        {
          do
          {
            v35 -= 5;
            v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v34 - 40), v35);
          }
          while (v35 != v36);
          v37 = (uint64_t *)self->_processedBatches.__begin_;
          v35 = (uint64_t *)self->_processedBatches.__end_;
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35 != v37)
          {
            do
            {
              v35 -= 5;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v35);
            }
            while (v35 != v37);
            v35 = v37;
          }
          if (v35)
LABEL_48:
            operator delete(v35);
        }
LABEL_49:
        self->_processedBatches.__end_ = v26;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v128);
        v38 = (float *)self->_processedBatches.__end_;
        v39 = *((_QWORD *)v38 - 4);
        if (v39)
          v40 = (float)*((unint64_t *)v38 - 2) / (float)v39;
        else
          v40 = 0.0;
        *(v38 - 2) = fmaxf(v40, 0.4);
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v38 - 10), vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v9, "count") / *(v38 - 2)));
        v41 = self->_perEncoderBatchQueue.__end_;
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v42 = v9;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
        if (v43)
        {
          v44 = v41 - 6;
          v120 = v42;
          v121 = *(_QWORD *)v125;
          v45 = (char **)(v41 - 3);
          v119 = v8;
          do
          {
            v46 = 0;
            v122 = v43;
            do
            {
              if (*(_QWORD *)v125 != v121)
                objc_enumerationMutation(v42);
              v123 = v7;
              v47 = objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)v46), "unsignedIntValue");
              v48 = (char *)*(v41 - 4);
              v49 = (char *)*(v41 - 5);
              if (v48 == v49)
                v50 = 0;
              else
                v50 = ((v48 - v49) << 7) - 1;
              v52 = *(v41 - 2);
              v51 = *(v41 - 1);
              v53 = v51 + v52;
              if (v50 == v51 + v52)
              {
                if (v52 >= 0x400)
                {
                  *(v41 - 2) = v52 - 1024;
                  v56 = *(_QWORD *)v49;
                  v54 = v49 + 8;
                  v55 = v56;
                  *(v41 - 5) = v54;
                  v57 = (char *)*(v41 - 4);
                  if (v57 == (char *)*(v41 - 3))
                  {
                    v58 = (uint64_t)&v54[-*v44];
                    if ((unint64_t)v54 > *v44)
                      goto LABEL_64;
                    if (v57 == (char *)*v44)
                      v91 = 1;
                    else
                      v91 = (uint64_t)&v57[-*v44] >> 2;
                    v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v91);
                    v94 = &v92[8 * (v91 >> 2)];
                    v95 = (uint64_t *)*(v41 - 5);
                    v57 = v94;
                    v96 = *(v41 - 4) - (_QWORD)v95;
                    if (v96)
                    {
                      v57 = &v94[v96 & 0xFFFFFFFFFFFFFFF8];
                      v97 = 8 * (v96 >> 3);
                      v98 = &v92[8 * (v91 >> 2)];
                      do
                      {
                        v99 = *v95++;
                        *(_QWORD *)v98 = v99;
                        v98 += 8;
                        v97 -= 8;
                      }
                      while (v97);
                    }
LABEL_104:
                    v100 = (void *)*(v41 - 6);
                    *(v41 - 6) = v92;
                    *(v41 - 5) = v94;
                    *(v41 - 4) = v57;
                    *(v41 - 3) = &v92[8 * v93];
                    if (v100)
                    {
                      operator delete(v100);
                      v57 = (char *)*(v41 - 4);
                    }
                  }
                  goto LABEL_107;
                }
                v65 = (v48 - v49) >> 3;
                v66 = *v45;
                v67 = (uint64_t)&(*v45)[-*v44];
                if (v65 >= v67 >> 3)
                {
                  if (v66 == (char *)*v44)
                    v68 = 1;
                  else
                    v68 = v67 >> 2;
                  *(_QWORD *)&v130 = v41 - 3;
                  *(_QWORD *)&v128 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v68);
                  *((_QWORD *)&v128 + 1) = v128 + 8 * v65;
                  *(_QWORD *)&v129 = *((_QWORD *)&v128 + 1);
                  *((_QWORD *)&v129 + 1) = v128 + 8 * v69;
                  v135 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_back(&v128, &v135);
                  v70 = *(v41 - 4);
                  v71 = (char *)*((_QWORD *)&v128 + 1);
                  v72 = (char *)v128;
                  v74 = (char *)*((_QWORD *)&v129 + 1);
                  v73 = (char *)v129;
                  while (v70 != *(v41 - 5))
                  {
                    if (v71 == v72)
                    {
                      if (v73 >= v74)
                      {
                        if (v74 == v72)
                          v80 = 1;
                        else
                          v80 = (v74 - v72) >> 2;
                        v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v80);
                        v83 = v81;
                        v71 = &v81[(2 * v80 + 6) & 0xFFFFFFFFFFFFFFF8];
                        v84 = v73 - v72;
                        v78 = v73 == v72;
                        v73 = v71;
                        if (!v78)
                        {
                          v73 = &v71[v84 & 0xFFFFFFFFFFFFFFF8];
                          v85 = 8 * (v84 >> 3);
                          v86 = v71;
                          v87 = v72;
                          do
                          {
                            v88 = *(_QWORD *)v87;
                            v87 += 8;
                            *(_QWORD *)v86 = v88;
                            v86 += 8;
                            v85 -= 8;
                          }
                          while (v85);
                        }
                        v74 = &v81[8 * v82];
                        if (v72)
                          operator delete(v72);
                        v72 = v83;
                      }
                      else
                      {
                        v75 = (v74 - v73) >> 3;
                        if (v75 >= -1)
                          v76 = v75 + 1;
                        else
                          v76 = v75 + 2;
                        v77 = &v73[8 * (v76 >> 1)];
                        v71 = &v77[-(v73 - v72)];
                        v79 = v73 - v72;
                        v78 = v73 == v72;
                        v73 = v77;
                        if (!v78)
                          memmove(v71, v72, v79);
                      }
                    }
                    v89 = *(_QWORD *)(v70 - 8);
                    v70 -= 8;
                    *((_QWORD *)v71 - 1) = v89;
                    v71 -= 8;
                  }
                  *(_QWORD *)&v128 = v72;
                  *((_QWORD *)&v128 + 1) = v71;
                  *(_QWORD *)&v129 = v73;
                  *((_QWORD *)&v129 + 1) = v74;
                  v90 = (void *)*(v41 - 6);
                  *((_OWORD *)v41 - 3) = v128;
                  *((_OWORD *)v41 - 2) = v129;
                  if (v90)
                    operator delete(v90);
                  p_batchToEncoderMap = v118;
                  v8 = v119;
                  v44 = v41 - 6;
                  v42 = v120;
                }
                else if (v66 == v48)
                {
                  *(_QWORD *)&v128 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_front((uint64_t)v44, &v128);
                  v101 = (_QWORD *)*(v41 - 5);
                  v57 = (char *)*(v41 - 4);
                  v102 = *v101;
                  v54 = (char *)(v101 + 1);
                  v55 = v102;
                  *(v41 - 5) = v54;
                  if (v57 == (char *)*(v41 - 3))
                  {
                    v58 = (uint64_t)&v54[-*v44];
                    if ((unint64_t)v54 <= *v44)
                    {
                      if (v57 == (char *)*v44)
                        v103 = 1;
                      else
                        v103 = (uint64_t)&v57[-*v44] >> 2;
                      v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v103);
                      v94 = &v92[8 * (v103 >> 2)];
                      v104 = (uint64_t *)*(v41 - 5);
                      v57 = v94;
                      v105 = *(v41 - 4) - (_QWORD)v104;
                      if (v105)
                      {
                        v57 = &v94[v105 & 0xFFFFFFFFFFFFFFF8];
                        v106 = 8 * (v105 >> 3);
                        v107 = &v92[8 * (v103 >> 2)];
                        do
                        {
                          v108 = *v104++;
                          *(_QWORD *)v107 = v108;
                          v107 += 8;
                          v106 -= 8;
                        }
                        while (v106);
                      }
                      goto LABEL_104;
                    }
LABEL_64:
                    v59 = v58 >> 3;
                    v60 = v58 >> 3 < -1;
                    v61 = (v58 >> 3) + 2;
                    if (v60)
                      v62 = v61;
                    else
                      v62 = v59 + 1;
                    v63 = &v54[-8 * (v62 >> 1)];
                    v64 = v57 - v54;
                    if (v57 != v54)
                    {
                      memmove(&v54[-8 * (v62 >> 1)], v54, v57 - v54);
                      v54 = (char *)*(v41 - 5);
                    }
                    v57 = &v63[v64];
                    *(v41 - 5) = &v54[-8 * (v62 >> 1)];
                    *(v41 - 4) = &v63[v64];
                    v44 = v41 - 6;
                    v42 = v120;
                  }
LABEL_107:
                  *(_QWORD *)v57 = v55;
                  *(v41 - 4) += 8;
                }
                else
                {
                  *(_QWORD *)&v128 = operator new(0x1000uLL);
                  std::__split_buffer<GTMMappedBuffer::UsedBlock *>::push_back(v44, &v128);
                }
                v49 = (char *)*(v41 - 5);
                v51 = *(v41 - 1);
                v53 = *(v41 - 2) + v51;
              }
              *(_DWORD *)(*(_QWORD *)&v49[(v53 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v53 & 0x3FF)) = v47;
              *(v41 - 1) = v51 + 1;
              LODWORD(v128) = v123;
              v7 = v123 + 1;
              *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)p_batchToEncoderMap, v123, &v128)+ 5) = v8;
              v46 = (char *)v46 + 1;
            }
            while (v46 != v122);
            v109 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
            v43 = v109;
          }
          while (v109);
        }

        ++v8;
        v117 = (char *)v117 + 1;
        self = v114;
      }
      while (v117 != v116);
      v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
      v116 = v110;
    }
    while (v110);
  }

  gInitialized = 1;
}

- (BOOL)_addBatchAtEncoderIndex:(unsigned int)a3 inEncoderArray:(id)a4
{
  id v6;
  char *begin;
  unsigned int v8;
  int64x2_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v15;
  unsigned int v16;
  __int128 v17;

  v6 = a4;
  begin = (char *)self->_perEncoderBatchQueue.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_perEncoderBatchQueue.__end_ - (char *)begin) >> 4) <= a3)
    goto LABEL_7;
  v8 = a3;
  v9 = (int64x2_t *)&begin[48 * a3];
  if (!v9[2].i64[1])
  {
LABEL_6:
    objc_msgSend(v6, "addObject:", &off_739928, v17);
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v17 = xmmword_4A4EE0;
  while (1)
  {
    v10 = ((unint64_t)v9[2].i64[0] >> 7) & 0x1FFFFFFFFFFFFF8;
    v11 = v9[2].i64[0] & 0x3FF;
    v12 = *(unsigned int *)(*(_QWORD *)(v9->i64[1] + v10) + 4 * v11);
    if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)self->_processedBatches.__begin_ + 5 * v8, *(_DWORD *)(*(_QWORD *)(v9->i64[1] + v10) + 4 * v11)))break;
    v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_4A4EE0);
    std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
    if (!v9[2].i64[1])
      goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
  objc_msgSend(v6, "addObject:", v15);

  v16 = *(_DWORD *)(*(_QWORD *)(v9->i64[1] + (((unint64_t)v9[2].i64[0] >> 7) & 0x1FFFFFFFFFFFFF8))
                  + 4 * (v9[2].i64[0] & 0x3FF));
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)self->_processedBatches.__begin_ + 40 * v8, v16, v16);
  v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_4A4EE0);
  std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
  v13 = 1;
LABEL_8:

  return v13;
}

- (id)nextPerEncoderBatchList:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id *end;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  unsigned __int8 v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v26 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphoreRequests](GTBatchedCounterManager, "semaphoreRequests"));
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (+[GTBatchedCounterManager isInitialized](GTBatchedCounterManager, "isInitialized"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore"));
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    v28 = (void *)objc_opt_new(NSMutableArray, v6);
    end = (id *)self->_highPriorityArray.__end_;
    if (self->_highPriorityArray.__begin_ == end)
    {
      objc_msgSend(v26, "removeAllObjects");
      if (self->_perEncoderBatchQueue.__end_ == self->_perEncoderBatchQueue.__begin_)
      {
        v18 = 0;
      }
      else
      {
        v17 = 0;
        v18 = 0;
        do
          v18 += -[GTBatchedCounterManager _addBatchAtEncoderIndex:inEncoderArray:](self, "_addBatchAtEncoderIndex:inEncoderArray:", v17++, v28);
        while (v17 < 0xAAAAAAAAAAAAAAABLL
                    * (((char *)self->_perEncoderBatchQueue.__end_ - (char *)self->_perEncoderBatchQueue.__begin_) >> 4));
      }
      v20 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore"));
      dispatch_semaphore_signal(v20);

      v21 = atomic_load((unsigned __int8 *)&self->_paused);
      if ((v21 & 1) == 0)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphoreRequests](GTBatchedCounterManager, "semaphoreRequests"));
        dispatch_semaphore_signal(v22);

      }
      if (v18)
        v16 = v28;
      else
        v16 = 0;
    }
    else
    {
      v24 = *(end - 2);
      v8 = *(end - 1);
      std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_highPriorityArray, (uint64_t)self->_highPriorityArray.__end_ - 16);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v9)
      {
        v10 = 0;
        v11 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(obj);
            v13 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v14 = objc_msgSend(v13, "unsignedIntValue");
            if ((_DWORD)v14 == -1
              || std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)self->_processedBatches.__begin_ + 5 * (v10 + (_DWORD)i), v14))
            {
              -[GTBatchedCounterManager _addBatchAtEncoderIndex:inEncoderArray:](self, "_addBatchAtEncoderIndex:inEncoderArray:", (char *)i + v10, v28, v24);
            }
            else
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14));
              objc_msgSend(v28, "addObject:", v15);

              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)self->_processedBatches.__begin_ + 40 * (v10 + (_DWORD)i), v14, (int)v14);
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v10 = (v10 + (_DWORD)i);
        }
        while (v9);
      }

      if (objc_msgSend(v28, "count"))
      {
        v16 = v28;
        objc_msgSend(v26, "setDictionary:", v24);
      }
      else
      {
        v16 = 0;
      }
      v19 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore", v24));
      dispatch_semaphore_signal(v19);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)nextPerEncoderBatchListForHighPriorityBatches:(id)a3 withHighPriorityInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *value;
  char *end;
  void *v11;
  _BYTE *begin;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  __int128 v22;
  _QWORD *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore"));
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

  end = (char *)self->_highPriorityArray.__end_;
  value = (char *)self->_highPriorityArray.__end_cap_.__value_;
  if (end < value)
  {
    *(_QWORD *)end = v7;
    *((_QWORD *)end + 1) = v6;
    v11 = end + 16;
    goto LABEL_20;
  }
  begin = self->_highPriorityArray.__begin_;
  v13 = (end - begin) >> 4;
  if ((unint64_t)(v13 + 1) >> 60)
    abort();
  v14 = value - begin;
  v15 = v14 >> 3;
  if (v14 >> 3 <= (unint64_t)(v13 + 1))
    v15 = v13 + 1;
  if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
    v16 = 0xFFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
  {
    if (v16 >> 60)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v17 = (char *)operator new(16 * v16);
  }
  else
  {
    v17 = 0;
  }
  v18 = &v17[16 * v13];
  v19 = &v17[16 * v16];
  *(_QWORD *)v18 = v7;
  *((_QWORD *)v18 + 1) = v6;
  v11 = v18 + 16;
  v20 = self->_highPriorityArray.__begin_;
  v21 = self->_highPriorityArray.__end_;
  if (v21 == v20)
  {
    self->_highPriorityArray.__begin_ = v18;
    self->_highPriorityArray.__end_ = v11;
    self->_highPriorityArray.__end_cap_.__value_ = v19;
    if (!v21)
      goto LABEL_20;
    goto LABEL_19;
  }
  do
  {
    v22 = *((_OWORD *)v21 - 1);
    v21 -= 2;
    *v21 = 0;
    v21[1] = 0;
    *((_OWORD *)v18 - 1) = v22;
    v18 -= 16;
  }
  while (v21 != v20);
  v23 = self->_highPriorityArray.__begin_;
  v21 = self->_highPriorityArray.__end_;
  self->_highPriorityArray.__begin_ = v18;
  self->_highPriorityArray.__end_ = v11;
  self->_highPriorityArray.__end_cap_.__value_ = v19;
  if (v21 != v23)
  {
    do
    {

      v24 = (void *)*(v21 - 2);
      v21 -= 2;

    }
    while (v21 != v23);
    v21 = v23;
  }
  if (v21)
LABEL_19:
    operator delete(v21);
LABEL_20:
  self->_highPriorityArray.__end_ = v11;
  v25 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphore](GTBatchedCounterManager, "semaphore"));
  dispatch_semaphore_signal(v25);

  v26 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphoreRequests](GTBatchedCounterManager, "semaphoreRequests"));
  dispatch_semaphore_signal(v26);

  return 1;
}

- (void)pause
{
  atomic_store(1u, (unsigned __int8 *)&self->_paused);
}

- (void)resume
{
  unsigned __int8 v2;
  NSObject *v3;

  v2 = atomic_load((unsigned __int8 *)&self->_paused);
  if ((v2 & 1) != 0)
  {
    atomic_store(0, (unsigned __int8 *)&self->_paused);
    v3 = objc_claimAutoreleasedReturnValue(+[GTBatchedCounterManager semaphoreRequests](GTBatchedCounterManager, "semaphoreRequests"));
    dispatch_semaphore_signal(v3);

  }
}

- (void).cxx_destruct
{
  void *begin;
  vector<std::pair<NSDictionary *, NSArray *>, std::allocator<std::pair<NSDictionary *, NSArray *>>> *p_highPriorityArray;
  void *v5;
  uint64_t end;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  p_highPriorityArray = &self->_highPriorityArray;
  begin = self->_highPriorityArray.__begin_;
  if (begin)
  {
    std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_highPriorityArray, (uint64_t)begin);
    operator delete(p_highPriorityArray->__begin_);
  }
  v5 = self->_perEncoderBatchQueue.__begin_;
  if (v5)
  {
    end = (uint64_t)self->_perEncoderBatchQueue.__end_;
    v7 = self->_perEncoderBatchQueue.__begin_;
    if ((void *)end != v5)
    {
      do
        end = std::deque<unsigned int>::~deque[abi:nn180100](end - 48);
      while ((void *)end != v5);
      v7 = self->_perEncoderBatchQueue.__begin_;
    }
    self->_perEncoderBatchQueue.__end_ = v5;
    operator delete(v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_batchToEncoderMap);
  v8 = self->_processedBatches.__begin_;
  if (v8)
  {
    v9 = (uint64_t)self->_processedBatches.__end_;
    v10 = self->_processedBatches.__begin_;
    if ((void *)v9 != v8)
    {
      do
        v9 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v9 - 40);
      while ((void *)v9 != v8);
      v10 = self->_processedBatches.__begin_;
    }
    self->_processedBatches.__end_ = v8;
    operator delete(v10);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

+ (id)semaphore
{
  return (id)gSemaphore;
}

+ (id)semaphoreRequests
{
  return (id)gSemaphoreRequests;
}

+ (void)initialize
{
  uint64_t v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;

  v3 = objc_opt_self(GTBatchedCounterManager, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = dispatch_semaphore_create(1);
    v6 = (void *)gSemaphore;
    gSemaphore = (uint64_t)v5;

    v7 = dispatch_semaphore_create(0);
    v8 = (void *)gSemaphoreRequests;
    gSemaphoreRequests = (uint64_t)v7;

  }
}

+ (BOOL)isInitialized
{
  return gInitialized;
}

@end
