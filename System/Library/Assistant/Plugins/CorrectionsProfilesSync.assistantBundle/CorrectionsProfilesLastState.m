@implementation CorrectionsProfilesLastState

- (id)_path
{
  void *v2;
  void *v3;

  AFUserSupportDirectoryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.siri.corrections.laststate.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)loadLastState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[CorrectionsProfilesLastState _path](self, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 2, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v12 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&self->_persistedState, v14);
        -[CorrectionsProfilesPersistedState correctionsProfiles](self->_persistedState, "correctionsProfiles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_count = objc_msgSend(v15, "count");

        v16 = 1;
LABEL_18:

        goto LABEL_19;
      }
      v17 = *MEMORY[0x24BE08FE8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        v16 = 0;
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315394;
      v22 = "-[CorrectionsProfilesLastState loadLastState]";
      v23 = 2112;
      v24 = v14;
      v18 = "%s Last state data is of unexpected format: %@";
    }
    else
    {
      v17 = *MEMORY[0x24BE08FE8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 136315394;
      v22 = "-[CorrectionsProfilesLastState loadLastState]";
      v23 = 2112;
      v24 = v4;
      v18 = "%s Unable to decode data: %@";
    }
    _os_log_error_impl(&dword_2172C1000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v3);

  v10 = *MEMORY[0x24BE08FE8];
  v11 = *MEMORY[0x24BE08FE8];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CorrectionsProfilesLastState loadLastState]";
      _os_log_error_impl(&dword_2172C1000, v10, OS_LOG_TYPE_ERROR, "%s Unable to read last persisted corrections state", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[CorrectionsProfilesLastState loadLastState]";
    _os_log_impl(&dword_2172C1000, v10, OS_LOG_TYPE_INFO, "%s No corrections state has been persisted", buf, 0xCu);
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)digest
{
  return -[CorrectionsProfilesPersistedState digest](self->_persistedState, "digest");
}

- (id)correctionKeys
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[CorrectionsProfilesPersistedState correctionsProfiles](self->_persistedState, "correctionsProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (id)profileDataForKey:(id)a3
{
  CorrectionsProfilesPersistedState *persistedState;
  id v4;
  void *v5;
  void *v6;

  persistedState = self->_persistedState;
  v4 = a3;
  -[CorrectionsProfilesPersistedState correctionsProfiles](persistedState, "correctionsProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveNewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CorrectionsProfilesPersistedState *persistedState;
  CorrectionsProfilesPersistedState *v8;
  CorrectionsProfilesPersistedState *v9;
  CorrectionsProfilesPersistedState *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CorrectionsProfilesLastState _path](self, "_path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    persistedState = self->_persistedState;
    if (!persistedState)
    {
      v8 = objc_alloc_init(CorrectionsProfilesPersistedState);
      v9 = self->_persistedState;
      self->_persistedState = v8;

      persistedState = self->_persistedState;
    }
    -[CorrectionsProfilesPersistedState setCorrectionsProfiles:](persistedState, "setCorrectionsProfiles:", v4);
    v10 = self->_persistedState;
    CorrectionsProfilesDigest(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CorrectionsProfilesPersistedState setDigest:](v10, "setDigest:", v11);

    -[CorrectionsProfilesPersistedState digest](self->_persistedState, "digest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[CorrectionsProfilesPersistedState setCorrectionsProfiles:](self->_persistedState, "setCorrectionsProfiles:", 0);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_persistedState, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v22 = 0;
      v15 = objc_msgSend(v13, "writeToFile:options:error:", v6, 1, &v22);
      v16 = v22;
      if ((v15 & 1) == 0)
      {
        v17 = *MEMORY[0x24BE08FE8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[CorrectionsProfilesLastState saveNewState:]";
          v25 = 2112;
          v26 = v4;
          _os_log_error_impl(&dword_2172C1000, v17, OS_LOG_TYPE_ERROR, "%s Could not save state: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v20 = *MEMORY[0x24BE08FE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[CorrectionsProfilesLastState saveNewState:]";
        v25 = 2112;
        v26 = v4;
        _os_log_error_impl(&dword_2172C1000, v20, OS_LOG_TYPE_ERROR, "%s Could not archive state: %@", buf, 0x16u);
      }
      v16 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  v21 = 0;
  v18 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v21);
  v16 = v21;
  if (v16 || (v18 & 1) == 0)
  {
    v19 = *MEMORY[0x24BE08FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CorrectionsProfilesLastState saveNewState:]";
      v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_2172C1000, v19, OS_LOG_TYPE_ERROR, "%s Failed to remove previous state:%@", buf, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p %@"), objc_opt_class(), self, self->_persistedState);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
}

@end
