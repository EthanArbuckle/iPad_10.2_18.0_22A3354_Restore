@implementation AVCRTTSessionDelegate

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  AVCRTTSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didStart:error:]", 47);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__AVCRTTSessionDelegate_stream_didStart_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __47__AVCRTTSessionDelegate_stream_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  const char *v4;
  size_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  void *v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  void *__p[2];
  char v40;
  void *v41;
  std::__shared_weak_count *v42;
  char v43;

  if (*(_QWORD *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v41, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v2 = ImsLogger::error(ims::_logger, (uint64_t)&v41, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)"Failed to start session ", 24);
    *(_BYTE *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)" error: ", 8);
    *(_BYTE *)(v2 + 17) = 0;
    objc_msgSend(*(id *)(a1 + 32), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)v4, v5);
    *(_BYTE *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v2 + 17) = 0;

    if (v40 < 0)
      operator delete(__p[0]);
    if (v43 < 0)
      operator delete(v41);
  }
  v6 = *(_QWORD *)(a1 + 48);
  v37 = 0;
  v38 = 0;
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v38 = v8;
    if (v8)
    {
      v9 = *(_QWORD *)(v6 + 8);
      v37 = v9;
      if (v9)
      {
        v10 = v9 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)(v9 + 24) + 152))(&v41, v9 + 24);
        v35 = 0;
        v36 = 0;
        if (!v42)
          goto LABEL_30;
        v36 = std::__shared_weak_count::lock(v42);
        if (v36)
        {
          v11 = v41;
          v35 = v41;
        }
        else
        {
          v11 = 0;
        }
        if (v42)
          std::__shared_weak_count::__release_weak(v42);
        if (v11)
        {
          MediaSessionDriver::cancelTimerForRequest((uint64_t **)(v9 + 24), 1);
          if (*(_BYTE *)(v9 + 475))
          {
            *(_BYTE *)(v9 + 475) = 0;
            v15 = *(_BYTE *)(a1 + 56);
            if (v15)
            {
              if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 96))(v9 + 24) == 4)
              {
                *(_BYTE *)(v9 + 477) = 1;
LABEL_36:
                AVCRTPSession<AVCTextStream>::pauseAVCSession(v9);
                goto LABEL_61;
              }
              v15 = *(_BYTE *)(a1 + 56);
            }
            *(_BYTE *)(v9 + 473) = v15;
            if (*(_BYTE *)(a1 + 56))
            {
              v23 = 0;
            }
            else
            {
              v24 = *(void **)(a1 + 32);
              if (v24)
              {
                if (objc_msgSend(v24, "code") == 32005)
                  v23 = 7;
                else
                  v23 = 9;
              }
              else
              {
                v23 = 9;
              }
            }
            v33 = v9 + 24;
            v34 = v8;
            p_shared_owners = (unint64_t *)&v8->__shared_owners_;
            do
              v26 = __ldxr(p_shared_owners);
            while (__stxr(v26 + 1, p_shared_owners));
            (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v11 + 16))(v11, &v33, v23);
            v20 = v34;
            if (!v34)
              goto LABEL_61;
            v27 = (unint64_t *)&v34->__shared_owners_;
            do
              v22 = __ldaxr(v27);
            while (__stlxr(v22 - 1, v27));
            goto LABEL_59;
          }
          *(_BYTE *)(v9 + 473) = *(_BYTE *)(a1 + 56);
          if (*(_BYTE *)(a1 + 56) && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 96))(v9 + 24) == 4)
            goto LABEL_36;
          v31 = v9 + 24;
          v32 = v8;
          v17 = (unint64_t *)&v8->__shared_owners_;
          do
            v18 = __ldxr(v17);
          while (__stxr(v18 + 1, v17));
          if (*(_BYTE *)(a1 + 56))
            v19 = 0;
          else
            v19 = 9;
          (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v11 + 24))(v11, &v31, v19);
          v20 = v32;
          if (v32)
          {
            v21 = (unint64_t *)&v32->__shared_owners_;
            do
              v22 = __ldaxr(v21);
            while (__stlxr(v22 - 1, v21));
LABEL_59:
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
          }
        }
        else
        {
LABEL_30:
          std::string::basic_string[abi:ne180100]<0>(&v41, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v16 = ImsLogger::warn(ims::_logger, (uint64_t)&v41, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"Ignoring didStart notification received for session ", 52);
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 176))(v9 + 24);
          std::ostream::operator<<();
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v16 + 17) = 0;
          if (v40 < 0)
            operator delete(__p[0]);
          if (v43 < 0)
            operator delete(v41);
        }
