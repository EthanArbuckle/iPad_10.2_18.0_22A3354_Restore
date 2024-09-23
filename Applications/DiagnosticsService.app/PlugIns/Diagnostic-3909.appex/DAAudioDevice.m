@implementation DAAudioDevice

- (DAAudioDevice)initWithSequentialAudioInput:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  DAAudioDevice *v6;
  DAAudioDevice *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  DAAudioDevice *v11;
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAAudioDevice;
  v6 = -[DAAudioDevice init](&v14, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  -[DAAudioDevice setSequentialAudioInput:](v6, "setSequentialAudioInput:", v5);
  v13 = 0;
  v8 = -[DAAudioDevice initilizeAudioSessionWithError:](v7, "initilizeAudioSessionWithError:", &v13);
  v9 = v13;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    -[DAAudioDevice setIsCancelled:](v7, "setIsCancelled:", 0);

LABEL_4:
    v11 = v7;
    goto LABEL_8;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)playSignalFile:(id)a3 fileName:(id)a4 fromOutput:(unint64_t)a5 atVolume:(id)a6 withChannel:(id)a7 sendRawData:(BOOL)a8 error:(id *)a9
{
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  DAPlayAndRecord *v19;
  DAPlayAndRecord *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned __int8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  DAPlayAndRecord *v32;
  DAPlayAndRecord *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v43 = a3;
  v42 = a4;
  v41 = a6;
  v40 = a7;
  v15 = objc_alloc_init((Class)NSMutableArray);
  -[DAAudioDevice setResults:](self, "setResults:", v15);

  if (-[DAAudioDevice sequentialAudioInput](self, "sequentialAudioInput"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice getBuiltInMicrophonePortWithError:](self, "getBuiltInMicrophonePortWithError:", a9));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice numberOfInputComponents](self, "numberOfInputComponents"));
    if ((int)objc_msgSend(v17, "intValue") >= 1)
    {
      v18 = 0;
      while (1)
      {
        v19 = [DAPlayAndRecord alloc];
        LOBYTE(v39) = -[DAAudioDevice sequentialAudioInput](self, "sequentialAudioInput");
        LOBYTE(v38) = a8;
        v20 = -[DAPlayAndRecord initWithFileURL:fileName:numberOfInputs:inputID:outputID:volume:channel:sendRawData:delegate:sequentialAudioInput:error:](v19, "initWithFileURL:fileName:numberOfInputs:inputID:outputID:volume:channel:sendRawData:delegate:sequentialAudioInput:error:", v43, v42, &off_1000108B8, v18, a5, v41, v40, v38, self, v39, a9);
        -[DAAudioDevice setPlayAndRecord:](self, "setPlayAndRecord:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataSources"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", v18));

        if (!objc_msgSend(v16, "setPreferredDataSource:error:", v22, 0))
        {
          v36 = -7;
          goto LABEL_19;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
        v24 = objc_msgSend(v23, "setPreferredInput:error:", v16, 0);

        if (!v24)
          break;
        v25 = -[DAAudioDevice startPlayAndRecordWithError:](self, "startPlayAndRecordWithError:", a9);

        if ((v25 & 1) == 0)
          goto LABEL_22;
        if (++v18 >= (int)objc_msgSend(v17, "intValue"))
          goto LABEL_14;
      }
      v36 = -8;
LABEL_19:
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", v36, a9);

      goto LABEL_22;
    }
LABEL_14:

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice results](self, "results"));
    v34 = objc_msgSend(v16, "copy");
LABEL_23:

    goto LABEL_24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v26, "setAllowAllBuiltInDataSources:", 1);

  v27 = objc_claimAutoreleasedReturnValue(-[DAAudioDevice getBuiltInMicrophonePortWithError:](self, "getBuiltInMicrophonePortWithError:", a9));
  if (v27)
  {
    v16 = (void *)v27;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice getAllMicrophoneSourceForPort:error:](self, "getAllMicrophoneSourceForPort:error:", v27, a9));
    if (!v17)
      goto LABEL_22;
    if (objc_msgSend(v16, "setPreferredDataSource:error:", v17, 0))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      v29 = objc_msgSend(v28, "setPreferredInput:error:", v16, 0);

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v30, "inputNumberOfChannels")));

        v32 = [DAPlayAndRecord alloc];
        LOBYTE(v39) = -[DAAudioDevice sequentialAudioInput](self, "sequentialAudioInput");
        LOBYTE(v38) = a8;
        v33 = -[DAPlayAndRecord initWithFileURL:fileName:numberOfInputs:inputID:outputID:volume:channel:sendRawData:delegate:sequentialAudioInput:error:](v32, "initWithFileURL:fileName:numberOfInputs:inputID:outputID:volume:channel:sendRawData:delegate:sequentialAudioInput:error:", v43, v42, v31, -1, a5, v41, v40, v38, self, v39, a9);
        -[DAAudioDevice setPlayAndRecord:](self, "setPlayAndRecord:", v33);

        LOBYTE(v33) = -[DAAudioDevice startPlayAndRecordWithError:](self, "startPlayAndRecordWithError:", a9);
        if ((v33 & 1) != 0)
          goto LABEL_14;
