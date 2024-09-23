@implementation AVDismissalExpanseCoordinator

+ (void)coordinateDismissalWithExpanseSessionForPlayer:(id)a3 cancellable:(BOOL)a4 dismissalBlock:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "backgroundPIPAuthorizationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "playbackCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinationMediumDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v7, "playbackCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __107__AVDismissalExpanseCoordinator_coordinateDismissalWithExpanseSessionForPlayer_cancellable_dismissalBlock___block_invoke;
      v16[3] = &unk_1E5BB2500;
      v17 = v8;
      objc_msgSend(v12, "playbackCoordinator:promptForLeaveOrEndSessionAllowingCancellation:completionHandler:", v13, v6, v16);

    }
    else
    {
      _AVLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]";
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s Playback coordination dismissal delegate not implemented. Dismissing.", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }

  }
  else
  {
    _AVLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]";
      _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s Not in Expanse session (AVPlayer.backgroundPIPAuthorizationToken not set). Dismissing.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __107__AVDismissalExpanseCoordinator_coordinateDismissalWithExpanseSessionForPlayer_cancellable_dismissalBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]_block_invoke";
      v6 = "%s Playback coordination dismissal delegate completed but cancelled. Not dismissing.";
LABEL_6:
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = 136315138;
    v9 = "+[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:]_block_invoke";
    v6 = "%s Playback coordination dismissal delegate completed. Dismissing.";
    goto LABEL_6;
  }

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

@end
