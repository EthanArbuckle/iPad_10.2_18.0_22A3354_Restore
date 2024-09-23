@implementation _OSLogIndex

- (void)insertIndexFile:(id)a3
{
  -[NSMutableArray addObject:](self->_fileq, "addObject:", a3);
}

- (void)dealloc
{
  int *tsdb;
  objc_super v4;

  tsdb = (int *)self->_tsdb;
  if (tsdb)
    _timesync_db_close(tsdb);
  v4.receiver = self;
  v4.super_class = (Class)_OSLogIndex;
  -[_OSLogIndex dealloc](&v4, sel_dealloc);
}

- (_OSLogIndex)initWithCollection:(id)a3 timesync:(_os_timesync_db_s *)a4 metadata:(id)a5
{
  id v9;
  id v10;
  _OSLogIndex *v11;
  _OSLogIndex *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _OSLogIndex *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  $0E9386D63CA6B3B3B4564763422A980B *olim_ttl;
  void *v36;
  void *v37;
  uint64_t v38;
  _OSLogIndex *result;
  char v40;

  v9 = a3;
  v10 = a5;
  v11 = -[_OSLogIndex init](self, "init");
  v12 = v11;
  if (!v11)
  {
LABEL_33:
    v18 = v12;
    goto LABEL_34;
  }
  objc_storeStrong((id *)&v11->_lcr, a3);
  v13 = _timesync_db_openat(*(_DWORD *)a4, ".");
  v12->_tsdb = (_os_timesync_db_s *)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v12->_metadata2, a5);
    if (v10)
    {
      v14 = v10;
      objc_msgSend(v14, "oldestLive");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        *(_OWORD *)v12->_metadata.olim_oldestlive.uuid = *(_OWORD *)objc_msgSend(v15, "UUID");
        v17 = objc_msgSend(v16, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestlive.uuid);
        v17 = 0;
      }
      v12->_metadata.olim_oldestlive.continuous = v17;

      objc_msgSend(v14, "oldestPersist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        *(_OWORD *)v12->_metadata.olim_oldestpersist.uuid = *(_OWORD *)objc_msgSend(v19, "UUID");
        v21 = objc_msgSend(v20, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestpersist.uuid);
        v21 = 0;
      }
      v12->_metadata.olim_oldestpersist.continuous = v21;

      objc_msgSend(v14, "oldestSpecial");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        *(_OWORD *)v12->_metadata.olim_oldestspecial.uuid = *(_OWORD *)objc_msgSend(v22, "UUID");
        v24 = objc_msgSend(v23, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestspecial.uuid);
        v24 = 0;
      }
      v12->_metadata.olim_oldestspecial.continuous = v24;

      objc_msgSend(v14, "oldestSignpost");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        *(_OWORD *)v12->_metadata.olim_oldestsignpost.uuid = *(_OWORD *)objc_msgSend(v25, "UUID");
        v27 = objc_msgSend(v26, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestsignpost.uuid);
        v27 = 0;
      }
      v12->_metadata.olim_oldestsignpost.continuous = v27;

      objc_msgSend(v14, "oldestHighVolume");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        *(_OWORD *)v12->_metadata.olim_oldesthighvol.uuid = *(_OWORD *)objc_msgSend(v28, "UUID");
        v30 = objc_msgSend(v29, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldesthighvol.uuid);
        v30 = 0;
      }
      v12->_metadata.olim_oldesthighvol.continuous = v30;

      objc_msgSend(v14, "end");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        *(_OWORD *)v12->_metadata.olim_end.uuid = *(_OWORD *)objc_msgSend(v31, "UUID");
        v33 = objc_msgSend(v32, "continuousTime");
      }
      else
      {
        uuid_clear(v12->_metadata.olim_end.uuid);
        v33 = 0;
      }
      v12->_metadata.olim_end.continuous = v33;

      v34 = 0;
      olim_ttl = v12->_metadata.olim_ttl;
      while (2)
      {
        objc_msgSend(v14, "timeRefForTTLClass:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          *(_OWORD *)olim_ttl->timeref.uuid = *(_OWORD *)objc_msgSend(v36, "UUID");
          v38 = objc_msgSend(v37, "continuousTime");
        }
        else
        {
          uuid_clear(olim_ttl->timeref.uuid);
          v38 = 0;
        }
        olim_ttl->timeref.continuous = v38;

        v40 = 1;
        switch(v34)
        {
          case 0:
            goto LABEL_31;
          case 1:
            v40 = 3;
            goto LABEL_31;
          case 2:
            v40 = 7;
            goto LABEL_31;
          case 3:
            v40 = 14;
LABEL_31:
            olim_ttl->ttl = v40;
            ++olim_ttl;
            ++v34;
            continue;
          case 4:
            v12->_metadata.olim_ttl[4].ttl = 30;

            _os_log_index_metadata_determine_oldest((uint64_t)&v12->_metadata, (uint64_t)a4);
            v12->_metadataValid = 1;
            goto LABEL_33;
          default:
            qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _tp_class_ttl_to called with invalid tp";
            __break(1u);
            return result;
        }
      }
    }
    goto LABEL_33;
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (_os_timesync_db_s)timesync
{
  return self->_tsdb;
}

