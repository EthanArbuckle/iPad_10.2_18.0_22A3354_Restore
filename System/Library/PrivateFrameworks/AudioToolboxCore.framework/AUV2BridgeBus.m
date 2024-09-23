@implementation AUV2BridgeBus

- (AUV2BridgeBus)initWithOwner:(id)a3 au:(OpaqueAudioComponentInstance *)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  id v10;
  AUV2BridgeBus *v11;
  AUV2BridgeBus *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AUV2BridgeBus;
  v11 = -[AUV2BridgeBus init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_owner, v10);
    v12->_audioUnit = a4;
    v12->_scope = a5;
    v12->_element = a6;
  }

  return v12;
}

- (id)format
{
  void *v3;
  int v4;
  int v5;
  void **p_vtable;
  unint64_t v7;
  int v8;
  char v9;
  char v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  OpaqueAudioComponentInstance *audioUnit;
  id WeakRetained;
  void *v18;
  unsigned int element;
  unsigned int scope;
  unsigned int v21;
  int v22;
  void *v23;
  int v24;
  unsigned int v25;
  id *v26;
  id v27;
  id v28;
  NSObject *v29;
  OpaqueAudioComponentInstance *v30;
  id v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  OpaqueAudioComponentInstance *v42;
  int v43;
  void *v44;
  NSObject *log;
  AudioComponentDescription v46;
  void *v47;
  UInt32 ioDataSize;
  _BYTE outData[28];
  unsigned int v50;
  void *__p;
  _QWORD *p_p;
  uint64_t v53;
  uint64_t v54;
  _BYTE buf[40];
  unsigned int v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v3 = 0;
  v4 = 50;
  v63 = *MEMORY[0x1E0C80C00];
  ioDataSize = 0;
  v5 = 4;
  p_vtable = AUPBServer.vtable;
  v7 = 0x1EE142000uLL;
  while (1)
  {

    if (v5 != 4)
    {
      usleep(1000 * v4);
      v4 *= 2;
    }
    ioDataSize = 40;
    if (AudioUnitGetProperty(self->_audioUnit, 8u, self->_scope, self->_element, outData, &ioDataSize))
    {
      v3 = 0;
      v23 = 0;
      goto LABEL_56;
    }
    ioDataSize = 0;
    if (AudioUnitGetPropertyInfo(self->_audioUnit, 0x13u, self->_scope, self->_element, &ioDataSize, 0))
      break;
    std::vector<unsigned char>::vector(&__p, ioDataSize);
    if (AudioUnitGetProperty(self->_audioUnit, 0x13u, self->_scope, self->_element, __p, &ioDataSize))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(getAVAudioChannelLayoutClass(), "layoutWithLayout:", __p);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "channelCount");
      if (v8 != v50)
      {
        v11 = (id *)p_vtable[422];
        if (v11)
        {
          v12 = *v11;
          if (!v12)
          {
LABEL_29:
            v9 = 0;
            goto LABEL_10;
          }
        }
        else
        {
          v13 = (void *)MEMORY[0x1E0C81028];
          v14 = MEMORY[0x1E0C81028];
          v12 = v13;
        }
        v15 = v12;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          audioUnit = self->_audioUnit;
          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *(int *)(v7 + 936)));
          v43 = v4;
          v44 = WeakRetained;
          log = v15;
          v42 = audioUnit;
          if (WeakRetained)
            objc_msgSend(WeakRetained, "componentDescription");
          else
            memset(&v46, 0, sizeof(v46));
          CAFormatter::CAFormatter((CAFormatter *)&v47, &v46);
          v18 = v47;
          element = self->_element;
          scope = self->_scope;
          v21 = v50;
          v22 = objc_msgSend(v3, "channelCount");
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = "AUAudioUnitV2Bridge.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 397;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v42;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = v18;
          *(_WORD *)&buf[38] = 1024;
          v56 = element;
          v57 = 1024;
          v58 = scope;
          v59 = 1024;
          v60 = v21;
          v61 = 1024;
          v62 = v22;
          v15 = log;
          _os_log_impl(&dword_18EE07000, log, OS_LOG_TYPE_DEBUG, "%25s:%-5d au@%p {%s} (bus %d, scope %d): inconsistent #channels in asbd %d, layout %d.. retrying", buf, 0x3Eu);
          if (v47)
            free(v47);

          v7 = 0x1EE142000;
          p_vtable = (void **)(AUPBServer + 24);
          v4 = v43;
        }

        goto LABEL_29;
      }
    }
    v9 = 1;
LABEL_10:
    if (__p)
    {
      p_p = __p;
      operator delete(__p);
    }
    if (v5)
      v10 = v9;
    else
      v10 = 1;
    --v5;
    if ((v10 & 1) != 0)
      goto LABEL_32;
  }
  v3 = 0;
