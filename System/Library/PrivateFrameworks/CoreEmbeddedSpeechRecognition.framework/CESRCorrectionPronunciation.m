@implementation CESRCorrectionPronunciation

- (BOOL)hasOrthography
{
  return self->_orthography != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasApgId
{
  return self->_apgId != 0;
}

- (BOOL)hasTtsVersion
{
  return self->_ttsVersion != 0;
}

- (void)setTokenOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tokenOffset = a3;
}

- (void)setHasTokenOffset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTokenOffset
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearTtsPronunciations
{
  -[NSMutableArray removeAllObjects](self->_ttsPronunciations, "removeAllObjects");
}

- (void)addTtsPronunciations:(id)a3
{
  id v4;
  NSMutableArray *ttsPronunciations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ttsPronunciations = self->_ttsPronunciations;
  v8 = v4;
  if (!ttsPronunciations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ttsPronunciations;
    self->_ttsPronunciations = v6;

    v4 = v8;
    ttsPronunciations = self->_ttsPronunciations;
  }
  -[NSMutableArray addObject:](ttsPronunciations, "addObject:", v4);

}

- (unint64_t)ttsPronunciationsCount
{
  return -[NSMutableArray count](self->_ttsPronunciations, "count");
}

- (id)ttsPronunciationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ttsPronunciations, "objectAtIndex:", a3);
}

- (BOOL)hasAsrPronunciationData
{
  return self->_asrPronunciationData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CESRCorrectionPronunciation;
  -[CESRCorrectionPronunciation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRCorrectionPronunciation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *orthography;
  NSString *language;
  NSString *apgId;
  NSString *ttsVersion;
  void *v9;
  NSMutableArray *ttsPronunciations;
  NSData *asrPronunciationData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  orthography = self->_orthography;
  if (orthography)
    objc_msgSend(v3, "setObject:forKey:", orthography, CFSTR("orthography"));
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  apgId = self->_apgId;
  if (apgId)
    objc_msgSend(v4, "setObject:forKey:", apgId, CFSTR("apg_id"));
  ttsVersion = self->_ttsVersion;
  if (ttsVersion)
    objc_msgSend(v4, "setObject:forKey:", ttsVersion, CFSTR("tts_version"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_tokenOffset);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("token_offset"));

  }
  ttsPronunciations = self->_ttsPronunciations;
  if (ttsPronunciations)
    objc_msgSend(v4, "setObject:forKey:", ttsPronunciations, CFSTR("tts_pronunciations"));
  asrPronunciationData = self->_asrPronunciationData;
  if (asrPronunciationData)
    objc_msgSend(v4, "setObject:forKey:", asrPronunciationData, CFSTR("asr_pronunciation_data"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CESRCorrectionPronunciationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
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
  v4 = a3;
  if (self->_orthography)
    PBDataWriterWriteStringField();
  if (self->_language)
    PBDataWriterWriteStringField();
  if (self->_apgId)
    PBDataWriterWriteStringField();
  if (self->_ttsVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_ttsPronunciations;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_asrPronunciationData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_orthography)
  {
    objc_msgSend(v4, "setOrthography:");
    v4 = v9;
  }
  if (self->_language)
  {
    objc_msgSend(v9, "setLanguage:");
    v4 = v9;
  }
  if (self->_apgId)
  {
    objc_msgSend(v9, "setApgId:");
    v4 = v9;
  }
  if (self->_ttsVersion)
  {
    objc_msgSend(v9, "setTtsVersion:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_tokenOffset;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (-[CESRCorrectionPronunciation ttsPronunciationsCount](self, "ttsPronunciationsCount"))
  {
    objc_msgSend(v9, "clearTtsPronunciations");
    v5 = -[CESRCorrectionPronunciation ttsPronunciationsCount](self, "ttsPronunciationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[CESRCorrectionPronunciation ttsPronunciationsAtIndex:](self, "ttsPronunciationsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTtsPronunciations:", v8);

      }
    }
  }
  if (self->_asrPronunciationData)
    objc_msgSend(v9, "setAsrPronunciationData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_orthography, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_apgId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_ttsVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_tokenOffset;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_ttsPronunciations;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addTtsPronunciations:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v20 = -[NSData copyWithZone:](self->_asrPronunciationData, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *orthography;
  NSString *language;
  NSString *apgId;
  NSString *ttsVersion;
  NSMutableArray *ttsPronunciations;
  NSData *asrPronunciationData;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  orthography = self->_orthography;
  if ((unint64_t)orthography | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](orthography, "isEqual:"))
      goto LABEL_19;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_19;
  }
  apgId = self->_apgId;
  if ((unint64_t)apgId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](apgId, "isEqual:"))
      goto LABEL_19;
  }
  ttsVersion = self->_ttsVersion;
  if ((unint64_t)ttsVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](ttsVersion, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_tokenOffset != *((_DWORD *)v4 + 10))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  ttsPronunciations = self->_ttsPronunciations;
  if ((unint64_t)ttsPronunciations | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](ttsPronunciations, "isEqual:"))
  {
    goto LABEL_19;
  }
  asrPronunciationData = self->_asrPronunciationData;
  if ((unint64_t)asrPronunciationData | *((_QWORD *)v4 + 2))
    v11 = -[NSData isEqual:](asrPronunciationData, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_orthography, "hash");
  v4 = -[NSString hash](self->_language, "hash");
  v5 = -[NSString hash](self->_apgId, "hash");
  v6 = -[NSString hash](self->_ttsVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_tokenOffset;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSMutableArray hash](self->_ttsPronunciations, "hash");
  return v8 ^ v9 ^ -[NSData hash](self->_asrPronunciationData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[CESRCorrectionPronunciation setOrthography:](self, "setOrthography:");
  if (*((_QWORD *)v4 + 3))
    -[CESRCorrectionPronunciation setLanguage:](self, "setLanguage:");
  if (*((_QWORD *)v4 + 1))
    -[CESRCorrectionPronunciation setApgId:](self, "setApgId:");
  if (*((_QWORD *)v4 + 7))
    -[CESRCorrectionPronunciation setTtsVersion:](self, "setTtsVersion:");
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_tokenOffset = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CESRCorrectionPronunciation addTtsPronunciations:](self, "addTtsPronunciations:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[CESRCorrectionPronunciation setAsrPronunciationData:](self, "setAsrPronunciationData:");

}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
  objc_storeStrong((id *)&self->_orthography, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)apgId
{
  return self->_apgId;
}

- (void)setApgId:(id)a3
{
  objc_storeStrong((id *)&self->_apgId, a3);
}

- (NSString)ttsVersion
{
  return self->_ttsVersion;
}

- (void)setTtsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_ttsVersion, a3);
}

- (int)tokenOffset
{
  return self->_tokenOffset;
}

- (NSMutableArray)ttsPronunciations
{
  return self->_ttsPronunciations;
}

- (void)setTtsPronunciations:(id)a3
{
  objc_storeStrong((id *)&self->_ttsPronunciations, a3);
}

- (NSData)asrPronunciationData
{
  return self->_asrPronunciationData;
}

- (void)setAsrPronunciationData:(id)a3
{
  objc_storeStrong((id *)&self->_asrPronunciationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsVersion, 0);
  objc_storeStrong((id *)&self->_ttsPronunciations, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_asrPronunciationData, 0);
  objc_storeStrong((id *)&self->_apgId, 0);
}

+ (Class)ttsPronunciationsType
{
  return (Class)objc_opt_class();
}

@end