- (_OSLogIndex)init
{
  _OSLogIndex *v2;
  NSMutableArray *v3;
  NSMutableArray *fileq;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSLogIndex;
  v2 = -[_OSLogIndex init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fileq = v2->_fileq;
    v2->_fileq = v3;

  }
  return v2;
}

- (void)enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingCatalogFilter:(id)a5 usingBlock:(id)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  NSMutableArray *fileq;
  NSMutableArray *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _os_log_index_timeref *olim_oldest;
  $4407BD6B4801FD91183069CF3D73EF8D *p_metadata;
  _OSLogIndexEnumerator *v20;
  id v21;
  void *v22;
  _os_timesync_db_s *tsdb;
  id v24;
  _OSLogIndexEnumerator *v25;
  _QWORD v26[4];
  _OSLogIndexEnumerator *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  int v31;
  _QWORD v32[6];

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  fileq = self->_fileq;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v32[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v32[4] = a3;
  v13 = fileq;
  v14 = a5;
  -[NSMutableArray indexesOfObjectsPassingTest:](v13, "indexesOfObjectsPassingTest:", v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](v13, "objectsAtIndexes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = ___OSLogIndexSortedByBoot_block_invoke_2;
  v30[3] = &__block_descriptor_44_e11_q24__0_8_16l;
  v30[4] = a3;
  v31 = v7;
  objc_msgSend(v16, "sortedArrayUsingComparator:", v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0
     || (_timesync_range_intersect((char *)a3, olim_oldest, (float *)olim_oldest->continuous, self->_metadata.olim_end.uuid, (float *)self->_metadata.olim_end.continuous), self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }
  else
  {
    p_metadata = 0;
  }
  v20 = -[_OSLogIndexEnumerator initWithIndex:metadata:fileBootList:catalogFilter:]([_OSLogIndexEnumerator alloc], "initWithIndex:metadata:fileBootList:catalogFilter:", self, p_metadata, v17, v14);

  v21 = +[OSLogEventProxy _make](OSLogEventProxy, "_make");
  objc_msgSend(v21, "_setTimesyncDatabase:", self->_tsdb);
  objc_msgSend(v21, "_setIncludeSensitive:", (v7 & 1) == 0);
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setUUIDDBFileDescriptor:", objc_msgSend(v22, "fileDescriptor"));

  objc_msgSend(v21, "_setDoNotTrackActivites:", (v7 >> 4) & 1);
  tsdb = self->_tsdb;
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke;
  v26[3] = &unk_1E4156C90;
  v28 = v10;
  v29 = v21;
  v27 = v20;
  v24 = v10;
  v25 = v20;
  -[_OSLogIndexEnumerator enumerateTracepointsInRange:timesync:options:usingBlock:](v25, "enumerateTracepointsInRange:timesync:options:usingBlock:", a3, tsdb, v7, v26);
  objc_msgSend(v21, "_unmake");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata2, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_lcr, 0);
  objc_storeStrong((id *)&self->_fileq, 0);
}

- (_OSLogIndex)initWithCollection:(id)a3 buildLocalIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _OSLogIndex *v8;
  _OSLogIndex *v9;
  _OSLogIndex *v10;

  v4 = a4;
  v7 = a3;
  v8 = -[_OSLogIndex init](self, "init");
  v9 = v8;
  if (v8
    && ((objc_storeStrong((id *)&v8->_lcr, a3), !-[_OSLogIndex _openTimesyncDatabase](v9, "_openTimesyncDatabase"))
     || (-[_OSLogIndex _readArchiveMetadata:](v9, "_readArchiveMetadata:", 0), v4)
     && !-[_OSLogIndex _buildFileIndex](v9, "_buildFileIndex")))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (BOOL)_readArchiveMetadata:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  void *v42;
  void *v43;
  char *v44;
  id v45;
  id v46;
  void *v47;
  int *v48;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _os_log_index_timeref *uu;

  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_lcr, "diagnosticsDirectoryReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileDescriptor");
  v6 = _os_trace_mmap_at();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v6, 0, &__block_literal_global_601);
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PersistMetadata"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v11;
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("UUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), self->_metadata.olim_oldestpersist.uuid);
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                self->_metadata.olim_oldestpersist.continuous = objc_msgSend(v14, "unsignedLongLongValue");
            }

          }
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EndTimeRef"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UUID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), self->_metadata.olim_end.uuid);
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  self->_metadata.olim_end.continuous = objc_msgSend(v19, "unsignedLongLongValue");
              }

            }
          }

          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LiveMetadata"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v57 = v21;
            v22 = v21;
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("UUID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), self->_metadata.olim_oldestlive.uuid);
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    self->_metadata.olim_oldestlive.continuous = objc_msgSend(v24, "unsignedLongLongValue");
                }

              }
            }

            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SpecialMetadata"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v56 = v25;
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26 != 0;
              if (v26)
              {
                uu = &self->_metadata.olim_oldestspecial;
                v51 = v26;
                v28 = v26;
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("UUID"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String"), uu->uuid);
                    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v30)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        self->_metadata.olim_oldestspecial.continuous = objc_msgSend(v30, "unsignedLongLongValue");
                    }

                  }
                }

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SignpostMetadata"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("UUID"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String"), self->_metadata.olim_oldestsignpost.uuid);
                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v33)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          self->_metadata.olim_oldestsignpost.continuous = objc_msgSend(v33, "unsignedLongLongValue");
                      }

                    }
                  }

                }
                v53 = v11;
                v54 = v7;
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HighVolumeMetadata"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (v34)
                {
                  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
                  v36 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("UUID"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"), self->_metadata.olim_oldesthighvol.uuid);
                      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v38)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          self->_metadata.olim_oldesthighvol.continuous = objc_msgSend(v38, "unsignedLongLongValue");
                      }

                    }
                  }

                }
                v50 = v35;
                v52 = v16;
                objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("TTL"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39)
                {
                  v40 = 0;
                  v41 = &byte_1E4156C10;
                  while (1)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)v41 + 1));
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "objectForKeyedSubscript:", v42);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    v44 = (char *)self + v40 * 32;
                    v45 = v43;
                    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("UUID"));
                    v46 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v46)
                      goto LABEL_56;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_56;
                    v46 = objc_retainAutorelease(v46);
                    uuid_parse((const char *)objc_msgSend(v46, "UTF8String"), self->_metadata.olim_ttl[v40].timeref.uuid);
                    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v47)
                      break;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      break;
                    *((_QWORD *)v44 + 25) = objc_msgSend(v47, "unsignedLongLongValue");

                    self->_metadata.olim_ttl[v40].ttl = *v41;
