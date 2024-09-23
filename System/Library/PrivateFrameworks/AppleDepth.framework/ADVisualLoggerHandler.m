@implementation ADVisualLoggerHandler

- (ADVisualLoggerHandler)initWithName:(id)a3
{
  id v4;
  ADVisualLoggerHandler *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  ADVisualLoggerHandler *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!MEMORY[0x24BEC09E8])
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipping VisualLogger creation as it is not availiable on this platform", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Skipping VisualLogger creation as it is not availiable on this platform", buf, 2u);
    }
    goto LABEL_12;
  }
  v12.receiver = self;
  v12.super_class = (Class)ADVisualLoggerHandler;
  v5 = -[ADVisualLoggerHandler init](&v12, sel_init);
  self = v5;
  if (v5)
  {
    *(&v5->super._humanReadableFormat + 1) = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("appledepth.vz.%@"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&self->_synchronousFileLogging;
    *(_QWORD *)&self->_synchronousFileLogging = v6;

    v8 = (NSString *)MEMORY[0x20BD362F4]();
    self->_loggerName = v8;
    if (!v8)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)&self->_synchronousFileLogging;
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "created logger handler %@", buf, 0xCu);
    }
  }
  self = self;
  v10 = self;
LABEL_13:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (MEMORY[0x24BEC09E8])
  {
    -[ADVisualLoggerHandler removeFileSettings](self, "removeFileSettings");
    -[ADVisualLoggerHandler removeHostSettings](self, "removeHostSettings");
    VZRelease();
    VZRelease();
    VZRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)ADVisualLoggerHandler;
  -[ADVisualLoggerHandler dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return *(id *)&self->_synchronousFileLogging;
}

- (void)preEnable
{
  ADVisualLoggerHandler *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(*(id *)&obj->_synchronousFileLogging, "UTF8String");
  VZLoggerEnable();
  objc_sync_exit(obj);

}

- (void)postDisable
{
  ADVisualLoggerHandler *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(*(id *)&obj->_synchronousFileLogging, "UTF8String");
  VZLoggerDisable();
  objc_sync_exit(obj);

}

- (int64_t)setLogFolder:(id)a3
{
  id v4;
  ADVisualLoggerHandler *v5;
  int64_t v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[ADVisualLoggerHandler removeFileSettings](v5, "removeFileSettings");
  if (!v6)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
      v9 = v15;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("sequence.csv"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeItemAtPath:error:", v10, 0);

        objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("info.json"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeItemAtPath:error:", v11, 0);

        objc_msgSend(*(id *)&v5->_synchronousFileLogging, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeItemAtPath:error:", v13, 0);

        if (v5->_visualLogger)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot start file logging. destination already set", buf, 2u);
          }
          v6 = -22961;
        }
        else
        {
          VZFileExportOptionsCreate();
          if (*(&v5->super._humanReadableFormat + 1))
            VZFileExportOptionsSetAsyncQueueMaxElementCount();
          VZLogMessageFilterCreate();
          VZDataGetDictionaryDataTypeID();
          VZLogMessageFilterRequireDataTypeIDExact();
          VZFileExportOptionsAddFilteredStoragePreference();
          VZLogMessageFilterCreate();
          VZDataGetMeshDataTypeID();
          VZLogMessageFilterRequireDataTypeIDExact();
          VZFileExportOptionsAddFilteredStoragePreference();
          VZLogMessageFilterCreate();
          VZFileExportOptionsAddFilteredStoragePreference();
          objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
          v5->_visualLogger = (VZLogger *)VZDestinationCreateWithFileExporter();
          VZRelease();
          VZRelease();
          VZRelease();
          VZRelease();
          VZLoggerAddDestination();
          v6 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v17 = v4;
          v18 = 2114;
          v19 = v9;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADLogManager cannot create logger directory \"%{public}@\". Error: %{public}@", buf, 0x16u);
        }
        v6 = -22950;
      }

    }
    else
    {
      v6 = 0;
    }
  }
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)removeFileSettings
{
  ADVisualLoggerHandler *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_loggerName && v2->_visualLogger)
  {
    VZLoggerRemoveDestination();
    VZRelease();
    v2->_visualLogger = 0;
  }
  objc_sync_exit(v2);

  return 0;
}

