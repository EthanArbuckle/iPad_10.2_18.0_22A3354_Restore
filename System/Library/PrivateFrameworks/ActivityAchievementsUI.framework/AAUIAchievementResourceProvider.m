@implementation AAUIAchievementResourceProvider

void __65__AAUIAchievementResourceProvider_badgeModelPathsForAchievement___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a1[4];
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v2)
  {
    v4 = v2;
    v5 = 0;
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v3 = 138412546;
    v18 = v3;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(a1[5], "objectAtIndexedSubscript:", v8 + v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByDeletingLastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(a1[6], "_queue_decompressZipFileAtPath:toDirectory:", v12, v13)
            || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "fileExistsAtPath:", v9),
                v14,
                (v15 & 1) == 0))
          {
            ACHLogAssets();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(a1[7], "template");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "uniqueName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v18;
              v26 = v17;
              v27 = 2112;
              v28 = v12;
              _os_log_error_impl(&dword_21CC08000, v16, OS_LOG_TYPE_ERROR, "Error decompressing model for achievement %@ at path %@", buf, 0x16u);

            }
          }

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v5 = v8 + v7;
    }
    while (v4);
  }

}

uint64_t __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDD1580];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

uint64_t __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "pathForResource:ofType:", *(_QWORD *)(a1 + 40), a2);
}

- (AAUIAchievementResourceProvider)init
{
  AAUIAchievementResourceProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIAchievementResourceProvider;
  v2 = -[AAUIAchievementResourceProvider init](&v6, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)badgeConfigurationForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  AAUIBadgeModelConfiguration *v28;
  void *v29;
  uint64_t v30;
  char v31;
  AAUIBadgeModelConfiguration *v32;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AAUIAchievementResourceProvider badgeModelPathsForAchievement:](self, "badgeModelPathsForAchievement:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider texturePathsForAchievement:](self, "texturePathsForAchievement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider glyphTexturePathForAchievement:](self, "glyphTexturePathForAchievement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider metalColorForAchievement:](self, "metalColorForAchievement:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider enamelColorForAchievement:](self, "enamelColorForAchievement:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider glyphTextureScaleForAchievement:](self, "glyphTextureScaleForAchievement:", v4);
  v10 = v9;
  -[AAUIAchievementResourceProvider glyphPositionOffsetScaleForAchievement:](self, "glyphPositionOffsetScaleForAchievement:", v4);
  v12 = v11;
  v14 = v13;
  if (objc_msgSend(v4, "badgeUsesTriColorEnamel"))
  {
    objc_msgSend(v4, "enamelTriColor1");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v15, v16, v17, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    objc_msgSend(v4, "enamelTriColor2");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v19, v20, v21, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v22;
    objc_msgSend(v4, "enamelTriColor3");
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v23, v24, v25, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  v28 = [AAUIBadgeModelConfiguration alloc];
  objc_msgSend(v4, "badgeShapeName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "badgeUsesFullColorEnamel");
  v31 = objc_msgSend(v4, "unearnedUsesTwoToneEnamel");
  BYTE1(v34) = objc_msgSend(v4, "faceHasMetalInlay");
  LOBYTE(v34) = v31;
  v32 = -[AAUIBadgeModelConfiguration initWithModelPaths:texturePaths:shapeName:metalColor:useFullColorEnamel:modelEnamelColor:unearnedUsesTwoToneEnamel:faceHasMetalInlay:enamelTricolors:glyphTexturePath:glyphTextureScale:glyphPositionOffset:](v28, "initWithModelPaths:texturePaths:shapeName:metalColor:useFullColorEnamel:modelEnamelColor:unearnedUsesTwoToneEnamel:faceHasMetalInlay:enamelTricolors:glyphTexturePath:glyphTextureScale:glyphPositionOffset:", v35, v5, v29, v7, v30, v8, v10, v12, v14, v34, v27, v6);

  return v32;
}

- (id)metalColorForAchievement:(id)a3
{
  float v3;
  float v4;
  float v5;

  objc_msgSend(a3, "badgeMetalColor");
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v3, v4, v5, 1.0);
}

- (double)glyphTextureScaleForAchievement:(id)a3
{
  double result;

  objc_msgSend(a3, "glyphTextureScale");
  return result;
}

- (id)glyphTexturePathForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "glyphTextureFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16[0] = CFSTR("png");
    v16[1] = CFSTR("png.pvrtc");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementResourceProvider _assetBundleForAchievement:](self, "_assetBundleForAchievement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke;
    v13[3] = &unk_24E0B2C60;
    v14 = v7;
    v15 = v5;
    v8 = v7;
    objc_msgSend(v6, "hk_map:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_firstObjectPassingTest:", &__block_literal_global_198);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      ACHLogAssets();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AAUIAchievementResourceProvider glyphTexturePathForAchievement:].cold.1(v4, v11);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGPoint)glyphPositionOffsetScaleForAchievement:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "glyphPositionOffsetX");
  v5 = v4;
  objc_msgSend(v3, "glyphPositionOffsetY");
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)enamelColorForAchievement:(id)a3
{
  float v3;
  float v4;
  float v5;

  objc_msgSend(a3, "badgeEnamelColor");
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v3, v4, v5, 1.0);
}

