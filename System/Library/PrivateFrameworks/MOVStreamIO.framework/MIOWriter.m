@implementation MIOWriter

- (MIOWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4
{
  void *v5;
  MIOWriter *v6;

  objc_msgSend(a3, "path", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MIOWriter initWithFilePath:error:](self, "initWithFilePath:error:", v5, 0);

  return v6;
}

- (void)finishRecording
{
  -[MIOWriter finishWithCompletionHandler:](self, "finishWithCompletionHandler:", &__block_literal_global);
}

- (void)prepareToRecordWithMovieMetadata:(id)a3
{
  -[MIOWriter setCustomMOVMetadata:](self, "setCustomMOVMetadata:", a3);
  -[MIOWriter prepareWriterWithCompletionHandler:](self, "prepareWriterWithCompletionHandler:", &__block_literal_global_1);
}

- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5
{
  id v8;
  id v9;
  MIOWriterPixelBufferStreamInput *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[MIOWriterPixelBufferStreamInput initWithStreamId:format:recordingConfig:]([MIOWriterPixelBufferStreamInput alloc], "initWithStreamId:format:recordingConfig:", v9, a4, v8);

  -[MIOWriter addInput:error:](self, "addInput:error:", v10, 0);
}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "streamId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if (v17)
        {
          objc_msgSend(v15, "setCustomMetadata:", v8);
          v19 = 1;
          v18 = v10;
          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown stream %@."), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v18, 7);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)addMetadataTrack:(id)a3
{
  id v4;
  MIOWriterDataStreamInput *v5;

  v4 = a3;
  v5 = -[MIOWriterDataStreamInput initWithStreamId:]([MIOWriterDataStreamInput alloc], "initWithStreamId:", v4);

  -[MIOWriter addInput:error:](self, "addInput:error:", v5, 0);
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", 2);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "streamId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if (v17)
        {
          objc_msgSend(v15, "setCustomMetadata:", v8);
          v19 = 1;
          v18 = v10;
          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown stream %@."), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v18, 7);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setFifoBufferCapacity:(unint64_t)a3
{
  void *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MIOWriter writerInputs](self, "writerInputs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setBufferingCapacity:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  id v18;
  id v19;
  __int128 v20;
  int64_t var3;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
  {
LABEL_9:

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown video stream '%@'"), v8);
    goto LABEL_13;
  }
  v11 = v10;
  v12 = *(_QWORD *)v24;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v12)
      objc_enumerationMutation(v9);
    v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
    objc_msgSend(v14, "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v8);

    if (v16)
      break;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v11)
        goto LABEL_9;
      goto LABEL_3;
    }
  }
  v20 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v22 = 0;
  v17 = objc_msgSend(v14, "appendPixelBuffer:pts:error:", a3, &v20, &v22);
  v18 = v22;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v18);
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }

}

- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  id v19;
  id v20;
  __int128 v21;
  int64_t var3;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", 2);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v11)
  {
LABEL_9:

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown metadata stream '%@'"), v9);
    goto LABEL_13;
  }
  v12 = v11;
  v13 = *(_QWORD *)v25;
LABEL_3:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v13)
      objc_enumerationMutation(v10);
    v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
    objc_msgSend(v15, "streamId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v9);

    if (v17)
      break;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v12)
        goto LABEL_9;
      goto LABEL_3;
    }
  }
  v21 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v23 = 0;
  v18 = objc_msgSend(v15, "appendMetadata:withTimeStamp:error:", v8, &v21, &v23);
  v19 = v23;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v19);
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }

}

- (BOOL)setVideoTransform:(CGAffineTransform *)a3 forStream:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "streamId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          v16 = *(_OWORD *)&a3->c;
          v18[0] = *(_OWORD *)&a3->a;
          v18[1] = v16;
          v18[2] = *(_OWORD *)&a3->tx;
          objc_msgSend(v12, "setTransform:", v18);
          v15 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (MIOWriter)initWithFilePath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  dispatch_queue_t v19;
  void *v20;
  dispatch_queue_t v21;
  void *v22;
  dispatch_group_t v23;
  void *v24;
  void *v25;
  MIOWriter *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  __int128 v31;
  objc_super v32;
  unsigned __int8 v33;

  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = CFSTR("MIOWriter file path cannot be nil.");
LABEL_13:
    objc_msgSend(v27, "populateStreamError:message:code:", a4, v28, 5);
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = CFSTR("MIOWriter file path cannot be empty string.");
    goto LABEL_13;
  }
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v33);
  v11 = v33;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File path '%@' is an existing directory"), v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, v29, 5);

LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  v32.receiver = self;
  v32.super_class = (Class)MIOWriter;
  v13 = -[MIOWriter init](&v32, sel_init);
  v14 = v13;
  if (v13)
  {
    *((_QWORD *)v13 + 8) = 0x403E000000000000;
    v13[16] = 0;
    v15 = MEMORY[0x24BDC0D38];
    v31 = *MEMORY[0x24BDC0D38];
    *(_OWORD *)(v13 + 20) = *MEMORY[0x24BDC0D38];
    v16 = *(_QWORD *)(v15 + 16);
    *(_QWORD *)(v13 + 36) = v16;
    *((_DWORD *)v13 + 26) = 1768843636;
    objc_storeStrong((id *)v13 + 19, a3);
    v17 = objc_opt_new();
    v18 = (void *)v14[21];
    v14[21] = v17;

    *((_OWORD *)v14 + 11) = v31;
    v14[24] = v16;
    v19 = dispatch_queue_create("mio.writer.notifications", 0);
    v20 = (void *)v14[20];
    v14[20] = v19;

    v21 = dispatch_queue_create("mio.writer.status", 0);
    v22 = (void *)v14[12];
    v14[12] = v21;

    v14[16] = 0x403E000000000000;
    *((_BYTE *)v14 + 112) = 0;
    *((_DWORD *)v14 + 29) = 16800;
    *((_BYTE *)v14 + 110) = 0;
    *((_WORD *)v14 + 54) = 1;
    v23 = dispatch_group_create();
    v24 = (void *)v14[10];
    v14[10] = v23;

    v25 = (void *)v14[11];
    v14[11] = 0;

  }
  self = v14;
  v26 = self;
LABEL_15:

  return v26;
}

- (void)dealloc
{
  objc_super v3;

  NSLog(CFSTR("[MIOWriter dealloc]"), a2);
  v3.receiver = self;
  v3.super_class = (Class)MIOWriter;
  -[MIOWriter dealloc](&v3, sel_dealloc);
}

- (MIOMovieMetadataUtility)movieMetadataUtility
{
  MIOMovieMetadataUtility *v3;
  void *v4;
  void *v5;
  MIOMovieMetadataUtility *v6;
  id v7;
  MIOMovieMetadataUtility *movieMetadataUtility;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1685024357) && !self->_movieMetadataUtility)
  {
    v3 = [MIOMovieMetadataUtility alloc];
    -[MIOWriter avWriter](self, "avWriter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v6 = -[MIOMovieMetadataUtility initWithURL:error:](v3, "initWithURL:error:", v5, &v11);
    v7 = v11;
    movieMetadataUtility = self->_movieMetadataUtility;
    self->_movieMetadataUtility = v6;

    if (!self->_movieMetadataUtility)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_210675000, v9, OS_LOG_TYPE_ERROR, "Error creating movieMetadataUtility: %{public}@.", buf, 0xCu);
      }

    }
  }
  return self->_movieMetadataUtility;
}

- (id)writerInputs
{
  return -[MIOOrderedKeysMutableMap allValues](self->_inputs, "allValues");
}

- (id)writerInputsWithMediaType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MIOOrderedKeysMutableMap allValues](self->_inputs, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "mediaType") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)writerInputsWithMediaType:(int64_t)a3 streamId:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[MIOWriter writerInputsWithMediaType:](self, "writerInputsWithMediaType:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "streamId", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (unsigned)status
{
  NSObject *statusQueue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1970170734;
  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__MIOWriter_status__block_invoke;
  block[3] = &unk_24CA44E90;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(statusQueue, block);
  LODWORD(statusQueue) = *((_DWORD *)v9 + 6);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return statusQueue;
}

void __19__MIOWriter_status__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[26];

}

- (void)setStatus:(unsigned int)a3
{
  NSObject *statusQueue;
  _QWORD block[4];
  id v7;
  unsigned int v8;
  id location;

  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__MIOWriter_setStatus___block_invoke;
  block[3] = &unk_24CA44EB8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(statusQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __23__MIOWriter_setStatus___block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[26] = *(_DWORD *)(a1 + 40);

}

- (BOOL)checkStatus:(unsigned int)a3
{
  NSObject *statusQueue;
  _QWORD v7[5];
  id v8;
  unsigned int v9;
  id location;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__MIOWriter_checkStatus___block_invoke;
  v7[3] = &unk_24CA44EE0;
  objc_copyWeak(&v8, &location);
  v7[4] = &v11;
  v9 = a3;
  dispatch_sync(statusQueue, v7);
  LOBYTE(a3) = *((_BYTE *)v12 + 24);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);
  return a3;
}

