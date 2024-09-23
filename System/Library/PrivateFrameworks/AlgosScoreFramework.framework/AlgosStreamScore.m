@implementation AlgosStreamScore

- (void)addStreamStart:(double)a3 play:(double)a4
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 0, 0, a3, a4, 1.0, 0.0);
}

- (void)dealloc
{
  void *streamData;
  objc_super v4;
  void **v5;

  streamData = self->streamData;
  if (streamData)
  {
    v5 = (void **)self->streamData;
    std::vector<AlgosScoreStreamFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x20BD3126C](streamData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosStreamScore;
  -[AlgosStreamScore dealloc](&v4, sel_dealloc);
}

- (void)addRawStreamEvent:(int)a3 start:(double)a4 end:(double)a5 weight:(double)a6 quality:(double)a7 params:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  _OWORD *v21;
  uint64_t *streamData;
  id v23;
  id v24;
  void *__p[2];
  char v27;
  _QWORD *v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t *v33;
  _QWORD *v34[2];
  void **v35;
  _BYTE v36[128];
  uint64_t v37;

  v12 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v13 = a8;
  v24 = v13;
  if (v12 >= 6)
  {
    v23 = objc_alloc(MEMORY[0x24BDBCE88]);
    objc_exception_throw((id)objc_msgSend(v23, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Not a valid event"), 0, v24));
  }
  v34[0] = 0;
  v34[1] = 0;
  v33 = (uint64_t *)v34;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v36, 16, v24);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v18);
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = objc_msgSend(v19, "cStringUsingEncoding:", 4);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v18), "cStringUsingEncoding:", 4));
        v35 = __p;
        v21 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v33, (const void **)__p, (uint64_t)std::piecewise_construct, (_OWORD **)&v35);
        MEMORY[0x20BD3114C]((char *)v21 + 56, v20);
        if (v27 < 0)
          operator delete(__p[0]);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v15);
  }

  streamData = (uint64_t *)self->streamData;
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(__p, v12, &v33, a4, a5, a6, a7);
  std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](streamData, (AlgosScoreStreamFrameRow *)__p);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v28, v28[1]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v33, v34[0]);

}

- (AlgosStreamScore)init
{
  AlgosStreamScore *v2;
  AlgosStreamScore *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlgosStreamScore;
  v2 = -[AlgosStreamScore init](&v4, sel_init);
  if (!v2)
    return v2;
  result = (AlgosStreamScore *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->streamData = 0;
    result->logisticScale = 0.0;
    v2->streamData = result;
    v2->logisticScale = 7.5;
    -[AlgosStreamScore setMusic:](v2, "setMusic:", 0);
    return v2;
  }
  __break(1u);
  return result;
}

- (void)setMusic:(BOOL)a3
{
  self->_music = a3;
}

+ (id)streamScore
{
  return objc_alloc_init(AlgosStreamScore);
}

- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6 params:(id)a7
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 1, a7, a3, a4, a6, a5);
}

- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
  -[AlgosStreamScore addStreamStall:end:quality:weight:params:](self, "addStreamStall:end:quality:weight:params:", 0, a3, a4, a5, a6);
}

- (void)addStreamStartupStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
  -[AlgosStreamScore addStreamStall:end:quality:weight:params:](self, "addStreamStall:end:quality:weight:params:", &unk_24C3CD188, a3, a4, a5, a6);
}

- (void)addStreamFailure:(double)a3 weight:(double)a4
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 2, 0, a3, a3, a4, 0.0);
}

- (void)addStreamTierSwitch:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 3, 0, a3, a4, a6, a5);
}

- (void)addStreamPenalty:(double)a3 amount:(double)a4
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 4, 0, a3, a3, a4, 0.0);
}

- (void)addStreamEnd:(double)a3
{
  -[AlgosStreamScore addRawStreamEvent:start:end:weight:quality:params:](self, "addRawStreamEvent:start:end:weight:quality:params:", 5, 0, a3, a3, 1.0, 0.0);
}

