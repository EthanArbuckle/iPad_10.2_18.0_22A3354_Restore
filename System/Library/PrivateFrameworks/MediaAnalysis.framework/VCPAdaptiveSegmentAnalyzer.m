@implementation VCPAdaptiveSegmentAnalyzer

- (int)calculateAdaptiveSegments:(id)a3 videoEmbeddingsX3D:(id)a4
{
  NSMutableArray *v6;
  NSMutableArray *adaptiveEmbeddings;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  float v22;
  char *v23;
  uint64_t i;
  CMTimeValue v25;
  uint64_t v26;
  void *v27;
  char *end;
  void *v29;
  uint64_t *begin;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void **v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  void **v44;
  void **v45;
  void **v46;
  void *v47;
  unint64_t v48;
  char *v49;
  void *v50;
  int v51;
  int v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  int v62;
  int64_t v63;
  void *v64;
  void *v65;
  const __CFDictionary *v66;
  double Seconds;
  void *v68;
  void *v69;
  const __CFDictionary *v70;
  double v71;
  float v72;
  float v73;
  float v74;
  char *v75;
  float *v76;
  int v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  float *v84;
  char *v85;
  int v86;
  char *v87;
  unint64_t v88;
  float *v89;
  float v90;
  float v91;
  NSMutableArray *v92;
  CFDictionaryRef v93;
  CFDictionaryRef v94;
  void *v95;
  id v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  void *v101;
  id v102;
  CMTime v103;
  CMTime v104;
  CMTime v105;
  CMTime time;
  CMTime *p_buf;
  char *v108;
  char *v109;
  void *__p;
  char *v111;
  char *v112;
  CMTime buf;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[2];
  _QWORD v120[2];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  v102 = a4;
  if (objc_msgSend(v102, "embeddingType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v97);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    adaptiveEmbeddings = self->_adaptiveEmbeddings;
    self->_adaptiveEmbeddings = v6;

    v8 = operator new[]();
    v9 = objc_msgSend(v102, "embeddingSize");
    if (v9 >> 62)
      v10 = -1;
    else
      v10 = 4 * v9;
    v100 = (char *)operator new[](v10, MEMORY[0x1E0DE4E10]);
    if (v100)
    {
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v102, "embeddingsArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
      if (!v12)
        goto LABEL_29;
      v99 = *(_QWORD *)v116;
      do
      {
        v13 = 0;
        v98 = v12;
        do
        {
          if (*(_QWORD *)v116 != v99)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v13);
          bzero(v100, 4 * objc_msgSend(v102, "embeddingSize"));
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("attributes"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("embeddings"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v101, "length");
          if (v16 != 4 * objc_msgSend(v102, "embeddingSize"))
          {

            goto LABEL_81;
          }
          objc_msgSend(v101, "getBytes:length:", v100, 4 * objc_msgSend(v102, "embeddingSize"));
          v17 = 0;
          v18 = v100;
          do
          {
            v19 = 0;
            v20 = v18;
            do
            {
              v21 = 0;
              v22 = 0.0;
              v23 = v20;
              do
              {
                for (i = 0; i != 28; i += 4)
                  v22 = v22 + *(float *)&v23[i];
                ++v21;
                v23 += 28;
              }
              while (v21 != 7);
              *(float *)(v8 + 4 * (v17 + 432 * v19++)) = v22 / 49.0;
              v20 += 196;
            }
            while (v19 != 16);
            ++v17;
            v18 += 3136;
          }
          while (v17 != 432);
          v25 = v8;
          v26 = 16;
          do
          {
            buf.value = v25;
            *(_OWORD *)&buf.timescale = xmmword_1B6FBFBE0;
            v114 = 432;
            dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix_op<dlib::op_pointer_to_mat<float>>>((uint64_t *)&__p, &buf);
            v27 = v11;
            end = (char *)self->_featureArray.__end_;
            if (end >= self->_featureArray.__end_cap_.__value_)
            {
              v29 = (void *)std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__push_back_slow_path<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout> const&>((uint64_t *)&self->_featureArray, (uint64_t *)&__p);
            }
            else
            {
              std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__construct_one_at_end[abi:ne180100]<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout> const&>((uint64_t)&self->_featureArray, (uint64_t *)&__p);
              v29 = end + 16;
            }
            v11 = v27;
            self->_featureArray.__end_ = v29;
            if (__p)
              MEMORY[0x1BCCA128C](__p, 0x1000C8052888210);
            v25 += 1728;
            --v26;
          }
          while (v26);

          ++v13;
        }
        while (v13 != v98);
        v12 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
      }
      while (v12);
LABEL_29:

      LODWORD(buf.value) = 0;
      std::vector<float>::vector(&__p, 1uLL, &buf);
      begin = (uint64_t *)self->_featureArray.__begin_;
      v31 = (char *)self->_featureArray.__end_ - (char *)begin;
      if (v31)
      {
        v32 = 0;
        v33 = v31 >> 4;
        while (1)
        {
          if (v33 >= v32 + 320)
            v34 = v32 + 320;
          else
            v34 = v33;
          v35 = v34 - v32;
          memset(&buf, 0, sizeof(buf));
          std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__init_with_size[abi:ne180100]<std::__wrap_iter<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>*>,std::__wrap_iter<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>*>>(&buf.value, &begin[2 * v32], &begin[2 * v34], v34 - v32);
          v36 = (void *)estimateNumberOfSegments(&buf.value);
          kSegments(&buf.value, v36, &p_buf);
          v37 = (void **)p_buf;
          v38 = v108;
          if (v34 != ((char *)self->_featureArray.__end_ - (char *)self->_featureArray.__begin_) >> 4
            && v108 - (char *)p_buf == 8)
          {
            if (v108 >= v109)
            {
              v39 = v109 - (char *)p_buf;
              if ((unint64_t)((v109 - (char *)p_buf) >> 2) <= 2)
                v40 = 2;
              else
                v40 = v39 >> 2;
              if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
                v41 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v41 = v40;
              v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&v109, v41);
              v44 = (void **)p_buf;
              v45 = (void **)v108;
              v46 = (void **)(v43 + 8);
              *((_QWORD *)v43 + 1) = v35;
              v38 = v43 + 16;
              while (v45 != v44)
              {
                v47 = *--v45;
                *--v46 = v47;
              }
              p_buf = (CMTime *)v46;
              v108 = v43 + 16;
              v109 = &v43[8 * v42];
              if (v44)
                operator delete(v44);
            }
            else
            {
              *(_QWORD *)v108 = v35;
              v38 += 8;
            }
            v108 = v38;
            v37 = (void **)p_buf;
          }
          if ((unint64_t)(v38 - (char *)v37) >= 9)
          {
            v48 = 1;
            do
            {
              v49 = (char *)v37[v48];
              objc_msgSend(v102, "embeddingsArray");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPAdaptiveSegmentAnalyzer calculateTimestamp:videoEmbeddings:](self, "calculateTimestamp:videoEmbeddings:", &v49[v32], v50);
              v52 = v51;
              v53 = v111;
              if (v111 >= v112)
              {
                v55 = (char *)__p;
                v56 = (v111 - (_BYTE *)__p) >> 2;
                v57 = v56 + 1;
                if ((unint64_t)(v56 + 1) >> 62)
                  std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
                v58 = v112 - (_BYTE *)__p;
                if ((v112 - (_BYTE *)__p) >> 1 > v57)
                  v57 = v58 >> 1;
                if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL)
                  v59 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v59 = v57;
                if (v59)
                {
                  v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v112, v59);
                  v55 = (char *)__p;
                  v53 = v111;
                }
                else
                {
                  v60 = 0;
                }
                v61 = &v60[4 * v56];
                *(_DWORD *)v61 = v52;
                v54 = v61 + 4;
                while (v53 != v55)
                {
                  v62 = *((_DWORD *)v53 - 1);
                  v53 -= 4;
                  *((_DWORD *)v61 - 1) = v62;
                  v61 -= 4;
                }
                __p = v61;
                v111 = v54;
                v112 = &v60[4 * v59];
                if (v55)
                  operator delete(v55);
              }
              else
              {
                *(_DWORD *)v111 = v51;
                v54 = v53 + 4;
              }
              v111 = v54;

              ++v48;
              v37 = (void **)p_buf;
              v38 = v108;
            }
            while (v48 < (v108 - (char *)p_buf) >> 3);
          }
          v63 = (char *)self->_featureArray.__end_ - (char *)self->_featureArray.__begin_;
          if (v34 < v63 >> 4)
            break;
          v32 = v63 >> 4;
          if (v37)
            goto LABEL_73;
LABEL_74:
          p_buf = &buf;
          std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
          begin = (uint64_t *)self->_featureArray.__begin_;
          v33 = ((char *)self->_featureArray.__end_ - (char *)begin) >> 4;
          if (v32 >= v33)
            goto LABEL_75;
        }
        v32 += *((_QWORD *)v38 - 1);
        if (!v37)
          goto LABEL_74;
LABEL_73:
        v108 = (char *)v37;
        operator delete(v37);
        goto LABEL_74;
      }
