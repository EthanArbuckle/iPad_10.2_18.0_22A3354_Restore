@implementation AVCAudioSessionDelegate

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
  AVCAudioSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didStart:error:]", 49);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__AVCAudioSessionDelegate_stream_didStart_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __49__AVCAudioSessionDelegate_stream_didStart_error___block_invoke(uint64_t a1)
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
    std::string::basic_string[abi:ne180100]<0>(&v41, "avc.audio.delegate");
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
          MediaSessionDriver::cancelTimerForRequest((uint64_t **)(v9 + 24), 0);
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
                AVCRTPSession<AVCAudioStream>::pauseAVCSession(v9);
                goto LABEL_61;
              }
              v15 = *(_BYTE *)(a1 + 56);
            }
            *(_BYTE *)(v9 + 473) = v15;
            *(_BYTE *)(v9 + 474) = *(_BYTE *)(a1 + 56) ^ 1;
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
          *(_BYTE *)(v9 + 474) = *(_BYTE *)(a1 + 56) ^ 1;
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
          std::string::basic_string[abi:ne180100]<0>(&v41, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v41, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v12 = ImsLogger::debug(ims::_logger, (uint64_t)&v41, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didStart:error:]_block_invoke", 62);
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
  AVCAudioSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didPause:error:]", 49);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__AVCAudioSessionDelegate_stream_didPause_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __49__AVCAudioSessionDelegate_stream_didPause_error___block_invoke(uint64_t a1)
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
    std::string::basic_string[abi:ne180100]<0>(&v38, "avc.audio.delegate");
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
            *(_BYTE *)(v9 + 474) = 1;
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
          std::string::basic_string[abi:ne180100]<0>(&v38, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v38, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v11 = ImsLogger::debug(ims::_logger, (uint64_t)&v38, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v11 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didPause:error:]_block_invoke", 62);
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
  AVCAudioSessionDelegate *v16;
  BOOL v17;
  void *__p[2];
  char v19;
  void *v20[2];
  char v21;

  v8 = a3;
  v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didResume:error:]", 50);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__AVCAudioSessionDelegate_stream_didResume_error___block_invoke;
  v13[3] = &unk_1E78BB000;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = self;
  v17 = a4;
  ims::performBlock((IMSClientManager *)v13);

}

