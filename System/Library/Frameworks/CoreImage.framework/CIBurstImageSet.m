@implementation CIBurstImageSet

+ (id)burstImageSet
{
  return objc_alloc_init(CIBurstImageSet);
}

+ (id)burstImageSetWithOptions:(id)a3
{
  return -[CIBurstImageSet initWithOptions:]([CIBurstImageSet alloc], "initWithOptions:", a3);
}

- (void)dealloc
{
  CIBurstImageSetInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)

  v4.receiver = self;
  v4.super_class = (Class)CIBurstImageSet;
  -[CIBurstImageSet dealloc](&v4, sel_dealloc);
}

- (CIBurstImageSet)init
{
  CIBurstImageSet *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CIBurstImageSet;
  v2 = -[CIBurstImageSet init](&v4, sel_init);
  if (v2)
    v2->_priv = -[CIBurstImageSetInternal initWithOptions:]([CIBurstImageSetInternal alloc], "initWithOptions:", 0);
  return v2;
}

- (CIBurstImageSet)initWithOptions:(id)a3
{
  CIBurstImageSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIBurstImageSet;
  v4 = -[CIBurstImageSet init](&v6, sel_init);
  if (v4)
    v4->_priv = -[CIBurstImageSetInternal initWithOptions:]([CIBurstImageSetInternal alloc], "initWithOptions:", a3);
  return v4;
}

+ (id)defaultVersionString
{
  return +[CIBurstImageSetInternal defaultVersionString](CIBurstImageSetInternal, "defaultVersionString");
}

- (id)burstId
{
  return -[CIBurstImageSetInternal burstId](self->_priv, "burstId");
}

- (void)addImageFromIOSurface:(__IOSurface *)a3 properties:(id)a4 identifier:(id)a5 completionBlock:(id)a6
{
  -[CIBurstImageSetInternal addImageFromIOSurface:properties:identifier:completionBlock:](self->_priv, "addImageFromIOSurface:properties:identifier:completionBlock:", a3, a4, a5, a6);
}

- (id)bestImageIdentifiers
{
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  NSString *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[CIBurstImageSetInternal bestImageIdentifiersArray](self->_priv, "bestImageIdentifiersArray")
    && -[NSArray count](-[CIBurstImageSetInternal bestImageIdentifiersArray](self->_priv, "bestImageIdentifiersArray"), "count"))
  {
    return -[CIBurstImageSetInternal bestImageIdentifiersArray](self->_priv, "bestImageIdentifiersArray");
  }
  -[CIBurstImageSet secondsSinceStart](self, "secondsSinceStart");
  v5 = v4;
  v6 = -[CIBurstImageSetInternal bestImageIdentifiers](self->_priv, "bestImageIdentifiers");
  if (-[CIBurstImageSetInternal burstLogFileName](self->_priv, "burstLogFileName"))
  {
    v21 = (void *)MEMORY[0x194026220]();
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5), CFSTR("BurstSet_TimeDoneCapturing"));
    v22 = v6;
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[CIBurstImageSet secondsSinceStart](self, "secondsSinceStart");
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v9, "numberWithDouble:"), CFSTR("BurstSet_TimeDone"));
    objc_msgSend(v7, "setObject:forKey:", v8, kBurstDoc_BestImageIds[0]);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[CIBurstImageSet allImageIdentifiers](self, "allImageIdentifiers"));
    objc_msgSend(v7, "setObject:forKey:", v10, kBurstDoc_AllImageIdentifiers[0]);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v17 = -[CIBurstImageSet statsForImageWithIdentifier:](self, "statsForImageWithIdentifier:", v16);
          if (v17)
            objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v17), v16);
          else
            puts("   initWithBurstImageSet - Error: stats not found");
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }
    objc_msgSend(v7, "setObject:forKey:", v11, kBurstDoc_AllImageStats[0]);
    if (-[CIBurstImageSetInternal burstLogFileName](self->_priv, "burstLogFileName"))
    {
      v18 = -[CIBurstImageSetInternal burstLogFileName](self->_priv, "burstLogFileName");
      objc_msgSend(v7, "setObject:forKey:", v18, kBurstDoc_LogFile[0]);
    }
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIBurstImageSetInternal maxNumPendingFrames](self->_priv, "maxNumPendingFrames")), CFSTR("BurstSet_Setting_MaxNumPendingFrames"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal enableAnalysis](self->_priv, "enableAnalysis") ^ 1), CFSTR("BurstSet_Setting_DisableAnalysis"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal enableFaceCore](self->_priv, "enableFaceCore") ^ 1), CFSTR("BurstSet_Setting_DisableFaceCore"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIBurstImageSetInternal dummyAnalysisCount](self->_priv, "dummyAnalysisCount")), CFSTR("BurstSet_Setting_DummyAnalysisCount"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal isFaceDetectionForced](self->_priv, "isFaceDetectionForced")), CFSTR("BurstSet_Setting_ForceFaceDetection"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal enableDumpYUV](self->_priv, "enableDumpYUV")), CFSTR("BurstSet_Setting_EnableDumpYUV"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal isAction](self->_priv, "isAction")), CFSTR("BurstSet_IsAction"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CIBurstImageSetInternal isPortrait](self->_priv, "isPortrait")), CFSTR("BurstSet_IsPortrait"));
    v19 = objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](self->_priv, "burstDocumentDirectory"), "stringByAppendingPathExtension:", CFSTR("xml"));
    if (-[CIBurstImageSetInternal burstCoverSelection](self->_priv, "burstCoverSelection"))
      v20 = -[CIBurstImageSetInternal burstCoverSelection](self->_priv, "burstCoverSelection");
    else
      v20 = CFSTR("nil");
    v6 = v22;
    objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("BurstSet_CoverImage"));
    objc_msgSend(v7, "writeToFile:atomically:", v19, 1);
    objc_autoreleasePoolPop(v21);
  }
  return v6;
}

