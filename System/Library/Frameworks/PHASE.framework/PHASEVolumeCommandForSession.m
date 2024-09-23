@implementation PHASEVolumeCommandForSession

- (id)initInternalWithSessionToken:(unsigned int)a3 volume:(id)a4
{
  Phase::Logger *v7;
  Phase::Logger *v8;
  id *v9;
  id *v10;
  PHASEVolumeCommandForSession *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (Phase::Logger *)a4;
  v8 = v7;
  if (a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)PHASEVolumeCommandForSession;
    v9 = -[PHASEVolumeCommand initInternal](&v14, sel_initInternal);
    v10 = v9;
    if (v9)
    {
      *((_DWORD *)v9 + 2) = a3;
      objc_storeStrong(v9 + 2, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "PHASESessionVolume.mm";
      v17 = 1024;
      v18 = 84;
      v19 = 1024;
      v20 = 0;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid audio session token 0x%x", buf, 0x18u);
    }
    v11 = 0;
  }

  return v11;
}

- (PHASEVolumeCommandForSession)initWithSessionToken:(unsigned int)a3
{
  return (PHASEVolumeCommandForSession *)-[PHASEVolumeCommandForSession initInternalWithSessionToken:volume:](self, "initInternalWithSessionToken:volume:", *(_QWORD *)&a3, 0);
}

- (id)description
{
  id v2;
  void *v3;
  uint64_t audioSessionToken;
  PHASESessionVolume *volume;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  audioSessionToken = self->_audioSessionToken;
  volume = self->_volume;
  if (volume)
  {
    -[PHASESessionVolume description](self->_volume, "description");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v2, "UTF8String");
  }
  else
  {
    v6 = "-";
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("VolumeCommandForSession: session 0x%x, volume %s"), audioSessionToken, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (volume)

  return v7;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (PHASESessionVolume)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
}

@end