void __50__AVCAudioSessionDelegate_stream_didResume_error___block_invoke(uint64_t a1)
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
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  void *v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  void *__p[2];
  char v31;
  void *v32;
  std::__shared_weak_count *v33;
  char v34;

  if (*(_QWORD *)(a1 + 32))
  {
    std::string::basic_string[abi:ne180100]<0>(&v32, "avc.audio.delegate");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v2 = ImsLogger::error(ims::_logger, (uint64_t)&v32, (uint64_t)__p);
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

    if (v31 < 0)
      operator delete(__p[0]);
    if (v34 < 0)
      operator delete(v32);
  }
  v6 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  v29 = 0;
  v7 = *(std::__shared_weak_count **)(v6 + 16);
  if (v7)
  {
    v8 = std::__shared_weak_count::lock(v7);
    v29 = v8;
    if (v8)
    {
      v9 = *(_QWORD *)(v6 + 8);
      v28 = v9;
      if (v9)
      {
        (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)(v9 + 24) + 152))(&v32, v9 + 24);
        v26 = 0;
        v27 = 0;
        if (!v33)
          goto LABEL_36;
        v27 = std::__shared_weak_count::lock(v33);
        if (v27)
        {
          v10 = v32;
          v26 = v32;
        }
        else
        {
          v10 = 0;
        }
        if (v33)
          std::__shared_weak_count::__release_weak(v33);
        if (v10)
        {
          *(_BYTE *)(v9 + 474) = 0;
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          v24 = v9 + 24;
          v25 = v8;
          do
            v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
          if (*(_BYTE *)(a1 + 56))
            v16 = 0;
          else
            v16 = 9;
          (*(void (**)(void *, uint64_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, &v24, v16);
          v17 = v25;
          if (v25)
          {
            v18 = (unint64_t *)&v25->__shared_owners_;
            do
              v19 = __ldaxr(v18);
            while (__stlxr(v19 - 1, v18));
            if (!v19)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
        else
        {
LABEL_36:
          std::string::basic_string[abi:ne180100]<0>(&v32, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v20 = ImsLogger::warn(ims::_logger, (uint64_t)&v32, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v20 + 8), (uint64_t)"Ignoring didResume notification received for session ", 53);
          *(_BYTE *)(v20 + 17) = 0;
          (*(void (**)(uint64_t))(*(_QWORD *)(v9 + 24) + 176))(v9 + 24);
          std::ostream::operator<<();
          *(_BYTE *)(v20 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v20 + 64))(v20, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v20 + 17) = 0;
          if (v31 < 0)
            operator delete(__p[0]);
          if (v34 < 0)
            operator delete(v32);
        }
        v21 = v27;
        if (v27)
        {
          v22 = (unint64_t *)&v27->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        v8 = v29;
        if (!v29)
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
  std::string::basic_string[abi:ne180100]<0>(&v32, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v11 = ImsLogger::debug(ims::_logger, (uint64_t)&v32, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v11 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didResume:error:]_block_invoke", 63);
  *(_BYTE *)(v11 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v11 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v11 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v11 + 64))(v11, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v11 + 17) = 0;
  if (v31 < 0)
    operator delete(__p[0]);
  if (v34 < 0)
    operator delete(v32);
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

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidStop:]", 41);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVCAudioSessionDelegate_streamDidStop___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __41__AVCAudioSessionDelegate_streamDidStop___block_invoke(uint64_t a1)
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
          MediaSessionDriver::cancelTimerForRequest((uint64_t **)(v4 + 24), 2);
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
          std::string::basic_string[abi:ne180100]<0>(&v24, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v24, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v6 = ImsLogger::debug(ims::_logger, (uint64_t)&v24, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v6 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidStop:]_block_invoke", 54);
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

- (void)streamDidRTPTimeOut:(id)a3
{
  uint64_t v4;
  _QWORD v5[5];
  void *__p[2];
  char v7;
  void *v8[2];
  char v9;

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTPTimeOut:]", 47);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVCAudioSessionDelegate_streamDidRTPTimeOut___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __47__AVCAudioSessionDelegate_streamDidRTPTimeOut___block_invoke(uint64_t a1)
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
          std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v8 = ImsLogger::debug(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTPTimeOut:]_block_invoke", 60);
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

  std::string::basic_string[abi:ne180100]<0>(v8, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v8, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTCPTimeOut:]", 48);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v7 < 0)
    operator delete(__p[0]);
  if (v9 < 0)
    operator delete(v8[0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVCAudioSessionDelegate_streamDidRTCPTimeOut___block_invoke;
  v5[3] = &unk_1E78BB028;
  v5[4] = self;
  ims::performBlock((IMSClientManager *)v5);
}

void __48__AVCAudioSessionDelegate_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
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
          std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(&v26, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v8 = ImsLogger::debug(ims::_logger, (uint64_t)&v26, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v8 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidRTCPTimeOut:]_block_invoke", 61);
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

- (void)stream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  uint64_t v6;
  _QWORD v7[5];
  char v8;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  std::string::basic_string[abi:ne180100]<0>(v11, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v6 = ImsLogger::debug(ims::_logger, (uint64_t)v11, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v6 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didReceiveDTMFEventWithDigit:]", 63);
  *(_BYTE *)(v6 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v6 + 64))(v6, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v6 + 17) = 0;
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVCAudioSessionDelegate_stream_didReceiveDTMFEventWithDigit___block_invoke;
  v7[3] = &unk_1E78E7470;
  v8 = a4;
  v7[4] = self;
  ims::performBlock((IMSClientManager *)v7);
}

void __63__AVCAudioSessionDelegate_stream_didReceiveDTMFEventWithDigit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  void *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p;
  std::__shared_weak_count *v20;
  char v21;
  void *v22[2];
  char v23;
  void *v24[2];
  char v25;

  std::string::basic_string[abi:ne180100]<0>(v24, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(v22, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v2 = ImsLogger::debug(ims::_logger, (uint64_t)v24, (uint64_t)v22);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v2 + 8), (uint64_t)"DTMF digit received: ", 21);
  *(_BYTE *)(v2 + 17) = 0;
  v3 = (char *)(a1 + 40);
  ims::detail::to_string_impl<char,std::integral_constant<BOOL,false>>::operator()((char *)(a1 + 40), &__p);
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v2 + 32))(v2, &__p);
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v2 + 64))(v2, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v2 + 17) = 0;
  if (v21 < 0)
    operator delete(__p);
  if (v23 < 0)
    operator delete(v22[0]);
  if (v25 < 0)
    operator delete(v24[0]);
  v4 = *(_QWORD *)(a1 + 32);
  __p = 0;
  v20 = 0;
  v5 = *(std::__shared_weak_count **)(v4 + 16);
  if (v5)
  {
    v6 = std::__shared_weak_count::lock(v5);
    v20 = v6;
    if (v6)
    {
      v7 = *(_QWORD **)(v4 + 8);
      __p = v7;
      if (v7)
      {
        v8 = v7 + 3;
        v10 = (void *)v7[7];
        v9 = (std::__shared_weak_count *)v7[8];
        v24[0] = v10;
        v24[1] = v9;
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
        }
        v13 = (*(uint64_t (**)(_QWORD *))(*v8 + 176))(v8);
        RTPManager::handleIncomingDtmf((RTPManager *)v10, v13, *v3);
        if (v9)
        {
          v14 = (unint64_t *)&v9->__shared_owners_;
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 - 1, v14));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
        v6 = v20;
        goto LABEL_24;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v24, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(v22, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v16 = ImsLogger::debug(ims::_logger, (uint64_t)v24, (uint64_t)v22);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didReceiveDTMFEventWithDigit:]_block_invoke", 76);
  *(_BYTE *)(v16 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v16 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v16 + 17) = 0;
  if (v23 < 0)
    operator delete(v22[0]);
  if (v25 < 0)
    operator delete(v24[0]);
LABEL_24:
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

- (void)stream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  AVCAudioSessionDelegate *v12;
  void *__p[2];
  char v14;
  void *v15[2];
  char v16;

  v5 = a4;
  std::string::basic_string[abi:ne180100]<0>(v15, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v6 = ImsLogger::debug(ims::_logger, (uint64_t)v15, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v6 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:didReceiveRTCPPackets:]", 56);
  *(_BYTE *)(v6 + 17) = 0;
  v7 = (*(uint64_t (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v6 + 64))(v6, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v6 + 17) = 0;
  if (v14 < 0)
    operator delete(__p[0]);
  if (v16 < 0)
    operator delete(v15[0]);
  v8 = (void *)MEMORY[0x1C3B876AC](v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke;
  v10[3] = &unk_1E78E74C0;
  v9 = v5;
  v11 = v9;
  v12 = self;
  ims::performBlock((IMSClientManager *)v10);

  objc_autoreleasePoolPop(v8);
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  int v47;
  _QWORD v48[3];
  int v49;
  char v50;
  std::string v51;
  __int128 v52;
  __int128 v53;
  std::string __str;
  std::string v55;
  _QWORD v56[6];
  _QWORD v57[6];
  void *v58[6];
  __int128 v59;
  __int128 v60;
  __int128 __p;
  uint64_t v62;
  _QWORD v63[6];
  void (**v64)(RTCPSDesPacket *__hidden);
  void (***v65)(RTCPSDesPacket *__hidden);
  uint64_t v66;
  __n128 (*v67)(uint64_t, uint64_t);
  void (*v68)(_QWORD *);
  const char *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  void **v75[3];

  v1 = a1;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v44 = v3;
      v45 = v1;
      do
      {
        objc_msgSend(*(id *)(v1 + 32), "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (!v6)
        {
          std::string::basic_string[abi:ne180100]<0>(&v64, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(v58, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v13 = ImsLogger::debug(ims::_logger, (uint64_t)&v64, (uint64_t)v58);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)"NULL Packet at index: ", 22);
          *(_BYTE *)(v13 + 17) = 0;
          std::ostream::operator<<();
          *(_BYTE *)(v13 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          goto LABEL_14;
        }
        v8 = objc_msgSend(v6, "packetType");
        switch(v8)
        {
          case 200:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v64, "avc.audio.delegate");
              std::string::basic_string[abi:ne180100]<0>(v58, "");
              pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
              v13 = ImsLogger::error(ims::_logger, (uint64_t)&v64, (uint64_t)v58);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)"Packet type is not AVCRTCPSenderReport", 38);
              *(_BYTE *)(v13 + 17) = 0;
              (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
              goto LABEL_14;
            }
            v9 = v7;
            v14 = objc_msgSend(v9, "NTPMostSignificantWord");
            v15 = objc_msgSend(v9, "NTPLeastSignificantWord");
            v16 = objc_msgSend(v9, "RTPTimestamp");
            v17 = objc_msgSend(v9, "packetsSent");
            v18 = objc_msgSend(v9, "octetsSent");
            v64 = 0;
            v65 = &v64;
            v66 = 0x7812000000;
            v67 = __Block_byref_object_copy__7;
            v68 = __Block_byref_object_dispose__7;
            v69 = "";
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0;
            v19 = objc_msgSend(v9, "SSRC");
            BYTE8(v70) = 0;
            WORD6(v70) = 0;
            LODWORD(v71) = 0;
            WORD2(v71) = 0;
            *(_QWORD *)&v70 = &off_1E78E7800;
            *((_QWORD *)&v71 + 1) = __PAIR64__(v14, v19);
            *(_QWORD *)&v72 = __PAIR64__(v16, v15);
            *((_QWORD *)&v72 + 1) = __PAIR64__(v18, v17);
            v74 = 0;
            v73 = 0uLL;
            v20 = *(void **)(v45 + 40);
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_17;
            v63[3] = &unk_1E78E7498;
            v63[4] = v20;
            v63[5] = &v64;
            objc_msgSend(v20, "handleRTCPPacketWithBlock:", v63);
            objc_msgSend(v9, "receiverReport");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              v43 = objc_msgSend(v21, "reportedSourceSSRC");
              v23 = objc_msgSend(v22, "fractionLost");
              v24 = objc_msgSend(v22, "cumulativePacketsLost");
              v25 = objc_msgSend(v22, "extendedHighestSequenceNumber");
              v26 = objc_msgSend(v22, "interarrivalJitter");
              v27 = objc_msgSend(v22, "lastSRTimestamp");
              v28 = objc_msgSend(v22, "delaySinceLastSR");
              v58[0] = 0;
              v58[1] = v58;
              v58[2] = (void *)0x6812000000;
              v58[3] = __Block_byref_object_copy__18;
              v58[4] = __Block_byref_object_dispose__19;
              v58[5] = "";
              v59 = 0u;
              v60 = 0u;
              __p = 0u;
              v62 = 0;
              v29 = objc_msgSend(v9, "SSRC");
              BYTE8(v59) = 0;
              WORD6(v59) = 0;
              LODWORD(v60) = 0;
              WORD2(v60) = 0;
              *(_QWORD *)&v59 = &off_1E78EA878;
              DWORD2(v60) = v29;
              v62 = 0;
              __p = 0uLL;
              BYTE7(v52) = 0;
              *(_WORD *)((char *)&v52 + 5) = 0;
              LODWORD(v52) = v43;
              BYTE4(v52) = v23;
              *((_QWORD *)&v52 + 1) = __PAIR64__(v25, v24);
              *(_QWORD *)&v53 = __PAIR64__(v27, v26);
              DWORD2(v53) = v28;
              RTCPReceiverReports::addReport((void **)v58[1] + 10, &v52);
              v30 = *(void **)(v45 + 40);
              v57[0] = MEMORY[0x1E0C809B0];
              v57[1] = 3221225472;
              v57[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_21;
              v57[3] = &unk_1E78E7498;
              v57[4] = v30;
              v57[5] = v58;
              objc_msgSend(v30, "handleRTCPPacketWithBlock:", v57);
              _Block_object_dispose(v58, 8);
              *(_QWORD *)&v59 = &off_1E78EA878;
              if ((_QWORD)__p)
              {
                *((_QWORD *)&__p + 1) = __p;
                operator delete((void *)__p);
              }
            }

            _Block_object_dispose(&v64, 8);
            *(_QWORD *)&v70 = &off_1E78E7800;
            v31 = (void *)v73;
            if ((_QWORD)v73)
            {
              *((_QWORD *)&v73 + 1) = v73;
LABEL_44:
              operator delete(v31);
            }
            break;
          case 201:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v64, "avc.audio.delegate");
              std::string::basic_string[abi:ne180100]<0>(v58, "");
              pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
              v13 = ImsLogger::error(ims::_logger, (uint64_t)&v64, (uint64_t)v58);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)"Packet type is not AVCRTCPReceiverReport", 40);
              *(_BYTE *)(v13 + 17) = 0;
              (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
LABEL_14:
              *(_BYTE *)(v13 + 17) = 0;
LABEL_25:
              if (SHIBYTE(v58[2]) < 0)
                operator delete(v58[0]);
              if (SHIBYTE(v66) < 0)
                operator delete(v64);
              goto LABEL_46;
            }
            v9 = v7;
            v32 = objc_msgSend(v9, "reportedSourceSSRC");
            v33 = objc_msgSend(v9, "fractionLost");
            v34 = objc_msgSend(v9, "cumulativePacketsLost");
            v35 = objc_msgSend(v9, "extendedHighestSequenceNumber");
            v36 = objc_msgSend(v9, "interarrivalJitter");
            v37 = objc_msgSend(v9, "lastSRTimestamp");
            v38 = objc_msgSend(v9, "delaySinceLastSR");
            v64 = 0;
            v65 = &v64;
            v66 = 0x6812000000;
            v67 = __Block_byref_object_copy__18;
            v68 = __Block_byref_object_dispose__19;
            v69 = "";
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            *(_QWORD *)&v73 = 0;
            v39 = objc_msgSend(v9, "SSRC");
            BYTE8(v70) = 0;
            WORD6(v70) = 0;
            LODWORD(v71) = 0;
            WORD2(v71) = 0;
            *(_QWORD *)&v70 = &off_1E78EA878;
            DWORD2(v71) = v39;
            *(_QWORD *)&v73 = 0;
            v72 = 0uLL;
            HIBYTE(v58[0]) = 0;
            *(_WORD *)((char *)v58 + 5) = 0;
            LODWORD(v58[0]) = v32;
            BYTE4(v58[0]) = v33;
            v58[1] = (void *)__PAIR64__(v35, v34);
            v58[2] = (void *)__PAIR64__(v37, v36);
            LODWORD(v58[3]) = v38;
            RTCPReceiverReports::addReport((void **)v65 + 10, (__int128 *)v58);
            v40 = *(void **)(v45 + 40);
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_2;
            v56[3] = &unk_1E78E7498;
            v56[4] = v40;
            v56[5] = &v64;
            objc_msgSend(v40, "handleRTCPPacketWithBlock:", v56);
            _Block_object_dispose(&v64, 8);
            *(_QWORD *)&v70 = &off_1E78EA878;
            v31 = (void *)v72;
            if ((_QWORD)v72)
            {
              *((_QWORD *)&v72 + 1) = v72;
              goto LABEL_44;
            }
            break;
          case 202:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              std::string::basic_string[abi:ne180100]<0>(&v64, "avc.audio.delegate");
              std::string::basic_string[abi:ne180100]<0>(v58, "");
              pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
              v13 = ImsLogger::error(ims::_logger, (uint64_t)&v64, (uint64_t)v58);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v13 + 8), (uint64_t)"Packet type is not AVCRTCPSourceDescription", 43);
              *(_BYTE *)(v13 + 17) = 0;
              (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v13 + 64))(v13, std::endl[abi:ne180100]<char,std::char_traits<char>>);
              goto LABEL_14;
            }
            v9 = v7;
            memset(&v55, 0, sizeof(v55));
            std::string::basic_string[abi:ne180100]<0>(&v55, "");
            objc_msgSend(v9, "text");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
              std::string::__assign_external(&v55, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
            memset(v58, 0, 32);
            v12 = objc_msgSend(v9, "type");
            if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&__str, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
            else
              __str = v55;
            RTCPSDesItem::RTCPSDesItem((uint64_t)v58, v12, &__str);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
            v52 = 0u;
            v53 = 0u;
            LODWORD(v52) = objc_msgSend(v9, "SSRC");
            v53 = 0uLL;
            *((_QWORD *)&v52 + 1) = 0;
            v49 = (int)v58[0];
            v50 = BYTE4(v58[0]);
            if (SHIBYTE(v58[3]) < 0)
              std::string::__init_copy_ctor_external(&v51, (const std::string::value_type *)v58[1], (std::string::size_type)v58[2]);
            else
              v51 = *(std::string *)&v58[1];
            RTCPSDesInfo::addSDesItem((uint64_t)&v52, &v49);
            if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v51.__r_.__value_.__l.__data_);
            v65 = 0;
            v66 = 0;
            v64 = off_1E78EC310;
            v68 = 0;
            v69 = 0;
            v67 = 0;
            v47 = v52;
            memset(v48, 0, sizeof(v48));
            std::vector<RTCPSDesItem>::__init_with_size[abi:ne180100]<RTCPSDesItem*,RTCPSDesItem*>(v48, *((uint64_t *)&v52 + 1), v53, (uint64_t)(v53 - *((_QWORD *)&v52 + 1)) >> 5);
            RTCPSDesPacket::addSDesInfo((uint64_t *)&v64, (uint64_t)&v47);
            v75[0] = (void **)v48;
            std::vector<RTCPSDesItem>::__destroy_vector::operator()[abi:ne180100](v75);
            v42 = *(void **)(v45 + 40);
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_3;
            v46[3] = &unk_1E78BB028;
            v46[4] = v42;
            objc_msgSend(v42, "handleRTCPPacketWithBlock:", v46);
            v64 = off_1E78EC310;
            v75[0] = (void **)&v67;
            std::vector<RTCPSDesInfo>::__destroy_vector::operator()[abi:ne180100](v75);
            v64 = (void (**)(RTCPSDesPacket *__hidden))&v52 + 1;
            std::vector<RTCPSDesItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v64);
            if (SHIBYTE(v58[3]) < 0)
              operator delete(v58[1]);

            if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
            {
              v31 = (void *)v55.__r_.__value_.__r.__words[0];
              goto LABEL_44;
            }
            break;
          default:
            std::string::basic_string[abi:ne180100]<0>(&v64, "avc.audio.delegate");
            std::string::basic_string[abi:ne180100]<0>(v58, "");
            pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
            v41 = ImsLogger::debug(ims::_logger, (uint64_t)&v64, (uint64_t)v58);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v41 + 8), (uint64_t)"Ignoring RTCP packet at index: ", 31);
            *(_BYTE *)(v41 + 17) = 0;
            std::ostream::operator<<();
            *(_BYTE *)(v41 + 17) = 0;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v41 + 8), (uint64_t)" with Type: ", 12);
            *(_BYTE *)(v41 + 17) = 0;
            objc_msgSend(v7, "packetType");
            std::ostream::operator<<();
            *(_BYTE *)(v41 + 17) = 0;
            (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v41 + 64))(v41, std::endl[abi:ne180100]<char,std::char_traits<char>>);
            *(_BYTE *)(v41 + 17) = 0;
            goto LABEL_25;
        }

        v4 = v44;
        v1 = v45;
