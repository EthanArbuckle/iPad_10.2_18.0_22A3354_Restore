@implementation CSLiveFSVolume

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_14);
  return (id)sharedInstance_sSharedInstance_0;
}

void __32__CSLiveFSVolume_sharedInstance__block_invoke()
{
  CSLiveFSVolume *v0;
  void *v1;

  v0 = objc_alloc_init(CSLiveFSVolume);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

- (CSLiveFSVolume)init
{
  CSLiveFSVolume *v2;
  qos_class_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSLiveFSVolume;
  v2 = -[CSLiveFSVolume init](&v8, sel_init);
  if (v2)
  {
    v3 = qos_class_self();
    dispatch_get_global_queue(v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("CSLiveEvent queue", 0, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (CSLiveFSVolume)initWithVolumeName:(id)a3
{
  id v4;
  CSLiveFSVolume *v5;
  id v6;
  char *v7;
  const char *v8;
  size_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = -[CSLiveFSVolume init](self, "init");
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (char *)objc_msgSend(v6, "UTF8String");
    if (!v7 || (v8 = v7, strchr(v7, 47)) || (v9 = strlen(v8), v5->_volumeNameCStringLength = v9, v9 - 1 > 0xFE))
    {
      logForCSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CSLiveFSVolume initWithVolumeName:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

      v5 = 0;
    }
    else
    {
      v5->_volumeNameCString = strdup(v8);
      objc_storeStrong((id *)&v5->_volumeName, v6);
    }
  }

  return v5;
}

- (CSLiveFSVolume)initWithVolumeURL:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CSLiveFSVolume *v16;
  uint64_t v18;

  v4 = a3;
  if (objc_msgSend(v4, "isFileURL")
    && (v5 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation")) != 0
    && (v6 = v5, strlen(v5) - 69 <= 0x3BA)
    && !strncmp(v6, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x44uLL)
    && (v7 = (char *)(v6 + 68), !strchr(v7, 47))
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v18;
    v16 = -[CSLiveFSVolume initWithVolumeName:](self, "initWithVolumeName:", v18);
  }
  else
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CSLiveFSVolume initWithVolumeURL:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  free((void *)self->_volumeNameCString);
  v3.receiver = self;
  v3.super_class = (Class)CSLiveFSVolume;
  -[CSLiveFSVolume dealloc](&v3, sel_dealloc);
}

- (void)_handleDelayedEvent
{
  OS_xpc_object *v3;
  OS_xpc_object *delayedObject;
  NSObject *queue;
  _QWORD block[4];
  OS_xpc_object *v7;

  v3 = self->_delayedObject;
  if (v3)
  {
    delayedObject = self->_delayedObject;
    self->_delayedObject = 0;

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CSLiveFSVolume__handleDelayedEvent__block_invoke;
    block[3] = &unk_1E2401238;
    v7 = v3;
    dispatch_async(queue, block);

  }
}

void __37__CSLiveFSVolume__handleDelayedEvent__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "command", "fse");
  v4 = *(void **)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  xpc_dictionary_set_value(v2, "data", v4);
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __37__CSLiveFSVolume__handleDelayedEvent__block_invoke_cold_1(v3, v5);

  CSSharedUserFSConnection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessageAsync:completion:", v2, &__block_literal_global_27);

}

- (int)sendCSLiveFSEvent:(CSLiveEventInfo *)a3
{
  int var0;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  char *var2;
  NSObject *v14;
  int v15;
  char v16;
  char *v17;
  size_t var1;
  const char *v19;
  const char *v20;
  int v21;
  uint64_t v22;
  const char *volumeNameCString;
  unsigned int v24;
  unsigned int v25;
  unint64_t var3;
  unsigned int v27;
  size_t v28;
  OS_xpc_object *delayedObject;
  __int16 v30;
  unsigned __int16 *bytes_ptr;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  OS_xpc_object *v38;
  char *v39;
  char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  size_t v44;
  char *v45;
  int v46;
  int v47;
  int v48;
  size_t v49;
  char *v50;
  char *v51;
  const char *v52;
  size_t v53;
  unsigned int v54;
  size_t v55;
  uint64_t v56;
  xpc_object_t v57;
  void *v58;
  NSObject *v59;
  char *v60;
  size_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *queue;
  NSObject *v65;
  int v66;
  unsigned int v67;
  _BYTE v69[12];
  int v70;
  char *v71;
  uint64_t v72;
  size_t v73;
  size_t v74;
  const void *v75;
  const char *v76;
  size_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  size_t v81;
  size_t v82;
  _QWORD block[4];
  NSObject *v84;
  id v85;
  uint8_t buf[4];
  _BYTE v87[10];
  char *v88;
  __int16 v89;
  char *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    *__error() = 22;
LABEL_116:
    LODWORD(var2) = -1;
    return (int)var2;
  }
  var0 = a3->var0;
  v6 = objc_msgSend(a3->var4, "bytes");
  v7 = objc_msgSend(a3->var4, "length");
  if ((unint64_t)(v7 - 5) > 0x3FA)
  {
    LOWORD(v9) = 0;
    v8 = 0;
    v11 = 0;
    v10 = 32;
  }
  else
  {
    v8 = v7;
    v9 = *(_QWORD *)(v6 + 8);
    v10 = v7 + 32;
    if ((v9 & 1) != 0)
      v11 = *(_DWORD *)(v6 + 24);
    else
      v11 = 0;
  }
  v12 = var0 & 0xFFF;
  if ((v11 - 3) > 0xFFFFFFFD || v12 == 1)
  {
    if ((v9 & 0x100) != 0)
      v78 = *(_QWORD *)(v6 + 64);
    else
      v78 = 0;
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CSLiveFSVolume sendCSLiveFSEvent:].cold.1(&a3->var0, (uint64_t)self, v14);

    v82 = v10;
    if (v12 <= 0xE)
    {
      v15 = 1;
      if (((1 << v12) & 0x39D7) != 0)
      {
        v16 = 0;
        v80 = 0;
        v81 = 0;
        v76 = 0;
        v77 = 0;
        v75 = 0;
        v79 = 0;
        LODWORD(v17) = 0;
        goto LABEL_43;
      }
      if (((1 << v12) & 0x4028) != 0)
      {
        if (a3->var5 == 1)
        {
          v17 = a3->var6.var0.var0;
          if (!v17)
          {
            v16 = 0;
            v80 = 0;
            v81 = 0;
            v76 = 0;
            v77 = 0;
            v75 = 0;
            v79 = 0;
            goto LABEL_43;
          }
          var1 = a3->var6.var0.var1;
          if ((var1 & 0x80000000) != 0)
            var1 = strlen(a3->var6.var0.var0);
          v81 = var1;
          if ((var1 - 1024) < 0xFFFFFC01)
          {
            v16 = 0;
            v80 = 0;
LABEL_34:
            v76 = 0;
LABEL_35:
            v77 = 0;
            v75 = 0;
            v79 = 0;
            v15 = 0;
            LODWORD(v17) = 22;
            goto LABEL_43;
          }
          v79 = 0;
          v80 = v17;
          v16 = 0;
          v76 = 0;
          v77 = 0;
          v75 = 0;
          LODWORD(v17) = 0;
          v22 = v10 + (var1 + 1);
LABEL_42:
          v82 = v22;
LABEL_43:
          volumeNameCString = self->_volumeNameCString;
          if (volumeNameCString)
          {
            v24 = strlen(self->_volumeNameCString);
            v25 = v24;
            if (v24 > 0x100)
            {
LABEL_45:
              LODWORD(v17) = 22;
LABEL_113:
              logForCSLogCategoryDefault();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                v66 = a3->var0;
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v87 = (_DWORD)v17;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = v66;
                _os_log_impl(&dword_18C42F000, v65, OS_LOG_TYPE_DEFAULT, "Error %d for eventType: %d", buf, 0xEu);
              }

              *__error() = (int)v17;
              goto LABEL_116;
            }
            v82 += v24 + 1;
            if (!v15)
              goto LABEL_113;
          }
          else
          {
            v25 = 0;
            if (!v15)
              goto LABEL_113;
          }
          if ((v16 & 1) != 0)
            goto LABEL_11;
          var2 = a3->var2;
          if (!var2)
            return (int)var2;
          var3 = a3->var3;
          v27 = var3 - 1024;
          v28 = (var3 + 1);
          v74 = v28;
          if ((var3 - 1024) < 0xFFFFFC01)
            v28 = 0;
          v73 = v28;
          if (CSIsInterestingPath(var2))
          {
            LODWORD(delayedObject) = 0;
            v30 = v81;
            if (v12 != 3)
              goto LABEL_79;
            if (!(_DWORD)v81)
              goto LABEL_79;
            delayedObject = self->_delayedObject;
            if (!delayedObject)
              goto LABEL_79;
            if (!CSIsInterestingPath(v80))
            {
              bytes_ptr = (unsigned __int16 *)xpc_data_get_bytes_ptr(self->_delayedObject);
              v32 = bytes_ptr[10];
              v71 = (char *)(bytes_ptr + 16);
              v33 = (char *)bytes_ptr + v32 + 32;
              if (bytes_ptr[11])
                v34 = bytes_ptr[11] + 1;
              else
                v34 = 0;
              v35 = bytes_ptr[12];
              v72 = (uint64_t)&v33[v34 + 1];
              v36 = (char *)(v72 + v35);
              if (!strcmp((const char *)(v72 + v35), a3->var2))
              {
                if ((v35 - 5) <= 0x3FA && (*(_BYTE *)(v72 + 9) & 1) != 0)
                  v78 = *(_QWORD *)(v72 + 64);
                logForCSLogCategoryDefault();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218498;
                  *(_QWORD *)v87 = v78;
                  *(_WORD *)&v87[8] = 2080;
                  v88 = v36;
                  v89 = 2080;
                  v90 = v71;
                  _os_log_debug_impl(&dword_18C42F000, v37, OS_LOG_TYPE_DEBUG, "safe save detected oid: %lld rename %s to %s", buf, 0x20u);
                }

                v38 = self->_delayedObject;
                self->_delayedObject = 0;

              }
              LODWORD(delayedObject) = 0;
              v30 = v81;
LABEL_79:
              if (v27 >= 0xFFFFFC01)
              {
                v70 = (int)delayedObject;
                -[CSLiveFSVolume _handleDelayedEvent](self, "_handleDelayedEvent");
                CSSharedUserFSConnection();
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = (void *)v42;
                if (v42)
                {
                  v72 = v42;
                  v71 = v69;
                  v44 = v73 + v82;
                  v45 = &v69[-((v73 + v82 + 15) & 0xFFFFFFFFFFFFFFF0)];
                  bzero(v45, v73 + v82);
                  v46 = a3->var0;
                  v47 = a3->var1;
                  v82 = v44;
                  *(_DWORD *)v45 = v44;
                  *((_DWORD *)v45 + 1) = v46;
                  *((_DWORD *)v45 + 4) = v47;
                  v48 = v77;
                  *((_QWORD *)v45 + 1) = v78;
                  *((_WORD *)v45 + 10) = var3;
                  *((_WORD *)v45 + 11) = v25;
                  *((_WORD *)v45 + 12) = v8;
                  *((_WORD *)v45 + 13) = v30;
                  *((_WORD *)v45 + 14) = v48;
                  *((_WORD *)v45 + 15) = v79;
                  v49 = v74;
                  memcpy(v45 + 32, a3->var2, v74);
                  v50 = &v45[v49 + 32];
                  if (v25)
                  {
                    memcpy(v50, volumeNameCString, v25 + 1);
                    v50 += v25 + 1;
                  }
                  v51 = v80;
                  v52 = v76;
                  if (v8)
                  {
                    memcpy(v50, (const void *)v6, v8);
                    v50 += v8;
                  }
                  if (v51 && (_DWORD)v81)
                  {
                    v53 = (v81 + 1);
                    memcpy(v50, v51, v53);
                    v50 += v53;
                  }
                  if (v52 && v48 && (memcpy(v50, v52, (v48 + 1)), v50 += (v48 + 1), v75))
                  {
                    v54 = v79;
                    v43 = (void *)v72;
                    v55 = v82;
                    if ((_DWORD)v79)
                    {
                      memcpy(v50, v75, v79);
                      v50 += v54;
                    }
                  }
                  else
                  {
                    v43 = (void *)v72;
                    v55 = v82;
                  }
                  if (&v50[-v55] == v45)
                  {
                    v57 = xpc_data_create(v45, v55);
                    v58 = v57;
                    if (v70)
                    {
                      objc_storeStrong((id *)&self->_delayedObject, v57);
                      logForCSLogCategoryDefault();
                      v59 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                      {
                        v60 = a3->var2;
                        *(_DWORD *)buf = 134218498;
                        *(_QWORD *)v87 = v58;
                        *(_WORD *)&v87[8] = 2080;
                        v88 = v51;
                        v89 = 2080;
                        v90 = v60;
                        _os_log_debug_impl(&dword_18C42F000, v59, OS_LOG_TYPE_DEBUG, "delay %p for safe save %s to %s", buf, 0x20u);
                      }
                    }
                    else
                    {
                      queue = self->_queue;
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = __36__CSLiveFSVolume_sendCSLiveFSEvent___block_invoke;
                      block[3] = &unk_1E24013B8;
                      v84 = v57;
                      v85 = v43;
                      dispatch_async(queue, block);

                      v59 = v84;
                    }

                    LODWORD(v17) = 0;
                  }
                  else
                  {
                    LODWORD(v17) = 22;
                  }
                }
                else
                {
                  LODWORD(v17) = 0;
                }

              }
              else
              {
                LODWORD(v17) = 22;
              }
              if (!(_DWORD)v17)
                goto LABEL_11;
              goto LABEL_113;
            }
          }
          else
          {
            v30 = v81;
            if (!(_DWORD)v81 || !CSIsInterestingPath(v80))
            {
              if (v27 >= 0xFFFFFC01)
                goto LABEL_11;
              goto LABEL_45;
            }
            if (v12 == 3)
            {
              v39 = a3->var2;
              v40 = strrchr(v39, 47);
              if (v40)
                v41 = v40 + 1;
              else
                v41 = v39;
              LODWORD(delayedObject) = strncmp(v41, ".nfs.", 5uLL) == 0;
              goto LABEL_79;
            }
          }
          LODWORD(delayedObject) = 0;
          goto LABEL_79;
        }
LABEL_33:
        v16 = 0;
        v80 = 0;
        v81 = 0;
        goto LABEL_34;
      }
      if (a3->var5 != 2)
        goto LABEL_33;
      v19 = (const char *)objc_msgSend(objc_retainAutorelease(a3->var6.var0.var0), "UTF8String");
      if (!v19)
        goto LABEL_33;
      v20 = v19;
      v21 = *(unsigned __int8 *)v19;
      v76 = v19;
      if (!v21)
      {
        v16 = 0;
        v80 = 0;
        v81 = 0;
        goto LABEL_35;
      }
      if (!strcmp(v19, "com.apple.lastuseddate#PS"))
      {
        v56 = 25;
      }
      else
      {
        if (strncmp(v20, "com.apple.metadata:", 0x13uLL))
        {
          v80 = 0;
          v81 = 0;
          v77 = 0;
          v75 = 0;
          v79 = 0;
          LODWORD(v17) = 0;
          v16 = 1;
          goto LABEL_43;
        }
        v61 = strlen(v20);
        v56 = v61;
        if ((v61 - 257) < 0xFFFFFF00)
        {
          v77 = v61;
          v80 = 0;
          v81 = 0;
          goto LABEL_37;
        }
      }
      v62 = v10 + (v56 + 1);
      v63 = objc_msgSend(a3->var6.var1.var1, "length");
      v77 = v56;
      if (!(_DWORD)v63)
      {
        v81 = 0;
        v82 = v62;
        v16 = 0;
        v79 = 0;
        v80 = 0;
        v75 = 0;
        LODWORD(v17) = 0;
        goto LABEL_39;
      }
      v79 = v63;
      if (v63 <= 0x8000)
      {
        v67 = v63;
        v75 = (const void *)objc_msgSend(objc_retainAutorelease(a3->var6.var1.var1), "bytes");
        v16 = 0;
        v80 = 0;
        v81 = 0;
        LODWORD(v17) = 0;
        v15 = 1;
        v22 = v62 + v67;
        goto LABEL_42;
      }
      v81 = 0;
      v82 = v62;
      v80 = 0;
      v75 = 0;
LABEL_38:
      LODWORD(v17) = 0;
      v16 = 1;
LABEL_39:
      v15 = 1;
      goto LABEL_43;
    }
    v80 = 0;
    v81 = 0;
    v76 = 0;
    v77 = 0;
