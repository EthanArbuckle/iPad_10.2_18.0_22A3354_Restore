@implementation MFComposeActivityHandoffOperation

+ (id)receivingOperationWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputStream:outputStream:", v6, v7);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setTransmissionType:", 1);

  return v9;
}

+ (id)sendingOperationWithDraftData:(id)a3 inputStream:(id)a4 outputStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputStream:outputStream:", v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setTransmissionType:", 2);
    objc_msgSend(v12, "setDraftData:", v8);
  }

  return v12;
}

- (MFComposeActivityHandoffOperation)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v7;
  id v8;
  MFComposeActivityHandoffOperation *v9;
  MFComposeActivityHandoffOperation *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *streamHandlerQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFComposeActivityHandoffOperation;
  v9 = -[MFComposeActivityHandoffOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_draftDataByteIndex = 0;
    objc_storeStrong((id *)&v9->_inputStream, a3);
    objc_storeStrong((id *)&v10->_outputStream, a4);
    v10->_transmissionType = 0;
    v11 = dispatch_queue_create("Activity Handoff Stream Handler", 0);
    streamHandlerQueue = v10->_streamHandlerQueue;
    v10->_streamHandlerQueue = (OS_dispatch_queue *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSInputStream close](self->_inputStream, "close");
  -[NSOutputStream close](self->_outputStream, "close");
  v3.receiver = self;
  v3.super_class = (Class)MFComposeActivityHandoffOperation;
  -[MFComposeActivityHandoffOperation dealloc](&v3, sel_dealloc);
}

- (void)start
{
  -[MFComposeActivityHandoffOperation _setExecuting:](self, "_setExecuting:", 1);
  if ((-[MFComposeActivityHandoffOperation isCancelled](self, "isCancelled") & 1) != 0)
    -[MFComposeActivityHandoffOperation _complete](self, "_complete");
  else
    -[MFComposeActivityHandoffOperation _startHandoffStreams](self, "_startHandoffStreams");
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)_setExecuting:(BOOL)a3
{
  -[MFComposeActivityHandoffOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = a3;
  -[MFComposeActivityHandoffOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (BOOL)isExecuting
{
  return !self->_finished;
}

- (void)_setFinished:(BOOL)a3
{
  -[MFComposeActivityHandoffOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = a3;
  -[MFComposeActivityHandoffOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)_complete
{
  -[MFComposeActivityHandoffOperation _setExecuting:](self, "_setExecuting:", 0);
  -[MFComposeActivityHandoffOperation _setFinished:](self, "_setFinished:", 1);
}

- (void)_startHandoffStreams
{
  __assert_rtn("-[MFComposeActivityHandoffOperation _startHandoffStreams]", "MFActivityHandoffOperation.m", 152, "_inputStream && _outputStream");
}

- (void)_handleErrorCode:(unint64_t)a3 logString:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v15 = &v18;
    v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, &v18);
  }
  else
  {
    v7 = CFSTR("Unknown Error");
  }
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MFComposeActivityHandoffOperation _handleErrorCode:logString:].cold.1((uint64_t)v7, a3, v8);

  if (a3 >= 0x64)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MFActivityHandoffOperationError"), a3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__MFComposeActivityHandoffOperation__handleErrorCode_logString___block_invoke;
    v13[3] = &unk_1E5A65430;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

void __64__MFComposeActivityHandoffOperation__handleErrorCode_logString___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityHandoffOperation:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *streamHandlerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  streamHandlerQueue = self->_streamHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MFComposeActivityHandoffOperation_stream_handleEvent___block_invoke;
  block[3] = &unk_1E5A65458;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(streamHandlerQueue, block);

}

_QWORD *__56__MFComposeActivityHandoffOperation_stream_handleEvent___block_invoke(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = (_QWORD *)a1[4];
  v3 = result[39];
  if (v3 == 2)
  {
    v5 = a1[5];
    if (result[34] == v5)
    {
      return (_QWORD *)objc_msgSend(result, "_sendingDataStream:handleEvent:", result[34], a1[6]);
    }
    else if (result[33] == v5)
    {
      return (_QWORD *)objc_msgSend(result, "_sendingMessageStream:handleEvent:");
    }
  }
  else if (v3 == 1)
  {
    v4 = a1[5];
    if (result[33] == v4)
    {
      return (_QWORD *)objc_msgSend(result, "_receivingDataStream:handleEvent:", result[33], a1[6]);
    }
    else if (result[34] == v4)
    {
      return (_QWORD *)objc_msgSend(result, "_receivingMessageStream:handleEvent:");
    }
  }
  return result;
}

- (void)_didFinishTransferringHandoffPayload
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_INFO, "#Hand-Off Got success receipt from receiving end.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MFComposeActivityHandoffOperation__didFinishTransferringHandoffPayload__block_invoke;
  block[3] = &unk_1E5A65480;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __73__MFComposeActivityHandoffOperation__didFinishTransferringHandoffPayload__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityHandoffOperation:didFinishSendingDataWithResult:", *(_QWORD *)(a1 + 32), 1);

}