LABEL_46:

        ++v5;
      }
      while (v4 != v5);
    }
  }
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (!v3)
    return;
  v4 = std::__shared_weak_count::lock(v3);
  v16 = v4;
  if (!v4)
    return;
  v5 = *(_QWORD *)(v2 + 8);
  if (!v5)
  {
    v13 = v4;
LABEL_17:
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    return;
  }
  v6 = *(_QWORD *)(v5 + 56);
  v7 = *(std::__shared_weak_count **)(v5 + 64);
  if (v7)
  {
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = *(_QWORD *)(v6 + 296);
  if (v10)
    AnalyticsLogger::logRemoteRTCPSRPacket(*(AnalyticsLogger **)(v10 + 120), (const RTCPSRPacket *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  if (v7)
  {
    v11 = (unint64_t *)&v7->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v13 = v16;
  if (v16)
    goto LABEL_17;
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (!v3)
    return;
  v4 = std::__shared_weak_count::lock(v3);
  v16 = v4;
  if (!v4)
    return;
  v5 = *(_QWORD *)(v2 + 8);
  if (!v5)
  {
    v13 = v4;
LABEL_17:
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    return;
  }
  v6 = *(_QWORD *)(v5 + 56);
  v7 = *(std::__shared_weak_count **)(v5 + 64);
  if (v7)
  {
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = *(_QWORD *)(v6 + 296);
  if (v10)
    AnalyticsLogger::logRemoteRTCPRRPacket(*(AnalyticsLogger **)(v10 + 120), (const RTCPRRPacket *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), 0);
  if (v7)
  {
    v11 = (unint64_t *)&v7->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v13 = v16;
  if (v16)
    goto LABEL_17;
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (!v3)
    return;
  v4 = std::__shared_weak_count::lock(v3);
  v16 = v4;
  if (!v4)
    return;
  v5 = *(_QWORD *)(v2 + 8);
  if (!v5)
  {
    v13 = v4;
LABEL_17:
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    return;
  }
  v6 = *(_QWORD *)(v5 + 56);
  v7 = *(std::__shared_weak_count **)(v5 + 64);
  if (v7)
  {
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = *(_QWORD *)(v6 + 296);
  if (v10)
    AnalyticsLogger::logRemoteRTCPRRPacket(*(AnalyticsLogger **)(v10 + 120), (const RTCPRRPacket *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), 0);
  if (v7)
  {
    v11 = (unint64_t *)&v7->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v13 = v16;
  if (v16)
    goto LABEL_17;
}

void __56__AVCAudioSessionDelegate_stream_didReceiveRTCPPackets___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(std::__shared_weak_count **)(v1 + 16);
  if (!v2)
    return;
  v3 = std::__shared_weak_count::lock(v2);
  v16 = v3;
  if (!v3)
    return;
  v4 = *(_QWORD *)(v1 + 8);
  if (!v4)
  {
    v13 = v3;
LABEL_17:
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    return;
  }
  v5 = *(_QWORD *)(v4 + 56);
  v6 = *(std::__shared_weak_count **)(v4 + 64);
  if (v6)
  {
    v7 = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = *(_QWORD *)(v5 + 296);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 120);
    *(_QWORD *)(v10 + 536) = time(0);
  }
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v13 = v16;
  if (v16)
    goto LABEL_17;
}

- (void)streamDidServerDie:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__AVCAudioSessionDelegate_streamDidServerDie___block_invoke;
  v3[3] = &unk_1E78BB028;
  v3[4] = self;
  ims::performBlock((IMSClientManager *)v3);
}

void __46__AVCAudioSessionDelegate_streamDidServerDie___block_invoke(uint64_t a1)
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

  std::string::basic_string[abi:ne180100]<0>(v27, "avc.audio.delegate");
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
  std::string::basic_string[abi:ne180100]<0>(v27, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(v25, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v16 = ImsLogger::debug(ims::_logger, (uint64_t)v27, (uint64_t)v25);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"-[AVCAudioSessionDelegate streamDidServerDie:]_block_invoke", 59);
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

- (void)stream:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AVCAudioSessionDelegate_stream_updateInputFrequencyLevel___block_invoke;
  v7[3] = &unk_1E78E74C0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  ims::performBlock((IMSClientManager *)v7);

}

void __60__AVCAudioSessionDelegate_stream_updateInputFrequencyLevel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  RTPManager *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  char v19;
  void *v20;
  __CFData *v21;
  char v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;

  v2 = *(_QWORD *)(a1 + 32);
  v23 = 0;
  v24 = 0;
  v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    v24 = v4;
    if (v4)
    {
      v5 = *(_QWORD **)(v2 + 8);
      v23 = v5;
      if (v5)
      {
        v7 = (RTPManager *)v5[7];
        v6 = (std::__shared_weak_count *)v5[8];
        if (v6)
        {
          p_shared_owners = (unint64_t *)&v6->__shared_owners_;
          do
            v9 = __ldxr(p_shared_owners);
          while (__stxr(v9 + 1, p_shared_owners));
        }
        if (v7)
        {
          v10 = *(const void **)(a1 + 40);
          if (v10)
          {
            v21 = *(__CFData **)(a1 + 40);
            CFRetain(v10);
            v20 = &off_1E78D9E48;
            v11 = (*(uint64_t (**)(_QWORD *))(v5[3] + 176))(v5 + 3);
            RTPManager::sendInputFrequencyLevelUpdate(v7, v11, v21);
            ims::CFType::~CFType((ims::CFType *)&v20);
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v20, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v15 = ImsLogger::warn(ims::_logger, (uint64_t)&v20, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v15 + 8), (uint64_t)"No RTPManager found!", 20);
          *(_BYTE *)(v15 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v15 + 17) = 0;
          if (v19 < 0)
            operator delete(__p[0]);
          if (v22 < 0)
            operator delete(v20);
        }
        if (v6)
        {
          v16 = (unint64_t *)&v6->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        v4 = v24;
        if (!v24)
          return;
LABEL_16:
        v13 = (unint64_t *)&v4->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
          std::__shared_weak_count::__release_weak(v4);
        }
        return;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v12 = ImsLogger::debug(ims::_logger, (uint64_t)&v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:updateInputFrequencyLevel:]_block_invoke", 73);
  *(_BYTE *)(v12 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v12 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v12 + 64))(v12, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v12 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v22 < 0)
    operator delete(v20);
  if (v4)
    goto LABEL_16;
}

- (void)stream:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AVCAudioSessionDelegate_stream_updateOutputFrequencyLevel___block_invoke;
  v7[3] = &unk_1E78E74C0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  ims::performBlock((IMSClientManager *)v7);

}

void __61__AVCAudioSessionDelegate_stream_updateOutputFrequencyLevel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  RTPManager *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  char v19;
  void *v20;
  __CFData *v21;
  char v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;

  v2 = *(_QWORD *)(a1 + 32);
  v23 = 0;
  v24 = 0;
  v3 = *(std::__shared_weak_count **)(v2 + 16);
  if (v3)
  {
    v4 = std::__shared_weak_count::lock(v3);
    v24 = v4;
    if (v4)
    {
      v5 = *(_QWORD **)(v2 + 8);
      v23 = v5;
      if (v5)
      {
        v7 = (RTPManager *)v5[7];
        v6 = (std::__shared_weak_count *)v5[8];
        if (v6)
        {
          p_shared_owners = (unint64_t *)&v6->__shared_owners_;
          do
            v9 = __ldxr(p_shared_owners);
          while (__stxr(v9 + 1, p_shared_owners));
        }
        if (v7)
        {
          v10 = *(const void **)(a1 + 40);
          if (v10)
          {
            v21 = *(__CFData **)(a1 + 40);
            CFRetain(v10);
            v20 = &off_1E78D9E48;
            v11 = (*(uint64_t (**)(_QWORD *))(v5[3] + 176))(v5 + 3);
            RTPManager::sendOutputFrequencyLevelUpdate(v7, v11, v21);
            ims::CFType::~CFType((ims::CFType *)&v20);
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v20, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v15 = ImsLogger::warn(ims::_logger, (uint64_t)&v20, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v15 + 8), (uint64_t)"No RTPManager found!", 20);
          *(_BYTE *)(v15 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v15 + 17) = 0;
          if (v19 < 0)
            operator delete(__p[0]);
          if (v22 < 0)
            operator delete(v20);
        }
        if (v6)
        {
          v16 = (unint64_t *)&v6->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        v4 = v24;
        if (!v24)
          return;
LABEL_16:
        v13 = (unint64_t *)&v4->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
          std::__shared_weak_count::__release_weak(v4);
        }
        return;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v20, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v12 = ImsLogger::debug(ims::_logger, (uint64_t)&v20, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)"-[AVCAudioSessionDelegate stream:updateOutputFrequencyLevel:]_block_invoke", 74);
  *(_BYTE *)(v12 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v12 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v12 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v12 + 64))(v12, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v12 + 17) = 0;
  if (v19 < 0)
    operator delete(__p[0]);
  if (v22 < 0)
    operator delete(v20);
  if (v4)
    goto LABEL_16;
}

- (AVCAudioSessionDelegate)initWithOwner:(shared_ptr<AVCAudioSession>)a3 andStackController:(shared_ptr<AVCRTPStackController>)a4
{
  uint64_t *var1;
  AVCAudioSession *var0;
  AVCAudioSessionDelegate *v6;
  AVCAudioSessionDelegate *v7;
  uint64_t v8;
  AVCAudioSession *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *cntrl;
  objc_super v14;

  var1 = (uint64_t *)a3.var1;
  var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)AVCAudioSessionDelegate;
  v6 = -[AVCAudioSessionDelegate init](&v14, sel_init, a3.var0, a3.var1, a4.__ptr_, a4.__cntrl_);
  v7 = v6;
  if (v6)
  {
    v9 = *(AVCAudioSession **)var0;
    v8 = *((_QWORD *)var0 + 1);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 16);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    cntrl = (std::__shared_weak_count *)v6->owner.__cntrl_;
    v7->owner.__ptr_ = v9;
    v7->owner.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    std::shared_ptr<IpAddress>::operator=[abi:ne180100](&v7->stackController.__ptr_, var1);
  }
  return v7;
}

- (void)handleRTCPPacketWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v7;
  AVCAudioSession *ptr;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  std::__shared_weak_count *v25;
  void *__p[2];
  char v27;
  void *v28[2];
  char v29;

  v4 = (void (**)(_QWORD))a3;
  std::string::basic_string[abi:ne180100]<0>(v28, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v5 = ImsLogger::debug(ims::_logger, (uint64_t)v28, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v5 + 8), (uint64_t)"-[AVCAudioSessionDelegate handleRTCPPacketWithBlock:]", 53);
  *(_BYTE *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v5 + 17) = 0;
  if (v27 < 0)
    operator delete(__p[0]);
  if (v29 < 0)
    operator delete(v28[0]);
  cntrl = self->owner.__cntrl_;
  if (cntrl)
  {
    v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    v25 = v7;
    if (v7)
    {
      ptr = self->owner.__ptr_;
      if (ptr)
      {
        v9 = *((_QWORD *)ptr + 7);
        v10 = (std::__shared_weak_count *)*((_QWORD *)ptr + 8);
        v24 = v10;
        if (v10)
        {
          p_shared_owners = (unint64_t *)&v10->__shared_owners_;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
        }
        if (!v9)
          goto LABEL_30;
        v14 = *(_QWORD *)(v9 + 296);
        v13 = *(std::__shared_weak_count **)(v9 + 304);
        if (v13)
        {
          v15 = (unint64_t *)&v13->__shared_owners_;
          do
            v16 = __ldxr(v15);
          while (__stxr(v16 + 1, v15));
          do
            v17 = __ldaxr(v15);
          while (__stlxr(v17 - 1, v15));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
        if (v14)
        {
          v4[2](v4);
        }
        else
        {
LABEL_30:
          std::string::basic_string[abi:ne180100]<0>(v28, "avc.audio.delegate");
          std::string::basic_string[abi:ne180100]<0>(__p, "");
          pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
          v21 = ImsLogger::warn(ims::_logger, (uint64_t)v28, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v21 + 8), (uint64_t)"No metrics logger available for incoming RTCP", 45);
          *(_BYTE *)(v21 + 17) = 0;
          (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v21 + 64))(v21, std::endl[abi:ne180100]<char,std::char_traits<char>>);
          *(_BYTE *)(v21 + 17) = 0;
          if (v27 < 0)
            operator delete(__p[0]);
          if (v29 < 0)
            operator delete(v28[0]);
        }
        if (v24)
        {
          v22 = (unint64_t *)&v24->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
        v7 = v25;
        if (!v25)
          goto LABEL_40;
LABEL_26:
        v19 = (unint64_t *)&v7->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        goto LABEL_40;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v28, "avc.audio.delegate");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v18 = ImsLogger::debug(ims::_logger, (uint64_t)v28, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v18 + 8), (uint64_t)"-[AVCAudioSessionDelegate handleRTCPPacketWithBlock:]", 53);
  *(_BYTE *)(v18 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v18 + 8), (uint64_t)" owner is null", 14);
  *(_BYTE *)(v18 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v18 + 64))(v18, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v18 + 17) = 0;
  if (v27 < 0)
    operator delete(__p[0]);
  if (v29 < 0)
    operator delete(v28[0]);
  if (v7)
    goto LABEL_26;
LABEL_40:

}

- (weak_ptr<AVCAudioSession>)owner
{
  AVCAudioSession **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  weak_ptr<AVCAudioSession> result;

  cntrl = self->owner.__cntrl_;
  *v2 = self->owner.__ptr_;
  v2[1] = (AVCAudioSession *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AVCAudioSession *)self;
  return result;
}

- (void)setOwner:(weak_ptr<AVCAudioSession>)a3
{
  __shared_weak_count *v3;
  AVCAudioSession *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;

  v4 = *(AVCAudioSession **)a3.__ptr_;
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
