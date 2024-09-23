@implementation DTKTraceTapMemoHandlerDelegate

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *bytes_ptr;
  size_t length;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isSession"))
  {
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v5, "isRawKtraceFile");
    objc_msgSend(v5, "datastream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        sub_222BC620C();

      if (objc_msgSend(v10, "hasData"))
      {
        do
        {
          v12 = (void *)MEMORY[0x227679C5C]();
          objc_msgSend(v10, "read:error:", 0x100000, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleBulkData:", v13);

          objc_autoreleasePoolPop(v12);
        }
        while ((objc_msgSend(v10, "hasData") & 1) != 0);
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeItemAtURL:error:", v15, 0);

    }
    else
    {
      v20 = objc_msgSend(v9, "hasData");

      if (v20)
      {
        do
        {
          objc_msgSend(v5, "datastream");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "read:error:", 1024, 0);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleBulkData:", v22);

          objc_msgSend(v5, "datastream");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v23, "hasData");

        }
        while ((v22 & 1) != 0);
      }
    }
    if (objc_msgSend(v5, "isRawKtraceFile"))
      v24 = 1025;
    else
      v24 = 6;
    objc_msgSend(v7, "setKind:", v24);
    objc_msgSend(v6, "sendFrameMessage:", v7);

  }
  else
  {
    objc_msgSend(v5, "stackshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = sub_222B39BAC;
      v30 = sub_222B39BBC;
      objc_msgSend(v5, "stackshot");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)v27[5]);
      length = xpc_data_get_length((xpc_object_t)v27[5]);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = sub_222B39BC4;
      v25[3] = &unk_24EB28BF8;
      v25[4] = &v26;
      objc_msgSend(v6, "handleBulkData:size:destructor:", bytes_ptr, length, v25);
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "setKind:", 1024);
      objc_msgSend(v6, "sendFrameMessage:", v19);

      _Block_object_dispose(&v26, 8);
    }
  }

}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "datastream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSession"))
  {
    objc_msgSend(v6, "sessionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD))objc_opt_new();
      objc_msgSend(v9, "setMemo:", v5);
      if ((objc_msgSend(v5, "isRawKtraceFile") & 1) == 0)
      {
        v10 = (void *)objc_opt_new();
        if (objc_msgSend(v7, "hasData"))
        {
          do
          {
            objc_msgSend(v7, "read:error:", 1024, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v11);

          }
          while ((objc_msgSend(v7, "hasData") & 1) != 0);
        }
        objc_msgSend(v9, "setDataBlocks:", v10);

      }
      objc_msgSend(v6, "sessionHandler");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, v9);
      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      sub_222BC6234();
  }
  else
  {
    objc_msgSend(v5, "stackshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "stackshotHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v6, "stackshotHandler");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stackshot");
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[2](v9, v12);
LABEL_11:

      }
    }
  }

}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v5, "sessionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setMemo:", v9);
    objc_msgSend(v5, "sessionHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v7);

  }
}

- (id)peekAtMemo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "isSession"))
  {
    v5 = objc_msgSend(v3, "isRawKtraceFile");
    objc_msgSend(v3, "datastream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "file");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dup(objc_msgSend(v8, "fileDescriptor"));
      ktrace_file_open_fd();

      ktrace_file_earliest_timestamp();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("DTTapRecordingInfo_Timestamp"));

      ktrace_file_close();
    }
    else if (v6)
    {
      v12 = kpdecode_cursor_create();
      if (objc_msgSend(v7, "hasData"))
      {
        objc_msgSend(v7, "peek:error:", 1024, 0);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "bytes");
        objc_msgSend(v13, "length");
        if (kpdecode_cursor_setchunk())
        {
          v14 = -1;
        }
        else
        {
          while (!kpdecode_cursor_next_record())
          {
            if ((MEMORY[0] & 0x8001) == 1)
            {
              v14 = MEMORY[8];
              kpdecode_record_free();
              if (v14)
                goto LABEL_18;
            }
            else
            {
              kpdecode_record_free();
            }
          }
          v14 = -1;
LABEL_18:
          kpdecode_cursor_clearchunk();
        }
        MEMORY[0x2276795B4](v12);

      }
      else
      {
        v14 = -1;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("DTTapRecordingInfo_Timestamp"));

    }
    v11 = v4;
  }
  else
  {
    objc_msgSend(v3, "stackshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      sub_222BC6278();
    v11 = 0;
  }

  return v11;
}

@end