LABEL_22:

        v34 = 0;
        goto LABEL_23;
      }
      v35 = -8;
    }
    else
    {
      v35 = -7;
    }
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", v35, a9);
    goto LABEL_22;
  }
  v34 = 0;
LABEL_24:

  return v34;
}

- (BOOL)startPlayAndRecordWithError:(id *)a3
{
  void *v5;
  DAAudioDevice *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice playAndRecord](self, "playAndRecord"));

  if (!v5)
    return 0;
  if (-[DAAudioDevice isHeadphonesConnected](self, "isHeadphonesConnected"))
  {
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -54, a3);
    return 0;
  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[DAAudioDevice isCancelled](v6, "isCancelled");
  objc_sync_exit(v6);

  if ((v7 & 1) != 0)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice playAndRecord](v6, "playAndRecord"));
  v9 = objc_msgSend(v8, "startAudioTestCase");

  if (v9)
    return 0;
  v11 = dispatch_semaphore_create(0);
  -[DAAudioDevice setAudioPlayingSemaphore:](v6, "setAudioPlayingSemaphore:", v11);

  v12 = objc_claimAutoreleasedReturnValue(-[DAAudioDevice audioPlayingSemaphore](v6, "audioPlayingSemaphore"));
  v13 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v12, v13);

  return 1;
}

- (void)cancel
{
  DAAudioDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[DAAudioDevice setIsCancelled:](v2, "setIsCancelled:", 1);
  objc_sync_exit(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice playAndRecord](v2, "playAndRecord"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice playAndRecord](v2, "playAndRecord"));
    objc_msgSend(v4, "cancel");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice audioPlayingSemaphore](v2, "audioPlayingSemaphore"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DAAudioDevice audioPlayingSemaphore](v2, "audioPlayingSemaphore"));
    dispatch_semaphore_signal(v6);

  }
}

- (void)playAndRecordFinished
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice results](self, "results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice playAndRecord](self, "playAndRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice audioPlayingSemaphore](self, "audioPlayingSemaphore"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[DAAudioDevice audioPlayingSemaphore](self, "audioPlayingSemaphore"));
    dispatch_semaphore_signal(v7);

  }
}

- (BOOL)initilizeAudioSessionWithError:(id *)a3
{
  void *v4;
  BOOL v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  if (!objc_msgSend(v4, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayAndRecord, AVAudioSessionModeRaw, 1, a3))
  {
    v6 = -2;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "setMode:error:", AVAudioSessionModeMeasurement, 0))
  {
    v6 = -3;
    goto LABEL_7;
  }
  v5 = 1;
  if ((objc_msgSend(v4, "setActive:error:", 1, 0) & 1) == 0)
  {
    v6 = -4;
LABEL_7:
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", v6, a3);
    v5 = 0;
  }

  return v5;
}

- (id)numberOfInputComponents
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DAAudioDevice getBuiltInMicrophonePortWithError:](self, "getBuiltInMicrophonePortWithError:", 0));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSources", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    LODWORD(v6) = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "dataSourceID"));
        v10 = objc_msgSend(v9, "intValue");

        if (v10 == 1634495520)
          v6 = v6;
        else
          v6 = (v6 + 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  return v11;
}

- (id)getBuiltInMicrophonePortWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableInputs"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "portType", (_QWORD)v16));
      v13 = objc_msgSend(v12, "isEqualToString:", AVAudioSessionPortBuiltInMic);

      if ((v13 & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (v14)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -5, a3, (_QWORD)v16);
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)getAllMicrophoneSourceForPort:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSourceID"));
      v12 = objc_msgSend(v11, "intValue");

      if (v12 == 1634495520)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      return v13;
  }
  else
  {
LABEL_9:

  }
  +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -6, a4);
  v13 = 0;
  return v13;
}

- (BOOL)isHeadphonesConnected
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputs", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portType"));
        if (objc_msgSend(v10, "isEqualToString:", AVAudioSessionPortBuiltInReceiver))
        {

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "portType"));
          v12 = objc_msgSend(v11, "isEqualToString:", AVAudioSessionPortBuiltInSpeaker);

          if (!v12)
          {
            v13 = 1;
            goto LABEL_13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (unint64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(unint64_t)a3
{
  self->_outputID = a3;
}

- (unint64_t)volume
{
  return self->_volume;
}

- (void)setVolume:(unint64_t)a3
{
  self->_volume = a3;
}

- (BOOL)sendRawData
{
  return self->_sendRawData;
}

- (void)setSendRawData:(BOOL)a3
{
  self->_sendRawData = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (OS_dispatch_semaphore)audioPlayingSemaphore
{
  return self->_audioPlayingSemaphore;
}

- (void)setAudioPlayingSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayingSemaphore, a3);
}

- (DAPlayAndRecord)playAndRecord
{
  return self->_playAndRecord;
}

- (void)setPlayAndRecord:(id)a3
{
  objc_storeStrong((id *)&self->_playAndRecord, a3);
}

- (BOOL)sequentialAudioInput
{
  return self->_sequentialAudioInput;
}

- (void)setSequentialAudioInput:(BOOL)a3
{
  self->_sequentialAudioInput = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playAndRecord, 0);
  objc_storeStrong((id *)&self->_audioPlayingSemaphore, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
