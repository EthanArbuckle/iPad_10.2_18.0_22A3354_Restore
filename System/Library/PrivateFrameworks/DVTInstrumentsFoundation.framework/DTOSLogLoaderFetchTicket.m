@implementation DTOSLogLoaderFetchTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  _QWORD v35[4];
  _QWORD *v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0x25576C000uLL;
  if (v7[7] || v7[4])
  {
    v10 = 0x24BDBC000uLL;
    while (1)
    {
      if (v8[4] && !*((_BYTE *)v8 + 40))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 23));
        v18 = (id *)((char *)v8 + *(int *)(v9 + 2892));
        if (*v18)
        {
          v34 = 1972;
          goto LABEL_30;
        }
        objc_storeStrong(v18, a3);
        *((_BYTE *)v8 + 509) = 0;
        objc_msgSend(v6, "ticket");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)v8 + 507) = 0;
        objc_msgSend(v8, "_setupCommonStreamParameters:", v8[4]);
        objc_msgSend(v8, "_performResetOnOutputStream");
        *((_BYTE *)v8 + 506) = 0;
        if (v8[13] && (objc_msgSend(v17, "windowInSeconds"), v19 > 0.0))
        {
          v20 = (void *)v8[13];
          objc_msgSend(v17, "windowInSeconds");
          objc_msgSend(v20, "dateByAddingTimeInterval:", -v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "compare:", v8[12]) == -1)
          {
            v23 = (id)v8[12];

            v22 = v23;
          }
        }
        else
        {
          v22 = (id)v8[12];
        }
        v27 = (void *)v8[4];
        v28 = v27;
        objc_msgSend(v28, "activateStreamFromDate:", v22);
        objc_storeStrong((id *)v8 + 8, v27);
        *((_BYTE *)v8 + 40) = 1;
        pthread_cond_signal((pthread_cond_t *)(v8 + 17));
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 23));

        v9 = 0x25576C000;
        v10 = 0x24BDBC000;
        goto LABEL_24;
      }
      v11 = (void *)v8[8];
      v12 = *(void **)(v10 + 3832);
      if (!v11)
        break;
      objc_msgSend(v12, "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v13)
      {

LABEL_16:
        objc_msgSend(v6, "ticket");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == (void *)v8[16])
        {
          pthread_mutex_lock((pthread_mutex_t *)(v8 + 23));
          v29 = (id *)((char *)v8 + *(int *)(v9 + 2892));
          if (*v29)
            __assert_rtn("-[DTOSLogLoaderFetchTicket holdAgent:loader:]", "DTOSLogLoader.mm", 2067, "loader->_agentWaitingForEvents == nil");
          objc_storeStrong(v29, a3);
          if (*((_BYTE *)v8 + 509))
          {
            objc_msgSend(v8, "_welcomeAgent:", *(_QWORD *)((char *)v8 + *(int *)(v9 + 2892)));
            v30 = *(int *)(v9 + 2892);
            v31 = *(void **)((char *)v8 + v30);
            *(_QWORD *)((char *)v8 + v30) = 0;

          }
          pthread_cond_signal((pthread_cond_t *)(v8 + 17));
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 23));
        }
        else
        {
          objc_msgSend((id)v8[8], "invalidate");
          v25 = (void *)v8[8];
          v8[8] = 0;

          v26 = (void *)v8[4];
          v8[4] = 0;

          objc_storeStrong((id *)v8 + 15, a3);
        }
LABEL_24:

        goto LABEL_25;
      }
      v24 = *((unsigned __int8 *)v8 + 40);

      if (v24)
        goto LABEL_16;
LABEL_25:
      objc_msgSend(v6, "ticket");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v8[16];
      v8[16] = v32;

      if (v8[8])
        goto LABEL_26;
    }
    objc_msgSend(v12, "null");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v8[8];
    v8[8] = v14;

    v16 = (void *)v8[7];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_222B40FEC;
    v35[3] = &unk_24EB29288;
    v36 = v8;
    v37 = v6;
    objc_msgSend(v16, "prepareWithCompletionHandler:", v35);

    v17 = v36;
    goto LABEL_24;
  }
  if (v7[44])
  {
    v34 = 2109;
LABEL_30:
    __assert_rtn("-[DTOSLogLoaderFetchTicket holdAgent:loader:]", "DTOSLogLoader.mm", v34, "loader->_agentWaitingForEvents == nil");
  }
  objc_msgSend(v7, "_welcomeAgent:", v6);
LABEL_26:

}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  id v5;
  char *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (char *)a4;
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 184));
  objc_msgSend(*((id *)v6 + 45), "setLength:", *((_QWORD *)v6 + 35) - *((_QWORD *)v6 + 34));
  objc_msgSend(v5, "setNextOutputBytes:", *((_QWORD *)v6 + 45));
  objc_msgSend(v5, "setLastMachContinuousTime:", *((_QWORD *)v6 + 43));
  objc_msgSend(v5, "setLostEventsSinceLastVisit:", *((unsigned int *)v6 + 125));
  objc_msgSend(v5, "setFailureReason:", *((_QWORD *)v6 + 11));
  sub_222B3A980(v6);
  v7 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v6 + 32) + 16) + 64);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "nextOutputBytes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v10 = *((_DWORD *)v6 + 124);
    v11 = 134218496;
    v12 = v9;
    v13 = 1024;
    v14 = v10;
    v15 = 1024;
    v16 = HIWORD(v7);
    _os_log_debug_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Data Size: %lu, Rows Sent: %d, Stack depth: %d", (uint8_t *)&v11, 0x18u);

  }
  *((_DWORD *)v6 + 124) = 0;
  v6[508] = 0;
  *((_DWORD *)v6 + 125) = 0;
  pthread_cond_signal((pthread_cond_t *)(v6 + 136));
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 184));
  if (*((_QWORD *)v6 + 10))
  {
    objc_msgSend(v5, "setFetchComplete:", 1);
  }
  else
  {
    objc_msgSend(v5, "setFetchComplete:", v6[509]);
    if (objc_msgSend(v5, "isFetchComplete")
      && objc_msgSend(*((id *)v6 + 6), "trackPidToExecNameMapping")
      && *((_QWORD *)v6 + 64))
    {
      objc_msgSend(v5, "addPidToExecEntriesFromMapping:");
    }
  }
  if (*((_QWORD *)v6 + 11))
    objc_msgSend(v5, "setFetchComplete:", 1);

}

- (double)windowInSeconds
{
  return self->_windowInSeconds;
}

- (void)setWindowInSeconds:(double)a3
{
  self->_windowInSeconds = a3;
}

- (OSLogEventStreamPosition)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(id)a3
{
  objc_storeStrong((id *)&self->_currentPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPosition, 0);
}

@end
