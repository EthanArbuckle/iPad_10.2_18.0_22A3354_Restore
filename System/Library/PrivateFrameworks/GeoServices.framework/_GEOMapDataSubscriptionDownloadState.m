@implementation _GEOMapDataSubscriptionDownloadState

- (_GEOMapDataSubscriptionDownloadState)init
{
  _GEOMapDataSubscriptionDownloadState *v2;
  _GEOMapDataSubscriptionDownloadState *v3;
  GEOMapDataSubscriptionState *v4;
  GEOMapDataSubscriptionState *externalState;
  _GEOMapDataSubscriptionDownloadState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GEOMapDataSubscriptionDownloadState;
  v2 = -[_GEOMapDataSubscriptionDownloadState init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(GEOMapDataSubscriptionState);
    externalState = v3->_externalState;
    v3->_externalState = v4;

    v6 = v3;
  }

  return v3;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[GEOMapDataSubscriptionDownloader description](self->_downloader, "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("nil");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v12[0] = CFSTR("downloader");
  v12[1] = CFSTR("queuedForDownload");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pendingProgress != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)downloader
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[11];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setDownloader:(uint64_t)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("downloader"));
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(a1 + 88), a2);
    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("downloader"));
  }

}

- (void)_updateExternalState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(_BYTE *)(a1 + 12))
  {
    v2 = 2;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 13))
    {
      v3 = 0;
      goto LABEL_8;
    }
    v2 = 1;
  }
  if (*(_BYTE *)(a1 + 14))
    v3 = 3;
  else
    v3 = v2;
LABEL_8:
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 88);
  if (v4)
  {
    if (!v5)
    {
      v7 = v4;
      v8 = (void *)MEMORY[0x1E0C9AA70];
      v6 = 1;
      goto LABEL_16;
    }
    v6 = 1;
    goto LABEL_13;
  }
  if (v5)
  {
    v6 = 2;
LABEL_13:
    objc_msgSend(v5, "progress");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v8 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_16;
  }
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 != 3)
  {
    v10 = 3;
    if (v9 != 1)
      v10 = 0;
    if (v9 == 2)
      v6 = 4;
    else
      v6 = v10;
    v7 = 0;
    goto LABEL_14;
  }
  v7 = 0;
  if (*(_QWORD *)(a1 + 80))
    v8 = *(void **)(a1 + 80);
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v6 = 5;
LABEL_16:
  v11 = v7;
  -[GEOMapDataSubscriptionState _setLoadState:downloadState:downloadProgress:lastError:downloadedDataCount:downloadedDataSize:userInfo:](*(_QWORD *)(a1 + 96), v3, v6, v7, *(void **)(a1 + 72), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v8);

}

- (void)setQueuedForDownload:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = *(void **)(a1 + 32);
    if ((((v5 == 0) ^ a2) & 1) == 0)
    {
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v6;

        -[_GEOMapDataSubscriptionDownloadState _updateProgressDownloadReason](a1);
      }
      else
      {
        *(_QWORD *)(a1 + 32) = 0;

      }
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_updateProgressDownloadReason
{
  void *result;
  uint64_t v3;
  __CFString **v4;
  __CFString *v5;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  result = *(void **)(a1 + 32);
  if (result)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)(v3 - 2) < 2)
    {
      v4 = GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate;
    }
    else
    {
      if (!v3)
      {
        v5 = 0;
        return (void *)objc_msgSend(result, "setUserInfoObject:forKey:", v5, CFSTR("GEOMapDataSubscriptionDownloadReasonKey"));
      }
      if (v3 != 1)
        return result;
      v4 = GEOMapDataSubscriptionProgressDownloadReasonAutomaticUpdate;
    }
    v5 = *v4;
    return (void *)objc_msgSend(result, "setUserInfoObject:forKey:", v5, CFSTR("GEOMapDataSubscriptionDownloadReasonKey"));
  }
  return result;
}

- (os_unfair_lock_s)downloadReason
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[12]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)downloadMode
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setWaitingUserInfo:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(id *)(a1 + 80) != v6 && (objc_msgSend(v6, "isEqualToDictionary:") & 1) == 0)
    {
      v4 = objc_msgSend(v6, "copy");
      v5 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v4;

      -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v3 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalState, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_waitingUserInfo, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_pendingProgress, 0);
}

@end
