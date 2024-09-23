@implementation PADAVAssetReader

- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5
{
  return -[PADAVAssetReader imagesFromVideoURL:timestamps:size:error:](self, "imagesFromVideoURL:timestamps:size:error:", a3, a4, a5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (id)imagesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFDictionary *v19;
  void *v20;
  void *v21;
  id v24;
  CMTime v25;
  id v26;
  CMTime v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  height = a5.height;
  width = a5.width;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v24 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        v19 = *(const __CFDictionary **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x2199BF030]();
        memset(&v27, 0, sizeof(v27));
        CMTimeMakeFromDictionary(&v27, v19);
        v26 = v18;
        v25 = v27;
        -[PADAVAssetReader _imageDataFromVideo:timestamp:size:error:](self, "_imageDataFromVideo:timestamp:size:error:", v10, &v25, &v26, width, height);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v26;

        if (v21)
          objc_msgSend(v24, "addObject:", v21);

        objc_autoreleasePoolPop(v20);
        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v24;
}

- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 error:(id *)a5
{
  return -[PADAVAssetReader framesFromVideoURL:timestamps:size:error:](self, "framesFromVideoURL:timestamps:size:error:", a3, a4, a5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (id)framesFromVideoURL:(id)a3 timestamps:(id)a4 size:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFDictionary *v19;
  void *v20;
  void *v21;
  id v24;
  CMTime v25;
  id v26;
  CMTime v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  height = a5.height;
  width = a5.width;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v24 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        v19 = *(const __CFDictionary **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x2199BF030]();
        memset(&v27, 0, sizeof(v27));
        CMTimeMakeFromDictionary(&v27, v19);
        v26 = v18;
        v25 = v27;
        -[PADAVAssetReader _frameFromVideo:timestamp:size:error:](self, "_frameFromVideo:timestamp:size:error:", v10, &v25, &v26, width, height);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v26;

        if (v21)
          objc_msgSend(v24, "addObject:", v21);

        objc_autoreleasePoolPop(v20);
        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v24;
}

- (id)_imageDataFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  opaqueCMSampleBuffer *v6;
  opaqueCMSampleBuffer *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;

  buf = *a4;
  v6 = -[PADAVAssetReader _newSampleBufferFromVideo:timestamp:size:error:](self, "_newSampleBufferFromVideo:timestamp:size:error:", a3, &buf, a6, a5.width, a5.height);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v8))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.FrameImageData", ", (uint8_t *)&buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke;
  v12[3] = &__block_descriptor_40_e13___NSData_8__0l;
  v12[4] = v7;
  __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke((uint64_t)v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v10))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.FrameImageData", ", (uint8_t *)&buf, 2u);
  }

  CFRelease(v7);
  return v9;
}

id __61__PADAVAssetReader__imageDataFromVideo_timestamp_size_error___block_invoke(uint64_t a1)
{
  __CVBuffer *ImageBuffer;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v7;
  CGImage *Image;
  void *v9;
  void *v10;
  CGColorSpace *v11;
  void *v12;

  ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 32));
  CVPixelBufferLockBaseAddress(ImageBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
  Image = CGBitmapContextCreateImage(v7);
  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  CGContextRelease(v7);
  CGColorSpaceRelease(DeviceRGB);
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", Image);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(v10, "JPEGRepresentationOfImage:colorSpace:options:", v9, v11, MEMORY[0x24BDBD1B8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorSpaceRelease(v11);

  CGImageRelease(Image);
  return v12;
}

- (id)_frameFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v11;
  NSObject *v12;
  opaqueCMSampleBuffer *v13;
  CVImageBufferRef ImageBuffer;
  NSObject *v15;
  PADAVFrame *v16;
  NSObject *v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  uint8_t v20[16];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v12))
  {
    LOWORD(buf.var0) = 0;
    _os_signpost_emit_with_name_impl(&dword_213BCD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", (uint8_t *)&buf, 2u);
  }

  buf = *a4;
  v13 = -[PADAVAssetReader _newSampleBufferFromVideo:timestamp:size:error:](self, "_newSampleBufferFromVideo:timestamp:size:error:", v11, &buf, a6, width, height);

  if (v13)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v13);
    memset(&buf, 0, sizeof(buf));
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&buf, v13);
    CFRelease(v13);
    v15 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_213BCD000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", v20, 2u);
    }

    v16 = objc_alloc_init(PADAVFrame);
    -[PADAVFrame setPixelBuffer:](v16, "setPixelBuffer:", ImageBuffer);
    v19 = buf;
    -[PADAVFrame setTimestamp:](v16, "setTimestamp:", &v19);
  }
  else
  {
    v17 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v17))
    {
      LOWORD(buf.var0) = 0;
      _os_signpost_emit_with_name_impl(&dword_213BCD000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", ", (uint8_t *)&buf, 2u);
    }

    v16 = 0;
  }
  return v16;
}

- (opaqueCMSampleBuffer)_newSampleBufferFromVideo:(id)a3 timestamp:(id *)a4 size:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  opaqueCMSampleBuffer *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CMTimeRange v32;
  CMTime start;
  CMTime duration;
  CMTimeRange v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[3];

  height = a5.height;
  width = a5.width;
  v43[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v40 = *MEMORY[0x24BDC56B8];
    v41 = &unk_24D0D6130;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (width != *MEMORY[0x24BDBF148] || height != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDC5708]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDC5650]);

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v13, v15);
    objc_msgSend(v19, "setAlwaysCopiesSampleData:", 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B8]), "initWithAsset:error:", v11, 0);
    v21 = v20;
    if (v20)
    {
      if ((objc_msgSend(v20, "canAddOutput:", v19) & 1) != 0)
      {
        CMTimeMake(&duration, 1000000, a4->var1);
        start = (CMTime)*a4;
        CMTimeRangeMake(&v35, &start, &duration);
        v32 = v35;
        objc_msgSend(v21, "setTimeRange:", &v32);
        objc_msgSend(v21, "addOutput:", v19);
        objc_msgSend(v21, "startReading");
        v22 = (opaqueCMSampleBuffer *)objc_msgSend(v19, "copyNextSampleBuffer");
        objc_msgSend(v21, "cancelReading");
LABEL_17:

        goto LABEL_18;
      }
      if (a6)
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v36 = *MEMORY[0x24BDD0BA0];
        v37 = CFSTR("Unable to add output to AVAssetReader");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 1, v30);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a6)
    {
      v24 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v10, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("Unable to create AVAssetReader with file at URL %@"), v25);

      v27 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD0BA0];
      v39 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 1, v28);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
    goto LABEL_17;
  }
  if (!a6)
  {
    v22 = 0;
    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x24BDD1540];
  v42 = *MEMORY[0x24BDD0BA0];
  v43[0] = CFSTR("Unable to create asset track from asset");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 1, v15);
  v22 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return v22;
}

@end