void __25__MIOWriter_checkStatus___block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[26] == *(_DWORD *)(a1 + 48);

}

- (void)setBaseMediaTimeScale:(int)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_baseMediaTimeScale = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set baseMediaTimeScale after preparing.  No-op."));
}

- (void)setSessionStartTime:(id *)a3
{
  __int128 v4;
  MIOWriter *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_sessionStarted)
  {
    objc_sync_exit(obj);

    -[MIOWriter reportWarning:](obj, "reportWarning:", CFSTR("Cannot set sessionStartTime after session was started.  No-op."));
  }
  else
  {
    v4 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&obj->_sessionStartTime.flags = a3->var3;
    *(_OWORD *)(&obj->_sessionStarted + 4) = v4;
    objc_sync_exit(obj);

  }
}

- (void)setRealTime:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_realTime = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set realTime after preparing.  No-op."));
}

- (void)setInProcessRecording:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_inProcessRecording = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set inProcessRecording after preparing.  No-op."));
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_shouldOptimizeForNetworkUse = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set shouldOptimizeForNetworkUse after preparing.  No-op."));
}

- (void)setPreferCustomCompression:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_preferCustomCompression = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set preferCustomCompression after preparing.  No-op."));
}

- (void)setEnableAVEHighPerformanceProfile:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_enableAVEHighPerformanceProfile = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set enableAVEHighPerformanceProfile after preparing.  No-op."));
}

- (void)setDefaultFrameRate:(double)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_defaultFrameRate = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set defaultFrameRate after preparing.  No-op."));
}

- (void)setCustomMOVMetadata:(id)a3
{
  id v5;

  v5 = a3;
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    objc_storeStrong((id *)&self->_customMOVMetadata, a3);
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set customMOVMetadata after preparing.  No-op."));

}

- (void)setBufferCacheMode:(int)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_bufferCacheMode = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set bufferCacheMode after preparing.  No-op."));
}

- (void)setMovieFragmentInterval:(id *)a3
{
  __int128 v5;

  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_movieFragmentInterval.epoch = a3->var3;
    *(_OWORD *)&self->_movieFragmentInterval.value = v5;
  }
  else
  {
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set movieFragmentInterval after preparing.  No-op."));
  }
}

- (void)setPreserveSessionStartTime:(BOOL)a3
{
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
    self->_preserveSessionStartTime = a3;
  else
    -[MIOWriter reportWarning:](self, "reportWarning:", CFSTR("Cannot set preserveSessionStartTime after preparing.  No-op."));
}

- (BOOL)canWrite
{
  return -[MIOWriter checkStatus:](self, "checkStatus:", 1919247481)
      || -[MIOWriter checkStatus:](self, "checkStatus:", 1718186856);
}

- (void)setFailHandler:(id)a3
{
  void *v4;
  id failHandler;

  v4 = (void *)MEMORY[0x212BC9CCC](a3, a2);
  failHandler = self->_failHandler;
  self->_failHandler = v4;

}

- (void)setWarningHandler:(id)a3
{
  void *v4;
  id warningHandler;

  v4 = (void *)MEMORY[0x212BC9CCC](a3, a2);
  warningHandler = self->_warningHandler;
  self->_warningHandler = v4;

}

- (id)getFailHandler
{
  return (id)MEMORY[0x212BC9CCC](self->_failHandler, a2);
}

- (id)getWarningHandler
{
  return (id)MEMORY[0x212BC9CCC](self->_warningHandler, a2);
}

- (void)reportError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[MIOWriter fail](self, "fail");
  objc_initWeak(&location, self);
  -[MIOWriter defaultNotificationQueue](self, "defaultNotificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__MIOWriter_reportError___block_invoke;
  block[3] = &unk_24CA44F08;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__MIOWriter_reportError___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void (**v5)(id, id, _QWORD);

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getFailHandler");
  v5 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 = objc_loadWeakRetained(v2);
    v5[2](v5, v4, *(_QWORD *)(a1 + 32));

  }
}

- (void)reportWarning:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_ERROR, "WARNING: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[MIOWriter defaultNotificationQueue](self, "defaultNotificationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __27__MIOWriter_reportWarning___block_invoke;
  v8[3] = &unk_24CA44F08;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __27__MIOWriter_reportWarning___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void (**v5)(id, id, _QWORD);

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getWarningHandler");
  v5 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 = objc_loadWeakRetained(v2);
    v5[2](v5, v4, *(_QWORD *)(a1 + 32));

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, -[MIOWriter baseMediaTimeScale](self, "baseMediaTimeScale"));
}

- (BOOL)addInput:(id)a3
{
  return -[MIOWriter addInput:error:](self, "addInput:error:", a3, 0);
}