- (void)clearStreamRows
{
  uint64_t *streamData;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  streamData = (uint64_t *)self->streamData;
  v4 = *streamData;
  v3 = streamData[1];
  if (v3 != *streamData)
  {
    do
    {
      v5 = v3 - 64;
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v3 - 24, *(_QWORD **)(v3 - 16));
      v3 = v5;
    }
    while (v5 != v4);
  }
  streamData[1] = v4;
}

- (double)findTotalTime:(id)a3 debug:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const AlgosScoreStreamFrameRow **streamData;
  const AlgosScoreStreamFrameRow *v8;
  const AlgosScoreStreamFrameRow *v9;
  uint64_t v10;
  char v11;
  double v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  int v21;
  double v22;
  double v23;
  _QWORD *v24[3];
  _BYTE v25[8];
  double v26;
  _QWORD *v27[3];
  _BYTE v28[8];
  double v29;
  _QWORD *v30[3];

  v4 = a4;
  v6 = a3;
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v28, *(const AlgosScoreStreamFrameRow **)self->streamData);
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v25, (const AlgosScoreStreamFrameRow *)(*((_QWORD *)self->streamData + 1) - 64));
  streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
  v8 = *streamData;
  v9 = streamData[1];
  if (*streamData == v9)
  {
    v10 = 0;
    v12 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0.0;
    do
    {
      AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)&v21, v8);
      v13 = v21;
      if (!((v21 != 0) | v11 & 1))
      {
        AlgosScoreStreamFrameRow::operator=((uint64_t)v28, (uint64_t)&v21);
        v11 = 1;
        v13 = v21;
      }
      if (v13 == 5)
      {
        AlgosScoreStreamFrameRow::operator=((uint64_t)v25, (uint64_t)&v21);
        v10 = (v10 + 1);
      }
      else if (v13 == 1)
      {
        v12 = v12 + v23 - v22;
      }
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v24, v24[1]);
      v8 = (const AlgosScoreStreamFrameRow *)((char *)v8 + 64);
    }
    while (v8 != v9);
  }
  v14 = v26 - v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26 - v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("total-duration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("stall-time"));
  v17 = fmax(v14 - v12, 0.1);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("net-time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("end-count"));

  if (v4)
    printf("duration: %1.3f, stall: %1.3f\n", v14, v12);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v30, v30[1]);

  return v17;
}