LABEL_57:

                    ++v40;
                    v41 += 16;
                    if (v40 == 5)
                      goto LABEL_58;
                  }

LABEL_56:
                  v44[208] = *v41;
                  *(_OWORD *)self->_metadata.olim_ttl[v40].timeref.uuid = *(_OWORD *)uu->uuid;
                  *((_QWORD *)v44 + 25) = self->_metadata.olim_oldestspecial.continuous;
                  goto LABEL_57;
                }
LABEL_58:
                _os_log_index_metadata_determine_oldest((uint64_t)&self->_metadata, (uint64_t)self->_tsdb);
                self->_metadataValid = 1;

                v11 = v53;
                v7 = v54;
                v16 = v52;
                v27 = 1;
                v26 = v51;
              }

              v25 = v56;
              v21 = v57;
            }
            else
            {
              v27 = 0;
              v21 = v57;
            }

          }
          else
          {
            v27 = 0;
          }

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v48 = __error();
    _OSLogFailWithPOSIXError((id)*v48, a3);
    return 0;
  }
  return v27;
}

- (BOOL)_openTimesyncDatabase
{
  void *v3;
  int v4;
  _os_timesync_db_s *v5;

  -[_OSLogCollectionReference timesyncReference](self->_lcr, "timesyncReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileDescriptor");

  v5 = (_os_timesync_db_s *)_timesync_db_openat(v4, ".");
  if (v5)
    self->_tsdb = v5;
  return v5 != 0;
}

- (BOOL)addReferenceToIndex:(id)a3 error:(id *)a4
{
  id v6;
  _OSLogIndexFile *v7;

  v6 = a3;
  v7 = -[_OSLogIndexFile initWithTraceFile:error:]([_OSLogIndexFile alloc], "initWithTraceFile:error:", v6, a4);

  if (v7)
    -[NSMutableArray addObject:](self->_fileq, "addObject:", v7);

  return v7 != 0;
}

