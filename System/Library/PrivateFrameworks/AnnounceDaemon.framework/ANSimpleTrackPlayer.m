@implementation ANSimpleTrackPlayer

- (void)playInternalWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  Float64 Seconds;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CMTime time;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  Float64 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[ANTrackPlayer log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ANTrackPlayer queuePlayer](self, "queuePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)buf = 136315394;
    v16 = "-[ANSimpleTrackPlayer playInternalWithCompletionHandler:]";
    v17 = 2048;
    v18 = Seconds;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s: Duration = %fs", buf, 0x16u);

  }
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "play");

  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ANTrackPlayer log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ANSimpleTrackPlayer playInternalWithCompletionHandler:].cold.1((uint64_t)v12, v13);

  }
  v4[2](v4, v12);

}

- (void)handleInterruptionDelay:(double)a3
{
  void *v4;
  void *v5;
  double Seconds;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMTime v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t v17;
  CMTime time;
  CMTime v19;

  v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  -[ANTrackPlayer previousSkipGoesToPreviousTrackDelta](self, "previousSkipGoesToPreviousTrackDelta");
  if (Seconds > v7)
  {
    -[ANTrackPlayer previousSkipGoesToPreviousTrackDelta](self, "previousSkipGoesToPreviousTrackDelta");
    v9 = Seconds - v8;
    -[ANTrackPlayer queuePlayer](self, "queuePlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "currentTime");
      LODWORD(v10) = v16;
    }
    else
    {
      v15[5] = 0;
      v16 = 0;
      v17 = 0;
    }
    CMTimeMakeWithSeconds(&v19, v9, (int32_t)v10);

  }
  -[ANTrackPlayer queuePlayer](self, "queuePlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = 3221225472;
  v15[2] = __47__ANSimpleTrackPlayer_handleInterruptionDelay___block_invoke;
  v15[3] = &unk_1E938FB50;
  v15[4] = self;
  v14 = v19;
  v15[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v13, "seekToTime:completionHandler:", &v14, v15);

}

void __47__ANSimpleTrackPlayer_handleInterruptionDelay___block_invoke(uint64_t a1, int a2)
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
    v6 = "-[ANSimpleTrackPlayer handleInterruptionDelay:]_block_invoke";
    v7 = 2080;
    v8 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_INFO, "%s: Attempt to restart announcement after interruption was %s.", (uint8_t *)&v5, 0x16u);
  }

}

- (void)playInternalWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D23A0000, a2, OS_LOG_TYPE_ERROR, "Failed to play AVQueuePlayer %@", (uint8_t *)&v2, 0xCu);
}

@end