LABEL_61:
        v28 = v36;
        if (v36)
        {
          v29 = (unint64_t *)&v36->__shared_owners_;
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 - 1, v29));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
            std::__shared_weak_count::__release_weak(v28);
          }
        }
        v8 = v38;
        if (!v38)
          return;
LABEL_18:
        v13 = (unint64_t *)&v8->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        return;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v41, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v12 = ImsLogger::debug(ims::_logger, (uint64_t)&v41, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didStart:error:]_block_invoke", 60);
  *(_BYTE *)(v12 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v12 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v12 + 64))(v12, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v12 + 17) = 0;
  if (v40 < 0)
    operator delete(__p[0]);
  if (v43 < 0)
    operator delete(v41);
  if (v8)
    goto LABEL_18;
}

- (void)streamDidStop:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidStop:]", 39);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVCRTTSessionDelegate_streamDidStop___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __39__AVCRTTSessionDelegate_streamDidStop___block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  void *v20;
  std::__shared_weak_count *v21;
  void *__p[2];
  char v23;
  void *v24;
  std::__shared_weak_count *v25;
  char v26;
  uint64_t v27;
  std::__shared_weak_count *v28;

  v1 = *(_QWORD *)(a1 + 32);
  v27 = 0;
  v28 = 0;
  v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v28 = v3;
    if (v3)
    {
      v4 = *(_QWORD *)(v1 + 8);
      v27 = v4;
      if (v4)
      {
        (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)(v4 + 24) + 152))(&v24, v4 + 24);
        v20 = 0;
        v21 = 0;
        if (!v25)
          goto LABEL_24;
        v21 = std::__shared_weak_count::lock(v25);
        if (v21)
        {
          v5 = v24;
          v20 = v24;
        }
        else
        {
          v5 = 0;
        }
        if (v25)
          std::__shared_weak_count::__release_weak(v25);
        if (v5)
        {
          MediaSessionDriver::cancelTimerForRequest((uint64_t **)(v4 + 24), 3);
          if (*(_BYTE *)(v4 + 475) || *(_BYTE *)(v4 + 476))
          {
            *(_BYTE *)(v4 + 476) = 0;
            (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 24))(v4, 0);
          }
          else
          {
            *(_BYTE *)(v4 + 473) = 0;
            p_shared_owners = (unint64_t *)&v3->__shared_owners_;
            v18 = v4 + 24;
            v19 = v3;
            do
              v14 = __ldxr(p_shared_owners);
            while (__stxr(v14 + 1, p_shared_owners));
            (*(void (**)(void *, uint64_t *, _QWORD))(*(_QWORD *)v5 + 32))(v5, &v18, 0);
            v15 = v19;
            if (v19)
            {
              v16 = (unint64_t *)&v19->__shared_owners_;
              do
                v17 = __ldaxr(v16);
              while (__stlxr(v17 - 1, v16));
              if (!v17)
              {
                ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
                std::__shared_weak_count::__release_weak(v15);
              }
            }
          }
        }
        else
        {
LABEL_24:
          std::string::basic_string[abi:ne180100]<0>(&v24, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v9 = ImsLogger::warn(ims::_logger, (uint64_t)&v24, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v9 + 8), (uint64_t)"Ignoring didStop notification received for session ", 51);
          *(_BYTE *)(v9 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 24) + 176))(v4 + 24);
          std::ostream::operator<<();
          *(_BYTE *)(v9 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v9 + 64))(v9, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v9 + 17) = 0;
          if (v23 < 0)
            operator delete(__p[0]);
          if (v26 < 0)
            operator delete(v24);
        }
        v10 = v21;
        if (v21)
        {
          v11 = (unint64_t *)&v21->__shared_owners_;
          do
            v12 = __ldaxr(v11);
          while (__stlxr(v12 - 1, v11));
          if (!v12)
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
        }
        v3 = v28;
        if (!v28)
          return;
