@implementation DYFSStreamer

+ (id)streamItem:(id)a3 withTransport:(id)a4
{
  return (id)objc_msgSend(a1, "streamItem:withTransport:destinationName:", a3, a4, 0);
}

+ (id)streamItem:(id)a3 withTransport:(id)a4 destinationName:(id)a5
{
  DYFSStreamer *v6;
  DYFSStreamer *v7;
  id v8;

  v6 = -[DYFSStreamer initWithURL:transport:asSender:]([DYFSStreamer alloc], "initWithURL:transport:asSender:", a3, a4, 1);
  v7 = v6;
  if (a5)
    -[DYFSStreamer setDestinationName:](v6, "setDestinationName:", a5);
  v8 = -[DYFSStreamer initiateTransfer](v7, "initiateTransfer");

  return v8;
}

+ (void)denyTransfer:(id)a3 transport:(id)a4
{
  objc_msgSend(a4, "send:inReplyTo:error:", objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 2305, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0)), a3, 0);
}

- (DYFSStreamer)initWithURL:(id)a3 transport:(id)a4 asSender:(BOOL)a5
{
  DYFSStreamer *v8;
  DYFSStreamer *v9;
  const char *v10;
  NSURL *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DYFSStreamer;
  v8 = -[DYFSStreamer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v8)), v8), "UTF8String");
    v9->_queue = (OS_dispatch_queue *)dispatch_queue_create(v10, 0);
    v11 = (NSURL *)(id)objc_msgSend(a3, "filePathURL");
    v9->_url = v11;
    if (v11)
    {
      v9->_path = -[NSURL path](v11, "path");
      v9->_isSender = a5;
      v9->_transport = (DYTransport *)a4;
      v9->_fileManager = (NSFileManager *)objc_opt_new();
      if (!v9->_isSender)
        v9->_fileHandles = (NSMutableDictionary *)objc_opt_new();
      v9->_destinationName = -[NSURL lastPathComponent](v9->_url, "lastPathComponent");
      v9->_urls = (NSMutableArray *)objc_opt_new();
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DYFSStreamer;
  -[DYFSStreamer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)DYFSStreamer;
  v4 = -[DYFSStreamer description](&v7, sel_description);
  if (self->_isSender)
    v5 = CFSTR("sender");
  else
    v5 = CFSTR("receiver");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: mode=%@ path=%@"), v4, v5, -[DYFSStreamer path](self, "path"));
}

- (void)_sendAbortMessageInReplyTo:(id)a3 becauseOfError:(id)a4
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(a4, "description");
  if (!v6 || (v7 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:stringPayload:", 2309, v6)) == 0)
    v7 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:", 2309);
  -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v7, a3, 0);
  ++self->_messages;
  self->_bytes += objc_msgSend(v7, "transportSize");
}

- (void)_invalidate
{
  if (!self->_invalid)
  {
    objc_msgSend((id)-[NSMutableDictionary allValues](self->_fileHandles, "allValues"), "makeObjectsPerformSelector:", sel_closeFile);
    -[NSMutableDictionary removeAllObjects](self->_fileHandles, "removeAllObjects");
    self->_invalid = 1;
  }
}

- (BOOL)_sendFileAtURL:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  uint64_t v22;
  id v24;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", a3, a5);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "seekToFileOffset:", 0);
    v24 = 0;
    LODWORD(v8) = objc_msgSend(a3, "getResourceValue:forKey:error:", &v24, *MEMORY[0x24BDBCC48], a5);
    if ((_DWORD)v8)
    {
      v21 = a3;
      v10 = objc_msgSend(v24, "unsignedIntegerValue");
      v11 = 0;
      v22 = *MEMORY[0x24BE393A0];
      v12 = *MEMORY[0x24BE39398];
      v13 = *MEMORY[0x24BE393A8];
      while (1)
      {
        v14 = v10 - v11 >= 0x80000 ? 0x80000 : v10 - v11;
        v15 = objc_msgSend(v9, "readDataOfLength:", v14);
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v11);
        v18 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", a4, v22, v17, v12, v24, v13, CFSTR("file"), CFSTR("kind"), 0);
        v19 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:payload:", 2306, v18, v15);
        LODWORD(v16) = -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v19, self->_initTransferAckMessage, a5);
        ++self->_messages;
        self->_bytes += objc_msgSend(v19, "transportSize");
        if (!(_DWORD)v16)
          break;
        v11 += v14;
        if (v11 >= v10)
        {
          ++self->_files;
          -[NSMutableArray addObject:](self->_urls, "addObject:", v21);
          LOBYTE(v8) = 1;
          return (char)v8;
        }
      }
      LOBYTE(v8) = 0;
    }
  }
  return (char)v8;
}

