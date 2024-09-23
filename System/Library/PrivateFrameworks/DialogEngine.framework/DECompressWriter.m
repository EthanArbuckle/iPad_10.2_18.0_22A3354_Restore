@implementation DECompressWriter

- (DECompressWriter)initWithWriter:(id)a3
{
  id v5;
  DECompressWriter *v6;
  DECompressWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DECompressWriter;
  v6 = -[DECompressWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_compressed = 1;
    objc_storeStrong((id *)&v6->_writer, a3);
    *(_WORD *)&v7->_streamInitialized = 0;
    +[DECompressUtil initZStream:](DECompressUtil, "initZStream:", &v7->_stream);
    if (deflateInit2_(&v7->_stream, -1, 8, 31, 8, 0, "1.2.12", 112))
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

- (DECompressWriter)init
{
  return -[DECompressWriter initWithWriter:](self, "initWithWriter:", 0);
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
    if (deflateEnd(&self->_stream))
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to deallocate deflate stream"));
    self->_streamInitialized = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DECompressWriter;
  -[DECompressWriter dealloc](&v5, sel_dealloc);
}

- (id)compress:(id)a3 finalize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!self->_compressed)
    goto LABEL_18;
  if (!self->_stream.total_in
    && (!v6
     || (unint64_t)objc_msgSend(v6, "length") < 2
     || +[DECompressWriter isCompressed:](DECompressWriter, "isCompressed:", v7)))
  {
    if ((unint64_t)objc_msgSend(v7, "length") <= 1)
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to supply enough initial input data to determine if input is already compressed; assuming it is"));
    self->_compressed = 0;
    goto LABEL_18;
  }
  if (v4)
  {
    if (!v7)
      v7 = (id)objc_opt_new();
    goto LABEL_14;
  }
  if (!v7 || !objc_msgSend(v7, "length"))
  {
LABEL_18:
    v7 = v7;
    v8 = v7;
    goto LABEL_26;
  }
LABEL_14:
  if (self->_streamEnded && v7 && objc_msgSend(v7, "length"))
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Attempt to write after stream end"));
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", getpagesize());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v10 = 4;
    else
      v10 = 0;
    if (+[DECompressUtil advanceZStream:function:input:output:flush:streamEnded:](DECompressUtil, "advanceZStream:function:input:output:flush:streamEnded:", &self->_stream, MEMORY[0x1E0DE92C0], v7, v9, v10, &self->_streamEnded))
    {
      v8 = v9;
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to advance compress z_stream!"));
      v8 = 0;
    }

  }
LABEL_26:

  return v8;
}

- (void)close
{
  DEWriter *writer;
  void *v4;
  DEWriter *v5;
  DEWriter *v6;

  if (!self->_streamEnded)
  {
    writer = self->_writer;
    -[DECompressWriter compress:finalize:](self, "compress:finalize:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEWriter writeData:](writer, "writeData:", v4);

  }
  v5 = self->_writer;
  if (v5)
  {
    -[DEWriter close](v5, "close");
    v6 = self->_writer;
    self->_writer = 0;

  }
}

- (void)writeData:(id)a3
{
  DEWriter *writer;
  id v4;

  writer = self->_writer;
  -[DECompressWriter compress:finalize:](self, "compress:finalize:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DEWriter writeData:](writer, "writeData:");

}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
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

+ (BOOL)isCompressed:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  v6 = v3
    && (unint64_t)objc_msgSend(v3, "length") >= 2
    && (v5 = objc_retainAutorelease(v4), *(_BYTE *)objc_msgSend(v5, "bytes") == 31)
    && *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v5), "bytes") + 1) == 139;

  return v6;
}

@end
