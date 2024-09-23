@implementation _MRContentItemProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRContentItemProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (unint64_t)remoteArtworksCount
{
  return -[NSMutableArray count](self->_remoteArtworks, "count");
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (_MRContentItemMetadataProtobuf)metadata
{
  return self->_metadata;
}

- (NSString)info
{
  return self->_info;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (unint64_t)dataArtworksCount
{
  return -[NSMutableArray count](self->_dataArtworks, "count");
}

- (NSMutableArray)currentLanguageOptions
{
  return self->_currentLanguageOptions;
}

- (NSMutableArray)availableRemoteArtworkFormats
{
  return self->_availableRemoteArtworkFormats;
}

- (NSMutableArray)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (NSMutableArray)availableArtworkFormats
{
  return self->_availableArtworkFormats;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (NSString)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptAlignments, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataArtworks, 0);
  objc_storeStrong((id *)&self->_currentLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableArtworkFormats, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);
}

- (void)setAvailableArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_availableArtworkFormats, a3);
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void)setQueueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifier, a3);
}

- (void)setParentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentIdentifier, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setHasArtworkDataWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setHasArtworkDataHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setCurrentLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguageOptions, a3);
}

- (void)setAvailableRemoteArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, a3);
}

- (void)setAvailableLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_availableLanguageOptions, a3);
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, a3);
}

- (void)setArtworkDataWidth:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_artworkDataWidth = a3;
}

- (void)setArtworkDataHeight:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_artworkDataHeight = a3;
}

- (void)setArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkData, a3);
}

- (void)setAncestorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ancestorIdentifier, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_metadata)
    PBDataWriterWriteSubmessage();
  if (self->_artworkData)
    PBDataWriterWriteDataField();
  if (self->_info)
    PBDataWriterWriteStringField();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v5 = self->_availableLanguageOptions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v75 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v7);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = self->_currentLanguageOptions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v12);
  }

  if (self->_lyrics)
    PBDataWriterWriteSubmessage();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v15 = self->_sections;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    }
    while (v17);
  }

  if (self->_parentIdentifier)
    PBDataWriterWriteStringField();
  if (self->_ancestorIdentifier)
    PBDataWriterWriteStringField();
  if (self->_queueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_requestIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_associatedParticipantIdentifier)
    PBDataWriterWriteStringField();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v21 = self->_availableArtworkFormats;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v63 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v23);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = self->_availableRemoteArtworkFormats;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteStringField();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    }
    while (v28);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = self->_dataArtworks;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v55;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v55 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
    }
    while (v33);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = self->_remoteArtworks;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteSubmessage();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v50, v79, 16);
    }
    while (v38);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = self->_transcriptAlignments;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v47;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v41);
        PBDataWriterWriteSubmessage();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v78, 16);
    }
    while (v43);
  }

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasArtworkData
{
  return self->_artworkData != 0;
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (void)clearAvailableLanguageOptions
{
  -[NSMutableArray removeAllObjects](self->_availableLanguageOptions, "removeAllObjects");
}

- (void)addAvailableLanguageOptions:(id)a3
{
  id v4;
  NSMutableArray *availableLanguageOptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  availableLanguageOptions = self->_availableLanguageOptions;
  v8 = v4;
  if (!availableLanguageOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_availableLanguageOptions;
    self->_availableLanguageOptions = v6;

    v4 = v8;
    availableLanguageOptions = self->_availableLanguageOptions;
  }
  -[NSMutableArray addObject:](availableLanguageOptions, "addObject:", v4);

}

- (unint64_t)availableLanguageOptionsCount
{
  return -[NSMutableArray count](self->_availableLanguageOptions, "count");
}

- (id)availableLanguageOptionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_availableLanguageOptions, "objectAtIndex:", a3);
}

+ (Class)availableLanguageOptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentLanguageOptions
{
  -[NSMutableArray removeAllObjects](self->_currentLanguageOptions, "removeAllObjects");
}

