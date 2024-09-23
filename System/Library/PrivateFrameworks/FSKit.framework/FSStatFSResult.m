@implementation FSStatFSResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[11];

  v4 = a3;
  v6[0] = -[FSStatFSResult blockSize](self, "blockSize");
  v6[1] = -[FSStatFSResult ioSize](self, "ioSize");
  v6[2] = -[FSStatFSResult totalBlocks](self, "totalBlocks");
  v6[3] = -[FSStatFSResult availableBlocks](self, "availableBlocks");
  v6[4] = -[FSStatFSResult freeBlocks](self, "freeBlocks");
  v6[5] = -[FSStatFSResult totalBytes](self, "totalBytes");
  v6[6] = -[FSStatFSResult availableBytes](self, "availableBytes");
  v6[7] = -[FSStatFSResult freeBytes](self, "freeBytes");
  v6[8] = -[FSStatFSResult totalFiles](self, "totalFiles");
  v6[9] = -[FSStatFSResult freeFiles](self, "freeFiles");
  v6[10] = -[FSStatFSResult filesystemSubType](self, "filesystemSubType");
  objc_msgSend(v4, "encodeBytes:length:forKey:", v6, 88, CFSTR("FSStatFSResult"));
  -[FSStatFSResult filesystemTypeName](self, "filesystemTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FSStatFSResult.fsTypeName"));

}

- (FSStatFSResult)initWithCoder:(id)a3
{
  id v4;
  FSStatFSResult *v5;
  id v6;
  uint64_t v7;
  FSStatFSResult *v8;
  uint64_t v9;
  NSString *filesystemTypeName;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSStatFSResult;
  v13 = 0;
  v5 = -[FSStatFSResult init](&v12, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("FSStatFSResult"), &v13);
  v8 = 0;
  if (v7 && v13 == 88)
  {
    v5->_blockSize = *(_QWORD *)v7;
    v5->_ioSize = *(_QWORD *)(v7 + 8);
    v5->_totalBlocks = *(_QWORD *)(v7 + 16);
    v5->_availableBlocks = *(_QWORD *)(v7 + 24);
    v5->_freeBlocks = *(_QWORD *)(v7 + 32);
    v5->_filesystemSubType = *(_DWORD *)(v7 + 80);
    v5->_totalBytes = *(_QWORD *)(v7 + 16) * *(_QWORD *)v7;
    v5->_availableBytes = *(_QWORD *)(v7 + 24) * *(_QWORD *)v7;
    v5->_freeBytes = *(_QWORD *)(v7 + 32) * *(_QWORD *)v7;
    v5->_totalFiles = *(_QWORD *)(v7 + 64);
    v5->_freeFiles = *(_QWORD *)(v7 + 72);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSStatFSResult.fsTypeName"));
    v9 = objc_claimAutoreleasedReturnValue();
    filesystemTypeName = v5->_filesystemTypeName;
    v5->_filesystemTypeName = (NSString *)v9;

LABEL_5:
    v8 = v5;
  }

  return v8;
}

- (FSStatFSResult)initWithFSTypeName:(id)a3
{
  id v5;
  FSStatFSResult *v6;
  FSStatFSResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSStatFSResult;
  v6 = -[FSStatFSResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_filesystemTypeName, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FSKitStatFSResult:totalBytes(%llu):availableBytes(%llu):freeBytes(%llu):totalFiles(%llu):freeFiles(%llu)"), -[FSStatFSResult totalBytes](self, "totalBytes"), -[FSStatFSResult availableBytes](self, "availableBytes"), -[FSStatFSResult freeBytes](self, "freeBytes"), -[FSStatFSResult totalFiles](self, "totalFiles"), -[FSStatFSResult freeFiles](self, "freeFiles"));
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (unint64_t)ioSize
{
  return self->_ioSize;
}

- (void)setIoSize:(unint64_t)a3
{
  self->_ioSize = a3;
}

- (unint64_t)totalBlocks
{
  return self->_totalBlocks;
}

- (void)setTotalBlocks:(unint64_t)a3
{
  self->_totalBlocks = a3;
}

- (unint64_t)availableBlocks
{
  return self->_availableBlocks;
}

- (void)setAvailableBlocks:(unint64_t)a3
{
  self->_availableBlocks = a3;
}

- (unint64_t)freeBlocks
{
  return self->_freeBlocks;
}

- (void)setFreeBlocks:(unint64_t)a3
{
  self->_freeBlocks = a3;
}

- (unint64_t)usedBlocks
{
  return self->_usedBlocks;
}

- (void)setUsedBlocks:(unint64_t)a3
{
  self->_usedBlocks = a3;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (unint64_t)availableBytes
{
  return self->_availableBytes;
}

- (void)setAvailableBytes:(unint64_t)a3
{
  self->_availableBytes = a3;
}

- (unint64_t)freeBytes
{
  return self->_freeBytes;
}

- (void)setFreeBytes:(unint64_t)a3
{
  self->_freeBytes = a3;
}

- (unint64_t)usedBytes
{
  return self->_usedBytes;
}

- (void)setUsedBytes:(unint64_t)a3
{
  self->_usedBytes = a3;
}

- (unint64_t)totalFiles
{
  return self->_totalFiles;
}

- (void)setTotalFiles:(unint64_t)a3
{
  self->_totalFiles = a3;
}

- (unint64_t)freeFiles
{
  return self->_freeFiles;
}

- (void)setFreeFiles:(unint64_t)a3
{
  self->_freeFiles = a3;
}

- (unsigned)filesystemSubType
{
  return self->_filesystemSubType;
}

- (void)setFilesystemSubType:(unsigned int)a3
{
  self->_filesystemSubType = a3;
}

- (NSString)filesystemTypeName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesystemTypeName, 0);
}

@end
