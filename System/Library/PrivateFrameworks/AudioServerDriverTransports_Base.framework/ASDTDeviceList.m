@implementation ASDTDeviceList

- (ASDTDeviceList)init
{
  ASDTDeviceList *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ASDTDeviceList *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ASDTDeviceList;
  v2 = -[ASDTDeviceList init](&v14, sel_init);
  if (!v2)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList setAudioDeviceDict:](v2, "setAudioDeviceDict:", v3);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList setInterestsDict:](v2, "setInterestsDict:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDD1648]);
  -[ASDTDeviceList setLock:](v2, "setLock:", v5);

  -[ASDTDeviceList lock](v2, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("com.apple.AudioServerDriverTransports.ASDTDeviceList"));

  -[ASDTDeviceList lock](v2, "lock");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASDTDeviceList audioDeviceDict](v2, "audioDeviceDict");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[ASDTDeviceList interestsDict](v2, "interestsDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
LABEL_5:
        v12 = v2;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTDeviceList init].cold.1();
  v12 = 0;
LABEL_10:

  return v12;
}

- (NSArray)audioDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ASDTDeviceList lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[ASDTDeviceList audioDeviceDict](self, "audioDeviceDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTDeviceList lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

- (id)getAudioDeviceWithUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[ASDTDeviceList lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[ASDTDeviceList audioDeviceDict](self, "audioDeviceDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASDTDeviceList lock](self, "lock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)addAudioDeviceWithCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "deviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASDTDeviceList lock](self, "lock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lock");

    -[ASDTDeviceList audioDeviceDict](self, "audioDeviceDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v4, v8);

    -[ASDTDeviceList lock](self, "lock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    -[ASDTDeviceList notifyOfInterest:forDevice:](self, "notifyOfInterest:forDevice:", 1, v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTDeviceList addAudioDeviceWithCheck:].cold.1(v4);
  }

  return v5 != 0;
}

- (void)addAudioDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ASDTDeviceList addAudioDevice:](self, "addAudioDevice:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAudioDeviceWithUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASDTDeviceList getAudioDeviceWithUID:](self, "getAudioDeviceWithUID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASDTDeviceList notifyOfInterest:forDevice:](self, "notifyOfInterest:forDevice:", 4, v4);
    -[ASDTDeviceList lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[ASDTDeviceList audioDeviceDict](self, "audioDeviceDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

    -[ASDTDeviceList lock](self, "lock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
}

- (void)removeAudioDevice:(id)a3
{
  id v4;

  objc_msgSend(a3, "deviceUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList removeAudioDeviceWithUID:](self, "removeAudioDeviceWithUID:", v4);

}

- (void)removeAudioDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTDeviceList removeAudioDeviceWithUID:](self, "removeAudioDeviceWithUID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)registerObject:(id)a3 withInterests:(int)a4 forUID:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTDeviceList lock](self, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lock");

  -[ASDTDeviceList interestsDict](self, "interestsDict");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v15)
          -[ASDTDeviceList registerObject:withInterests:forUID:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceList.m"), 154, CFSTR("Memory allocation error."));

      }
      -[ASDTDeviceList interestsDict](self, "interestsDict");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v14, v10);

    }
    objc_msgSend(v14, "objectForKey:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = v25;
      objc_msgSend(v25, "setInterests:", v6);
      if ((v6 & 1) == 0)
      {
LABEL_10:
        v27 = 0;
LABEL_20:
        -[ASDTDeviceList lock](self, "lock");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "unlock");

        objc_msgSend(v26, "notifyOfInterest:forDevice:", 1, v27);
        goto LABEL_21;
      }
    }
    else
    {
      +[ASDTDeviceInterest createForObject:withInterests:](ASDTDeviceInterest, "createForObject:withInterests:", v9, v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v30)
          -[ASDTDeviceList registerObject:withInterests:forUID:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceList.m"), 161, CFSTR("Memory allocation error."));

      }
      objc_msgSend(v14, "setObject:forKey:", v26, v11);
      if ((v6 & 1) == 0)
        goto LABEL_10;
    }
    -[ASDTDeviceList audioDeviceDict](self, "audioDeviceDict");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  objc_msgSend(v14, "objectForKey:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v28;
  if (v28)
  {
    objc_msgSend(v28, "setInterested:", 0);
    objc_msgSend(v14, "removeObjectForKey:", v11);
  }
  -[ASDTDeviceList lock](self, "lock");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unlock");

LABEL_21:
}

- (void)notifyOfInterest:(int)a3 forDevice:(id)a4
{
  uint64_t v4;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (!(_DWORD)v4)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      -[ASDTDeviceList notifyOfInterest:forDevice:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTDeviceList.m"), 177, CFSTR("Invalid Arguments."));

  }
  objc_msgSend(v7, "deviceUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[ASDTDeviceList lock](self, "lock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lock");

    -[ASDTDeviceList interestsDict](self, "interestsDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceList lock](self, "lock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unlock");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v28++), "notifyOfInterest:forDevice:", v4, v7, (_QWORD)v29);
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v26);
    }

  }
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableDictionary)audioDeviceDict
{
  return self->_audioDeviceDict;
}

- (void)setAudioDeviceDict:(id)a3
{
  objc_storeStrong((id *)&self->_audioDeviceDict, a3);
}

- (NSMutableDictionary)interestsDict
{
  return self->_interestsDict;
}

- (void)setInterestsDict:(id)a3
{
  objc_storeStrong((id *)&self->_interestsDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestsDict, 0);
  objc_storeStrong((id *)&self->_audioDeviceDict, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "ASDTDeviceList";
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Memory allocation error.", (uint8_t *)&v0, 0xCu);
}

- (void)addAudioDeviceWithCheck:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 136315394;
  v3 = "ASDTDeviceList";
  v4 = 2112;
  v5 = v1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed adding audio device with UID: %@", (uint8_t *)&v2, 0x16u);

}

- (void)registerObject:(uint64_t)a3 withInterests:(uint64_t)a4 forUID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Memory allocation error.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)notifyOfInterest:(uint64_t)a3 forDevice:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Invalid Arguments.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end
