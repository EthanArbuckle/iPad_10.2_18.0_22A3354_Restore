@implementation VCPVideoTrackDecoder

+ ($2825F4736939C4A6D3AD43837233062D)decodeDimensionsForTrack:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v3 = a3;
  objc_msgSend(v3, "naturalSize");
  v5 = v4;
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v3, "preferredTransform");
    v8 = *((double *)&v19 + 1);
    v9 = *(double *)&v19;
    v10 = *((double *)&v20 + 1);
    v11 = *(double *)&v20;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    v10 = 0.0;
    v8 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
  }
  v12 = (int)fabs(v7 * v11 + v9 * v5);
  v13 = (int)fabs(v7 * v10 + v8 * v5);
  if (v12 <= v13)
    v14 = v13;
  else
    v14 = v12;
  if (v14)
  {
    v15 = (580 * v12 / v14) & 0xFFFFFFFE;
    v16 = (unint64_t)((580 * v13 / v14) & 0xFFFFFFFE) << 32;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Both width and height are zero", v18, 2u);
    }
    v15 = 0;
    v16 = 0;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v16 | v15);
}

- (VCPVideoTrackDecoder)init
{

  return 0;
}

- (VCPVideoTrackDecoder)initWithTrack:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  $2825F4736939C4A6D3AD43837233062D v9;
  int var0;
  unint64_t v11;
  VCPVideoTrackDecoder *v12;
  VCPVideoTrackDecoder *v13;
  VCPVideoTrackDecoder *v14;
  objc_super v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "mediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A808]))
  {

  }
  else
  {
    objc_msgSend(v5, "mediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A7A8]);

    if ((v8 & 1) == 0)
    {
LABEL_12:
      v14 = 0;
      goto LABEL_13;
    }
  }
  v9 = +[VCPVideoTrackDecoder decodeDimensionsForTrack:](VCPVideoTrackDecoder, "decodeDimensionsForTrack:", v5);
  var0 = v9.var0;
  v11 = HIDWORD(*(unint64_t *)&v9);
  if (v9.var0 < 192 || v9.var1 <= 95)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = (float)((float)var0 / (float)(int)v11);
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  Extreme aspect ratio %f; initialization failed",
        buf,
        0xCu);
    }
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoTrackDecoder;
  v12 = -[VCPVideoTrackDecoder init](&v16, sel_init);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_track, a3);
  self = v13;
  v14 = self;
LABEL_13:

  return v14;
}

- (id)settings
{
  $2825F4736939C4A6D3AD43837233062D v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v2 = +[VCPVideoTrackDecoder decodeDimensionsForTrack:](VCPVideoTrackDecoder, "decodeDimensionsForTrack:", self->_track);
  v3 = *MEMORY[0x1E0CA9040];
  v13[0] = &unk_1E6B74450;
  v4 = *MEMORY[0x1E0CA90E0];
  v12[0] = v3;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HIDWORD(*(unint64_t *)&v2);
  v13[1] = v5;
  v12[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&v2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E0CA8FB8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -v2.var0 & 0xF);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  v12[4] = *MEMORY[0x1E0CA8FA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v6 & 0xF);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)validateDecodedFrame:(__CVBuffer *)a3 withSettings:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  BOOL v11;
  size_t v13;
  size_t extraColumnsOnRight;
  uint8_t buf[4];
  size_t v16;
  __int16 v17;
  size_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA8FB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA8FA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v13 = 0;
  extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, &v13);
  v10 = extraColumnsOnRight == v7 && v13 == v9;
  v11 = v10;
  if (!v10 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218752;
    v16 = extraColumnsOnRight;
    v17 = 2048;
    v18 = v13;
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VideoTrackDecoder] Decoded frame and setting mismatch: actual padding right: %zupx, bottom: %zupx (expected right: %zupx, bottom: %zupx)", buf, 0x2Au);
  }

  return v11;
}

- (int64_t)status
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NotImplementedException"), CFSTR("[VideoTrackDecoder status] should not be called"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NotImplementedException"), CFSTR("[VideoTrackDecoder copyNextSampleBuffer] should not be called"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NotImplementedException"), CFSTR("[VideoTrackDecoder getNextCaptureSampleBuffer] should not be called"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
}

@end
