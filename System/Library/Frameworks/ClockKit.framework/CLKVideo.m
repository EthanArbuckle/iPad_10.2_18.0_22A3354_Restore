@implementation CLKVideo

+ (id)videoNamed:(id)a3 forDevice:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKVideo videoNamed:forDevice:inBundle:](CLKVideo, "videoNamed:forDevice:inBundle:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:forDevice:url:", self->_name, self->_device, self->_url);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> name = %@, url = %@>"), objc_opt_class(), self, self->_name, self->_url);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)_videoNamed:(id)a3 device:(id)a4 bundle:(id)a5 modifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (_videoNamed_device_bundle_modifier__onceToken != -1)
    dispatch_once(&_videoNamed_device_bundle_modifier__onceToken, &__block_literal_global_17);
  objc_msgSend(v9, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = (id)_videoNamed_device_bundle_modifier__movieExtensions;
  v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(v11, "URLForResource:withExtension:", v13, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), (_QWORD)v21);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          +[CLKVideo videoWithName:forDevice:url:](CLKVideo, "videoWithName:forDevice:url:", v9, v10, v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_13:

  return v15;
}

void __56__CLKVideo_private___videoNamed_device_bundle_modifier___block_invoke()
{
  void *v0;

  v0 = (void *)_videoNamed_device_bundle_modifier__movieExtensions;
  _videoNamed_device_bundle_modifier__movieExtensions = (uint64_t)&unk_24CC181C0;

}

+ (id)videoNamed:(id)a3 forDevice:(id)a4 inBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&videoNamed_forDevice_inBundle____lock);
  WeakRetained = objc_loadWeakRetained(&videoNamed_forDevice_inBundle____cachedDevice);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained(&videoNamed_forDevice_inBundle____cachedDevice);
    if (v13 == v9)
    {
      v14 = objc_msgSend(v9, "version");
      v15 = videoNamed_forDevice_inBundle____previousCLKDeviceVersion;

      if (v14 == v15)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v16 = objc_storeWeak(&videoNamed_forDevice_inBundle____cachedDevice, v9);
  videoNamed_forDevice_inBundle____previousCLKDeviceVersion = objc_msgSend(v9, "version");

  __51__CLKVideo_private__videoNamed_forDevice_inBundle___block_invoke(v17, v9);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&videoNamed_forDevice_inBundle____lock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = (id)videoNamed_forDevice_inBundle__fileModifiers;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    while (2)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "_videoNamed:device:bundle:modifier:", v8, v9, v10, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), (_QWORD)v26);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          goto LABEL_16;
        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_16:

  return v24;
}

void __51__CLKVideo_private__videoNamed_forDevice_inBundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(a2, "sizeClass");
  _AssetBundleSuffixesForSizeClass();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)videoNamed_forDevice_inBundle__fileModifiers;
  videoNamed_forDevice_inBundle__fileModifiers = v2;

}

+ (CLKVideo)videoWithName:(id)a3 forDevice:(id)a4 url:(id)a5
{
  id v7;
  id v8;
  id v9;
  CLKVideo *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CLKVideo initWithName:forDevice:url:]([CLKVideo alloc], "initWithName:forDevice:url:", v9, v8, v7);

  return v10;
}

+ (id)videoAtURL:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  CLKVideo *v7;
  void *v8;
  CLKVideo *v9;

  v5 = a4;
  v6 = a3;
  v7 = [CLKVideo alloc];
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLKVideo initWithName:forDevice:url:](v7, "initWithName:forDevice:url:", v8, v5, v6);

  return v9;
}

- (CLKVideo)initWithName:(id)a3 forDevice:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLKVideo *v11;
  uint64_t v12;
  NSString *name;
  CLKVideo *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKVideo;
  v11 = -[CLKVideo init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_device, a4);
    objc_storeStrong((id *)&v11->_url, a5);
    v14 = v11;
  }

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

@end