- (void)addCurrentLanguageOptions:(id)a3
{
  id v4;
  NSMutableArray *currentLanguageOptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentLanguageOptions = self->_currentLanguageOptions;
  v8 = v4;
  if (!currentLanguageOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentLanguageOptions;
    self->_currentLanguageOptions = v6;

    v4 = v8;
    currentLanguageOptions = self->_currentLanguageOptions;
  }
  -[NSMutableArray addObject:](currentLanguageOptions, "addObject:", v4);

}

- (unint64_t)currentLanguageOptionsCount
{
  return -[NSMutableArray count](self->_currentLanguageOptions, "count");
}

- (id)currentLanguageOptionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentLanguageOptions, "objectAtIndex:", a3);
}

+ (Class)currentLanguageOptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (void)clearSections
{
  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
}

- (void)addSections:(id)a3
{
  id v4;
  NSMutableArray *sections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sections = self->_sections;
  v8 = v4;
  if (!sections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sections;
    self->_sections = v6;

    v4 = v8;
    sections = self->_sections;
  }
  -[NSMutableArray addObject:](sections, "addObject:", v4);

}

- (unint64_t)sectionsCount
{
  return -[NSMutableArray count](self->_sections, "count");
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a3);
}

+ (Class)sectionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasAncestorIdentifier
{
  return self->_ancestorIdentifier != 0;
}

- (BOOL)hasQueueIdentifier
{
  return self->_queueIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasArtworkDataWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasArtworkDataHeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAssociatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier != 0;
}

- (void)clearAvailableArtworkFormats
{
  -[NSMutableArray removeAllObjects](self->_availableArtworkFormats, "removeAllObjects");
}

- (void)addAvailableArtworkFormats:(id)a3
{
  id v4;
  NSMutableArray *availableArtworkFormats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  availableArtworkFormats = self->_availableArtworkFormats;
  v8 = v4;
  if (!availableArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_availableArtworkFormats;
    self->_availableArtworkFormats = v6;

    v4 = v8;
    availableArtworkFormats = self->_availableArtworkFormats;
  }
  -[NSMutableArray addObject:](availableArtworkFormats, "addObject:", v4);

}

- (unint64_t)availableArtworkFormatsCount
{
  return -[NSMutableArray count](self->_availableArtworkFormats, "count");
}

- (id)availableArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_availableArtworkFormats, "objectAtIndex:", a3);
}

+ (Class)availableArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearAvailableRemoteArtworkFormats
{
  -[NSMutableArray removeAllObjects](self->_availableRemoteArtworkFormats, "removeAllObjects");
}

- (void)addAvailableRemoteArtworkFormats:(id)a3
{
  id v4;
  NSMutableArray *availableRemoteArtworkFormats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  v8 = v4;
  if (!availableRemoteArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_availableRemoteArtworkFormats;
    self->_availableRemoteArtworkFormats = v6;

    v4 = v8;
    availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  }
  -[NSMutableArray addObject:](availableRemoteArtworkFormats, "addObject:", v4);

}

- (unint64_t)availableRemoteArtworkFormatsCount
{
  return -[NSMutableArray count](self->_availableRemoteArtworkFormats, "count");
}

- (id)availableRemoteArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_availableRemoteArtworkFormats, "objectAtIndex:", a3);
}

+ (Class)availableRemoteArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearDataArtworks
{
  -[NSMutableArray removeAllObjects](self->_dataArtworks, "removeAllObjects");
}

- (void)addDataArtworks:(id)a3
{
  id v4;
  NSMutableArray *dataArtworks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dataArtworks = self->_dataArtworks;
  v8 = v4;
  if (!dataArtworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dataArtworks;
    self->_dataArtworks = v6;

    v4 = v8;
    dataArtworks = self->_dataArtworks;
  }
  -[NSMutableArray addObject:](dataArtworks, "addObject:", v4);

}

- (id)dataArtworksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dataArtworks, "objectAtIndex:", a3);
}

+ (Class)dataArtworksType
{
  return (Class)objc_opt_class();
}

