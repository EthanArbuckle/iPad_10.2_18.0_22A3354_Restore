@implementation FTCinematicTrackingState

+ (id)stateWithTracker:(shared_ptr<ft:(shared_ptr<ft:(id)a5 :Frame>)a4 :CinematicTracker>)a3 frame:input:
{
  Frame *ptr;
  __shared_weak_count *cntrl;
  CinematicTracker *v7;
  Frame *v8;
  FTCinematicTrackingState *v9;
  FTCinematicTrackingState *v10;
  uint64_t v11;
  CinematicTracker *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  Frame *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  FTCinematicHighPriorityTrackerState *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  FTCinematicHighPriorityTrackerState *highPriorityTrackerState;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  Frame *v41;
  std::__shared_weak_count *v42;
  CinematicTracker *v43;
  std::__shared_weak_count *v44;

  ptr = a4.__ptr_;
  cntrl = a3.__cntrl_;
  v7 = a3.__ptr_;
  v8 = a4.__ptr_;
  v9 = objc_alloc_init(FTCinematicTrackingState);
  v10 = v9;
  v12 = *(CinematicTracker **)v7;
  v11 = *((_QWORD *)v7 + 1);
  if (v11)
  {
    v13 = (unint64_t *)(v11 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = (std::__shared_weak_count *)v9->_tracker.__cntrl_;
  v9->_tracker.__ptr_ = v12;
  v9->_tracker.__cntrl_ = (__shared_weak_count *)v11;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v19 = *(Frame **)cntrl;
  v18 = *((_QWORD *)cntrl + 1);
  if (v18)
  {
    v20 = (unint64_t *)(v18 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v22 = (std::__shared_weak_count *)v10->_frame.__cntrl_;
  v10->_frame.__ptr_ = v19;
  v10->_frame.__cntrl_ = (__shared_weak_count *)v18;
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  objc_storeStrong((id *)&v10->_input, ptr);
  v10->_commitToken = *(_QWORD *)(*(_QWORD *)v7 + 8);
  v25 = [FTCinematicHighPriorityTrackerState alloc];
  v26 = (std::__shared_weak_count *)*((_QWORD *)v7 + 1);
  v43 = *(CinematicTracker **)v7;
  v44 = v26;
  if (v26)
  {
    v27 = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)cntrl + 1);
  v41 = *(Frame **)cntrl;
  v42 = v29;
  if (v29)
  {
    v30 = (unint64_t *)&v29->__shared_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  v32 = -[FTCinematicHighPriorityTrackerState initWithTracker:frame:](v25, "initWithTracker:frame:", &v43, &v41);
  highPriorityTrackerState = v10->_highPriorityTrackerState;
  v10->_highPriorityTrackerState = (FTCinematicHighPriorityTrackerState *)v32;

  v34 = v42;
  if (v42)
  {
    v35 = (unint64_t *)&v42->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = v44;
  if (v44)
  {
    v38 = (unint64_t *)&v44->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

  return v10;
}

- (id)commit
{
  std::recursive_mutex *v3;
  ft *v4;
  CinematicTracker *ptr;
  uint64_t v6;
  _QWORD *ActiveTracks;
  NSObject *v8;
  CinematicTracker *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  __int128 v15;
  _QWORD *v16;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  CinematicTracker *v25;
  uint64_t v26;
  int8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unint64_t v40;
  Frame *v41;
  CMTimeEpoch v42;
  ft *v43;
  NSObject *v44;
  void *v45;
  double x;
  double y;
  double width;
  double height;
  _QWORD *v50;
  FTCinematicTrackingResult *v51;
  Frame *v53;
  uint64_t v54;
  CinematicTracker *v55;
  __int128 v56;
  void *v57;
  void *v58;
  BOOL v59;
  FTCinematicTapResponse *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  Frame *v68;
  CMTimeEpoch v69;
  id v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  std::runtime_error *exception;
  __int128 v75;
  void *v76;
  CMTime v77;
  CMTime v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  CMTime time2;
  CMTime time1;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint8_t v95[128];
  _BYTE buf[12];
  _OWORD v97[7];
  CMTime v98;
  uint64_t v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v99 = *MEMORY[0x24BDAC8D0];
  v3 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v3);
  v4 = (ft *)-[FTCinematicHighPriorityTrackerState completed](self->_highPriorityTrackerState, "completed");
  if ((v4 & 1) == 0)
  {
    ft::GetOsLog(v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FTCinematicTrackingState commit].cold.2();
    goto LABEL_58;
  }
  ptr = self->_tracker.__ptr_;
  v6 = *((_QWORD *)ptr + 1);
  if (v6 != self->_commitToken)
  {
    ft::GetOsLog(v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FTCinematicTrackingState commit].cold.1((uint64_t *)&self->_commitToken, (uint64_t)&self->_tracker, v8);
LABEL_58:
    v51 = 0;
    goto LABEL_59;
  }
  *((_QWORD *)ptr + 1) = v6 + 1;
  if (*(_BYTE *)ft::UserDefaults::Get(v4))
    ft::CinematicTracker::TerminateHighlyOverlappingDetectionlessTrack((ft::CinematicTracker *)self->_tracker.__ptr_);
  ActiveTracks = (_QWORD *)ft::TrackPool::GetActiveTracks(*((ft::TrackPool **)self->_tracker.__ptr_ + 24));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (uint64_t)(ActiveTracks[1] - *ActiveTracks) >> 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = self->_tracker.__ptr_;
  v11 = *((_QWORD *)v9 + 19);
  v10 = (std::__shared_weak_count *)*((_QWORD *)v9 + 20);
  v93 = v11;
  v94 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  -[FTCinematicTrackingState input](self, "input");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "observations");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (_QWORD *)*ActiveTracks;
  v16 = (_QWORD *)ActiveTracks[1];
  if ((_QWORD *)*ActiveTracks == v16)
    goto LABEL_60;
  *(_QWORD *)&v15 = 134217984;
  v75 = v15;
  do
  {
    v18 = (std::__shared_weak_count *)v17[1];
    v91 = *v17;
    v92 = v18;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    +[FTCinematicTrack fromTrack:isHighPriority:](FTCinematicTrack, "fromTrack:isHighPriority:", &v91, *v17 == v93);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v92;
    if (!v92)
      goto LABEL_17;
    v23 = (unint64_t *)&v92->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
      v25 = self->_tracker.__ptr_;
      v26 = *v17;
      v27 = *(int8x8_t *)((char *)v25 + 48);
      if (!*(_QWORD *)&v27)
        goto LABEL_39;
    }
    else
    {
LABEL_17:
      v25 = self->_tracker.__ptr_;
      v26 = *v17;
      v27 = *(int8x8_t *)((char *)v25 + 48);
      if (!*(_QWORD *)&v27)
        goto LABEL_39;
    }
    v28 = *(_QWORD *)(v26 + 16);
    v29 = (uint8x8_t)vcnt_s8(v27);
    v29.i16[0] = vaddlv_u8(v29);
    if (v29.u32[0] > 1uLL)
    {
      v30 = *(_QWORD *)(v26 + 16);
      if (v28 >= *(_QWORD *)&v27)
        v30 = v28 % *(_QWORD *)&v27;
    }
    else
    {
      v30 = (*(_QWORD *)&v27 - 1) & v28;
    }
    v31 = (uint64_t)v25 + 40;
    v32 = *(_QWORD **)(*((_QWORD *)v25 + 5) + 8 * v30);
    if (!v32 || (v33 = (_QWORD *)*v32) == 0)
    {
LABEL_39:
      if (!*(_BYTE *)(v26 + 232))
        goto LABEL_80;
      goto LABEL_40;
    }
    if (v29.u32[0] < 2uLL)
    {
      v34 = *(_QWORD *)&v27 - 1;
      while (1)
      {
        v36 = v33[1];
        if (v28 == v36)
        {
          if (v33[2] == v28)
            goto LABEL_52;
        }
        else if ((v36 & v34) != v30)
        {
          goto LABEL_39;
        }
        v33 = (_QWORD *)*v33;
        if (!v33)
          goto LABEL_39;
      }
    }
    while (1)
    {
      v35 = v33[1];
      if (v28 == v35)
        break;
      if (v35 >= *(_QWORD *)&v27)
        v35 %= *(_QWORD *)&v27;
      if (v35 != v30)
        goto LABEL_39;
LABEL_27:
      v33 = (_QWORD *)*v33;
      if (!v33)
        goto LABEL_39;
    }
    if (v33[2] != v28)
      goto LABEL_27;
LABEL_52:
    *(_QWORD *)buf = *(_QWORD *)(v26 + 16);
    *(_QWORD *)&v97[0] = buf;
    v50 = std::__hash_table<std::__hash_value_type<long long,CMTime>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,CMTime>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,CMTime>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,CMTime>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long &&>,std::tuple<>>(v31, (unint64_t *)buf, (uint64_t)&std::piecewise_construct, (uint64_t **)v97);
    v89 = *(_OWORD *)(v50 + 3);
    v90 = v50[5];
    objc_msgSend(v21, "setLastTappedTime:", &v89);
    v26 = *v17;
    if (!*(_BYTE *)(*v17 + 232))
    {
LABEL_80:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Track not yet initialized.");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
LABEL_40:
    v37 = *(_OWORD *)(v26 + 152);
    v97[5] = *(_OWORD *)(v26 + 136);
    v97[6] = v37;
    v98 = *(CMTime *)(v26 + 168);
    v38 = *(_OWORD *)(v26 + 72);
    v39 = *(_OWORD *)(v26 + 104);
    v97[2] = *(_OWORD *)(v26 + 88);
    v97[3] = v39;
    v97[4] = *(_OWORD *)(v26 + 120);
    v97[0] = *(_OWORD *)(v26 + 56);
    v97[1] = v38;
    if (*(_BYTE *)(v26 + 200))
    {
      v40 = *(_QWORD *)(v26 + 192);
      time1 = v98;
      v41 = self->_frame.__ptr_;
      v42 = *((_QWORD *)v41 + 2);
      *(_OWORD *)&time2.value = *(_OWORD *)v41;
      time2.epoch = v42;
      if (!CMTimeCompare(&time1, &time2))
      {
        v43 = (ft *)objc_msgSend(v76, "count");
        if (v40 >= (unint64_t)v43)
        {
          ft::GetOsLog(v43);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v75;
            *(_QWORD *)&buf[4] = v40;
            _os_log_error_impl(&dword_20CC71000, v44, OS_LOG_TYPE_ERROR, "Internal inconsistency: observation index out of bounds: %zd", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v76, "objectAtIndexedSubscript:", v40);
          v44 = objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[NSObject metadata](v44, "metadata");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setMetadata:", v45);

          }
        }

      }
    }
    objc_msgSend(v21, "setIsTapSpawned:", *(_DWORD *)(*v17 + 8) & 1, v75);
    objc_msgSend(v21, "box");
    v102.origin.x = 0.0;
    v102.origin.y = 0.0;
    v102.size.width = 1.0;
    v102.size.height = 1.0;
    v101 = CGRectIntersection(v100, v102);
    x = v101.origin.x;
    y = v101.origin.y;
    width = v101.size.width;
    height = v101.size.height;
    if (!CGRectIsEmpty(v101))
    {
      objc_msgSend(v21, "setBox:", x, y, width, height);
      -[NSObject addObject:](v8, "addObject:", v21);
    }

    v17 += 2;
  }
  while (v17 != v16);
LABEL_60:
  v51 = objc_alloc_init(FTCinematicTrackingResult);
  -[FTCinematicTrackingResult setTracks:](v51, "setTracks:", v8);
  v53 = self->_frame.__ptr_;
  v54 = *((_QWORD *)v53 + 2);
  v85 = *(_OWORD *)v53;
  v86 = v54;
  -[FTCinematicTrackingResult setSourceFrameTimestamp:](v51, "setSourceFrameTimestamp:", &v85);
  v55 = self->_tracker.__ptr_;
  v56 = *((_OWORD *)v55 + 1);
  v84 = *((_QWORD *)v55 + 4);
  v83 = v56;
  -[FTCinematicTrackingResult setMostRecentTapTime:](v51, "setMostRecentTapTime:", &v83);
  -[FTCinematicTrackingResult setDetectorDidRun:](v51, "setDetectorDidRun:", *((unsigned __int8 *)self->_frame.__ptr_ + 24));
  -[FTCinematicTrackingState input](self, "input");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "tapRequest");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 == 0;

  if (!v59)
  {
    v60 = objc_alloc_init(FTCinematicTapResponse);
    -[FTCinematicTrackingState input](self, "input");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "tapRequest");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTCinematicTapResponse setRequest:](v60, "setRequest:", v62);

    -[FTCinematicTrackingResult setTapResponse:](v51, "setTapResponse:", v60);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v63 = v8;
    v64 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v80;
      while (2)
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v80 != v65)
            objc_enumerationMutation(v63);
          v67 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if (v67)
            objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "lastTappedTime");
          else
            memset(&v78, 0, sizeof(v78));
          v68 = self->_frame.__ptr_;
          v69 = *((_QWORD *)v68 + 2);
          *(_OWORD *)&v77.value = *(_OWORD *)v68;
          v77.epoch = v69;
          if (!CMTimeCompare(&v78, &v77))
          {
            v70 = v67;
            goto LABEL_74;
          }
        }
        v64 = -[NSObject countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        if (v64)
          continue;
        break;
      }
    }
    v70 = 0;
LABEL_74:

    -[FTCinematicTapResponse setTappedTrack:](v60, "setTappedTrack:", v70);
    -[FTCinematicTapResponse setWasSuccessful:](v60, "setWasSuccessful:", v70 != 0);

  }
  v71 = v94;
  if (v94)
  {
    v72 = (unint64_t *)&v94->__shared_owners_;
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
LABEL_59:

  std::recursive_mutex::unlock(v3);
  return v51;
}

- (FTCinematicHighPriorityTrackerState)highPriorityTrackerState
{
  return self->_highPriorityTrackerState;
}

- (FTCinematicInput)input
{
  return self->_input;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_highPriorityTrackerState, 0);
  cntrl = self->_frame.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->_tracker.__cntrl_;
    if (!v6)
      return;
  }
  else
  {
LABEL_5:
    v6 = self->_tracker.__cntrl_;
    if (!v6)
      return;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (void)commit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "Operation requested for high priority tracking not completed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
