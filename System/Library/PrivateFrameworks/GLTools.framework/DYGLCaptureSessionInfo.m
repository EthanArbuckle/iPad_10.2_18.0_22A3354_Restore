@implementation DYGLCaptureSessionInfo

+ (DYGLCaptureSessionInfo)captureSessionInfoWithCaptureStore:(id)a3
{
  return (DYGLCaptureSessionInfo *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCaptureStore:", a3);
}

- (DYGLCaptureSessionInfo)initWithCaptureStore:(id)a3
{
  DYGLCaptureSessionInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYGLCaptureSessionInfo;
  v4 = -[DYCaptureSessionInfo initWithCaptureStore:](&v6, sel_initWithCaptureStore_);
  if (v4)
  {
    v4->_wasCheckingGLErrors = objc_msgSend((id)objc_msgSend(a3, "metadataValueForKey:", *MEMORY[0x24BE39300]), "BOOLValue");
    v4->_contextsInfo = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", *MEMORY[0x24BE38FB8], 0), "decodeArchivedObject");
    v4->_requiredExtensions = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "openFileWithFilename:error:", *MEMORY[0x24BE38FC0], 0), "decodeSerializedPropertyListWithOptions:error:", 0, 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYGLCaptureSessionInfo;
  -[DYCaptureSessionInfo dealloc](&v3, sel_dealloc);
}

- (id)contextInfoForContext:(unint64_t)a3
{
  NSArray *contextsInfo;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  contextsInfo = self->_contextsInfo;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](contextsInfo, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(contextsInfo);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (objc_msgSend(v9, "identifier") == a3)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](contextsInfo, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

- (BOOL)canPlaybackOnDeviceWithInfo:(id)a3 limitBackwardsCompatibility:(BOOL)a4 isInternal:(BOOL)a5
{
  objc_super v6;
  _QWORD v7[6];

  v7[1] = 3221225472;
  v7[2] = __93__DYGLCaptureSessionInfo_canPlaybackOnDeviceWithInfo_limitBackwardsCompatibility_isInternal___block_invoke;
  v7[3] = &unk_250D4E2B0;
  v7[4] = self;
  v7[5] = a3;
  v6.receiver = self;
  v6.super_class = (Class)DYGLCaptureSessionInfo;
  v7[0] = MEMORY[0x24BDAC760];
  return -[DYCaptureSessionInfo canPlaybackOnDeviceWithInfo:limitBackwardsCompatibility:isInternal:withBlock:](&v6, sel_canPlaybackOnDeviceWithInfo_limitBackwardsCompatibility_isInternal_withBlock_, a3, a4, a5, v7);
}

uint64_t __93__DYGLCaptureSessionInfo_canPlaybackOnDeviceWithInfo_limitBackwardsCompatibility_isInternal___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "contextsInfo", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (!v3)
    return 1;
  v4 = v3;
  v5 = *(_QWORD *)v9;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v9 != v5)
      objc_enumerationMutation(v2);
    result = objc_msgSend(*(id *)(a1 + 40), "supportsCapabilitiesOfGraphicsAPI:allowedClass:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), objc_opt_class());
    if (!(_DWORD)result)
      return result;
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        goto LABEL_3;
      return 1;
    }
  }
}

- (void)deleteContexts:(const void *)a3
{
  NSArray *v5;
  NSArray *contextsInfo;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_contextsInfo)
  {
    v5 = (NSArray *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    contextsInfo = self->_contextsInfo;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](contextsInfo, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(contextsInfo);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (*(_QWORD *)a3 == *((_QWORD *)a3 + 1))
            goto LABEL_15;
          v12 = *(_QWORD *)a3 + 8;
          do
          {
            v13 = objc_msgSend(v11, "identifier");
            v14 = *(_QWORD *)(v12 - 8);
            v15 = v12 == *((_QWORD *)a3 + 1);
            v12 += 8;
            v15 = v15 || v13 == v14;
          }
          while (!v15);
          if (v13 != v14)
LABEL_15:
            -[NSArray addObject:](v5, "addObject:", v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](contextsInfo, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    if (!-[NSArray count](v5, "count"))
    {

      v5 = 0;
    }
    self->_contextsInfo = v5;
  }
}

- (NSArray)contextsInfo
{
  return self->_contextsInfo;
}

- (NSArray)requiredExtensions
{
  return self->_requiredExtensions;
}

- (BOOL)wasCheckingGLErrors
{
  return self->_wasCheckingGLErrors;
}

@end