- (BOOL)_sendCreateDirectoryMessage:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BE393A0], CFSTR("directory"), CFSTR("kind"), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:payload:", 2306, v6, 0);
  LOBYTE(a4) = -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v7, self->_initTransferAckMessage, a4);
  ++self->_messages;
  self->_bytes += objc_msgSend(v7, "transportSize");
  return (char)a4;
}

- (BOOL)_sendCreateSymlinkMessage:(id)a3 destination:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;

  v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x24BE393A0], a4, CFSTR("destination"), CFSTR("symlink"), CFSTR("kind"), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:payload:", 2306, v7, 0);
  LOBYTE(a5) = -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v8, self->_initTransferAckMessage, a5);
  ++self->_messages;
  self->_bytes += objc_msgSend(v8, "transportSize");
  return (char)a5;
}

- (id)initiateTransfer
{
  void *v3;
  void *v4;
  DYTransport *transport;
  OS_dispatch_queue *queue;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];
  uint64_t v15;

  self->_didInitiate = 1;
  v3 = (void *)objc_msgSend(MEMORY[0x24BE39110], "future");
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", self->_path, &self->_itemIsDirectory))
  {
    objc_msgSend(v3, "setError:", objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 1, 0));
    v11 = v3;
    v10 = 0;
    goto LABEL_5;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:stringPayload:", 2304, self->_destinationName);
  v15 = 0;
  transport = self->_transport;
  queue = self->_queue;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __32__DYFSStreamer_initiateTransfer__block_invoke;
  v14[3] = &unk_250D58C68;
  v14[4] = self;
  v14[5] = v3;
  v8 = -[DYTransport send:error:replyQueue:timeout:handler:](transport, "send:error:replyQueue:timeout:handler:", v4, &v15, queue, 0, v14);
  ++self->_messages;
  self->_bytes += objc_msgSend(v4, "transportSize");
  if ((v8 & 1) == 0)
  {
    v9 = self->_queue;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_4;
    v13[3] = &unk_250D587B0;
    v13[4] = self;
    dispatch_sync(v9, v13);
    objc_msgSend(v3, "setError:", v15);
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v11 = v3;
LABEL_5:
    objc_msgSend(v11, "setResult:", v10);
  }
  return v3;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  __int128 v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 83))
    return 0;
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:");
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", a3);
    return 0;
  }
  ++*(_QWORD *)(v3 + 144);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) += objc_msgSend(a2, "transportSize");
  if (objc_msgSend(a2, "kind") != 2305)
  {
    v8 = *(void **)(a1 + 40);
    v9 = (void *)MEMORY[0x24BE39108];
    v10 = *MEMORY[0x24BE39080];
    v11 = 43;
    goto LABEL_12;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "objectPayload"), "BOOLValue") & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    v9 = (void *)MEMORY[0x24BE39108];
    v10 = *MEMORY[0x24BE39080];
    v11 = 42;
