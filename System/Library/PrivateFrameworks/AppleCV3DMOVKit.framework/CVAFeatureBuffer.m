@implementation CVAFeatureBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EE60 != -1)
    dispatch_once(&qword_254A6EE60, &unk_24CA35EE0);
  return (id)qword_254A6EE58;
}

- (BOOL)shouldReduce:(void *)a3
{
  char *v3;

  v3 = (char *)a3 + *((unsigned int *)a3 + 12);
  return !*((_WORD *)v3 + 1) || v3[84] == 1;
}

- (id)reduceBuffer:(void *)a3
{
  size_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;

  v3 = *((unsigned int *)a3 + 13);
  if (v3 > 0xF4240)
    return 0;
  v5 = *((unsigned int *)a3 + 10);
  v6 = *((unsigned int *)a3 + 12);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", (v5 + v3));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "mutableBytes");
  v9 = *(_OWORD *)a3;
  v10 = *((_QWORD *)a3 + 6);
  v11 = *((_OWORD *)a3 + 2);
  *(_OWORD *)(v8 + 16) = *((_OWORD *)a3 + 1);
  *(_OWORD *)(v8 + 32) = v11;
  *(_QWORD *)(v8 + 48) = v10;
  *(_OWORD *)v8 = v9;
  *(_QWORD *)(v8 + 40) = v5;
  *(_DWORD *)(v8 + 48) = v5;
  *(_DWORD *)(v8 + 52) = v3;
  memcpy((void *)(v8 + v5), (char *)a3 + v6, v3);
  return v7;
}

- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5
{
  return -[CVAFeatureBuffer initWithPixelBufferRef:timestamp:streamID:reduce:compress:](self, "initWithPixelBufferRef:timestamp:streamID:reduce:compress:", a3, a5, 1, 1, a4);
}

- (CVAFeatureBuffer)initWithPixelBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 streamID:(id)a5 reduce:(BOOL)a6 compress:(BOOL)a7
{
  id v13;
  CVAFeatureBuffer *v14;
  CVAFeatureBuffer *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CVAFeatureBuffer;
  v14 = -[CVAFeatureBuffer init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_pixelBufferRef = a3;
    v14->_timestamp = a4;
    objc_storeStrong((id *)&v14->_sourceStreamID, a5);
    v15->_reduce = a6;
    v15->_compressed = a7;
    CVPixelBufferRetain(v15->_pixelBufferRef);
  }

  return v15;
}

- (__CVBuffer)getPixelBuffer:(BOOL)a3
{
  CVPixelBufferRef v5;

  v5 = 0;
  if (a3)
  {
    -[CVAFeatureBuffer setOriginal_width:](self, "setOriginal_width:", -[CVAFeatureBuffer width](self, "width"));
    -[CVAFeatureBuffer setWidth:](self, "setWidth:", -[CVAFeatureBuffer bytesPerRow](self, "bytesPerRow"));
  }
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_width, self->_height, 0x4C303038u, (void *)-[NSData bytes](self->_data, "bytes"), self->_bytesPerRow, 0, 0, 0, &v5))
  {
    return 0;
  }
  else
  {
    return v5;
  }
}

- (__CVBuffer)getPixelBuffer
{
  return (__CVBuffer *)MEMORY[0x24BEDD108](self, sel_getPixelBuffer_);
}

- (__CVBuffer)getPixelBufferCopy
{
  __CVBuffer *v2;
  __CVBuffer *v5;
  void *BaseAddress;

  if ((self->_bytesPerRow & 0x3F) != 0)
  {
    NSLog(CFSTR("MOVKit:CVAFeatureBuffer - ERROR - bytesPerRow %ld not multiple of 64"), a2, self->_bytesPerRow);
    return 0;
  }
  v5 = (__CVBuffer *)objc_msgSend(MEMORY[0x24BE634E8], "createRawPixelBufferWithWidth:height:pixelFormat:bytesPerRow:", LODWORD(self->_width), LODWORD(self->_height), 1278226488);
  v2 = v5;
  if (!v5)
    return v2;
  CVPixelBufferLockBaseAddress(v5, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v2);
  memcpy(BaseAddress, -[NSData bytes](self->_data, "bytes"), -[NSData length](self->_data, "length"));
  CVPixelBufferUnlockBaseAddress(v2, 0);
  return v2;
}