LABEL_37:
    v75 = 0;
    v79 = 0;
    goto LABEL_38;
  }
  -[CSLiveFSVolume _handleDelayedEvent](self, "_handleDelayedEvent");
LABEL_11:
  LODWORD(var2) = 0;
  return (int)var2;
}

void __36__CSLiveFSVolume_sendCSLiveFSEvent___block_invoke(uint64_t a1)
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "command", "fse");
  xpc_dictionary_set_value(xdict, "data", *(xpc_object_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "sendMessageAsync:completion:", xdict, &__block_literal_global_32);

}

- (void)sendEventOfType:(int)a3 pid:(int)a4 path:(const char *)a5 pathLength:(unint64_t)a6 attributes:(id)a7
{
  id v8;
  _DWORD v9[2];
  const char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9[0] = a3;
  v9[1] = a4;
  v10 = a5;
  v11 = a6;
  v8 = a7;
  v12 = v8;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  -[CSLiveFSVolume sendCSLiveFSEvent:](self, "sendCSLiveFSEvent:", v9);

}

- (void)sendDeleteEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5
{
  _QWORD v5[3];
  __int128 v6;
  __int128 v7;

  v5[0] = 1;
  v5[1] = a4;
  v5[2] = a5;
  v6 = 0u;
  v7 = 0u;
  -[CSLiveFSVolume sendCSLiveFSEvent:](self, "sendCSLiveFSEvent:", v5);

}