LABEL_13:
        v7 = (unint64_t *)&v3->__shared_owners_;
        do
          v8 = __ldaxr(v7);
        while (__stlxr(v8 - 1, v7));
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
          std::__shared_weak_count::__release_weak(v3);
        }
        return;
      }
    }
  }
  else
  {
    v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v24, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v6 = ImsLogger::debug(ims::_logger, (uint64_t)&v24, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v6 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidStop:]_block_invoke", 52);
  *(_BYTE *)(v6 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v6 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v6 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v6 + 64))(v6, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v6 + 17) = 0;
  if (v23 < 0)
    operator delete(__p[0]);
  if (v26 < 0)
    operator delete(v24);
  if (v3)
    goto LABEL_13;
}

- (void)streamDidServerDie:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"AVCRTTSessionDelegate::", 23);
  *(_BYTE *)(v4 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidServerDie:]", 44);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVCRTTSessionDelegate_streamDidServerDie___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __44__AVCRTTSessionDelegate_streamDidServerDie___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  char *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  void **v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD v20[2];
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25[2];
  char v26;
  void *v27[2];
  char v28;

  std::string::basic_string[abi:ne180100]<0>(v27, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(v25, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v2 = ImsLogger::error(ims::_logger, (uint64_t)v27, (uint64_t)v25);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)"streamDidServerDie callback triggered. ---> AVCONFERENCED HAS CRASHED!!! <---.", 78);
  *(_BYTE *)(v2 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v2 + 17) = 0;
  if (v26 < 0)
    operator delete(v25[0]);
  if (v28 < 0)
    operator delete(v27[0]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20[0] = &off_1E78B7238;
  v20[1] = &_bambiDomain;
  v21 = 1073741845;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 48))(v3, v20);
  ImsResult::~ImsResult((ImsResult *)v20);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(std::__shared_weak_count **)(v4 + 16);
  if (v5)
  {
    v6 = std::__shared_weak_count::lock(v5);
    v19 = v6;
    if (v6)
    {
      v7 = *(_QWORD *)(v4 + 8);
      if (v7)
      {
        v9 = *(char **)(v7 + 56);
        v8 = *(std::__shared_weak_count **)(v7 + 64);
        v27[0] = v9;
        v27[1] = v8;
        if (v8)
        {
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v11 = __ldxr(p_shared_owners);
          while (__stxr(v11 + 1, p_shared_owners));
        }
        if (v9)
        {
          v12 = v7 + 80;
          v13 = std::__tree<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::list<SipLazuliManager::OutgoingMsrp>>>>::find<std::string>((uint64_t)(v9 + 312), (void **)(v7 + 80));
          if (v9 + 320 == (char *)v13 || *((_DWORD *)v13 + 14) != 1)
            (*(void (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 24) + 24))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v12, 0);
        }
        if (v8)
        {
          v14 = (unint64_t *)&v8->__shared_owners_;
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 - 1, v14));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        v6 = v19;
        goto LABEL_26;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v27, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(v25, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v16 = ImsLogger::debug(ims::_logger, (uint64_t)v27, (uint64_t)v25);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidServerDie:]_block_invoke", 57);
  *(_BYTE *)(v16 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v16 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v16 + 17) = 0;
  if (v26 < 0)
    operator delete(v25[0]);
  if (v28 < 0)
    operator delete(v27[0]);
LABEL_26:
  if (v6)
  {
    v17 = (unint64_t *)&v6->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  AVCRTTSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didPause:error:]", 47);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__AVCRTTSessionDelegate_stream_didPause_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __47__AVCRTTSessionDelegate_stream_didPause_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  const char *v4;
  size_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  void *__p[2];
  char v37;
  void *v38;
  std::__shared_weak_count *v39;
  char v40;

  if (*(_QWORD *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v38, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v2 = ImsLogger::error(ims::_logger, (uint64_t)&v38, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)"Failed to pause session ", 24);
    *(_BYTE *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)" error: ", 8);
    *(_BYTE *)(v2 + 17) = 0;
    objc_msgSend(*(id *)(a1 + 32), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)v4, v5);
    *(_BYTE *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v2 + 17) = 0;

    if (v37 < 0)
      operator delete(__p[0]);
    if (v40 < 0)
      operator delete(v38);
  }
  v6 = *(_QWORD *)(a1 + 48);
  v34 = 0;
  v35 = 0;
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v35 = v8;
    if (v8)
    {
      v9 = *(_QWORD *)(v6 + 8);
      v34 = v9;
      if (v9)
      {
        (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)(v9 + 24) + 152))(&v38, v9 + 24);
        v32 = 0;
        v33 = 0;
        if (!v39)
          goto LABEL_36;
        v33 = std::__shared_weak_count::lock(v39);
        if (v33)
        {
          v10 = v38;
          v32 = v38;
        }
        else
        {
          v10 = 0;
        }
        if (v39)
          std::__shared_weak_count::__release_weak(v39);
        if (v10)
        {
          if (*(_BYTE *)(v9 + 477))
          {
            *(_BYTE *)(v9 + 477) = 0;
            p_shared_owners = (unint64_t *)&v8->__shared_owners_;
            v30 = v9 + 24;
            v31 = v8;
            do
              v15 = __ldxr(p_shared_owners);
            while (__stxr(v15 + 1, p_shared_owners));
            if (*(_BYTE *)(a1 + 56))
              v16 = 0;
            else
              v16 = 9;
            (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v10 + 16))(v10, &v30, v16);
            v17 = v31;
            if (!v31)
              goto LABEL_50;
            v18 = (unint64_t *)&v31->__shared_owners_;
            do
              v19 = __ldaxr(v18);
            while (__stlxr(v19 - 1, v18));
          }
          else
          {
            v28 = v9 + 24;
            v29 = v8;
            v21 = (unint64_t *)&v8->__shared_owners_;
            do
              v22 = __ldxr(v21);
            while (__stxr(v22 + 1, v21));
            if (*(_BYTE *)(a1 + 56))
              v23 = 0;
            else
              v23 = 9;
            (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, &v28, v23);
            v17 = v29;
            if (!v29)
              goto LABEL_50;
            v24 = (unint64_t *)&v29->__shared_owners_;
            do
              v19 = __ldaxr(v24);
            while (__stlxr(v19 - 1, v24));
          }
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        else
        {
LABEL_36:
          std::string::basic_string[abi:ne180100]<0>(&v38, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v20 = ImsLogger::warn(ims::_logger, (uint64_t)&v38, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v20 + 8), (uint64_t)"Ignoring didPause notification received for session ", 52);
          *(_BYTE *)(v20 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)(v9 + 24) + 176))(v9 + 24);
          std::ostream::operator<<();
          *(_BYTE *)(v20 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v20 + 64))(v20, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v20 + 17) = 0;
          if (v37 < 0)
            operator delete(__p[0]);
          if (v40 < 0)
            operator delete(v38);
        }