LABEL_75:
      objc_msgSend(v102, "embeddingsArray");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "lastObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("start"));
      v66 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&time, v66);
      Seconds = CMTimeGetSeconds(&time);

      objc_msgSend(v102, "embeddingsArray");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "lastObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("duration"));
      v70 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v105, v70);
      v71 = CMTimeGetSeconds(&v105);

      v72 = Seconds;
      v73 = v71;
      v74 = v72 + v73;
      v75 = v111;
      if (v111 >= v112)
      {
        v78 = (char *)__p;
        v79 = (v111 - (_BYTE *)__p) >> 2;
        v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) >> 62)
          std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
        v81 = v112 - (_BYTE *)__p;
        if ((v112 - (_BYTE *)__p) >> 1 > v80)
          v80 = v81 >> 1;
        if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL)
          v82 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v82 = v80;
        if (v82)
        {
          v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v112, v82);
          v78 = (char *)__p;
          v75 = v111;
        }
        else
        {
          v83 = 0;
        }
        v84 = (float *)&v83[4 * v79];
        v85 = &v83[4 * v82];
        *v84 = v74;
        v76 = v84 + 1;
        while (v75 != v78)
        {
          v86 = *((_DWORD *)v75 - 1);
          v75 -= 4;
          *((_DWORD *)v84-- - 1) = v86;
        }
        __p = v84;
        v111 = (char *)v76;
        v112 = v85;
        if (v78)
          operator delete(v78);
      }
      else
      {
        *(float *)v111 = v74;
        v76 = (float *)(v75 + 4);
      }
      v111 = (char *)v76;
      v87 = (char *)__p;
      if ((char *)v76 - (_BYTE *)__p != 4)
      {
        v88 = 0;
        do
        {
          v89 = (float *)&v87[4 * v88];
          v90 = *v89;
          v91 = v89[1];
          v92 = self->_adaptiveEmbeddings;
          v119[0] = CFSTR("start");
          CMTimeMakeWithSeconds(&v104, v90, 600);
          buf = v104;
          v93 = CMTimeCopyAsDictionary(&buf, 0);
          v120[0] = v93;
          v119[1] = CFSTR("duration");
          CMTimeMakeWithSeconds(&v103, (float)(v91 - v90), 600);
          buf = v103;
          v94 = CMTimeCopyAsDictionary(&buf, 0);
          v120[1] = v94;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v92, "addObject:", v95);

          ++v88;
          v87 = (char *)__p;
        }
        while (v88 < ((v111 - (_BYTE *)__p) >> 2) - 1);
      }
      MEMORY[0x1BCCA128C](v8, 0x1000C8052888210);
      MEMORY[0x1BCCA128C](v100, 0x1000C8052888210);
      if (__p)
      {
        v111 = (char *)__p;
        operator delete(__p);
      }
      v77 = 0;
    }
    else
    {
      v77 = -108;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adaptive segments must be calculated on X3D embeddings.", (uint8_t *)&buf, 2u);
    }
