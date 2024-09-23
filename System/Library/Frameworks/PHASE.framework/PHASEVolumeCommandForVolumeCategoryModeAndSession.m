@implementation PHASEVolumeCommandForVolumeCategoryModeAndSession

- (PHASEVolumeCommandForVolumeCategoryModeAndSession)initWithCategory:(id)a3 mode:(id)a4 sessionToken:(unsigned int)a5
{
  id v8;
  Phase::Logger *v9;
  Phase::Logger *v10;
  _DWORD *v11;
  PHASEVolumeCommandForVolumeCategoryModeAndSession *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (Phase::Logger *)a4;
  v10 = v9;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASEVolumeCommandForVolumeCategoryModeAndSession;
    v11 = -[PHASEVolumeCommandForVolumeCategoryMode initInternalWithCategory:mode:](&v15, sel_initInternalWithCategory_mode_, v8, v9);
    if (v11)
      v11[8] = a5;
    self = v11;
    v12 = self;
  }
  else
  {
    v13 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 432));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "PHASESessionVolume.mm";
      v18 = 1024;
      v19 = 195;
      v20 = 1024;
      v21 = 0;
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid audio session token 0x%x", buf, 0x18u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PHASEVolumeCommandForVolumeCategoryMode volumeCategory](self, "volumeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  -[PHASEVolumeCommandForVolumeCategoryMode volumeMode](self, "volumeMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("VolumeCommandForVolumeCategoryModeAndSession: category/mode [%s, %s], session 0x%x"), v6, objc_msgSend(v8, "UTF8String"), self->_audioSessionToken);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

@end