- (BOOL)addInput:(id)a3 error:(id *)a4
{
  id v6;
  MIOOrderedKeysMutableMap *inputs;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  MIOOrderedKeysMutableMap *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, CFSTR("MIOWriter status not MIOWriterInit, cannot add input."), 13);
    goto LABEL_26;
  }
  inputs = self->_inputs;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOOrderedKeysMutableMap objectForKey:](inputs, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "streamId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Stream '%@' with same media type already exists."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, v12, 13);
LABEL_26:
    v25 = 0;
    goto LABEL_27;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "underlyingInputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        if (!-[MIOWriter addInput:error:](self, "addInput:error:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), a4))
        {
LABEL_25:

          goto LABEL_26;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[MIOWriter writerInputs](self, "writerInputs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v22, "streamId");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "streamId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("Input of type 'MIOWriterTimeRangeMetadataStreamInput' ('%@') was already added. Cannot add input '%@'."), v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a4, v29, 13);
            goto LABEL_25;
          }
        }
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v19)
          continue;
        break;
      }
    }

  }
  v23 = self->_inputs;
  objc_msgSend(v6, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOOrderedKeysMutableMap setObject:forKey:](v23, "setObject:forKey:", v6, v24);

  v25 = 1;
LABEL_27:

  return v25;
}

- (void)prepareWriterWithCompletionHandler:(id)a3
{
  id v4;
  MIOWriter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *writingThreads;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1768843636))
  {
    v22 = v4;
    -[MIOWriter setStatus:](self, "setStatus:", 2);
    v23 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = self;
    -[MIOWriter writerInputs](self, "writerInputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "threadingOption") != 1)
          {
            if (objc_msgSend(v12, "useOwnWritingThread"))
            {
              v13 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v12, "streamId");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", CFSTR("mio.writing.%@.%ld"), v14, objc_msgSend(v12, "mediaType"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = -[MIOWriter newWritingThreadWithName:](v5, "newWritingThreadWithName:", v15);
              objc_msgSend(v23, "addObject:", v16);

            }
            else
            {
              if (!v9)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mio.writing.default"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = -[MIOWriter newWritingThreadWithName:](v5, "newWritingThreadWithName:", v17);
                objc_msgSend(v23, "addObject:", v9);

              }
              v16 = v9;
              v9 = v16;
            }
            objc_msgSend(v12, "setAssignedWritingThread:", v16);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v19 = objc_msgSend(v23, "copy");
    writingThreads = v5->_writingThreads;
    v5->_writingThreads = (NSArray *)v19;

    v21 = dispatch_queue_create("mio.writer.prepare", 0);
    objc_initWeak(&location, v5);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__MIOWriter_prepareWriterWithCompletionHandler___block_invoke;
    block[3] = &unk_24CA44F30;
    objc_copyWeak(&v26, &location);
    v4 = v22;
    block[4] = v5;
    v25 = v22;
    dispatch_async(v21, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Writer not in MIOWriterInit state."), 17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOWriter setStatus:](self, "setStatus:", 1717660012);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v18);

  }
}