- (void)sendPairedEventOfType:(int)a3 pid:(int)a4 fromPath:(const char *)a5 fromPathLength:(unint64_t)a6 fromAttributes:(id)a7 toPath:(const char *)a8 toPathLength:(unint64_t)a9 toAttributes:(id)a10
{
  unsigned int v11;
  id v15;
  id v16;
  _DWORD v17[2];
  const char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  v11 = a6;
  v15 = a7;
  v17[0] = 3;
  v17[1] = a4;
  v18 = a8;
  v19 = a9;
  v16 = a10;
  v20 = v16;
  v21 = 1;
  v22 = a5;
  v23 = v11;
  -[CSLiveFSVolume sendCSLiveFSEvent:](self, "sendCSLiveFSEvent:", v17);

}

- (void)sendXattrModifiedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 xAttrValue:(id)a7 attributes:(id)a8
{
  unsigned int v10;
  id v13;
  id v14;
  id v15;
  _QWORD v16[3];
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v10 = a5;
  v13 = a6;
  v14 = a7;
  v16[0] = 9;
  v16[1] = a4;
  v16[2] = v10;
  v15 = a8;
  v17 = v15;
  v18 = 2;
  v19 = v13;
  v20 = v14;
  -[CSLiveFSVolume sendCSLiveFSEvent:](self, "sendCSLiveFSEvent:", v16);

}