- (void)clearRemoteArtworks
{
  -[NSMutableArray removeAllObjects](self->_remoteArtworks, "removeAllObjects");
}

- (void)addRemoteArtworks:(id)a3
{
  id v4;
  NSMutableArray *remoteArtworks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  remoteArtworks = self->_remoteArtworks;
  v8 = v4;
  if (!remoteArtworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_remoteArtworks;
    self->_remoteArtworks = v6;

    v4 = v8;
    remoteArtworks = self->_remoteArtworks;
  }
  -[NSMutableArray addObject:](remoteArtworks, "addObject:", v4);

}

- (id)remoteArtworksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_remoteArtworks, "objectAtIndex:", a3);
}

+ (Class)remoteArtworksType
{
  return (Class)objc_opt_class();
}

- (void)clearTranscriptAlignments
{
  -[NSMutableArray removeAllObjects](self->_transcriptAlignments, "removeAllObjects");
}

- (void)addTranscriptAlignments:(id)a3
{
  id v4;
  NSMutableArray *transcriptAlignments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transcriptAlignments = self->_transcriptAlignments;
  v8 = v4;
  if (!transcriptAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_transcriptAlignments;
    self->_transcriptAlignments = v6;

    v4 = v8;
    transcriptAlignments = self->_transcriptAlignments;
  }
  -[NSMutableArray addObject:](transcriptAlignments, "addObject:", v4);

}

- (unint64_t)transcriptAlignmentsCount
{
  return -[NSMutableArray count](self->_transcriptAlignments, "count");
}

- (id)transcriptAlignmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transcriptAlignments, "objectAtIndex:", a3);
}