void __48__MIOWriter_prepareWriterWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id obj;
  id v59;
  void *v60;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  char v77;
  id v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(WeakRetained, "filePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v60, 0);

    v59 = (id)*MEMORY[0x24BDB1C40];
    objc_msgSend(v60, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("mp4"));

    if (v8)
    {
      v9 = (id)*MEMORY[0x24BDB1C30];

      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_INFO, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: Selected output file type is 'mp4'. Be aware that this can and will cause data loss. If you can please use QuickTime Movie('.mov'). ⚠️⚠️⚠️", buf, 2u);
      }

      v59 = v9;
    }
    v78 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2400]), "initWithURL:fileType:error:", v60, v59, &v78);
    v12 = v78;
    objc_msgSend(v2, "setAvWriter:", v11);

    if (v12)
    {
      objc_msgSend(v2, "setStatus:", 1717660012);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "inProcessRecording"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_INFO, "AVAssetWriter set requiresInProcessOperation = YES", buf, 2u);
        }

        objc_msgSend(v2, "avWriter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("requiresInProcessOperation"));

        objc_msgSend(v2, "avWriter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKey:", CFSTR("requiresInProcessOperation"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = objc_msgSend(v16, "intValue");
          *(_DWORD *)buf = 67109120;
          v82 = v18;
          _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_INFO, "Check AVAssetWriter.requiresInProcessOperation is %d", buf, 8u);
        }

      }
      objc_msgSend(v2, "movieFragmentInterval");
      if ((v77 & 1) != 0)
      {
        objc_msgSend(v2, "movieFragmentInterval");
        objc_msgSend(v2, "avWriter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v75;
        v74 = v76;
        objc_msgSend(v19, "setMovieFragmentInterval:", &v73);

      }
      v20 = objc_msgSend(v2, "shouldOptimizeForNetworkUse");
      objc_msgSend(v2, "avWriter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShouldOptimizeForNetworkUse:", v20);

      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v2, "inputs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allOrderedKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v70;
        while (2)
        {
          v26 = 0;
          v27 = v12;
          do
          {
            if (*(_QWORD *)v70 != v25)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v26);
            objc_msgSend(v2, "inputs");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = *(_QWORD *)(a1 + 32);
            v68 = v27;
            LODWORD(v29) = objc_msgSend(v30, "prepareInputWithWriter:error:", v31, &v68);
            v12 = v68;

            if (!(_DWORD)v29)
            {
              objc_msgSend(v2, "setStatus:", 1717660012);
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

              goto LABEL_46;
            }

            ++v26;
            v27 = v12;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
          if (v24)
            continue;
          break;
        }
      }

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v2, "inputs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allOrderedKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v65;
        while (2)
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v65 != v34)
              objc_enumerationMutation(obj);
            v36 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v2, "inputs", obj);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKey:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v38;
              v63 = v12;
              v40 = objc_msgSend(v39, "establishAssociationsWithError:", &v63);
              v41 = v63;

              if (!v40)
              {
                objc_msgSend(v2, "setStatus:", 1717660012);
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                v12 = v41;
                goto LABEL_46;
              }

              v12 = v41;
            }

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
          if (v33)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x24BDB2588], "mioMovieMetadataItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "customMOVMetadata");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count") == 0;

      if (!v45)
      {
        objc_msgSend(v2, "customMOVMetadata");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObjectsFromArray:", v46);

      }
      objc_msgSend(v2, "timeRangeMetadataKeyHint", obj);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v48 = (void *)MEMORY[0x24BDB2588];
        objc_msgSend(v2, "timeRangeMetadataKeyHint");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v12;
        objc_msgSend(v48, "movMetadataItemWithTimeRangeMetadataKeyHint:error:", v49, &v62);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v62;

        if (v50)
          objc_msgSend(v43, "addObject:", v50);

        v12 = v51;
      }
      v52 = objc_msgSend(v43, "copy");
      objc_msgSend(v2, "avWriter");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setMetadata:", v52);

      objc_msgSend(v2, "avWriter");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v52) = objc_msgSend(v54, "startWriting");

      if ((v52 & 1) != 0)
      {
        objc_msgSend(v2, "setStatus:", 1919247481);
        objc_msgSend(*(id *)(a1 + 32), "startWriting");
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        objc_msgSend(v2, "setStatus:", 1717660012);
        v55 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "avWriter");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "error");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v55 + 16))(v55, 0, v57);

      }
    }
LABEL_46:

  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  double finishStepDefaultTimeout;
  __int128 v4;
  uint64_t v5;

  finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
  v4 = *MEMORY[0x24BDC0D38];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
  -[MIOWriter finishWithTimeout:endTime:completionHandler:](self, "finishWithTimeout:endTime:completionHandler:", &v4, a3, finishStepDefaultTimeout);
}

- (void)finishWithEndTime:(id *)a3 completionHandler:(id)a4
{
  double finishStepDefaultTimeout;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
  v5 = *a3;
  -[MIOWriter finishWithTimeout:endTime:completionHandler:](self, "finishWithTimeout:endTime:completionHandler:", &v5, a4, finishStepDefaultTimeout);
}

- (void)finishWithTimeout:(double)a3 completionHandler:(id)a4
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x24BDC0D38];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
  -[MIOWriter finishWithTimeout:endTime:completionHandler:](self, "finishWithTimeout:endTime:completionHandler:", &v4, a4, a3);
}

