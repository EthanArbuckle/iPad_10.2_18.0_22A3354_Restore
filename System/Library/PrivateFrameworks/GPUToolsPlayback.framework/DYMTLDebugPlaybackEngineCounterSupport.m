@implementation DYMTLDebugPlaybackEngineCounterSupport

- (DYMTLDebugPlaybackEngineCounterSupport)initWithPlaybackEngine:(id)a3
{
  id v4;
  DYMTLDebugPlaybackEngineCounterSupport *v5;
  DYMTLDebugPlaybackEngineCounterSupport *v6;
  id v7;
  void *v8;
  DYMTLDebugPlaybackEngineCounterSupport *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DYMTLDebugPlaybackEngineCounterSupport;
  v5 = -[DYMTLDebugPlaybackEngineCounterSupport init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engine, v4);
    v6->_loopCount = 1;
    v7 = MTLCreateSystemDefaultDevice();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isAGXDevice = objc_msgSend(v8, "compare:", CFSTR("Unknown Unknown")) == 0;

    v9 = v6;
  }

  return v6;
}

- (void)_setupPState
{
  void *v3;
  uint64_t v4;
  DYPlaybackEngine **p_engine;
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("GPUFrameProfilingPowerStateWarmupTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = 500;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "integerForKey:", CFSTR("GPUFrameProfilingPowerStateWarmupTime"));

  if (v4 >= 1)
  {
LABEL_5:
    p_engine = &self->_engine;
    WeakRetained = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(WeakRetained, "setLoopTimeLimit:", 1000000 * v4);

    v9 = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(v9, "setPlaybackMode:", 5);

    v10 = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(v10, "playbackToFunction:withLoops:", 0, 0xFFFFFFFFLL);

  }
}

- (BOOL)_computeAverageForFrameProfile:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6 forEncoders:(BOOL)a7
{
  id v11;
  id v12;
  id WeakRetained;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  unint64_t v29;
  char *v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  _QWORD *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  unint64_t v61;
  _QWORD v62[3];
  void **v63;

  v11 = a5;
  v12 = a6;
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1)
    || ((WeakRetained = objc_loadWeakRetained((id *)&self->_engine),
         v14 = objc_msgSend(WeakRetained, "numIterationsInLastPlayback"),
         v15 = v14,
         v14 <= 1)
      ? (v16 = 1)
      : (v16 = v14),
        WeakRetained,
        v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4),
        v18 = v17 / v16,
        v17 % v16))
  {
    v19 = 0;
  }
  else
  {
    v61 = v16;
    std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::resize((uint64_t)a3, v17 / v16);
    v21 = **(_QWORD **)a4;
    if (v15 > 1)
    {
      v59 = v12;
      v60 = v11;
      std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,std::vector<unsigned long long>,std::vector<unsigned long long>>>::vector(v62, v18);
      v25 = *(uint64_t **)a4;
      if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
      {
        v26 = 0;
        do
        {
          v27 = (_QWORD *)(v62[0] + 80 * (v26 % v18));
          v28 = &v25[6 * v26];
          if (v26 < v18)
          {
            *v27 = *v28 - v21;
            v27[1] = v28[1];
            v27[2] = v28[2];
            v27[3] = v28[3];
          }
          v29 = v27[6];
          v30 = (char *)v27[5];
          if ((unint64_t)v30 >= v29)
          {
            v32 = (char *)v27[4];
            v33 = (v30 - v32) >> 3;
            if ((unint64_t)(v33 + 1) >> 61)
              goto LABEL_65;
            v34 = v29 - (_QWORD)v32;
            v35 = (uint64_t)(v29 - (_QWORD)v32) >> 2;
            if (v35 <= v33 + 1)
              v35 = v33 + 1;
            if (v34 >= 0x7FFFFFFFFFFFFFF8)
              v36 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v36 = v35;
            if (v36)
            {
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(v27 + 6), v36);
              v32 = (char *)v27[4];
              v30 = (char *)v27[5];
            }
            else
            {
              v37 = 0;
            }
            v38 = &v37[8 * v33];
            *(_QWORD *)v38 = v28[4];
            v31 = v38 + 8;
            while (v30 != v32)
            {
              v39 = *((_QWORD *)v30 - 1);
              v30 -= 8;
              *((_QWORD *)v38 - 1) = v39;
              v38 -= 8;
            }
            v27[4] = v38;
            v27[5] = v31;
            v27[6] = &v37[8 * v36];
            if (v32)
              operator delete(v32);
          }
          else
          {
            *(_QWORD *)v30 = v28[4];
            v31 = v30 + 8;
          }
          v27[5] = v31;
          if (self->_isAGXDevice)
          {
            v40 = v27[9];
            v41 = (char *)v27[8];
            if ((unint64_t)v41 >= v40)
            {
              v43 = (char *)v27[7];
              v44 = (v41 - v43) >> 3;
              if ((unint64_t)(v44 + 1) >> 61)
LABEL_65:
                std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
              v45 = v40 - (_QWORD)v43;
              v46 = (uint64_t)(v40 - (_QWORD)v43) >> 2;
              if (v46 <= v44 + 1)
                v46 = v44 + 1;
              if (v45 >= 0x7FFFFFFFFFFFFFF8)
                v47 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v47 = v46;
              if (v47)
              {
                v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(v27 + 9), v47);
                v43 = (char *)v27[7];
                v41 = (char *)v27[8];
              }
              else
              {
                v48 = 0;
              }
              v49 = &v48[8 * v44];
              *(_QWORD *)v49 = v28[5];
              v42 = v49 + 8;
              while (v41 != v43)
              {
                v50 = *((_QWORD *)v41 - 1);
                v41 -= 8;
                *((_QWORD *)v49 - 1) = v50;
                v49 -= 8;
              }
              v27[7] = v49;
              v27[8] = v42;
              v27[9] = &v48[8 * v47];
              if (v43)
                operator delete(v43);
            }
            else
            {
              *(_QWORD *)v41 = v28[5];
              v42 = v41 + 8;
            }
            v27[8] = v42;
          }
          ++v26;
          v25 = *(uint64_t **)a4;
        }
        while (v26 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4));
      }
      if (v17 >= v61)
      {
        v51 = 0;
        if (v18 <= 1)
          v52 = 1;
        else
          v52 = v18;
        v53 = 56;
        do
        {
          v54 = *(_QWORD *)a3;
          v55 = (_QWORD *)(*(_QWORD *)a3 + v51);
          v56 = v62[0];
          v57 = v62[0] + v53;
          *v55 = *(_QWORD *)(v62[0] + v53 - 56);
          v55[1] = *(_QWORD *)(v57 - 48);
          v55[2] = *(_QWORD *)(v57 - 40);
          v55[3] = *(_QWORD *)(v57 - 32);
          if (self->_isAGXDevice)
          else
            v58 = 0;
          *(_QWORD *)(v54 + v51 + 40) = v58;
          v51 += 48;
          v53 += 80;
          --v52;
        }
        while (v52);
      }
      v63 = (void **)v62;
      std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,std::vector<unsigned long long>,std::vector<unsigned long long>>>::__destroy_vector::operator()[abi:ne180100](&v63);
      v19 = 1;
      v12 = v59;
      v11 = v60;
    }
    else
    {
      if (v17 >= v61)
      {
        if (v18 <= 1)
          v22 = 1;
        else
          v22 = v18;
        v23 = (_QWORD *)(*(_QWORD *)a4 + 24);
        v24 = (_QWORD *)(*(_QWORD *)a3 + 24);
        do
        {
          *(v24 - 3) = *(v23 - 3) - v21;
          *(v24 - 2) = *(v23 - 2);
          *(v24 - 1) = *(v23 - 1);
          *v24 = *v23;
          v24[1] = v23[1];
          v24[2] = v23[2];
          v23 += 6;
          v24 += 6;
          --v22;
        }
        while (v22);
      }
      v19 = 1;
    }
  }

  return v19;
}

