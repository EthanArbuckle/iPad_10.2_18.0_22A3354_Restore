@implementation HMCameraClipVideoHLSPlaylistGenerator

- (HMCameraClipVideoHLSPlaylistGenerator)initWithClip:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  HMCameraClipVideoHLSPlaylistGenerator *v8;
  uint64_t v9;
  NSMutableString *hlsPlaylistString;
  NSMutableString *v11;
  double v12;
  NSMutableString *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  HMCameraClipVideoHLSPlaylistGenerator *v19;
  void *v20;
  HMCameraClipVideoHLSPlaylistGenerator *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HMCameraClipVideoHLSPlaylistGenerator;
  v8 = -[HMCameraClipVideoHLSPlaylistGenerator init](&v27, sel_init);
  if (!v8)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = objc_claimAutoreleasedReturnValue();
  hlsPlaylistString = v8->_hlsPlaylistString;
  v8->_hlsPlaylistString = (NSMutableString *)v9;

  objc_storeStrong((id *)&v8->_url, a4);
  -[NSMutableString appendString:](v8->_hlsPlaylistString, "appendString:", CFSTR("#EXTM3U\n"));
  -[NSMutableString appendFormat:](v8->_hlsPlaylistString, "appendFormat:", CFSTR("#EXT-X-VERSION:%u\n"), 7);
  v11 = v8->_hlsPlaylistString;
  objc_msgSend(v6, "targetFragmentDuration");
  -[NSMutableString appendFormat:](v11, "appendFormat:", CFSTR("#EXT-X-TARGETDURATION:%u\n"), v12);
  v13 = v8->_hlsPlaylistString;
  v14 = objc_msgSend(v6, "isComplete");
  v15 = CFSTR("EVENT");
  if (v14)
    v15 = CFSTR("VOD");
  -[NSMutableString appendFormat:](v13, "appendFormat:", CFSTR("#EXT-X-PLAYLIST-TYPE:%@\n"), v15);
  -[NSMutableString appendString:](v8->_hlsPlaylistString, "appendString:", CFSTR("#EXT-X-INDEPENDENT-SEGMENTS\n"));
  v16 = (void *)objc_opt_class();
  objc_msgSend(v6, "encryptionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_hlsPlaylistEncryptionMethodNameForScheme:", objc_msgSend(v17, "scheme"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NSMutableString appendFormat:](v8->_hlsPlaylistString, "appendFormat:", CFSTR("#EXT-X-KEY:METHOD=%@"), v18);
    -[NSMutableString appendFormat:](v8->_hlsPlaylistString, "appendFormat:", CFSTR(",URI=\"%@\"\n"), CFSTR("HMCC://encryptionKey"));

LABEL_6:
    v19 = v8;
    goto LABEL_10;
  }
  v20 = (void *)MEMORY[0x1A1AC1AAC]();
  v21 = v8;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encryptionContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "scheme");
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2048;
    v31 = v25;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not determine HLS playlist encryption method name for scheme: %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  v19 = 0;
LABEL_10:

  return v19;
}

- (NSData)hlsPlaylist
{
  void *v2;
  void *v3;

  -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)addSegment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMCameraClipVideoHLSPlaylistGenerator *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipVideoHLSPlaylistGenerator url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("#EXT-X-MAP:URI=\"%@\","), v9);

    -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("BYTERANGE=\"%llu@%llu\"\n"), objc_msgSend(v6, "byteLength"), objc_msgSend(v6, "byteOffset"));
  }
  else
  {
    v11 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v10 = v12;

    if (v10)
    {
      -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "duration");
      objc_msgSend(v13, "appendFormat:", CFSTR("#EXTINF:%.6f,\n"), v14);

      -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendFormat:", CFSTR("#EXT-X-BYTERANGE:%llu@%llu\n"), objc_msgSend(v10, "byteLength"), objc_msgSend(v10, "byteOffset"));

      -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraClipVideoHLSPlaylistGenerator url](self, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendFormat:", CFSTR("%@\n"), v18);

    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v22;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = objc_opt_class();
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown segment type: %@ (%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
    }
  }

}

- (void)addSegments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HMCameraClipVideoHLSPlaylistGenerator addSegment:](self, "addSegment:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)finish
{
  id v2;

  -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylistString](self, "hlsPlaylistString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("#EXT-X-ENDLIST\n"));

}

- (NSMutableString)hlsPlaylistString
{
  return (NSMutableString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistString, 0);
}

+ (id)_hlsPlaylistEncryptionMethodNameForScheme:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("AES-256-GCM");
  else
    return 0;
}

@end