- (BOOL)_addFileToIndex:(const char *)a3 error:(id *)a4
{
  _OSLogChunkFileReference *v6;

  v6 = -[_OSLogChunkFileReference initWithCollection:subpath:]([_OSLogChunkFileReference alloc], "initWithCollection:subpath:", self->_lcr, a3);
  LOBYTE(a4) = -[_OSLogIndex addReferenceToIndex:error:](self, "addReferenceToIndex:error:", v6, a4);

  return (char)a4;
}

- (void)_foreachIndexFile:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_fileq;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)insertChunkStore:(id)a3
{
  id v4;
  _OSLogIndexFile *v5;

  v4 = a3;
  v5 = -[_OSLogIndexFile initWithChunkStore:error:]([_OSLogIndexFile alloc], "initWithChunkStore:error:", v4, 0);

  -[NSMutableArray addObject:](self->_fileq, "addObject:", v5);
}

- (BOOL)_buildFileIndex
{
  void *v3;
  int v4;
  FTS *v5;
  FTS *v6;
  size_t v7;
  FTSENT *v8;
  FTSENT *v9;
  size_t v10;
  int fts_info;
  char *v12;
  const char *fts_path;
  size_t v14;
  char *v16[2];
  char __s[1025];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_lcr, "diagnosticsDirectoryReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileDescriptor");

  if (fcntl(v4, 50, __s, 1025) < 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v16[0] = __s;
    v16[1] = 0;
    v5 = fts_open(v16, 2132, 0);
    if (v5)
    {
      v6 = v5;
      v7 = strlen(__s);
      *(_WORD *)&__s[v7] = 47;
      v8 = fts_read(v6);
      if (v8)
      {
        v9 = v8;
        v10 = v7 + 1;
        do
        {
          if (v9->fts_level)
          {
            fts_info = v9->fts_info;
            if (fts_info == 1)
            {
              if (v9->fts_level != 1
                || strcmp(v9->fts_name, "Persist")
                && strcmp(v9->fts_name, "Special")
                && strcmp(v9->fts_name, "Signpost")
                && strcmp(v9->fts_name, "HighVolume"))
              {
                fts_set(v6, v9, 4);
              }
            }
            else if (fts_info == 8)
            {
              v12 = strrchr(v9->fts_name, 46);
              if (v12)
              {
                if (!strcmp(v12, ".tracev3"))
                {
                  fts_path = v9->fts_path;
                  if (!strncmp(fts_path, __s, v10))
                    v14 = v10;
                  else
                    v14 = 0;
                  -[_OSLogIndex _addFileToIndex:error:](self, "_addFileToIndex:error:", &fts_path[v14], 0);
                }
              }
            }
          }
          v9 = fts_read(v6);
        }
        while (v9);
      }
      fts_close(v6);
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (BOOL)_buildSingleFileIndex:(id *)a3
{
  _OSLogChunkFileReference *v5;
  _OSLogIndexFile *v6;

  v5 = -[_OSLogChunkFileReference initWithCollection:subpath:]([_OSLogChunkFileReference alloc], "initWithCollection:subpath:", self->_lcr, -[NSString fileSystemRepresentation](self->_file, "fileSystemRepresentation"));
  v6 = -[_OSLogIndexFile initWithTraceFile:error:]([_OSLogIndexFile alloc], "initWithTraceFile:error:", v5, a3);
  if (v6)
    -[NSMutableArray addObject:](self->_fileq, "addObject:", v6);

  return v6 != 0;
}

- (unint64_t)persistStartWalltime
{
  if (self->_metadataValid)
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_oldestpersist.uuid, self->_metadata.olim_oldestpersist.continuous, 0);
  else
    return 0;
}

- (unint64_t)specialStartWalltime
{
  if (self->_metadataValid)
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_oldestspecial.uuid, self->_metadata.olim_oldestspecial.continuous, 0);
  else
    return 0;
}

- (unint64_t)endWalltime
{
  if (self->_metadataValid)
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_end.uuid, self->_metadata.olim_end.continuous, 0);
  else
    return -1;
}