- (void)_clearData
{
  self->_commandBufferFrameProfilesInfo.__end_ = self->_commandBufferFrameProfilesInfo.__begin_;
  self->_commandBufferFrameProfiles.__end_ = self->_commandBufferFrameProfiles.__begin_;
  self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
}

- (id)profileFrameWithPayload:(id)a3
{
  id v4;
  unsigned int loopCount;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t i;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableDictionary *v46;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  DYMTLDebugPlaybackEngineCounterSupport *v56;
  void *v57;
  NSMutableDictionary *frameProfiling;
  void *v59;

  v4 = a3;
  -[DYMTLDebugPlaybackEngineCounterSupport _setupPState](self, "_setupPState");
  loopCount = self->_loopCount;
  self->_loopCount = 15;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableStatsSampling:", 1);

  v8 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupCounterConfigurationAndGetFrameProfilerCounters");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v11 = (void *)objc_msgSend(v4, "mutableCopy");
  else
    v11 = (void *)objc_opt_new();
  v12 = v11;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE396C0]);
  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:](self, "_profileFrameWithCounterListsForProfileInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE39270];
  v51 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE39270]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v15, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enableStatsSampling:", 1);

  v17 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v17, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sampleEncoderCounters");

  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:encoderPass:](self, "_profileFrameWithCounterListsForProfileInfo:encoderPass:", v12, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v19, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "enableStatsSampling:", 0);
  v49 = v12;
  v50 = v4;
  v52 = (void *)v10;

  objc_msgSend(v53, "objectForKeyedSubscript:", v14);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  self->_loopCount = loopCount;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v55, "count");
  if (v22 == objc_msgSend(v54, "count"))
  {
    v23 = 0;
    v56 = self;
LABEL_6:
    if (v23 >= objc_msgSend(v55, "count"))
    {
      -[DYMTLDebugPlaybackEngineCounterSupport addCounters:](self, "addCounters:", v52);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameProfiling, "setObject:forKeyedSubscript:", v21, CFSTR("frame profile data"));
      v46 = self->_frameProfiling;
      frameProfiling = self->_frameProfiling;
      self->_frameProfiling = 0;

    }
    else
    {
      objc_msgSend(v55, "objectAtIndexedSubscript:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      v48 = v25;
      objc_msgSend(v54, "objectAtIndexedSubscript:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v26;
      v27 = objc_msgSend(v26, "count");
      if (v27 == objc_msgSend(v59, "count"))
      {
        for (i = 0; ; ++i)
        {
          if (i >= objc_msgSend(v57, "count"))
          {

            v23 = v48 + 1;
            goto LABEL_6;
          }
          objc_msgSend(v57, "objectAtIndexedSubscript:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", i);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "count") != 1)
            break;
          v31 = 0;
          for (j = 0; j < objc_msgSend(v29, "count"); ++j)
          {
            objc_msgSend(v29, "objectAtIndexedSubscript:", j);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectAtIndexedSubscript:", 3);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v31 += objc_msgSend(v34, "unsignedLongLongValue");

          }
          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "unsignedLongLongValue");

          v38 = 0;
          v39 = (double)v37;
          while (v38 < objc_msgSend(v29, "count"))
          {
            if (v31)
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectAtIndexedSubscript:", 3);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = (unint64_t)(v39
                                     * (double)(unint64_t)objc_msgSend(v41, "unsignedLongLongValue")
                                     / (double)v31);

            }
            else
            {
              v42 = 0;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", v38);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:atIndexedSubscript:", v43, 3);

            objc_msgSend(v29, "objectAtIndexedSubscript:", v38);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObjectsFromArray:", v45);

            ++v38;
          }

          self = v56;
        }

      }
      v46 = 0;

    }
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (void)addCommandBufferFrameProfile:(const void *)a3
{
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::back_insert_iterator<std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>,0>(*(__int128 **)a3, *((__int128 **)a3 + 1), &self->_commandBufferFrameProfilesInfo.__begin_);
}

- (BOOL)_FixSplitEncoderSamples:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6
{
  char *v6;
  char *v7;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v6 = *(char **)a4;
  v7 = (char *)*((_QWORD *)a4 + 1);
  if (*(char **)a4 != v7)
  {
    std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::resize((uint64_t)a3, 0xAAAAAAAAAAAAAAABLL * ((v7 - v6) >> 4));
    v11 = *(char **)a4;
    v10 = *((_QWORD *)a4 + 1);
    v12 = v10 - *(_QWORD *)a4;
    if (v10 != *(_QWORD *)a4)
    {
      v13 = 0;
      v14 = 0;
      v17 = *(_QWORD *)v11;
      v16 = v11 + 24;
      v15 = v17;
      v18 = v12 / 48;
      if (v18 <= 1)
        v18 = 1;
      v19 = (_QWORD *)(*(_QWORD *)a3 + 24);
      v20 = -1;
      do
      {
        v21 = *(v16 - 3) - v15;
        *(v19 - 3) = v21;
        v22 = *(v16 - 2);
        v23 = *(v16 - 1);
        if (v22 > v20)
          ++v14;
        if (v21 > v13)
          v14 = 0;
        *(v19 - 2) = v22;
        *(v19 - 1) = v14;
        *v19 = v23;
        v19[1] = *v16;
        v19[2] = v16[1];
        v19[3] = v16[2];
        v19 += 7;
        v16 += 6;
        v13 = v21;
        v20 = v22;
        --v18;
      }
      while (v18);
    }
  }
  return v6 != v7;
}

