@implementation AVVCPluginRemoteInputHost

- (AVVCPluginRemoteInputHost)init
{
  AVVCPluginRemoteInputHost *result;
  NSObject *v3;
  id v4;
  AVAudioRemoteInputPlugin *v5;
  AVAudioRemoteInputPlugin *mPlugins;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  AVVCPluginRemoteInputHost *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  AVVCPluginRemoteInputHost *v25;
  id v26;
  AVVCPluginRemoteInputHost *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  objc_super v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  AVVCPluginRemoteInputHost *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)AVVCPluginRemoteInputHost;
  result = -[AVVCPluginRemoteInputHost init](&v34, sel_init);
  if (result)
  {
    v27 = result;
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_9:
        v5 = (AVAudioRemoteInputPlugin *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        mPlugins = v27->mPlugins;
        v27->mPlugins = v5;

        v33 = 0;
        -[AVVCPluginRemoteInputHost allBundles:](v27, "allBundles:", &v33);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v33;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        obj = v7;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (!v8)
          goto LABEL_39;
        v9 = *(_QWORD *)v30;
        v10 = MEMORY[0x1E0C81028];
        while (1)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v30 != v9)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (kAVVCScope)
            {
              v13 = *(id *)kAVVCScope;
              if (!v13)
                goto LABEL_21;
            }
            else
            {
              v14 = v10;
              v13 = v10;
            }
            v15 = v13;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "absoluteString");
              v16 = (AVVCPluginRemoteInputHost *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v37 = "AVVCPluginRemoteInputHost.mm";
              v38 = 1024;
              v39 = 33;
              v40 = 2112;
              v41 = v16;
              _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d Plugin Bundle URL: %@", buf, 0x1Cu);

            }
LABEL_21:
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              v19 = (void *)objc_msgSend(v17, "principalClass");
              if (!objc_msgSend(v19, "conformsToProtocol:", &unk_1EE410510))
                goto LABEL_37;
              v20 = objc_msgSend(objc_alloc((Class)v19), "initWithPluginDelegate:", v27);
              -[AVAudioRemoteInputPlugin addObject:](v27->mPlugins, "addObject:", v20);
              if (kAVVCScope)
              {
                v21 = *(id *)kAVVCScope;
                if (!v21)
                  goto LABEL_36;
              }
              else
              {
                v23 = v10;
                v21 = v10;
              }
              v24 = v21;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromClass((Class)v19);
                v25 = (AVVCPluginRemoteInputHost *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v37 = "AVVCPluginRemoteInputHost.mm";
                v38 = 1024;
                v39 = 42;
                v40 = 2112;
                v41 = v25;
                _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d initialized plugin class %@", buf, 0x1Cu);

              }
              goto LABEL_36;
            }
            if (!kAVVCScope)
            {
              v22 = v10;
              v20 = v10;
LABEL_30:
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v37 = "AVVCPluginRemoteInputHost.mm";
                v38 = 1024;
                v39 = 46;
                _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d Unable to create the plugin bundle", buf, 0x12u);
              }
LABEL_36:

              goto LABEL_37;
            }
            v20 = *(id *)kAVVCScope;
            if (v20)
              goto LABEL_30;
LABEL_37:

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (!v8)
          {
LABEL_39:

            return v27;
          }
        }
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "AVVCPluginRemoteInputHost.mm";
      v38 = 1024;
      v39 = 25;
      v40 = 2048;
      v41 = v27;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d *** InitializePlugins *** %p ", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  AVVCPluginRemoteInputHost *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v7 = "AVVCPluginRemoteInputHost.mm";
    v8 = 1024;
    v9 = 55;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d dealloc : releasing all plugins *** %p", buf, 0x1Cu);
  }

LABEL_8:
  v5.receiver = self;
  v5.super_class = (Class)AVVCPluginRemoteInputHost;
  -[AVVCPluginRemoteInputHost dealloc](&v5, sel_dealloc);
}

- (void)invalidatePlugins
{
  NSObject *v3;
  id v4;
  AVAudioRemoteInputPlugin *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  AVVCPluginRemoteInputHost *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  AVVCPluginRemoteInputHost *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "AVVCPluginRemoteInputHost.mm";
    v22 = 1024;
    v23 = 60;
    v24 = 2048;
    v25 = self;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d invalidatePlugins : invalidating all plugins *** %p", buf, 0x1Cu);
  }