LABEL_50:
        v25 = v33;
        if (v33)
        {
          v26 = (unint64_t *)&v33->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        v8 = v35;
        if (!v35)
          return;
LABEL_18:
        v12 = (unint64_t *)&v8->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        return;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v38, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v11 = ImsLogger::debug(ims::_logger, (uint64_t)&v38, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v11 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didPause:error:]_block_invoke", 60);
  *(_BYTE *)(v11 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v11 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v11 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v11 + 64))(v11, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v11 + 17) = 0;
  if (v37 < 0)
    operator delete(__p[0]);
  if (v40 < 0)
    operator delete(v38);
  if (v8)
    goto LABEL_18;
}

- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  AVCRTTSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didResume:error:]", 48);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__AVCRTTSessionDelegate_stream_didResume_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __48__AVCRTTSessionDelegate_stream_didResume_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  const char *v4;
  size_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  void *__p[2];
  char v33;
  void *v34;
  std::__shared_weak_count *v35;
  char v36;

  if (*(_QWORD *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v34, "avc.rtt.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v2 = ImsLogger::error(ims::_logger, (uint64_t)&v34, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)"Failed to resume session ", 25);
    *(_BYTE *)(v2 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v2 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)" error: ", 8);
    *(_BYTE *)(v2 + 17) = 0;
    objc_msgSend(*(id *)(a1 + 32), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = strlen(v4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)v4, v5);
    *(_BYTE *)(v2 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v2 + 17) = 0;

    if (v33 < 0)
      operator delete(__p[0]);
    if (v36 < 0)
      operator delete(v34);
  }
  v6 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  v31 = 0;
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v31 = v8;
    if (v8)
    {
      v9 = *(_QWORD *)(v6 + 8);
      v30 = v9;
      if (v9)
      {
        v11 = *(_QWORD *)(v9 + 24);
        v10 = v9 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v11 + 152))(&v34, v10);
        v28 = 0;
        v29 = 0;
        if (!v35)
          goto LABEL_36;
        v29 = std::__shared_weak_count::lock(v35);
        if (v29)
        {
          v12 = v34;
          v28 = v34;
        }
        else
        {
          v12 = 0;
        }
        if (v35)
          std::__shared_weak_count::__release_weak(v35);
        if (v12)
        {
          v26 = v10;
          v27 = v8;
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v17 = __ldxr(p_shared_owners);
          while (__stxr(v17 + 1, p_shared_owners));
          if (*(_BYTE *)(a1 + 56))
            v18 = 0;
          else
            v18 = 9;
          (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v12 + 24))(v12, &v26, v18);
          v19 = v27;
          if (v27)
          {
            v20 = (unint64_t *)&v27->__shared_owners_;
            do
              v21 = __ldaxr(v20);
            while (__stlxr(v21 - 1, v20));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
            }
          }
        }
        else
        {
LABEL_36:
          std::string::basic_string[abi:ne180100]<0>(&v34, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v22 = ImsLogger::warn(ims::_logger, (uint64_t)&v34, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v22 + 8), (uint64_t)"Ignoring didResume notification received for session ", 53);
          *(_BYTE *)(v22 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 176))(v10);
          std::ostream::operator<<();
          *(_BYTE *)(v22 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v22 + 64))(v22, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v22 + 17) = 0;
          if (v33 < 0)
            operator delete(__p[0]);
          if (v36 < 0)
            operator delete(v34);
        }
        v23 = v29;
        if (v29)
        {
          v24 = (unint64_t *)&v29->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        v8 = v31;
        if (!v31)
          return;
LABEL_18:
        v14 = (unint64_t *)&v8->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        return;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v34, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v13 = ImsLogger::debug(ims::_logger, (uint64_t)&v34, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)"-[AVCRTTSessionDelegate stream:didResume:error:]_block_invoke", 61);
  *(_BYTE *)(v13 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v13 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v13 + 17) = 0;
  if (v33 < 0)
    operator delete(__p[0]);
  if (v36 < 0)
    operator delete(v34);
  if (v8)
    goto LABEL_18;
}

