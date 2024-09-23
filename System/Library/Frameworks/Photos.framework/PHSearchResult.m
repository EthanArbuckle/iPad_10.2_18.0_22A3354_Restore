@implementation PHSearchResult

- (PHSearchResult)initWithSearchResultType:(unint64_t)a3 uuid:(id)a4 personUUIDs:(id)a5 sceneIdentifiers:(id)a6 audioIdentifiers:(id)a7 humanActionIdentifiers:(id)a8 retrievalType:(unint64_t)a9 hasOCRTextMatch:(BOOL)a10 isSensitiveLocation:(BOOL)a11 embeddingDistances:(id)a12 l1Score:(id)a13 l2Score:(id)a14 collectionScore:(id)a15 assetAlbumUUIDs:(id)a16 assetMemoryUUIDs:(id)a17 assetHighlightUUIDs:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  PHSearchResult *v29;
  id v30;
  id v31;
  PHSearchResult *v32;
  PHSearchResult *v33;
  uint64_t v34;
  NSString *uuid;
  uint64_t v36;
  NSArray *personUUIDS;
  uint64_t v38;
  NSArray *sceneIdentifiers;
  uint64_t v40;
  NSArray *audioIdentifiers;
  uint64_t v42;
  NSArray *humanActionIdentifiers;
  uint64_t v44;
  NSArray *embeddingDistances;
  uint64_t v46;
  NSArray *assetAlbumUUIDs;
  uint64_t v48;
  NSArray *assetMemoryUUIDs;
  uint64_t v50;
  NSArray *assetHighlightUUIDs;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  objc_super v69;

  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a12;
  v29 = self;
  v66 = a13;
  v65 = a14;
  v64 = a15;
  v30 = a16;
  v67 = a17;
  v31 = a18;
  v68 = v23;
  if (v23)
  {
    if (v24)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, v29, CFSTR("PHSearchResult.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

    if (v24)
    {
LABEL_3:
      if (v25)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v29, CFSTR("PHSearchResult.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs"));

  if (v25)
  {
LABEL_4:
    if (v26)
      goto LABEL_5;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v29, CFSTR("PHSearchResult.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audioIdentifiers"));

    if (v27)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, v29, CFSTR("PHSearchResult.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneIdentifiers"));

  if (!v26)
    goto LABEL_18;
LABEL_5:
  if (v27)
    goto LABEL_6;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, v29, CFSTR("PHSearchResult.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("humanActionIdentifiers"));

LABEL_6:
  v69.receiver = v29;
  v69.super_class = (Class)PHSearchResult;
  v32 = -[PHSearchResult init](&v69, sel_init);
  v33 = v32;
  if (v32)
  {
    v32->_type = a3;
    v34 = objc_msgSend(v68, "copy");
    uuid = v33->_uuid;
    v33->_uuid = (NSString *)v34;

    v36 = objc_msgSend(v24, "copy");
    personUUIDS = v33->_personUUIDS;
    v33->_personUUIDS = (NSArray *)v36;

    v38 = objc_msgSend(v25, "copy");
    sceneIdentifiers = v33->_sceneIdentifiers;
    v33->_sceneIdentifiers = (NSArray *)v38;

    v40 = objc_msgSend(v26, "copy");
    audioIdentifiers = v33->_audioIdentifiers;
    v33->_audioIdentifiers = (NSArray *)v40;

    v42 = objc_msgSend(v27, "copy");
    humanActionIdentifiers = v33->_humanActionIdentifiers;
    v33->_humanActionIdentifiers = (NSArray *)v42;

    v33->_retrievalType = a9;
    v33->_hasOCRTextMatch = a10;
    v44 = objc_msgSend(v28, "copy");
    embeddingDistances = v33->_embeddingDistances;
    v33->_embeddingDistances = (NSArray *)v44;

    objc_storeStrong((id *)&v33->_l1Score, a13);
    objc_storeStrong((id *)&v33->_l2Score, a14);
    objc_storeStrong((id *)&v33->_collectionScore, a15);
    v33->_isSensitiveLocation = a11;
    v46 = objc_msgSend(v30, "copy");
    assetAlbumUUIDs = v33->_assetAlbumUUIDs;
    v33->_assetAlbumUUIDs = (NSArray *)v46;

    v48 = objc_msgSend(v67, "copy");
    assetMemoryUUIDs = v33->_assetMemoryUUIDs;
    v33->_assetMemoryUUIDs = (NSArray *)v48;

    v50 = objc_msgSend(v31, "copy");
    assetHighlightUUIDs = v33->_assetHighlightUUIDs;
    v33->_assetHighlightUUIDs = (NSArray *)v50;

    -[NSNumber doubleValue](v33->_l1Score, "doubleValue");
    if (v52 >= 100.0)
    {
      v33->_matchType = 1;
      -[NSNumber doubleValue](v33->_l1Score, "doubleValue");
      if (v55 == 100.0)
        v33->_isExclusivelyExactOCRTextMatch = 1;
    }
    else
    {
      -[NSNumber doubleValue](v33->_l1Score, "doubleValue");
      if (v53 >= 10.0)
        v54 = 2;
      else
        v54 = 3;
      v33->_matchType = v54;
    }
  }

  return v33;
}

- (BOOL)isEligibleForSuggestions
{
  unint64_t v3;

  v3 = -[PHSearchResult retrievalType](self, "retrievalType");
  if (v3 != 1)
    LOBYTE(v3) = -[PHSearchResult retrievalType](self, "retrievalType") == 3;
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t matchType;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  v6 = self->_type - 1;
  if (v6 > 3)
    v7 = CFSTR("PHSearchResultTypeUndefined");
  else
    v7 = off_1E35D6C60[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'\n"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("uuid: '%@'\n"), self->_uuid);
  v8 = self->_retrievalType - 1;
  if (v8 > 2)
    v9 = CFSTR("PHSearchResultRetrievalTypeUndefined");
  else
    v9 = off_1E35D6C80[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR("retrievalType: %@\n"), v9);
  matchType = self->_matchType;
  if (matchType > 3)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E35D6C98[matchType];
  objc_msgSend(v3, "appendFormat:", CFSTR("matchType: %@\n"), v11);
  if (self->_hasOCRTextMatch)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasOCRTextMatch: %@\n"), v12);
  if (self->_isSensitiveLocation)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSensitiveLocation: %@\n"), v13);
  objc_msgSend(v3, "appendFormat:", CFSTR("L1 Score: %@\n"), self->_l1Score);
  objc_msgSend(v3, "appendFormat:", CFSTR("L2 Score: %@\n"), self->_l2Score);
  objc_msgSend(v3, "appendFormat:", CFSTR("collection score: %@\n"), self->_collectionScore);
  objc_msgSend(v3, "appendFormat:", CFSTR("embedding distances: %@\n"), self->_embeddingDistances);
  return v3;
}

- (id)jsonDictionary
{
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[13];
  _QWORD v30[15];

  v30[13] = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc(MEMORY[0x1E0C99E08]);
  v29[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchResult type](self, "type"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v28;
  v29[1] = CFSTR("type_humanReadable");
  v3 = -[PHSearchResult type](self, "type");
  if (v3 > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E35D6CB8[v3];
  v30[1] = v4;
  v29[2] = CFSTR("uuid");
  -[PHSearchResult uuid](self, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v27;
  v29[3] = CFSTR("retrievalType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchResult retrievalType](self, "retrievalType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v26;
  v29[4] = CFSTR("retrievalType_humanReadable");
  v5 = -[PHSearchResult retrievalType](self, "retrievalType");
  if (v5 > 3)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E35D6CE0[v5];
  v30[4] = v6;
  v29[5] = CFSTR("hasOCRTextMatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchResult hasOCRTextMatch](self, "hasOCRTextMatch"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v24;
  v29[6] = CFSTR("isSensitiveLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchResult isSensitiveLocation](self, "isSensitiveLocation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v23;
  v29[7] = CFSTR("l1Score");
  -[PHSearchResult l1Score](self, "l1Score");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v7;
  v30[7] = v7;
  v29[8] = CFSTR("l2Score");
  -[PHSearchResult l2Score](self, "l2Score");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[8] = v10;
  v29[9] = CFSTR("collectionScore");
  -[PHSearchResult collectionScore](self, "collectionScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[9] = v12;
  v29[10] = CFSTR("embeddingDistances");
  -[PHSearchResult embeddingDistances](self, "embeddingDistances");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[10] = v14;
  v29[11] = CFSTR("matchType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchResult matchType](self, "matchType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v15;
  v29[12] = CFSTR("matchType_humanReadable");
  v16 = -[PHSearchResult matchType](self, "matchType");
  if (v16 > 3)
    v17 = CFSTR("Unknown");
  else
    v17 = off_1E35D6C98[v16];
  v30[12] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v25, "initWithDictionary:", v18);

  if (!v13)
  if (!v11)

  if (!v9)
  if (!v8)

  v20 = (void *)objc_msgSend(v19, "copy");
  return v20;
}

- (void)releaseOwningCollectionUUIDs
{
  NSArray *assetAlbumUUIDs;
  NSArray *assetMemoryUUIDs;
  NSArray *assetHighlightUUIDs;

  assetAlbumUUIDs = self->_assetAlbumUUIDs;
  self->_assetAlbumUUIDs = 0;

  assetMemoryUUIDs = self->_assetMemoryUUIDs;
  self->_assetMemoryUUIDs = 0;

  assetHighlightUUIDs = self->_assetHighlightUUIDs;
  self->_assetHighlightUUIDs = 0;

}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)embeddingDistances
{
  return self->_embeddingDistances;
}

- (BOOL)hasOCRTextMatch
{
  return self->_hasOCRTextMatch;
}

- (BOOL)isExclusivelyExactOCRTextMatch
{
  return self->_isExclusivelyExactOCRTextMatch;
}

- (BOOL)isSensitiveLocation
{
  return self->_isSensitiveLocation;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (unint64_t)retrievalType
{
  return self->_retrievalType;
}

- (NSNumber)l1Score
{
  return self->_l1Score;
}

- (NSNumber)l2Score
{
  return self->_l2Score;
}

- (NSNumber)collectionScore
{
  return self->_collectionScore;
}

- (NSArray)assetAlbumUUIDs
{
  return self->_assetAlbumUUIDs;
}

- (NSArray)assetMemoryUUIDs
{
  return self->_assetMemoryUUIDs;
}

- (NSArray)assetHighlightUUIDs
{
  return self->_assetHighlightUUIDs;
}

- (NSArray)personUUIDS
{
  return self->_personUUIDS;
}

- (NSArray)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (NSArray)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (NSArray)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_personUUIDS, 0);
  objc_storeStrong((id *)&self->_assetHighlightUUIDs, 0);
  objc_storeStrong((id *)&self->_assetMemoryUUIDs, 0);
  objc_storeStrong((id *)&self->_assetAlbumUUIDs, 0);
  objc_storeStrong((id *)&self->_collectionScore, 0);
  objc_storeStrong((id *)&self->_l2Score, 0);
  objc_storeStrong((id *)&self->_l1Score, 0);
  objc_storeStrong((id *)&self->_embeddingDistances, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