- (void)_failedToTransferHandoffPayload
{
  _QWORD block[5];

  -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 2, CFSTR("Receiving end sent failure receipt."));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MFComposeActivityHandoffOperation__failedToTransferHandoffPayload__block_invoke;
  block[3] = &unk_1E5A65480;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__MFComposeActivityHandoffOperation__failedToTransferHandoffPayload__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityHandoffOperation:didFinishSendingDataWithResult:", *(_QWORD *)(a1 + 32), 2);

}

- (void)_receivingMessageStream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (a4 == 8)
  {
    v8 = v6;
    objc_msgSend(v6, "streamError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 3, CFSTR("Receiving Message Channel had error: %@"), v7);

    v6 = v8;
  }

}

- (void)_sendingMessageStream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 8uLL:
      objc_msgSend(v6, "streamError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 3, CFSTR("Sending Message Channel had error: %@"), v9);

      break;
    case 2uLL:
      v11 = 0;
      -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", &v11, 4);
      v10 = bswap32(v11);
      v11 = v10;
      if ((_DWORD)v10 == 2)
      {
        -[MFComposeActivityHandoffOperation _failedToTransferHandoffPayload](self, "_failedToTransferHandoffPayload");
      }
      else if ((_DWORD)v10 == 1)
      {
        -[MFComposeActivityHandoffOperation _didFinishTransferringHandoffPayload](self, "_didFinishTransferringHandoffPayload");
      }
      else
      {
        -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 4, CFSTR("Unrecognized message sent to message channel: %d"), v10);
      }
      -[MFComposeActivityHandoffOperation _checkInHandoffStream:](self, "_checkInHandoffStream:", self->_inputStream);
      break;
    case 1uLL:
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MFComposeActivityHandoffOperation _sendingMessageStream:handleEvent:].cold.1();

      break;
  }

}

- (void)_receivingDataStream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  NSObject *v21;
  _QWORD block[5];
  _BYTE v23[24];
  int __b[8192];
  uint64_t v25;

  v4 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v6 = v5;
  v7 = v4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = v8;
  if (v6 <= 7)
  {
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        if (*(_QWORD *)(v7 + 280))
        {
          memset(__b, 170, sizeof(__b));
          v10 = objc_msgSend(*(id *)(v7 + 264), "read:maxLength:", __b, 0x8000);
          if (v10)
          {
            v11 = *(id *)(v7 + 280);
            objc_msgSend(v11, "appendBytes:length:", __b, v10);
            *(_QWORD *)(v7 + 296) += v10;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __70__MFComposeActivityHandoffOperation__receivingDataStream_handleEvent___block_invoke;
            block[3] = &unk_1E5A65480;
            block[4] = v7;
            dispatch_async(MEMORY[0x1E0C80D38], block);
            if ((unint64_t)objc_msgSend(v11, "length") >= *(_QWORD *)(v7 + 304))
            {
              MFLogGeneral();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.4((uint64_t)v23, objc_msgSend(v11, "length"), v12);

              objc_msgSend((id)v7, "_finishReceivingHandoffDataAndCloseStream");
            }
            goto LABEL_25;
          }
          objc_msgSend(*(id *)(v7 + 264), "streamError");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (!v20)
          {
            objc_msgSend(*(id *)(v7 + 264), "streamError");
            v11 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v7, "_handleErrorCode:logString:", 102, CFSTR("Failed to read bytes from input stream! %@"), v11);
LABEL_25:

            goto LABEL_30;
          }
          MFLogGeneral();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.3((uint64_t)v23, objc_msgSend(*(id *)(v7 + 280), "length"), v21);

          objc_msgSend((id)v7, "_finishReceivingHandoffDataAndCloseStream");
        }
        else
        {
          __b[0] = 0;
          objc_msgSend(*(id *)(v7 + 264), "read:maxLength:", __b, 4);
          v15 = __b[0];
          __b[0] = bswap32(__b[0]);
          if (v15)
          {
            MFLogGeneral();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.2(__b, v16);

            v17 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
            v18 = *(void **)(v7 + 280);
            *(_QWORD *)(v7 + 280) = v17;

            *(_QWORD *)(v7 + 296) = 0;
            *(_QWORD *)(v7 + 304) = __b[0];
          }
          else
          {
            objc_msgSend((id)v7, "_handleErrorCode:logString:", 101, CFSTR("Failed to get expected size from sending end"));
          }
        }
      }
      goto LABEL_30;
    }
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.1();
LABEL_14:

    goto LABEL_30;
  }
  if (v6 == 8)
  {
    objc_msgSend(*(id *)(v7 + 264), "streamError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "_handleErrorCode:logString:", 102, CFSTR("Data receiving stream had an error: %@"), v14);

    goto LABEL_30;
  }
  if (v6 == 16)
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.5();
    goto LABEL_14;
  }