- (id)_profileSplitEncodersForProfileInfo:(id)a3
{
  DYPlaybackEngine **p_engine;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  vector<std::tuple<unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long>, std::allocator<std::tuple<unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long>>> *p_commandBufferFrameProfilesPerDMDrawCallInfo;
  __compressed_pair<std::tuple<unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long> *, std::allocator<std::tuple<unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long>>> *p_end_cap;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t *begin;
  uint64_t *end;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  _OWORD *v30;
  _QWORD *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  unint64_t *v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *j;
  __int128 v54;
  _QWORD *v55;
  _QWORD *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t m;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  uint64_t v85;
  void *v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  void **v90;
  unint64_t ii;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  _QWORD **v100;
  _QWORD *v101;
  _QWORD **v102;
  BOOL v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  _QWORD *v132;
  _QWORD **v133;
  id v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t jj;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  uint64_t kk;
  double v146;
  void *v147;
  void *v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  char *v159;
  void *v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  void *v164;
  id obj;
  id obja;
  id objb;
  uint64_t v168;
  void *v169;
  void *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  void *__p;
  _QWORD *v195;
  uint64_t v196;
  __int128 *v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _QWORD v200[2];
  _QWORD v201[2];
  _QWORD v202[2];
  _QWORD v203[2];
  _BYTE v204[128];
  _BYTE v205[128];
  uint64_t v206;

  v206 = *MEMORY[0x24BDAC8D0];
  v151 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = v6;
  objc_msgSend(v6, "enableStatsSampling:", 1);
  objc_msgSend(v6, "sampleSplitEncoderCounters");
  objc_msgSend(v6, "setupProfileInfo:", v151);
  -[DYMTLDebugPlaybackEngineCounterSupport _clearData](self, "_clearData");
  v7 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v7, "setPlaybackMode:", 9);

  objc_msgSend(v151, "objectForKeyedSubscript:", *MEMORY[0x24BE396C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "counterInfo:", v8);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v9, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setupProfilingForCounterLists");

  objc_msgSend(v150, "objectForKeyedSubscript:", *MEMORY[0x24BE395D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v11, "unsignedIntegerValue");

  v161 = *MEMORY[0x24BE39310];
  objc_msgSend(v150, "objectForKeyedSubscript:");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)*MEMORY[0x24BE39308];
  objc_msgSend(v150, "objectForKeyedSubscript:");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    v12 = 0;
    for (i = 0; i != v162; ++i)
    {
      objc_msgSend(v170, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += objc_msgSend(v14, "count");

    }
  }
  else
  {
    v12 = 0;
  }
  if (self->_isAGXDevice)
  {
    v15 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v15, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enableConsistentState:", 1);

  }
  if (v162)
  {
    v17 = 0;
    p_commandBufferFrameProfilesPerDMDrawCallInfo = &self->_commandBufferFrameProfilesPerDMDrawCallInfo;
    p_end_cap = &self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_;
    while (1)
    {
      v168 = v17;
      if ((objc_msgSend(v156, "setupProfilingForListAtIndex:") & 1) == 0)
        break;
      v20 = objc_loadWeakRetained((id *)p_engine);
      objc_msgSend(v20, "setPlaybackMode:", 9);

      v21 = objc_loadWeakRetained((id *)p_engine);
      objc_msgSend(v21, "playbackToFunction:withLoops:", 0, self->_loopCount);

      v22 = (void *)objc_opt_new();
      objc_msgSend(v150, "objectForKeyedSubscript:", obj);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v168);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v161);

      begin = (uint64_t *)self->_commandBufferFrameProfilesInfo.__begin_;
      end = (uint64_t *)self->_commandBufferFrameProfilesInfo.__end_;
      v27 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 4));
      if (end == begin)
        v28 = 0;
      else
        v28 = v27;
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)begin, end, (uint64_t)&v190, v28, 1);
      __p = 0;
      v195 = 0;
      v196 = 0;
      v29 = -[DYMTLDebugPlaybackEngineCounterSupport _FixSplitEncoderSamples:forProfile:withInfo:andUpdatedCounterInfo:](self, "_FixSplitEncoderSamples:forProfile:withInfo:andUpdatedCounterInfo:", &__p, &self->_commandBufferFrameProfilesInfo, v151, v22);
      v30 = __p;
      if (!v29)
      {
        if (__p)
        {
          v195 = __p;
          operator delete(__p);
        }

        break;
      }
      v31 = v195;
      if (__p != v195)
      {
        v32 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
        do
        {
          v190 = *v30;
          v191 = v30[1];
          v192 = v30[2];
          v193 = *((_QWORD *)v30 + 6);
          if (v32 >= p_end_cap->__value_)
          {
            v36 = 0x6DB6DB6DB6DB6DB7 * ((v32 - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3);
            v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) > 0x492492492492492)
              std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
            if (0xDB6DB6DB6DB6DB6ELL
               * (((char *)p_end_cap->__value_ - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3) > v37)
              v37 = 0xDB6DB6DB6DB6DB6ELL
                  * (((char *)p_end_cap->__value_ - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7
                                  * (((char *)p_end_cap->__value_
                                    - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3)) >= 0x249249249249249)
              v38 = 0x492492492492492;
            else
              v38 = v37;
            if (v38)
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_, v38);
            else
              v39 = 0;
            v40 = &v39[56 * v36];
            *(_OWORD *)v40 = v190;
            *((_OWORD *)v40 + 1) = v191;
            *((_OWORD *)v40 + 2) = v192;
            *((_QWORD *)v40 + 6) = v193;
            v42 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
            v41 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
            v43 = v40;
            if (v41 != v42)
            {
              do
              {
                v44 = *(_OWORD *)(v41 - 56);
                v45 = *(_OWORD *)(v41 - 40);
                v46 = *(_OWORD *)(v41 - 24);
                *((_QWORD *)v43 - 1) = *((_QWORD *)v41 - 1);
                *(_OWORD *)(v43 - 24) = v46;
                *(_OWORD *)(v43 - 40) = v45;
                *(_OWORD *)(v43 - 56) = v44;
                v43 -= 56;
                v41 -= 56;
              }
              while (v41 != v42);
              v41 = (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_;
            }
            v32 = v40 + 56;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_ = v43;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v40 + 56;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_.__value_ = &v39[56 * v38];
            if (v41)
              operator delete(v41);
          }
          else
          {
            v33 = *v30;
            v34 = v30[1];
            v35 = v30[2];
            *((_QWORD *)v32 + 6) = *((_QWORD *)v30 + 6);
            *((_OWORD *)v32 + 1) = v34;
            *((_OWORD *)v32 + 2) = v35;
            *(_OWORD *)v32 = v33;
            v32 += 56;
          }
          self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v32;
          v30 = (_OWORD *)((char *)v30 + 56);
        }
        while (v30 != (_OWORD *)v31);
        v30 = __p;
        p_engine = &self->_engine;
      }
      self->_commandBufferFrameProfilesInfo.__end_ = self->_commandBufferFrameProfilesInfo.__begin_;
      if (v30)
      {
        v195 = v30;
        operator delete(v30);
      }

      v17 = v168 + 1;
      if (v168 + 1 == v162)
        goto LABEL_38;
    }
    v134 = 0;
  }
  else
  {
LABEL_38:
    objc_msgSend(v156, "stopFrameProfiling");
    v47 = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(v47, "setPlaybackMode:", 0);

    v48 = (unint64_t *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
    v49 = (unint64_t *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
    v50 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v49 - v48));
    if (v49 == v48)
      v51 = 0;
    else
      v51 = v50;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)v48, v49, (uint64_t)&v190, v51, 1);
    objc_msgSend(v156, "enableStatsSampling:", 0);
    v195 = 0;
    v196 = 0;
    __p = &v195;
    v52 = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
    for (j = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_; v52 != j; v52 = (_OWORD *)((char *)v52 + 56))
    {
      v54 = v52[1];
      v190 = *v52;
      v191 = v54;
      v55 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&__p, &v190);
      if (&v195 == v55)
      {
        v187 = 0uLL;
        std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v188, v12, &v187);
        v197 = &v190;
        v56 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::__emplace_unique_key_args<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long> const&>,std::tuple<>>((uint64_t **)&__p, &v190, (uint64_t)&std::piecewise_construct, &v197);
        v57 = (void *)v56[8];
        if (v57)
        {
          v56[9] = v57;
          operator delete(v57);
          v56[8] = 0;
          v56[9] = 0;
          v56[10] = 0;
        }
        *((_OWORD *)v56 + 4) = v188;
        v56[10] = v189;
        v55 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&__p, &v190);
      }
      *(_OWORD *)(v55[8] + 16 * *((_QWORD *)v52 + 4)) = *(_OWORD *)((char *)v52 + 40);
    }
    v169 = (void *)objc_opt_new();
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    obja = v149;
    v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
    if (v58)
    {
      v59 = 0;
      v60 = *(_QWORD *)v184;
      do
      {
        for (k = 0; k != v58; ++k)
        {
          if (*(_QWORD *)v184 != v60)
            objc_enumerationMutation(obja);
          v62 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v59 + k);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "setObject:forKeyedSubscript:", v63, v62);

        }
        v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
        v59 += k;
      }
      while (v58);
    }

    if (v162)
    {
      v64 = (void *)objc_opt_new();
      if (v162 >= 2)
      {
        objc_msgSend(v170, "objectAtIndexedSubscript:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "count");
        objc_msgSend(v170, "objectAtIndexedSubscript:", 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "count");
        v69 = v68 >= v66 ? v66 : v68;

        if (v69)
        {
          for (m = 0; m != v69; ++m)
          {
            objc_msgSend(v170, "objectAtIndexedSubscript:", 0);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "objectAtIndexedSubscript:", m);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "objectAtIndexedSubscript:", 1);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectAtIndexedSubscript:", m);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v72, "isEqualToString:", v74);

            if (v75)
            {
              objc_msgSend(v170, "objectAtIndexedSubscript:", 0);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "objectAtIndexedSubscript:", m);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v77);

            }
          }
        }
      }
      v190 = 0u;
      v191 = 0u;
      LODWORD(v192) = 1065353216;
      v78 = (void *)objc_opt_new();
      v79 = 0;
      *(_QWORD *)&v188 = 0;
      v80 = v162;
      if (v162 <= 1)
        v80 = 1;
      v163 = v80;
      do
      {
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        objc_msgSend(v170, "objectAtIndexedSubscript:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v179, v204, 16);
        if (v82)
        {
          v83 = *(_QWORD *)v180;
          do
          {
            for (n = 0; n != v82; ++n)
            {
              if (*(_QWORD *)v180 != v83)
                objc_enumerationMutation(v81);
              v85 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * n);
              if (v79
                && objc_msgSend(v64, "containsObject:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * n)))
              {
                std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v190, (unint64_t *)&v188, &v188);
              }
              *(_QWORD *)&v188 = v188 + 1;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "setObject:forKeyedSubscript:", v85, v86);

            }
            v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v179, v204, 16);
          }
          while (v82);
        }

        ++v79;
      }
      while (v79 != v163);
      v87 = (char *)__p;
      if (__p != &v195)
      {
        do
        {
          v88 = objc_msgSend(obja, "count");
          v187 = 0uLL;
          std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v188, v88, &v187);
          v89 = 0;
          v159 = v87;
          v90 = (void **)(v87 + 64);
          *(_QWORD *)&v187 = 0;
          do
          {
            for (ii = 0; ; ++ii)
            {
              objc_msgSend(v170, "objectAtIndexedSubscript:", v89);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = ii < objc_msgSend(v92, "count");

              if (!v93)
                break;
              if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v190, (unint64_t *)&v187))
              {
                *(_QWORD *)&v187 = v187 + 1;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (_QWORD)v187);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "objectForKeyedSubscript:", v94);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "objectForKeyedSubscript:", v95);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = objc_msgSend(v96, "unsignedIntegerValue");

                v98 = v187;
                *(_QWORD *)&v187 = v187 + 1;
                *(_OWORD *)(v188 + 16 * v97) = *((_OWORD *)*v90 + v98);
              }
            }
            ++v89;
          }
          while (v89 != v163);
          v99 = *v90;
          v100 = (_QWORD **)v159;
          if (*v90)
          {
            *((_QWORD *)v159 + 9) = v99;
            operator delete(v99);
            *v90 = 0;
            v90[1] = 0;
            v90[2] = 0;
          }
          *((_OWORD *)v159 + 4) = v188;
          *((_QWORD *)v159 + 10) = v189;
          v101 = (_QWORD *)*((_QWORD *)v159 + 1);
          if (v101)
          {
            do
            {
              v102 = (_QWORD **)v101;
              v101 = (_QWORD *)*v101;
            }
            while (v101);
          }
          else
          {
            do
            {
              v102 = (_QWORD **)v100[2];
              v103 = *v102 == v100;
              v100 = v102;
            }
            while (!v103);
          }
          v87 = (char *)v102;
        }
        while (v102 != &v195);
      }

      std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v190);
    }
    objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("MTLStatCommandBufferIndex"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v104, "unsignedIntegerValue");

    objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("MTLStatEncoderIndex"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v105, "unsignedIntegerValue");

    objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("MTLStatCommandIndex"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v106, "unsignedIntegerValue");

    objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("MTLStat_nSec"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v107, "unsignedIntegerValue");

    v160 = (void *)objc_opt_new();
    v158 = (void *)objc_opt_new();
    v108 = __p;
    if (__p == &v195)
    {
      v164 = 0;
      objb = 0;
    }
    else
    {
      v164 = 0;
      objb = 0;
      v109 = -1;
      v157 = -1;
      do
      {
        v110 = v108[4];
        if (v110 != v157)
        {
          v111 = objc_opt_new();

          objc_msgSend(v160, "addObject:", v111);
          v109 = -1;
          v157 = v110;
          v164 = (void *)v111;
        }
        v112 = v108[5];
        if (v112 != v109)
        {
          v113 = objc_opt_new();

          v114 = (void *)objc_opt_new();
          objc_msgSend(v158, "addObject:", v114);

          objb = (id)v113;
          objc_msgSend(v164, "addObject:", v113);
          v109 = v112;
        }
        v115 = (void *)objc_opt_new();
        v116 = (_QWORD *)v108[8];
        v117 = (_QWORD *)v108[9];
        while (v116 != v117)
        {
          v118 = v116[1];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *v116);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v203[0] = v119;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v118);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v203[1] = v120;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v203, 2);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "addObject:", v121);

          v116 += 2;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v160, "count") - 1);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v202[0] = v122;
        v202[1] = &unk_250D7C6E0;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v202, 2);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setObject:atIndexedSubscript:", v123, v155);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v164, "count") - 1);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v201[0] = v124;
        v201[1] = &unk_250D7C6E0;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v201, 2);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setObject:atIndexedSubscript:", v125, v154);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(objb, "count"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v200[0] = v126;
        v200[1] = &unk_250D7C6E0;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v200, 2);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setObject:atIndexedSubscript:", v127, v153);

        objc_msgSend(v158, "lastObject");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "objectAtIndexedSubscript:", v152);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectAtIndexedSubscript:", 0);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v130);

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v115);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objb, "addObject:", v131);

        v132 = (_QWORD *)v108[1];
        if (v132)
        {
          do
          {
            v133 = (_QWORD **)v132;
            v132 = (_QWORD *)*v132;
          }
          while (v132);
        }
        else
        {
          do
          {
            v133 = (_QWORD **)v108[2];
            v103 = *v133 == v108;
            v108 = v133;
          }
          while (!v103);
        }
        v108 = v133;
      }
      while (v133 != &v195);
    }
    v135 = (void *)objc_opt_new();
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v136 = v158;
    v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
    if (v137)
    {
      v138 = *(_QWORD *)v176;
      do
      {
        for (jj = 0; jj != v137; ++jj)
        {
          if (*(_QWORD *)v176 != v138)
            objc_enumerationMutation(v136);
          v140 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * jj);
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v174 = 0u;
          v141 = v140;
          v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
          if (v142)
          {
            v143 = *(_QWORD *)v172;
            v144 = 0.0;
            do
            {
              for (kk = 0; kk != v142; ++kk)
              {
                if (*(_QWORD *)v172 != v143)
                  objc_enumerationMutation(v141);
                objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * kk), "doubleValue");
                v144 = v144 + v146;
              }
              v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
            }
            while (v142);
          }
          else
          {
            v144 = 0.0;
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v144);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "addObject:", v147);

        }
        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
      }
      while (v137);
    }

    objc_msgSend(v150, "setObject:forKeyedSubscript:", v160, *MEMORY[0x24BE39270]);
    objc_msgSend(v150, "setObject:forKeyedSubscript:", v135, CFSTR("PerDrawNsecTimes"));
    v134 = v150;

    std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::destroy((uint64_t)&__p, v195);
  }

  return v134;
}