- (void)finishWithTimeout:(double)a3 endTime:(id *)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13[2];
  __int128 v14;
  int64_t var3;
  id location;

  v8 = a5;
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1919247481))
  {
    -[MIOWriter setStatus:](self, "setStatus:", 1718186856);
    objc_initWeak(&location, self);
    v9 = dispatch_queue_create("mio.writer.finish", 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke;
    v11[3] = &unk_24CA44F80;
    objc_copyWeak(v13, &location);
    v13[1] = *(id *)&a3;
    v14 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v11[4] = self;
    v12 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Writer not in MIOWriterReady state."), 17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

void __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  dispatch_time_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *context;
  void *v25;
  _QWORD *WeakRetained;
  _QWORD v28[4];
  _QWORD *v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v25 = (void *)MEMORY[0x212BC9B10]();
    NSLog(CFSTR("FINISH_0: processing queues"));
    v1 = dispatch_group_create();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(WeakRetained, "inputs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v40 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "finishProcessingInDispatchGroup:", v1);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v4);
    }

    v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    if (dispatch_group_wait(v1, v7))
      NSLog(CFSTR("Could not drain the processing queues within timeout"));
    NSLog(CFSTR("FINISH_1: fifos"));
    objc_msgSend(WeakRetained, "setDrainWritingThreads:", 1);
    objc_msgSend(WeakRetained, "signalWritingThreadsProceed");
    v8 = WeakRetained[10];
    v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    if (dispatch_group_wait(v8, v9))
    {
      NSLog(CFSTR("Could not drain the fifo buffers within timeout"));
      objc_msgSend(WeakRetained, "setForceFinishWritingThreads:", 1);
      objc_msgSend(WeakRetained, "signalWritingThreadsProceed");
    }
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      objc_msgSend(WeakRetained, "avWriter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_OWORD *)(a1 + 64);
      v38 = *(_QWORD *)(a1 + 80);
      objc_msgSend(v10, "endSessionAtSourceTime:", &v37);

    }
    NSLog(CFSTR("FINISH_2: shut down inputs queue"));
    context = (void *)MEMORY[0x212BC9B10]();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(WeakRetained, "inputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v32 = v14;
          v18 = objc_msgSend(v17, "shutDownOutError:", &v32);
          v19 = v32;

          v14 = v19;
          if ((v18 & 1) == 0)
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "streamId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v44 = v21;
              v45 = 2114;
              v46 = v19;
              _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_ERROR, "Error on shutdown %{public}@ : %{public}@", buf, 0x16u);

            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      }
      while (v13);

      objc_autoreleasePoolPop(context);
      if (v19)
      {
        objc_msgSend(WeakRetained, "setStatus:", 1717660012);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_30:

        objc_autoreleasePoolPop(v25);
        goto LABEL_31;
      }
    }
    else
    {

      objc_autoreleasePoolPop(context);
    }
    NSLog(CFSTR("FINISH_3: AVAssetWriter"));
    objc_msgSend(WeakRetained, "avWriter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke_81;
    v28[3] = &unk_24CA44F58;
    v29 = WeakRetained;
    v23 = *(id *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 32);
    v31 = v23;
    objc_msgSend(v22, "finishWritingWithCompletionHandler:", v28);

    v14 = v29;
    goto LABEL_30;
  }
LABEL_31:

}

void __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke_81(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[3];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "avWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  if (v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1717660012);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "avWriter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "preserveSessionStartTime"))
    {
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        objc_msgSend(v6, "sessionStartTime");
        v6 = *(void **)(a1 + 32);
      }
      else
      {
        memset(v14, 0, sizeof(v14));
      }
      objc_msgSend(v6, "avWriter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "outputURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v9 = +[MOVStreamIOUtility saveSessionStartTime:toMovieAtURL:error:](MOVStreamIOUtility, "saveSessionStartTime:toMovieAtURL:error:", v14, v8, &v13);
      v10 = v13;

      if (!v9)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v10;
          _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "Error on saving session start time: %{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1685024357);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)cancelRecordingWithCompletionHandler:(id)a3
{
  id v4;
  double finishStepDefaultTimeout;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v4 = a3;
  if (-[MIOWriter checkStatus:](self, "checkStatus:", 1919247481))
  {
    -[MIOWriter setStatus:](self, "setStatus:", 1718186856);
    finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
    objc_initWeak(&location, self);
    v6 = dispatch_queue_create("mio.writer.cancel", 0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__MIOWriter_cancelRecordingWithCompletionHandler___block_invoke;
    v7[3] = &unk_24CA44FA8;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)&finishStepDefaultTimeout;
    v8 = v4;
    dispatch_async(v6, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

void __50__MIOWriter_cancelRecordingWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x212BC9B10]();
    NSLog(CFSTR("CANCEL_0: processing queues"));
    v4 = dispatch_group_create();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(WeakRetained, "inputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10++), "finishProcessingInDispatchGroup:", v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    if (dispatch_group_wait(v4, v11))
      NSLog(CFSTR("Could not drain the processing queues within timeout"));
    NSLog(CFSTR("CANCEL_1: invalidate the input and empty the fifos"));
    v12 = (void *)MEMORY[0x212BC9B10]();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(WeakRetained, "inputs", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18++), "invalidate");
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

    objc_autoreleasePoolPop(v12);
    objc_msgSend(WeakRetained, "setForceFinishWritingThreads:", 1);
    objc_msgSend(WeakRetained, "signalWritingThreadsProceed");
    v19 = WeakRetained[10];
    v20 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    if (dispatch_group_wait(v19, v20))
      NSLog(CFSTR("Could not close writing threads within timeout"));
    NSLog(CFSTR("CANCEL_2: AVAssetWriter"));
    objc_msgSend(WeakRetained, "avWriter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cancelWriting");

    objc_msgSend(WeakRetained, "setStatus:", 1668178796);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    objc_autoreleasePoolPop(v3);
  }

}

- (void)proposeSessionStartTime:(id *)a3
{
  __int128 v3;

  if ((self->_sessionStartTime.timescale & 1) == 0)
  {
    v3 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&self->_sessionStartTime.flags = a3->var3;
    *(_OWORD *)(&self->_sessionStarted + 4) = v3;
  }
}

- (BOOL)startSession
{
  MIOWriter *v2;
  AVAssetWriter *avWriter;
  BOOL v4;
  void *v6;
  _BYTE v7[48];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sessionStarted)
  {
    -[MIOWriter sessionStartTime](v2, "sessionStartTime");
    if ((v7[36] & 0x1D) != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "writerErrorWithMessage:code:", CFSTR("Writer invalid sessionStartTime, startSession failed."), 16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOWriter reportError:](v2, "reportError:", v6);

      v4 = 0;
      goto LABEL_5;
    }
    v2->_sessionStarted = 1;
    avWriter = v2->_avWriter;
    -[MIOWriter sessionStartTime](v2, "sessionStartTime");
    -[AVAssetWriter startSessionAtSourceTime:](avWriter, "startSessionAtSourceTime:", v7);
  }
  v4 = 1;