LABEL_30:

}

void __70__MFComposeActivityHandoffOperation__receivingDataStream_handleEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityHandoffOperationReceivedBytes:", *(_QWORD *)(a1 + 32));

}

- (void)_sendingDataStream:(id)a3 handleEvent:(unint64_t)a4
{
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_draftDataByteIndex;
  unint64_t draftDataByteIndex;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NSData length](self->_draftData, "length", a3))
  {
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        -[NSOutputStream streamError](self->_outputStream, "streamError");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 104, CFSTR("Output stream had an error: %@"), v21);

      }
      else if (a4 == 16)
      {
        -[MFComposeActivityHandoffOperation _checkInHandoffStream:](self, "_checkInHandoffStream:", self->_outputStream);
      }
    }
    else if (a4 == 1)
    {
      MFLogGeneral();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:].cold.1();

    }
    else if (a4 == 4)
    {
      v6 = -[NSData length](self->_draftData, "length");
      v10 = v6;
      p_draftDataByteIndex = &self->_draftDataByteIndex;
      draftDataByteIndex = self->_draftDataByteIndex;
      if (!draftDataByteIndex)
      {
        v22 = bswap32(v6);
        -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", &v22, 4);
        MFLogGeneral();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:].cold.3(v10, v13, v14);

        draftDataByteIndex = *p_draftDataByteIndex;
      }
      v15 = v10 - draftDataByteIndex;
      if (v15 >= 0x8000)
        v16 = 0x8000;
      else
        v16 = v15;
      if (v16)
      {
        MEMORY[0x1E0C80A78](v6, v7, v8, v9);
        memset((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v16);
        -[NSData getBytes:range:](self->_draftData, "getBytes:range:", (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), *p_draftDataByteIndex, v16);
        *p_draftDataByteIndex += -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
      }
      else
      {
        MFLogGeneral();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:].cold.2((uint64_t *)&self->_draftDataByteIndex, v18, v19);

        -[MFComposeActivityHandoffOperation _checkInHandoffStream:](self, "_checkInHandoffStream:", self->_outputStream);
      }
    }
  }
  else
  {
    -[MFComposeActivityHandoffOperation _handleErrorCode:logString:](self, "_handleErrorCode:logString:", 103, CFSTR("Could not handle sending stream event. Draft data length was zero."));
  }
}

- (void)_finishReceivingHandoffDataAndCloseStream
{
  NSInputStream *inputStream;
  int v5;
  void *v6;
  _QWORD v7[5];
  int v8;

  if (pthread_main_np())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFActivityHandoffOperation.m"), 395, CFSTR("Current thread is main"));

  }
  inputStream = self->_inputStream;
  if (inputStream && -[NSInputStream streamStatus](inputStream, "streamStatus") != 6)
  {
    -[MFComposeActivityHandoffOperation _checkInHandoffStream:](self, "_checkInHandoffStream:", self->_inputStream);
    if (-[NSData length](self->_draftData, "length"))
      v5 = 0x1000000;
    else
      v5 = 0x2000000;
    v8 = v5;
    -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", &v8, 4);
    -[MFComposeActivityHandoffOperation _checkInHandoffStream:](self, "_checkInHandoffStream:", self->_outputStream);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__MFComposeActivityHandoffOperation__finishReceivingHandoffDataAndCloseStream__block_invoke;
    v7[3] = &unk_1E5A65480;
    v7[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], v7);
  }
}

