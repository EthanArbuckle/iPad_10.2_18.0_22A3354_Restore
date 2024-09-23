@implementation ETImageFolderDataProvider

- (ETImageFolderDataProvider)initWithFolder:(id)a3 forImageTensor:(id)a4 andLabelTensor:(id)a5 shuffleBeforeEachEpoch:(BOOL)a6 shuffleRandomSeed:(id)a7 withImagePreprocessParams:(id)a8
{
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v22;
  __end_ **begin;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  __end_ **v29;
  __end_cap_ **v30;
  __end_ **v31;
  __end_ *v32;
  ETImageFolderDataProvider *v33;
  int64x2_t v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *end;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  void *v69;
  unsigned int v70;
  unsigned int v71;
  ETImagePreprocessor *v72;
  ETImagePreprocessor *imageProcessor;
  char *v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  unint64_t *p_shared_owners;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  __int128 v82;
  blob_cpu *ptr;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  NSArray *labelShape;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id obj;
  uint64_t v100;
  id v101;
  uint64_t v102;
  void *v103;
  id v104;
  uint64_t i;
  uint64_t v106;
  void *v107;
  id v108;
  ETImageFolderDataProvider *v109;
  uint64_t v110;
  std::__shared_weak_count *v111;
  __int128 v112;
  unint64_t v113;
  __int128 v114;
  void *__p[2];
  uint64_t v116;
  uint64_t v117;
  std::__shared_weak_count *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  objc_super v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v101 = a3;
  v94 = a4;
  v95 = a4;
  v93 = a5;
  v96 = a5;
  v97 = a7;
  v98 = a8;
  v129.receiver = self;
  v129.super_class = (Class)ETImageFolderDataProvider;
  v109 = -[ETImageFolderDataProvider init](&v129, sel_init);
  if (v109)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0;
    objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v101, &v128);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v128;

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    obj = v14;
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
    if (v102)
    {
      v106 = 0;
      v100 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v102; ++i)
        {
          if (*(_QWORD *)v125 != v100)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
          objc_msgSend(v101, "stringByAppendingPathComponent:", v16);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v112) = 0;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v107, &v112);

          if ((_BYTE)v112)
            v19 = v18;
          else
            v19 = 0;
          if (v19 == 1)
          {
            var0 = v109->classes.var0;
            value = v109->classes.var1.__value_;
            if (var0 >= (__end_cap_ **)value)
            {
              begin = v109->classes.__begin_;
              v24 = var0 - begin;
              if ((unint64_t)(v24 + 1) >> 61)
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              v25 = (char *)value - (char *)begin;
              v26 = v25 >> 2;
              if (v25 >> 2 <= (unint64_t)(v24 + 1))
                v26 = v24 + 1;
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
                v27 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v27 = v26;
              if (v27)
              {
                if (v27 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v28 = (char *)operator new(8 * v27);
              }
              else
              {
                v28 = 0;
              }
              v29 = (__end_ **)&v28[8 * v24];
              *v29 = (__end_ *)v16;
              v22 = v29 + 1;
              v31 = v109->classes.__begin_;
              v30 = v109->classes.var0;
              if (v30 == v31)
              {
                v34 = vdupq_n_s64((unint64_t)v30);
                v33 = v109;
              }
              else
              {
                do
                {
                  v32 = *--v30;
                  *v30 = 0;
                  *--v29 = v32;
                }
                while (v30 != v31);
                v33 = v109;
                v34 = *(int64x2_t *)&v109->classes.__begin_;
              }
              v33->classes.__begin_ = v29;
              v33->classes.var0 = v22;
              v33->classes.var1.__value_ = (id *)&v28[8 * v27];
              v36 = (char *)v34.i64[1];
              v35 = (char *)v34.i64[0];
              while (v36 != v35)
              {
                v37 = (void *)*((_QWORD *)v36 - 1);
                v36 -= 8;

              }
              if (v35)
                operator delete(v35);
            }
            else
            {
              *var0 = (__end_cap_ *)v16;
              v22 = var0 + 1;
            }
            v109->classes.var0 = v22;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = v15;
            objc_msgSend(v38, "contentsOfDirectoryAtPath:error:", v107, &v123);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v123;

            if (v104)
            {
              NSLog(CFSTR("Error with image folder %@"), v104);
            }
            else
            {
              v121 = 0u;
              v122 = 0u;
              v119 = 0u;
              v120 = 0u;
              v108 = v103;
              v39 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
              if (v39)
              {
                v40 = *(_QWORD *)v120;
                do
                {
                  for (j = 0; j != v39; ++j)
                  {
                    if (*(_QWORD *)v120 != v40)
                      objc_enumerationMutation(v108);
                    v42 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
                    objc_msgSend(v42, "pathExtension");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "lowercaseString");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("jpeg"));

                    objc_msgSend(v42, "pathExtension");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "lowercaseString");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("jpg"));

                    objc_msgSend(v42, "pathExtension");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "lowercaseString");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v46) = objc_msgSend(v50, "isEqualToString:", CFSTR("png"));

                    objc_msgSend(v42, "pathExtension");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "lowercaseString");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("PNG"));

                    if (v45 | v48 | v46 | v53)
                    {
                      objc_msgSend(v107, "stringByAppendingPathComponent:", v42);
                      v54 = objc_claimAutoreleasedReturnValue();
                      v55 = v54;
                      end = (char *)v109->samples.__end_;
                      v56 = (char *)v109->samples.__end_cap_.__value_;
                      if (end >= v56)
                      {
                        v59 = (char *)v109->samples.__begin_;
                        v60 = (end - v59) >> 4;
                        v61 = v60 + 1;
                        if ((unint64_t)(v60 + 1) >> 60)
                          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
                        v62 = v56 - v59;
                        if (v62 >> 3 > v61)
                          v61 = v62 >> 3;
                        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0)
                          v63 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v63 = v61;
                        if (v63 >> 60)
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        v64 = (char *)operator new(16 * v63);
                        v65 = (uint64_t *)&v64[16 * v60];
                        *v65 = v55;
                        v65[1] = v106;
                        if (end == v59)
                        {
                          v58 = v65 + 2;
                          v109->samples.__begin_ = v65;
                          v109->samples.__end_ = v65 + 2;
                          v109->samples.__end_cap_.__value_ = &v64[16 * v63];
                        }
                        else
                        {
                          v66 = &v64[16 * v60];
                          v67 = end;
                          do
                          {
                            v68 = *((_QWORD *)v67 - 2);
                            v67 -= 16;
                            *(_QWORD *)v67 = 0;
                            *((_QWORD *)v66 - 2) = v68;
                            v66 -= 16;
                            *((_QWORD *)v66 + 1) = *((_QWORD *)v67 + 1);
                          }
                          while (v67 != v59);
                          v58 = v65 + 2;
                          v109->samples.__begin_ = v66;
                          v109->samples.__end_ = v65 + 2;
                          v109->samples.__end_cap_.__value_ = &v64[16 * v63];
                          while (end != v59)
                          {
                            v69 = (void *)*((_QWORD *)end - 2);
                            end -= 16;

                          }
                        }
                        if (v59)
                          operator delete(v59);
                      }
                      else
                      {
                        *(_QWORD *)end = v54;
                        *((_QWORD *)end + 1) = v106;
                        v58 = end + 16;
                      }
                      v109->samples.__end_ = v58;
                    }
                  }
                  v39 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
                }
                while (v39);
              }

            }
            ++v106;
            v15 = v104;
          }

        }
        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
      }
      while (v102);
    }

    if (v97)
    {
      v70 = objc_msgSend(v97, "intValue");
      v71 = v70 + ((v70 / 0x7FFFFFFF) | ((v70 / 0x7FFFFFFF) << 31));
      if (v71 <= 1)
        v71 = 1;
    }
    else
    {
      v71 = 1;
    }
    v109->randomgen.__x_ = v71;
    v72 = -[ETImagePreprocessor initWithImagePreprocessParams:]([ETImagePreprocessor alloc], "initWithImagePreprocessParams:", v98);
    imageProcessor = v109->imageProcessor;
    v109->imageProcessor = v72;

    objc_storeStrong((id *)&v109->imageTensorName, v94);
    LODWORD(v112) = 0;
    Espresso::create_context((int *)&v112, &v117);
    v74 = (char *)operator new(0x118uLL);
    *((_QWORD *)v74 + 3) = off_1E2D8F108;
    *(_QWORD *)v74 = &off_1E2DC1868;
    *((_QWORD *)v74 + 1) = 0;
    *((_DWORD *)v74 + 13) = -1;
    v76 = v117;
    v75 = v118;
    *((_QWORD *)v74 + 11) = 0;
    *((_QWORD *)v74 + 12) = v76;
    *((_QWORD *)v74 + 2) = 0;
    *(_OWORD *)(v74 + 56) = 0u;
    *(_OWORD *)(v74 + 72) = 0u;
    *((_QWORD *)v74 + 13) = v75;
    if (v75)
    {
      p_shared_owners = (unint64_t *)&v75->__shared_owners_;
      do
        v78 = __ldxr(p_shared_owners);
      while (__stxr(v78 + 1, p_shared_owners));
    }
    *((_QWORD *)v74 + 14) = 0;
    *((_QWORD *)v74 + 15) = 0;
    *((_DWORD *)v74 + 32) = 0;
    *((_DWORD *)v74 + 34) = 1065353216;
    *(_QWORD *)(v74 + 140) = 0xFFFFFFFF00000000;
    *((_DWORD *)v74 + 37) = 1;
    *((_QWORD *)v74 + 4) = 0;
    *((_QWORD *)v74 + 5) = 0;
    *((_DWORD *)v74 + 12) = 0;
    *(_OWORD *)(v74 + 152) = 0uLL;
    *(_OWORD *)(v74 + 168) = 0uLL;
    *((_QWORD *)v74 + 3) = &off_1E2DA6B80;
    *((_QWORD *)v74 + 34) = 0;
    *(_OWORD *)(v74 + 184) = 0uLL;
    *(_OWORD *)(v74 + 200) = 0uLL;
    *(_OWORD *)(v74 + 216) = 0uLL;
    *(_OWORD *)(v74 + 232) = 0uLL;
    *(_OWORD *)(v74 + 248) = 0uLL;
    *((_DWORD *)v74 + 66) = 0;
    *(_QWORD *)&v112 = v74 + 24;
    *((_QWORD *)&v112 + 1) = v74;
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&v109->labelBlob, &v112);
    v79 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
    if (*((_QWORD *)&v112 + 1))
    {
      v80 = (unint64_t *)(*((_QWORD *)&v112 + 1) + 8);
      do
        v81 = __ldaxr(v80);
      while (__stlxr(v81 - 1, v80));
      if (!v81)
      {
        ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
        std::__shared_weak_count::__release_weak(v79);
      }
    }
    v116 = 0;
    *(_OWORD *)__p = 0u;
    v114 = 0u;
    *(_QWORD *)&v82 = 0x100000001;
    *((_QWORD *)&v82 + 1) = 0x100000001;
    v112 = v82;
    v113 = 0xFFFFFFFF00000001;
    ptr = v109->labelBlob.__ptr_;
    v110 = 0;
    v111 = 0;
    (*(void (**)(blob_cpu *, __int128 *, uint64_t *))(*(_QWORD *)ptr + 16))(ptr, &v112, &v110);
    v84 = v111;
    if (v111)
    {
      v85 = (unint64_t *)&v111->__shared_owners_;
      do
        v86 = __ldaxr(v85);
      while (__stlxr(v86 - 1, v85));
      if (!v86)
      {
        ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
        std::__shared_weak_count::__release_weak(v84);
      }
    }
    labelShape = v109->labelShape;
    v109->labelShape = (NSArray *)&unk_1E2DEDF50;

    objc_storeStrong((id *)&v109->labelTensorName, v93);
    v109->shuffleBeforeEpoch = a6;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v88 = v118;
    if (v118)
    {
      v89 = (unint64_t *)&v118->__shared_owners_;
      do
        v90 = __ldaxr(v89);
      while (__stlxr(v90 - 1, v89));
      if (!v90)
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
      }
    }

  }
  return v109;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  char *v5;
  id v6;
  unint64_t v7;
  void *v8;
  ETDataTensor *v9;
  ETDataTensor *v10;
  NSString *labelTensorName;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (char *)self->samples.__begin_ + 16 * a3;
  v6 = *(id *)v5;
  v7 = *((_QWORD *)v5 + 1);
  -[ETImagePreprocessor tensorWithPath:](self->imageProcessor, "tensorWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  **(float **)(*((_QWORD *)self->labelBlob.__ptr_ + 20) + 24) = (float)v7;
  v9 = [ETDataTensor alloc];
  v10 = -[ETDataTensor initWithData:type:shape:strides:](v9, "initWithData:type:shape:strides:", *(_QWORD *)(*((_QWORD *)self->labelBlob.__ptr_ + 20) + 24), 2, self->labelShape, MEMORY[0x1E0C9AA60]);
  labelTensorName = self->labelTensorName;
  v14[0] = self->imageTensorName;
  v14[1] = labelTensorName;
  v15[0] = v8;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)numberOfDataPoints
{
  return ((char *)self->samples.__end_ - (char *)self->samples.__begin_) >> 4;
}