- (void)createBatchIdFilterMapping
{
  DYPlaybackEngine **p_engine;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;

  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableStatsSampling:", 1);

  v6 = objc_loadWeakRetained((id *)p_engine);
  objc_msgSend(v6, "setPlaybackMode:", 12);

  v7 = objc_loadWeakRetained((id *)p_engine);
  objc_msgSend(v7, "playbackToFunction:withLoops:", 0, 1);

  v8 = objc_loadWeakRetained((id *)p_engine);
  objc_msgSend(v8, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableStatsSampling:", 0);

  v9 = objc_loadWeakRetained((id *)p_engine);
  objc_msgSend(v9, "setPlaybackMode:", 0);

}

- (id)profileEncodersForProfileInfo:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  unsigned int loopCount;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  DYMTLDebugPlaybackEngineCounterSupport *v64;
  id obj;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  id v75;
  uint64_t v76;
  int v77;
  unsigned int v78;
  void *v79;
  int v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  -[DYMTLDebugPlaybackEngineCounterSupport _setupPState](self, "_setupPState");
  v64 = self;
  self = (DYMTLDebugPlaybackEngineCounterSupport *)((char *)self + 88);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableStatsSampling:", 1);

  v6 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleEncoderCounters");

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MTLStatCommandBufferIndex"), CFSTR("MTLStatEncoderIndex"), CFSTR("MTLStatCommandIndex"), CFSTR("MTLStat_nSec"), CFSTR("MTLStatTotalGPUCycles"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v8, "mutableCopy");

  v9 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v9, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v10;
  if ((objc_msgSend(v10, "isCounterAvailable:", CFSTR("SW_PBUsed")) & 1) != 0)
  {
    v11 = CFSTR("SW_PBUsed");
  }
  else
  {
    if (!objc_msgSend(v10, "isCounterAvailable:", CFSTR("_fedf2c59")))
    {
      v77 = 0;
      goto LABEL_7;
    }
    v11 = CFSTR("_fedf2c59");
  }
  objc_msgSend(v62, "addObject:", v11);
  v77 = 1;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setValue:forKey:", v62, *MEMORY[0x24BE396C0]);
  loopCount = v64->_loopCount;
  v64->_loopCount = 1;
  if (v64->_isAGXDevice)
  {
    objc_msgSend(v61, "objectForKeyedSubscript:", *MEMORY[0x24BE39738]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v16 = floor(v15);
      v17 = (v16 * 100.0);
      v18 = (ceil(v15) * 100.0);
      v19 = v15 - v16;
    }
    else
    {
      v18 = 0;
      v17 = 0;
      v19 = 0.5;
    }
    -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:setConsistentState:](v64, "_profileFrameWithCounterListsForProfileInfo:setConsistentState:", v63, v18);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:](v64, "_profileFrameWithCounterListsForProfileInfo:", v63);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v17 = 0;
    v19 = 0.5;
  }
  -[DYMTLDebugPlaybackEngineCounterSupport _profileSplitEncodersForProfileInfo:](v64, "_profileSplitEncodersForProfileInfo:", v63);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64->_isAGXDevice)
  {
    v20 = -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameForFrameTiming:atConsistentState:](v64, "_profileFrameForFrameTiming:atConsistentState:", v63, v18);
    v21 = (unint64_t)((1.0 - v19)
                           * (double)-[DYMTLDebugPlaybackEngineCounterSupport _profileFrameForFrameTiming:atConsistentState:](v64, "_profileFrameForFrameTiming:atConsistentState:", v63, v17)+ v19 * (double)v20);
    v22 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithObject:forKey:", v23, CFSTR("gputime"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v58 = 0;
  }
  v64->_loopCount = loopCount;
  if (!v60)
  {
    v33 = 0;
    goto LABEL_66;
  }
  objc_msgSend(v60, "objectForKeyedSubscript:", *MEMORY[0x24BE39270]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  v71 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  objc_msgSend(v60, "objectForKeyedSubscript:", *MEMORY[0x24BE39310]);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  if (!v24)
  {
    v26 = -1;
    v28 = -1;
    v78 = -1;
    goto LABEL_36;
  }
  v80 = 0;
  v25 = 0;
  v26 = -1;
  v27 = *(_QWORD *)v95;
  v28 = -1;
  v78 = -1;
  do
  {
    v29 = 0;
    v30 = v80;
    v80 += v24;
    do
    {
      if (*(_QWORD *)v95 != v27)
        objc_enumerationMutation(obj);
      v31 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v29);
      if (objc_msgSend(CFSTR("MTLStat_nSec"), "isEqualToString:", v31))
      {
        v26 = v30 + v29;
      }
      else if (objc_msgSend(CFSTR("SW_PBUsed"), "isEqualToString:", v31)
             || objc_msgSend(CFSTR("_fedf2c59"), "isEqualToString:", v31))
      {
        v28 = v30 + v29;
      }
      else
      {
        if (!objc_msgSend(CFSTR("MTLStatTotalGPUCycles"), "isEqualToString:", v31))
          goto LABEL_28;
        v78 = v30 + v29;
      }
      if (++v25 == 3)
        goto LABEL_36;
LABEL_28:
      ++v29;
    }
    while (v24 != v29);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    v24 = v32;
  }
  while (v32);