LABEL_81:
    v77 = -18;
  }

  return v77;
}

- (float)calculateTimestamp:(unint64_t)a3 videoEmbeddings:(id)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  Float64 Seconds;
  void *v9;
  const __CFDictionary *v10;
  float v11;
  CMTime v13;
  CMTime time;

  v5 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", (unint64_t)(double)(a3 >> 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("start"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&time, v7);
  Seconds = CMTimeGetSeconds(&time);

  objc_msgSend(v5, "objectAtIndexedSubscript:", (unint64_t)(double)(a3 >> 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("duration"));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v13, v10);
  v11 = CMTimeGetSeconds(&v13);

  *(float *)&Seconds = Seconds;
  return (float)((float)((float)(a3 & 0xF) * v11) * 0.0625) + *(float *)&Seconds;
}

- (vector<float,)averagedEmbedding:(VCPAdaptiveSegmentAnalyzer *)self startTime:(SEL)a3 endTime:(id)a4
{
  id v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const __CFDictionary *v15;
  double Seconds;
  const __CFDictionary *v17;
  double v18;
  float v19;
  float *v20;
  float *v21;
  float *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  float *v28;
  int v29;
  float v30;
  float v31;
  float *v32;
  float *v33;
  float *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  float *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  float *v45;
  unint64_t v46;
  float *v47;
  float *v48;
  float *v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  unint64_t v55;
  float v56;
  float v57;
  float *v58;
  uint64_t v59;
  unint64_t v60;
  float v61;
  unint64_t v62;
  unint64_t v63;
  void **v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  int v75;
  vector<float, std::allocator<float>> *result;
  vector<float, std::allocator<float>> *v77;
  char **v78;
  id obj;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void **v88[4];
  CMTime v89;
  CMTime time;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  float *v96;
  float *v97;
  void *__p;
  float *v99;
  float *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v77 = retstr;
  v105 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v101 = 0;
  v102 = 0;
  v103 = 0;
  __p = 0;
  v99 = 0;
  v100 = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0;
  v9 = objc_msgSend(v8, "embeddingSize");
  if (v9 >> 62)
    v10 = -1;
  else
    v10 = 4 * v9;
  v11 = operator new[](v10, MEMORY[0x1E0DE4E10]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v8, "embeddingsArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
  if (v12)
  {
    v80 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v92 != v80)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("start"), v77);
        v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&time, v15);
        Seconds = CMTimeGetSeconds(&time);

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("duration"));
        v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v89, v17);
        v18 = CMTimeGetSeconds(&v89);

        v19 = Seconds;
        v20 = v99;
        if (v99 >= v100)
        {
          v22 = (float *)__p;
          v23 = ((char *)v99 - (_BYTE *)__p) >> 2;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62)
            goto LABEL_97;
          v25 = (char *)v100 - (_BYTE *)__p;
          if (((char *)v100 - (_BYTE *)__p) >> 1 > v24)
            v24 = v25 >> 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v100, v26);
            v22 = (float *)__p;
            v20 = v99;
          }
          else
          {
            v27 = 0;
          }
          v28 = (float *)&v27[4 * v23];
          *v28 = v19;
          v21 = v28 + 1;
          while (v20 != v22)
          {
            v29 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v28-- - 1) = v29;
          }
          __p = v28;
          v99 = v21;
          v100 = (float *)&v27[4 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *v99 = v19;
          v21 = v20 + 1;
        }
        v30 = v18;
        v31 = v19 + v30;
        v99 = v21;
        v32 = v96;
        if (v96 >= v97)
        {
          v34 = (float *)v95;
          v35 = ((char *)v96 - (_BYTE *)v95) >> 2;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62)