- (CVAFeatureBuffer)initWithCoder:(id)a3
{
  id v4;
  CVAFeatureBuffer *v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *data;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSData *v14;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CVAFeatureBuffer;
  v5 = -[CVAFeatureBuffer init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CVAFeatureBuffer setWidth:](v5, "setWidth:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("w")));
    -[CVAFeatureBuffer setHeight:](v5, "setHeight:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("h")));
    -[CVAFeatureBuffer setBytesPerRow:](v5, "setBytesPerRow:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bpr")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAFeatureBuffer setData:](v5, "setData:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVAFeatureBuffer setTimestamp:](v5, "setTimestamp:");
    -[CVAFeatureBuffer setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sct")));
    -[CVAFeatureBuffer setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("st"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAFeatureBuffer setSourceStreamID:](v5, "setSourceStreamID:", v8);

    -[CVAFeatureBuffer setCompressed:](v5, "setCompressed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("c")));
    if (-[CVAFeatureBuffer compressed](v5, "compressed"))
    {
      data = v5->_data;
      v16 = 0;
      -[NSData decompressedDataUsingAlgorithm:error:](data, "decompressedDataUsingAlgorithm:error:", 1, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("CVAFeatureBuffer - ERROR - %@"), v13);
      }
      else
      {
        v14 = v10;
        v13 = v5->_data;
        v5->_data = v14;
      }

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *BaseAddress;
  void *v7;
  NSData *v8;
  id v9;
  NSData *data;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x212BC8864]();
  CVPixelBufferLockBaseAddress(self->_pixelBufferRef, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(self->_pixelBufferRef);
  if (!self->_reduce || !-[CVAFeatureBuffer shouldReduce:](self, "shouldReduce:", BaseAddress))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, CVPixelBufferGetDataSize(self->_pixelBufferRef), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
LABEL_6:
    self->_width = CVPixelBufferGetWidth(self->_pixelBufferRef);
    self->_height = CVPixelBufferGetHeight(self->_pixelBufferRef);
    self->_bytesPerRow = CVPixelBufferGetBytesPerRow(self->_pixelBufferRef);
    if (self->_compressed)
    {
      v14 = 0;
      objc_msgSend(v7, "compressedDataUsingAlgorithm:error:", 1, &v14);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      data = self->_data;
      self->_data = v8;

      if (v9)
      {
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("CVAFeatureBuffer - ERROR - %@"), v11);

        goto LABEL_11;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_data, v7);
    }
    objc_msgSend(v4, "encodeInteger:forKey:", -[CVAFeatureBuffer width](self, "width"), CFSTR("w"));
    objc_msgSend(v4, "encodeInteger:forKey:", -[CVAFeatureBuffer height](self, "height"), CFSTR("h"));
    objc_msgSend(v4, "encodeInteger:forKey:", -[CVAFeatureBuffer bytesPerRow](self, "bytesPerRow"), CFSTR("bpr"));
    -[CVAFeatureBuffer data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("d"));

    -[CVAFeatureBuffer timestamp](self, "timestamp");
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("t"));
    objc_msgSend(v4, "encodeInt64:forKey:", -[CVAFeatureBuffer syncTimestamp](self, "syncTimestamp"), CFSTR("sct"));
    -[CVAFeatureBuffer sourceStreamID](self, "sourceStreamID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("st"));

    objc_msgSend(v4, "encodeBool:forKey:", -[CVAFeatureBuffer compressed](self, "compressed"), CFSTR("c"));
    objc_msgSend(v4, "encodeInt64:forKey:", -[CVAFeatureBuffer frameId](self, "frameId"), CFSTR("fi"));
    goto LABEL_11;
  }
  -[CVAFeatureBuffer reduceBuffer:](self, "reduceBuffer:", BaseAddress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_6;
LABEL_4:
  NSLog(CFSTR("CVAFeatureBuffer - ERROR - failed to parse pixelBuffer"));
LABEL_11:
  CVPixelBufferUnlockBaseAddress(self->_pixelBufferRef, 1uLL);
  CVPixelBufferRelease(self->_pixelBufferRef);
  self->_pixelBufferRef = 0;

  objc_autoreleasePoolPop(v5);
}

- (void)dealloc
{
  __CVBuffer *pixelBufferRef;
  objc_super v4;

  pixelBufferRef = self->_pixelBufferRef;
  if (pixelBufferRef)
  {
    CVPixelBufferRelease(pixelBufferRef);
    self->_pixelBufferRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVAFeatureBuffer;
  -[CVAFeatureBuffer dealloc](&v4, sel_dealloc);
}

+ (id)streamName:(id)a3
{
  __CFString *v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.reality.kind.data.%@.desgen"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("CVAFeatureBuffer");
  }
  return v3;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (NSString)sourceStreamID
{
  return self->_sourceStreamID;
}

- (void)setSourceStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceStreamID, a3);
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (unint64_t)original_width
{
  return self->_original_width;
}

- (void)setOriginal_width:(unint64_t)a3
{
  self->_original_width = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)reduce
{
  return self->_reduce;
}

- (void)setReduce:(BOOL)a3
{
  self->_reduce = a3;
}

- (__CVBuffer)pixelBufferRef
{
  return self->_pixelBufferRef;
}

- (void)setPixelBufferRef:(__CVBuffer *)a3
{
  self->_pixelBufferRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceStreamID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