- (void)streamDidRTPTimeOut:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTPTimeOut:]", 45);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCRTTSessionDelegate_streamDidRTPTimeOut___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __45__AVCRTTSessionDelegate_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  void *v22;
  std::__shared_weak_count *v23;
  void *__p[2];
  char v25;
  void *v26;
  std::__shared_weak_count *v27;
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  v1 = *(_QWORD *)(a1 + 32);
  v29 = 0;
  v30 = 0;
  v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v30 = v3;
    if (v3)
    {
      v4 = *(_QWORD *)(v1 + 8);
      v29 = v4;
      if (v4)
      {
        v6 = *(_QWORD *)(v4 + 24);
        v5 = v4 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v6 + 152))(&v26, v5);
        v22 = 0;
        v23 = 0;
        if (!v27)
          goto LABEL_28;
        v23 = std::__shared_weak_count::lock(v27);
        if (v23)
        {
          v7 = v26;
          v22 = v26;
        }
        else
        {
          v7 = 0;
        }
        if (v27)
          std::__shared_weak_count::__release_weak(v27);
        if (v7)
        {
          v20 = v5;
          v21 = v3;
          p_shared_owners = (unint64_t *)&v3->__shared_owners_;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
          (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v7 + 40))(v7, &v20, 5);
          v13 = v21;
          if (v21)
          {
            v14 = (unint64_t *)&v21->__shared_owners_;
            do
              v15 = __ldaxr(v14);
            while (__stlxr(v15 - 1, v14));
            if (!v15)
            {
              ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
              std::__shared_weak_count::__release_weak(v13);
            }
          }
        }
        else
        {
LABEL_28:
          std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v16 = ImsLogger::warn(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"Ignoring RTP timeout notification received for session ", 55);
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 176))(v5);
          std::ostream::operator<<();
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v16 + 17) = 0;
          if (v25 < 0)
            operator delete(__p[0]);
          if (v28 < 0)
            operator delete(v26);
        }
        v17 = v23;
        if (v23)
        {
          v18 = (unint64_t *)&v23->__shared_owners_;
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 - 1, v18));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        v3 = v30;
        if (!v30)
          return;
