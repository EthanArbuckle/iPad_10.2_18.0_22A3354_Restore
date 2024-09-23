@implementation MSObjectInfoDataset

- (MSObjectInfoDataset)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSObjectInfoDataset;
  return -[MSObjectInfoDataset init](&v3, sel_init);
}

- (MSObjectInfoDataset)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[MSObjectInfoDataset initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

- (MSObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4
{
  MSObjectInfoDataset *v6;
  uint64_t v7;
  NSString *filename;
  char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSObjectInfoDataset;
  v6 = -[MSObjectInfoDataset init](&v11, sel_init);
  if (v6)
  {
    v10 = a3;
    v6->_objectHandle = ReadUInt32(&v10);
    ReadUInt32(&v10);
    v6->_objectFormat = ReadUInt16(&v10);
    v6->_protectionStatus = ReadUInt16(&v10);
    v6->_objectCompressedSize = ReadUInt64((_QWORD **)&v10);
    v6->_thumbFormat = ReadUInt16(&v10);
    v6->_thumbCompressedSize = ReadUInt32(&v10);
    v6->_thumbOffset = ReadUInt32(&v10);
    v6->_thumbPixWidth = ReadUInt32(&v10);
    v6->_thumbPixHeight = ReadUInt32(&v10);
    v6->_imagePixWidth = ReadUInt32(&v10);
    v6->_imagePixHeight = ReadUInt32(&v10);
    v6->_imageBitDepth = ReadUInt32(&v10);
    v6->_parentObject = ReadUInt32(&v10);
    v6->_associationType = ReadUInt16(&v10);
    v6->_imageOrientation = ReadUInt16(&v10);
    v6->_captureDate_tvsec = ReadUInt64((_QWORD **)&v10);
    v6->_modificationDate_tvsec = ReadUInt64((_QWORD **)&v10);
    CopyUnicodeStringWithLengthByteFromBufferMaxSize((const void **)&v10, (unint64_t)&a3[a4]);
    v7 = objc_claimAutoreleasedReturnValue();
    filename = v6->_filename;
    v6->_filename = (NSString *)v7;

  }
  return v6;
}

- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4
{
  NSUInteger v6;
  unsigned int v7;

  v6 = -[NSString length](self->_filename, "length");
  v7 = 2 * v6 + 78;
  if (!v6)
    v7 = 76;
  *a3 = v7;
  *a4 = v7 + 8;
}

- (NSData)content
{
  id v3;
  id v4;
  uint64_t v6;
  _WORD *v7;

  v6 = 0;
  -[MSObjectInfoDataset contentLength:bufferLength:](self, "contentLength:bufferLength:", (char *)&v6 + 4, &v6);
  v3 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v4 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", v6));
  v7 = (_WORD *)objc_msgSend(v4, "mutableBytes");
  WriteUInt32((_DWORD **)&v7, self->_objectHandle);
  WriteUInt32((_DWORD **)&v7, SHIDWORD(v6));
  WriteUInt16(&v7, self->_objectFormat);
  WriteUInt16(&v7, self->_protectionStatus);
  WriteUInt64((_QWORD **)&v7, self->_objectCompressedSize);
  WriteUInt16(&v7, self->_thumbFormat);
  WriteUInt32((_DWORD **)&v7, self->_thumbCompressedSize);
  WriteUInt32((_DWORD **)&v7, self->_thumbOffset);
  WriteUInt32((_DWORD **)&v7, self->_thumbPixWidth);
  WriteUInt32((_DWORD **)&v7, self->_thumbPixHeight);
  WriteUInt32((_DWORD **)&v7, self->_imagePixWidth);
  WriteUInt32((_DWORD **)&v7, self->_imagePixHeight);
  WriteUInt32((_DWORD **)&v7, self->_imageBitDepth);
  WriteUInt32((_DWORD **)&v7, self->_parentObject);
  WriteUInt16(&v7, self->_associationType);
  WriteUInt16(&v7, self->_imageOrientation);
  WriteUInt64((_QWORD **)&v7, self->_captureDate_tvsec);
  WriteUInt64((_QWORD **)&v7, self->_modificationDate_tvsec);
  WriteUnicodeStringWithLengthByteToBuffer((_BYTE **)&v7, self->_filename);
  return (NSData *)v4;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)parentObject
{
  return self->_parentObject;
}

- (void)setParentObject:(unsigned int)a3
{
  self->_parentObject = a3;
}

- (unsigned)associationType
{
  return self->_associationType;
}

- (void)setAssociationType:(unsigned __int16)a3
{
  self->_associationType = a3;
}

- (unsigned)associationDesc
{
  return self->_associationDesc;
}

- (void)setAssociationDesc:(unsigned int)a3
{
  self->_associationDesc = a3;
}

- (unsigned)objectFormat
{
  return self->_objectFormat;
}

- (void)setObjectFormat:(unsigned __int16)a3
{
  self->_objectFormat = a3;
}

- (unsigned)protectionStatus
{
  return self->_protectionStatus;
}

- (void)setProtectionStatus:(unsigned __int16)a3
{
  self->_protectionStatus = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  self->_objectCompressedSize = a3;
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(unsigned __int16)a3
{
  self->_imageOrientation = a3;
}

- (unsigned)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (void)setThumbCompressedSize:(unsigned int)a3
{
  self->_thumbCompressedSize = a3;
}

- (unsigned)thumbFormat
{
  return self->_thumbFormat;
}

- (void)setThumbFormat:(unsigned __int16)a3
{
  self->_thumbFormat = a3;
}

- (unsigned)thumbOffset
{
  return self->_thumbOffset;
}

- (void)setThumbOffset:(unsigned int)a3
{
  self->_thumbOffset = a3;
}

- (unsigned)thumbPixWidth
{
  return self->_thumbPixWidth;
}

- (void)setThumbPixWidth:(unsigned int)a3
{
  self->_thumbPixWidth = a3;
}

- (unsigned)thumbPixHeight
{
  return self->_thumbPixHeight;
}

- (void)setThumbPixHeight:(unsigned int)a3
{
  self->_thumbPixHeight = a3;
}

- (unsigned)imagePixWidth
{
  return self->_imagePixWidth;
}

- (void)setImagePixWidth:(unsigned int)a3
{
  self->_imagePixWidth = a3;
}

- (unsigned)imagePixHeight
{
  return self->_imagePixHeight;
}

- (void)setImagePixHeight:(unsigned int)a3
{
  self->_imagePixHeight = a3;
}

- (unsigned)imageBitDepth
{
  return self->_imageBitDepth;
}

- (void)setImageBitDepth:(unsigned int)a3
{
  self->_imageBitDepth = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)captureDate_tvsec
{
  return self->_captureDate_tvsec;
}

- (void)setCaptureDate_tvsec:(unint64_t)a3
{
  self->_captureDate_tvsec = a3;
}

- (unint64_t)modificationDate_tvsec
{
  return self->_modificationDate_tvsec;
}

- (void)setModificationDate_tvsec:(unint64_t)a3
{
  self->_modificationDate_tvsec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