- (id)coverImageIdentifier
{
  id result;
  uint64_t v4;
  void *v5;
  const __CFString *v6;

  result = (id)objc_msgSend(-[CIBurstImageSet bestImageIdentifiers](self, "bestImageIdentifiers"), "count");
  if (result)
  {
    if (-[CIBurstImageSetInternal burstLogFileName](self->_priv, "burstLogFileName"))
    {
      v4 = objc_msgSend(-[CIBurstImageSetInternal burstDocumentDirectory](self->_priv, "burstDocumentDirectory"), "stringByAppendingPathExtension:", CFSTR("xml"));
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v4);
      if (-[CIBurstImageSetInternal burstCoverSelection](self->_priv, "burstCoverSelection"))
        v6 = -[CIBurstImageSetInternal burstCoverSelection](self->_priv, "burstCoverSelection");
      else
        v6 = CFSTR("nil");
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("BurstSet_CoverImage"));
    }
    return -[CIBurstImageSetInternal burstCoverSelection](self->_priv, "burstCoverSelection");
  }
  return result;
}

- (id)imageClusterForIdentifier:(id)a3
{
  return -[CIBurstImageSetInternal imageClusterForIdentifier:](self->_priv, "imageClusterForIdentifier:", a3);
}

- (unint64_t)imageClusterCount
{
  return -[NSMutableArray count](-[CIBurstImageSetInternal clusterArray](self->_priv, "clusterArray"), "count");
}

- (id)imageClusterForIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray objectAtIndex:](-[CIBurstImageSetInternal clusterArray](self->_priv, "clusterArray"), "objectAtIndex:", a3);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "burstImages"), "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_msgSend(v4, "burstImages", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "imageId"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)allImageIdentifiers
{
  return -[CIBurstImageSetInternal allImageIdentifiers](self->_priv, "allImageIdentifiers");
}

- (id)statsForImageWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](-[CIBurstImageSetInternal statsByImageIdentifier](self->_priv, "statsByImageIdentifier"), "objectForKey:", a3);
}

- (void)setLoggingListener:(void *)a3 withUserInfo:(void *)a4
{
  size_t v4;
  char v5[64];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 64;
  BurstLoggingSetCallback(a3, (uint64_t)a4);
  sysctlbyname("kern.osversion", v5, &v4, 0, 0);
  BurstLoggingMessage("BURST ANALYSIS VERSION = %s (%s)\n", (const char *)objc_msgSend((id)kCIBurstImageSet_VersionString, "UTF8String"), v5);
}

- (BOOL)isPortrait
{
  return -[CIBurstImageSetInternal isPortrait](self->_priv, "isPortrait");
}

- (BOOL)isAction
{
  return -[CIBurstImageSetInternal isAction](self->_priv, "isAction");
}

@end