LABEL_12:
    objc_msgSend(v8, "setError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, 0));
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v37);
    return 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  v53 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 81))
  {
    v13 = objc_msgSend(*(id *)(v6 + 88), "lastPathComponent");
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 112))
    {
      if (!objc_msgSend(*(id *)(v14 + 112), "evaluateWithObject:", v13))
        goto LABEL_19;
      v14 = *(_QWORD *)(a1 + 32);
    }
    if ((objc_msgSend((id)v14, "_sendFileAtURL:relativePath:error:", *(_QWORD *)(v14 + 88), v13, &v53) & 1) != 0)
    {
LABEL_19:
      v15 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:", 2307);
      v41[0] = MEMORY[0x24BDAC760];
      v16 = *(_OWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 24);
      v19 = *(_QWORD *)(v17 + 8);
      v41[1] = 3221225472;
      v41[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_3;
      v41[3] = &unk_250D58C68;
      v42 = v16;
      objc_msgSend(v18, "send:inReplyTo:error:replyQueue:timeout:handler:", v15, a2, 0, v19, 0, v41);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) += objc_msgSend(v15, "transportSize");
      return 0;
    }
    goto LABEL_40;
  }
  if (*(_BYTE *)(v6 + 84))
  {
    if ((objc_msgSend((id)v6, "_sendCreateSymlinkMessage:destination:error:", objc_msgSend(*(id *)(v6 + 88), "lastPathComponent"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "path"), &v53) & 1) != 0)goto LABEL_19;
    goto LABEL_40;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_sendCreateDirectoryMessage:error:", *(_QWORD *)(v6 + 104), &v53) & 1) == 0)
  {
LABEL_40:
    objc_msgSend(*(id *)(a1 + 32), "_sendAbortMessageInReplyTo:becauseOfError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v53);
    objc_msgSend(*(id *)(a1 + 32), "_invalidate");
    objc_msgSend(*(id *)(a1 + 40), "setError:", v53);
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    return 0;
  }
  v20 = *MEMORY[0x24BDBCCD0];
  v38 = *MEMORY[0x24BDBCCA0];
  v39 = *MEMORY[0x24BDBCC60];
  v40 = *MEMORY[0x24BDBCC98];
  v21 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCC98], *MEMORY[0x24BDBCC60], *MEMORY[0x24BDBCCA0], *MEMORY[0x24BDBCC48], 0);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v22 = *(_OWORD *)(a1 + 32);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 16);
  v25 = *(_QWORD *)(v23 + 88);
  v51[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_2;
  v51[3] = &unk_250D58C40;
  v52 = v22;
  v26 = (void *)objc_msgSend(v24, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v25, v21, 0, v51);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (!v27)
    goto LABEL_38;
  v28 = v27;
  v29 = *(_QWORD *)v48;
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v48 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      v46 = 0;
      objc_msgSend(v31, "getResourceValue:forKey:error:", &v46, v20, &v53);
      v32 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      if (!v32 || (objc_msgSend(v32, "evaluateWithObject:", v46) & 1) != 0)
      {
        v44 = 0;
        v45 = 0;
        v43 = 0;
        objc_msgSend(v31, "getResourceValue:forKey:error:", &v45, v40, &v53);
        objc_msgSend(v31, "getResourceValue:forKey:error:", &v44, v39, &v53);
        objc_msgSend(v31, "getResourceValue:forKey:error:", &v43, v38, &v53);
        v33 = (void *)objc_msgSend(v31, "pathComponents");
        v34 = objc_msgSend(v26, "level");
        v35 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v33, "subarrayWithRange:", objc_msgSend(v33, "count") - v34, v34), "componentsJoinedByString:", CFSTR("/")));
        if (objc_msgSend(v45, "BOOLValue"))
        {
          if ((objc_msgSend(*(id *)(a1 + 32), "_sendFileAtURL:relativePath:error:", v31, v35, &v53) & 1) == 0)
            goto LABEL_41;
        }
        else
        {
          if (!objc_msgSend(v43, "BOOLValue"))
          {
            if ((objc_msgSend(v44, "BOOLValue") & 1) != 0)
            {
              if (objc_msgSend(*(id *)(a1 + 32), "_sendCreateDirectoryMessage:error:", v35, &v53))
                continue;
LABEL_41:
              v36 = v53;
            }
            else
            {
              v36 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 46, 0);
              v53 = v36;
            }
            objc_msgSend(*(id *)(a1 + 32), "_sendAbortMessageInReplyTo:becauseOfError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v36);
            objc_msgSend(*(id *)(a1 + 32), "_invalidate");
            objc_msgSend(*(id *)(a1 + 40), "setError:", v53);
            objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
            objc_msgSend(v26, "setValue:forKey:", 0, CFSTR("errorHandler"));
            return 0;
          }
          if ((objc_msgSend(*(id *)(a1 + 32), "_sendCreateSymlinkMessage:destination:error:", v35, objc_msgSend(v31, "lastPathComponent"), &v53) & 1) == 0)goto LABEL_41;
        }
      }
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v28)
      continue;
    break;
  }
