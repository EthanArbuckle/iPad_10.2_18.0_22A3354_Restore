@implementation MIOWriterStreamInput

- (MIOWriterStreamInput)init
{
  MIOWriterStreamInput *v2;
  MIOWriterStreamInput *v3;
  uint64_t v4;
  NSMutableArray *associatedInputs;
  __int128 v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MIOWriterStreamInput;
  v2 = -[MIOWriterStreamInput init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v7 = *MEMORY[0x24BDC0D38];
    v8 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    -[MIOWriterStreamInput setLastAppendTimeStamp:](v2, "setLastAppendTimeStamp:", &v7);
    v3->_initFifoCapacity = 10;
    v3->_mediaTimeScale = 0;
    v3->_threadingOption = 0;
    v4 = objc_opt_new();
    associatedInputs = v3->_associatedInputs;
    v3->_associatedInputs = (NSMutableArray *)v4;

  }
  return v3;
}

- (BOOL)registerForAssociating:(id)a3 trackRelation:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured");
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](self->_associatedInputs, "addObject:", v10);
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportWarning:", CFSTR("Cannot register input for association after preparing.  No-op."));

  }
  return v8;
}

- (BOOL)establishAssociationsWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[MIOWriterStreamInput associatedInputs](self, "associatedInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v25 = a3;
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nonretainedObjectValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mainAVInput");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOWriterStreamInput mainAVInput](self, "mainAVInput");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "canAddTrackAssociationWithTrackOfInput:type:", v15, v13);

        if ((v16 & 1) == 0)
        {
          v20 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v12, "streamId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIOWriterStreamInput streamId](self, "streamId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Cannot associate(%@) %@ with %@."), v13, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", v25, v23, 13);
          v19 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v12, "mainAVInput");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOWriterStreamInput mainAVInput](self, "mainAVInput");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTrackAssociationWithTrackOfInput:type:", v18, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

- (NSArray)associatedInputs
{
  return (NSArray *)self->_associatedInputs;
}

- (BOOL)canBeConfigured
{
  void *v3;
  void *v4;
  char v5;

  -[MIOWriterStreamInput writer](self, "writer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "checkStatus:", 1768843636);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)setCustomMetadata:(id)a3
{
  NSDictionary *v4;
  void *customMetadata;
  id v6;

  v6 = a3;
  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    v4 = (NSDictionary *)v6;
    customMetadata = self->_customMetadata;
    self->_customMetadata = v4;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    customMetadata = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(customMetadata, "reportWarning:", CFSTR("Cannot set input's customMetadata after preparing.  No-op."));
  }

}

- (void)setCustomMetadataItems:(id)a3
{
  NSArray *v4;
  void *customMetadataItems;
  id v6;

  v6 = a3;
  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    v4 = (NSArray *)v6;
    customMetadataItems = self->_customMetadataItems;
    self->_customMetadataItems = v4;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    customMetadataItems = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(customMetadataItems, "reportWarning:", CFSTR("Cannot set input's customMetadataItems after preparing.  No-op."));
  }

}

- (void)setBufferingCapacity:(unint64_t)a3
{
  id v5;
  id v6;

  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    if (self->_fifoBuffer)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("FIFOAlreadyCreated"), CFSTR("Fifo is already created, capacity cannot be changed anymore."), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    self->_initFifoCapacity = a3;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportWarning:", CFSTR("Cannot set input's bufferingCapacity after preparing.  No-op."));

  }
}

- (void)setMediaTimeScale:(int)a3
{
  id v5;

  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    self->_mediaTimeScale = a3;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportWarning:", CFSTR("Cannot set input's mediaTimeScale after preparing.  No-op."));

  }
}

- (void)setUseOwnWritingThread:(BOOL)a3
{
  void *v5;
  id v6;
  id v7;

  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("WritingThreadAlreadyAssigned"), CFSTR("A writing thread is already assigned, cannot set usage of own writing thread."), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    self->_useOwnWritingThread = a3;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportWarning:", CFSTR("Cannot set input's useOwnWritingThread after preparing.  No-op."));

  }
}

- (void)setUseOwnProcessingQueue:(BOOL)a3
{
  id v5;
  id v6;

  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    if (self->_processingQueue)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("ProcessingQueueAlreadyAssigned"), CFSTR("A processing queue is already assigned, cannot set usage of own processing queue."), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    self->_useOwnProcessingQueue = a3;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportWarning:", CFSTR("Cannot set input's useOwnProcessingQueue after preparing.  No-op."));

  }
}