- (id)badgeModelPathsForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *queue;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  AAUIAchievementResourceProvider *v16;
  id v17;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  -[AAUIAchievementResourceProvider _compressedBadgeModelPathsForAchievement:](self, "_compressedBadgeModelPathsForAchievement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider _modelFilePathsForCompressedModelPaths:andAchievement:](self, "_modelFilePathsForCompressedModelPaths:andAchievement:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v5, "count"))
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__AAUIAchievementResourceProvider_badgeModelPathsForAchievement___block_invoke;
    v13[3] = &unk_24E0B2C38;
    v9 = v6;
    v14 = v9;
    v15 = v5;
    v16 = self;
    v17 = v4;
    dispatch_sync(queue, v13);
    v10 = v9;

  }
  else
  {
    ACHLogAssets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAUIAchievementResourceProvider badgeModelPathsForAchievement:].cold.1(v4, v11);

    v10 = (id)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

- (id)_modelFilePathsForCompressedModelPaths:(id)a3 andAchievement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AAUIAchievementResourceProvider _badgeModelFilenames:](self, "_badgeModelFilenames:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementResourceProvider _modelDirectoryForCompressedModelPaths:andAchievement:](self, "_modelDirectoryForCompressedModelPaths:andAchievement:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v10, "copy");
  return v17;
}

- (id)_modelDirectoryForCompressedModelPaths:(id)a3 andAchievement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  -[AAUIAchievementResourceProvider _cachedModelsPath](self, "_cachedModelsPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsJoinedByString:", &stru_24E0B4958);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = objc_msgSend(v10, "hash");
  if (v12 >= 0)
    v13 = v12;
  else
    v13 = -v12;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%d"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "template");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "badgeModelVersion");

  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%@_v%ld"), v17, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_compressedBadgeModelPathsForAchievement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "badgeModelFilenames");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24E0BAB00;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v23 = v4;
  -[AAUIAchievementResourceProvider _assetBundleForAchievement:](self, "_assetBundleForAchievement:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v27;
    *(_QWORD *)&v13 = 138412546;
    v22 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "pathForResource:ofType:", v17, CFSTR("bdg.zip"), v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v10, "addObject:", v18);
        }
        else
        {
          ACHLogAssets();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "template");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "uniqueName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v31 = v24;
            v32 = 2112;
            v33 = v17;
            _os_log_error_impl(&dword_21CC08000, v19, OS_LOG_TYPE_ERROR, "Could not determined compressedBadgeModelPath for achievement: %@, assetName = %@", buf, 0x16u);

          }
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v14);
  }

  v20 = (void *)objc_msgSend(v10, "copy");
  return v20;
}

