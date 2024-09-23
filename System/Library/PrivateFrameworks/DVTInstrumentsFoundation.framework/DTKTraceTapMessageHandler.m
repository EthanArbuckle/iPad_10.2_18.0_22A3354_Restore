@implementation DTKTraceTapMessageHandler

- (DTKTraceTapMessageHandler)initWithConfig:(id)a3
{
  id v4;
  DTKTraceTapMessageHandler *v5;
  uint64_t v6;
  DVTInputStream *datastream;
  uint64_t v8;
  NSMutableArray *rawMessages;
  NSFileHandle *openFile;
  NSURL *openFileURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTKTraceTapMessageHandler;
  v5 = -[DTTapMessageHandler initWithConfig:](&v13, sel_initWithConfig_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    datastream = v5->_datastream;
    v5->_datastream = (DVTInputStream *)v6;

    if (!v5->_datastream)
      sub_222BC66A4();
    v8 = objc_opt_new();
    rawMessages = v5->_rawMessages;
    v5->_rawMessages = (NSMutableArray *)v8;

    openFile = v5->_openFile;
    v5->_openFile = 0;

    openFileURL = v5->_openFileURL;
    v5->_openFileURL = 0;

    v5->_canUseRawKtrace = objc_msgSend(v4, "canUseRawKtraceFile");
  }

  return v5;
}