LABEL_38:
  objc_msgSend(v26, "setValue:forKey:", 0, CFSTR("errorHandler"));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 83))
    goto LABEL_19;
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendAbortMessageInReplyTo:becauseOfError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), a3);
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  objc_msgSend(*(id *)(a1 + 40), "setError:", a3);
  objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  _BYTE *v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[83])
  {
    objc_msgSend(v4, "_invalidate");
    if (a2)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) += objc_msgSend(a2, "transportSize");
      if (objc_msgSend(a2, "kind") == 2309)
      {
        v7 = *(void **)(a1 + 40);
        v8 = (void *)MEMORY[0x24BE39108];
        v9 = *MEMORY[0x24BE39080];
        v10 = (void *)MEMORY[0x24BDBCE70];
        v11 = objc_msgSend(a2, "stringPayload");
        v12 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 45, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x24BDD0FC8], 0));
        v13 = v7;
      }
      else
      {
        v14 = objc_msgSend(a2, "kind");
        v15 = *(void **)(a1 + 40);
        if (v14 == 2308)
        {
          v16 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v17 = v15;
LABEL_10:
          objc_msgSend(v17, "setResult:", v16);
          return 0;
        }
        v12 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 43, 0);
        v13 = v15;
      }
      objc_msgSend(v13, "setError:", v12);
      v18 = *(void **)(a1 + 40);
      v16 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v17 = v18;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 40), "setError:", a3);
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    _DYOLog();
  }
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)setFilenameFilter:(id)a3
{
  NSPredicate *filenameFilter;

  if (!self->_isSender)
    -[DYFSStreamer setFilenameFilter:].cold.1((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  if (self->_didInitiate)
    -[DYFSStreamer setFilenameFilter:].cold.2((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  filenameFilter = self->_filenameFilter;
  if (filenameFilter != a3)
  {

    self->_filenameFilter = (NSPredicate *)a3;
  }
}

- (id)_resolveRelativePath:(id)a3 error:(id *)a4
{
  NSURL *v6;
  uint64_t v7;

  if (!a3)
  {
    if (a4)
    {
      v7 = 1;
      goto LABEL_7;
    }
    return 0;
  }
  v6 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:"), "standardizedURL");
  if (!-[NSString hasPrefix:](-[NSURL path](v6, "path"), "hasPrefix:", -[NSURL path](self->_url, "path")))
  {
    if (a4)
    {
      v7 = 44;
LABEL_7:
      v6 = 0;
      *a4 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v7, 0);
      return v6;
    }
    return 0;
  }
  return v6;
}

- (BOOL)_createOrUpdateFileWithData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  off_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ssize_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int *v25;
  DYFSStreamer *v26;
  SEL v27;
  id v28;
  id *v29;

  v9 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE393A0]), a5);
  if (!v9)
    return (char)v9;
  v10 = v9;
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE393A8]), "unsignedIntegerValue");
  v12 = (void *)-[NSMutableDictionary objectForKey:](self->_fileHandles, "objectForKey:", v10);
  if (!v12)
  {
    -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v10, a5);
    v21 = open((const char *)objc_msgSend((id)objc_msgSend(v10, "path"), "fileSystemRepresentation"), 2561, 384);
    if ((_DWORD)v21 == -1)
    {
      if (!a5)
        goto LABEL_29;
      v23 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      LOBYTE(v9) = 0;
      *a5 = v23;
      return (char)v9;
    }
    v14 = v21;
    if (ftruncate(v21, v11) == -1)
    {
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v14, 1);
      if (v22)
      {
        v13 = (void *)v22;
        if (fchown(v14, self->_ownerUID, 0xFFFFFFFF) == -1)
        {

          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = __error();
          objc_msgSend(v24, "stringWithUTF8String:", strerror(*v25));
          _DYOLog();
          goto LABEL_29;
        }
        -[NSMutableDictionary setObject:forKey:](self->_fileHandles, "setObject:forKey:", v13, v10);

        ++self->_files;
        -[NSMutableArray addObject:](self->_urls, "addObject:", v10);
        goto LABEL_4;
      }
    }
    close(v14);
    goto LABEL_29;
  }
  v13 = v12;
  LODWORD(v14) = objc_msgSend(v12, "fileDescriptor");
LABEL_4:
  v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BE39398]), "unsignedLongValue");
  if (v15 != lseek(v14, 0, 1))
  {
    v26 = (DYFSStreamer *)dy_abort();
    LOBYTE(v9) = -[DYFSStreamer _createDirectoryWithAttributes:error:](v26, v27, v28, v29);
    return (char)v9;
  }
  v16 = objc_msgSend(a3, "bytes");
  v17 = objc_msgSend(a3, "length");
  if (v17 < 1)
  {
    v19 = 0;
LABEL_18:
    if (v19 + v15 == v11)
    {
      objc_msgSend(v13, "closeFile");
      -[NSMutableDictionary removeObjectForKey:](self->_fileHandles, "removeObjectForKey:", v10);
    }
    objc_opt_self();
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  v18 = v17;
  v19 = 0;
  while (1)
  {
    v20 = write(v14, (const void *)(v19 + v16), v18 - v19);
    if (v20 == -1)
      break;
    v19 += v20;
LABEL_10:
    if (v19 >= v18)
      goto LABEL_18;
  }
  if (*__error() == 4)
    goto LABEL_10;
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
  objc_msgSend(v13, "closeFile");
  -[NSMutableDictionary removeObjectForKey:](self->_fileHandles, "removeObjectForKey:", v10);
LABEL_29:
  LOBYTE(v9) = 0;
  return (char)v9;
}