- (id)scoreStreaming:(id)a3
{
  __CFString *v4;
  void *v5;
  int8x16_t v6;
  const AlgosScoreStreamFrameRow **streamData;
  const AlgosScoreStreamFrameRow *v8;
  const AlgosScoreStreamFrameRow *v9;
  uint64_t v10;
  double v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  std::string *p_p;
  std::string *v19;
  double v20;
  int v21;
  std::string *v22;
  std::string *v23;
  std::string *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  int8x16_t v35;
  _BOOL4 v36;
  int8x16_t v37;
  _BOOL4 v38;
  int8x16_t v39;
  double v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double logisticScale;
  double v48;
  long double v49;
  long double v50;
  double v51;
  long double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int8x16_t v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int8x16_t v71;
  float64x2_t v72;
  void *v73;
  id v75;
  id v76;
  double v77;
  double v78;
  double v79;
  double v80;
  __CFString *v81;
  double v82;
  double v83;
  unsigned int v84;
  uint64_t v85;
  double v86;
  double v87;
  unsigned int v88;
  int8x16_t v89;
  void *v90[2];
  char v91;
  void *v92[2];
  char v93;
  std::string __p;
  unsigned int v95;
  double v96;
  double v97;
  double v98;
  double v99;
  _QWORD *v100[3];
  _QWORD v101[3];
  _QWORD v102[5];

  v102[3] = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (*(_QWORD *)self->streamData == *((_QWORD *)self->streamData + 1))
  {
    v58 = 0;

  }
  else
  {
    if (!v4)
      v4 = CFSTR("no-label");
    v81 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AlgosStreamScore findTotalTime:debug:](self, "findTotalTime:debug:", v5, -[AlgosStreamScore debug](self, "debug"));
    v77 = *(double *)v6.i64;
    streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
    v9 = *streamData;
    v8 = streamData[1];
    if (*streamData != v8)
    {
      v10 = 0;
      v85 = 0;
      v88 = 0;
      v84 = 0;
      v11 = 1.0;
      v12 = 1;
      v6.i64[0] = 0;
      v89 = v6;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      v83 = 0.0;
      v86 = 0.0;
      v87 = 0.0;
      v16 = 0.0;
      while (1)
      {
        AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)&v95, v9);
        v17 = v95;
        if (!-[AlgosStreamScore debug](self, "debug"))
          break;
        AlgosScoreStreamFrameRow::StringForEvent(v17, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        printf("Event: %s", (const char *)p_p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (v100[2])
        {
          AlgosScoreStreamFrameRow::GetParamString((AlgosScoreStreamFrameRow *)&v95, (uint64_t)&__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v19 = &__p;
          else
            v19 = (std::string *)__p.__r_.__value_.__r.__words[0];
          printf(", Params: %s\n", (const char *)v19);
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            break;
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((v12 & 1) == 0)
          {
LABEL_23:
            v20 = v98;
            switch(v17)
            {
              case 1u:
                std::string::basic_string[abi:ne180100]<0>(v92, "startup");
                std::string::basic_string[abi:ne180100]<0>(v90, "false");
                AlgosScoreStreamFrameRow::GetParam((uint64_t)&v95, (const void **)v92, (uint64_t)v90, &__p);
                if (v91 < 0)
                  operator delete(v90[0]);
                if (v93 < 0)
                  operator delete(v92[0]);
                v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v22 = (std::string *)((char *)&__p + HIBYTE(__p.__r_.__value_.__r.__words[2]));
                else
                  v22 = (std::string *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v23 = &__p;
                else
                  v23 = (std::string *)__p.__r_.__value_.__r.__words[0];
                if (v23 != v22)
                {
                  do
                  {
                    v23->__r_.__value_.__s.__data_[0] = __tolower(v23->__r_.__value_.__s.__data_[0]);
                    v23 = (std::string *)((char *)v23 + 1);
                  }
                  while (v23 != v22);
                  v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                }
                v80 = v20;
                if ((v21 & 0x80) != 0)
                {
                  if (__p.__r_.__value_.__l.__size_ != 4)
                    goto LABEL_57;
                  v24 = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_56:
                  v40 = v15;
                  v41 = LODWORD(v24->__r_.__value_.__l.__data_) == 1702195828;
                }
                else
                {
                  if (v21 == 4)
                  {
                    v24 = &__p;
                    goto LABEL_56;
                  }
LABEL_57:
                  v40 = v15;
                  v41 = 0;
                }
                v82 = 0.0;
                v42 = v96;
                if (v14 != 0.0 && (v41 & 1) == 0)
                  v82 = exp((v96 - v14) / -30.0);
                v78 = v16;
                v79 = v40;
                v43 = v97;
                v44 = v99;
                if (-[AlgosStreamScore music](self, "music"))
                  v45 = v11;
                else
                  v45 = v44;
                if (v45 >= 0.5)
                  v46 = v11 - v45 + 0.5;
                else
                  v46 = v11;
                logisticScale = self->logisticScale;
                -[AlgosStreamScore debug](self, "debug");
                v48 = v43 - v42;
                v49 = -(logisticScale - (v82 + 0.2) * logisticScale * 2.0);
                v50 = exp(-(logisticScale - (v82 + 0.2 + v48 / 10.0) * logisticScale * 2.0));
                v51 = log(v50 + 1.0);
                v52 = exp(v49);
                v53 = log(v52 + 1.0);
                if (v41)
                  v54 = 0.0;
                else
                  v54 = (1.0 - v82) * 8.5;
                v55 = v46 * (v51 - v53) * 8.0;
                v56 = v54 + v55;
                if (-[AlgosStreamScore debug](self, "debug"))
                  printf("%1.2f: last_stall: %1.2f, shift: %1.2f, deltat: %1.2f, quality: %1.2f, qfactor: %1.2f, wgt: %1.2f, lscore: %1.2f\n", v96 - v13, v14, v82, v48, v45, v46, v80, v56);
                if (!v41)
                  v14 = v97;
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
                v84 += v41;
                v15 = v79;
                v83 = v83 + v54 * v80;
                v16 = v78 + v55 * v80;
                LODWORD(v85) = v85 + 1;
                v57.i64[1] = v89.i64[1];
                *(double *)v57.i64 = *(double *)v89.i64 + v56 * v80;
                v89 = v57;
                v11 = 1.0;
                goto LABEL_20;
              case 2u:
                v38 = -[AlgosStreamScore debug](self, "debug");
                v39.i64[1] = v89.i64[1];
                *(double *)v39.i64 = *(double *)v89.i64 + v20 * 75.0;
                v89 = v39;
                ++v88;
                v87 = v87 + v20 * 75.0;
                if (v38)
                  printf("Fixed failure penalty: %1.2f\n");
                goto LABEL_20;
              case 3u:
                v25 = v14;
                v26 = v15;
                v27 = v16;
                v29 = v96;
                v28 = v97;
                v30 = v99;
                if (-[AlgosStreamScore music](self, "music"))
                  v30 = 1.0;
                v31 = -[AlgosStreamScore debug](self, "debug");
                v32 = v28 - v29;
                v33 = (v28 - v29) / v77;
                v34 = v20 * (v33 * (1.0 - v30) * 85.0);
                v15 = v26 + v34;
                v35.i64[1] = v89.i64[1];
                *(double *)v35.i64 = *(double *)v89.i64 + v34;
                v89 = v35;
                ++HIDWORD(v85);
                if (v31)
                  printf("%1.2f: quality: %1.2f, deltat: %1.2f, pct: %1.2f%%, dscore: %1.2f, weight: %1.2f\n", v96, v30, v32, v33 * 100.0, v34, v20);
                v16 = v27;
                v14 = v25;
                v11 = 1.0;
                goto LABEL_20;
              case 4u:
                v36 = -[AlgosStreamScore debug](self, "debug");
                v37.i64[1] = v89.i64[1];
                *(double *)v37.i64 = *(double *)v89.i64 + v20;
                v89 = v37;
                v86 = v86 + v20;
                if (v36)
                  printf("Penalty imposed: %1.2f\n");
                goto LABEL_20;
              case 5u:
                if (-[AlgosStreamScore enforceStreamEnd](self, "enforceStreamEnd")
                  && ((uint64_t)(*((_QWORD *)self->streamData + 1) - *(_QWORD *)self->streamData) >> 6) - 1 != v10)
                {
                  v76 = objc_alloc(MEMORY[0x24BDBCE88]);
                  objc_exception_throw((id)objc_msgSend(v76, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("end must be last event"), 0));
                }
                goto LABEL_20;
              default:
                goto LABEL_20;
            }
          }
        }
        else
        {
          putchar(10);
          if ((v12 & 1) == 0)
            goto LABEL_23;
        }
LABEL_18:
        if (v17)
        {
          v75 = objc_alloc(MEMORY[0x24BDBCE88]);
          objc_exception_throw((id)objc_msgSend(v75, "initWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("first event must be a stream-start"), 0));
        }
        v13 = v96;
LABEL_20:
        ++v10;
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v100, v100[1]);
        v12 = 0;
        v9 = (const AlgosScoreStreamFrameRow *)((char *)v9 + 64);
        if (v9 == v8)
          goto LABEL_79;
      }
      if ((v12 & 1) == 0)
        goto LABEL_23;
      goto LABEL_18;
    }
    v85 = 0;
    v84 = 0;
    v88 = 0;
    v16 = 0.0;
    v86 = 0.0;
    v87 = 0.0;
    v83 = 0.0;
    v15 = 0.0;
    v6.i64[0] = 0;
    v89 = v6;
LABEL_79:
    if (-[AlgosStreamScore debug](self, "debug"))
      printf("Uncompressed Score: %f\n", *(double *)v89.i64);
    v59 = log1p(fabs(*(double *)v89.i64) * 0.02);
    v60 = log1p(0.02);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v85);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("stall-count"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v84);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("startup-stalls"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v88);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("failures"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v87);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("failure-penalty"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(v85));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("tier-switches"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v86);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("direct-penalty"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v83);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("stall-boost-penalty"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("stall-penalty"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("quality-penalty"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("streaming"), CFSTR("type"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AlgosStreamScore music](self, "music"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("music"));

    *(double *)v71.i64 = v59 / v60;
    v72.f64[0] = NAN;
    v72.f64[1] = NAN;
    v101[0] = CFSTR("score");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)vbslq_s8((int8x16_t)vnegq_f64(v72), v71, v89).i64);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v73;
    v102[1] = v81;
    v101[1] = CFSTR("label");
    v101[2] = CFSTR("stats");
    v102[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v58;
}

- (BOOL)saveEventsToFile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  std::string *v8;
  std::string::size_type size;
  void *v10;
  const AlgosScoreStreamFrameRow **streamData;
  const AlgosScoreStreamFrameRow *v12;
  const AlgosScoreStreamFrameRow *v13;
  void **v14;
  unint64_t v15;
  void *v16;
  char v17;
  BOOL v18;
  void *__p[2];
  unsigned __int8 v21;
  _BYTE v22[40];
  _QWORD *v23[3];
  std::string v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4, 0, 0);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      AlgosScoreStreamFrameRow::GetCSVHeader((AlgosScoreStreamFrameRow *)1, &v24);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v8 = &v24;
      else
        v8 = (std::string *)v24.__r_.__value_.__r.__words[0];
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
      else
        size = v24.__r_.__value_.__l.__size_;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, size, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeData:error:", v10, 0);

      streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
      v12 = *streamData;
      v13 = streamData[1];
      if (*streamData == v13)
      {
LABEL_20:
        objc_msgSend(v7, "closeFile");
        v18 = 1;
      }
      else
      {
        while (1)
        {
          AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v22, v12);
          AlgosScoreStreamFrameRow::GetCSVRow((AlgosScoreStreamFrameRow *)v22, 1, __p);
          if ((v21 & 0x80u) == 0)
            v14 = __p;
          else
            v14 = (void **)__p[0];
          if ((v21 & 0x80u) == 0)
            v15 = v21;
          else
            v15 = (unint64_t)__p[1];
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v7, "writeData:error:", v16, 0);

          if ((char)v21 < 0)
            operator delete(__p[0]);
          std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v23, v23[1]);
          if ((v17 & 1) == 0)
            break;
          v12 = (const AlgosScoreStreamFrameRow *)((char *)v12 + 64);
          if (v12 == v13)
            goto LABEL_20;
        }
        v18 = 0;
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)restoreEventsFromFile:(id)a3 clear:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  uint64_t *streamData;
  BOOL v18;
  void *v20;
  id v21;
  void *__p[2];
  char v23;
  _BYTE v24[40];
  _QWORD *v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  if (v4)
    -[AlgosStreamScore clearStreamRows](self, "clearStreamRows");
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingAtPath:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "readDataUpToLength:error:", 0x200000, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v10 = (void *)v8;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("\n"));
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v27;
        v14 = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (!((objc_msgSend(v16, "length") == 0) | v14 & 1))
            {
              streamData = (uint64_t *)self->streamData;
              std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v16), "cStringUsingEncoding:", 4));
              AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(v24, __p);
              std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](streamData, (AlgosScoreStreamFrameRow *)v24);
              std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v25, v25[1]);
              if (v23 < 0)
                operator delete(__p[0]);
            }
            v14 = 0;
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v14 = 0;
        }
        while (v12);
      }

      v9 = v10;
      objc_msgSend(v7, "closeFile");
      v18 = 1;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)enforceStreamEnd
{
  return self->_enforceStreamEnd;
}

- (void)setEnforceStreamEnd:(BOOL)a3
{
  self->_enforceStreamEnd = a3;
}

- (BOOL)music
{
  return self->_music;
}

@end