- (void)sendXattrRemovedEventForPID:(int)a3 path:(const char *)a4 pathLength:(unint64_t)a5 xAttrName:(id)a6 attributes:(id)a7
{
  unsigned int v8;
  id v11;
  id v12;
  _QWORD v13[3];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v8 = a5;
  v11 = a6;
  v13[0] = 10;
  v13[1] = a4;
  v13[2] = v8;
  v12 = a7;
  v14 = v12;
  v15 = 2;
  v16 = v11;
  v17 = 0;
  -[CSLiveFSVolume sendCSLiveFSEvent:](self, "sendCSLiveFSEvent:", v13);

}

- (BOOL)isInterestingPath:(const char *)a3
{
  return CSIsInterestingPath((char *)a3);
}

- (NSURL)volumeURL
{
  return self->_volumeURL;
}

- (NSString)volumeName
{
  return self->_volumeName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (const)volumeNameCString
{
  return self->_volumeNameCString;
}

- (unint64_t)volumeNameCStringLength
{
  return self->_volumeNameCStringLength;
}

- (OS_xpc_object)delayedObject
{
  return self->_delayedObject;
}

- (void)setDelayedObject:(id)a3
{
  objc_storeStrong((id *)&self->_delayedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_volumeURL, 0);
}

- (void)initWithVolumeName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "invalid volume name %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithVolumeURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "invalid location for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__CSLiveFSVolume__handleDelayedEvent__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "sending event %p", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)sendCSLiveFSEvent:(os_log_t)log .cold.1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a1[1];
  v5 = *(const char **)(a2 + 32);
  if (!v5)
    v5 = "";
  v6 = *((_QWORD *)a1 + 1);
  v7[0] = 67109890;
  v7[1] = v3;
  v8 = 1024;
  v9 = v4;
  v10 = 2080;
  v11 = v5;
  v12 = 2080;
  v13 = v6;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "event: %d pid:%d volume:%s path:%s", (uint8_t *)v7, 0x22u);
}

@end