LABEL_32:
  if (!v3 && v50 >= 3)
  {
    objc_msgSend(getAVAudioChannelLayoutClass(), "layoutWithLayoutTag:", v50 | 0x930000);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v3)
  {
    v24 = objc_msgSend(v3, "channelCount");
    v25 = v50;
    if (v24 != v50)
    {
      v26 = (id *)p_vtable[422];
      if (v26)
      {
        v27 = *v26;
        if (!v27)
          goto LABEL_49;
      }
      else
      {
        v27 = (id)MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
      }
      v29 = v27;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_audioUnit;
        v31 = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *(int *)(v7 + 936)));
        v32 = v31;
        if (v31)
        {
          objc_msgSend(v31, "componentDescription");
        }
        else
        {
          __p = 0;
          p_p = 0;
          LODWORD(v53) = 0;
        }
        CAFormatter::CAFormatter((CAFormatter *)&v46, (const AudioComponentDescription *)&__p);
        v33 = *(_QWORD *)&v46.componentType;
        v34 = self->_element;
        v35 = self->_scope;
        v36 = v50;
        v37 = objc_msgSend(v3, "channelCount");
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = "AUAudioUnitV2Bridge.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 415;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v30;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v33;
        *(_WORD *)&buf[38] = 1024;
        v56 = v34;
        v57 = 1024;
        v58 = v35;
        v59 = 1024;
        v60 = v36;
        v61 = 1024;
        v62 = v37;
        _os_log_impl(&dword_18EE07000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d au@%p {%s} (bus %d, scope %d): inconsistent #channels in asbd %d, layout %d, faking a format", buf, 0x3Eu);
        if (*(_QWORD *)&v46.componentType)
          free(*(void **)&v46.componentType);

      }
      v25 = v50;
LABEL_49:
      if (v25 < 3)
      {
        v38 = 0;
      }
      else
      {
        objc_msgSend(getAVAudioChannelLayoutClass(), "layoutWithLayoutTag:", v50 | 0x930000);
        v38 = objc_claimAutoreleasedReturnValue();
      }

      v3 = (void *)v38;
    }
  }
  __p = 0;
  p_p = &__p;
  v53 = 0x2050000000;
  v39 = (void *)getAVAudioFormatClass(void)::softClass;
  v54 = getAVAudioFormatClass(void)::softClass;
  if (!getAVAudioFormatClass(void)::softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZL21getAVAudioFormatClassv_block_invoke_7639;
    *(_QWORD *)&buf[24] = &unk_1E29222D8;
    *(_QWORD *)&buf[32] = &__p;
    ___ZL21getAVAudioFormatClassv_block_invoke_7639((uint64_t)buf);
    v39 = (void *)p_p[3];
  }
  v40 = objc_retainAutorelease(v39);
  _Block_object_dispose(&__p, 8);
  v23 = (void *)objc_msgSend([v40 alloc], "initWithStreamDescription:channelLayout:", outData, v3);
LABEL_56:

  return v23;
}

- (BOOL)setFormat:(id)a3 error:(id *)a4
{
  id v6;
  OSStatus v7;
  void *v8;
  void *v9;
  OpaqueAudioComponentInstance *audioUnit;
  AudioUnitScope scope;
  AudioUnitElement element;
  uint64_t v13;
  id v14;
  OpaqueAudioComponentInstance *v15;
  UInt32 v16;
  id v17;
  void *inData;

  v6 = a3;
  -[AUV2BridgeBus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("format"));
  v7 = AudioUnitSetProperty(self->_audioUnit, 8u, self->_scope, self->_element, (const void *)objc_msgSend(v6, "streamDescription"), 0x28u);
  if (!v7)
  {
    objc_msgSend(v6, "channelLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      audioUnit = self->_audioUnit;
      scope = self->_scope;
      element = self->_element;
      v13 = objc_msgSend(v8, "layout");
      v14 = v9;
      inData = (void *)v13;
      if (objc_msgSend(v14, "layout"))
      {
        v15 = audioUnit;
        if (*(_DWORD *)objc_msgSend(v14, "layout"))
          v16 = 12;
        else
          v16 = 20 * *(_DWORD *)(objc_msgSend(v14, "layout") + 8) + 12;
      }
      else
      {
        v15 = audioUnit;
        v16 = 0;
      }

      AudioUnitSetProperty(v15, 0x13u, scope, element, inData, v16);
    }

  }
  -[AUV2BridgeBus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("format"));
  if (a4)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v17;

    }
    else
    {
      *a4 = 0;
    }
  }

  return v7 == 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  int v6;
  objc_super v7;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v6 = objc_msgSend(WeakRetained, "enableBus:scope:enable:", self->_element, self->_scope, v3);

  if (!v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)AUV2BridgeBus;
    -[AUAudioUnitBus setEnabled:](&v7, sel_setEnabled_, v3);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
