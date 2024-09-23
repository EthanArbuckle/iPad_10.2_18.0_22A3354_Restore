@implementation _OSLogEnumeratorCatalog

- (catalog_s)catalog
{
  catalog_s *result;

  result = self->_catalog;
  if (!result)
  {
    result = (catalog_s *)_catalog_create_with_chunk((uint64_t)self->_chunk, 0);
    self->_catalog = result;
  }
  return result;
}

- (_OSLogChunkStore)store
{
  return self->_store;
}

- (tracev3_chunk_s)fileHeader
{
  return self->_fileHeader;
}

- (unint64_t)oldestTime
{
  return self->_ot;
}

- (void)unionWithRange:(_NSRange)a3
{
  self->_chunkRange = NSUnionRange(self->_chunkRange, a3);
}

- (_OSLogEnumeratorCatalog)initWithStore:(id)a3 index:(id)a4 fileHeader:(tracev3_chunk_s *)a5 range:(_NSRange)a6 chunk:(tracev3_chunk_s *)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  _OSLogEnumeratorCatalog *v16;
  _OSLogEnumeratorCatalog *v17;
  unint64_t *p_ot;
  objc_super v20;

  length = a6.length;
  location = a6.location;
  v14 = a3;
  v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_OSLogEnumeratorCatalog;
  v16 = -[_OSLogEnumeratorCatalog init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_index, v15);
    objc_storeStrong((id *)&v17->_store, a3);
    *(_OWORD *)&v17->_ot = xmmword_19EA7F270;
    p_ot = &v17->_ot;
    v17->_chunkRange.location = location;
    v17->_chunkRange.length = length;
    v17->_chunk = a7;
    v17->_fileHeader = a5;
    if (a7->var0.var1 == 17)
    {
      if (a7->var1.var2.var4)
      {
        *(_OWORD *)p_ot = xmmword_19EA7F230;
        _catalog_lite_read_limits((uint64_t)a7, (uint64_t)p_ot, (uint64_t)&v17->_et);
      }
    }
  }

  return v17;
}

- (unint64_t)endTime
{
  return self->_et;
}

- (void)dealloc
{
  catalog_s *catalog;
  objc_super v4;

  catalog = self->_catalog;
  if (catalog)
    _catalog_destroy((uint64_t)catalog);
  v4.receiver = self;
  v4.super_class = (Class)_OSLogEnumeratorCatalog;
  -[_OSLogEnumeratorCatalog dealloc](&v4, sel_dealloc);
}

- (void)enumerateSubchunksUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  catalog_s *catalog;
  _OSLogChunkStore *v6;
  _OSLogChunkStore *store;
  subchunk_queue_t *p_var7;
  _OSLogEnumeratorCatalogSubchunk *v9;
  _OSLogEnumeratorCatalogSubchunk *v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  catalog_subchunk_s *var0;
  __int128 v24;
  _QWORD v25[5];
  void (**v26)(id, void *);
  uint64_t *v27;

  v4 = (void (**)(id, void *))a3;
  catalog = self->_catalog;
  if (catalog
    || (catalog = (catalog_s *)_catalog_create_with_chunk((uint64_t)self->_chunk, 0), (self->_catalog = catalog) != 0))
  {
    if (catalog->var0.var0 < 0x11u)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x3010000000;
      var0 = (catalog_subchunk_s *)&unk_19EA88A4A;
      v24 = xmmword_19EA7F280;
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = -1;
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      store = self->_store;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke_2;
      v11[3] = &unk_1E4156B60;
      v11[4] = &v20;
      v11[5] = &v16;
      v11[6] = &v12;
      -[_OSLogChunkStore enumerateChunksInRange:usingBlock:](store, "enumerateChunksInRange:usingBlock:", self->_chunkRange.location, self->_chunkRange.length, v11);
      p_var7 = &self->_catalog->var7;
      do
        p_var7 = (subchunk_queue_t *)p_var7->var0;
      while (p_var7 && !p_var7[1].var1);
      v9 = [_OSLogEnumeratorCatalogSubchunk alloc];
      v10 = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:oldestTime:endTime:](v9, "initWithCatalog:subchunk:range:oldestTime:endTime:", self, p_var7, v21[4], v21[5], v17[3], v13[3]);
      v4[2](v4, v10);

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      var0 = catalog->var7.var0;
      v6 = self->_store;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56___OSLogEnumeratorCatalog_enumerateSubchunksUsingBlock___block_invoke;
      v25[3] = &unk_1E4156B38;
      v27 = &v20;
      v25[4] = self;
      v26 = v4;
      -[_OSLogChunkStore enumerateChunksInRange:usingBlock:](v6, "enumerateChunksInRange:usingBlock:", self->_chunkRange.location, self->_chunkRange.length, v25);

    }
    _Block_object_dispose(&v20, 8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_index);
}

- (const)bootUUID
{
  return (const char *)&self->_fileHeader->var1.var0.var12;
}

- (_OSLogIndex)index
{
  return (_OSLogIndex *)objc_loadWeakRetained((id *)&self->_index);
}

- (tracev3_chunk_s)chunk
{
  return self->_chunk;
}

@end