- (BOOL)_createDirectoryWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE393A0]), a4);
  if (v6)
  {
    v7 = v6;
    -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v6, 0);
    LOBYTE(v6) = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self->_fileManager, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v7, "path"), 0, self->_directoryAttributes, a4);
  }
  return (char)v6;
}

- (BOOL)_createSymlinkWithAttributes:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE393A0]), a4);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("destination"));
    v10 = objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet"));
    v11 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v8, a4);
    LOBYTE(v7) = -[NSFileManager createSymbolicLinkAtURL:withDestinationURL:error:](self->_fileManager, "createSymbolicLinkAtURL:withDestinationURL:error:", v8, v11, a4);
    ++self->_files;
  }
  return (char)v7;
}

- (void)setOwner:(id)a3
{
  NSString *owner;

  if (self->_isSender)
    -[DYFSStreamer setOwner:].cold.2((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  if (self->_didInitiate)
    -[DYFSStreamer setOwner:].cold.1((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  owner = self->_owner;
  if (owner != a3)
  {

    self->_owner = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setDestinationName:(id)a3
{
  NSString *destinationName;

  if (!self->_isSender)
    -[DYFSStreamer setDestinationName:].cold.1((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  if (self->_didInitiate)
    -[DYFSStreamer setDestinationName:].cold.3((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
  if (!a3)
    -[DYFSStreamer setDestinationName:].cold.2((uint64_t)self, (uint64_t)a2, 0);
  destinationName = self->_destinationName;
  if (destinationName != a3)
  {

    self->_destinationName = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (id)receiveTransfer:(id)a3
{
  void *v5;
  passwd *v6;
  unsigned int pw_uid;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *v12;
  void *v13;
  DYTransport *transport;
  OS_dispatch_queue *queue;
  uint64_t v16;
  char v17;
  NSObject *v18;
  int *v19;
  uint64_t v20;
  void *v21;
  NSString *owner;
  uint64_t v24;
  _QWORD block[5];
  _QWORD v26[6];
  uint64_t v27;

  v5 = (void *)objc_msgSend(MEMORY[0x24BE39110], "future");
  if (self->_owner)
  {
    *__error() = 0;
    v6 = getpwnam(-[NSString UTF8String](self->_owner, "UTF8String"));
    if (!v6)
    {
      v19 = __error();
      v20 = *v19;
      if ((_DWORD)v20)
        owner = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", strerror(*v19));
      else
        owner = self->_owner;
      _DYOLog();
      -[DYFSStreamer denyTransfer:](self, "denyTransfer:", a3, owner);
      objc_msgSend(v5, "setError:", objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v20, 0));
      v21 = (void *)MEMORY[0x24BDD16E0];
      goto LABEL_15;
    }
    pw_uid = v6->pw_uid;
  }
  else
  {
    pw_uid = -1;
  }
  self->_ownerUID = pw_uid;
  v8 = objc_alloc(MEMORY[0x24BDBCE70]);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ownerUID);
  v10 = *MEMORY[0x24BDD0CA0];
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 448);
  v12 = (NSDictionary *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, v10, v11, *MEMORY[0x24BDD0CC8], 0);
  self->_directoryAttributes = v12;
  v27 = 0;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self->_fileManager, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self->_path, 0, v12, &v27)&& (DYFSDirectoryExists() & 1) == 0)
  {
    v24 = v27;
    _DYOLog();
    -[DYFSStreamer denyTransfer:](self, "denyTransfer:", a3, v24);
    goto LABEL_12;
  }
  self->_didInitiate = 1;
  v13 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 2305, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
  transport = self->_transport;
  queue = self->_queue;
  v16 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __32__DYFSStreamer_receiveTransfer___block_invoke;
  v26[3] = &unk_250D58C68;
  v26[4] = self;
  v26[5] = v5;
  v17 = -[DYTransport send:inReplyTo:error:replyQueue:timeout:handler:](transport, "send:inReplyTo:error:replyQueue:timeout:handler:", v13, a3, &v27, queue, 10000000000, v26);
  ++self->_messages;
  self->_bytes += objc_msgSend(v13, "transportSize");
  if ((v17 & 1) == 0)
  {
    _DYOLog();
    v18 = self->_queue;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __32__DYFSStreamer_receiveTransfer___block_invoke_2;
    block[3] = &unk_250D587B0;
    block[4] = self;
    dispatch_sync(v18, block);
LABEL_12:
    objc_msgSend(v5, "setError:", v27);
    v21 = (void *)MEMORY[0x24BDD16E0];
LABEL_15:
    objc_msgSend(v5, "setResult:", objc_msgSend(v21, "numberWithBool:", 0));
  }
  return v5;
}

uint64_t __32__DYFSStreamer_receiveTransfer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 32);
  if (!a2)
  {
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", a3);
    v8 = *(void **)(a1 + 40);
    v9 = a3;
    goto LABEL_8;
  }
  ++*(_QWORD *)(v4 + 144);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) += objc_msgSend(a2, "transportSize");
  if (objc_msgSend(a2, "kind") != 2306)
  {
    if (objc_msgSend(a2, "kind") == 2307)
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v10 + 83))
      {
        objc_msgSend((id)v10, "_sendAbortMessageInReplyTo:becauseOfError:", a2, *(_QWORD *)(v10 + 48));
      }
      else
      {
        v11 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:", 2308);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "send:inReplyTo:error:", v11, a2, 0);
        ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) += objc_msgSend(v11, "transportSize");

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 83) == 0));
      objc_msgSend(*(id *)(a1 + 32), "_invalidate");
      return 0;
    }
    if (objc_msgSend(a2, "kind") != 2309)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidate");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 43, 0);
      goto LABEL_25;
    }
    v15 = objc_msgSend(a2, "stringPayload");
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v15);
    v9 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 45, 0);
    v8 = *(void **)(a1 + 40);
