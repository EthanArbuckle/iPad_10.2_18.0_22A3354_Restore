@implementation CKOperationMMCSRequestOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  v8 = objc_msgSend_resumableContainerLimpMode(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(v20, v9, v8, (uint64_t)CFSTR("ResumableContainerLimpMode"));
  v13 = objc_msgSend_chunkingLibraryCorruptionMode(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v20, v14, v13, (uint64_t)CFSTR("ChunkingLibraryCorruptionMode"));
  v18 = objc_msgSend_insufficientDiskSpaceMode(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v20, v19, v18, (uint64_t)CFSTR("InsufficientDiskSpaceMode"));
  objc_autoreleasePoolPop(v4);

}

- (CKOperationMMCSRequestOptions)initWithCoder:(id)a3
{
  id v4;
  CKOperationMMCSRequestOptions *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKOperationMMCSRequestOptions;
  v5 = -[CKOperationMMCSRequestOptions init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_resumableContainerLimpMode = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)CFSTR("ResumableContainerLimpMode"), v8);
    v5->_chunkingLibraryCorruptionMode = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("ChunkingLibraryCorruptionMode"), v10);
    v5->_insufficientDiskSpaceMode = objc_msgSend_decodeBoolForKey_(v4, v11, (uint64_t)CFSTR("InsufficientDiskSpaceMode"), v12);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)resumableContainerLimpMode
{
  return self->_resumableContainerLimpMode;
}

- (void)setResumableContainerLimpMode:(BOOL)a3
{
  self->_resumableContainerLimpMode = a3;
}

- (BOOL)chunkingLibraryCorruptionMode
{
  return self->_chunkingLibraryCorruptionMode;
}

- (void)setChunkingLibraryCorruptionMode:(BOOL)a3
{
  self->_chunkingLibraryCorruptionMode = a3;
}

- (BOOL)insufficientDiskSpaceMode
{
  return self->_insufficientDiskSpaceMode;
}

- (void)setInsufficientDiskSpaceMode:(BOOL)a3
{
  self->_insufficientDiskSpaceMode = a3;
}

@end
