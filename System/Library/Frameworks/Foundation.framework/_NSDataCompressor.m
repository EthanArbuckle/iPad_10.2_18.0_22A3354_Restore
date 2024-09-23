@implementation _NSDataCompressor

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4 flags:(int)a5
{
  int status;
  BOOL result;
  char *dst_ptr;
  $5EDF551D13777AE05B17EA2C6AA46974 *p_stream;
  int v12;
  unsigned __int8 *buffer;

  status = self->_status;
  if (status)
  {
    return !a4 && status == 1;
  }
  else
  {
    p_stream = &self->_stream;
    dst_ptr = self->_stream.dst_ptr;
    self->_stream.src_ptr = a3;
    self->_stream.src_size = a4;
    if (dst_ptr == (char *)&_NSDataCompressorEmptyBuffer)
    {
      self->_stream.dst_ptr = (char *)self->_buffer;
      self->_stream.dst_size = 1024;
    }
    v12 = 0;
    buffer = self->_buffer;
    while (!v12)
    {
      if ((a5 & 1) == 0 && !self->_stream.src_size)
      {
        result = 1;
        goto LABEL_26;
      }
      v12 = compression_stream_process((compression_stream *)p_stream, a5);
      self->_status = v12;
      if (!v12 && !self->_stream.dst_size)
      {
        (*((void (**)(void))self->_dataHandler + 2))();
        self->_stream.dst_ptr = (char *)buffer;
        self->_stream.dst_size = 1024;
        v12 = self->_status;
      }
    }
    if (v12 == 1)
    {
      (*((void (**)(void))self->_dataHandler + 2))();
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0;
      v12 = self->_status;
    }
    else if (v12 == -1 && buffer != (unsigned __int8 *)&_NSDataCompressorEmptyBuffer)
    {
      result = 0;
      self->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      self->_stream.dst_size = 0;
      goto LABEL_26;
    }
    result = v12 != -1 && self->_stream.src_size == 0;
LABEL_26:
    self->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
    self->_stream.src_size = 0;
  }
  return result;
}

- (BOOL)processBytes:(char *)a3 size:(unint64_t)a4
{
  return -[_NSDataCompressor processBytes:size:flags:](self, "processBytes:size:flags:", a3, a4, 0);
}

- (_NSDataCompressor)initWithAlgorithm:(int)a3 operation:(int)a4 dataHandler:(id)a5
{
  char *v8;
  _NSDataCompressor *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_NSDataCompressor;
  v8 = -[_NSDataCompressor init](&v11, sel_init);
  v9 = (_NSDataCompressor *)v8;
  if (v8)
  {
    if (compression_stream_init((compression_stream *)(v8 + 8), (compression_stream_operation)a4, (compression_algorithm)a3))
    {

      return 0;
    }
    else
    {
      v9->_stream.dst_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.dst_size = 0;
      v9->_stream.src_ptr = (char *)&_NSDataCompressorEmptyBuffer;
      v9->_stream.src_size = 0;
      v9->_operation = a4;
      v9->_status = 0;
      v9->_dataHandler = (id)objc_msgSend(a5, "copy");
    }
  }
  return v9;
}

- (BOOL)finishProcessing
{
  return -[_NSDataCompressor processBytes:size:flags:](self, "processBytes:size:flags:", &_NSDataCompressorEmptyBuffer, 0, 1);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  compression_stream_destroy((compression_stream *)&self->_stream);

  v3.receiver = self;
  v3.super_class = (Class)_NSDataCompressor;
  -[_NSDataCompressor dealloc](&v3, sel_dealloc);
}

@end
