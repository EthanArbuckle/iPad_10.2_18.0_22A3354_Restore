@implementation FTCinematicTracker

- (FTCinematicTracker)initWithConfig:(id)a3
{
  FTCinematicConfig *v4;
  FTCinematicTracker *v5;
  _QWORD *v6;
  ft::CinematicTracker *v7;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v10;
  FTCinematicTracker *v11;
  objc_super v13;

  v4 = (FTCinematicConfig *)a3;
  v13.receiver = self;
  v13.super_class = (Class)FTCinematicTracker;
  v5 = -[FTCinematicTracker init](&v13, sel_init);
  if (v5)
  {
    v6 = operator new(0xF0uLL);
    v6[2] = 0;
    *v6 = &unk_24C55EAF0;
    v6[1] = 0;
    v7 = ft::CinematicTracker::CinematicTracker((ft::CinematicTracker *)(v6 + 3), v4);
    cntrl = (std::__shared_weak_count *)v5->_tracker.__cntrl_;
    v5->_tracker.__ptr_ = (CinematicTracker *)v7;
    v5->_tracker.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v11 = v5;
  }

  return v5;
}

- (id)computeTrackingStateForInput:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  ft *v8;
  CinematicTracker *ptr;
  uint64_t v10;
  char *v11;
  char *v12;
  CMTime *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __shared_weak_count *cntrl;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  double v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  std::runtime_error *exception;
  void *v52;
  std::recursive_mutex *v53;
  char *v54;
  std::__shared_weak_count *v55;
  CinematicTracker *v56;
  __shared_weak_count *v57;
  char *v58;
  std::__shared_weak_count *v59;
  CMTime time2;
  CMTime time1;

  v7 = a3;
  v53 = (std::recursive_mutex *)((char *)self->_tracker.__ptr_ + 80);
  std::recursive_mutex::lock(v53);
  ptr = self->_tracker.__ptr_;
  v10 = *((_QWORD *)ptr + 1);
  if ((v10 & 1) == 0)
  {
    *((_QWORD *)ptr + 1) = v10 + 1;
    v11 = (char *)operator new(0x80uLL);
    v12 = v11;
    *((_QWORD *)v11 + 2) = 0;
    *(_QWORD *)v11 = &unk_24C55EB28;
    *((_QWORD *)v11 + 1) = 0;
    *(_OWORD *)(v11 + 24) = 0u;
    v13 = (CMTime *)(v11 + 24);
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *((_QWORD *)v11 + 15) = 0;
    v58 = v11 + 24;
    v59 = (std::__shared_weak_count *)v11;
    if (v7)
    {
      objc_msgSend(v7, "sourceFrameTimestamp");
      *v13 = time1;
      objc_msgSend(v7, "mapToInternalObservations");
      v14 = (void *)*((_QWORD *)v12 + 7);
      if (v14)
      {
        *((_QWORD *)v12 + 8) = v14;
        operator delete(v14);
        *((_QWORD *)v12 + 7) = 0;
        *((_QWORD *)v12 + 8) = 0;
        *((_QWORD *)v12 + 9) = 0;
      }
    }
    else
    {
      v13->value = 0;
      *((_QWORD *)v11 + 4) = 0;
      *((_QWORD *)v11 + 5) = 0;
      memset(&time1, 0, sizeof(time1));
    }
    *(CMTime *)(v12 + 56) = time1;
    v12[48] = objc_msgSend(v7, "detectorDidRun");
    objc_msgSend(v7, "tapRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v7, "tapRequest");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v52, "trackId");
    }
    else
    {
      v18 = -1;
    }
    objc_msgSend(v7, "tapRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v7, "tapRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tapPoint");
      if (v20 >= 0.0)
      {
        objc_msgSend(v7, "tapRequest");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tapPoint");
        if (v47 >= 0.0)
        {
          objc_msgSend(v7, "tapRequest");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "tapPoint");
          v21 = 1;
          v22 = 1;
          v48 = v12[104];
          *((_QWORD *)v12 + 10) = v18;
          *((_QWORD *)v12 + 11) = v49;
          *((_QWORD *)v12 + 12) = v50;
          if (v48)
          {
LABEL_18:
            if (v22)
            {

              if (!v21)
              {
LABEL_20:
                if (!v19)
                {
LABEL_22:

                  if (v17)
                  v26 = objc_msgSend(v7, "highPriorityTrackId");
                  v27 = v58;
                  if (!v58[96])
                    v58[96] = 1;
                  *((_QWORD *)v27 + 11) = v26;
                  if (objc_msgSend(*(id *)self->_tracker.__ptr_, "ensureObservationTimestampMatchesFrame"))
                  {
                    v28 = *((_QWORD *)v27 + 4);
                    for (i = *((_QWORD *)v27 + 5); v28 != i; v28 += 152)
                    {
                      v30 = *(_OWORD *)v27;
                      time1.epoch = *((_QWORD *)v27 + 2);
                      *(_OWORD *)&time1.value = v30;
                      v31 = *(_OWORD *)(v28 + 44);
                      time2.epoch = *(_QWORD *)(v28 + 60);
                      *(_OWORD *)&time2.value = v31;
                      if (CMTimeCompare(&time1, &time2))
                      {
                        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
                        std::runtime_error::runtime_error(exception, "Observation timestamp does not match frame timestamp.");
                        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
                      }
                    }
                  }
                  ft::CinematicTracker::Track((ft::TrackPool **)self->_tracker.__ptr_, (const Frame *)v27);
                  cntrl = self->_tracker.__cntrl_;
                  v56 = self->_tracker.__ptr_;
                  v57 = cntrl;
                  if (cntrl)
                  {
                    v33 = (unint64_t *)((char *)cntrl + 8);
                    do
                      v34 = __ldxr(v33);
                    while (__stxr(v34 + 1, v33));
                  }
                  v54 = v27;
                  v55 = v59;
                  if (v59)
                  {
                    p_shared_owners = (unint64_t *)&v59->__shared_owners_;
                    do
                      v36 = __ldxr(p_shared_owners);
                    while (__stxr(v36 + 1, p_shared_owners));
                  }
                  +[FTCinematicTrackingState stateWithTracker:frame:input:](FTCinematicTrackingState, "stateWithTracker:frame:input:", &v56, &v54, v7);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = v55;
                  if (v55)
                  {
                    v38 = (unint64_t *)&v55->__shared_owners_;
                    do
                      v39 = __ldaxr(v38);
                    while (__stlxr(v39 - 1, v38));
                    if (!v39)
                    {
                      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
                      std::__shared_weak_count::__release_weak(v37);
                    }
                  }
                  v40 = (std::__shared_weak_count *)v57;
                  if (v57)
                  {
                    v41 = (unint64_t *)((char *)v57 + 8);
                    do
                      v42 = __ldaxr(v41);
                    while (__stlxr(v42 - 1, v41));
                    if (!v42)
                    {
                      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                      std::__shared_weak_count::__release_weak(v40);
                    }
                  }
                  v43 = v59;
                  if (v59)
                  {
                    v44 = (unint64_t *)&v59->__shared_owners_;
                    do
                      v45 = __ldaxr(v44);
                    while (__stlxr(v45 - 1, v44));
                    if (!v45)
                    {
                      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                      std::__shared_weak_count::__release_weak(v43);
                    }
                  }
                  goto LABEL_51;
                }
LABEL_21:

                goto LABEL_22;
              }
            }
            else if (!v21)
            {
              goto LABEL_20;
            }

            if (!v19)
              goto LABEL_22;
            goto LABEL_21;
          }
LABEL_17:
          v12[104] = 1;
          goto LABEL_18;
        }
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v7, "tapPosition");
    v22 = 0;
    v23 = v12[104];
    *((_QWORD *)v12 + 10) = v18;
    *((_QWORD *)v12 + 11) = v24;
    *((_QWORD *)v12 + 12) = v25;
    if (v23)
      goto LABEL_18;
    goto LABEL_17;
  }
  ft::GetOsLog(v8);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[FTCinematicTracker computeTrackingStateForInput:].cold.1();

  v16 = 0;