LABEL_5:
  objc_sync_exit(v2);

  return v4;
}

- (void)fail
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
  -[MIOWriter setStatus:](self, "setStatus:", 1717660012);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MIOOrderedKeysMutableMap allValues](self->_inputs, "allValues", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)signalWritingThreadsProceed
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_writingThreads;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "proceed", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)newWritingThreadWithName:(id)a3
{
  id v4;
  MIOThread *v5;
  MIOThread *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [MIOThread alloc];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __38__MIOWriter_newWritingThreadWithName___block_invoke;
  v11 = &unk_24CA44B38;
  objc_copyWeak(&v12, &location);
  v6 = -[MIOThread initWithName:block:](v5, "initWithName:block:", v4, &v8);
  -[MIOThread setQualityOfService:](v6, "setQualityOfService:", 33, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __38__MIOWriter_newWritingThreadWithName___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  unint64_t v37;
  NSObject *v38;
  os_signpost_id_t v39;
  dispatch_group_t *v40;
  NSObject *v41;
  void *context;
  NSObject *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "perfLogHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v3);
  v38 = v3;
  v39 = os_signpost_id_generate(v3);
  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_enter(WeakRetained[10]);
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "setThreadPriority:", 1.0) & 1) == 0)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_ERROR, "Cannot set writing thread priority to 1.0. Continue with default priority...", buf, 2u);
      }

    }
    if (-[dispatch_group_t canWrite](v5, "canWrite", spid))
    {
      v7 = spida - 1;
      v8 = v39 - 1;
      v40 = v5;
      v37 = spida - 1;
      while (1)
      {
        v9 = v38;
        v10 = v9;
        if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spida, "mio.write.thread", (const char *)&unk_2106EBECF, buf, 2u);
        }

        v41 = v10;
        do
        {
          v11 = v10;
          v12 = v11;
          if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v39, "mio.write.fifo.samples", (const char *)&unk_2106EBECF, buf, 2u);
          }
          v43 = v12;

          context = (void *)MEMORY[0x212BC9B10]();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          -[dispatch_group_t inputs](v5, "inputs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allValues");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v15)
          {
            v16 = v15;
            v44 = 0;
            v17 = *(_QWORD *)v46;
            v18 = 1;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v46 != v17)
                  objc_enumerationMutation(v14);
                v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v20, "assignedWritingThread");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21 == v2)
                {
                  v22 = v2;
                  v23 = (void *)MEMORY[0x212BC9B10]();
                  objc_msgSend(v20, "fifoBuffer");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "usage");

                  if (v25)
                  {
                    if (objc_msgSend(v20, "writeNextItemFromFifo"))
                      v26 = 1;
                    else
                      v26 = v44;
                    v44 = v26;
                    if (v18)
                    {
                      objc_msgSend(v20, "fifoBuffer");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v18 = objc_msgSend(v27, "usage") == 0;

                    }
                    else
                    {
                      v18 = 0;
                    }
                  }
                  v2 = v22;
                  objc_autoreleasePoolPop(v23);
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            }
            while (v16);
          }
          else
          {
            LOBYTE(v44) = 0;
            v18 = 1;
          }

          objc_autoreleasePoolPop(context);
          v28 = v43;
          v29 = v28;
          v8 = v39 - 1;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210675000, v29, OS_SIGNPOST_INTERVAL_END, v39, "mio.write.fifo.samples", (const char *)&unk_2106EBECF, buf, 2u);
          }

          v5 = v40;
          v10 = v41;
        }
        while ((v44 & 1) != 0);
        if (-[dispatch_group_t drainWritingThreads](v40, "drainWritingThreads") && v18)
          break;
        if (-[dispatch_group_t forceFinishWritingThreads](v40, "forceFinishWritingThreads"))
        {
          v34 = v29;
          if (v37 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v33 = v34;
            if (os_signpost_enabled(v34))
            {
              *(_WORD *)buf = 0;
              goto LABEL_51;
            }
          }
          goto LABEL_52;
        }
        objc_msgSend(v2, "waitWithTimeout:", 30.0);
        v30 = v29;
        v31 = v30;
        v7 = spida - 1;
        if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_210675000, v31, OS_SIGNPOST_INTERVAL_END, spida, "mio.write.thread", (const char *)&unk_2106EBECF, buf, 2u);
        }

        if ((-[dispatch_group_t canWrite](v40, "canWrite") & 1) == 0)
          goto LABEL_53;
      }
      v32 = v29;
      if (v37 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v33 = v32;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
LABEL_51:
          _os_signpost_emit_with_name_impl(&dword_210675000, v33, OS_SIGNPOST_INTERVAL_END, spida, "mio.write.thread", (const char *)&unk_2106EBECF, buf, 2u);
        }
      }