LABEL_36:

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v55 = v54;
  v52 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v91;
    v34 = v26;
    v76 = v78;
    v74 = v28;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v91 != v53)
          objc_enumerationMutation(v55);
        v35 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v67 = v35;
        v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v72)
        {
          v68 = *(_QWORD *)v87;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v87 != v68)
                objc_enumerationMutation(v67);
              v36 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = (void *)objc_opt_new();
              v79 = (void *)objc_opt_new();
              v84 = 0u;
              v85 = 0u;
              v82 = 0u;
              v83 = 0u;
              v75 = v36;
              v39 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
              if (v39)
              {
                v40 = *(_QWORD *)v83;
                do
                {
                  for (k = 0; k != v39; ++k)
                  {
                    if (*(_QWORD *)v83 != v40)
                      objc_enumerationMutation(v75);
                    v42 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
                    v43 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v42, "objectAtIndexedSubscript:", v34);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "numberWithUnsignedLongLong:", objc_msgSend(v37, "unsignedLongLongValue") + objc_msgSend(v44, "unsignedLongLongValue"));
                    v45 = objc_claimAutoreleasedReturnValue();

                    v37 = (void *)v45;
                    objc_msgSend(v42, "objectAtIndexedSubscript:", v34);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "addObject:", v46);

                    objc_msgSend(v42, "objectAtIndexedSubscript:", v76);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "addObject:", v47);

                    if (v77)
                    {
                      v48 = (void *)MEMORY[0x24BDD16E0];
                      objc_msgSend(v42, "objectAtIndexedSubscript:", v74);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + objc_msgSend(v49, "unsignedLongLongValue"));
                      v50 = objc_claimAutoreleasedReturnValue();

                      v38 = (void *)v50;
                    }
                  }
                  v39 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
                }
                while (v39);
              }

              objc_msgSend(v69, "addObject:", v37);
              objc_msgSend(v70, "addObject:", v81);
              objc_msgSend(v71, "addObject:", v79);
              if (v77)
                objc_msgSend(v66, "addObject:", v38);

            }
            v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
          }
          while (v72);
        }

      }
      v52 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    }
    while (v52);
  }

  v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v69, CFSTR("encoder time data"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v70, CFSTR("kick time data"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v71, CFSTR("kick cycle data"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BE39720]);
  if (v64->_isAGXDevice)
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v58, CFSTR("consistent time"));
  if (v77)
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v66, CFSTR("tilerParamBufBytesUsedArray"));

LABEL_66:
  return v33;
}

