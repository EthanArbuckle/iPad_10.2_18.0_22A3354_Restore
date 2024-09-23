@implementation IMDSpotlightClientStateManager

+ (id)sharedManager
{
  if (qword_1EEC40358 != -1)
    dispatch_once(&qword_1EEC40358, &unk_1E5AAEF68);
  return (id)qword_1EEC40398;
}

- (void)_migrateClientStateFromManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  IMDSpotlightClientStateManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABB71790;
  v6[3] = &unk_1E5AAF5B8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  sub_1ABBD7050(v6);

}

- (id)currentClientStateWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  __int128 *p_buf;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (qword_1EEC40368 != -1)
    dispatch_once(&qword_1EEC40368, &unk_1E5AAEB60);
  if (*(double *)&qword_1EEC403A0 > 0.0)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = qword_1EEC403A0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_DEFAULT, "Beginning simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

    usleep((*(double *)&qword_1EEC403A0 * 1000000.0));
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = qword_1EEC403A0;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_DEFAULT, "Finished simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = sub_1ABB71BE8;
  v25 = sub_1ABB71BF8;
  v26 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1ABB71BE8;
  v20 = sub_1ABB71BF8;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1ABB71C00;
  v12[3] = &unk_1E5AB0648;
  p_buf = &buf;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  -[IMDSpotlightClientStateManager _currentClientStateWithCompletion:](self, "_currentClientStateWithCompletion:", v12);
  v9 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (a3)
    {
      -[IMDSpotlightClientStateManager _timeoutError](self, "_timeoutError");
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v17[5]);
    v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (void)currentClientStateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABB71D00;
  v6[3] = &unk_1E5AB0698;
  v7 = v4;
  v5 = v4;
  -[IMDSpotlightClientStateManager _currentClientStateWithCompletion:](self, "_currentClientStateWithCompletion:", v6);

}

- (void)_currentClientStateWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Not yet implemented"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)saveClientState:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  IMDSpotlightClientStateManager *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = 0;
  -[IMDSpotlightClientStateManager saveClientState:withError:](self, "saveClientState:withError:", v4, &v7);
  v5 = v7;
  if (v5)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_ERROR, "Failed to save client state to %@ with error: %@ client state: %@", buf, 0x20u);
    }

  }
}

- (id)_timeoutError
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v3 = *MEMORY[0x1E0D39280];
  v7 = *MEMORY[0x1E0CB2938];
  v8[0] = CFSTR("Timed out talking to Spotlight.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 2, v4);

  return v5;
}

- (void)saveClientState:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (qword_1EEC40370 != -1)
    dispatch_once(&qword_1EEC40370, &unk_1E5AAE6F8);
  if (*(double *)&qword_1EEC403A8 > 0.0)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = qword_1EEC403A8;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_DEFAULT, "Beginning simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

    usleep((*(double *)&qword_1EEC403A8 * 1000000.0));
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = qword_1EEC403A8;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_DEFAULT, "Finished simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

  }
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = sub_1ABB71BE8;
  v22 = sub_1ABB71BF8;
  v23 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_1ABB72250;
  v16 = &unk_1E5AB06C0;
  p_buf = &buf;
  v10 = v9;
  v17 = v10;
  -[IMDSpotlightClientStateManager _saveClientState:withCompletion:](self, "_saveClientState:withCompletion:", v6, &v13);
  v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    if (a4)
    {
      -[IMDSpotlightClientStateManager _timeoutError](self, "_timeoutError", v13, v14, v15, v16);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      *a4 = v12;
    }
  }
  else if (a4)
  {
    v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    goto LABEL_14;
  }

  _Block_object_dispose(&buf, 8);
}

- (void)saveClientState:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABB72324;
  v8[3] = &unk_1E5AB0710;
  v9 = v6;
  v7 = v6;
  -[IMDSpotlightClientStateManager _saveClientState:withCompletion:](self, "_saveClientState:withCompletion:", a3, v8);

}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Not yet implemented"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
