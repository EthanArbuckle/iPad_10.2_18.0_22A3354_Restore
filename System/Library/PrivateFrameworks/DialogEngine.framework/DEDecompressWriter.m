@implementation DEDecompressWriter

- (DEDecompressWriter)initWithWriter:(id)a3
{
  id v5;
  DEDecompressWriter *v6;
  DEDecompressWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DEDecompressWriter;
  v6 = -[DEDecompressWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_writer, a3);
    *(_WORD *)&v7->_streamInitialized = 0;
    +[DECompressUtil initZStream:](DECompressUtil, "initZStream:", &v7->_stream);
    if (inflateInit2_(&v7->_stream, 47, "1.2.12", 112))
    {

      v7 = 0;
    }
    else
    {
      v7->_streamInitialized = 1;
    }
  }

  return v7;
}

- (DEDecompressWriter)init
{
  return -[DEDecompressWriter initWithWriter:](self, "initWithWriter:", 0);
}

- (void)dealloc
{
  DEWriter *writer;
  DEWriter *v4;
  objc_super v5;

  writer = self->_writer;
  if (writer)
  {
    -[DEWriter close](writer, "close");
    v4 = self->_writer;
    self->_writer = 0;

  }
  if (self->_streamInitialized)
  {
    if (inflateEnd(&self->_stream))
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to deallocate deflate stream"));
    self->_streamInitialized = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DEDecompressWriter;
  -[DEDecompressWriter dealloc](&v5, sel_dealloc);
}

- (id)decompress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    if (self->_streamEnded && objc_msgSend(v5, "length"))
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Attempt to write after stream end"));
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v5, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[DECompressUtil advanceZStream:function:input:output:flush:streamEnded:](DECompressUtil, "advanceZStream:function:input:output:flush:streamEnded:", &self->_stream, MEMORY[0x1E0DE93A0], v5, v7, 0, &self->_streamEnded))
      {
        v6 = v7;
      }
      else
      {
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to advance compress z_stream!"));
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)close
{
  DEWriter *writer;
  DEWriter *v4;

  writer = self->_writer;
  if (writer)
  {
    -[DEWriter close](writer, "close");
    v4 = self->_writer;
    self->_writer = 0;

  }
}

- (void)writeData:(id)a3
{
  DEWriter *writer;
  id v4;

  writer = self->_writer;
  -[DEDecompressWriter decompress:](self, "decompress:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DEWriter writeData:](writer, "writeData:");

}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
  objc_storeStrong((id *)&self->_writer, a3);
}

- (z_stream_s)stream
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->zfree;
  v4 = *(_OWORD *)&self->reserved;
  *(_OWORD *)&retstr->zalloc = *(_OWORD *)&self->data_type;
  *(_OWORD *)&retstr->opaque = v4;
  *(_OWORD *)&retstr->adler = *(_OWORD *)&self[1].avail_in;
  v5 = *(_OWORD *)&self->total_out;
  *(_OWORD *)&retstr->next_in = *(_OWORD *)&self->next_out;
  *(_OWORD *)&retstr->total_in = v5;
  *(_OWORD *)&retstr->avail_out = *(_OWORD *)&self->state;
  *(_OWORD *)&retstr->msg = v3;
  return self;
}

- (void)setStream:(z_stream_s *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&a3->next_in;
  v4 = *(_OWORD *)&a3->total_in;
  *(_OWORD *)&self->_stream.avail_out = *(_OWORD *)&a3->avail_out;
  *(_OWORD *)&self->_stream.total_in = v4;
  *(_OWORD *)&self->_stream.next_in = v3;
  v5 = *(_OWORD *)&a3->msg;
  v6 = *(_OWORD *)&a3->zalloc;
  v7 = *(_OWORD *)&a3->opaque;
  *(_OWORD *)&self->_stream.adler = *(_OWORD *)&a3->adler;
  *(_OWORD *)&self->_stream.opaque = v7;
  *(_OWORD *)&self->_stream.zalloc = v6;
  *(_OWORD *)&self->_stream.msg = v5;
}

- (BOOL)streamInitialized
{
  return self->_streamInitialized;
}

- (void)setStreamInitialized:(BOOL)a3
{
  self->_streamInitialized = a3;
}

- (BOOL)streamEnded
{
  return self->_streamEnded;
}

- (void)setStreamEnded:(BOOL)a3
{
  self->_streamEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

@end