LABEL_8:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->mPlugins;
  v6 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v7 = 136315650;
    v14 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(AVVCPluginRemoteInputHost **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (kAVVCScope)
        {
          v12 = *(id *)kAVVCScope;
          if (!v12)
            goto LABEL_20;
        }
        else
        {
          v13 = v9;
          v12 = v9;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v21 = "AVVCPluginRemoteInputHost.mm";
          v22 = 1024;
          v23 = 62;
          v24 = 2048;
          v25 = v11;
          _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -----> calling invalidate on plugin instance %p", buf, 0x1Cu);
        }

LABEL_20:
        -[AVVCPluginRemoteInputHost invalidate](v11, "invalidate", v14, (_QWORD)v15);
      }
      v6 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)allBundles:(id *)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  void *v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLsForDirectory:inDomains:", 5, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v22;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);

        objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Audio/Plug-Ins/RemoteInput/"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        LODWORD(v7) = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v27);
        v9 = v27;
        v10 = v9;
        if (!(_DWORD)v7)
        {
          v4 = v9;
          goto LABEL_24;
        }
        if (kAVVCScope)
        {
          if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
          {
            v11 = *(id *)kAVVCScope;
            if (v11)
            {
              v12 = v11;
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "absoluteString");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v33 = "AVVCPluginRemoteInputHost.mm";
                v34 = 1024;
                v35 = 84;
                v36 = 2112;
                v37 = v13;
                _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Searching plugin path %@", buf, 0x1Cu);

              }
            }
          }
        }
        v26 = v10;
        objc_msgSend(v24, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 4, &v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v26;

        if (v4)
        {
          if (!kAVVCScope)
          {
            v16 = (void *)MEMORY[0x1E0C81028];
            v17 = MEMORY[0x1E0C81028];
            v15 = v16;
LABEL_20:
            v18 = v15;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "absoluteString");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "debugDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v33 = "AVVCPluginRemoteInputHost.mm";
              v34 = 1024;
              v35 = 87;
              v36 = 2112;
              v37 = v19;
              v38 = 2112;
              v39 = v20;
              _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Error enumerating the remote input bundles at %@: %@", buf, 0x26u);

            }
            goto LABEL_23;
          }
          v15 = *(id *)kAVVCScope;
          if (v15)
            goto LABEL_20;
        }
        else
        {
          objc_msgSend(v23, "addObjectsFromArray:", v14);
        }
LABEL_23:

LABEL_24:
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (!v3)
      {

        break;
      }
    }
  }

  return v23;
}

- (id)findDeviceWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  AVAudioRemoteInputPlugin *obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVVCPluginRemoteInputHost_findDeviceWithIdentifier___block_invoke;
  block[3] = &unk_1E3BECBE0;
  block[4] = self;
  if (-[AVVCPluginRemoteInputHost findDeviceWithIdentifier:]::once != -1)
    dispatch_once(&-[AVVCPluginRemoteInputHost findDeviceWithIdentifier:]::once, block);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->mPlugins;
  v5 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (!v5)
  {
LABEL_28:

    if (kAVVCScope)
    {
      v21 = *(id *)kAVVCScope;
      if (!v21)
      {
        v20 = 0;
        goto LABEL_42;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "AVVCPluginRemoteInputHost.mm";
      v39 = 1024;
      v40 = 128;
      v41 = 2112;
      v42 = v4;
      _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot find Remote Input device %@", buf, 0x1Cu);
    }
    v20 = 0;
    goto LABEL_41;
  }
  v26 = *(_QWORD *)v33;
LABEL_5:
  v6 = 0;
  v27 = v5;
  while (1)
  {
    if (*(_QWORD *)v33 != v26)
      objc_enumerationMutation(obj);
    v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "devices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
    if (v9)
      break;
LABEL_24:

LABEL_26:
    if (++v6 == v27)
    {
      v5 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      if (!v5)
        goto LABEL_28;
      goto LABEL_5;
    }
  }
  v10 = *(_QWORD *)v29;
LABEL_10:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v10)
      objc_enumerationMutation(v8);
    v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
    if (v12)
    {
      if (kAVVCScope)
      {
        v13 = *(id *)kAVVCScope;
        if (!v13)
          goto LABEL_21;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
        v13 = v14;
      }
      v16 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "deviceIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v38 = "AVVCPluginRemoteInputHost.mm";
        v39 = 1024;
        v40 = 117;
        v41 = 2048;
        v42 = v12;
        v43 = 2112;
        v44 = v17;
        _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Device(%p). Identifier: %@", buf, 0x26u);

      }
    }
LABEL_21:
    objc_msgSend(v12, "deviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v4);

    if ((v19 & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
      if (v9)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  v20 = v12;

  if (!v12)
    goto LABEL_26;

  if (kAVVCScope)
  {
    v21 = *(id *)kAVVCScope;
    if (!v21)
      goto LABEL_42;
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v38 = "AVVCPluginRemoteInputHost.mm";
    v39 = 1024;
    v40 = 131;
    v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d findDeviceWithIdentifier: found the device %@", buf, 0x1Cu);
  }
LABEL_41:

LABEL_42:
  return v20;
}

- (id)findFirstBluetoothDevice
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  AVAudioRemoteInputPlugin *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->mPlugins;
  v2 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
  if (!v2)
    goto LABEL_25;
  v19 = *(_QWORD *)v27;
  v20 = v2;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v27 != v19)
        objc_enumerationMutation(obj);
      v3 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v3, "devices");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
      if (!v5)
      {
LABEL_21:

        continue;
      }
      v6 = *(_QWORD *)v23;