- (id)texturePathsForAchievement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "textureFilenames");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24E0BAAB8;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v38[0] = CFSTR("png");
  v38[1] = CFSTR("png.pvrtc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  -[AAUIAchievementResourceProvider _assetBundleForAchievement:](self, "_assetBundleForAchievement:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke;
        v26[3] = &unk_24E0B2C60;
        v27 = v10;
        v28 = v16;
        objc_msgSend(v9, "hk_map:", v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_firstObjectPassingTest:", &__block_literal_global_0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v11, "addObject:", v18);
        }
        else
        {
          ACHLogAssets();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v22, "template");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "uniqueName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v34 = v23;
            v35 = 2112;
            v36 = v16;
            _os_log_error_impl(&dword_21CC08000, v19, OS_LOG_TYPE_ERROR, "Error loading badge texture for achievement %@ with asset name %@", buf, 0x16u);

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v13);
  }

  v20 = (void *)objc_msgSend(v11, "copy");
  return v20;
}

- (id)_assetBundleForAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "resourceBundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v3, "resourceBundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ACHLogAssets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_21CC08000, v8, OS_LOG_TYPE_DEFAULT, "resourceBundleURL is nil for achievement: %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_cachedModelsPath
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AchievementBadgeModels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_badgeModelFilenames:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "badgeModelFilenames");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_24E0BAAE8;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bdg"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

uint64_t __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "pathForResource:ofType:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDD1580];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

- (id)stickersBundlePathForAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "stickerBundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v3, "stickerBundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "resourcePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)stickerURLsForAchievement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v3, "stickerBundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = objc_msgSend(&unk_24E0BAAD0, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          v13 = v4;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(&unk_24E0BAAD0);
            objc_msgSend(v8, "URLsForResourcesWithExtension:subdirectory:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setByAddingObjectsFromArray:", v14);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            ++v12;
            v13 = v4;
          }
          while (v10 != v12);
          v10 = objc_msgSend(&unk_24E0BAAD0, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }
    }
    v15 = v4;

  }
  else
  {
    v15 = v4;
  }

  return v15;
}

- (id)backSideIconImageForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  -[AAUIAchievementResourceProvider _assetBundleForAchievement:](self, "_assetBundleForAchievement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("Icon"), CFSTR("png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
      queue = self->_queue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __67__AAUIAchievementResourceProvider_backSideIconImageForAchievement___block_invoke;
      v16[3] = &unk_24E0B2CE8;
      v17 = v7;
      v18 = &v19;
      dispatch_sync(queue, v16);

    }
  }
  v9 = (void *)v20[5];
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("badge_back_apple_logo"), v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v20[5];
    v20[5] = v12;

    v9 = (void *)v20[5];
  }
  v14 = v9;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __67__AAUIAchievementResourceProvider_backSideIconImageForAchievement___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "length");
    v5 = v7;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

      v5 = v7;
    }

  }
}

- (BOOL)_queue_decompressZipFileAtPath:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v10 = *MEMORY[0x24BDBD270];
    v15[0] = CFSTR("extractPKZip");
    v15[1] = CFSTR("sequesterResources");
    v16[0] = v10;
    v16[1] = v10;
    v15[2] = CFSTR("copyResources");
    v16[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOMCopierNew();
    v12 = BOMCopierCopyWithOptions();
    BOMCopierFree();
    v13 = v12 == 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)badgeModelPathsForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_21CC08000, a2, OS_LOG_TYPE_ERROR, "Error decompressing model for achievement %@: compressed/decompressed model files mismatch", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)glyphTexturePathForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = 0;
  _os_log_error_impl(&dword_21CC08000, a2, OS_LOG_TYPE_ERROR, "Error loading badge texture for achievement %@ at path %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

@end