LABEL_13:
        v9 = (unint64_t *)&v3->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
          std::__shared_weak_count::__release_weak(v3);
        }
        return;
      }
    }
  }
  else
  {
    v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v8 = ImsLogger::debug(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTPTimeOut:]_block_invoke", 58);
  *(_BYTE *)(v8 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v8 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v8 + 64))(v8, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v8 + 17) = 0;
  if (v25 < 0)
    operator delete(__p[0]);
  if (v28 < 0)
    operator delete(v26);
  if (v3)
    goto LABEL_13;
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTCPTimeOut:]", 46);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVCRTTSessionDelegate_streamDidRTCPTimeOut___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __46__AVCRTTSessionDelegate_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  void *v22;
  std::__shared_weak_count *v23;
  void *__p[2];
  char v25;
  void *v26;
  std::__shared_weak_count *v27;
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  v1 = *(_QWORD *)(a1 + 32);
  v29 = 0;
  v30 = 0;
  v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    v30 = v3;
    if (v3)
    {
      v4 = *(_QWORD *)(v1 + 8);
      v29 = v4;
      if (v4)
      {
        v6 = *(_QWORD *)(v4 + 24);
        v5 = v4 + 24;
        (*(void (**)(void **__return_ptr, uint64_t))(v6 + 152))(&v26, v5);
        v22 = 0;
        v23 = 0;
        if (!v27)
          goto LABEL_28;
        v23 = std::__shared_weak_count::lock(v27);
        if (v23)
        {
          v7 = v26;
          v22 = v26;
        }
        else
        {
          v7 = 0;
        }
        if (v27)
          std::__shared_weak_count::__release_weak(v27);
        if (v7)
        {
          v20 = v5;
          v21 = v3;
          p_shared_owners = (unint64_t *)&v3->__shared_owners_;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
          (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v7 + 40))(v7, &v20, 6);
          v13 = v21;
          if (v21)
          {
            v14 = (unint64_t *)&v21->__shared_owners_;
            do
              v15 = __ldaxr(v14);
            while (__stlxr(v15 - 1, v14));
            if (!v15)
            {
              ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
              std::__shared_weak_count::__release_weak(v13);
            }
          }
        }
        else
        {
LABEL_28:
          std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v16 = ImsLogger::warn(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"Ignoring RTCP timeout notification received for session ", 56);
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 176))(v5);
          std::ostream::operator<<();
          *(_BYTE *)(v16 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v16 + 17) = 0;
          if (v25 < 0)
            operator delete(__p[0]);
          if (v28 < 0)
            operator delete(v26);
        }
        v17 = v23;
        if (v23)
        {
          v18 = (unint64_t *)&v23->__shared_owners_;
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 - 1, v18));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }
        v3 = v30;
        if (!v30)
          return;