LABEL_8:
    objc_msgSend(v8, "setError:", v9);
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
    return 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 83))
  {
    v6 = (void *)objc_msgSend(a2, "attributeForKey:", CFSTR("kind"));
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("file")))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_createOrUpdateFileWithData:attributes:error:", objc_msgSend(a2, "payload"), objc_msgSend(a2, "attributes"), *(_QWORD *)(a1 + 32) + 48) & 1) != 0)goto LABEL_23;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("directory")))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_createDirectoryWithAttributes:error:", objc_msgSend(a2, "attributes"), *(_QWORD *)(a1 + 32) + 48) & 1) != 0)
      {
LABEL_23:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
        return 1;
      }
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("symlink"))
           && (objc_msgSend(*(id *)(a1 + 32), "_createSymlinkWithAttributes:error:", objc_msgSend(a2, "attributes"), *(_QWORD *)(a1 + 32) + 48) & 1) != 0)
    {
      goto LABEL_23;
    }
    v16 = objc_msgSend(a2, "attributes");
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    _DYOLog();
    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v16, v17);
LABEL_25:
    objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  }
  return 1;
}

uint64_t __32__DYFSStreamer_receiveTransfer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)denyTransfer:(id)a3
{
  void *v5;
  NSObject *queue;
  _QWORD block[5];

  self->_didInitiate = 1;
  v5 = (void *)objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 2305, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", v5, a3, 0);
  ++self->_messages;
  self->_bytes += objc_msgSend(v5, "transportSize");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DYFSStreamer_denyTransfer___block_invoke;
  block[3] = &unk_250D587B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __29__DYFSStreamer_denyTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (NSArray)urls
{
  return &self->_urls->super;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (BOOL)streamLocally
{
  return self->_streamLocally;
}

- (void)setStreamLocally:(BOOL)a3
{
  self->_streamLocally = a3;
}

- (NSPredicate)filenameFilter
{
  return self->_filenameFilter;
}

- (NSString)owner
{
  return self->_owner;
}

- (unint64_t)files
{
  return self->_files;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (unint64_t)messages
{
  return self->_messages;
}

- (void)setFilenameFilter:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setFilenameFilter:]", ", a3, "_isSender == YES");
}

- (void)setFilenameFilter:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setFilenameFilter:]", ", a3, "_didInitiate == NO");
}

- (void)setOwner:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setOwner:]", ", a3, "_didInitiate == NO");
}

- (void)setOwner:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setOwner:]", ", a3, "_isSender == NO");
}

- (void)setDestinationName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setDestinationName:]", ", a3, "_isSender == YES");
}

- (void)setDestinationName:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setDestinationName:]", ", a3, "name != nil");
}

- (void)setDestinationName:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("-[DYFSStreamer setDestinationName:]", ", a3, "_didInitiate == NO");
}

@end