LABEL_8:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        if (kAVVCScope)
        {
          v9 = *(id *)kAVVCScope;
          if (!v9)
            goto LABEL_18;
        }
        else
        {
          v10 = (void *)MEMORY[0x1E0C81028];
          v11 = MEMORY[0x1E0C81028];
          v9 = v10;
        }
        v12 = v9;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "deviceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "devices");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");
          *(_DWORD *)buf = 136316162;
          v31 = "AVVCPluginRemoteInputHost.mm";
          v32 = 1024;
          v33 = 143;
          v34 = 2048;
          v35 = v8;
          v36 = 2112;
          v37 = v13;
          v38 = 1024;
          v39 = v15;
          _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Device(%p). Identifier: %@ (num devices = %d)", buf, 0x2Cu);

        }
LABEL_18:
        if (objc_msgSend(v8, "deviceCategory") == 1919510644)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
          if (v5)
            goto LABEL_8;
          goto LABEL_21;
        }
      }
      v16 = v8;

      if (v16)
        goto LABEL_26;
    }
    v20 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
  }
  while (v20);
LABEL_25:
  v16 = 0;
LABEL_26:

  return v16;
}

- (void)setParentVoiceController:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVVCPluginRemoteInputHost *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    v9 = 136316162;
    v10 = "AVVCPluginRemoteInputHost.mm";
    v11 = 1024;
    v12 = 156;
    v13 = 2048;
    v14 = self;
    v15 = 2048;
    v16 = WeakRetained;
    v17 = 2048;
    v18 = v4;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) oldController(%p) newController(%p)", (uint8_t *)&v9, 0x30u);

  }
LABEL_8:
  objc_storeWeak((id *)&self->_mMotherController, v4);

}

- (void)inputPlugin:(id)a3 didPublishDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  AVVoiceController **p_mMotherController;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  id v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  _BYTE v27[18];
  __int16 v28;
  AVVCPluginRemoteInputHost *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    objc_msgSend(v7, "deviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 136316674;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 162;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = WeakRetained;
    v32 = 2048;
    v33 = v6;
    v34 = 2048;
    v35 = v7;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p) plugin(%p), did publish device(%p) with id(%@)", v27, 0x44u);

  }
LABEL_8:
  if (v7)
  {
    p_mMotherController = &self->_mMotherController;
    v14 = objc_loadWeakRetained((id *)&self->_mMotherController);
    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)p_mMotherController);
      objc_msgSend(v15, "impl");
      if (*(_BYTE *)(*(_QWORD *)v27 + 520))
      {
        v16 = 0;
      }
      else
      {
        v18 = objc_loadWeakRetained((id *)p_mMotherController);
        v16 = objc_opt_respondsToSelector();

      }
      v19 = *(std::__shared_weak_count **)&v27[8];
      if (*(_QWORD *)&v27[8])
      {
        v20 = (unint64_t *)(*(_QWORD *)&v27[8] + 8);
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)p_mMotherController);
        -[NSObject handlePluginDidPublishDevice:withDevice:](v17, "handlePluginDidPublishDevice:withDevice:", v6, v7);
        goto LABEL_33;
      }
    }
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17)
        goto LABEL_34;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_DWORD *)v27 = 136315394;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 170;
    v23 = "%25s:%-5d WARNING: Not forwarding didPublish event to AVVC parent because it does not exist, or is deallocating.";
    v24 = v17;
    v25 = OS_LOG_TYPE_DEFAULT;
LABEL_32:
    _os_log_impl(&dword_19B733000, v24, v25, v23, v27, 0x12u);
    goto LABEL_33;
  }
  if (kAVVCScope)
  {
    v17 = *(id *)kAVVCScope;
    if (!v17)
      goto LABEL_34;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 136315394;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 164;
    v23 = "%25s:%-5d ERROR: Received didPublishDevice with 'nil' device. Not forwarding event to AVVC parent.";
    v24 = v17;
    v25 = OS_LOG_TYPE_ERROR;
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
}

- (void)inputPlugin:(id)a3 didUnpublishDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  AVVoiceController **p_mMotherController;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  id v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  _BYTE v27[18];
  __int16 v28;
  AVVCPluginRemoteInputHost *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    objc_msgSend(v7, "deviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 136316674;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 176;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = WeakRetained;
    v32 = 2048;
    v33 = v6;
    v34 = 2048;
    v35 = v7;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p) plugin(%p), did UNpublish device(%p) with id(%@)", v27, 0x44u);

  }
