@implementation _OSLogEnumeratorOversizeChunk

- (_OSLogEnumeratorOversizeChunk)initWithSubchunk:(id)a3 chunk:(tracev3_chunk_s *)a4
{
  id v7;
  _OSLogEnumeratorOversizeChunk *v8;
  _OSLogEnumeratorOversizeChunk *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_OSLogEnumeratorOversizeChunk;
  v8 = -[_OSLogEnumeratorOversizeChunk init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_subchunk, a3);
    v9->_chunk = a4;
  }

  return v9;
}

- (unint64_t)timestamp
{
  tracev3_chunk_s *chunk;

  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578)
    return chunk->var1.var2.var6;
  else
    return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subchunk, 0);
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[_OSLogEnumeratorOversizeChunk timestamp](self, "timestamp");
  if (v5 == objc_msgSend(v4, "timestamp"))
  {
    v6 = 0;
  }
  else
  {
    v7 = -[_OSLogEnumeratorOversizeChunk timestamp](self, "timestamp");
    if (v7 < objc_msgSend(v4, "timestamp"))
      v6 = -1;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)matches:(unsigned int)a3 procinfo:(catalog_procinfo_s *)a4
{
  tracev3_chunk_s *chunk;
  unint64_t var0;
  unint64_t var3;
  _DWORD *p_var3;

  chunk = self->_chunk;
  var0 = chunk->var1.var3.var0;
  var3 = a4->var3;
  if (chunk->var0.var0 == 24578)
  {
    if (var0 == var3 && chunk->var1.var3.var1 == a4->var4)
    {
      p_var3 = &chunk->var1.var0.var3;
      return *p_var3 == a3;
    }
  }
  else if (var0 == var3)
  {
    p_var3 = &chunk->var1.var3.var1;
    return *p_var3 == a3;
  }
  return 0;
}

- (void)fillMessage:(os_log_message_s *)a3
{
  tracev3_chunk_s *chunk;
  char *var6;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;

  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578)
  {
    var6 = (char *)chunk->var1.var8.var6;
    v5 = chunk->var1.var6.var6;
    v6 = (char *)&chunk->var1.var8.var6[v5];
    v7 = 46;
  }
  else
  {
    var6 = (char *)&chunk->var1.var10[16];
    v5 = chunk->var1.var2.var5[1];
    v6 = (char *)&chunk->var1.var10[v5 + 16];
    v7 = 30;
  }
  v8 = *(unsigned __int16 *)((char *)&chunk->var0.var0 + v7);
  a3->var11 = var6;
  a3->var12 = v5;
  a3->var13 = v6;
  a3->var14 = v8;
}

- (void)fillProxy:(id)a3
{
  tracev3_chunk_s *chunk;
  unsigned __int8 *var6;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t var7;

  chunk = self->_chunk;
  if (chunk->var0.var0 == 24578)
  {
    var6 = chunk->var1.var8.var6;
    v6 = chunk->var1.var6.var6;
    v7 = &chunk->var1.var8.var6[v6];
    var7 = chunk->var1.var6.var7;
  }
  else
  {
    var6 = &chunk->var1.var10[16];
    v6 = chunk->var1.var2.var5[1];
    v7 = &chunk->var1.var10[v6 + 16];
    var7 = chunk->var1.var2.var5[2];
  }
  objc_msgSend(a3, "_setBuffer:size:privateBuffer:privateSize:", var6, v6, v7, var7);
}

@end
