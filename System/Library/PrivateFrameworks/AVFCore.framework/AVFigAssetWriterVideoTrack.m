@implementation AVFigAssetWriterVideoTrack

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v11;
  uint64_t v12;
  const opaqueCMFormatDescription *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CMVideoDimensions Dimensions;
  CFPropertyListRef Extension;
  CFPropertyListRef v20;
  int32_t width;
  uint64_t height;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  uint64_t MediaSubType;
  CMVideoDimensions v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  OpaqueFigAssetWriter *v36;
  uint64_t (*v37)(OpaqueFigAssetWriter *, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, void *, uint64_t, __int128 *, id, int *);
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  int32_t v45;
  objc_super v46;
  int v47;
  id v48;
  __int128 v49;
  uint64_t v50;

  v7 = a5;
  v48 = 0;
  v47 = 0;
  v11 = (void *)objc_msgSend(a3, "outputSettings");
  v12 = objc_msgSend(a3, "sourceFormatDescription");
  if (!v11)
  {
    v46.receiver = self;
    v46.super_class = (Class)AVFigAssetWriterVideoTrack;
    v47 = -[AVFigAssetWriterTrack _attachToFigAssetWriterUsingFormatSpecification:sourcePixelBufferAttributes:multiPass:error:](&v46, sel__attachToFigAssetWriterUsingFormatSpecification_sourcePixelBufferAttributes_multiPass_error_, a3, a4, v7, &v48);
    goto LABEL_37;
  }
  v13 = (const opaqueCMFormatDescription *)v12;
  if (!objc_msgSend(v11, "willYieldCompressedSamples"))
    goto LABEL_37;
  v14 = objc_msgSend(v11, "height");
  v45 = objc_msgSend(v11, "width");
  v43 = CMMediaTypeFromAVMediaType(-[AVFigAssetWriterTrack mediaType](self, "mediaType"));
  v42 = objc_msgSend(v11, "videoCodecType");
  v41 = objc_msgSend(v11, "videoEncoderSpecification");
  v15 = objc_msgSend(v11, "pixelTransferProperties");
  v16 = (void *)objc_msgSend(v11, "videoCompressionProperties");
  if (v7)
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC5C50]);
  else
    v17 = 0;
  if (v15)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
    objc_msgSend(v16, "setObject:forKey:", v15, *MEMORY[0x1E0CED148]);
  }
  if (objc_msgSend(v11, "shouldPrepareEncodedSampleBuffersForPaddedWrites"))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED158]);
  }
  if (v13)
  {
    v40 = v17;
    v44 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
    Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
    Extension = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x1E0CA8E68]);
    v20 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x1E0CA8D50]);
    width = v45;
    LODWORD(height) = v14;
    v23 = (int)v14 > 0 && v45 > 0;
    if (!v23)
      width = Dimensions.width;
    v45 = width;
    if (v23)
      height = height;
    else
      height = Dimensions.height;
    v24 = *MEMORY[0x1E0CED140];
    if (!objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CED140]) && Extension)
      objc_msgSend(v44, "setObject:forKey:", Extension, v24);
    v25 = *MEMORY[0x1E0CECF38];
    if (objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CECF38]))
      v26 = 1;
    else
      v26 = v20 == 0;
    v27 = v26;
    if (((v27 | v23) & 1) == 0)
      objc_msgSend(v44, "setObject:forKey:", v20, v25);
    if (a4)
    {
      v14 = height;
    }
    else
    {
      MediaSubType = CMFormatDescriptionGetMediaSubType(v13);
      v29 = CMVideoFormatDescriptionGetDimensions(v13);
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", MediaSubType);
      v32 = *MEMORY[0x1E0CA9040];
      v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29.width);
      v34 = *MEMORY[0x1E0CA90E0];
      v14 = height;
      v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(uint64_t *)&v29 >> 32);
      a4 = (id)objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, v32, v33, v34, v35, *MEMORY[0x1E0CA8FD8], 0);
    }
    v16 = v44;
    v17 = v40;
  }
  v36 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v37 = *(uint64_t (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, void *, uint64_t, __int128 *, id, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 184);
  if (!v37)
  {
    v38 = 4294954514;
    goto LABEL_36;
  }
  v49 = *MEMORY[0x1E0CA2E18];
  v50 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v38 = v37(v36, v45, v14, 0, v43, v42, v41, v16, v17, &v49, a4, &v47);
  if ((_DWORD)v38)
LABEL_36:
    v48 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v38);
LABEL_37:
  if (a6)
    *a6 = v48;
  return v47;
}

@end
