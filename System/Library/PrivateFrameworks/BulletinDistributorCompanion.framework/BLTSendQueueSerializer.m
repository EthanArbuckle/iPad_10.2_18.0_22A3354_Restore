@implementation BLTSendQueueSerializer

- (BLTSendQueueSerializer)initWithUsesMessageIdentifiers:(BOOL)a3
{
  BLTSendQueueSerializer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLTSendQueueSerializer;
  result = -[BLTSendQueueSerializer init](&v5, sel_init);
  if (result)
    result->_usesMessageIdentifiers = a3;
  return result;
}

- (void)setSendFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSURL *v7;
  NSURL *sendFileURL;

  v4 = a3;
  if (!v4)
  {
    blt_send_queue_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BLTSendQueueSerializer setSendFileURL:].cold.1((uint64_t)self, v5, v6);

  }
  v7 = (NSURL *)objc_msgSend(v4, "copy");
  sendFileURL = self->_sendFileURL;
  self->_sendFileURL = v7;

  -[BLTSendQueueSerializer cleanup](self, "cleanup");
}

- (void)cleanup
{
  NSObject *v3;
  NSURL *sendFileURL;
  NSURL *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSURL *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  __int128 v23;
  void *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  NSURL *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sendFileURL = self->_sendFileURL;
    *(_DWORD *)buf = 138412290;
    v33 = sendFileURL;
    _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "Removing queue file %@", buf, 0xCu);
  }

  v5 = self->_sendFileURL;
  if (v5)
  {
    -[NSURL lastPathComponent](v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByDeletingLastPathComponent](self->_sendFileURL, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v24 = (void *)v8;
    objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v28;
      *(_QWORD *)&v13 = 138412546;
      v23 = v13;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v17 = *(NSURL **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (-[NSURL containsString:](v17, "containsString:", v6, v23))
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAppendingPathComponent:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v11;
            v20 = objc_msgSend(v18, "removeItemAtPath:error:", v19, &v26);
            v21 = v26;

            if ((v20 & 1) == 0)
            {
              blt_general_log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v23;
                v33 = v17;
                v34 = 2112;
                v35 = v21;
                _os_log_error_impl(&dword_2173D9000, v22, OS_LOG_TYPE_ERROR, "Error removing %@ error: %@", buf, 0x16u);
              }

            }
            v11 = v21;
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v14);
    }

  }
}

- (void)add:(id)a3 type:(unsigned __int16)a4
{
  -[BLTSendQueueSerializer add:type:messageIdentifier:](self, "add:type:messageIdentifier:", a3, a4, 0);
}

- (void)add:(id)a3 type:(unsigned __int16)a4 messageIdentifier:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unsigned __int16 v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42 = a4;
  -[BLTSendQueueSerializer sendFileURL](self, "sendFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_retainAutorelease(v9);
    v11 = -[NSObject fileSystemRepresentation](v10, "fileSystemRepresentation");
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

      if ((v14 & 1) != 0)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *MEMORY[0x24BDD0CF0];
      v46[0] = *MEMORY[0x24BDD0CF8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "createFileAtPath:contents:attributes:", v12, 0, v16);

      if ((v17 & 1) != 0)
      {
LABEL_5:
        v41 = 0;
        objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v10, &v41);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v41;
        if (v18)
        {
          -[NSObject seekToEndOfFile](v18, "seekToEndOfFile");
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v42, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _writeDataToFile(v20, v18);

          objc_msgSend(v8, "data");
          v21 = objc_claimAutoreleasedReturnValue();
          blt_ids_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = -[NSObject length](v21, "length");
            *(_DWORD *)buf = 134217984;
            v44 = v23;
            _os_log_impl(&dword_2173D9000, v22, OS_LOG_TYPE_DEFAULT, "Serializing protobuf bytes: %lu", buf, 0xCu);
          }

          _writeDataToFile(v21, v18);
          if (-[BLTSendQueueSerializer usesMessageIdentifiers](self, "usesMessageIdentifiers"))
          {
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "UUIDString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("blt-"), "stringByAppendingString:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "dataUsingEncoding:", 4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _writeDataToFile(v27, v18);

            if (a5)
              *a5 = objc_retainAutorelease(v26);

          }
        }
        else
        {
          blt_send_queue_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[BLTSendQueueSerializer add:type:messageIdentifier:].cold.3((uint64_t)v19, v21, v29, v30, v31, v32, v33, v34);
        }

      }
      else
      {
        blt_send_queue_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[BLTSendQueueSerializer add:type:messageIdentifier:].cold.4((uint64_t)v12, v18, v35, v36, v37, v38, v39, v40);
        v19 = 0;
      }

      v10 = v19;
    }
    else
    {
      blt_send_queue_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[BLTSendQueueSerializer add:type:messageIdentifier:].cold.2();

    }
  }
  else
  {
    blt_send_queue_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BLTSendQueueSerializer add:type:messageIdentifier:].cold.1((uint64_t)self, v10);
  }

}

