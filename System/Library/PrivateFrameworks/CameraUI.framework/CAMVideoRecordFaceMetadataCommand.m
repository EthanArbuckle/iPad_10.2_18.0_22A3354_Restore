@implementation CAMVideoRecordFaceMetadataCommand

- (CAMVideoRecordFaceMetadataCommand)initWithEnabled:(BOOL)a3
{
  CAMVideoRecordFaceMetadataCommand *v4;
  CAMVideoRecordFaceMetadataCommand *v5;
  CAMVideoRecordFaceMetadataCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "currentMovieFileOutput");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCaptureSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v5 && v6)
  {
    v7 = *MEMORY[0x1E0C8A958];
    -[CAMVideoRecordFaceMetadataCommand _connectionForMovieFileOutput:metadataPortType:](self, "_connectionForMovieFileOutput:metadataPortType:", v11, *MEMORY[0x1E0C8A958]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CAMVideoRecordFaceMetadataCommand _isEnabled](self, "_isEnabled");
    v10 = objc_msgSend(v8, "isEnabled");
    if (v9 || !v8)
    {
      if (((!v9 | v10) & 1) == 0)
        -[CAMVideoRecordFaceMetadataCommand _addMetadataConnectionForPortType:videoDeviceInput:movieFileOutput:captureSession:](self, "_addMetadataConnectionForPortType:videoDeviceInput:movieFileOutput:captureSession:", v7, v5, v11, v6);
    }
    else
    {
      objc_msgSend(v6, "removeConnection:", v8);
    }

  }
}

- (CAMVideoRecordFaceMetadataCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoRecordFaceMetadataCommand *v5;
  CAMVideoRecordFaceMetadataCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoRecordFaceMetadataCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordFaceMetadataCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoRecordFaceMetadataCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordFaceMetadataCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoRecordFaceMetadataCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (id)_connectionForMovieFileOutput:(id)a3 metadataPortType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  const opaqueCMFormatDescription *v15;
  const opaqueCMFormatDescription *v16;
  id v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "connections");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  v7 = 0;
  if (v21)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "inputPorts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = (const opaqueCMFormatDescription *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "formatDescription");
              if (v15)
              {
                v16 = v15;
                if (CMFormatDescriptionGetMediaType(v15) == 1835365473)
                {
                  if (-[__CFArray containsObject:](CMMetadataFormatDescriptionGetIdentifiers(v16), "containsObject:", v6))
                  {
                    v17 = v9;

                    v7 = v17;
                  }
                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  return v7;
}

- (void)_addMetadataConnectionForPortType:(id)a3 videoDeviceInput:(id)a4 movieFileOutput:(id)a5 captureSession:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const opaqueCMFormatDescription *v17;
  const opaqueCMFormatDescription *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v23 = a6;
  objc_msgSend(a4, "ports");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v17 = (const opaqueCMFormatDescription *)objc_msgSend(v16, "formatDescription");
        if (v17)
        {
          v18 = v17;
          if (CMFormatDescriptionGetMediaType(v17) == 1835365473)
          {
            if (-[__CFArray containsObject:](CMMetadataFormatDescriptionGetIdentifiers(v18), "containsObject:", v9))
            {
              v19 = (void *)MEMORY[0x1E0C8B070];
              v29 = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "connectionWithInputPorts:output:", v20, v10);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v23, "addConnection:", v21);
              }
              else
              {
                v22 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_DEFAULT, "Unable to add metadata connection to our capture session, the connection is invalid.", buf, 2u);
                }

              }
            }
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
