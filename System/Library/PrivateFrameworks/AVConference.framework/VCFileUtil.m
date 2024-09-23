@implementation VCFileUtil

+ (unint64_t)sizeOfFile:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), 0), "fileSize");
}

+ (double)contentLengthOfFile:(id)a3
{
  void *v3;
  CMTime v5;
  CMTime v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, 0);
  memset(&v6, 170, sizeof(v6));
  if (v3)
    objc_msgSend(v3, "duration");
  else
    memset(&v6, 0, sizeof(v6));
  v5 = v6;
  return CMTimeGetSeconds(&v5);
}

+ (double)audioContentLengthOfFile:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CMTimeValue v6;
  CMTimeEpoch v7;
  uint64_t v8;
  CMTime time;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, 0);
  v4 = (void *)objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  if (!objc_msgSend(v4, "count"))
    return 0.0;
  v5 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
    v6 = *((_QWORD *)&v12 + 1);
    v7 = *((_QWORD *)&v13 + 1);
    v8 = v13;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v8 = 0;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
  }
  time.value = v6;
  *(_QWORD *)&time.timescale = v8;
  time.epoch = v7;
  return CMTimeGetSeconds(&time);
}

+ (tagVCFileStats)statsOfFile:(SEL)a3
{
  void *v6;
  void *v7;
  double Seconds;
  void *v9;
  CMTimeValue v10;
  CMTimeEpoch v11;
  uint64_t v12;
  double v13;
  tagVCFileStats *result;
  CMTimeValue v15;
  uint64_t v16;
  CMTimeEpoch v17;
  CMTime time;
  CMTime v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a4, 0);
  v7 = v6;
  memset(&v19, 170, sizeof(v19));
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&v19, 0, sizeof(v19));
  time = v19;
  Seconds = CMTimeGetSeconds(&time);
  v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]), "firstObject");
  if (v9)
  {
    objc_msgSend(v9, "timeRange");
    v10 = v15;
    v11 = v17;
    v12 = v16;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    v12 = 0;
  }
  time.value = v10;
  *(_QWORD *)&time.timescale = v12;
  time.epoch = v11;
  v13 = CMTimeGetSeconds(&time);
  result = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:", a4);
  retstr->var0 = (unint64_t)result;
  retstr->var1 = Seconds;
  retstr->var2 = v13;
  return result;
}

@end