- (int64_t)setHostName:(id)a3
{
  id v4;
  ADVisualLoggerHandler *v5;
  int64_t v6;
  uint8_t buf[4];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    if (v5->_fileDestination)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADLogManager cannot start network logging, network destination already set", buf, 2u);
      }
      v6 = -22961;
    }
    else
    {
      VZClientOptionsCreate();
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      VZClientOptionsSetTcpIpAddress();
      v5->_fileDestination = (VZDestination *)VZDestinationCreateWithClient();
      VZRelease();
      VZLoggerAddDestination();
      v6 = 0;
    }
  }
  else
  {
    v6 = -[ADVisualLoggerHandler removeHostSettings](v5, "removeHostSettings");
  }
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)removeHostSettings
{
  ADVisualLoggerHandler *v3;
  int64_t v4;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!self->_loggerName)
    return -22961;
  if (!self->_fileDestination)
    return 0;
  v3 = self;
  objc_sync_enter(v3);
  VZLoggerRemoveDestination();
  VZRelease();
  v4 = 0;
  self->_fileDestination = 0;
  objc_sync_exit(v3);

  return v4;
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
  ADVisualLoggerHandler *v7;
  unint64_t PixelFormatType;
  size_t Width;
  size_t Height;
  void *BaseAddress;
  size_t BytesPerRow;
  uint64_t ImageWithCVPixelBuffer;
  uint64_t v14;
  void *v15;
  id v16;
  _BYTE *v17;
  CVPixelBufferRef texture;
  void *v19;
  _BYTE buf[12];
  __int16 v21;
  void *v22;
  char v23;
  uint8_t v24[4];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = self;
    objc_sync_enter(v7);
    texture = a3;
    v19 = 0;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferIsPlanar(a3)
      && (texture = PixelBufferUtils::createConvertedPixelBufferFormat(a3, (__CVBuffer *)0x42475241, (__CVBuffer *)1)) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
        v17 = v23 >= 0 ? buf : *(_BYTE **)buf;
        *(_DWORD *)v24 = 136446210;
        v25 = v17;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging pixel buffer with format %{public}s", v24, 0xCu);
        if (v23 < 0)
          operator delete(*(void **)buf);
      }
    }
    else
    {
      if ((_DWORD)PixelFormatType == 825306677
        || (_DWORD)PixelFormatType == 1932996149
        || (_DWORD)PixelFormatType == 825437747)
      {
        CVPixelBufferRetain(a3);
        CVPixelBufferLockBaseAddress(a3, 1uLL);
        Width = CVPixelBufferGetWidth(a3);
        Height = CVPixelBufferGetHeight(a3);
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x62313667u, BaseAddress, BytesPerRow, (CVPixelBufferReleaseBytesCallback)pixelBufferDeallocator, a3, 0, &texture);
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      }
      VZDataInfoCreate();
      VZDataInfoSetTimestampMachContinuousNanoseconds();
      VZDataInfoSetName();
      ImageWithCVPixelBuffer = VZDataCreateImageWithCVPixelBuffer();
      v14 = ImageWithCVPixelBuffer;
      v15 = v19;
      if (v19 || !ImageWithCVPixelBuffer)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v14;
          v21 = 2114;
          v22 = v15;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging pixel buffer. data:%p, Error: %{public}@", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(*(id *)&v7->_synchronousFileLogging, "stringByAppendingFormat:", CFSTR(".%s"), a4);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v16, "UTF8String");
        VZLoggerLogData();

      }
      VZRelease();
      VZRelease();
      if (texture != a3)
        CVPixelBufferRelease(texture);
    }
    objc_sync_exit(v7);

  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADVisualLoggerHandler logDictionary:name:timestamp:](self, "logDictionary:name:timestamp:", v9, a4, a5);

    v8 = v10;
  }

}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v11 = CFSTR("value");
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADVisualLoggerHandler logDictionary:name:timestamp:](self, "logDictionary:name:timestamp:", v10, a4, a5);

  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
  ADVisualLoggerHandler *v9;
  void *v10;
  uint64_t BlobWithCFData;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v9 = self;
    objc_sync_enter(v9);
    VZDataInfoCreate();
    VZDataInfoSetTimestampMachContinuousNanoseconds();
    VZDataInfoSetName();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BlobWithCFData = VZDataCreateBlobWithCFData();
    if (BlobWithCFData)
    {
      objc_msgSend(*(id *)&v9->_synchronousFileLogging, "stringByAppendingFormat:", CFSTR(".%s"), a5);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "UTF8String");
      VZLoggerLogData();

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v14 = BlobWithCFData;
      v15 = 2114;
      v16 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADVisualLoggerHandler failed logging raw buffer. data:%p, Error: %{public}@", buf, 0x16u);

    }
    VZRelease();
    VZRelease();

    objc_sync_exit(v9);
  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADVisualLoggerHandler logDictionary:name:timestamp:](self, "logDictionary:name:timestamp:", v9, a4, a5);

    v8 = v10;
  }

}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
  ADVisualLoggerHandler *obj;

  if (a3)
  {
    obj = self;
    objc_sync_enter(obj);
    objc_sync_exit(obj);

  }
}

- (uint64_t)logMatrix4x3:(double)a3 name:(double)a4 timestamp:(double)a5
{
  return objc_msgSend(a1, "logMatrix4x4:name:timestamp:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousFileLogging, 0);
}

@end
