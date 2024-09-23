@implementation VNVTSessionManager

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (VNVTSessionManager)init
{
  VNVTSessionManager *v2;
  VNVTSessionManager *v3;
  VNVTSessionManager *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *value;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  objc_super v18;
  objc_super v19;

  v18.receiver = self;
  v18.super_class = (Class)VNVTSessionManager;
  v2 = -[VNVTSessionManager init](&v18, sel_init);
  if (!v2)
    return 0;
  v19.receiver = v2;
  v19.super_class = (Class)VNVTSessionManager;
  v3 = -[VNVTSessionManager init](&v19, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_maxSessionsCount = 3;
    v5 = operator new();
    *(_DWORD *)v5 = 3;
    *(_DWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 8) = dispatch_semaphore_create(3);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    value = (id *)v4->_pixelTransferSessionsHandler.__ptr_.__value_;
    v4->_pixelTransferSessionsHandler.__ptr_.__value_ = (void *)v5;
    if (value)
      std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](value);
    v11 = operator new();
    *(_DWORD *)v11 = 3;
    *(_DWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = 0;
    *(_QWORD *)(v11 + 32) = 0;
    *(_QWORD *)(v11 + 8) = dispatch_semaphore_create(3);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v14;

    v16 = (id *)v4->_pixelRotationSessionsHandler.__ptr_.__value_;
    v4->_pixelRotationSessionsHandler.__ptr_.__value_ = (void *)v11;
    if (v16)
      std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](v16);
  }
  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t maxSessionsCount;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNVTSessionManager;
  v3 = -[VNVTSessionManager hash](&v6, sel_hash);
  if (self)
    maxSessionsCount = self->_maxSessionsCount;
  else
    maxSessionsCount = 0;
  return maxSessionsCount ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNVTSessionManager *v4;
  VNVTSessionManager *v5;
  unint64_t maxSessionsCount;
  unint64_t v7;
  BOOL v8;

  v4 = (VNVTSessionManager *)a3;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  if (!self)
  {
    maxSessionsCount = 0;
    if (v5)
      goto LABEL_5;
LABEL_11:
    v7 = 0;
    goto LABEL_6;
  }
  maxSessionsCount = self->_maxSessionsCount;
  if (!v5)
    goto LABEL_11;
LABEL_5:
  v7 = v5->_maxSessionsCount;
LABEL_6:
  v8 = maxSessionsCount == v7;

LABEL_9:
  return v8;
}

- (void).cxx_destruct
{
  id *value;
  id *v4;

  value = (id *)self->_pixelRotationSessionsHandler.__ptr_.__value_;
  self->_pixelRotationSessionsHandler.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](value);
  v4 = (id *)self->_pixelTransferSessionsHandler.__ptr_.__value_;
  self->_pixelTransferSessionsHandler.__ptr_.__value_ = 0;
  if (v4)
    std::default_delete<SessionsHandler<VNVTPixelRotationSession>>::operator()[abi:ne180100](v4);
}

