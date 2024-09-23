@implementation MIOSEITrackReader

- (MIOSEITrackReader)initWithVideoTrack:(id)a3 assetReader:(id)a4
{
  id v6;
  id v7;
  MIOSEITrackReader *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MIOSEITrackReader;
  v8 = -[MIOSEITrackReader init](&v15, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v6, 0);
    -[MIOSEITrackReader setTrackOutput:](v8, "setTrackOutput:", v9);

    -[MIOSEITrackReader trackOutput](v8, "trackOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOutput:", v10);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOSEITrackReader setSeiItemsBuffer:](v8, "setSeiItemsBuffer:", v11);

    v13 = *MEMORY[0x24BDC0D38];
    v14 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    -[MIOSEITrackReader setMaxCurrentPts:](v8, "setMaxCurrentPts:", &v13);
    -[MIOSEITrackReader setDrainBeforeRead:](v8, "setDrainBeforeRead:", 0);
  }

  return v8;
}

- (BOOL)parseSEIInData:(char *)a3 length:(unsigned int)a4 output:(char *)a5 outputSize:(unsigned int *)a6
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int i;
  int v12;
  uint64_t v15;
  unsigned int v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    *a6 = 0;
    if (a4)
    {
      v7 = 0;
      v8 = 5;
      while (a3[v7] == 255)
      {
        ++v7;
        v8 -= 255;
        if (a4 == v7)
          return 0;
      }
      if ((int)v7 + 1 < a4)
      {
        v9 = 0;
        v10 = v7 + 2;
        for (i = 16; ; i -= 255)
        {
          v12 = a3[v9 + 1 + v7];
          if (v12 != 255)
            break;
          if (!(2 - a4 + (_DWORD)v7 + (_DWORD)v9++))
            return 0;
        }
        if (a3[v7] != v8)
          return 1;
        v15 = 0;
        while (v9 + (unint64_t)v10 + v15 < a4)
        {
          *((_BYTE *)v18 + v15) = a3[v10 + v15 + v9];
          if (++v15 == 16)
          {
            if (v18[0] == 0x5646C3E2DC8DF223 && v18[1] == 0xDE4FDE1CA55751BCLL)
            {
              v17 = v12 - i;
              memcpy(a5, &a3[v9 + 16 + v10], (v12 - i));
              *a6 = v17;
              return 1;
            }
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

- (unsigned)removeEPBFrom:(char *)a3 length:(unsigned int)a4 outBuffer:(char *)a5
{
  unsigned int result;
  int v6;
  char *v7;
  int v8;

  result = 0;
  if (a4 >= 3 && a3 && a5)
  {
    v6 = 0;
    v7 = a5;
    do
    {
      v8 = *a3;
      v6 = v8 | (v6 << 8);
      if ((v6 & 0xFFFFFF) != 3)
        *v7++ = v8;
      ++a3;
      --a4;
    }
    while (a4);
    return (_DWORD)v7 - (_DWORD)a5;
  }
  return result;
}

- (id)findNALUInData:(char *)a3 length:(unint64_t)a4 isHEVC:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  char *v10;
  size_t v11;
  char v12;
  char *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BYTE *v18;
  void *v19;
  unsigned int v21;

  v5 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((uint64_t)a4 >= 1)
  {
    v10 = &a3[a4];
    do
    {
      v11 = bswap32(*(_DWORD *)a3);
      v14 = a3[4];
      v13 = a3 + 4;
      v12 = v14;
      if (v5)
      {
        if ((v12 & 0x7E) == 0x4E)
        {
          v15 = 2;
          goto LABEL_8;
        }
      }
      else if ((v12 & 0x1F) == 6)
      {
        v15 = 1;
LABEL_8:
        v16 = malloc_type_malloc(v11, 0x6E71FE01uLL);
        v17 = -[MIOSEITrackReader removeEPBFrom:length:outBuffer:](self, "removeEPBFrom:length:outBuffer:", &v13[v15], v11, v16);
        v21 = 0;
        v18 = malloc_type_malloc(v11, 0xEC529AD2uLL);
        -[MIOSEITrackReader parseSEIInData:length:output:outputSize:](self, "parseSEIInData:length:output:outputSize:", v16, v17, v18, &v21);
        if (v21 >= 4 && *v18 == 109 && v18[1] == 101 && v18[2] == 116 && v18[3] == 97)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v18 + 4, v21 - 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
        free(v16);
        free(v18);
      }
      a3 = &v13[v11];
    }
    while (a3 < v10);
  }
  return v9;
}

- (id)extractDebugSEIFromBuffer:(OpaqueCMBlockBuffer *)a3 codecType:(unsigned int)a4
{
  char *v4;
  char *v5;
  _BOOL8 v8;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut;
  char *dataPointerOut[5];

  if (a4 != 1752589105 && a4 != 1635148593)
    return 0;
  dataPointerOut[3] = v4;
  dataPointerOut[4] = v5;
  lengthAtOffsetOut = 0;
  dataPointerOut[0] = 0;
  v8 = a4 == 1752589105;
  totalLengthOut = 0;
  CMBlockBufferGetDataPointer(a3, 0, &lengthAtOffsetOut, &totalLengthOut, dataPointerOut);
  -[MIOSEITrackReader findNALUInData:length:isHEVC:](self, "findNALUInData:length:isHEVC:", dataPointerOut[0], totalLengthOut, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OpaqueCMBlockBuffer)readNextValidBlockBufferPts:(id *)a3
{
  MIOSEITrackReader *i;
  void *v5;
  opaqueCMSampleBuffer *v6;
  CMBlockBufferRef DataBuffer;
  CMBlockBufferRef v8;
  const opaqueCMFormatDescription *FormatDescription;
  CMTime v11;

  for (i = self; ; self = i)
  {
    -[MIOSEITrackReader trackOutput](self, "trackOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (opaqueCMSampleBuffer *)objc_msgSend(v5, "copyNextSampleBuffer");

    if (!v6)
      return 0;
    DataBuffer = CMSampleBufferGetDataBuffer(v6);
    if (DataBuffer)
      break;
    CFRelease(v6);
  }
  v8 = DataBuffer;
  if (a3)
  {
    CMSampleBufferGetPresentationTimeStamp(&v11, v6);
    *(CMTime *)a3 = v11;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(v6);
  -[MIOSEITrackReader setCodec:](i, "setCodec:", CMFormatDescriptionGetMediaSubType(FormatDescription));
  CFRetain(v8);
  CFRelease(v6);
  return v8;
}

- (id)popFrontPts:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  CMTime v13;

  -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SEI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PTSDICT"));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectAtIndex:", 0);

  if (a3)
  {
    CMTimeMakeFromDictionary(&v13, v10);
    *(CMTime *)a3 = v13;
  }

  return v7;
}

- (id)copyNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFAllocator *v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  CMTime v29;
  CMTime time2;
  CMTime v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CMTime time;
  CMTime v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v6 = a4;
  v38[3] = *MEMORY[0x24BDAC8D0];
  if (!-[MIOSEITrackReader drainBeforeRead](self, "drainBeforeRead"))
  {
LABEL_5:
    memset(&v36, 0, sizeof(v36));
    -[MIOSEITrackReader readNextSEIPts:deserialize:error:](self, "readNextSEIPts:deserialize:error:", &v36, v6, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v11 = 0;
    if (*a5)
    {
LABEL_17:

      return v11;
    }
    if (!v12)
    {
      -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        -[MIOSEITrackReader popFrontPts:](self, "popFrontPts:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_17;
    }
    v37[0] = CFSTR("PTS");
    time = v36;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v14;
    v37[1] = CFSTR("PTSDICT");
    v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    time = v36;
    v16 = CMTimeCopyAsDictionary(&time, v15);
    v37[2] = CFSTR("SEI");
    v38[1] = v16;
    v38[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v17);

    -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("PTS"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithObjects:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortUsingDescriptors:", v22);

    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "maxCurrentPts");

      if ((v33 & 0x100000000) != 0)
      {
        -[MIOSEITrackReader maxCurrentPts](self, "maxCurrentPts");
        time = v36;
        if (CMTimeCompare(&time, &time2) == 1)
        {
          v29 = v36;
          -[MIOSEITrackReader setMaxCurrentPts:](self, "setMaxCurrentPts:", &v29);
          -[MIOSEITrackReader setDrainBeforeRead:](self, "setDrainBeforeRead:", 1);
          -[MIOSEITrackReader popFrontPts:](self, "popFrontPts:", a3);
          v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
          v11 = v25;

          goto LABEL_17;
        }
LABEL_15:
        v25 = -[MIOSEITrackReader copyNextSEIPts:deserialize:error:](self, "copyNextSEIPts:deserialize:error:", a3, v6, a5);
        goto LABEL_16;
      }
    }
    else
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;

    }
    v31 = v36;
    -[MIOSEITrackReader setMaxCurrentPts:](self, "setMaxCurrentPts:", &v31);
    goto LABEL_15;
  }
  -[MIOSEITrackReader seiItemsBuffer](self, "seiItemsBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
  {
    -[MIOSEITrackReader setDrainBeforeRead:](self, "setDrainBeforeRead:", 0);
    goto LABEL_5;
  }
  -[MIOSEITrackReader popFrontPts:](self, "popFrontPts:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)readNextSEIPts:(id *)a3 deserialize:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  OpaqueCMBlockBuffer *v8;
  OpaqueCMBlockBuffer *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = -[MIOSEITrackReader readNextValidBlockBufferPts:](self, "readNextValidBlockBufferPts:", a3);
  if (!v8)
    return 0;
  v9 = v8;
  -[MIOSEITrackReader extractDebugSEIFromBuffer:codecType:](self, "extractDebugSEIFromBuffer:codecType:", v8, -[MIOSEITrackReader codec](self, "codec"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v9);
  if (v6)
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      v24 = 0;
      v11 = (void *)MEMORY[0x24BDD1770];
      objc_msgSend(v10, "firstObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "propertyListWithData:options:format:error:", v12, 0, &v24, a5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v10, "count") < 2)
      {
        v13 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v10;
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v12);
            objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18), 0, &v24, a5, (_QWORD)v20);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v16);
      }
    }

  }
  else
  {
    v13 = v10;
  }
LABEL_17:

  return v13;
}

- (AVAssetReaderOutput)trackOutput
{
  return (AVAssetReaderOutput *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrackOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)codec
{
  return self->_codec;
}

- (void)setCodec:(unsigned int)a3
{
  self->_codec = a3;
}

- (NSMutableArray)seiItemsBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSeiItemsBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxCurrentPts
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_maxCurrentPts, 24, 1, 0);
  return result;
}

- (void)setMaxCurrentPts:(id *)a3
{
  objc_copyStruct(&self->_maxCurrentPts, a3, 24, 1, 0);
}

- (BOOL)drainBeforeRead
{
  return self->_drainBeforeRead;
}

- (void)setDrainBeforeRead:(BOOL)a3
{
  self->_drainBeforeRead = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seiItemsBuffer, 0);
  objc_storeStrong((id *)&self->_trackOutput, 0);
}

@end
