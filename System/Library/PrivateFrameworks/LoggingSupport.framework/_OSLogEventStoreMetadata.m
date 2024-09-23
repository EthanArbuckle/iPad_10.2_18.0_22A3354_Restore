@implementation _OSLogEventStoreMetadata

- (id)timeRefForTTLClass:(unsigned __int8)a3
{
  return self->_ttls[a3];
}

- (_OSLogEventStoreTimeRef)oldestSpecial
{
  return self->_oldestSpecial;
}

- (_OSLogEventStoreTimeRef)oldestPersist
{
  return self->_oldestPersist;
}

- (_OSLogEventStoreTimeRef)oldestLive
{
  return self->_oldestLive;
}

- (_OSLogEventStoreTimeRef)oldestSignpost
{
  return self->_oldestSignpost;
}

- (_OSLogEventStoreTimeRef)oldestHighVolume
{
  return self->_oldestHighVolume;
}

- (NSUUID)archiveUUID
{
  return self->_archiveUUID;
}

- (_OSLogEventStoreMetadata)initWithCollection:(id)a3 localStorePlist:(id)a4 liveDataDescriptor:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  _OSLogEventStoreMetadata *v10;
  uint64_t v11;
  _OSLogEventStoreTimeRef *oldestPersist;
  uint64_t v13;
  _OSLogEventStoreTimeRef *oldestSpecial;
  uint64_t v15;
  _OSLogEventStoreTimeRef *oldestSignpost;
  uint64_t v17;
  _OSLogEventStoreTimeRef *v18;
  _OSLogEventStoreTimeRef *oldestLive;
  uint64_t v20;
  _OSLogEventStoreTimeRef *end;
  void *v22;
  uint64_t v23;
  NSUUID *sourceUUID;
  id *ttls;
  uint64_t v26;
  void *v27;
  void *v28;
  _OSLogEventStoreTimeRef *v29;
  id v30;
  uint64_t v32;
  _QWORD v33[3];

  v5 = *(_QWORD *)&a5;
  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[_OSLogEventStoreMetadata init](self, "init");
  if (v10)
  {
    _calculateTimeRefForBook(v8, "Persist");
    v11 = objc_claimAutoreleasedReturnValue();
    oldestPersist = v10->_oldestPersist;
    v10->_oldestPersist = (_OSLogEventStoreTimeRef *)v11;

    _calculateTimeRefForBook(v8, "Special");
    v13 = objc_claimAutoreleasedReturnValue();
    oldestSpecial = v10->_oldestSpecial;
    v10->_oldestSpecial = (_OSLogEventStoreTimeRef *)v13;

    _calculateTimeRefForBook(v8, "Signpost");
    v15 = objc_claimAutoreleasedReturnValue();
    oldestSignpost = v10->_oldestSignpost;
    v10->_oldestSignpost = (_OSLogEventStoreTimeRef *)v15;

    v33[0] = 0;
    v33[1] = 0;
    v32 = 0;
    if (_OSLogFileFindExhaustivePoint(v5, (uint64_t)v33, (uint64_t)&v32) && *__error() == 2)
    {
      v17 = 0;
    }
    else
    {
      v18 = [_OSLogEventStoreTimeRef alloc];
      v17 = -[_OSLogEventStoreTimeRef initWithUUID:continuous:](v18, "initWithUUID:continuous:", v33, v32);
    }
    oldestLive = v10->_oldestLive;
    v10->_oldestLive = (_OSLogEventStoreTimeRef *)v17;

    +[_OSLogEventStoreTimeRef timeRef](_OSLogEventStoreTimeRef, "timeRef");
    v20 = objc_claimAutoreleasedReturnValue();
    end = v10->_end;
    v10->_end = (_OSLogEventStoreTimeRef *)v20;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v22);
    sourceUUID = v10->_sourceUUID;
    v10->_sourceUUID = (NSUUID *)v23;

    objc_storeStrong((id *)&v10->_archiveUUID, v10->_sourceUUID);
    ttls = (id *)v10->_ttls;
    v26 = 8u;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)((char *)&_OSLogTTLTable + v26));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v28);
      v30 = *ttls;
      *ttls = v29;

      if (!*ttls)
        objc_storeStrong(ttls, v10->_oldestSpecial);

      v26 += 16;
      ++ttls;
    }
    while (v26 != 88);

  }
  return v10;
}

