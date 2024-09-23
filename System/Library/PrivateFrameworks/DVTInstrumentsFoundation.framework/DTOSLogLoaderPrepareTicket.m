@implementation DTOSLogLoaderPrepareTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  char *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  uint64_t v41;
  char v42;

  v6 = a3;
  v7 = (char *)a4;
  -[DTOSLogLoaderPrepareTicket configuration](self, "configuration");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v7 + 6);
  *((_QWORD *)v7 + 6) = v8;

  -[DTOSLogLoaderPrepareTicket configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mode");

  if (!v11)
  {
    objc_msgSend(*((id *)v7 + 6), "dynamicTracingEnabledSubsystems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B400AC(v12, 1);

    objc_msgSend(*((id *)v7 + 6), "logSubsystemCategoryPairsToEnable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = sub_222B42618;
    v40 = &unk_24EB292E8;
    v42 = 1;
    v41 = 0;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v37);

    objc_msgSend(*((id *)v7 + 6), "signpostSubsystemCategoryPairsToEnable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    v38 = 3221225472;
    v39 = sub_222B42618;
    v40 = &unk_24EB292E8;
    v42 = 1;
    v41 = 1;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v37);

  }
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 184));
  sub_222B3A980(v7);
  v16 = operator new();
  sub_222B427FC(v16, (uint64_t)(v7 + 264), v7);
  v17 = *((_QWORD *)v7 + 32);
  *((_QWORD *)v7 + 32) = v16;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
  v7[505] = 1;
  objc_msgSend(v7, "_performResetOnOutputStream");
  pthread_mutex_unlock((pthread_mutex_t *)(v7 + 184));
  switch(v11)
  {
    case 0:
      v18 = (void *)*((_QWORD *)v7 + 9);
      *((_QWORD *)v7 + 9) = 0;

      objc_msgSend(MEMORY[0x24BE60C78], "localStore");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = v19;

      -[DTOSLogLoaderPrepareTicket _setupLoaderForLoggedEventStore:agent:setDatesBasedOnSource:genericFailureReason:](self, "_setupLoaderForLoggedEventStore:agent:setDatesBasedOnSource:genericFailureReason:", v7, v6, 0, CFSTR("Local logging store could not be accessed."));
      break;
    case 1:
      v28 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = 0;

      objc_msgSend(MEMORY[0x24BE60C68], "liveLocalStore");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*((_QWORD *)v7 + 9);
      *((_QWORD *)v7 + 9) = v29;

      v31 = (void *)*((_QWORD *)v7 + 9);
      if (v31)
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = sub_222B402F0;
        v34[3] = &unk_24EB291D8;
        v35 = v7;
        v36 = v6;
        objc_msgSend(v31, "prepareWithCompletionHandler:", v34);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "dvtiuErrorWithFormat:", CFSTR("Live logging stream could not be accessed."));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)*((_QWORD *)v7 + 11);
        *((_QWORD *)v7 + 11) = v32;

        objc_msgSend(v7, "_welcomeAgent:", v6);
      }
      break;
    case 2:
      v21 = (void *)*((_QWORD *)v7 + 9);
      *((_QWORD *)v7 + 9) = 0;

      -[DTOSLogLoaderConfiguration importedFileURL](self->_configuration, "importedFileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        __assert_rtn("-[DTOSLogLoaderPrepareTicket holdAgent:loader:]", "DTOSLogLoader.mm", 1824, "importedFileURL != nil");
      objc_msgSend(MEMORY[0x24BE60C78], "storeWithArchiveURL:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)*((_QWORD *)v7 + 7);
      *((_QWORD *)v7 + 7) = v23;

      -[DTOSLogLoaderPrepareTicket _setupLoaderForLoggedEventStore:agent:setDatesBasedOnSource:genericFailureReason:](self, "_setupLoaderForLoggedEventStore:agent:setDatesBasedOnSource:genericFailureReason:", v7, v6, 1, CFSTR("Archive logging store could not be accessed."));
      goto LABEL_11;
    case 3:
      -[DTOSLogLoaderConfiguration importedFileURL](self->_configuration, "importedFileURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)*((_QWORD *)v7 + 9);
      *((_QWORD *)v7 + 9) = 0;

      if (!v22)
        __assert_rtn("-[DTOSLogLoaderPrepareTicket holdAgent:loader:]", "DTOSLogLoader.mm", 1832, "importedFileURL != nil");
      objc_msgSend(MEMORY[0x24BDD1540], "dvtiuErrorWithFormat:", CFSTR("Data from ktrace file cannot be deserialized on this system."));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)*((_QWORD *)v7 + 11);
      *((_QWORD *)v7 + 11) = v26;

      objc_msgSend(v7, "_welcomeAgent:", v6);
LABEL_11:

      break;
    default:
      break;
  }

}

- (void)_setupLoaderForLoggedEventStore:(id)a3 agent:(id)a4 setDatesBasedOnSource:(BOOL)a5 genericFailureReason:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  *((_QWORD *)v9 + 14) = 0;
  v12 = (void *)*((_QWORD *)v9 + 7);
  if (v12)
  {
    objc_msgSend(v12, "setUpgradeConfirmationHandler:", &unk_24EB27770);
    objc_msgSend(*((id *)v9 + 7), "setProgressHandler:", &unk_24EB29238);
    v13 = (void *)*((_QWORD *)v9 + 7);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_222B405DC;
    v16[3] = &unk_24EB29260;
    v17 = v9;
    v19 = a5;
    v18 = v10;
    objc_msgSend(v13, "prepareWithCompletionHandler:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "dvtiuErrorWithFormat:", CFSTR("%@"), v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v9 + 11);
    *((_QWORD *)v9 + 11) = v14;

    objc_msgSend(v9, "_welcomeAgent:", v10);
  }

}

- (DTOSLogLoaderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