LABEL_13:
        v9 = (unint64_t *)&v3->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
          std::__shared_weak_count::__release_weak(v3);
        }
        return;
      }
    }
  }
  else
  {
    v3 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.rtt.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v8 = ImsLogger::debug(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)"-[AVCRTTSessionDelegate streamDidRTCPTimeOut:]_block_invoke", 59);
  *(_BYTE *)(v8 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v8 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v8 + 64))(v8, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v8 + 17) = 0;
  if (v25 < 0)
    operator delete(__p[0]);
  if (v28 < 0)
    operator delete(v26);
  if (v3)
    goto LABEL_13;
}

- (AVCRTTSessionDelegate)initWithOwner:(shared_ptr<AVCRTTSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4
{
  uint64_t *var1;
  AVCRTTSession *var0;
  uint64_t v7;
  AVCRTTSessionDelegate *v8;
  AVCRTTSessionDelegate *v9;
  uint64_t v10;
  AVCRTTSession *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *cntrl;
  objc_super v16;
  void *__p[2];
  char v18;
  void *v19[2];
  char v20;

  var1 = (uint64_t *)a3.var1;
  var0 = a3.var0;
  std::string::basic_string[abi:ne180100]<0>(v19, "avc.rtt.sessiondelegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v7 = ImsLogger::debug(ims::_logger, (uint64_t)v19, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v7 + 8), (uint64_t)"-[AVCRTTSessionDelegate initWithOwner:andStackController:]", 58);
  *(_BYTE *)(v7 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v7 + 17) = 0;
  if (v18 < 0)
    operator delete(__p[0]);
  if (v20 < 0)
    operator delete(v19[0]);
  v16.receiver = self;
  v16.super_class = (Class)AVCRTTSessionDelegate;
  v8 = -[AVCRTTSessionDelegate init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v11 = *(AVCRTTSession **)var0;
    v10 = *((_QWORD *)var0 + 1);
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 16);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    cntrl = (std::__shared_weak_count *)v8->owner.__cntrl_;
    v9->owner.__ptr_ = v11;
    v9->owner.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    std::shared_ptr<IpAddress>::operator=[abi:ne180100](&v9->stackController.__ptr_, var1);
  }
  return v9;
}

- (weak_ptr<AVCRTTSession>)owner
{
  AVCRTTSession **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  weak_ptr<AVCRTTSession> result;

  cntrl = self->owner.__cntrl_;
  *v2 = self->owner.__ptr_;
  v2[1] = (AVCRTTSession *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCRTTSession *)self;
  return result;
}

- (void)setOwner:(weak_ptr<AVCRTTSession>)a3
{
  __shared_weak_count *v3;
  AVCRTTSession *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;

  v4 = *(AVCRTTSession **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->owner.__cntrl_;
  self->owner.__ptr_ = v4;
  self->owner.__cntrl_ = v3;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (shared_ptr<AVCRTPStackController>)stackController
{
  AVCRTPStackController **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<AVCRTPStackController> result;

  cntrl = self->stackController.__cntrl_;
  *v2 = self->stackController.__ptr_;
  v2[1] = (AVCRTPStackController *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCRTPStackController *)self;
  return result;
}

- (void)setStackController:(shared_ptr<AVCRTPStackController>)a3
{
  std::shared_ptr<IpAddress>::operator=[abi:ne180100](&self->stackController.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  std::shared_ptr<RTPManager>::~shared_ptr[abi:ne180100]((uint64_t)&self->stackController);
  cntrl = self->owner.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