LABEL_51:
  std::recursive_mutex::unlock(v53);

  return v16;
}

+ (id)highPriorityExemplarNetworkDescriptor
{
  FTNetworkDescriptor *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(FTNetworkDescriptor);
  -[FTNetworkDescriptor setName:](v2, "setName:", CFSTR("subject_tracking_initializer_v2"));
  +[FTImageTensorDescriptor bgraSquareImageWithName:size:](FTImageTensorDescriptor, "bgraSquareImageWithName:size:", CFSTR("image"), 127.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTNetworkDescriptor setInputImages:](v2, "setInputImages:", v4);

  -[FTNetworkDescriptor setOutputNames:](v2, "setOutputNames:", &unk_24C561838);
  return v2;
}

+ (id)highPriorityInstanceNetworkDescriptor
{
  void *v2;
  void *v3;
  FTTensorReference *v4;
  FTTensorReference *v5;
  FTNetworkDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "highPriorityExemplarNetworkDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(FTTensorReference);
  -[FTTensorReference setSourceNetworkName:](v4, "setSourceNetworkName:", v3);
  -[FTTensorReference setSourceOutputName:](v4, "setSourceOutputName:", CFSTR("net_exempler_reg"));
  -[FTTensorReference setDestinationInputName:](v4, "setDestinationInputName:", CFSTR("r1_kernel"));
  v5 = objc_alloc_init(FTTensorReference);
  -[FTTensorReference setSourceNetworkName:](v5, "setSourceNetworkName:", v3);
  -[FTTensorReference setSourceOutputName:](v5, "setSourceOutputName:", CFSTR("net_exempler_cls"));
  -[FTTensorReference setDestinationInputName:](v5, "setDestinationInputName:", CFSTR("cls1_kernel"));
  v6 = objc_alloc_init(FTNetworkDescriptor);
  -[FTNetworkDescriptor setName:](v6, "setName:", CFSTR("subject_tracking_tracker_v2"));
  +[FTImageTensorDescriptor bgraSquareImageWithName:size:](FTImageTensorDescriptor, "bgraSquareImageWithName:size:", CFSTR("instance_image"), 271.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTNetworkDescriptor setInputImages:](v6, "setInputImages:", v8);

  v11[0] = v4;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTNetworkDescriptor setInputReferences:](v6, "setInputReferences:", v9);

  -[FTNetworkDescriptor setOutputNames:](v6, "setOutputNames:", &unk_24C561850);
  return v6;
}

+ (id)tapToBoxNetworkDescriptor
{
  return +[FTTapToBox networkDescriptor](FTTapToBox, "networkDescriptor");
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_tracker.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)computeTrackingStateForInput:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_20CC71000, v0, v1, "A previous tracking state has not been committed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