LABEL_97:
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          v37 = (char *)v97 - (_BYTE *)v95;
          if (((char *)v97 - (_BYTE *)v95) >> 1 > v36)
            v36 = v37 >> 1;
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
            v38 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v38 = v36;
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v97, v38);
            v34 = (float *)v95;
            v32 = v96;
          }
          else
          {
            v39 = 0;
          }
          v40 = (float *)&v39[4 * v35];
          *v40 = v31;
          v33 = v40 + 1;
          while (v32 != v34)
          {
            v41 = *((_DWORD *)v32-- - 1);
            *((_DWORD *)v40-- - 1) = v41;
          }
          v95 = v40;
          v96 = v33;
          v97 = (float *)&v39[4 * v38];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *v96 = v31;
          v33 = v32 + 1;
        }
        v96 = v33;
        bzero(v11, 4 * objc_msgSend(v8, "embeddingSize"));
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("attributes"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("embeddings"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "getBytes:length:", v11, 4 * objc_msgSend(v8, "embeddingSize"));

        v44 = objc_msgSend(v8, "embeddingSize");
        v84 = v11;
        v85 = 1;
        v86 = v44;
        v87 = v44;
        dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix_op<dlib::op_pointer_to_mat<float>>>((uint64_t *)v88, &v84);
        std::vector<dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::push_back[abi:ne180100](&v101, v88);
        if (v88[0])
          MEMORY[0x1BCCA128C](v88[0], 0x1000C8052888210);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    }
    while (v12);
  }

  if (v11)
    MEMORY[0x1BCCA128C](v11, 0x1000C8052888210);
  LODWORD(v88[0]) = 0;
  std::vector<float>::vector(&v84, (v102 - v101) >> 5, v88);
  v45 = (float *)v84;
  if (v102 != v101)
  {
    v46 = (v102 - v101) >> 5;
    v47 = (float *)__p;
    v48 = (float *)v95;
    if (v46 <= 1)
      v46 = 1;
    v49 = (float *)v84;
    do
    {
      v50 = *v47++;
      v51 = v50;
      if (v50 <= a5)
        v51 = a5;
      v52 = *v48++;
      v53 = v52;
      if (v52 >= a6)
        v53 = a6;
      if (v53 <= v51)
        v54 = 0.0;
      else
        v54 = v53 - v51;
      *v49++ = v54;
      --v46;
    }
    while (v46);
  }
  if ((float *)v85 == v45)
  {
    v56 = 0.0;
  }
  else
  {
    v55 = (v85 - (uint64_t)v45) >> 2;
    if (v55 <= 1)
      v55 = 1;
    v56 = 0.0;
    do
    {
      v57 = *v45++;
      v56 = v56 + v57;
      --v55;
    }
    while (v55);
  }
  v81 = 1;
  v82 = objc_msgSend(v8, "embeddingSize", v77);
  v83 = 0;
  dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix_op<dlib::op_uniform_matrix_3<float>>>((uint64_t *)v88, &v81);
  v58 = (float *)v84;
  if ((void *)v85 != v84)
  {
    v59 = 0;
    v60 = 0;
    do
    {
      v61 = v58[v60] / v56;
      v81 = v101 + v59;
      *(float *)&v82 = v61;
      dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::operator+=<dlib::matrix_mul_scal_exp<dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>,true>>((uint64_t *)v88, (float *)&v81);
      ++v60;
      v58 = (float *)v84;
      v59 += 32;
    }
    while (v60 < (v85 - (uint64_t)v84) >> 2);
  }
  v62 = 0;
  *v78 = 0;
  v78[1] = 0;
  v78[2] = 0;
  while (1)
  {
    v63 = objc_msgSend(v8, "embeddingSize");
    v64 = v88[0];
    if (v62 >= v63)
      break;
    v66 = v78[1];
    v65 = (unint64_t)v78[2];
    if ((unint64_t)v66 >= v65)
    {
      v68 = *v78;
      v69 = (v66 - *v78) >> 2;
      v70 = v69 + 1;
      if ((unint64_t)(v69 + 1) >> 62)
        std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
      v71 = v65 - (_QWORD)v68;
      if (v71 >> 1 > v70)
        v70 = v71 >> 1;
      if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL)
        v72 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v72 = v70;
      if (v72)
      {
        v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v78 + 2), v72);
        v68 = *v78;
        v66 = v78[1];
      }
      else
      {
        v73 = 0;
      }
      v74 = &v73[4 * v69];
      *(_DWORD *)v74 = *((_DWORD *)v64 + v62);
      v67 = v74 + 4;
      while (v66 != v68)
      {
        v75 = *((_DWORD *)v66 - 1);
        v66 -= 4;
        *((_DWORD *)v74 - 1) = v75;
        v74 -= 4;
      }
      *v78 = v74;
      v78[1] = v67;
      v78[2] = &v73[4 * v72];
      if (v68)
        operator delete(v68);
    }
    else
    {
      *(_DWORD *)v66 = *((_DWORD *)v88[0] + v62);
      v67 = v66 + 4;
    }
    v78[1] = v67;
    ++v62;
  }
  if (v88[0])
    MEMORY[0x1BCCA128C](v88[0], 0x1000C8052888210);
  if (v84)
  {
    v85 = (uint64_t)v84;
    operator delete(v84);
  }
  if (v95)
  {
    v96 = (float *)v95;
    operator delete(v95);
  }
  if (__p)
  {
    v99 = (float *)__p;
    operator delete(__p);
  }
  v88[0] = (void **)&v101;
  std::vector<dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100](v88);

  return result;
}

- (id)adaptiveEmbeddings
{
  return self->_adaptiveEmbeddings;
}

- (void).cxx_destruct
{
  vector<dlib::matrix<float, 1, 432>, std::allocator<dlib::matrix<float, 1, 432>>> *p_featureArray;

  p_featureArray = &self->_featureArray;
  std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_featureArray);
  objc_storeStrong((id *)&self->_adaptiveEmbeddings, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