LABEL_52:

    }
LABEL_53:
    dispatch_group_leave(v5[10]);
  }

}

- (BOOL)startWriting
{
  BOOL v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[MIOWriter canWrite](self, "canWrite");
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_writingThreads;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "start", (_QWORD)v10);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v6);
    }
  }
  else
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210675000, &v4->super, OS_LOG_TYPE_INFO, "startWriting canceled because writer is not in state that allows writing.", buf, 2u);
    }
  }

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MIOWriter {\n Filepath: %@ \n}"), self->_filePath);
}

- (void)simulateFailure
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("SIMULATED ERROR FOR TESTING"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MIOWriter reportError:](self, "reportError:", v3);

}

- (int)baseMediaTimeScale
{
  return self->_baseMediaTimeScale;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->var3 = *(_QWORD *)&self[1].var2;
  return self;
}

- (BOOL)realTime
{
  return self->_realTime;
}

- (BOOL)inProcessRecording
{
  return self->_inProcessRecording;
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return self->_shouldOptimizeForNetworkUse;
}

- (BOOL)preferCustomCompression
{
  return self->_preferCustomCompression;
}

- (BOOL)enableAVEHighPerformanceProfile
{
  return self->_enableAVEHighPerformanceProfile;
}

- (double)defaultFrameRate
{
  return self->_defaultFrameRate;
}

- (NSArray)customMOVMetadata
{
  return self->_customMOVMetadata;
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (NSString)timeRangeMetadataKeyHint
{
  return self->_timeRangeMetadataKeyHint;
}

- (void)setTimeRangeMetadataKeyHint:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (BOOL)preserveSessionStartTime
{
  return self->_preserveSessionStartTime;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_queue)defaultNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDefaultNotificationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (AVAssetWriter)avWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BOOL)drainWritingThreads
{
  return self->_drainWritingThreads;
}

- (void)setDrainWritingThreads:(BOOL)a3
{
  self->_drainWritingThreads = a3;
}

- (BOOL)forceFinishWritingThreads
{
  return self->_forceFinishWritingThreads;
}

- (void)setForceFinishWritingThreads:(BOOL)a3
{
  self->_forceFinishWritingThreads = a3;
}

- (MIOOrderedKeysMutableMap)inputs
{
  return (MIOOrderedKeysMutableMap *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_defaultNotificationQueue, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, 0);
  objc_storeStrong((id *)&self->_customMOVMetadata, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_movieMetadataUtility, 0);
  objc_storeStrong((id *)&self->_writingThreadsGroup, 0);
  objc_storeStrong((id *)&self->_writingThreads, 0);
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_failHandler, 0);
  objc_storeStrong((id *)&self->_avWriter, 0);
}

@end