+ (Class)transcriptAlignmentsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)_MRContentItemProtobuf;
  -[_MRContentItemProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  _MRContentItemMetadataProtobuf *metadata;
  void *v7;
  NSData *artworkData;
  NSString *info;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  _MRLyricsItemProtobuf *lyrics;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  NSString *parentIdentifier;
  NSString *ancestorIdentifier;
  NSString *queueIdentifier;
  NSString *requestIdentifier;
  char has;
  void *v38;
  void *v39;
  NSString *associatedParticipantIdentifier;
  NSMutableArray *availableArtworkFormats;
  NSMutableArray *availableRemoteArtworkFormats;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[_MRContentItemMetadataProtobuf dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("metadata"));

  }
  artworkData = self->_artworkData;
  if (artworkData)
    objc_msgSend(v4, "setObject:forKey:", artworkData, CFSTR("artworkData"));
  info = self->_info;
  if (info)
    objc_msgSend(v4, "setObject:forKey:", info, CFSTR("info"));
  if (-[NSMutableArray count](self->_availableLanguageOptions, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_availableLanguageOptions, "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v11 = self->_availableLanguageOptions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v86 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("availableLanguageOptions"));
  }
  if (-[NSMutableArray count](self->_currentLanguageOptions, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_currentLanguageOptions, "count"));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v18 = self->_currentLanguageOptions;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v82 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("currentLanguageOptions"));
  }
  lyrics = self->_lyrics;
  if (lyrics)
  {
    -[_MRLyricsItemProtobuf dictionaryRepresentation](lyrics, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("lyrics"));

  }
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v27 = self->_sections;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v78 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      }
      while (v29);
    }

    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("sections"));
  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
    objc_msgSend(v4, "setObject:forKey:", parentIdentifier, CFSTR("parentIdentifier"));
  ancestorIdentifier = self->_ancestorIdentifier;
  if (ancestorIdentifier)
    objc_msgSend(v4, "setObject:forKey:", ancestorIdentifier, CFSTR("ancestorIdentifier"));
  queueIdentifier = self->_queueIdentifier;
  if (queueIdentifier)
    objc_msgSend(v4, "setObject:forKey:", queueIdentifier, CFSTR("queueIdentifier"));
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v4, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_artworkDataWidth);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("artworkDataWidth"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_artworkDataHeight);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("artworkDataHeight"));

  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if (associatedParticipantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", associatedParticipantIdentifier, CFSTR("associatedParticipantIdentifier"));
  availableArtworkFormats = self->_availableArtworkFormats;
  if (availableArtworkFormats)
    objc_msgSend(v4, "setObject:forKey:", availableArtworkFormats, CFSTR("availableArtworkFormats"));
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  if (availableRemoteArtworkFormats)
    objc_msgSend(v4, "setObject:forKey:", availableRemoteArtworkFormats, CFSTR("availableRemoteArtworkFormats"));
  if (-[NSMutableArray count](self->_dataArtworks, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dataArtworks, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v44 = self->_dataArtworks;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v74 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * m), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("dataArtworks"));
  }
  if (-[NSMutableArray count](self->_remoteArtworks, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_remoteArtworks, "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v51 = self->_remoteArtworks;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v70;
      do
      {
        for (n = 0; n != v53; ++n)
        {
          if (*(_QWORD *)v70 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * n), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("remoteArtworks"));
  }
  if (-[NSMutableArray count](self->_transcriptAlignments, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_transcriptAlignments, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v58 = self->_transcriptAlignments;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v66;
      do
      {
        for (ii = 0; ii != v60; ++ii)
        {
          if (*(_QWORD *)v66 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * ii), "dictionaryRepresentation", (_QWORD)v65);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("transcriptAlignments"));
  }
  return v4;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  _DWORD *v16;
  char has;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t ii;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t jj;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t kk;
  void *v37;
  id v38;

  v38 = a3;
  if (self->_identifier)
    objc_msgSend(v38, "setIdentifier:");
  if (self->_metadata)
    objc_msgSend(v38, "setMetadata:");
  if (self->_artworkData)
    objc_msgSend(v38, "setArtworkData:");
  if (self->_info)
    objc_msgSend(v38, "setInfo:");
  if (-[_MRContentItemProtobuf availableLanguageOptionsCount](self, "availableLanguageOptionsCount"))
  {
    objc_msgSend(v38, "clearAvailableLanguageOptions");
    v4 = -[_MRContentItemProtobuf availableLanguageOptionsCount](self, "availableLanguageOptionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRContentItemProtobuf availableLanguageOptionsAtIndex:](self, "availableLanguageOptionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addAvailableLanguageOptions:", v7);

      }
    }
  }
  if (-[_MRContentItemProtobuf currentLanguageOptionsCount](self, "currentLanguageOptionsCount"))
  {
    objc_msgSend(v38, "clearCurrentLanguageOptions");
    v8 = -[_MRContentItemProtobuf currentLanguageOptionsCount](self, "currentLanguageOptionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[_MRContentItemProtobuf currentLanguageOptionsAtIndex:](self, "currentLanguageOptionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addCurrentLanguageOptions:", v11);

      }
    }
  }
  if (self->_lyrics)
    objc_msgSend(v38, "setLyrics:");
  if (-[_MRContentItemProtobuf sectionsCount](self, "sectionsCount"))
  {
    objc_msgSend(v38, "clearSections");
    v12 = -[_MRContentItemProtobuf sectionsCount](self, "sectionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[_MRContentItemProtobuf sectionsAtIndex:](self, "sectionsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addSections:", v15);

      }
    }
  }
  if (self->_parentIdentifier)
    objc_msgSend(v38, "setParentIdentifier:");
  v16 = v38;
  if (self->_ancestorIdentifier)
  {
    objc_msgSend(v38, "setAncestorIdentifier:");
    v16 = v38;
  }
  if (self->_queueIdentifier)
  {
    objc_msgSend(v38, "setQueueIdentifier:");
    v16 = v38;
  }
  if (self->_requestIdentifier)
  {
    objc_msgSend(v38, "setRequestIdentifier:");
    v16 = v38;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16[7] = self->_artworkDataWidth;
    *((_BYTE *)v16 + 160) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v16[6] = self->_artworkDataHeight;
    *((_BYTE *)v16 + 160) |= 1u;
  }
  if (self->_associatedParticipantIdentifier)
    objc_msgSend(v38, "setAssociatedParticipantIdentifier:");
  if (-[_MRContentItemProtobuf availableArtworkFormatsCount](self, "availableArtworkFormatsCount"))
  {
    objc_msgSend(v38, "clearAvailableArtworkFormats");
    v18 = -[_MRContentItemProtobuf availableArtworkFormatsCount](self, "availableArtworkFormatsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[_MRContentItemProtobuf availableArtworkFormatsAtIndex:](self, "availableArtworkFormatsAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addAvailableArtworkFormats:", v21);

      }
    }
  }
  if (-[_MRContentItemProtobuf availableRemoteArtworkFormatsCount](self, "availableRemoteArtworkFormatsCount"))
  {
    objc_msgSend(v38, "clearAvailableRemoteArtworkFormats");
    v22 = -[_MRContentItemProtobuf availableRemoteArtworkFormatsCount](self, "availableRemoteArtworkFormatsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[_MRContentItemProtobuf availableRemoteArtworkFormatsAtIndex:](self, "availableRemoteArtworkFormatsAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addAvailableRemoteArtworkFormats:", v25);

      }
    }
  }
  if (-[_MRContentItemProtobuf dataArtworksCount](self, "dataArtworksCount"))
  {
    objc_msgSend(v38, "clearDataArtworks");
    v26 = -[_MRContentItemProtobuf dataArtworksCount](self, "dataArtworksCount");
    if (v26)
    {
      v27 = v26;
      for (ii = 0; ii != v27; ++ii)
      {
        -[_MRContentItemProtobuf dataArtworksAtIndex:](self, "dataArtworksAtIndex:", ii);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addDataArtworks:", v29);

      }
    }
  }
  if (-[_MRContentItemProtobuf remoteArtworksCount](self, "remoteArtworksCount"))
  {
    objc_msgSend(v38, "clearRemoteArtworks");
    v30 = -[_MRContentItemProtobuf remoteArtworksCount](self, "remoteArtworksCount");
    if (v30)
    {
      v31 = v30;
      for (jj = 0; jj != v31; ++jj)
      {
        -[_MRContentItemProtobuf remoteArtworksAtIndex:](self, "remoteArtworksAtIndex:", jj);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addRemoteArtworks:", v33);

      }
    }
  }
  if (-[_MRContentItemProtobuf transcriptAlignmentsCount](self, "transcriptAlignmentsCount"))
  {
    objc_msgSend(v38, "clearTranscriptAlignments");
    v34 = -[_MRContentItemProtobuf transcriptAlignmentsCount](self, "transcriptAlignmentsCount");
    if (v34)
    {
      v35 = v34;
      for (kk = 0; kk != v35; ++kk)
      {
        -[_MRContentItemProtobuf transcriptAlignmentsAtIndex:](self, "transcriptAlignmentsAtIndex:", kk);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addTranscriptAlignments:", v37);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char has;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  void *v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t jj;
  void *v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t kk;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[_MRContentItemMetadataProtobuf copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  v10 = -[NSData copyWithZone:](self->_artworkData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_info, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v12;

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v14 = self->_availableLanguageOptions;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v105 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAvailableLanguageOptions:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
    }
    while (v16);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v20 = self->_currentLanguageOptions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v101 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCurrentLanguageOptions:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    }
    while (v22);
  }

  v26 = -[_MRLyricsItemProtobuf copyWithZone:](self->_lyrics, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v28 = self->_sections;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v97 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSections:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
    }
    while (v30);
  }

  v34 = -[NSString copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v34;

  v36 = -[NSString copyWithZone:](self->_ancestorIdentifier, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v36;

  v38 = -[NSString copyWithZone:](self->_queueIdentifier, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v38;

  v40 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v40;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_artworkDataWidth;
    *(_BYTE *)(v5 + 160) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_artworkDataHeight;
    *(_BYTE *)(v5 + 160) |= 1u;
  }
  v43 = -[NSString copyWithZone:](self->_associatedParticipantIdentifier, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v43;

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v45 = self->_availableArtworkFormats;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v93 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAvailableArtworkFormats:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    }
    while (v47);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v51 = self->_availableRemoteArtworkFormats;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v89;
    do
    {
      for (n = 0; n != v53; ++n)
      {
        if (*(_QWORD *)v89 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAvailableRemoteArtworkFormats:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
    }
    while (v53);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v57 = self->_dataArtworks;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v85;
    do
    {
      for (ii = 0; ii != v59; ++ii)
      {
        if (*(_QWORD *)v85 != v60)
          objc_enumerationMutation(v57);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDataArtworks:", v62);

      }
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v84, v110, 16);
    }
    while (v59);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v63 = self->_remoteArtworks;
  v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v81;
    do
    {
      for (jj = 0; jj != v65; ++jj)
      {
        if (*(_QWORD *)v81 != v66)
          objc_enumerationMutation(v63);
        v68 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRemoteArtworks:", v68);

      }
      v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
    }
    while (v65);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v69 = self->_transcriptAlignments;
  v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v77;
    do
    {
      for (kk = 0; kk != v71; ++kk)
      {
        if (*(_QWORD *)v77 != v72)
          objc_enumerationMutation(v69);
        v74 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v76);
        objc_msgSend((id)v5, "addTranscriptAlignments:", v74);

      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
    }
    while (v71);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  _MRContentItemMetadataProtobuf *metadata;
  NSData *artworkData;
  NSString *info;
  NSMutableArray *availableLanguageOptions;
  NSMutableArray *currentLanguageOptions;
  _MRLyricsItemProtobuf *lyrics;
  NSMutableArray *sections;
  NSString *parentIdentifier;
  NSString *ancestorIdentifier;
  NSString *queueIdentifier;
  NSString *requestIdentifier;
  NSString *associatedParticipantIdentifier;
  NSMutableArray *availableArtworkFormats;
  NSMutableArray *availableRemoteArtworkFormats;
  NSMutableArray *dataArtworks;
  NSMutableArray *remoteArtworks;
  NSMutableArray *transcriptAlignments;
  char v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_48;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 13))
  {
    if (!-[_MRContentItemMetadataProtobuf isEqual:](metadata, "isEqual:"))
      goto LABEL_48;
  }
  artworkData = self->_artworkData;
  if ((unint64_t)artworkData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](artworkData, "isEqual:"))
      goto LABEL_48;
  }
  info = self->_info;
  if ((unint64_t)info | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](info, "isEqual:"))
      goto LABEL_48;
  }
  availableLanguageOptions = self->_availableLanguageOptions;
  if ((unint64_t)availableLanguageOptions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](availableLanguageOptions, "isEqual:"))
      goto LABEL_48;
  }
  currentLanguageOptions = self->_currentLanguageOptions;
  if ((unint64_t)currentLanguageOptions | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](currentLanguageOptions, "isEqual:"))
      goto LABEL_48;
  }
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((_QWORD *)v4 + 12))
  {
    if (!-[_MRLyricsItemProtobuf isEqual:](lyrics, "isEqual:"))
      goto LABEL_48;
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:"))
      goto LABEL_48;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:"))
      goto LABEL_48;
  }
  ancestorIdentifier = self->_ancestorIdentifier;
  if ((unint64_t)ancestorIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](ancestorIdentifier, "isEqual:"))
      goto LABEL_48;
  }
  queueIdentifier = self->_queueIdentifier;
  if ((unint64_t)queueIdentifier | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](queueIdentifier, "isEqual:"))
      goto LABEL_48;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:"))
      goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 2) == 0 || self->_artworkDataWidth != *((_DWORD *)v4 + 7))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 160) & 2) != 0)
  {
LABEL_48:
    v23 = 0;
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 1) == 0 || self->_artworkDataHeight != *((_DWORD *)v4 + 6))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    goto LABEL_48;
  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if ((unint64_t)associatedParticipantIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](associatedParticipantIdentifier, "isEqual:"))
  {
    goto LABEL_48;
  }
  availableArtworkFormats = self->_availableArtworkFormats;
  if ((unint64_t)availableArtworkFormats | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](availableArtworkFormats, "isEqual:"))
      goto LABEL_48;
  }
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  if ((unint64_t)availableRemoteArtworkFormats | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](availableRemoteArtworkFormats, "isEqual:"))
      goto LABEL_48;
  }
  dataArtworks = self->_dataArtworks;
  if ((unint64_t)dataArtworks | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](dataArtworks, "isEqual:"))
      goto LABEL_48;
  }
  remoteArtworks = self->_remoteArtworks;
  if ((unint64_t)remoteArtworks | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](remoteArtworks, "isEqual:"))
      goto LABEL_48;
  }
  transcriptAlignments = self->_transcriptAlignments;
  if ((unint64_t)transcriptAlignments | *((_QWORD *)v4 + 19))
    v23 = -[NSMutableArray isEqual:](transcriptAlignments, "isEqual:");
  else
    v23 = 1;