- (void)setThreadingOption:(int64_t)a3
{
  id v5;

  if (-[MIOWriterStreamInput canBeConfigured](self, "canBeConfigured"))
  {
    self->_threadingOption = a3;
  }
  else
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportWarning:", CFSTR("Cannot set input's threadingOption after preparing.  No-op."));

  }
}

- (id)stats
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MIOWriterStreamInput uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIOWriterStreamInput pendingSamples](self, "pendingSamples");
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: PEND: %lld (FIFO: %zu) REDY: %d"), v4, v5, objc_msgSend(v6, "usage"), -[MIOWriterStreamInput areAllInputsReady](self, "areAllInputsReady"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)onAVInputsAvailable:(id)a3
{
  void *v4;
  id inputsAvailableHandler;

  v4 = (void *)MEMORY[0x212BC9CCC](a3, a2);
  inputsAvailableHandler = self->_inputsAvailableHandler;
  self->_inputsAvailableHandler = v4;

}

- (int64_t)pendingSamples
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MIOWriterStreamInput countingQueue](self, "countingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__MIOWriterStreamInput_pendingSamples__block_invoke;
  v6[3] = &unk_24CA44AE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __38__MIOWriterStreamInput_pendingSamples__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (NSString)uuid
{
  NSString *uuid;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%ld"), v5, -[MIOWriterStreamInput mediaType](self, "mediaType"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (BOOL)verifyNewAppendTimeStamp:(id *)a3 error:(id *)a4
{
  void *v7;
  Float64 Seconds;
  void *v9;
  __int128 v11;
  int64_t var3;
  CMTime time;
  CMTime time2;
  CMTime time1;
  char v16;

  -[MIOWriterStreamInput lastAppendTimeStamp](self, "lastAppendTimeStamp");
  if ((v16 & 1) == 0
    || (-[MIOWriterStreamInput lastAppendTimeStamp](self, "lastAppendTimeStamp"),
        time2 = (CMTime)*a3,
        CMTimeCompare(&time1, &time2) < 0))
  {
    v11 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[MIOWriterStreamInput setLastAppendTimeStamp:](self, "setLastAppendTimeStamp:", &v11);
    return 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    time2 = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time2);
    -[MIOWriterStreamInput lastAppendTimeStamp](self, "lastAppendTimeStamp");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Invalid time stamp (%f). Time stamp must be higher than %f."), *(_QWORD *)&Seconds, CMTimeGetSeconds(&time));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateWriterError:message:code:", a4, v9, 17);

    return 0;
  }
}

- (unint64_t)bufferingCapacity
{
  if (self->_fifoBuffer)
    return -[MIOFifoBuffer capacity](self->_fifoBuffer, "capacity");
  else
    return self->_initFifoCapacity;
}

