@implementation VCPDataDecompressor

- (VCPDataDecompressor)init
{
  VCPDataDecompressor *v2;
  size_t v3;
  uint64_t v4;
  NSMutableData *scratchData;
  uint64_t v6;
  NSMutableData *resultData;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPDataDecompressor;
  v2 = -[VCPDataDecompressor init](&v9, sel_init);
  if (v2)
  {
    v3 = compression_decode_scratch_buffer_size(COMPRESSION_ZLIB);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      scratchData = v2->_scratchData;
      v2->_scratchData = (NSMutableData *)v4;

    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x200000);
    v6 = objc_claimAutoreleasedReturnValue();
    resultData = v2->_resultData;
    v2->_resultData = (NSMutableData *)v6;

  }
  return v2;
}

+ (id)decompressor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)decompressData:(id)a3
{
  NSMutableData *resultData;
  id v5;
  uint8_t *v6;
  size_t v7;
  id v8;
  const uint8_t *v9;
  size_t v10;
  void *v11;

  resultData = self->_resultData;
  v5 = a3;
  v6 = -[NSMutableData mutableBytes](resultData, "mutableBytes");
  v7 = -[NSMutableData length](self->_resultData, "length");
  v8 = objc_retainAutorelease(v5);
  v9 = (const uint8_t *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = (void *)compression_decode_buffer(v6, v7, v9, v10, -[NSMutableData mutableBytes](self->_scratchData, "mutableBytes"), COMPRESSION_ZLIB);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_resultData, "mutableBytes"), v11, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_scratchData, 0);
}

@end
