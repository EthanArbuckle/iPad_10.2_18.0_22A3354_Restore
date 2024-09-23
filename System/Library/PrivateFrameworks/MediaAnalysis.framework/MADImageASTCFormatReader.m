@implementation MADImageASTCFormatReader

+ (BOOL)isValidASTCExtension:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ktx"));
}

- (MADImageASTCFormatReader)initWithData:(id)a3
{
  id v5;
  MADImageASTCFormatReader *v6;
  MADImageASTCFormatReader *v7;
  void **p_dataStream;
  void *v9;
  MADImageASTCFormatReader *v10;
  void *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADImageASTCFormatReader;
  v6 = -[MADImageASTCFormatReader init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  p_dataStream = (void **)&v6->_dataStream;
  objc_storeStrong((id *)&v6->_dataStream, a3);
  v9 = *p_dataStream;
  if (*p_dataStream)
  {
    v7->_start = 0;
    v7->_end = objc_msgSend(v9, "length");
    v7->_numImagesRemaining = 0;
LABEL_4:
    v10 = v7;
    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    v12 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] initWithFilePath: Invalid data stream", buf, 0xCu);

  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (int)readDataToBuffer:(void *)a3 Position:(unint64_t)a4 Length:(unint64_t)a5
{
  unint64_t end;
  BOOL v6;
  id v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self->_start > a4 || ((end = self->_end, end > a4) ? (v6 = a5 + a4 > end) : (v6 = 1), v6))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = (id)objc_opt_class();
        v7 = v11;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readDataToBuffer:Position:Length: Attempt to read beyond data limit", (uint8_t *)&v10, 0xCu);

      }
      return -18;
    }
    else
    {
      -[NSData getBytes:range:](self->_dataStream, "getBytes:range:");
      return 0;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readDataToBuffer:Position:Length: Invalid output buffer", (uint8_t *)&v10, 0xCu);

    }
    return -50;
  }
}

- (int)readPList
{
  unint64_t end;
  int v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  end = self->_end;
  v24 = 0;
  v4 = -[MADImageASTCFormatReader readDataToBuffer:Position:Length:](self, "readDataToBuffer:Position:Length:", &v24, end - 4, 4);
  if (!v4)
  {
    if (v24 != 1129005385)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v26 = v8;
        v9 = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readPList: Failed magic check", buf, 0xCu);

      }
      return -18;
    }
    v23 = 0;
    v4 = -[MADImageASTCFormatReader readDataToBuffer:Position:Length:](self, "readDataToBuffer:Position:Length:", &v23, end - 12, 8);
    if (!v4)
    {
      if (v23 == -1)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v26 = v10;
          v11 = v10;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid numImagesRemaining", buf, 0xCu);

        }
        return -18;
      }
      v22 = 0;
      v5 = end - 20;
      v4 = -[MADImageASTCFormatReader readDataToBuffer:Position:Length:](self, "readDataToBuffer:Position:Length:", &v22, end - 20, 8);
      if (!v4)
      {
        if (v5 < v22)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v6 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v26 = v6;
            v7 = v6;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid plistLength", buf, 0xCu);

          }
          return -18;
        }
        -[NSData subdataWithRange:](self->_dataStream, "subdataWithRange:", v5 - v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v22;
          v21 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v21;
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            self->_end = v5 - v14;
            objc_storeStrong((id *)&self->_plist, v15);
            v4 = 0;
            self->_numImagesRemaining = v23;
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v26 = v17;
              v27 = 2112;
              v28 = v16;
              v18 = v17;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readPList: Failed to create plist with err: %@", buf, 0x16u);

            }
            v4 = -18;
          }

        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v26 = v19;
            v20 = v19;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid plistData", buf, 0xCu);

          }
          v4 = -18;
        }

      }
    }
  }
  return v4;
}

- (CGImageSource)readOneImageSource
{
  unint64_t start;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  CGImageSource *v8;
  const __CFData *v10;
  const __CFData *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_numImagesRemaining)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = (id)objc_opt_class();
      v7 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readOneImage: Already read out all images", buf, 0xCu);

    }
    return 0;
  }
  start = self->_start;
  v17 = 0;
  if (!-[MADImageASTCFormatReader readDataToBuffer:Position:Length:](self, "readDataToBuffer:Position:Length:", &v17, start, 8))
  {
    v4 = start + 8;
    if (v17 + start + 8 > self->_end)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        v6 = v5;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readOneImage: Invalid imageLength", buf, 0xCu);

      }
      return 0;
    }
    -[NSData subdataWithRange:](self->_dataStream, "subdataWithRange:", start + 8);
    v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v17;
      v8 = CGImageSourceCreateWithData(v10, 0);
      if (v8)
      {
        --self->_numImagesRemaining;
        self->_start = v12 + v4;
LABEL_22:

        return v8;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        v16 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readOneImage: Failed to create imageSource", buf, 0xCu);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      v14 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] readOneImage: Invalid imageData", buf, 0xCu);

    }
    v8 = 0;
    goto LABEL_22;
  }
  return 0;
}

- (CGImageSource)readNextImageSource
{
  if (self->_plist || !-[MADImageASTCFormatReader readPList](self, "readPList"))
    return -[MADImageASTCFormatReader readOneImageSource](self, "readOneImageSource");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
}

@end