- (id)profileFrameWithCounterListsForProfileInfo:(id)a3
{
  id v4;
  DYPlaybackEngine **p_engine;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v4 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableStatsSampling:", 1);

  v8 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupAllStatLocationsWithBlitOption:", 1);

  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:encoderPass:](self, "_profileFrameWithCounterListsForProfileInfo:encoderPass:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isAGXDevice)
  {
    v11 = *MEMORY[0x24BE39720];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE39720]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "BOOLValue"))
    {
      -[DYMTLDebugPlaybackEngineCounterSupport _profileSplitEncodersForProfileInfo:](self, "_profileSplitEncodersForProfileInfo:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);

    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE39718]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v16, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enableStatsSampling:", 1);

    v18 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v18, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sampleEncoderCounters");

    -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:encoderPass:](self, "_profileFrameWithCounterListsForProfileInfo:encoderPass:", v4, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE39390]);
LABEL_9:

  }
  v20 = objc_loadWeakRetained((id *)p_engine);
  objc_msgSend(v20, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "enableStatsSampling:", 0);

  return v10;
}

- (id)profileFrameWithCounterListsForProfileInfoAsync:(id)a3
{
  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:](self, "_profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:", a3, 0, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3
{
  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfo:encoderPass:](self, "_profileFrameWithCounterListsForProfileInfo:encoderPass:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_updatedBatchInfos:(id)a3 fromPerEncoderDrawCallCount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = 0;
  v9 = 0;
  while (v8 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if (v12)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v13);
      ++v9;

    }
    else
    {
      objc_msgSend(v7, "addObject:", &unk_250D7C6F8);
    }
    ++v8;
  }

  return v7;
}

- (id)_runPassesForCounterLists:(id)a3 encoderPass:(BOOL)a4 frameProfileInfo:(void *)a5
{
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  dispatch_group_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v31;
  _QWORD block[5];
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  _QWORD v41[6];
  void *__p[2];
  void *value;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v31 = a3;
  -[DYMTLDebugPlaybackEngineCounterSupport _clearData](self, "_clearData");
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "setPlaybackMode:", 5);

  v7 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v7, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BE396C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterInfo:", v9);
  v53 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_isAGXDevice)
  {
    v10 = *MEMORY[0x24BE39278];
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BE39278]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("perEncoderIndexDrawCallCount"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLDebugPlaybackEngineCounterSupport _updatedBatchInfos:fromPerEncoderDrawCallCount:](self, "_updatedBatchInfos:fromPerEncoderDrawCallCount:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setupBatchFilterForEncoders:", v13);
      if (v13)
      {
        objc_msgSend((id)v49[5], "setObject:forKeyedSubscript:", v13, v10);
        v14 = *MEMORY[0x24BE39460];
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BE39460]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend((id)v49[5], "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v14);
      }
    }
    else
    {
      v13 = 0;
    }

  }
  objc_msgSend(v8, "setupProfilingForCounterLists");
  objc_msgSend((id)v49[5], "objectForKeyedSubscript:", *MEMORY[0x24BE395D8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v18 = dispatch_group_create();
  if (v17)
  {
    v19 = 0;
    while (!v45[3])
    {
      if ((objc_msgSend(v8, "setupProfilingForListAtIndex:", v19) & 1) == 0)
      {

        v27 = 0;
        goto LABEL_20;
      }
      v20 = objc_loadWeakRetained((id *)&self->_engine);
      objc_msgSend(v20, "setPlaybackMode:", 5);

      objc_msgSend(v8, "resetFunctionPlayerData");
      v21 = objc_loadWeakRetained((id *)&self->_engine);
      objc_msgSend(v21, "setLoopTimeLimit:", 3000000000);

      v22 = objc_loadWeakRetained((id *)&self->_engine);
      objc_msgSend(v22, "playbackToFunction:withLoops:", 0, self->_loopCount);

      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x4812000000;
      v41[3] = __Block_byref_object_copy__59;
      v41[4] = __Block_byref_object_dispose__60;
      v41[5] = "";
      *(_OWORD *)__p = *(_OWORD *)&self->_commandBufferFrameProfilesInfo.__begin_;
      self->_commandBufferFrameProfilesInfo.__begin_ = 0;
      self->_commandBufferFrameProfilesInfo.__end_ = 0;
      value = self->_commandBufferFrameProfilesInfo.__end_cap_.__value_;
      self->_commandBufferFrameProfilesInfo.__end_cap_.__value_ = 0;
      dispatch_group_enter(v18);
      dispatch_get_global_queue(0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __97__DYMTLDebugPlaybackEngineCounterSupport__runPassesForCounterLists_encoderPass_frameProfileInfo___block_invoke;
      block[3] = &unk_250D6F7E8;
      v37 = v41;
      v38 = v19;
      v35 = &v44;
      v36 = &v48;
      block[4] = self;
      v24 = v31;
      v40 = a4;
      v33 = v24;
      v39 = a5;
      v34 = v18;
      dispatch_async(v23, block);

      _Block_object_dispose(v41, 8);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v17 == ++v19)
        break;
    }
  }
  objc_msgSend(v8, "stopFrameProfiling");
  v25 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v25, "setPlaybackMode:", 0);

  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (v45[3])
    v26 = 0;
  else
    v26 = (void *)v49[5];
  v27 = v26;
LABEL_20:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v27;
}

void __97__DYMTLDebugPlaybackEngineCounterSupport__runPassesForCounterLists_encoderPass_frameProfileInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *__p;
  __int128 *v13;
  uint64_t v14;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE39308]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 80));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE39310]);

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v6 = *(_QWORD *)(v5 + 48);
    v7 = *(uint64_t **)(v5 + 56);
    v8 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v6) >> 4));
    if (v7 == (uint64_t *)v6)
      v9 = 0;
    else
      v9 = v8;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>(v6, v7, (uint64_t)&__p, v9, 1);
    v13 = 0;
    v14 = 0;
    __p = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "_computeAverageForFrameProfile:forProfile:withInfo:andUpdatedCounterInfo:forEncoders:", &__p, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48, *(_QWORD *)(a1 + 40), v2, *(unsigned __int8 *)(a1 + 96)) & 1) == 0)
    {
      v10 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::back_insert_iterator<std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>,0>((__int128 *)__p, v13, *(void ***)(a1 + 88));
    if (__p)
    {
      v13 = (__int128 *)__p;
      operator delete(__p);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)_profileFrameWithCounterListsForProfileInfoAsync:(id)a3 encoderPass:(BOOL)a4 updateStatSampling:(BOOL)a5 setConsistentState:(unsigned int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __n128 (*v45)(__n128 *, __n128 *);
  void (*v46)(uint64_t);
  const char *v47;
  void *v48;
  void *v49;
  uint64_t v50;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x4812000000;
  v45 = __Block_byref_object_copy__59;
  v46 = __Block_byref_object_dispose__60;
  v47 = "";
  v48 = 0;
  v49 = 0;
  v50 = 0;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(WeakRetained, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enableStatsSampling:", 1);

    v13 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v13, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setupAllStatLocationsWithBlitOption:", 1);

  }
  if ((_DWORD)v6 && self->_isAGXDevice)
  {
    v15 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v15, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConsistentStateTo:", v6);

    v17 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v17, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enableConsistentState:", 1);

  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  -[DYMTLDebugPlaybackEngineCounterSupport _runPassesForCounterLists:encoderPass:frameProfileInfo:](self, "_runPassesForCounterLists:encoderPass:frameProfileInfo:", v10, v8, v43 + 6);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v19 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v19, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "enableStatsSampling:", 0);

  }
  if (v37[5])
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x24BE39110], "future");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState___block_invoke;
    block[3] = &unk_250D6F810;
    v27 = &v42;
    v26 = &v36;
    block[4] = self;
    v29 = v8;
    v25 = v10;
    v28 = &v30;
    dispatch_async(v21, block);

    v22 = (id)v31[5];
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE39110], "futureWithResult:error:", 0, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }

  return v22;
}