- (void)sendWithSender:(id)a3 timeout:(id)a4 responseHandlers:(id)a5 didSend:(id)a6 didQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[BLTSendQueueSerializer sendFileURL](self, "sendFileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathExtension:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = v14;
    v31 = v13;
    v22 = v12;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v24 = objc_msgSend(v23, "linkItemAtURL:toURL:error:", v17, v20, &v37);
    v25 = v37;

    if ((v24 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v25;
      v27 = objc_msgSend(v26, "removeItemAtURL:error:", v17, &v36);
      v28 = v36;

      v12 = v22;
      v14 = v21;
      if ((v27 & 1) == 0)
      {
        blt_send_queue_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[BLTSendQueueSerializer sendWithSender:timeout:responseHandlers:didSend:didQueue:].cold.1();

      }
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke;
      v32[3] = &unk_24D762650;
      v33 = v20;
      v34 = v17;
      v35 = v15;
      v13 = v31;
      objc_msgSend(v12, "sendFileURL:withTimeout:extraMetadata:responseHandlers:didSend:didQueue:", v33, v31, 0, v21, v32, v16);

      v30 = v33;
      goto LABEL_12;
    }
    v28 = v25;
    v12 = v22;
    v14 = v21;
  }
  else
  {
    v28 = 0;
  }
  blt_send_queue_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v39 = v17;
    v40 = 2112;
    v41 = v20;
    v42 = 2112;
    v43 = v28;
    _os_log_error_impl(&dword_2173D9000, v30, OS_LOG_TYPE_ERROR, "Error creating link for sending URL: %@ at %@ error: %@", buf, 0x20u);
  }
LABEL_12:

}

void __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    blt_send_queue_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke_cold_1(a1, (uint64_t)v9, v10);

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (BOOL)handleFileURL:(id)a3 protobufHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  blt_send_queue_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "Received new queue", buf, 2u);
  }

  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v6, &v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v34;
  v11 = v10;
  if (v9)
  {
    v33 = v10;
    _readDataFromFile(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _readDataFromFile(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    blt_ids_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "length");
      *(_DWORD *)buf = 134217984;
      v36 = v15;
      _os_log_impl(&dword_2173D9000, v14, OS_LOG_TYPE_DEFAULT, "Deserializing protobuf bytes: %lu", buf, 0xCu);
    }

    if (-[BLTSendQueueSerializer usesMessageIdentifiers](self, "usesMessageIdentifiers"))
    {
      _readDataFromFile(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    if (objc_msgSend(v13, "length"))
      v32 = objc_msgSend(v12, "length") != 0;
    else
      v32 = 0;
    if (objc_msgSend(v13, "length"))
    {
      while (objc_msgSend(v12, "length"))
      {
        v19 = objc_retainAutorelease(v12);
        v20 = *(unsigned __int16 *)objc_msgSend(v19, "bytes");
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC88]), "initWithProtobufData:type:isResponse:", v13, v20, 0);
        if (v16)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 4);
          objc_msgSend(v21, "context");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            v24 = objc_alloc(MEMORY[0x24BE4FC50]);
            v25 = (void *)objc_msgSend(v24, "initWithDictionary:boostContext:", MEMORY[0x24BDBD1B8], 0);
            objc_msgSend(v21, "setContext:", v25);

          }
          objc_msgSend(v21, "context");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setOutgoingResponseIdentifier:", v22);

        }
        objc_msgSend(v7, "handleIDSProtobuf:", v21);
        _readDataFromFile(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _readDataFromFile(v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        blt_ids_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(v27, "length");
          *(_DWORD *)buf = 134217984;
          v36 = v29;
          _os_log_impl(&dword_2173D9000, v28, OS_LOG_TYPE_DEFAULT, "Deserializing protobuf bytes: %lu", buf, 0xCu);
        }

        if (-[BLTSendQueueSerializer usesMessageIdentifiers](self, "usesMessageIdentifiers"))
        {
          _readDataFromFile(v9);
          v30 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v30;
        }

        v13 = v27;
        if (!objc_msgSend(v27, "length"))
          goto LABEL_28;
      }
    }
    v27 = v13;
LABEL_28:

    v11 = v33;
    v18 = v32;
  }
  else
  {
    blt_send_queue_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = (uint64_t)v6;
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_ERROR, "Encountered error opening file %@: %@", buf, 0x16u);
    }

    _BLTCaptureBug(CFSTR("IDSFileOpenError"));
    v18 = 0;
  }

  return v18;
}

- (NSURL)sendFileURL
{
  return self->_sendFileURL;
}

- (BOOL)usesMessageIdentifiers
{
  return self->_usesMessageIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendFileURL, 0);
}

- (void)setSendFileURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = 0;
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a2, a3, "%@ setSendFileURL: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)add:(uint64_t)a1 type:(NSObject *)a2 messageIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_2173D9000, a2, OS_LOG_TYPE_FAULT, "%@ add:type:messageIdentifier: sendURL is nil", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)add:type:messageIdentifier:.cold.2()
{
  os_log_t v0;
  uint8_t v1[22];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  v2 = 2080;
  v3 = 0;
  _os_log_fault_impl(&dword_2173D9000, v0, OS_LOG_TYPE_FAULT, "%@ add:type:messageIdentifier: sendURL: %@ fileSystemRepresentation: %s", v1, 0x20u);
}

- (void)add:(uint64_t)a3 type:(uint64_t)a4 messageIdentifier:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Encountered error opening file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)add:(uint64_t)a3 type:(uint64_t)a4 messageIdentifier:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Error creating file %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)sendWithSender:timeout:responseHandlers:didSend:didQueue:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, v0, (uint64_t)v0, "Error removing %@ error: %@", v1);
  OUTLINED_FUNCTION_5();
}

void __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_2_0(&dword_2173D9000, a3, (uint64_t)a3, "Error removing %@ error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

@end
