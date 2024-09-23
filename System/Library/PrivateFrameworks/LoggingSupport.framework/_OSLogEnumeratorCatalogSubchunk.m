@implementation _OSLogEnumeratorCatalogSubchunk

- (_OSLogEnumeratorCatalog)catalog
{
  return self->_catalog;
}

- (unint64_t)endTime
{
  return self->_et;
}

- (unint64_t)oldestTime
{
  return self->_ot;
}

- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  _OSLogEnumeratorCatalogSubchunk *v11;
  uint64_t v12;
  NSMutableDictionary *decompressedChunks;
  unint64_t var2;
  objc_super v16;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_OSLogEnumeratorCatalogSubchunk;
  v11 = -[_OSLogEnumeratorCatalogSubchunk init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
    decompressedChunks = v11->_decompressedChunks;
    v11->_decompressedChunks = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_catalog, a3);
    v11->_range.location = location;
    v11->_range.length = length;
    if (a4)
    {
      v11->_subchunk = a4;
      v11->_ot = a4->var1;
      var2 = a4->var2;
    }
    else
    {
      v11->_ot = 0;
      var2 = -1;
    }
    v11->_et = var2;
  }

  return v11;
}

- (id)_decompressedBufferForChunk:(tracev3_chunk_s *)a3 subchunk:(catalog_subchunk_s *)a4
{
  void *v7;
  _OSLogChunkBuffer *v8;
  _OSLogChunkBuffer *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_decompressedChunks, "objectForKeyedSubscript:", v7);
  v8 = (_OSLogChunkBuffer *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_OSLogChunkBuffer initWithChunk:subchunk:]([_OSLogChunkBuffer alloc], "initWithChunk:subchunk:", a3, a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_decompressedChunks, "setObject:forKeyedSubscript:", v8, v7);
  }
  v9 = v8;

  return v9;
}

- (void)enumerateChunksUsingBlock:(id)a3
{
  id v4;
  void *v5;
  NSUInteger length;
  NSUInteger location;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_OSLogEnumeratorCatalog store](self->_catalog, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke;
  v9[3] = &unk_1E4156B10;
  v9[4] = self;
  v10 = v4;
  location = self->_range.location;
  length = self->_range.length;
  v8 = v4;
  objc_msgSend(v5, "enumerateChunksInRange:usingBlock:", location, length, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_decompressedChunks, 0);
}

- (_OSLogEnumeratorCatalogSubchunk)initWithCatalog:(id)a3 subchunk:(catalog_subchunk_s *)a4 range:(_NSRange)a5 oldestTime:(unint64_t)a6 endTime:(unint64_t)a7
{
  _OSLogEnumeratorCatalogSubchunk *result;

  result = -[_OSLogEnumeratorCatalogSubchunk initWithCatalog:subchunk:range:](self, "initWithCatalog:subchunk:range:", a3, a4, a5.location, a5.length);
  if (result)
  {
    result->_ot = a6;
    result->_et = a7;
  }
  return result;
}

- (int64_t)oldestTimeCompare:(id)a3
{
  unint64_t ot;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  int64_t v7;

  ot = self->_ot;
  v4 = *((_QWORD *)a3 + 6);
  v5 = ot >= v4;
  v6 = ot == v4;
  v7 = -1;
  if (v5)
    v7 = 1;
  if (v6)
    return 0;
  else
    return v7;
}

- (int64_t)endTimeCompare:(id)a3
{
  unint64_t et;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  int64_t v7;

  et = self->_et;
  v4 = *((_QWORD *)a3 + 7);
  v5 = et >= v4;
  v6 = et == v4;
  v7 = -1;
  if (v5)
    v7 = 1;
  if (v6)
    return 0;
  else
    return v7;
}

@end