LABEL_49:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  NSUInteger v23;

  v23 = -[NSString hash](self->_identifier, "hash");
  v22 = -[_MRContentItemMetadataProtobuf hash](self->_metadata, "hash");
  v3 = -[NSData hash](self->_artworkData, "hash");
  v4 = -[NSString hash](self->_info, "hash");
  v5 = -[NSMutableArray hash](self->_availableLanguageOptions, "hash");
  v6 = -[NSMutableArray hash](self->_currentLanguageOptions, "hash");
  v7 = -[_MRLyricsItemProtobuf hash](self->_lyrics, "hash");
  v8 = -[NSMutableArray hash](self->_sections, "hash");
  v9 = -[NSString hash](self->_parentIdentifier, "hash");
  v10 = -[NSString hash](self->_ancestorIdentifier, "hash");
  v11 = -[NSString hash](self->_queueIdentifier, "hash");
  v12 = -[NSString hash](self->_requestIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v13 = 2654435761 * self->_artworkDataWidth;
  else
    v13 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v14 = 2654435761 * self->_artworkDataHeight;
  else
    v14 = 0;
  v15 = v22 ^ v23 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v16 = v12 ^ v13 ^ v14 ^ -[NSString hash](self->_associatedParticipantIdentifier, "hash");
  v17 = v15 ^ v16 ^ -[NSMutableArray hash](self->_availableArtworkFormats, "hash");
  v18 = -[NSMutableArray hash](self->_availableRemoteArtworkFormats, "hash");
  v19 = v18 ^ -[NSMutableArray hash](self->_dataArtworks, "hash");
  v20 = v19 ^ -[NSMutableArray hash](self->_remoteArtworks, "hash");
  return v17 ^ v20 ^ -[NSMutableArray hash](self->_transcriptAlignments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRContentItemMetadataProtobuf *metadata;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  _MRLyricsItemProtobuf *lyrics;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t jj;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t kk;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[_MRContentItemProtobuf setIdentifier:](self, "setIdentifier:");
  metadata = self->_metadata;
  v6 = *((_QWORD *)v4 + 13);
  if (metadata)
  {
    if (v6)
      -[_MRContentItemMetadataProtobuf mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[_MRContentItemProtobuf setMetadata:](self, "setMetadata:");
  }
  if (*((_QWORD *)v4 + 2))
    -[_MRContentItemProtobuf setArtworkData:](self, "setArtworkData:");
  if (*((_QWORD *)v4 + 11))
    -[_MRContentItemProtobuf setInfo:](self, "setInfo:");
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(v7);
        -[_MRContentItemProtobuf addAvailableLanguageOptions:](self, "addAvailableLanguageOptions:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    }
    while (v9);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v12 = *((id *)v4 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v75 != v15)
          objc_enumerationMutation(v12);
        -[_MRContentItemProtobuf addCurrentLanguageOptions:](self, "addCurrentLanguageOptions:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    }
    while (v14);
  }

  lyrics = self->_lyrics;
  v18 = *((_QWORD *)v4 + 12);
  if (lyrics)
  {
    if (v18)
      -[_MRLyricsItemProtobuf mergeFrom:](lyrics, "mergeFrom:");
  }
  else if (v18)
  {
    -[_MRContentItemProtobuf setLyrics:](self, "setLyrics:");
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v19 = *((id *)v4 + 18);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v71 != v22)
          objc_enumerationMutation(v19);
        -[_MRContentItemProtobuf addSections:](self, "addSections:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    }
    while (v21);
  }

  if (*((_QWORD *)v4 + 14))
    -[_MRContentItemProtobuf setParentIdentifier:](self, "setParentIdentifier:");
  if (*((_QWORD *)v4 + 1))
    -[_MRContentItemProtobuf setAncestorIdentifier:](self, "setAncestorIdentifier:");
  if (*((_QWORD *)v4 + 15))
    -[_MRContentItemProtobuf setQueueIdentifier:](self, "setQueueIdentifier:");
  if (*((_QWORD *)v4 + 17))
    -[_MRContentItemProtobuf setRequestIdentifier:](self, "setRequestIdentifier:");
  v24 = *((_BYTE *)v4 + 160);
  if ((v24 & 2) != 0)
  {
    self->_artworkDataWidth = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    v24 = *((_BYTE *)v4 + 160);
  }
  if ((v24 & 1) != 0)
  {
    self->_artworkDataHeight = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[_MRContentItemProtobuf setAssociatedParticipantIdentifier:](self, "setAssociatedParticipantIdentifier:");
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v25 = *((id *)v4 + 5);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        -[_MRContentItemProtobuf addAvailableArtworkFormats:](self, "addAvailableArtworkFormats:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
    }
    while (v27);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v30 = *((id *)v4 + 7);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v63;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v30);
        -[_MRContentItemProtobuf addAvailableRemoteArtworkFormats:](self, "addAvailableRemoteArtworkFormats:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * n));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
    }
    while (v32);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v35 = *((id *)v4 + 9);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v84, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v37; ++ii)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        -[_MRContentItemProtobuf addDataArtworks:](self, "addDataArtworks:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * ii));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v84, 16);
    }
    while (v37);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = *((id *)v4 + 16);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v83, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v55;
    do
    {
      for (jj = 0; jj != v42; ++jj)
      {
        if (*(_QWORD *)v55 != v43)
          objc_enumerationMutation(v40);
        -[_MRContentItemProtobuf addRemoteArtworks:](self, "addRemoteArtworks:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * jj));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v83, 16);
    }
    while (v42);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = *((id *)v4 + 19);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v82, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v51;
    do
    {
      for (kk = 0; kk != v47; ++kk)
      {
        if (*(_QWORD *)v51 != v48)
          objc_enumerationMutation(v45);
        -[_MRContentItemProtobuf addTranscriptAlignments:](self, "addTranscriptAlignments:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * kk), (_QWORD)v50);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v50, v82, 16);
    }
    while (v47);
  }

}

- (_MRLyricsItemProtobuf)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_storeStrong((id *)&self->_lyrics, a3);
}

- (int)artworkDataWidth
{
  return self->_artworkDataWidth;
}

- (int)artworkDataHeight
{
  return self->_artworkDataHeight;
}

- (NSMutableArray)dataArtworks
{
  return self->_dataArtworks;
}

- (void)setDataArtworks:(id)a3
{
  objc_storeStrong((id *)&self->_dataArtworks, a3);
}

- (NSMutableArray)remoteArtworks
{
  return self->_remoteArtworks;
}

- (void)setRemoteArtworks:(id)a3
{
  objc_storeStrong((id *)&self->_remoteArtworks, a3);
}

- (NSMutableArray)transcriptAlignments
{
  return self->_transcriptAlignments;
}

- (void)setTranscriptAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptAlignments, a3);
}

@end