void __78__MFComposeActivityHandoffOperation__finishReceivingHandoffDataAndCloseStream__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityHandoffOperation:didFinishReceivingData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));

}

- (void)_commonHandoffStreamInitializationWithStream:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleInRunLoop:forMode:", v4, *MEMORY[0x1E0C99748]);

  objc_msgSend(v5, "open");
}

- (void)_checkInHandoffStream:(id)a3
{
  NSInputStream *v4;
  NSInputStream *v5;
  _QWORD *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSInputStream *inputStream;
  void *v11;
  NSInputStream *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSOutputStream *outputStream;
  void *v17;
  NSOutputStream *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = (NSInputStream *)a3;
  v5 = v4;
  if ((NSInputStream *)self->_outputStream == v4)
  {
    self->_doneWithOutputStream = 1;
  }
  else if (self->_inputStream == v4)
  {
    self->_doneWithInputStream = 1;
  }
  if (self->_doneWithInputStream && self->_doneWithOutputStream)
  {
    v6 = (_QWORD *)MEMORY[0x1E0C99748];
    if (self->_inputStream)
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

      if (v8)
      {
        MFLogGeneral();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_INFO, "#Hand-Off Closing stream: Input Stream", buf, 2u);
        }

      }
      -[NSInputStream close](self->_inputStream, "close");
      inputStream = self->_inputStream;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSInputStream removeFromRunLoop:forMode:](inputStream, "removeFromRunLoop:forMode:", v11, *v6);

      v12 = self->_inputStream;
      self->_inputStream = 0;

    }
    if (self->_outputStream)
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        MFLogGeneral();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_INFO, "#Hand-Off Closing stream: Output Stream", v19, 2u);
        }

      }
      -[NSOutputStream close](self->_outputStream, "close");
      outputStream = self->_outputStream;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOutputStream removeFromRunLoop:forMode:](outputStream, "removeFromRunLoop:forMode:", v17, *v6);

      v18 = self->_outputStream;
      self->_outputStream = 0;

    }
    -[MFComposeActivityHandoffOperation _complete](self, "_complete");
    self->_doneWithInputStream = 0;
    self->_doneWithOutputStream = 0;
  }

}

- (unint64_t)bytesReceived
{
  return self->_draftBytesReceived;
}

- (unint64_t)bytesExpected
{
  return self->_draftExpectedSize;
}

- (int64_t)transmissionType
{
  return self->_transmissionType;
}

- (void)setTransmissionType:(int64_t)a3
{
  self->_transmissionType = a3;
}

- (NSData)draftData
{
  return self->_draftData;
}

- (void)setDraftData:(id)a3
{
  objc_storeStrong((id *)&self->_draftData, a3);
}

- (MFComposeActivityHandoffOperationDelegate)delegate
{
  return (MFComposeActivityHandoffOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_draftData, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_streamHandlerQueue, 0);
}

- (void)_handleErrorCode:(os_log_t)log logString:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "#Hand-Off ** Handoff Operation Error (%lu): %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendingMessageStream:handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "#Hand-Off Sending message input stream opened.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_receivingDataStream:handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "#Hand-Off Receiving stream opened.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_receivingDataStream:(int *)a1 handleEvent:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_DEBUG, "#Hand-Off Expecting message of size: %d bytes", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)_receivingDataStream:(NSObject *)a3 handleEvent:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1(&dword_1AB96A000, a3, (uint64_t)a3, "#Hand-Off Finished reading from stream. Got %lu bytes", (uint8_t *)a1);
}

- (void)_receivingDataStream:(NSObject *)a3 handleEvent:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1(&dword_1AB96A000, a3, (uint64_t)a3, "#Hand-Off It looks like we got all the data (%lu bytes) from the input stream. Closing.", (uint8_t *)a1);
}

- (void)_receivingDataStream:handleEvent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "#Hand-Off Receiving stream end occurred.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendingDataStream:handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "#Hand-Off Sending stream opened.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendingDataStream:(uint64_t)a3 handleEvent:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1AB96A000, a2, a3, "#Hand-Off Done sending message payload. Sent %lu bytes.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)_sendingDataStream:(uint64_t)a3 handleEvent:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AB96A000, a2, a3, "#Hand-Off Sending message payload of size: %lu bytes", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

@end