void __141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState___block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 *j;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  void **v49;
  unint64_t ii;
  void *v51;
  BOOL v52;
  __int128 *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  id WeakRetained;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t *v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  int v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t *v116;
  uint64_t *v117;
  void *v118;
  uint64_t v120;
  uint64_t v121;
  int v122;
  void *v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  _BOOL4 v128;
  id obj;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 **v133;
  uint64_t *v134;
  id *v135;
  uint64_t v136;
  id *v137;
  id *v138;
  __int128 *v139;
  id *v140;
  __int128 *v141;
  uint64_t *v142;
  uint64_t v143;
  id v144;
  id v145;
  uint64_t v146;
  id v147;
  id v148;
  char v149;
  uint64_t v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t *v162;
  _QWORD *v163[2];
  __int128 *v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE395D8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE39308]);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v2)
  {
    for (i = 0; i != v2; ++i)
    {
      objc_msgSend(v130, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 += objc_msgSend(v5, "count");

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE39310]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(_QWORD *)(v6 + 48);
  v8 = *(uint64_t **)(v6 + 56);
  v9 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v7) >> 4));
  if (v8 == (uint64_t *)v7)
    v10 = 0;
  else
    v10 = v9;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>(v7, v8, (uint64_t)&v131, v10, 1);
  v163[0] = 0;
  v163[1] = 0;
  v162 = (uint64_t *)v163;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(__int128 **)(v11 + 48);
  for (j = *(__int128 **)(v11 + 56); v12 != j; v12 += 3)
  {
    v131 = *v12;
    *(_QWORD *)&v132 = *((_QWORD *)v12 + 2);
    v14 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&v162, (unint64_t *)&v131);
    if (v163 == v14)
    {
      v159 = 0uLL;
      std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v160, v3, &v159);
      v164 = &v131;
      v15 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::__emplace_unique_key_args<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::tuple<unsigned long long,unsigned long long,unsigned long long> const&>,std::tuple<>>(&v162, (unint64_t *)&v131, (uint64_t)&std::piecewise_construct, &v164);
      v16 = (void *)v15[7];
      if (v16)
      {
        v15[8] = v16;
        operator delete(v16);
        v15[7] = 0;
        v15[8] = 0;
        v15[9] = 0;
      }
      *(_OWORD *)(v15 + 7) = v160;
      v15[9] = v161;
      v14 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&v162, (unint64_t *)&v131);
    }
    *(_OWORD *)(v14[7] + 16 * *((_QWORD *)v12 + 3)) = v12[2];
  }
  v164 = (__int128 *)objc_opt_new();
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = v118;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v170, 16);
  if (v17)
  {
    v18 = 0;
    v19 = *(_QWORD *)v156;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v156 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18 + k);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "setObject:forKeyedSubscript:", v22, v21);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v170, 16);
      v18 += k;
    }
    while (v17);
  }

  if (v2)
  {
    v23 = (void *)objc_opt_new();
    if (v2 >= 2)
    {
      objc_msgSend(v130, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      objc_msgSend(v130, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");
      v28 = v27 >= v25 ? v25 : v27;

      if (v28)
      {
        for (m = 0; m != v28; ++m)
        {
          objc_msgSend(v130, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", m);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "objectAtIndexedSubscript:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", m);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v31, "isEqualToString:", v33);

          if (v34)
          {
            objc_msgSend(v130, "objectAtIndexedSubscript:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", m);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v36);

          }
        }
      }
    }
    v131 = 0u;
    v132 = 0u;
    LODWORD(v133) = 1065353216;
    v37 = (void *)objc_opt_new();
    v38 = 0;
    *(_QWORD *)&v160 = 0;
    if (v2 <= 1)
      v39 = 1;
    else
      v39 = v2;
    v127 = v39;
    do
    {
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      objc_msgSend(v130, "objectAtIndexedSubscript:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v152;
        do
        {
          for (n = 0; n != v41; ++n)
          {
            if (*(_QWORD *)v152 != v42)
              objc_enumerationMutation(v40);
            v44 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * n);
            if (v38 && objc_msgSend(v23, "containsObject:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * n)))
              std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v131, (unint64_t *)&v160, &v160);
            *(_QWORD *)&v160 = v160 + 1;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v44, v45);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
        }
        while (v41);
      }

      ++v38;
    }
    while (v38 != v127);
    v46 = v162;
    if (v162 != (uint64_t *)v163)
    {
      do
      {
        v47 = objc_msgSend(obj, "count");
        v159 = 0uLL;
        std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v160, v47, &v159);
        v48 = 0;
        v125 = v46;
        v49 = (void **)(v46 + 7);
        *(_QWORD *)&v159 = 0;
        do
        {
          for (ii = 0; ; ++ii)
          {
            objc_msgSend(v130, "objectAtIndexedSubscript:", v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = ii < objc_msgSend(v51, "count");

            if (!v52)
              break;
            if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v131, (unint64_t *)&v159))
            {
              *(_QWORD *)&v159 = v159 + 1;
            }
            else
            {
              v53 = v164;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (_QWORD)v159);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKeyedSubscript:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "unsignedIntegerValue");

              v58 = v159;
              *(_QWORD *)&v159 = v159 + 1;
              *(_OWORD *)(v160 + 16 * v57) = *((_OWORD *)*v49 + v58);
            }
          }
          ++v48;
        }
        while (v48 != v127);
        v59 = *v49;
        v60 = v125;
        if (*v49)
        {
          v125[8] = (uint64_t)v59;
          operator delete(v59);
          *v49 = 0;
          v49[1] = 0;
          v49[2] = 0;
        }
        *(_OWORD *)(v125 + 7) = v160;
        v125[9] = v161;
        v61 = (uint64_t *)v125[1];
        if (v61)
        {
          do
          {
            v62 = v61;
            v61 = (uint64_t *)*v61;
          }
          while (v61);
        }
        else
        {
          do
          {
            v62 = (uint64_t *)v60[2];
            v81 = *v62 == (_QWORD)v60;
            v60 = v62;
          }
          while (!v81);
        }
        v46 = v62;
      }
      while (v62 != (uint64_t *)v163);
    }

    std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v131);
  }
  *(_QWORD *)&v160 = 0;
  objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("MTLStatCommandBufferIndex"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "unsignedIntegerValue");

  *(_QWORD *)&v160 = v64;
  *(_QWORD *)&v159 = 0;
  objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("MTLStatEncoderIndex"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "unsignedIntegerValue");

  *(_QWORD *)&v159 = v66;
  v150 = 0;
  objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("MTLStatCommandIndex"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "unsignedIntegerValue");

  v150 = v68;
  v149 = 0;
  v148 = 0;
  v70 = a1 + 32;
  v69 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v69 + 104))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE395D0]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if (v71)
    {
      v123 = 0;
      v128 = objc_msgSend(v71, "count") != 0;
    }
    else
    {
      v128 = 0;
      v123 = 0;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v69 + 88));
    objc_msgSend(WeakRetained, "player");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v74, "isBlitSamplingSupported");

    v75 = *(void **)(a1 + 40);
    if (v149)
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("perEncoderIndexDrawCallCount"));
    else
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("withoutBlitPerEncoderIndexDrawCallCount"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("blitEncoderIndices"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v148;
    v148 = v76;

    if (v148)
    {
      v128 = 0;
      goto LABEL_74;
    }
    v78 = (void *)objc_opt_new();
    v128 = 0;
    v72 = v148;
    v148 = v78;
  }

LABEL_74:
  v79 = (void *)objc_opt_new();
  v146 = -1;
  v147 = v79;
  v144 = 0;
  v145 = 0;
  v143 = 0;
  *(_QWORD *)&v131 = a1 + 32;
  *((_QWORD *)&v131 + 1) = a1 + 40;
  *(_QWORD *)&v132 = &v149;
  *((_QWORD *)&v132 + 1) = &v146;
  v133 = &v164;
  v134 = &v143;
  v135 = &v148;
  v136 = a1 + 72;
  v137 = &v144;
  v138 = &v145;
  v139 = &v160;
  v140 = &v147;
  v141 = &v159;
  v142 = &v150;
  v80 = v162;
  if (v162 != (uint64_t *)v163)
  {
    v122 = -1;
    v124 = -1;
    v126 = -1;
    v120 = -1;
    v121 = -1;
    do
    {
      if (*(_BYTE *)(*(_QWORD *)v70 + 104))
        goto LABEL_90;
      v81 = !*(_BYTE *)(a1 + 72) || v123 == 0;
      if (v81)
        goto LABEL_90;
      v82 = v80[7];
      v83 = *(_QWORD *)(v82 + 16 * v160);
      v84 = *(_QWORD *)(v82 + 16 * v159);
      v86 = v120;
      v85 = v121;
      v87 = v120 == v83 && v121 == v84;
      if (v87)
        v88 = v122;
      else
        v88 = v122 + 1;
      if (!v87)
      {
        v86 = v83;
        v85 = v84;
      }
      v120 = v86;
      v121 = v85;
      v122 = v88;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "objectForKeyedSubscript:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "unsignedLongLongValue");

      if (v91)
      {
LABEL_90:
        v92 = v80[4];
        if (v92 != v124)
        {
          v146 = -1;
          v93 = (void *)objc_opt_new();
          v94 = v145;
          v145 = v93;

          objc_msgSend(v147, "addObject:", v145);
          v124 = v92;
          v126 = -1;
        }
        v95 = v80[5];
        if (v95 != v126)
        {
          v146 += v95 - v126;
          v96 = (void *)objc_opt_new();
          v97 = v144;
          v144 = v96;

          objc_msgSend(v145, "addObject:", v144);
          _ZZZ141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState__EUb_ENK3__0clEb((uint64_t)&v131, 1);
          v126 = v95;
        }
        v98 = (void *)objc_opt_new();
        v99 = (uint64_t *)v80[7];
        v100 = (uint64_t *)v80[8];
        while (v99 != v100)
        {
          v101 = *v99;
          if (*(_BYTE *)(*(_QWORD *)v70 + 104) && v128)
          {
            v102 = v99[1];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v101);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v168[0] = v103;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v102);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v168[1] = v104;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v168, 2);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v105);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v101);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v103);
          }

          v99 += 2;
        }
        if (*(_BYTE *)(*(_QWORD *)v70 + 104))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v147, "count") - 1);
          if (v128)
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v167[0] = v106;
            v167[1] = &unk_250D7C6E0;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 2);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v107, (_QWORD)v160);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v166[0] = v108;
            v166[1] = &unk_250D7C6E0;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v166, 2);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v109, (_QWORD)v159);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v80[6]);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v165[0] = v110;
            v165[1] = &unk_250D7C6E0;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v165, 2);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v111, v150);

          }
          else
          {
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v114, (_QWORD)v160);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v115, (_QWORD)v159);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v80[6]);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:atIndexedSubscript:", v110, v150);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v147, "count") - 1);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:atIndexedSubscript:", v112, (_QWORD)v160);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:atIndexedSubscript:", v113, (_QWORD)v159);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v144, "count"));
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:atIndexedSubscript:", v110, v150);
        }

        objc_msgSend(v144, "addObject:", v98);
      }
      v116 = (uint64_t *)v80[1];
      if (v116)
      {
        do
        {
          v117 = v116;
          v116 = (uint64_t *)*v116;
        }
        while (v116);
      }
      else
      {
        do
        {
          v117 = (uint64_t *)v80[2];
          v81 = *v117 == (_QWORD)v80;
          v80 = v117;
        }
        while (!v81);
      }
      v80 = v117;
    }
    while (v117 != (uint64_t *)v163);
  }
  _ZZZ141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState__EUb_ENK3__0clEb((uint64_t)&v131, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v147, *MEMORY[0x24BE39270]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  std::__tree<DYMTLIABDecodingOp>::destroy((uint64_t)&v162, v163[0]);
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 encoderPass:(BOOL)a4
{
  void *v4;
  void *v5;

  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:](self, "_profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:", a3, a4, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 setConsistentState:(unsigned int)a4
{
  void *v4;
  void *v5;

  -[DYMTLDebugPlaybackEngineCounterSupport _profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:](self, "_profileFrameWithCounterListsForProfileInfoAsync:encoderPass:updateStatSampling:setConsistentState:", a3, 0, 0, *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_profileFrameForFrameTiming:(id)a3 atConsistentState:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t *begin;
  uint64_t *end;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  char v29;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[DYMTLDebugPlaybackEngineCounterSupport _clearData](self, "_clearData");
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v9, "setPlaybackMode:", 11);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE396C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setupFrameTimeProfiling");
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE395D8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (v13 != 1)
    goto LABEL_14;
  objc_msgSend(v8, "allowOverlap:withPState:", 1, v4);
  if (!objc_msgSend(v8, "setupProfilingForListAtIndex:", 0))
    goto LABEL_14;
  v14 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v14, "setPlaybackMode:", 11);

  objc_msgSend(v8, "resetFunctionPlayerData");
  v15 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v15, "setLoopTimeLimit:", 3000000000);

  v16 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v16, "playbackToFunction:withLoops:", 0, self->_loopCount);

  objc_msgSend(v8, "allowOverlap:withPState:", 0, 0);
  v17 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v17, "setPlaybackMode:", 0);

  begin = (uint64_t *)self->_commandBufferFrameProfilesInfo.__begin_;
  end = (uint64_t *)self->_commandBufferFrameProfilesInfo.__end_;
  if (begin == end
    || (std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)begin, end, (uint64_t)&v29, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 4)), 1), v20 = (unint64_t *)self->_commandBufferFrameProfilesInfo.__begin_, v21 = (unint64_t *)self->_commandBufferFrameProfilesInfo.__end_, v20 == v21))
  {
LABEL_14:
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v23 = 0;
    do
    {
      v24 = *v20;
      v25 = v20[1];
      v20 += 6;
      if (v23 <= v24)
        v23 = v24;
      v26 = v25 >= v23;
      v27 = v25 - v23;
      if (v25 > v23)
        v23 = v25;
      if (!v26)
        v27 = 0;
      v22 += v27;
    }
    while (v20 != v21);
  }

  return v22;
}

- (id)availableCounters
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "counterInfo:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)derivedCounterData
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "derivedCounterData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addCounters:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *frameProfiling;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  frameProfiling = self->_frameProfiling;
  self->_frameProfiling = v4;

  v6 = (void *)objc_msgSend(v7, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameProfiling, "setObject:forKeyedSubscript:", v6, CFSTR("frame counters"));

}

- (void).cxx_destruct
{
  unint64_t *begin;
  void *v4;
  void *v5;

  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_frameProfiling, 0);
  begin = self->_commandBufferFrameProfiles.__begin_;
  if (begin)
  {
    self->_commandBufferFrameProfiles.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
  if (v4)
  {
    self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_commandBufferFrameProfilesInfo.__begin_;
  if (v5)
  {
    self->_commandBufferFrameProfilesInfo.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
