@implementation ANAnchorTrackPlayer

- (void)playInternalWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  double v8;
  _QWORD v9[5];
  id v10;
  id v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ANAnchorTrackPlayer playInternalWithCompletionHandler:]";
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E938FF78;
  objc_copyWeak(&v11, (id *)buf);
  v9[4] = self;
  v12 = 1065353216;
  v7 = v4;
  v10 = v7;
  LODWORD(v8) = 1.0;
  objc_msgSend(v6, "prerollAtRate:completionHandler:", v9, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  OpaqueCMClock *HostTimeClock;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  float v24;
  CMTime v25;
  CMTime v26;
  CMTime v27[2];
  CMTime v28;
  CMTime buf;
  CMTimeValue value;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 67109120;
    HIDWORD(buf.value) = a2;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Preroll Finished: %d", (uint8_t *)&buf, 8u);
  }

  if ((a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke_cold_1(v6);

  }
  memset(&v28, 0, sizeof(v28));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v28, HostTimeClock);
  memset(&v27[1], 0, sizeof(CMTime));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "startTime");
  memset(v27, 0, 24);
  objc_msgSend(WeakRetained, "queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "currentTime");
  else
    memset(v27, 0, 24);

  memset(&v26, 0, sizeof(v26));
  buf = v27[1];
  v25 = v28;
  CMTimeSubtract(&v26, &buf, &v25);
  objc_msgSend(WeakRetained, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 134218752;
    *(CMTimeValue *)((char *)&buf.value + 4) = v27[0].value;
    LOWORD(buf.flags) = 2048;
    *(_QWORD *)((char *)&buf.flags + 2) = v27[1].value;
    HIWORD(buf.epoch) = 2048;
    value = v28.value;
    v31 = 2048;
    v32 = (double)v26.value / (double)v26.timescale;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "AVQueuePlayer Current Time %lld, Target Host Time: %lld, Now: %lld, Delta(sec): %f", (uint8_t *)&buf, 0x2Au);
  }

  buf = v28;
  v25 = v27[1];
  if (CMTimeCompare(&buf, &v25) == 1)
  {
    objc_msgSend(WeakRetained, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Start Time is in the past. Will use play", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(WeakRetained, "queuePlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "play");

    objc_msgSend(WeakRetained, "queuePlayer");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject error](v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queuePlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAutomaticallyWaitsToMinimizeStalling:", 0);

    objc_msgSend(WeakRetained, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "queuePlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "queuePlayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rate");
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
      LOWORD(buf.flags) = 2048;
      *(double *)((char *)&buf.flags + 2) = v19;
      _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "Will Set Rate on AVQueuePlayer %@, rate = %f", (uint8_t *)&buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "queuePlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = *(_DWORD *)(a1 + 56);
    buf = v27[0];
    v25 = v27[1];
    objc_msgSend(v20, "setRate:time:atHostTime:", &buf, &v25, v21);

    objc_msgSend(WeakRetained, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "queuePlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "queuePlayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rate");
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v22;
      LOWORD(buf.flags) = 2048;
      *(double *)((char *)&buf.flags + 2) = v24;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "Did set Rate on AVQueuePlayer %@, rate = %f", (uint8_t *)&buf, 0x16u);

    }
    v14 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleInterruptionDelay:(double)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE buf[24];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ANAnchorTrackPlayer handleInterruptionDelay:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s: amountOfTimeInterrupted %f", buf, 0x16u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ANTrackPlayer playerItems](self, "playerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "playerItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANTrackPlayer queuePlayer](self, "queuePlayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v14)
        {
          v15 = objc_msgSend(v11, "trackType");
          -[ANTrackPlayer queuePlayer](self, "queuePlayer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
          {
            objc_msgSend(v16, "advanceToNextItem");
          }
          else
          {
            objc_msgSend(v16, "currentItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __47__ANAnchorTrackPlayer_handleInterruptionDelay___block_invoke;
            v19[3] = &unk_1E938FB50;
            v19[4] = self;
            *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
            *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            objc_msgSend(v18, "seekToTime:completionHandler:", buf, v19);

          }
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_16:

}

void __47__ANAnchorTrackPlayer_handleInterruptionDelay___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = "unsuccessful";
    if (a2)
      v4 = "successful";
    v5 = 136315394;
    v6 = "-[ANAnchorTrackPlayer handleInterruptionDelay:]_block_invoke";
    v7 = 2080;
    v8 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_INFO, "%s: Attempt to restart announcement after interruption was %s.", (uint8_t *)&v5, 0x16u);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

void __57__ANAnchorTrackPlayer_playInternalWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D23A0000, log, OS_LOG_TYPE_ERROR, "Preroll did not finish. Will still attempt to play.", v1, 2u);
}

@end
