@implementation CAMRealtimeMetadataCommand

- (CAMRealtimeMetadataCommand)initWithTypes:(id)a3
{
  id v4;
  CAMRealtimeMetadataCommand *v5;
  uint64_t v6;
  NSArray *desiredTypes;
  CAMRealtimeMetadataCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMRealtimeMetadataCommand;
  v5 = -[CAMCaptureCommand init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    desiredTypes = v5->__desiredTypes;
    v5->__desiredTypes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMRealtimeMetadataCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMRealtimeMetadataCommand _desiredTypes](self, "_desiredTypes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (NSArray)_desiredTypes
{
  return self->__desiredTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__desiredTypes, 0);
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  char v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFaceDetectionSupported") & 1) != 0)
  {
    v29 = v5;
    objc_msgSend(v4, "currentCaptureSession");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentMetadataOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMRealtimeMetadataCommand _desiredTypes](self, "_desiredTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", &unk_1EA3B08C8);
    v10 = objc_msgSend(v7, "isVideoPreviewHistogramMetadataSupported");
    if (v9 && v10)
      objc_msgSend(v7, "setVideoPreviewHistogramMetadataObjectTypesAvailable:", 1);
    v11 = objc_msgSend(v8, "containsObject:", &unk_1EA3B08E0);
    v12 = objc_msgSend(v7, "isAppClipCodeMetadataSupported");
    if (v11 && v12)
      objc_msgSend(v7, "setAppClipCodeMetadataObjectTypeAvailable:", 1);
    v13 = objc_msgSend(v8, "containsObject:", &unk_1EA3B08F8);
    v14 = objc_msgSend(v7, "isTextRegionMetadataSupported");
    if (v13 && v14)
    {
      objc_msgSend(v7, "setTextRegionMetadataObjectTypeAvailable:", 1);
    }
    else if (v13)
    {
      v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CAMRealtimeMetadataCommand executeWithContext:].cold.1(v16);

    }
    if ((objc_msgSend(v8, "containsObject:", &unk_1EA3B0910) & 1) != 0
      || (objc_msgSend(v8, "containsObject:", &unk_1EA3B0928) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v17 = objc_msgSend(v8, "containsObject:", &unk_1EA3B0940) ^ 1;
    }
    v18 = objc_msgSend(v7, "isHeadMetadataSupported");
    if ((v17 & 1) == 0 && v18)
      objc_msgSend(v7, "setHeadMetadataObjectTypesAvailable:", 1);
    objc_msgSend(v7, "availableMetadataObjectTypes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMRealtimeMetadataCommand _metadataObjectTypesForRealtimeMetadataTypes:withAvailableMetadataTypes:](self, "_metadataObjectTypesForRealtimeMetadataTypes:withAvailableMetadataTypes:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadataObjectTypes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
    v23 = objc_msgSend(v21, "isEqual:", v22);
    v24 = -[NSObject isBeingConfigured](v6, "isBeingConfigured");
    v28 = v6;
    if ((v23 & 1) != 0 || (v24 & 1) != 0)
    {
      if ((v23 & 1) != 0)
        goto LABEL_28;
    }
    else if (!objc_msgSend(v19, "count"))
    {
LABEL_28:
      v25 = objc_msgSend(v19, "count");
      objc_msgSend(v7, "connectionWithMediaType:", *MEMORY[0x1E0C8A7D0]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v25 != 0) != objc_msgSend(v26, "isEnabled"))
        objc_msgSend(v26, "setEnabled:", v25 != 0);

      v15 = v28;
      v5 = v29;
      goto LABEL_31;
    }
    objc_msgSend(v7, "setMetadataObjectTypes:", v19);
    goto LABEL_28;
  }
  v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CAMFaceDrivenImageProcessingCommand executeWithContext:].cold.1(v15);
LABEL_31:

}

- (id)_metadataObjectTypesForRealtimeMetadataTypes:(id)a3 withAvailableMetadataTypes:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[CAMRealtimeMetadataCommand _metadataObjectTypeForRealtimeMetadataType:](self, "_metadataObjectTypeForRealtimeMetadataType:", objc_msgSend(v13, "integerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (objc_msgSend(v7, "containsObject:", v14))
          {
            objc_msgSend(v18, "addObject:", v14);
          }
          else
          {
            v16 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v14;
              _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "Requested AVMetadataObjectType is unavailable: %{public}@", buf, 0xCu);
            }

          }
        }
        else
        {
          v15 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[CAMRealtimeMetadataCommand _metadataObjectTypesForRealtimeMetadataTypes:withAvailableMetadataTypes:].cold.1(v23, v13, &v24, v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

  return v18;
}

- (CAMRealtimeMetadataCommand)initWithCoder:(id)a3
{
  id v4;
  CAMRealtimeMetadataCommand *v5;
  uint64_t v6;
  NSArray *desiredTypes;
  CAMRealtimeMetadataCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMRealtimeMetadataCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMRealtimeMetadataCommandTypes"));
    v6 = objc_claimAutoreleasedReturnValue();
    desiredTypes = v5->__desiredTypes;
    v5->__desiredTypes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMRealtimeMetadataCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CAMRealtimeMetadataCommand _desiredTypes](self, "_desiredTypes", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMRealtimeMetadataCommandTypes"));

}

- (id)_metadataObjectTypeForRealtimeMetadataType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB)
    return 0;
  else
    return **((id **)&unk_1EA32BD40 + a3);
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Text region metadata is unsupported", v1, 2u);
}

- (void)_metadataObjectTypesForRealtimeMetadataTypes:(uint64_t *)a3 withAvailableMetadataTypes:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "integerValue");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_1DB760000, a4, OS_LOG_TYPE_ERROR, "Did not find AVMetadataObjectType for CAMRealtimeMetadataType: %ld", a1, 0xCu);
}

@end