- (VTSessionRef)waitAndGetAvailablePixelRotationSessionForInputPixelFormat:(int)a3 outputPixelFormat:(int)a4 rotation:(int)a5 flipHorizontal:(int)a6 flipVertical:(_QWORD *)a7 error:
{
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t (**v15)(id, id);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  VTSessionRef *v22;
  VTSessionRef *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  VTSessionRef v31;
  const void *v32;
  const void *v33;
  const void *v34;
  uint64_t v35;
  const void *v36;
  void *v37;
  VTSessionRef *v38;
  os_unfair_lock_s *lock;
  uint64_t v44;
  void (**v45)(id, _QWORD *);
  _QWORD v46[4];
  int v47;
  char v48;
  char v49;
  _QWORD aBlock[4];
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v38 = 0;
    return v38;
  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke;
  aBlock[3] = &__block_descriptor_36_e21_B16__0__VNVTSession_8l;
  v51 = a4;
  v12 = _Block_copy(aBlock);
  v46[0] = v11;
  v46[1] = 3221225472;
  v46[2] = __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke_2;
  v46[3] = &__block_descriptor_38_e22___VNVTSession_16__0__8l;
  v47 = a4;
  v48 = a5;
  v49 = a6;
  v13 = _Block_copy(v46);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = v12;
  v45 = v13;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v14 + 8), 0xFFFFFFFFFFFFFFFFLL);
  lock = (os_unfair_lock_s *)(v14 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 16));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v44 = v14;
  v16 = *(id *)(v14 + 24);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v17)
  {
    v18 = 0;
    v19 = *(_QWORD *)v53;
LABEL_4:
    v20 = 0;
    v21 = v18 + v17;
    while (1)
    {
      if (*(_QWORD *)v53 != v19)
        objc_enumerationMutation(v16);
      v22 = (VTSessionRef *)*(id *)(*((_QWORD *)&v52 + 1) + 8 * v20);
      v23 = v22;
      if (v22)
      {
        if (*((_DWORD *)v22 + 2) == a2)
        {
          v24 = *((_DWORD *)v22 + 3);
LABEL_10:
          if (v24 == a3 && (v15[2](v15, v22) & 1) != 0)
          {

            if (!v23)
              goto LABEL_20;
            v26 = v18 + v20;
            v27 = v44;
            objc_msgSend(*(id *)(v44 + 24), "removeObjectAtIndex:", v26);
            goto LABEL_26;
          }
        }
      }
      else if (!a2)
      {
        v24 = 0;
        goto LABEL_10;
      }

      if (v17 == ++v20)
      {
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        v17 = v25;
        v18 = v21;
        if (v25)
          goto LABEL_4;
        break;
      }
    }
  }

LABEL_20:
  v28 = objc_msgSend(*(id *)(v44 + 24), "count");
  v29 = objc_msgSend(*(id *)(v44 + 32), "count");
  if (v28 && v29 + v28 == *(_DWORD *)v44)
    objc_msgSend(*(id *)(v44 + 24), "removeLastObject");
  v45[2](v45, a7);
  v30 = objc_claimAutoreleasedReturnValue();
  v23 = (VTSessionRef *)v30;
  if (v30)
  {
    *(_DWORD *)(v30 + 8) = a2;
    *(_DWORD *)(v30 + 12) = a3;
  }
  v27 = v44;
LABEL_26:
  objc_msgSend(*(id *)(v27 + 32), "addObject:", v23);
  os_unfair_lock_unlock(lock);

  if (!v23)
    goto LABEL_39;
  v31 = v23[4];
  v32 = (const void *)*MEMORY[0x1E0C9AE50];
  v33 = (const void *)*MEMORY[0x1E0C9AE40];
  if (a5)
    v34 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v34 = (const void *)*MEMORY[0x1E0C9AE40];
  v35 = VTSessionSetProperty(v23[4], (CFStringRef)*MEMORY[0x1E0CED778], v34);
  if ((_DWORD)v35)
  {
    if (a7)
    {
LABEL_38:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set VTSession property, error: %d"), v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v37);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (a6)
      v36 = v32;
    else
      v36 = v33;
    v35 = VTSessionSetProperty(v31, (CFStringRef)*MEMORY[0x1E0CED780], v36);
    if (!(_DWORD)v35)
    {
      v38 = v23;
      goto LABEL_40;
    }
    if (a7)
      goto LABEL_38;
  }
LABEL_39:
  v38 = 0;
LABEL_40:

  return v38;
}

BOOL __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;

  if (a2)
    v2 = *(_DWORD *)(a2 + 24);
  else
    v2 = 0;
  return v2 == *(_DWORD *)(a1 + 32);
}

id __142__VNVTSessionManager_waitAndGetAvailablePixelRotationSessionForInputPixelFormat_outputPixelFormat_rotation_flipHorizontal_flipVertical_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_opt_self();
  v3 = VTPixelRotationSessionCreateWithRotationAndFlip();
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create VTPixelRotationSessionRef object: session: %lu, error: %d"), 0, v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v6, v7, v8, v9, v10, v11, v5);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v4);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)releasePixelRotationSession:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v13 = v3;
    v5 = v3;
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
      if ((objc_msgSend(*(id *)(v4 + 32), "containsObject:", v5) & 1) == 0)
      objc_msgSend(*(id *)(v4 + 24), "addObject:", v5);
      objc_msgSend(*(id *)(v4 + 32), "removeObject:", v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 8));
    }

    v3 = v13;
  }

}

@end
