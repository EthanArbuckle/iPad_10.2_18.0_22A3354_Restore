@implementation VNHomographyTrackerState

- (VNHomographyTrackerState)init
{
  VNHomographyTrackerState *v2;
  VNHomographyTrackerState *v3;
  void *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *analysisSemaphore;
  VNHomographyTrackerState *v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VNHomographyTrackerState;
  v2 = -[VNHomographyTrackerState init](&v9, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_5;
  v10 = *MEMORY[0x1E0D3AA30];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3->_analysisSession = (void *)ICAnalysisInit();

  if (!v3->_analysisSession)
    goto LABEL_5;
  v5 = dispatch_semaphore_create(0);
  analysisSemaphore = v3->_analysisSemaphore;
  v3->_analysisSemaphore = (OS_dispatch_semaphore *)v5;

  if (v3->_analysisSemaphore)
  {
    v3->_analysisPreRollFramesRemaining = 5;
    v3->_resultsLock._os_unfair_lock_opaque = 0;
    v7 = v3;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_analysisSession)
  {
    ICDestroyResult();
    self->_analysisSession = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VNHomographyTrackerState;
  -[VNHomographyTrackerState dealloc](&v3, sel_dealloc);
}

- (BOOL)ICShouldBeCanceled
{
  return 0;
}

- (void)ICReportFrameAnalysis:(id)a3 forPresentationTime:(id *)a4 withStats:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char *end;
  char *value;
  void *v34;
  _BYTE *begin;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  void *v42;
  char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;

  v60 = a3;
  v7 = a5;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  *(_QWORD *)&v58 = v9;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v53 = v11;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v52 = v13;

  objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  *(_QWORD *)&v56 = v15;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v51 = v17;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v50 = v19;

  objc_msgSend(v60, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  *(_QWORD *)&v54 = v21;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v49 = v23;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v48 = v25;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D3AA48]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27;
  v29 = v58;
  DWORD1(v29) = v53;
  DWORD2(v29) = v52;
  v59 = v29;
  v30 = v56;
  DWORD1(v30) = v51;
  DWORD2(v30) = v50;
  v57 = v30;
  v31 = v54;
  DWORD1(v31) = v49;
  DWORD2(v31) = v48;
  v55 = v31;

  os_unfair_lock_lock(&self->_resultsLock);
  end = (char *)self->_transformsAndConfidences.__end_;
  value = (char *)self->_transformsAndConfidences.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_transformsAndConfidences.__begin_;
    v36 = (end - begin) >> 6;
    v37 = v36 + 1;
    if ((unint64_t)(v36 + 1) >> 58)
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    v38 = value - begin;
    if (v38 >> 5 > v37)
      v37 = v38 >> 5;
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFC0)
      v39 = 0x3FFFFFFFFFFFFFFLL;
    else
      v39 = v37;
    if (v39)
      v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<simd_float3x3,float>>>(v39);
    else
      v40 = 0;
    v41 = (_DWORD *)(v39 + (v36 << 6));
    v42 = (void *)(v39 + (v40 << 6));
    *(_QWORD *)v41 = v59;
    v41[2] = DWORD2(v59);
    v41[3] = 0;
    v41[6] = DWORD2(v57);
    *((_QWORD *)v41 + 2) = v57;
    v41[7] = 0;
    *((_QWORD *)v41 + 4) = v55;
    v41[10] = DWORD2(v55);
    v41[11] = 0;
    v41[12] = v28;
    v34 = v41 + 16;
    v44 = (char *)self->_transformsAndConfidences.__begin_;
    v43 = (char *)self->_transformsAndConfidences.__end_;
    if (v43 != v44)
    {
      do
      {
        v45 = *((_OWORD *)v43 - 4);
        v46 = *((_OWORD *)v43 - 3);
        v47 = *((_OWORD *)v43 - 1);
        *((_OWORD *)v41 - 2) = *((_OWORD *)v43 - 2);
        *((_OWORD *)v41 - 1) = v47;
        *((_OWORD *)v41 - 4) = v45;
        *((_OWORD *)v41 - 3) = v46;
        v41 -= 16;
        v43 -= 64;
      }
      while (v43 != v44);
      v43 = (char *)self->_transformsAndConfidences.__begin_;
    }
    self->_transformsAndConfidences.__begin_ = v41;
    self->_transformsAndConfidences.__end_ = v34;
    self->_transformsAndConfidences.__end_cap_.__value_ = v42;
    if (v43)
      operator delete(v43);
  }
  else
  {
    *((_DWORD *)end + 2) = DWORD2(v59);
    *(_QWORD *)end = v59;
    *((_DWORD *)end + 3) = 0;
    *((_DWORD *)end + 6) = DWORD2(v57);
    *((_QWORD *)end + 2) = v57;
    *((_DWORD *)end + 7) = 0;
    *((_DWORD *)end + 10) = DWORD2(v55);
    *((_QWORD *)end + 4) = v55;
    *((_DWORD *)end + 11) = 0;
    v34 = end + 64;
    *((_DWORD *)end + 12) = v28;
  }
  self->_transformsAndConfidences.__end_ = v34;
  os_unfair_lock_unlock(&self->_resultsLock);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analysisSemaphore);

}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_transformsAndConfidences.__begin_;
  if (begin)
  {
    self->_transformsAndConfidences.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_analysisSemaphore, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
