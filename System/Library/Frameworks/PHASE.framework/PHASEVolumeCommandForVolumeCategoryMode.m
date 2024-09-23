@implementation PHASEVolumeCommandForVolumeCategoryMode

- (id)initInternalWithCategory:(id)a3 mode:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHASEVolumeCommandForVolumeCategoryMode;
  v9 = -[PHASEVolumeCommand initInternal](&v12, sel_initInternal);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong(v10 + 2, a4);
  }

  return v10;
}

- (PHASEVolumeCommandForVolumeCategoryMode)initWithCategory:(id)a3 mode:(id)a4 volume:(id)a5
{
  id v8;
  Phase::Logger *v9;
  Phase::Logger *v10;
  PHASEVolumeCommandForVolumeCategoryMode *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (Phase::Logger *)a4;
  v10 = v9;
  if (a5)
  {
    self = (PHASEVolumeCommandForVolumeCategoryMode *)-[PHASEVolumeCommandForVolumeCategoryMode initInternalWithCategory:mode:](self, "initInternalWithCategory:mode:", v8, v9);
    v11 = self;
  }
  else
  {
    v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9) + 432));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "PHASESessionVolume.mm";
      v16 = 1024;
      v17 = 164;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid volume argument", (uint8_t *)&v14, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v2;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  PHASESessionVolume *volume;
  const char *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[NSString description](self->_volumeCategory, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  -[NSString description](self->_volumeMode, "description");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "UTF8String");
  volume = self->_volume;
  if (volume)
  {
    -[PHASESessionVolume description](volume, "description");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v2, "UTF8String");
  }
  else
  {
    v10 = "-";
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("VolumeCommandForVolumeCategoryMode: category/mode [%s, %s], volume %s"), v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (volume)

  return v11;
}

- (NSString)volumeCategory
{
  return self->_volumeCategory;
}

- (NSString)volumeMode
{
  return self->_volumeMode;
}

- (PHASESessionVolume)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_volumeMode, 0);
  objc_storeStrong((id *)&self->_volumeCategory, 0);
}

@end
