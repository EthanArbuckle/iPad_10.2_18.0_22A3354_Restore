@implementation PADAVSerialAssetReader

- (PADAVSerialAssetReader)initWithVideoURL:(id)a3 error:(id *)a4
{
  id v6;
  PADAVSerialAssetReader *v7;
  PADAVSerialAssetReader *v8;
  PADAVSerialAssetReader *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PADAVSerialAssetReader;
  v7 = -[PADAVSerialAssetReader init](&v11, sel_init);
  v8 = v7;
  if (v7
    && (v7->_isReading = 0,
        !-[PADAVSerialAssetReader _setupAssetReaderWithVideoURL:error:](v7, "_setupAssetReaderWithVideoURL:error:", v6, a4)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)_setupAssetReaderWithVideoURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVAssetReaderTrackOutput *v12;
  AVAssetReaderTrackOutput *output;
  AVAssetReader *v14;
  AVAssetReader *assetReader;
  AVAssetReader *v16;
  CMTimeValue v17;
  uint64_t v18;
  int32_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  AVAssetReader *v27;
  CMTimeRange v29;
  CMTime start;
  CMTime duration;
  CMTimeRange v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = *MEMORY[0x24BDC56B8];
  v41[0] = &unk_24D0D6130;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = (AVAssetReaderTrackOutput *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v9, v11);
  output = self->_output;
  self->_output = v12;

  -[AVAssetReaderTrackOutput setAlwaysCopiesSampleData:](self->_output, "setAlwaysCopiesSampleData:", 0);
  v14 = (AVAssetReader *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B8]), "initWithAsset:error:", v7, 0);
  assetReader = self->_assetReader;
  self->_assetReader = v14;

  v16 = self->_assetReader;
  if (v16)
  {
    if (-[AVAssetReader canAddOutput:](v16, "canAddOutput:", self->_output))
    {
      a4 = (id *)MEMORY[0x24BDC0D88];
      v17 = *MEMORY[0x24BDC0D88];
      v33 = 0;
      v34 = 0;
      v35 = 0;
      if (v7)
      {
        objc_msgSend(v7, "duration");
        v18 = v33;
        v19 = v34;
      }
      else
      {
        v19 = 0;
        v18 = 0;
      }
      CMTimeMake(&duration, v18 - v17, v19);
      start.value = v17;
      *(_OWORD *)&start.timescale = *(_OWORD *)(a4 + 1);
      CMTimeRangeMake(&v32, &start, &duration);
      v27 = self->_assetReader;
      v29 = v32;
      -[AVAssetReader setTimeRange:](v27, "setTimeRange:", &v29);
      -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_output);
      LOBYTE(a4) = 1;
    }
    else if (a4)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0BA0];
      v37 = CFSTR("Unable to add output to AVAssetReader");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 1, v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Unable to create AVAssetReader with file at URL %@"), v21);

    v23 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0BA0];
    v39 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 1, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)retrieveNextFrame
{
  AVAssetReaderTrackOutput *output;
  NSObject *v4;
  NSObject *v5;
  opaqueCMSampleBuffer *v6;
  opaqueCMSampleBuffer *v7;
  CVImageBufferRef ImageBuffer;
  NSObject *v9;
  PADAVFrame *v10;
  NSObject *v11;
  CMTime v13;
  uint8_t v14[16];
  CMTime buf;

  if (!self->_isReading)
  {
    self->_isReading = 1;
    -[AVAssetReader startReading](self->_assetReader, "startReading");
  }
  output = self->_output;
  v4 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  v5 = v4;
  if (!output)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PADAVSerialAssetReader retrieveNextFrame].cold.1(v5);

    return 0;
  }
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", (uint8_t *)&buf, 2u);
  }

  v6 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_output, "copyNextSampleBuffer");
  if (!v6)
  {
    v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v11))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_213BCD000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", (uint8_t *)&buf, 2u);
    }

    return 0;
  }
  v7 = v6;
  ImageBuffer = CMSampleBufferGetImageBuffer(v6);
  memset(&buf, 0, sizeof(buf));
  CMSampleBufferGetPresentationTimeStamp(&buf, v7);
  CFRelease(v7);
  v9 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", v14, 2u);
  }

  v10 = objc_alloc_init(PADAVFrame);
  -[PADAVFrame setPixelBuffer:](v10, "setPixelBuffer:", ImageBuffer);
  v13 = buf;
  -[PADAVFrame setTimestamp:](v10, "setTimestamp:", &v13);
  return v10;
}

- (void)close
{
  AVAssetReader *assetReader;
  AVAssetReaderTrackOutput *output;

  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
  assetReader = self->_assetReader;
  self->_assetReader = 0;

  output = self->_output;
  self->_output = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

- (void)retrieveNextFrame
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_213BCD000, log, OS_LOG_TYPE_DEBUG, "Unable to retrieve next frame; AVAssetReaderTrackOutput not set",
    v1,
    2u);
}

@end