- (BOOL)canAppend
{
  BOOL v2;
  int64_t threadingOption;
  NSObject *v5;
  NSObject *v6;
  _QWORD v8[6];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  threadingOption = self->_threadingOption;
  if (threadingOption == 1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    if (-[MIOWriterStreamInput strictlyEnforceBufferCapacity](self, "strictlyEnforceBufferCapacity"))
    {
      -[MIOWriterStreamInput countingQueue](self, "countingQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __33__MIOWriterStreamInput_canAppend__block_invoke_2;
      v8[3] = &unk_24CA44AE8;
      v8[4] = self;
      v8[5] = &v10;
      dispatch_sync(v6, v8);

    }
    if (*((_BYTE *)v11 + 24))
      v2 = -[MIOWriterStreamInput areAllInputsReady](self, "areAllInputsReady");
    else
      v2 = 0;
    goto LABEL_9;
  }
  if (!threadingOption)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[MIOWriterStreamInput countingQueue](self, "countingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__MIOWriterStreamInput_canAppend__block_invoke;
    block[3] = &unk_24CA44AE8;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(v5, block);

    v2 = *((_BYTE *)v11 + 24) != 0;
LABEL_9:
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

unint64_t __33__MIOWriterStreamInput_canAppend__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[4] + 1;
  result = objc_msgSend(v2, "bufferingCapacity");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 <= result;
  return result;
}

unint64_t __33__MIOWriterStreamInput_canAppend__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[4] + 1;
  result = objc_msgSend(v2, "bufferingCapacity");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 <= result;
  return result;
}

- (BOOL)pendSample
{
  MIOWriterStreamInput *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MIOWriterStreamInput countingQueue](self, "countingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__MIOWriterStreamInput_pendSample__block_invoke;
  v5[3] = &unk_24CA44B10;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

unint64_t __34__MIOWriterStreamInput_pendSample__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t result;
  uint64_t v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[4] + 1;
  result = objc_msgSend(v2, "bufferingCapacity");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3 <= result)
  {
    *(_BYTE *)(v5 + 24) = 1;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
  else
  {
    *(_BYTE *)(v5 + 24) = 0;
  }
  return result;
}

- (void)resolveSample
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[MIOWriterStreamInput countingQueue](self, "countingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__MIOWriterStreamInput_resolveSample__block_invoke;
  v4[3] = &unk_24CA44B38;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__MIOWriterStreamInput_resolveSample__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    --WeakRetained[4];

}

- (BOOL)prepareForAppendWithTimeStamp:(id *)a3 error:(id *)a4
{
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  int64_t var3;

  -[MIOWriterStreamInput writer](self, "writer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkStatus:", 1919247481);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateWriterError:message:code:", a4, CFSTR("Writer not in state MIOWriterReady. Cannot append"), 17);
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  v18 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v9 = -[MIOWriterStreamInput verifyNewAppendTimeStamp:error:](self, "verifyNewAppendTimeStamp:error:", &v18, a4);
  if (!v9)
    return v9;
  if (self->_threadingOption == 1 && !-[MIOWriterStreamInput areAllInputsReady](self, "areAllInputsReady"))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Stream: %@ inputs are not ready, dropping sample"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateWriterError:message:code:", a4, v16, 21);
    goto LABEL_8;
  }
  if (!-[MIOWriterStreamInput pendSample](self, "pendSample"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput streamId](self, "streamId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Stream: %@ buffering capacity reached (%zu), dropping sample"), v12, -[MIOWriterStreamInput bufferingCapacity](self, "bufferingCapacity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateWriterError:message:code:", a4, v13, 18);
    goto LABEL_8;
  }
  -[MIOWriterStreamInput writer](self, "writer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  objc_msgSend(v10, "proposeSessionStartTime:", &v18);

  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)prepareInputWithWriter:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void (**inputsAvailableHandler)(id, MIOWriterStreamInput *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *countingQueue;
  MIOFifoBuffer *v16;
  MIOFifoBuffer *fifoBuffer;

  v6 = a3;
  -[MIOWriterStreamInput setWriter:](self, "setWriter:", v6);
  v7 = -[MIOWriterStreamInput setupInputsWithWriter:error:](self, "setupInputsWithWriter:error:", v6, a4);

  if (v7)
  {
    inputsAvailableHandler = (void (**)(id, MIOWriterStreamInput *, void *))self->_inputsAvailableHandler;
    if (inputsAvailableHandler)
    {
      -[MIOWriterStreamInput allWriterInputs](self, "allWriterInputs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      inputsAvailableHandler[2](inputsAvailableHandler, self, v9);

    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("mio.counting.%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    countingQueue = self->_countingQueue;
    self->_countingQueue = v14;

    v16 = -[MIOFifoBuffer initWithCapacity:]([MIOFifoBuffer alloc], "initWithCapacity:", self->_initFifoCapacity);
    fifoBuffer = self->_fifoBuffer;
    self->_fifoBuffer = v16;

    -[MIOWriterStreamInput setupSignPost](self, "setupSignPost");
    -[MIOWriterStreamInput observeIsReadyStatus](self, "observeIsReadyStatus");
    -[MIOWriterStreamInput prepareInputFinished](self, "prepareInputFinished");

  }
  return v7;
}

- (void)setupSignPost
{
  void *v3;
  void *v4;
  __CFString *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;

  if (-[MIOWriterStreamInput useOwnProcessingQueue](self, "useOwnProcessingQueue"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[MIOWriterStreamInput uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.mio.processing.%@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("com.apple.mio.processing.default");
  }
  v10 = objc_retainAutorelease(v5);
  v6 = os_log_create((const char *)-[__CFString UTF8String](v10, "UTF8String"), "PointsOfInterest");
  -[MIOWriterStreamInput setPerfLogHandle:](self, "setPerfLogHandle:", v6);

  -[MIOWriterStreamInput perfLogHandle](self, "perfLogHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  -[MIOWriterStreamInput setProcessingSignPostID:](self, "setProcessingSignPostID:", os_signpost_id_generate(v7));

  -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "perfLogHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  -[MIOWriterStreamInput setAvfAppendSignPostID:](self, "setAvfAppendSignPostID:", os_signpost_id_generate(v9));

}

- (BOOL)finalizeProcessing
{
  int64_t v3;
  void *v4;

  v3 = -[MIOWriterStreamInput threadingOption](self, "threadingOption");
  if (v3 == 1)
    return -[MIOWriterStreamInput writeNextItemFromFifo](self, "writeNextItemFromFifo");
  if (!v3)
  {
    -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proceed");

  }
  return 1;
}

- (void)prepareInputFinished
{
  __assert_rtn("-[MIOWriterStreamInput prepareInputFinished]", "MIOWriterStreamInput.m", 349, "0");
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  __assert_rtn("-[MIOWriterStreamInput setupInputsWithWriter:error:]", "MIOWriterStreamInput.m", 354, "0");
}

- (void)finishProcessing
{
  __assert_rtn("-[MIOWriterStreamInput finishProcessing]", "MIOWriterStreamInput.m", 359, "0");
}

- (BOOL)writeNextItemFromFifo
{
  __assert_rtn("-[MIOWriterStreamInput writeNextItemFromFifo]", "MIOWriterStreamInput.m", 364, "0");
}

- (id)allWriterInputs
{
  __assert_rtn("-[MIOWriterStreamInput allWriterInputs]", "MIOWriterStreamInput.m", 370, "0");
}

- (BOOL)areAllInputsReady
{
  __assert_rtn("-[MIOWriterStreamInput areAllInputsReady]", "MIOWriterStreamInput.m", 376, "0");
}

- (BOOL)strictlyEnforceBufferCapacity
{
  return 0;
}

- (NSArray)underlyingInputs
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (AVAssetWriterInput)mainAVInput
{
  __assert_rtn("-[MIOWriterStreamInput mainAVInput]", "MIOWriterStreamInput.m", 392, "0");
}

- (OS_dispatch_queue)processingQueue
{
  OS_dispatch_queue *processingQueue;
  OS_dispatch_queue **p_processingQueue;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *v12;
  _QWORD block[4];
  NSObject *v15;

  p_processingQueue = &self->_processingQueue;
  processingQueue = self->_processingQueue;
  if (!processingQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_useOwnProcessingQueue)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[MIOWriterStreamInput uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("mio.processing.%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_retainAutorelease(v9);
      v11 = (OS_dispatch_queue *)dispatch_queue_create((const char *)-[NSObject UTF8String](v10, "UTF8String"), v6);
      v12 = self->_processingQueue;
      self->_processingQueue = v11;

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__MIOWriterStreamInput_processingQueue__block_invoke;
      block[3] = &unk_24CA44B60;
      v15 = v5;
      if (processingQueue_onceToken != -1)
        dispatch_once(&processingQueue_onceToken, block);
      objc_storeStrong((id *)p_processingQueue, (id)processingQueue_proc);
      v10 = v15;
    }

    processingQueue = *p_processingQueue;
  }
  return processingQueue;
}

void __39__MIOWriterStreamInput_processingQueue__block_invoke(uint64_t a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("mio.processing.shared", *(dispatch_queue_attr_t *)(a1 + 32));
  v2 = (void *)processingQueue_proc;
  processingQueue_proc = (uint64_t)v1;

}

- (void)finishProcessingInDispatchGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  if (self->_threadingOption != 1
    || -[MIOWriterStreamInput strictlyEnforceBufferCapacity](self, "strictlyEnforceBufferCapacity"))
  {
    objc_initWeak(&location, self);
    -[MIOWriterStreamInput processingQueue](self, "processingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__MIOWriterStreamInput_finishProcessingInDispatchGroup___block_invoke;
    v6[3] = &unk_24CA44B38;
    objc_copyWeak(&v7, &location);
    dispatch_group_async(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __56__MIOWriterStreamInput_finishProcessingInDispatchGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "finishProcessing");
    WeakRetained = v2;
  }

}

- (BOOL)shutDownOutError:(id *)a3
{
  void *v4;

  -[MIOWriterStreamInput stopObservingIsReadyStatus](self, "stopObservingIsReadyStatus", a3);
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emptyFifoBuffer");

  return 1;
}

- (void)invalidate
{
  id v3;

  -[MIOWriterStreamInput stopObservingIsReadyStatus](self, "stopObservingIsReadyStatus");
  -[MIOWriterStreamInput fifoBuffer](self, "fifoBuffer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emptyFifoBuffer");

}

- (void)observeIsReadyStatus
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!-[MIOWriterStreamInput observingIsReadyStatus](self, "observingIsReadyStatus"))
  {
    -[MIOWriterStreamInput setObservingIsReadyStatus:](self, "setObservingIsReadyStatus:", 1);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[MIOWriterStreamInput allWriterInputs](self, "allWriterInputs", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "addObserver:forKeyPath:options:context:", self, CFSTR("readyForMoreMediaData"), 1, 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)stopObservingIsReadyStatus
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[MIOWriterStreamInput observingIsReadyStatus](self, "observingIsReadyStatus"))
  {
    -[MIOWriterStreamInput setObservingIsReadyStatus:](self, "setObservingIsReadyStatus:", 0);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[MIOWriterStreamInput allWriterInputs](self, "allWriterInputs", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeObserver:forKeyPath:", self, CFSTR("readyForMoreMediaData"));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDD0E70], a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8 && -[MIOWriterStreamInput areAllInputsReady](self, "areAllInputsReady"))
  {
    -[MIOWriterStreamInput writer](self, "writer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canWrite");

    if (v10)
    {
      -[MIOWriterStreamInput assignedWritingThread](self, "assignedWritingThread");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "proceed");

    }
  }
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (NSString)streamId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStreamId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSDictionary)customMetadata
{
  return self->_customMetadata;
}

- (NSArray)customMetadataItems
{
  return self->_customMetadataItems;
}

- (int)mediaTimeScale
{
  return self->_mediaTimeScale;
}

- (BOOL)useOwnWritingThread
{
  return self->_useOwnWritingThread;
}

- (BOOL)useOwnProcessingQueue
{
  return self->_useOwnProcessingQueue;
}

- (int64_t)threadingOption
{
  return self->_threadingOption;
}

- (OS_dispatch_queue)countingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (MIOFifoBuffer)fifoBuffer
{
  return (MIOFifoBuffer *)objc_getProperty(self, a2, 120, 1);
}

- (MIOWriter)writer
{
  return (MIOWriter *)objc_loadWeakRetained((id *)&self->_writer);
}

- (void)setWriter:(id)a3
{
  objc_storeWeak((id *)&self->_writer, a3);
}

- (BOOL)observingIsReadyStatus
{
  return self->_observingIsReadyStatus;
}

- (void)setObservingIsReadyStatus:(BOOL)a3
{
  self->_observingIsReadyStatus = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAppendTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_lastAppendTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastAppendTimeStamp:(id *)a3
{
  objc_copyStruct(&self->_lastAppendTimeStamp, a3, 24, 1, 0);
}

- (MIOThread)assignedWritingThread
{
  return (MIOThread *)objc_loadWeakRetained((id *)&self->_assignedWritingThread);
}

- (void)setAssignedWritingThread:(id)a3
{
  objc_storeWeak((id *)&self->_assignedWritingThread, a3);
}

- (OS_os_log)perfLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPerfLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unint64_t)processingSignPostID
{
  return self->_processingSignPostID;
}

- (void)setProcessingSignPostID:(unint64_t)a3
{
  self->_processingSignPostID = a3;
}

- (unint64_t)avfAppendSignPostID
{
  return self->_avfAppendSignPostID;
}

- (void)setAvfAppendSignPostID:(unint64_t)a3
{
  self->_avfAppendSignPostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfLogHandle, 0);
  objc_destroyWeak((id *)&self->_assignedWritingThread);
  objc_destroyWeak((id *)&self->_writer);
  objc_storeStrong((id *)&self->_fifoBuffer, 0);
  objc_storeStrong((id *)&self->_countingQueue, 0);
  objc_storeStrong((id *)&self->_customMetadataItems, 0);
  objc_storeStrong((id *)&self->_customMetadata, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_associatedInputs, 0);
  objc_storeStrong(&self->_inputsAvailableHandler, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