- (void)enumerateEntriesFrom:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6;
  _os_timesync_db_s *tsdb;
  id v11;
  void ***impl;

  v6 = *(_QWORD *)&a5;
  tsdb = self->_tsdb;
  v11 = a6;
  impl = (void ***)_timesync_range_create_impl((uint64_t)tsdb, a3, a4, 0);
  -[_OSLogIndex _enumerateEntriesInRange:options:usingBlock:](self, "_enumerateEntriesInRange:options:usingBlock:", impl, v6, v11);

  _os_trace_uuid_map_destroy(*impl);
  free(impl);
}

- (void)enumerateEntriesFromLastBootWithOptions:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v4;
  _os_timesync_db_s *tsdb;
  id v7;
  void ***since_last_boot;

  v4 = *(_QWORD *)&a3;
  tsdb = self->_tsdb;
  v7 = a4;
  since_last_boot = (void ***)_timesync_range_create_since_last_boot((uint64_t)tsdb, 0);
  -[_OSLogIndex _enumerateEntriesInRange:options:usingBlock:](self, "_enumerateEntriesInRange:options:usingBlock:", since_last_boot, v4, v7);

  _os_trace_uuid_map_destroy(*since_last_boot);
  free(since_last_boot);
}

- (void)_enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  NSMutableArray *fileq;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  _os_log_index_timeref *olim_oldest;
  $4407BD6B4801FD91183069CF3D73EF8D *p_metadata;
  _OSLogIndexEnumerator *v17;
  void *v18;
  int v19;
  uint64_t v20;
  _os_timesync_db_s *tsdb;
  id v22;
  _OSLogIndexEnumerator *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  _OSLogIndexEnumerator *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  _OWORD v34[7];
  _QWORD v35[5];

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  fileq = self->_fileq;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v35[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v35[4] = a3;
  v11 = fileq;
  -[NSMutableArray indexesOfObjectsPassingTest:](v11, "indexesOfObjectsPassingTest:", v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](v11, "objectsAtIndexes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v9;
  v31 = 3221225472;
  v32 = (uint64_t)___OSLogIndexSortedByBoot_block_invoke_2;
  v33 = (const char *)&__block_descriptor_44_e11_q24__0_8_16l;
  *(_QWORD *)&v34[0] = a3;
  DWORD2(v34[0]) = v5;
  objc_msgSend(v13, "sortedArrayUsingComparator:", &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0
     || (_timesync_range_intersect((char *)a3, olim_oldest, (float *)olim_oldest->continuous, self->_metadata.olim_end.uuid, (float *)self->_metadata.olim_end.continuous), self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }
  else
  {
    p_metadata = 0;
  }
  v17 = -[_OSLogIndexEnumerator initWithIndex:metadata:fileBootList:catalogFilter:]([_OSLogIndexEnumerator alloc], "initWithIndex:metadata:fileBootList:catalogFilter:", self, p_metadata, v14, 0);
  v30 = 0;
  v31 = (uint64_t)&v30;
  v32 = 0x9010000000;
  v33 = "+a";
  memset(v34, 0, sizeof(v34));
  _chunk_support_context_init((uint64_t)v34);
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileDescriptor");
  *(_DWORD *)(v31 + 36) = v19;

  v20 = v31;
  *(_QWORD *)(v31 + 120) = self->_tsdb;
  if ((v5 & 1) != 0)
    *(_DWORD *)(v20 + 32) |= 0x80u;
  tsdb = self->_tsdb;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke;
  v26[3] = &unk_1E4156C68;
  v22 = v8;
  v28 = v22;
  v29 = &v30;
  v23 = v17;
  v27 = v23;
  -[_OSLogIndexEnumerator enumerateTracepointsInRange:timesync:options:usingBlock:](v23, "enumerateTracepointsInRange:timesync:options:usingBlock:", a3, tsdb, v5, v26);
  v24 = v31;
  v25 = v31 + 32;
  *(_QWORD *)(v31 + 72) = 0;
  *(_DWORD *)(v24 + 36) = -1;
  _chunk_support_context_clear(v25);

  _Block_object_dispose(&v30, 8);
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  -[_OSLogIndex enumerateEntriesFrom:to:options:usingBlock:](self, "enumerateEntriesFrom:to:options:usingBlock:", 0, -1, 0, a3);
}

- (void)enumerateFilesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileDescriptor");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_fileq;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1A1AEC1C8](v8);
      v14 = (_QWORD *)objc_msgSend(v12, "copyMappedChunkStore:", 0, (_QWORD)v16);
      v15 = (*((uint64_t (**)(id, uint64_t, _QWORD, _QWORD))v4 + 2))(v4, v6, v14[1], v14[2]);

      objc_autoreleasePoolPop(v13);
      if (!v15)
        break;
      if (v9 == ++v11)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = v8;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