LABEL_8:
  if (v7)
  {
    p_mMotherController = &self->_mMotherController;
    v14 = objc_loadWeakRetained((id *)&self->_mMotherController);
    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)p_mMotherController);
      objc_msgSend(v15, "impl");
      if (*(_BYTE *)(*(_QWORD *)v27 + 520))
      {
        v16 = 0;
      }
      else
      {
        v18 = objc_loadWeakRetained((id *)p_mMotherController);
        v16 = objc_opt_respondsToSelector();

      }
      v19 = *(std::__shared_weak_count **)&v27[8];
      if (*(_QWORD *)&v27[8])
      {
        v20 = (unint64_t *)(*(_QWORD *)&v27[8] + 8);
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)p_mMotherController);
        -[NSObject handlePluginDidUnpublishDevice:withDevice:](v17, "handlePluginDidUnpublishDevice:withDevice:", v6, v7);
        goto LABEL_33;
      }
    }
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17)
        goto LABEL_34;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_DWORD *)v27 = 136315394;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 184;
    v23 = "%25s:%-5d WARNING: Not forwarding didUNpublish event to AVVC parent because it does not exist, or is deallocating.";
    v24 = v17;
    v25 = OS_LOG_TYPE_DEFAULT;
LABEL_32:
    _os_log_impl(&dword_19B733000, v24, v25, v23, v27, 0x12u);
    goto LABEL_33;
  }
  if (kAVVCScope)
  {
    v17 = *(id *)kAVVCScope;
    if (!v17)
      goto LABEL_34;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 136315394;
    *(_QWORD *)&v27[4] = "AVVCPluginRemoteInputHost.mm";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 178;
    v23 = "%25s:%-5d ERROR: Received didUNpublishDevice with 'nil' device. Not forwarding event to AVVC parent.";
    v24 = v17;
    v25 = OS_LOG_TYPE_ERROR;
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
}

- (id)mockPluginEndpoint
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  AVAudioRemoteInputPlugin *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v14;
  AVVCPluginRemoteInputHost *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  AVVCPluginRemoteInputHost *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mMotherController);
    *(_DWORD *)buf = 136315906;
    v24 = "AVVCPluginRemoteInputHost.mm";
    v25 = 1024;
    v26 = 192;
    v27 = 2048;
    v28 = self;
    v29 = 2048;
    v30 = WeakRetained;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d self(%p) controller(%p)", buf, 0x26u);

  }
LABEL_8:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->mPlugins;
  v8 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
LABEL_10:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE4001A8, (_QWORD)v18))
        break;
      if (v8 == ++v10)
      {
        v8 = -[AVAudioRemoteInputPlugin countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    v14 = v11;
    objc_msgSend(v14, "mockPluginEndpoint");
    v15 = (AVVCPluginRemoteInputHost *)objc_claimAutoreleasedReturnValue();

    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        return v15;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "AVVCPluginRemoteInputHost.mm";
      v25 = 1024;
      v26 = 209;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mock plugin endpoint (%@)", buf, 0x1Cu);
    }
  }
  else
  {
LABEL_16:

    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        return 0;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "AVVCPluginRemoteInputHost.mm";
      v25 = 1024;
      v26 = 206;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d couldn't find mock plugin", buf, 0x12u);
    }
    v15 = 0;
  }

  return v15;
}

- (AVVoiceController)mMotherController
{
  return (AVVoiceController *)objc_loadWeakRetained((id *)&self->_mMotherController);
}

- (void)setMMotherController:(id)a3
{
  objc_storeWeak((id *)&self->_mMotherController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mMotherController);
  objc_storeStrong((id *)&self->mPlugins, 0);
}

void __54__AVVCPluginRemoteInputHost_findDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t j;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id obj;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
  if (v14)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v1 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v1, "devices");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
        if (v3)
        {
          v4 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v3; ++j)
            {
              if (*(_QWORD *)v17 != v4)
                objc_enumerationMutation(v2);
              v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if (kAVVCScope)
              {
                v7 = *(id *)kAVVCScope;
                if (!v7)
                  continue;
              }
              else
              {
                v8 = (void *)MEMORY[0x1E0C81028];
                v9 = MEMORY[0x1E0C81028];
                v7 = v8;
              }
              v10 = v7;
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v6, "deviceIdentifier");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136316162;
                v25 = "AVVCPluginRemoteInputHost.mm";
                v26 = 1024;
                v27 = 106;
                v28 = 2048;
                v29 = v1;
                v30 = 2048;
                v31 = v6;
                v32 = 2112;
                v33 = v11;
                _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d plugin(%p) - device(%p) - id: %@", buf, 0x30u);

              }
            }
            v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
          }
          while (v3);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    }
    while (v14);
  }

}

@end