- (id)messageReceived:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  DTKTraceTapMessageHandler *v7;
  NSURL *v8;
  NSURL *openFileURL;
  id v10;
  NSFileHandle *v11;
  NSFileHandle *openFile;
  NSFileHandle *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;
  NSURL *v25;
  NSURL *v26;
  int64_t triggerCount;
  DTKTraceTapMessageHandler *v28;
  unsigned int *triggerIDs;
  void *v30;
  void **p_datastream;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  DVTInputStream *datastream;
  id v40;
  void *v41;
  id v42;
  int64_t v43;
  DTKTraceTapMessageHandler *v44;
  unsigned int *v45;
  void *v46;
  DVTInputStream *v47;
  DVTInputStream *v48;
  id v49;
  DVTInputStream *v50;
  unsigned int *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  unsigned int *v57;
  int64_t v58;
  id v59;
  const void *v60;
  NSObject *v61;
  xpc_object_t v62;
  DVTFileStream *v63;
  int64_t v64;
  unsigned int *v65;
  void *v66;
  NSFileHandle *v67;
  NSURL *v68;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  DTKTraceTapMessageHandler *v75;
  uint64_t *v76;
  _QWORD destructor[5];
  id v78;
  id v79;
  _QWORD v80[5];
  size_t size;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  id v92;
  objc_super v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v93.receiver = self;
  v93.super_class = (Class)DTKTraceTapMessageHandler;
  -[DTTapMessageHandler messageReceived:](&v93, sel_messageReceived_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v72;
  if (v72 && !v4)
  {
    if (self->_canUseRawKtrace)
    {
      v86 = 0;
      v6 = objc_msgSend(objc_retainAutorelease(v72), "getBufferWithReturnedLength:", &v86);
      if (v6)
      {
        v7 = self;
        if (!self->_openFile)
        {
          LODWORD(size) = -1;
          +[DTKTraceSessionCreator getDefaultedRemotePath:](DTKTraceSessionCreator, "getDefaultedRemotePath:", &size);
          v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
          openFileURL = self->_openFileURL;
          self->_openFileURL = v8;

          v10 = objc_alloc(MEMORY[0x24BDD1578]);
          v11 = (NSFileHandle *)objc_msgSend(v10, "initWithFileDescriptor:closeOnDealloc:", size, 1);
          openFile = self->_openFile;
          self->_openFile = v11;

          v7 = self;
        }
        if (v86)
        {
          v13 = v7->_openFile;
          v14 = objc_alloc(MEMORY[0x24BDBCE50]);
          v15 = (void *)objc_msgSend(v14, "initWithBytesNoCopy:length:deallocator:", v6, v86, &unk_24EB277F0);
          v92 = 0;
          -[NSFileHandle writeData:error:](v13, "writeData:error:", v15, &v92);
          v16 = v92;

          if (v16)
            sub_222BC6784();
        }
        goto LABEL_12;
      }
    }
    else
    {
      v17 = objc_retainAutorelease(v72);
      if (objc_msgSend(v17, "getBufferWithReturnedLength:", 0))
      {
        -[NSMutableArray addObject:](self->_rawMessages, "addObject:", v17);
LABEL_12:
        v4 = 0;
LABEL_61:
        v5 = v72;
        goto LABEL_62;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectWithAllowedClasses:", v18);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DTTapMessageHandler config](self, "config");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v71, "kind");
      switch(v19)
      {
        case 0:
          self->_triggerCount = objc_msgSend(v71, "triggerCount");
          self->_coreCount = objc_msgSend(v71, "coreCount");
          v20 = objc_msgSend(v71, "tapVersion");
          v4 = 0;
          if (v20)
            v21 = v20;
          else
            v21 = 0x10000;
          self->_tapVersion = v21;
          goto LABEL_59;
        case 1:
        case 2:
        case 3:
        case 4:
          sub_222BC6744(v71);
        case 5:
          v4 = (void *)objc_opt_new();
          objc_msgSend(v4, "setTapVersion:", self->_tapVersion);
          objc_msgSend(v4, "setIsSession:", 1);
          objc_msgSend(v4, "setFinalMemo:", 1);
          objc_msgSend(v4, "setSupportsPeek:", 1);
          triggerCount = self->_triggerCount;
          objc_msgSend(v4, "setTriggerCount:", triggerCount);
          v28 = self;
          triggerIDs = self->_triggerIDs;
          if (triggerIDs)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", triggerIDs, 4 * triggerCount);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setTriggerIDs:", v30);

            v28 = self;
          }
          p_datastream = (void **)&v28->_datastream;
          objc_msgSend(v4, "setDatastream:", v28->_datastream);
          v32 = *p_datastream;
          *p_datastream = 0;

          goto LABEL_59;
        case 6:
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v33 = self->_rawMessages;
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v83 != v35)
                  objc_enumerationMutation(v33);
                v86 = 0;
                v87 = &v86;
                v88 = 0x3032000000;
                v89 = sub_222B5A518;
                v90 = sub_222B5A528;
                v91 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * i);
                size = 0;
                v37 = objc_msgSend(objc_retainAutorelease((id)v87[5]), "getBufferWithReturnedLength:", &size);
                if (size)
                {
                  v38 = v37;
                  datastream = self->_datastream;
                  v40 = objc_alloc(MEMORY[0x24BDBCE50]);
                  v80[0] = MEMORY[0x24BDAC760];
                  v80[1] = 3221225472;
                  v80[2] = sub_222B5A530;
                  v80[3] = &unk_24EB29AE0;
                  v80[4] = &v86;
                  v41 = (void *)objc_msgSend(v40, "initWithBytesNoCopy:length:deallocator:", v38, size, v80);
                  v79 = 0;
                  -[DVTInputStream write:error:](datastream, "write:error:", v41, &v79);
                  v42 = v79;

                  if (v42)
                    __assert_rtn("-[DTKTraceTapMessageHandler messageReceived:]", "DTKTraceTapMessageHandler.m", 106, "error == nil");
                }
                _Block_object_dispose(&v86, 8);

              }
              v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
            }
            while (v34);
          }

          -[NSMutableArray removeAllObjects](self->_rawMessages, "removeAllObjects");
          v4 = (void *)objc_opt_new();
          objc_msgSend(v4, "setTapVersion:", self->_tapVersion);
          objc_msgSend(v4, "setIsSession:", 1);
          objc_msgSend(v4, "setSupportsPeek:", 1);
          v43 = self->_triggerCount;
          objc_msgSend(v4, "setTriggerCount:", v43);
          v44 = self;
          v45 = self->_triggerIDs;
          if (v45)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v45, 4 * v43);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setTriggerIDs:", v46);

            v44 = self;
          }
          if (!v44->_datastream)
            sub_222BC66CC();
          objc_msgSend(v4, "setDatastream:");
          v47 = self->_datastream;
          v78 = 0;
          -[DVTInputStream createNextStream:](v47, "createNextStream:", &v78);
          v48 = (DVTInputStream *)objc_claimAutoreleasedReturnValue();
          v49 = v78;
          v50 = self->_datastream;
          self->_datastream = v48;

          if (!self->_datastream)
            sub_222BC66F4();

          goto LABEL_59;
        case 7:
          v51 = self->_triggerIDs;
          if (v51)
          {
            free(v51);
            self->_triggerIDs = 0;
          }
          objc_msgSend(v71, "sessionMetadata");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("triggerIDs"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("triggerUUIDs"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v53, "count"))
          {
            v55 = objc_msgSend(v53, "count");
            if (v55 == objc_msgSend(v54, "count"))
            {
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v53, v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (unsigned int *)malloc_type_malloc(4 * self->_triggerCount, 0x100004052888210uLL);
              self->_triggerIDs = v57;
              v58 = self->_triggerCount;
              if (v58 >= 1)
                memset(v57, 255, 4 * v58);
              v86 = 0;
              v87 = &v86;
              v88 = 0x2020000000;
              LODWORD(v89) = 0;
              v73[0] = MEMORY[0x24BDAC760];
              v73[1] = 3221225472;
              v73[2] = sub_222B5A558;
              v73[3] = &unk_24EB29B08;
              v59 = v56;
              v74 = v59;
              v75 = self;
              v76 = &v86;
              objc_msgSend(v70, "enumerateTriggerConfigs:", v73);
              objc_msgSend(v70, "_runningMetadataChanged:", v52);

              _Block_object_dispose(&v86, 8);
            }
          }

          goto LABEL_56;
        default:
          if (v19 == 1024)
          {
            v86 = 0;
            v87 = &v86;
            v88 = 0x3032000000;
            v89 = sub_222B5A518;
            v90 = sub_222B5A528;
            -[NSMutableArray firstObject](self->_rawMessages, "firstObject");
            v91 = (id)objc_claimAutoreleasedReturnValue();
            size = 0;
            v60 = (const void *)objc_msgSend(objc_retainAutorelease((id)v87[5]), "getBufferWithReturnedLength:", &size);
            if (size)
            {
              destructor[0] = MEMORY[0x24BDAC760];
              destructor[1] = 3221225472;
              destructor[2] = sub_222B5A544;
              destructor[3] = &unk_24EB28BF8;
              destructor[4] = &v86;
              v61 = dispatch_data_create(v60, size, 0, destructor);
              v62 = xpc_data_create_with_dispatch_data(v61);
              v4 = (void *)objc_opt_new();
              objc_msgSend(v4, "setIsSession:", 0);
              objc_msgSend(v4, "setSupportsPeek:", 0);
              objc_msgSend(v4, "setStackshot:", v62);

            }
            else
            {
              v4 = 0;
            }
            -[NSMutableArray removeAllObjects](self->_rawMessages, "removeAllObjects");
            _Block_object_dispose(&v86, 8);

          }
          else
          {
            if (v19 != 1025)
              goto LABEL_56;
            objc_msgSend(v71, "localFilePath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = objc_alloc(MEMORY[0x24BDBCF48]);
              objc_msgSend(v71, "localFilePath");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (NSURL *)objc_msgSend(v23, "initWithString:", v24);
              v26 = self->_openFileURL;
              self->_openFileURL = v25;

            }
            if (self->_openFileURL)
            {
              v63 = -[DVTFileStream initWithURL:]([DVTFileStream alloc], "initWithURL:", self->_openFileURL);
              -[NSMutableArray removeAllObjects](self->_rawMessages, "removeAllObjects");
              v4 = (void *)objc_opt_new();
              objc_msgSend(v4, "setTapVersion:", self->_tapVersion);
              objc_msgSend(v4, "setIsSession:", 1);
              objc_msgSend(v4, "setIsRawKtraceFile:", 1);
              objc_msgSend(v4, "setSupportsPeek:", 0);
              v64 = self->_triggerCount;
              objc_msgSend(v4, "setTriggerCount:", v64);
              v65 = self->_triggerIDs;
              if (v65)
              {
                objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v65, 4 * v64);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setTriggerIDs:", v66);

              }
              if (!self->_datastream)
                sub_222BC671C();
              objc_msgSend(v4, "setDatastream:", v63);
              v67 = self->_openFile;
              self->_openFile = 0;

              v68 = self->_openFileURL;
              self->_openFileURL = 0;

            }
            else
            {
LABEL_56:
              v4 = 0;
            }
          }
LABEL_59:

          break;
      }
    }
    else
    {
      v4 = 0;
    }

    goto LABEL_61;
  }
LABEL_62:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openFileURL, 0);
  objc_storeStrong((id *)&self->_openFile, 0);
  objc_storeStrong((id *)&self->_rawMessages, 0);
  objc_storeStrong((id *)&self->_datastream, 0);
}

@end
