@implementation _OSLogIndexFile

- (unint64_t)oldestTime
{
  return self->_ot;
}

- (char)path
{
  return self->_path;
}

- (_OSLogIndexFile)initWithTraceFile:(id)a3 error:(id *)a4
{
  id v7;
  _OSLogIndexFile *v8;
  _OSLogIndexFile *v9;
  _OSLogIndexFile *v10;
  _BOOL4 v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_OSLogIndexFile;
  v8 = -[_OSLogIndexFile init](&v13, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_4:
    v10 = v9;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v8->_cfr, a3);
  v9->_ot = -1;
  v9->_cot_header = -1;
  v9->_cot = -1;
  v9->_timespanDetermined = 0;
  -[_OSLogChunkFileReference path](v9->_cfr, "path");
  strlen(-[_OSLogChunkFileReference path](v9->_cfr, "path"));
  v9->_path = (char *)_os_trace_memdup();
  v10 = -[_OSLogChunkFileReference copyMappedChunkFile:](v9->_cfr, "copyMappedChunkFile:", a4);
  if (v10)
  {
    v11 = -[_OSLogIndexFile _loadHeaderMetadata:](v9, "_loadHeaderMetadata:", v10);

    if (!v11)
    {
      v10 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v10;
}

- (BOOL)_loadHeaderMetadata:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39___OSLogIndexFile__loadHeaderMetadata___block_invoke;
  v6[3] = &unk_1E4156A98;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateChunksUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (unint64_t)endTime
{
  return self->_et;
}

- (const)bootUUID
{
  return (const char *)self->_bootu;
}

- (id)copyMappedChunkStore:(id *)a3
{
  _OSLogChunkStore *cs;
  id result;

  cs = self->_cs;
  if (cs)
    return cs;
  result = self->_cfr;
  if (result)
    return (id)objc_msgSend(result, "copyMappedChunkFile:", a3);
  qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _OSLogIndexFile had no backing store or file reference";
  __break(1u);
  return result;
}

- (BOOL)_determineTimespan
{
  NSObject *v3;
  char *path;
  _OSLogChunkFileReference *cfr;
  char *v6;
  unint64_t cet;
  _BOOL4 v8;
  NSObject *v9;
  int v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _index_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    path = self->_path;
    v11 = 136315138;
    v12 = path;
    _os_signpost_emit_with_name_impl(&dword_19EA26000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Determine Timespan", "for %s", (uint8_t *)&v11, 0xCu);
  }

  if (self->_timespanDetermined)
    goto LABEL_12;
  cfr = self->_cfr;
  if (cfr)
  {
    if (-[_OSLogChunkFileReference readXattrForTimespan:](cfr, "readXattrForTimespan:", 0))
    {
      v6 = getenv("LOG_USE_XATTRTIMESPAN");
      if (!v6 || strcmp(v6, "0"))
      {
        self->_ot = -[_OSLogChunkFileReference xattrOldestTime](self->_cfr, "xattrOldestTime");
        cet = -[_OSLogChunkFileReference xattrEndTime](self->_cfr, "xattrEndTime");
LABEL_11:
        self->_et = cet;
LABEL_12:
        v8 = 1;
        self->_timespanDetermined = 1;
        goto LABEL_13;
      }
    }
  }
  if (-[_OSLogIndexFile _loadCatalogMetadataForTimespan](self, "_loadCatalogMetadataForTimespan"))
  {
    cet = self->_cet;
    self->_ot = self->_cot;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_13:
  _index_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    v11 = 67109120;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_19EA26000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Determine Timespan", "success: %{BOOL}d", (uint8_t *)&v11, 8u);
  }

  return v8;
}

- (BOOL)_loadCatalogMetadataForTimespan
{
  NSObject *v3;
  char *path;
  _OSLogChunkStore *v5;
  NSObject *v6;
  BOOL v7;
  _OSLogChunkFileReference *cfr;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _index_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315138;
    v13 = path;
    _os_signpost_emit_with_name_impl(&dword_19EA26000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Read Catalogs", "for %s", buf, 0xCu);
  }

  v5 = self->_cs;
  if (self->_cs
    || (cfr = self->_cfr) == 0
    || (v10 = -[_OSLogChunkFileReference copyMappedChunkFile:](cfr, "copyMappedChunkFile:", 0),
        v5,
        (v5 = (_OSLogChunkStore *)v10) != 0))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50___OSLogIndexFile__loadCatalogMetadataForTimespan__block_invoke;
    v11[3] = &unk_1E4156AC0;
    v11[4] = self;
    -[_OSLogChunkStore enumerateChunksUsingBlock:](v5, "enumerateChunksUsingBlock:", v11);
    if (!self->_cet)
      self->_cet = -1;
    _index_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 1;
      _os_signpost_emit_with_name_impl(&dword_19EA26000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Read Catalogs", "success: %{BOOL}d", buf, 8u);
    }

    v7 = 1;
  }
  else
  {
    _index_log();
    v5 = (_OSLogChunkStore *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(&v5->super))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_19EA26000, &v5->super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Read Catalogs", "success: %{BOOL}d", buf, 8u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)_OSLogIndexFile;
  -[_OSLogIndexFile dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cs, 0);
  objc_storeStrong((id *)&self->_cfr, 0);
}

- (_OSLogIndexFile)initWithChunkStore:(id)a3 error:(id *)a4
{
  id v6;
  _OSLogIndexFile *v7;
  _OSLogIndexFile *v8;
  _OSLogIndexFile *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_OSLogIndexFile;
  v7 = -[_OSLogIndexFile init](&v11, sel_init);
  v8 = v7;
  if (!v7
    || (objc_storeStrong((id *)&v7->_cs, a3),
        v8->_cot_header = -1,
        v8->_cot = -1,
        v8->_timespanDetermined = 0,
        v8->_ot = -1,
        v8->_path = 0,
        v9 = 0,
        -[_OSLogIndexFile _loadHeaderMetadata:](v8, "_loadHeaderMetadata:", v6)))
  {
    v9 = v8;
  }

  return v9;
}

@end