- (_OSLogEventStoreTimeRef)end
{
  return self->_end;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_archiveUUID, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_oldestLive, 0);
  objc_storeStrong((id *)&self->_oldestHighVolume, 0);
  objc_storeStrong((id *)&self->_oldestSignpost, 0);
  objc_storeStrong((id *)&self->_oldestSpecial, 0);
  objc_storeStrong((id *)&self->_oldestPersist, 0);
  v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (_OSLogEventStoreMetadata)initWithDictionary:(id)a3
{
  id v4;
  _OSLogEventStoreMetadata *v5;
  void *v6;
  void *v7;
  _OSLogEventStoreTimeRef *v8;
  _OSLogEventStoreTimeRef *oldestPersist;
  void *v10;
  void *v11;
  _OSLogEventStoreTimeRef *v12;
  _OSLogEventStoreTimeRef *oldestSpecial;
  void *v14;
  void *v15;
  _OSLogEventStoreTimeRef *v16;
  _OSLogEventStoreTimeRef *oldestSignpost;
  void *v18;
  void *v19;
  _OSLogEventStoreTimeRef *v20;
  _OSLogEventStoreTimeRef *oldestHighVolume;
  void *v22;
  void *v23;
  _OSLogEventStoreTimeRef *v24;
  _OSLogEventStoreTimeRef *oldestLive;
  _OSLogEventStoreTimeRef *v26;
  _OSLogEventStoreTimeRef *end;
  uint64_t v28;
  NSUUID *archiveUUID;
  void *v30;
  uint64_t v31;
  NSUUID *sourceUUID;
  void *v33;
  void *v34;
  id *ttls;
  uint64_t v36;
  void *v37;
  void *v38;
  _OSLogEventStoreTimeRef *v39;
  id v40;
  _OSLogEventStoreMetadata *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  v5 = -[_OSLogEventStoreMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PersistMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v7);
    oldestPersist = v5->_oldestPersist;
    v5->_oldestPersist = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SpecialMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v11);
    oldestSpecial = v5->_oldestSpecial;
    v5->_oldestSpecial = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignpostMetadata"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v15);
    oldestSignpost = v5->_oldestSignpost;
    v5->_oldestSignpost = v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighVolumeMetadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v19);
    oldestHighVolume = v5->_oldestHighVolume;
    v5->_oldestHighVolume = v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LiveMetadata"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("OldestTimeRef"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v23);
    oldestLive = v5->_oldestLive;
    v5->_oldestLive = v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EndTimeRef"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v47);
    end = v5->_end;
    v5->_end = v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ArchiveIdentifier"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v46);
    archiveUUID = v5->_archiveUUID;
    v5->_archiveUUID = (NSUUID *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SourceIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v30);
    sourceUUID = v5->_sourceUUID;
    v5->_sourceUUID = (NSUUID *)v31;

    if (!v5->_oldestPersist || !v5->_oldestSpecial || !v5->_oldestLive || !v5->_end)
    {

      v41 = 0;
      goto LABEL_15;
    }
    v43 = v23;
    v44 = v11;
    v45 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SpecialMetadata"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("TTL"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    ttls = (id *)v5->_ttls;
    v36 = 8u;
    do
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)((char *)&_OSLogTTLTable + v36));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = -[_OSLogEventStoreTimeRef initWithDictionary:]([_OSLogEventStoreTimeRef alloc], "initWithDictionary:", v38);
        v40 = *ttls;
        *ttls = v39;

      }
      if (!*ttls)
        objc_storeStrong(ttls, v5->_oldestSpecial);
      v36 += 16;
      ++ttls;
    }
    while (v36 != 88);

  }
  v41 = v5;
LABEL_15:

  return v41;
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

@end