- (void)prepareForEpoch
{
  _BYTE *end;
  char *begin;
  char *v4;
  linear_congruential_engine<unsigned int, 48271U, 0U, 2147483647U> *p_randomgen;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  if (self->shuffleBeforeEpoch)
  {
    begin = (char *)self->samples.__begin_;
    end = self->samples.__end_;
    if (end - begin >= 17)
    {
      v4 = end - 16;
      if (end - 16 > begin)
      {
        p_randomgen = &self->randomgen;
        v6 = ((unint64_t)(end - begin) >> 4) - 1;
        do
        {
          v13[0] = 0;
          v13[1] = v6;
          v7 = std::uniform_int_distribution<long>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)p_randomgen, v13);
          if (v7)
          {
            v8 = (void **)&begin[16 * v7];
            v9 = *(void **)begin;
            v10 = *v8;
            *v8 = 0;
            *(_QWORD *)begin = v10;
            v11 = *v8;
            *v8 = v9;

            v12 = (void *)*((_QWORD *)begin + 1);
            *((_QWORD *)begin + 1) = v8[1];
            v8[1] = v12;
          }
          begin += 16;
          --v6;
        }
        while (begin < v4);
      }
    }
  }
}

- (void).cxx_destruct
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v5;
  void *v6;
  char *v7;
  char *end;
  void *v9;
  void *v10;

  objc_storeStrong((id *)&self->imageProcessor, 0);
  objc_storeStrong((id *)&self->labelShape, 0);
  objc_storeStrong((id *)&self->labelTensorName, 0);
  objc_storeStrong((id *)&self->imageTensorName, 0);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->labelBlob);
  begin = self->classes.__begin_;
  if (begin)
  {
    var0 = self->classes.var0;
    v5 = self->classes.__begin_;
    if (var0 != begin)
    {
      do
      {
        v6 = *--var0;

      }
      while (var0 != begin);
      v5 = self->classes.__begin_;
    }
    self->classes.var0 = begin;
    operator delete(v5);
  }
  v7 = (char *)self->samples.__begin_;
  if (v7)
  {
    end = (char *)self->samples.__end_;
    v9 = self->samples.__begin_;
    if (end != v7)
    {
      do
      {
        v10 = (void *)*((_QWORD *)end - 2);
        end -= 16;

      }
      while (end != v7);
      v9 = self->samples.__begin_;
    }
    self->samples.__end_ = v7;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 24) = 1;
  return self;
}

@end
