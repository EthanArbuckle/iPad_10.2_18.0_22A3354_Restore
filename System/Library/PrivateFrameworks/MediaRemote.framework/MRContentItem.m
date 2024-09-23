@implementation MRContentItem

- (MRContentItem)skeleton
{
  MRContentItem *v3;
  void *v4;
  MRContentItem *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = [MRContentItem alloc];
  -[MRContentItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRContentItem initWithIdentifier:](v3, "initWithIdentifier:", v4);

  -[MRContentItem parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItem setParentIdentifier:](v5, "setParentIdentifier:", v6);

  -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItem setAncestorIdentifier:](v5, "setAncestorIdentifier:", v7);

  -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItem setAssociatedParticipantIdentifier:](v5, "setAssociatedParticipantIdentifier:", v8);

  return v5;
}

- (MRContentItem)initWithIdentifier:(id)a3
{
  id v4;
  MRContentItem *v5;
  MRContentItem *v6;
  MRContentItem *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)MRContentItem;
    v5 = -[MRContentItem init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[MRContentItem setIdentifier:](v5, "setIdentifier:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRContentItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  -[MRContentItem info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("info"));

  -[MRContentItem parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("parentIdentifier"));

  -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ancestorIdentifier"));

  -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("associatedParticipantIdentifier"));

  -[MRContentItem queueIdentifier](self, "queueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("queueIdentifier"));

  -[MRContentItem requestIdentifier](self, "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requestIdentifier"));

  -[MRContentItem metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("metadata"));

  -[MRContentItem artwork](self, "artwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("artwork"));

  -[MRContentItem transcriptAlignments](self, "transcriptAlignments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mr_map:", &__block_literal_global_48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("transcriptAlignments"));

  -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mr_map:", &__block_literal_global_51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("availableLanguageOptions"));

  -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mr_map:", &__block_literal_global_54_1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("currentLanguageOptions"));

  -[MRContentItem sections](self, "sections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mr_map:", &__block_literal_global_57);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("sections"));

  -[MRContentItem availableArtworkFormats](self, "availableArtworkFormats");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("availableArtworkFormats"));

  -[MRContentItem availableRemoteArtworkFormats](self, "availableRemoteArtworkFormats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("availableRemoteArtworkFormats"));

  -[MRContentItem artworks](self, "artworks");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("artworks"));

  -[MRContentItem remoteArtworks](self, "remoteArtworks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("remoteArtworks"));

  return (NSDictionary *)v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
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
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setIdentifier:](self, "setIdentifier:", v6);

  }
  -[MRContentItem metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {

    if (!v9)
      goto LABEL_8;
    -[MRContentItem metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeFrom:", v10);

  }
  else
  {
    -[MRContentItem setMetadata:](self, "setMetadata:", v8);
  }

LABEL_8:
  objc_msgSend(v4, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setInfo:](self, "setInfo:", v12);

  }
  objc_msgSend(v4, "transcriptAlignments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "transcriptAlignments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setTranscriptAlignments:](self, "setTranscriptAlignments:", v14);

  }
  objc_msgSend(v4, "parentIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "parentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setParentIdentifier:](self, "setParentIdentifier:", v16);

  }
  objc_msgSend(v4, "ancestorIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "ancestorIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setAncestorIdentifier:](self, "setAncestorIdentifier:", v18);

  }
  objc_msgSend(v4, "associatedParticipantIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "associatedParticipantIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setAssociatedParticipantIdentifier:](self, "setAssociatedParticipantIdentifier:", v20);

  }
  objc_msgSend(v4, "queueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "queueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setQueueIdentifier:](self, "setQueueIdentifier:", v22);

  }
  objc_msgSend(v4, "requestIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "requestIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setRequestIdentifier:](self, "setRequestIdentifier:", v24);

  }
  objc_msgSend(v4, "artwork");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "artwork");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setArtwork:](self, "setArtwork:", v26);

  }
  objc_msgSend(v4, "availableLanguageOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    objc_msgSend(v4, "availableLanguageOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setAvailableLanguageOptions:](self, "setAvailableLanguageOptions:", v29);

  }
  objc_msgSend(v4, "currentLanguageOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    objc_msgSend(v4, "currentLanguageOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setCurrentLanguageOptions:](self, "setCurrentLanguageOptions:", v32);

  }
  objc_msgSend(v4, "sections");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    objc_msgSend(v4, "sections");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setSections:](self, "setSections:", v35);

  }
  objc_msgSend(v4, "availableArtworkFormats");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v4, "availableArtworkFormats");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setAvailableArtworkFormats:](self, "setAvailableArtworkFormats:", v37);

  }
  objc_msgSend(v4, "availableRemoteArtworkFormats");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v4, "availableRemoteArtworkFormats");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem setAvailableRemoteArtworkFormats:](self, "setAvailableRemoteArtworkFormats:", v39);

  }
  objc_msgSend(v4, "artworks");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
  {
    -[MRContentItem artworks](self, "artworks");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      -[MRContentItem artworks](self, "artworks");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v43, "mutableCopy");

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v4, "artworks");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "allKeys");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v75 != v49)
              objc_enumerationMutation(v46);
            v51 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
            objc_msgSend(v4, "artworks");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v53, v51);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
        }
        while (v48);
      }

      v54 = (void *)objc_msgSend(v44, "copy");
      -[MRContentItem setArtworks:](self, "setArtworks:", v54);

    }
    else
    {
      objc_msgSend(v4, "artworks");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem setArtworks:](self, "setArtworks:", v44);
    }

  }
  objc_msgSend(v4, "remoteArtworks");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count");

  if (v56)
  {
    -[MRContentItem remoteArtworks](self, "remoteArtworks");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      -[MRContentItem remoteArtworks](self, "remoteArtworks");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "mutableCopy");

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v4, "remoteArtworks", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "allKeys");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v63; ++j)
          {
            if (*(_QWORD *)v71 != v64)
              objc_enumerationMutation(v61);
            v66 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_msgSend(v4, "remoteArtworks");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectForKeyedSubscript:", v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v68, v66);

          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v63);
      }

      v69 = (void *)objc_msgSend(v59, "copy");
      -[MRContentItem setRemoteArtworks:](self, "setRemoteArtworks:", v69);

    }
    else
    {
      objc_msgSend(v4, "remoteArtworks");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem setRemoteArtworks:](self, "setRemoteArtworks:", v59);
    }

  }
}

- (MRContentItemMetadata)metadata
{
  MRContentItem *v2;
  MRContentItemMetadata *metadata;
  MRContentItemMetadata *v4;
  MRContentItemMetadata *v5;
  MRContentItemMetadata *v6;

  v2 = self;
  objc_sync_enter(v2);
  metadata = v2->_metadata;
  if (!metadata)
  {
    v4 = objc_alloc_init(MRContentItemMetadata);
    v5 = v2->_metadata;
    v2->_metadata = v4;

    metadata = v2->_metadata;
  }
  v6 = metadata;
  objc_sync_exit(v2);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRContentItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v7);

  -[MRContentItem metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMetadata:", v9);

  -[MRContentItem info](self, "info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setInfo:", v11);

  -[MRContentItem parentIdentifier](self, "parentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setParentIdentifier:", v13);

  -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setAncestorIdentifier:", v15);

  -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssociatedParticipantIdentifier:", v17);

  -[MRContentItem queueIdentifier](self, "queueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setQueueIdentifier:", v19);

  -[MRContentItem requestIdentifier](self, "requestIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setRequestIdentifier:", v21);

  -[MRContentItem artwork](self, "artwork");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtwork:", v23);

  -[MRContentItem transcriptAlignments](self, "transcriptAlignments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __30__MRContentItem_copyWithZone___block_invoke;
  v45[3] = &__block_descriptor_40_e31__16__0__MRTranscriptAlignment_8l;
  v45[4] = a3;
  objc_msgSend(v24, "mr_map:", v45);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranscriptAlignments:", v26);

  -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v25;
  v44[1] = 3221225472;
  v44[2] = __30__MRContentItem_copyWithZone___block_invoke_2;
  v44[3] = &__block_descriptor_40_e31__16__0__MRLanguageOptionGroup_8l;
  v44[4] = a3;
  objc_msgSend(v27, "mr_map:", v44);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvailableLanguageOptions:", v28);

  -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v25;
  v43[1] = 3221225472;
  v43[2] = __30__MRContentItem_copyWithZone___block_invoke_3;
  v43[3] = &__block_descriptor_40_e26__16__0__MRLanguageOption_8l;
  v43[4] = a3;
  objc_msgSend(v29, "mr_map:", v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentLanguageOptions:", v30);

  -[MRContentItem sections](self, "sections");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v25;
  v42[1] = 3221225472;
  v42[2] = __30__MRContentItem_copyWithZone___block_invoke_4;
  v42[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v42[4] = a3;
  objc_msgSend(v31, "mr_map:", v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSections:", v32);

  -[MRContentItem availableArtworkFormats](self, "availableArtworkFormats");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copyWithZone:", a3);
  objc_msgSend(v5, "setAvailableArtworkFormats:", v34);

  -[MRContentItem availableRemoteArtworkFormats](self, "availableRemoteArtworkFormats");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copyWithZone:", a3);
  objc_msgSend(v5, "setAvailableRemoteArtworkFormats:", v36);

  -[MRContentItem artworks](self, "artworks");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworks:", v38);

  -[MRContentItem remoteArtworks](self, "remoteArtworks");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copyWithZone:", a3);
  objc_msgSend(v5, "setRemoteArtworks:", v40);

  return v5;
}

- (NSArray)currentLanguageOptions
{
  return self->_currentLanguageOptions;
}

- (NSArray)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (NSArray)sections
{
  return self->_sections;
}

- (MRArtwork)artwork
{
  return self->_artwork;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (NSString)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (NSString)info
{
  return self->_info;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSDictionary)artworks
{
  return self->_artworks;
}

- (NSDictionary)remoteArtworks
{
  return self->_remoteArtworks;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSArray)availableRemoteArtworkFormats
{
  return self->_availableRemoteArtworkFormats;
}

- (NSArray)availableArtworkFormats
{
  return self->_availableArtworkFormats;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setRemoteArtworks:(id)a3
{
  objc_storeStrong((id *)&self->_remoteArtworks, a3);
}

- (void)setArtworks:(id)a3
{
  objc_storeStrong((id *)&self->_artworks, a3);
}

- (void)setParentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAncestorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setCurrentLanguageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAvailableLanguageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setAvailableArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_availableArtworkFormats, a3);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setQueueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setAvailableRemoteArtworkFormats:(id)a3
{
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_availableArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_transcriptAlignments, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRContentItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (MRContentItem)initWithData:(id)a3
{
  id v4;
  _MRContentItemProtobuf *v5;
  MRContentItem *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRContentItemProtobuf initWithData:]([_MRContentItemProtobuf alloc], "initWithData:", v4);

    self = -[MRContentItem initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRContentItem)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MRContentItem *v7;
  void *v8;
  uint64_t v9;
  NSString *info;
  void *v11;
  uint64_t v12;
  NSString *parentIdentifier;
  void *v14;
  uint64_t v15;
  NSString *ancestorIdentifier;
  void *v17;
  uint64_t v18;
  NSString *associatedParticipantIdentifier;
  void *v20;
  uint64_t v21;
  NSString *queueIdentifier;
  void *v23;
  uint64_t v24;
  NSString *requestIdentifier;
  MRArtwork *v26;
  MRArtwork *artwork;
  MRContentItemMetadata *v28;
  void *v29;
  uint64_t v30;
  MRContentItemMetadata *metadata;
  void *v32;
  uint64_t v33;
  NSArray *transcriptAlignments;
  void *v35;
  uint64_t v36;
  NSArray *availableLanguageOptions;
  void *v38;
  uint64_t v39;
  NSArray *currentLanguageOptions;
  void *v41;
  uint64_t v42;
  NSArray *sections;
  uint64_t v44;
  NSArray *availableArtworkFormats;
  uint64_t v46;
  NSArray *availableRemoteArtworkFormats;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  MRDataArtwork *v55;
  NSObject *v56;
  MRDataArtwork *v57;
  void *v58;
  NSString *identifier;
  uint64_t v60;
  NSDictionary *artworks;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  MRRemoteArtwork *v69;
  void *v70;
  NSString *v71;
  uint64_t v72;
  NSDictionary *remoteArtworks;
  MRContentItem *v74;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  NSString *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRContentItem initWithIdentifier:](self, "initWithIdentifier:", v6);

    if (v7)
    {
      objc_msgSend(v5, "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      info = v7->_info;
      v7->_info = (NSString *)v9;

      objc_msgSend(v5, "parentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      parentIdentifier = v7->_parentIdentifier;
      v7->_parentIdentifier = (NSString *)v12;

      objc_msgSend(v5, "ancestorIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      ancestorIdentifier = v7->_ancestorIdentifier;
      v7->_ancestorIdentifier = (NSString *)v15;

      objc_msgSend(v5, "associatedParticipantIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      associatedParticipantIdentifier = v7->_associatedParticipantIdentifier;
      v7->_associatedParticipantIdentifier = (NSString *)v18;

      objc_msgSend(v5, "queueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      queueIdentifier = v7->_queueIdentifier;
      v7->_queueIdentifier = (NSString *)v21;

      objc_msgSend(v5, "requestIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSString *)v24;

      v26 = -[MRArtwork initWithProtobuf:]([MRArtwork alloc], "initWithProtobuf:", v5);
      artwork = v7->_artwork;
      v7->_artwork = v26;

      if (objc_msgSend(v5, "hasMetadata"))
      {
        v28 = [MRContentItemMetadata alloc];
        objc_msgSend(v5, "metadata");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[MRContentItemMetadata initWithProtobuf:](v28, "initWithProtobuf:", v29);
        metadata = v7->_metadata;
        v7->_metadata = (MRContentItemMetadata *)v30;

      }
      objc_msgSend(v5, "transcriptAlignments");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "mr_map:", &__block_literal_global_74);
      v33 = objc_claimAutoreleasedReturnValue();
      transcriptAlignments = v7->_transcriptAlignments;
      v7->_transcriptAlignments = (NSArray *)v33;

      objc_msgSend(v5, "availableLanguageOptions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mr_map:", &__block_literal_global_9_1);
      v36 = objc_claimAutoreleasedReturnValue();
      availableLanguageOptions = v7->_availableLanguageOptions;
      v7->_availableLanguageOptions = (NSArray *)v36;

      objc_msgSend(v5, "currentLanguageOptions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "mr_map:", &__block_literal_global_12_1);
      v39 = objc_claimAutoreleasedReturnValue();
      currentLanguageOptions = v7->_currentLanguageOptions;
      v7->_currentLanguageOptions = (NSArray *)v39;

      objc_msgSend(v5, "sections");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "mr_map:", &__block_literal_global_15_2);
      v42 = objc_claimAutoreleasedReturnValue();
      sections = v7->_sections;
      v7->_sections = (NSArray *)v42;

      objc_msgSend(v5, "availableArtworkFormats");
      v44 = objc_claimAutoreleasedReturnValue();
      availableArtworkFormats = v7->_availableArtworkFormats;
      v7->_availableArtworkFormats = (NSArray *)v44;

      objc_msgSend(v5, "availableRemoteArtworkFormats");
      v46 = objc_claimAutoreleasedReturnValue();
      availableRemoteArtworkFormats = v7->_availableRemoteArtworkFormats;
      v7->_availableRemoteArtworkFormats = (NSArray *)v46;

      v76 = v5;
      if (objc_msgSend(v5, "dataArtworksCount"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v5, "dataArtworks");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v82 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              if (objc_msgSend(v54, "hasType"))
              {
                v55 = [MRDataArtwork alloc];
                objc_msgSend(v54, "imageData");
                v56 = objc_claimAutoreleasedReturnValue();
                v57 = -[MRDataArtwork initWithImageData:](v55, "initWithImageData:", v56);
                objc_msgSend(v54, "type");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKeyedSubscript:", v57, v58);

              }
              else
              {
                _MRLogForCategory(0);
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                {
                  identifier = v7->_identifier;
                  *(_DWORD *)buf = 138412546;
                  v87 = v54;
                  v88 = 2112;
                  v89 = identifier;
                  _os_log_fault_impl(&dword_193827000, v56, OS_LOG_TYPE_FAULT, "FAULT: No type for artwork protobuf %@ in content item %@", buf, 0x16u);
                }
              }

            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          }
          while (v51);
        }

        v60 = objc_msgSend(v48, "copy");
        artworks = v7->_artworks;
        v7->_artworks = (NSDictionary *)v60;

        v5 = v76;
      }
      if (objc_msgSend(v5, "remoteArtworksCount"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend(v5, "remoteArtworks");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v78 != v66)
                objc_enumerationMutation(v63);
              v68 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
              if (objc_msgSend(v68, "hasType"))
              {
                v69 = -[MRRemoteArtwork initWithProtobuf:]([MRRemoteArtwork alloc], "initWithProtobuf:", v68);
                objc_msgSend(v68, "type");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setObject:forKeyedSubscript:", v69, v70);

              }
              else
              {
                _MRLogForCategory(0);
                v69 = (MRRemoteArtwork *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_FAULT))
                {
                  v71 = v7->_identifier;
                  *(_DWORD *)buf = 138412546;
                  v87 = v68;
                  v88 = 2112;
                  v89 = v71;
                  _os_log_fault_impl(&dword_193827000, &v69->super, OS_LOG_TYPE_FAULT, "FAULT: No type for artwork protobuf %@ in content item %@", buf, 0x16u);
                }
              }

            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
          }
          while (v65);
        }

        v72 = objc_msgSend(v62, "copy");
        remoteArtworks = v7->_remoteArtworks;
        v7->_remoteArtworks = (NSDictionary *)v72;

        v5 = v76;
      }
    }
    self = v7;
    v74 = self;
  }
  else
  {
    v74 = 0;
  }

  return v74;
}

- (NSDictionary)nowPlayingInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  int v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  int v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  int v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  id v251;
  id v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t i;
  uint64_t v257;
  void *v258;
  void *v259;
  int v260;
  void *v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  __CFString **v265;
  __CFString *v266;
  void *v267;
  int v268;
  __CFString **v269;
  __CFString *v270;
  __CFString *v271;
  void *v272;
  void *v273;
  void *ExternalRepresentation;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  uint64_t v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  NSDictionary *v296;
  void *v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  _BYTE v303[128];
  _QWORD v304[6];

  v304[4] = *MEMORY[0x1E0C80C00];
  -[MRContentItem metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRContentItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRContentItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kMRMediaRemoteNowPlayingInfoContentItemIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "albumName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MRContentItem metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "albumName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kMRMediaRemoteNowPlayingInfoAlbum"));

  }
  -[MRContentItem metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trackArtistName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRContentItem metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackArtistName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("kMRMediaRemoteNowPlayingInfoArtist"));

  }
  -[MRContentItem metadata](self, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MRContentItem metadata](self, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("kMRMediaRemoteNowPlayingInfoAssetURL"));

  }
  -[MRContentItem metadata](self, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "composer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[MRContentItem metadata](self, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "composer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("kMRMediaRemoteNowPlayingInfoComposer"));

  }
  -[MRContentItem metadata](self, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasDiscNumber");

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "discNumber"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("kMRMediaRemoteNowPlayingInfoDiscNumber"));

  }
  -[MRContentItem metadata](self, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "genre");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MRContentItem metadata](self, "metadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "genre");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("kMRMediaRemoteNowPlayingInfoGenre"));

  }
  -[MRContentItem metadata](self, "metadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hasPlaybackRate");

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "playbackRate");
    objc_msgSend(v35, "numberWithFloat:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackRate"));

  }
  -[MRContentItem metadata](self, "metadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "currentPlaybackDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[MRContentItem metadata](self, "metadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "currentPlaybackDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"));

  }
  -[MRContentItem metadata](self, "metadata");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "hasAlwaysLive");

  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "isAlwaysLive"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("kMRMediaRemoteNowPlayingInfoIsAlwaysLive"));

  }
  -[MRContentItem metadata](self, "metadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isAlwaysLive");

  if ((v48 & 1) == 0)
  {
    -[MRContentItem metadata](self, "metadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "hasDuration");

    if (v50)
    {
      v51 = (void *)MEMORY[0x1E0CB37E8];
      -[MRContentItem metadata](self, "metadata");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "duration");
      objc_msgSend(v51, "numberWithDouble:");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("kMRMediaRemoteNowPlayingInfoDuration"));

    }
    -[MRContentItem metadata](self, "metadata");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "hasElapsedTime");

    if (v55)
    {
      v56 = (void *)MEMORY[0x1E0CB37E8];
      -[MRContentItem metadata](self, "metadata");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "elapsedTime");
      objc_msgSend(v56, "numberWithDouble:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime"));

    }
  }
  -[MRContentItem metadata](self, "metadata");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "hasInTransition");

  if (v60)
  {
    v61 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "numberWithBool:", objc_msgSend(v62, "isInTransition"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("kMRMediaRemoteNowPlayingInfoIsInTransition"));

  }
  -[MRContentItem metadata](self, "metadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "hasInferredTimestamp");

  if (v65)
  {
    v66 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "inferredTimestamp");
    objc_msgSend(v66, "numberWithDouble:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));

  }
  -[MRContentItem metadata](self, "metadata");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "hasElapsedTimeTimestamp");

  if ((v70 & 1) != 0)
  {
    v71 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "elapsedTimeTimestamp");
    objc_msgSend(v71, "numberWithDouble:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    v76 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v74, "doubleValue");
    objc_msgSend(v76, "dateWithTimeIntervalSinceReferenceDate:");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));

  }
  -[MRContentItem metadata](self, "metadata");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "hasStartTime");

  if (v79)
  {
    v80 = (void *)MEMORY[0x1E0C99D68];
    -[MRContentItem metadata](self, "metadata");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "startTime");
    objc_msgSend(v80, "dateWithTimeIntervalSinceReferenceDate:");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"));
  }
  -[MRContentItem metadata](self, "metadata");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "title");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[MRContentItem metadata](self, "metadata");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "title");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("kMRMediaRemoteNowPlayingInfoTitle"));

  }
  -[MRContentItem metadata](self, "metadata");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "hasTotalDiscCount");

  if (v88)
  {
    v89 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "numberWithInteger:", objc_msgSend(v90, "totalDiscCount"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v91, CFSTR("kMRMediaRemoteNowPlayingInfoTotalDiscCount"));

  }
  -[MRContentItem metadata](self, "metadata");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "hasTotalTrackCount");

  if (v93)
  {
    v94 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "numberWithInteger:", objc_msgSend(v95, "totalTrackCount"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, CFSTR("kMRMediaRemoteNowPlayingInfoTotalTrackCount"));

  }
  -[MRContentItem metadata](self, "metadata");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "hasTrackNumber");

  if (v98)
  {
    v99 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "numberWithInteger:", objc_msgSend(v100, "trackNumber"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v101, CFSTR("kMRMediaRemoteNowPlayingInfoTrackNumber"));

  }
  -[MRContentItem metadata](self, "metadata");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "collectionIdentifier");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    -[MRContentItem metadata](self, "metadata");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "collectionIdentifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v105, CFSTR("kMRMediaRemoteNowPlayingInfoCollectionIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "contentIdentifier");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {
    -[MRContentItem metadata](self, "metadata");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "contentIdentifier");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v109, CFSTR("kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "profileIdentifier");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
  {
    -[MRContentItem metadata](self, "metadata");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "profileIdentifier");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v113, CFSTR("kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "serviceIdentifier");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    -[MRContentItem metadata](self, "metadata");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "serviceIdentifier");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, CFSTR("kMRMediaRemoteNowPlayingInfoServiceIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "brandIdentifier");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    -[MRContentItem metadata](self, "metadata");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "brandIdentifier");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v121, CFSTR("kMRMediaRemoteNowPlayingInfoBrandIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v122, "hasPlaybackProgress");

  if (v123)
  {
    v124 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "playbackProgress");
    objc_msgSend(v124, "numberWithFloat:");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v126, CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackProgress"));

  }
  -[MRContentItem metadata](self, "metadata");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "hasExplicitItem");

  if (v128)
  {
    v129 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "numberWithBool:", objc_msgSend(v130, "isExplicitItem"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v131, CFSTR("kMRMediaRemoteNowPlayingInfoIsExplicitTrack"));

  }
  -[MRContentItem metadata](self, "metadata");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v132, "hasSharable");

  if (v133)
  {
    v134 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "numberWithBool:", objc_msgSend(v135, "isSharable"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v136, CFSTR("kMRMediaRemoteNowPlayingInfoIsSharable"));

  }
  -[MRContentItem metadata](self, "metadata");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "hasLiked");

  if (v138)
  {
    v139 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "numberWithBool:", objc_msgSend(v140, "isLiked"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v141, CFSTR("kMRMediaRemoteNowPlayingInfoIsLiked"));

  }
  -[MRContentItem metadata](self, "metadata");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "hasInWishList");

  if (v143)
  {
    v144 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "numberWithBool:", objc_msgSend(v145, "isInWishList"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v146, CFSTR("kMRMediaRemoteNowPlayingInfoIsInWishList"));

  }
  -[MRContentItem metadata](self, "metadata");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "hasRadioStationIdentifier");

  if (v148)
  {
    v149 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "numberWithLongLong:", objc_msgSend(v150, "radioStationIdentifier"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v151, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "radioStationName");
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (v153)
  {
    -[MRContentItem metadata](self, "metadata");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "radioStationName");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v155, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationName"));

  }
  -[MRContentItem metadata](self, "metadata");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "hasRadioStationIdentifier");

  if (v157)
  {
    v158 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "numberWithLongLong:", objc_msgSend(v159, "radioStationIdentifier"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v160, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v161, "hasITunesStoreIdentifier");

  if (v162)
  {
    v163 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "numberWithLongLong:", objc_msgSend(v164, "iTunesStoreIdentifier"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v165, CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v166, "hasITunesStoreSubscriptionIdentifier");

  if (v167)
  {
    v168 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "numberWithLongLong:", objc_msgSend(v169, "iTunesStoreSubscriptionIdentifier"));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v170, CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend(v171, "hasITunesStoreArtistIdentifier");

  if (v172)
  {
    v173 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "numberWithLongLong:", objc_msgSend(v174, "iTunesStoreArtistIdentifier"));
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v175, CFSTR("kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = objc_msgSend(v176, "hasITunesStoreAlbumIdentifier");

  if (v177)
  {
    v178 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "numberWithLongLong:", objc_msgSend(v179, "iTunesStoreAlbumIdentifier"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v180, CFSTR("kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "purchaseInfoData");
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  if (v182)
  {
    -[MRContentItem metadata](self, "metadata");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "purchaseInfoData");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v184, CFSTR("kMRMediaRemoteNowPlayingInfoPurchaseInfoData"));

  }
  -[MRContentItem metadata](self, "metadata");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend(v185, "hasDefaultPlaybackRate");

  if (v186)
  {
    v187 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "defaultPlaybackRate");
    objc_msgSend(v187, "numberWithFloat:");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v189, CFSTR("kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"));

  }
  -[MRContentItem metadata](self, "metadata");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = objc_msgSend(v190, "hasDownloadState");

  if (v191)
  {
    v192 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "numberWithInteger:", objc_msgSend(v193, "downloadState"));
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v194, CFSTR("kMRMediaRemoteNowPlayingInfoDownloadState"));

  }
  -[MRContentItem metadata](self, "metadata");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "hasDownloadProgress");

  if (v196)
  {
    v197 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "downloadProgress");
    objc_msgSend(v197, "numberWithFloat:");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v199, CFSTR("kMRMediaRemoteNowPlayingInfoDownloadProgress"));

  }
  -[MRContentItem metadata](self, "metadata");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = objc_msgSend(v200, "hasAdvertisement");

  if (v201)
  {
    v202 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "numberWithBool:", objc_msgSend(v203, "isAdvertisement"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v204, CFSTR("kMRMediaRemoteNowPlayingInfoIsAdvertisement"));

  }
  -[MRContentItem metadata](self, "metadata");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = objc_msgSend(v205, "hasSteerable");

  if (v206)
  {
    v207 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "numberWithBool:", objc_msgSend(v208, "isSteerable"));
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v209, CFSTR("kMRMediaRemoteNowPlayingInfoIsSteerable"));

  }
  -[MRContentItem metadata](self, "metadata");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "artworkIdentifier");
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  if (v211)
  {
    -[MRContentItem metadata](self, "metadata");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "artworkIdentifier");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v213, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "artworkURL");
  v215 = (void *)objc_claimAutoreleasedReturnValue();

  if (v215)
  {
    -[MRContentItem metadata](self, "metadata");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "artworkURL");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "absoluteString");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v218, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkURL"));

  }
  -[MRContentItem metadata](self, "metadata");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = objc_msgSend(v219, "hasLegacyUniqueIdentifier");

  if (v220)
  {
    v221 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "numberWithLongLong:", objc_msgSend(v222, "legacyUniqueIdentifier"));
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v223, CFSTR("kMRMediaRemoteNowPlayingInfoUniqueIdentifier"));

  }
  -[MRContentItem metadata](self, "metadata");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "appMetrics");
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  if (v225)
  {
    -[MRContentItem metadata](self, "metadata");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "appMetrics");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = (void *)objc_msgSend(v227, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v228, CFSTR("kMRMediaRemoteNowPlayingInfoAppMetrics"));

  }
  -[MRContentItem metadata](self, "metadata");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "collectionInfo");
  v230 = (void *)objc_claimAutoreleasedReturnValue();

  if (v230)
  {
    -[MRContentItem metadata](self, "metadata");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "collectionInfo");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v233 = (void *)objc_msgSend(v232, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v233, CFSTR("kMRMediaRemoteNowPlayingInfoCollectionInfo"));

  }
  -[MRContentItem metadata](self, "metadata");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "userInfo");
  v235 = (void *)objc_claimAutoreleasedReturnValue();

  if (v235)
  {
    -[MRContentItem metadata](self, "metadata");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "userInfo");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = (void *)objc_msgSend(v237, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v238, CFSTR("kMRMediaRemoteNowPlayingInfoUserInfo"));

  }
  -[MRContentItem metadata](self, "metadata");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "internationalStandardRecordingCode");
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  if (v240)
  {
    -[MRContentItem metadata](self, "metadata");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "internationalStandardRecordingCode");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = (void *)objc_msgSend(v242, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v243, CFSTR("kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode"));

  }
  -[MRContentItem metadata](self, "metadata");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = objc_msgSend(v244, "hasExcludeFromSuggestions");

  if (v245)
  {
    v246 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem metadata](self, "metadata");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "numberWithBool:", objc_msgSend(v247, "excludeFromSuggestions"));
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v248, CFSTR("kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"));

  }
  -[MRContentItem metadata](self, "metadata");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "collectionInfo");
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  if (v250)
  {
    objc_msgSend(v250, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingCollectionInfoKeyIdentifiers"));
    v251 = (id)objc_claimAutoreleasedReturnValue();

    if (v251)
    {
      v298 = v75;
      v304[0] = CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationHash");
      v304[1] = CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationIdentifier");
      v304[2] = CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier");
      v304[3] = CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationName");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v304, 4);
      v299 = 0u;
      v300 = 0u;
      v301 = 0u;
      v302 = 0u;
      v252 = (id)objc_claimAutoreleasedReturnValue();
      v253 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v299, v303, 16);
      if (v253)
      {
        v254 = v253;
        v255 = *(_QWORD *)v300;
        do
        {
          for (i = 0; i != v254; ++i)
          {
            if (*(_QWORD *)v300 != v255)
              objc_enumerationMutation(v252);
            v257 = *(_QWORD *)(*((_QWORD *)&v299 + 1) + 8 * i);
            objc_msgSend(v251, "objectForKeyedSubscript:", v257);
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            if (v258)
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v258, v257);

          }
          v254 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v299, v303, 16);
        }
        while (v254);
      }

      v75 = v298;
    }
  }
  -[MRContentItem metadata](self, "metadata");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = objc_msgSend(v259, "hasMediaType");

  if (v260)
  {
    -[MRContentItem metadata](self, "metadata");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = objc_msgSend(v261, "mediaType");

    -[MRContentItem metadata](self, "metadata");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = objc_msgSend(v263, "mediaSubType");

    if (v262 == 1)
    {
      v265 = kMRMediaRemoteNowPlayingInfoTypeAudio;
    }
    else
    {
      if (v262 != 2)
      {
        v266 = 0;
        goto LABEL_127;
      }
      v265 = kMRMediaRemoteNowPlayingInfoTypeVideo;
    }
    v266 = *v265;
LABEL_127:
    -[MRContentItem metadata](self, "metadata");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = objc_msgSend(v267, "hasMediaSubType");

    if (v268)
    {
      switch(v264)
      {
        case 0:
          if (v266)
            goto LABEL_140;
          v266 = CFSTR("kMRMediaRemoteNowPlayingInfoTypeAudio");
          goto LABEL_139;
        case 1:
          v269 = kMRMediaRemoteMediaTypeMusic;
          goto LABEL_137;
        case 2:
        case 3:
          v269 = kMRMediaRemoteNowPlayingInfoTypeVideo;
          goto LABEL_137;
        case 4:
          v269 = kMRMediaRemoteMediaTypePodcast;
          goto LABEL_137;
        case 5:
          v269 = kMRMediaRemoteMediaTypeAudioBook;
          goto LABEL_137;
        case 6:
          v269 = kMRMediaRemoteMediaTypeITunesU;
LABEL_137:
          v270 = *v269;
          break;
        default:
          v270 = CFSTR("kMRMediaRemoteNowPlayingInfoTypeAudio");
          break;
      }
      v271 = v270;

      v266 = v271;
    }
LABEL_139:
    if (v266)
    {
LABEL_140:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v266, CFSTR("kMRMediaRemoteNowPlayingInfoMediaType"));

    }
  }
  -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  if (v272)
  {
    -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    ExternalRepresentation = (void *)MRLanguageOptionGroupsCreateExternalRepresentation((uint64_t)v273);

    if (ExternalRepresentation)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", ExternalRepresentation, CFSTR("kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"));

  }
  -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  if (v275)
  {
    -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    v277 = (void *)MRLanguageOptionsCreateExternalRepresentation((uint64_t)v276);

    if (v277)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v277, CFSTR("kMRMediaRemoteNowPlayingInfoCurrentLanguageOptionsData"));

  }
  -[MRContentItem metadata](self, "metadata");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v278, "artworkMIMEType");
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  if (v279)
  {
    -[MRContentItem metadata](self, "metadata");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v280, "artworkMIMEType");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v281, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkMIMEType"));

  }
  -[MRContentItem artwork](self, "artwork");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "imageData");
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  if (v283)
  {
    -[MRContentItem artwork](self, "artwork");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v284, "imageData");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v285, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkData"));

  }
  -[MRContentItem artwork](self, "artwork");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = objc_msgSend(v286, "width");

  if (v287 >= 1)
  {
    v288 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem artwork](self, "artwork");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "numberWithInteger:", objc_msgSend(v289, "width"));
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v290, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataWidth"));

  }
  -[MRContentItem artwork](self, "artwork");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v292 = objc_msgSend(v291, "height");

  if (v292 >= 1)
  {
    v293 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItem artwork](self, "artwork");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v293, "numberWithInteger:", objc_msgSend(v294, "height"));
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v295, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataHeight"));

  }
  v296 = (NSDictionary *)v5;

  return v296;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRContentItem protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  _MRContentItemProtobuf *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  _MRDataArtworkProtobuf *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  _MRRemoteArtworkProtobuf *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  MRContentItem *v61;
  _MRContentItemProtobuf *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(_MRContentItemProtobuf);
  -[MRContentItem artwork](self, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setArtworkDataWidth:](v5, "setArtworkDataWidth:", objc_msgSend(v6, "width"));

  -[MRContentItem artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setHasArtworkDataWidth:](v5, "setHasArtworkDataWidth:", objc_msgSend(v7, "width") > 0);

  -[MRContentItem artwork](self, "artwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setArtworkDataHeight:](v5, "setArtworkDataHeight:", objc_msgSend(v8, "height"));

  -[MRContentItem artwork](self, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setHasArtworkDataHeight:](v5, "setHasArtworkDataHeight:", objc_msgSend(v9, "height") > 0);

  -[MRContentItem identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setIdentifier:](v5, "setIdentifier:", v10);

  -[MRContentItem artwork](self, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setArtworkData:](v5, "setArtworkData:", v12);

  -[MRContentItem info](self, "info");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setInfo:](v5, "setInfo:", v13);

  -[MRContentItem parentIdentifier](self, "parentIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setParentIdentifier:](v5, "setParentIdentifier:", v14);

  -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setAncestorIdentifier:](v5, "setAncestorIdentifier:", v15);

  -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setAssociatedParticipantIdentifier:](v5, "setAssociatedParticipantIdentifier:", v16);

  -[MRContentItem queueIdentifier](self, "queueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setQueueIdentifier:](v5, "setQueueIdentifier:", v17);

  -[MRContentItem requestIdentifier](self, "requestIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setRequestIdentifier:](v5, "setRequestIdentifier:", v18);

  -[MRContentItem metadata](self, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "protobufWithEncoding:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemProtobuf setMetadata:](v5, "setMetadata:", v20);

  -[MRContentItem transcriptAlignments](self, "transcriptAlignments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mr_map:", &__block_literal_global_22_1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  -[_MRContentItemProtobuf setTranscriptAlignments:](v5, "setTranscriptAlignments:", v23);

  -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mr_map:", &__block_literal_global_24_0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  -[_MRContentItemProtobuf setAvailableLanguageOptions:](v5, "setAvailableLanguageOptions:", v26);

  -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "mr_map:", &__block_literal_global_26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");
  -[_MRContentItemProtobuf setCurrentLanguageOptions:](v5, "setCurrentLanguageOptions:", v29);

  -[MRContentItem sections](self, "sections");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __38__MRContentItem_protobufWithEncoding___block_invoke_4;
  v71[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v71[4] = a3;
  objc_msgSend(v30, "mr_map:", v71);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  -[_MRContentItemProtobuf setSections:](v5, "setSections:", v32);

  -[MRContentItem availableArtworkFormats](self, "availableArtworkFormats");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");
  -[_MRContentItemProtobuf setAvailableArtworkFormats:](v5, "setAvailableArtworkFormats:", v34);

  -[MRContentItem availableRemoteArtworkFormats](self, "availableRemoteArtworkFormats");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");
  v62 = v5;
  -[_MRContentItemProtobuf setAvailableRemoteArtworkFormats:](v5, "setAvailableRemoteArtworkFormats:", v36);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v61 = self;
  -[MRContentItem artworks](self, "artworks");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v68 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        v43 = objc_alloc_init(_MRDataArtworkProtobuf);
        -[_MRDataArtworkProtobuf setType:](v43, "setType:", v42);
        -[MRContentItem artworks](v61, "artworks");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "imageData");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRDataArtworkProtobuf setImageData:](v43, "setImageData:", v46);

        -[_MRContentItemProtobuf addDataArtworks:](v62, "addDataArtworks:", v43);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v39);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[MRContentItem remoteArtworks](v61, "remoteArtworks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v64 != v49)
          objc_enumerationMutation(obj);
        v51 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
        v52 = objc_alloc_init(_MRRemoteArtworkProtobuf);
        -[_MRRemoteArtworkProtobuf setType:](v52, "setType:", v51);
        -[MRContentItem remoteArtworks](v61, "remoteArtworks");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "artworkURLString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRRemoteArtworkProtobuf setArtworkURLString:](v52, "setArtworkURLString:", v55);

        -[MRContentItem remoteArtworks](v61, "remoteArtworks");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v51);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "artworkURLTemplateData");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRRemoteArtworkProtobuf setArtworkURLTemplateData:](v52, "setArtworkURLTemplateData:", v58);

        -[_MRContentItemProtobuf addRemoteArtworks:](v62, "addRemoteArtworks:", v52);
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v48);
  }

  return v62;
}

- (void)setNowPlayingInfo:(id)a3 policy:(unsigned __int8)a4 request:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  MRContentItemMetadata *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  int v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  int v134;
  void *v135;
  double v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  int v144;
  void *v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  char v171;
  void *v172;
  void *v173;
  char v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  MRArtwork *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  char v192;
  void *v193;
  void *v194;
  unsigned int v195;
  int v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  _QWORD v201[5];
  _QWORD v202[5];
  _QWORD v203[5];
  _QWORD v204[5];
  _QWORD v205[5];
  _QWORD v206[5];
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  _QWORD v210[5];
  _QWORD v211[5];
  _QWORD v212[5];
  _QWORD v213[5];
  _QWORD v214[5];
  _QWORD v215[5];
  _QWORD v216[4];
  id v217;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  if (v10)
  {
    v199 = v8;
    -[MRContentItem metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = objc_alloc_init(MRContentItemMetadata);
      -[MRContentItem setMetadata:](self, "setMetadata:", v12);

    }
    v13 = MEMORY[0x1E0C809B0];
    v196 = v6;
    if (v6)
    {
      if (!v9)
      {
LABEL_9:
        v215[0] = v13;
        v215[1] = 3221225472;
        v215[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_2;
        v215[3] = &unk_1E30CC428;
        v215[4] = self;
        _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoAlbum"), v215);
        if (!v9)
        {
LABEL_11:
          v214[0] = v13;
          v214[1] = 3221225472;
          v214[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_3;
          v214[3] = &unk_1E30CC428;
          v214[4] = self;
          _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoArtist"), v214);
          if (!v9)
          {
LABEL_13:
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoAssetURL"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v19 = v17;
              if ((isKindOfClass & 1) == 0)
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v17);
              -[MRContentItem metadata](self, "metadata");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setAssetURL:", v19);

              if ((isKindOfClass & 1) == 0)
            }

            if (!v9)
            {
LABEL_20:
              v213[0] = v13;
              v213[1] = 3221225472;
              v213[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_4;
              v213[3] = &unk_1E30CC428;
              v213[4] = self;
              _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoComposer"), v213);
              if (!v9)
              {
LABEL_22:
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDiscNumber"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v21)
                {
                  v23 = objc_msgSend(v21, "longValue");
                  -[MRContentItem metadata](self, "metadata");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setDiscNumber:", v23);

                }
                if (!v9)
                {
LABEL_26:
                  v212[0] = v13;
                  v212[1] = 3221225472;
                  v212[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_5;
                  v212[3] = &unk_1E30CC428;
                  v212[4] = self;
                  _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoGenre"), v212);
                  if (!v9)
                  {
LABEL_28:
                    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackRate"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = v25;
                    if (v25)
                    {
                      objc_msgSend(v25, "floatValue");
                      v28 = v27;
                      -[MRContentItem metadata](self, "metadata");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v30) = v28;
                      objc_msgSend(v29, "setPlaybackRate:", v30);

                    }
                    if (!v9)
                    {
LABEL_32:
                      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v31)
                      {
                        -[MRContentItem metadata](self, "metadata");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "setCurrentPlaybackDate:", v31);

                      }
                      if (!v9)
                      {
LABEL_36:
                        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsAlwaysLive"));
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = v33;
                        if (v33)
                        {
                          v35 = objc_msgSend(v33, "BOOLValue");
                          -[MRContentItem metadata](self, "metadata");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "setAlwaysLive:", v35);

                        }
                        if (!v9)
                        {
LABEL_40:
                          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsInTransition"));
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v38 = v37;
                          if (v37)
                          {
                            v39 = objc_msgSend(v37, "BOOLValue");
                            -[MRContentItem metadata](self, "metadata");
                            v40 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v40, "setInTransition:", v39);

                          }
LABEL_43:
                          -[MRContentItem metadata](self, "metadata");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          v42 = objc_msgSend(v41, "isAlwaysLive");

                          if ((v42 & 1) == 0)
                          {
                            if (!v9 || objc_msgSend(v9, "includeMetadata"))
                            {
                              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDuration"));
                              v43 = (void *)objc_claimAutoreleasedReturnValue();
                              v44 = v43;
                              if (v43)
                              {
                                objc_msgSend(v43, "doubleValue");
                                v46 = v45;
                                -[MRContentItem metadata](self, "metadata");
                                v47 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v47, "setDuration:", v46);

                              }
                              if (!v9)
                                goto LABEL_50;
                            }
                            if (objc_msgSend(v9, "includeMetadata"))
                            {
LABEL_50:
                              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime"));
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              v49 = v48;
                              if (v48)
                              {
                                objc_msgSend(v48, "doubleValue");
                                v51 = v50;
                                -[MRContentItem metadata](self, "metadata");
                                v52 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v52, "setElapsedTime:", v51);

                              }
                            }
                          }
                          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          v54 = v53;
                          if (v53)
                          {
                            v55 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v53, "timeIntervalSinceReferenceDate");
                            objc_msgSend(v55, "numberWithDouble:");
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", v56, CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));

                          }
                          v198 = v54;
                          if (!v9 || objc_msgSend(v9, "includeMetadata"))
                          {
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            v58 = v57;
                            if (v57)
                            {
                              objc_msgSend(v57, "doubleValue");
                              v60 = v59;
                              -[MRContentItem metadata](self, "metadata");
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v61, "setElapsedTimeTimestamp:", v60);

                            }
                          }
                          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"));
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          v63 = v62;
                          if (v62)
                          {
                            v64 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v62, "timeIntervalSinceReferenceDate");
                            objc_msgSend(v64, "numberWithDouble:");
                            v65 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", v65, CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"));

                          }
                          v197 = v63;
                          if (!v9 || objc_msgSend(v9, "includeMetadata"))
                          {
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"));
                            v66 = (void *)objc_claimAutoreleasedReturnValue();
                            v67 = v66;
                            if (v66)
                            {
                              objc_msgSend(v66, "doubleValue");
                              v69 = v68;
                              -[MRContentItem metadata](self, "metadata");
                              v70 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v70, "setStartTime:", v69);

                            }
                            if (!v9)
                              goto LABEL_284;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_284:
                            v211[0] = v13;
                            v211[1] = 3221225472;
                            v211[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_6;
                            v211[3] = &unk_1E30CC428;
                            v211[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoTitle"), v211);
                            if (!v9)
                              goto LABEL_283;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_283:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTotalDiscCount"));
                            v71 = (void *)objc_claimAutoreleasedReturnValue();
                            v72 = v71;
                            if (v71)
                            {
                              v73 = objc_msgSend(v71, "longValue");
                              -[MRContentItem metadata](self, "metadata");
                              v74 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v74, "setTotalDiscCount:", v73);

                            }
                            if (!v9)
                              goto LABEL_282;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_282:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTotalTrackCount"));
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            v76 = v75;
                            if (v75)
                            {
                              v77 = objc_msgSend(v75, "longValue");
                              -[MRContentItem metadata](self, "metadata");
                              v78 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v78, "setTotalTrackCount:", v77);

                            }
                            if (!v9)
                              goto LABEL_281;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_281:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoTrackNumber"));
                            v79 = (void *)objc_claimAutoreleasedReturnValue();
                            v80 = v79;
                            if (v79)
                            {
                              v81 = objc_msgSend(v79, "longValue");
                              -[MRContentItem metadata](self, "metadata");
                              v82 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v82, "setTrackNumber:", v81);

                            }
                            if (!v9)
                              goto LABEL_280;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_280:
                            v210[0] = v13;
                            v210[1] = 3221225472;
                            v210[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_7;
                            v210[3] = &unk_1E30CC428;
                            v210[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoCollectionIdentifier"), v210);
                            if (!v9)
                              goto LABEL_279;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_279:
                            v209[0] = v13;
                            v209[1] = 3221225472;
                            v209[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_8;
                            v209[3] = &unk_1E30CC428;
                            v209[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"), v209);
                            if (!v9)
                              goto LABEL_278;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_278:
                            v208[0] = v13;
                            v208[1] = 3221225472;
                            v208[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_9;
                            v208[3] = &unk_1E30CC428;
                            v208[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode"), v208);
                            if (!v9)
                              goto LABEL_277;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_277:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"));
                            v83 = (void *)objc_claimAutoreleasedReturnValue();
                            v84 = v83;
                            if (v83)
                            {
                              v85 = objc_msgSend(v83, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v86 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v86, "setExcludeFromSuggestions:", v85);

                            }
                            if (!v9)
                              goto LABEL_276;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_276:
                            v207[0] = v13;
                            v207[1] = 3221225472;
                            v207[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_10;
                            v207[3] = &unk_1E30CC428;
                            v207[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier"), v207);
                            if (!v9)
                              goto LABEL_275;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_275:
                            v206[0] = v13;
                            v206[1] = 3221225472;
                            v206[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_11;
                            v206[3] = &unk_1E30CC428;
                            v206[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoServiceIdentifier"), v206);
                            if (!v9)
                              goto LABEL_274;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_274:
                            v205[0] = v13;
                            v205[1] = 3221225472;
                            v205[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_12;
                            v205[3] = &unk_1E30CC428;
                            v205[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoBrandIdentifier"), v205);
                            if (!v9)
                              goto LABEL_273;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_273:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackProgress"));
                            v87 = (void *)objc_claimAutoreleasedReturnValue();
                            v88 = v87;
                            if (v87)
                            {
                              objc_msgSend(v87, "floatValue");
                              v90 = v89;
                              -[MRContentItem metadata](self, "metadata");
                              v91 = (void *)objc_claimAutoreleasedReturnValue();
                              LODWORD(v92) = v90;
                              objc_msgSend(v91, "setPlaybackProgress:", v92);

                            }
                            if (!v9)
                              goto LABEL_272;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_272:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsExplicitTrack"));
                            v93 = (void *)objc_claimAutoreleasedReturnValue();
                            v94 = v93;
                            if (v93)
                            {
                              v95 = objc_msgSend(v93, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v96 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v96, "setExplicitItem:", v95);

                            }
                            if (!v9)
                              goto LABEL_271;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_271:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsSharable"));
                            v97 = (void *)objc_claimAutoreleasedReturnValue();
                            v98 = v97;
                            if (v97)
                            {
                              v99 = objc_msgSend(v97, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v100 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v100, "setSharable:", v99);

                            }
                            if (!v9)
                              goto LABEL_270;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_270:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsLiked"));
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            v102 = v101;
                            if (v101)
                            {
                              v103 = objc_msgSend(v101, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v104 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v104, "setLiked:", v103);

                            }
                            if (!v9)
                              goto LABEL_269;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_269:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsInWishList"));
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            v106 = v105;
                            if (v105)
                            {
                              v107 = objc_msgSend(v105, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v108 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v108, "setInWishList:", v107);

                            }
                            if (!v9)
                              goto LABEL_268;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_268:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"));
                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                            v110 = v109;
                            if (v109)
                            {
                              v111 = objc_msgSend(v109, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v112 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v112, "setRadioStationIdentifier:", v111);

                            }
                            if (!v9)
                              goto LABEL_267;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_267:
                            v204[0] = v13;
                            v204[1] = 3221225472;
                            v204[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_13;
                            v204[3] = &unk_1E30CC428;
                            v204[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationName"), v204);
                            if (!v9)
                              goto LABEL_266;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_266:
                            v203[0] = v13;
                            v203[1] = 3221225472;
                            v203[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_14;
                            v203[3] = &unk_1E30CC428;
                            v203[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier"), v203);
                            if (!v9)
                              goto LABEL_265;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_265:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"));
                            v113 = (void *)objc_claimAutoreleasedReturnValue();
                            v114 = v113;
                            if (v113)
                            {
                              v115 = objc_msgSend(v113, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v116 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v116, "setITunesStoreIdentifier:", v115);

                            }
                            if (!v9)
                              goto LABEL_264;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_264:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"));
                            v117 = (void *)objc_claimAutoreleasedReturnValue();
                            v118 = v117;
                            if (v117)
                            {
                              v119 = objc_msgSend(v117, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v120 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v120, "setITunesStoreSubscriptionIdentifier:", v119);

                            }
                            if (!v9)
                              goto LABEL_263;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_263:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"));
                            v121 = (void *)objc_claimAutoreleasedReturnValue();
                            v122 = v121;
                            if (v121)
                            {
                              v123 = objc_msgSend(v121, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v124 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v124, "setITunesStoreArtistIdentifier:", v123);

                            }
                            if (!v9)
                              goto LABEL_262;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_262:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"));
                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                            v126 = v125;
                            if (v125)
                            {
                              v127 = objc_msgSend(v125, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v128 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v128, "setITunesStoreAlbumIdentifier:", v127);

                            }
                            if (!v9)
                              goto LABEL_261;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_261:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoPurchaseInfoData"));
                            v129 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v129)
                            {
                              -[MRContentItem metadata](self, "metadata");
                              v130 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v130, "setPurchaseInfoData:", v129);

                            }
                            if (!v9)
                              goto LABEL_260;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_260:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"));
                            v131 = (void *)objc_claimAutoreleasedReturnValue();
                            v132 = v131;
                            if (v131)
                            {
                              objc_msgSend(v131, "floatValue");
                              v134 = v133;
                              -[MRContentItem metadata](self, "metadata");
                              v135 = (void *)objc_claimAutoreleasedReturnValue();
                              LODWORD(v136) = v134;
                              objc_msgSend(v135, "setDefaultPlaybackRate:", v136);

                            }
                            if (!v9)
                              goto LABEL_259;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_259:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDownloadState"));
                            v137 = (void *)objc_claimAutoreleasedReturnValue();
                            v138 = v137;
                            if (v137)
                            {
                              v139 = (int)objc_msgSend(v137, "intValue");
                              -[MRContentItem metadata](self, "metadata");
                              v140 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v140, "setDownloadState:", v139);

                            }
                            if (!v9)
                              goto LABEL_258;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_258:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoDownloadProgress"));
                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                            v142 = v141;
                            if (v141)
                            {
                              objc_msgSend(v141, "floatValue");
                              v144 = v143;
                              -[MRContentItem metadata](self, "metadata");
                              v145 = (void *)objc_claimAutoreleasedReturnValue();
                              LODWORD(v146) = v144;
                              objc_msgSend(v145, "setDownloadProgress:", v146);

                            }
                            if (!v9)
                              goto LABEL_257;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_257:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoAppMetrics"));
                            v147 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v147)
                            {
                              -[MRContentItem metadata](self, "metadata");
                              v148 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v148, "setAppMetrics:", v147);

                            }
                            if (!v9)
                              goto LABEL_256;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_256:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoCollectionInfo"));
                            v149 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v149)
                            {
                              -[MRContentItem metadata](self, "metadata");
                              v150 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v150, "setCollectionInfo:", v149);

                            }
                            if (!v9)
                              goto LABEL_255;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_255:
                            v202[0] = v13;
                            v202[1] = 3221225472;
                            v202[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_15;
                            v202[3] = &unk_1E30CC428;
                            v202[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoArtworkMIMEType"), v202);
                            if (!v9)
                              goto LABEL_254;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_254:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsAdvertisement"));
                            v151 = (void *)objc_claimAutoreleasedReturnValue();
                            v152 = v151;
                            if (v151)
                            {
                              v153 = objc_msgSend(v151, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v154 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v154, "setAdvertisement:", v153);

                            }
                            if (!v9)
                              goto LABEL_253;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_253:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoIsSteerable"));
                            v155 = (void *)objc_claimAutoreleasedReturnValue();
                            v156 = v155;
                            if (v155)
                            {
                              v157 = objc_msgSend(v155, "BOOLValue");
                              -[MRContentItem metadata](self, "metadata");
                              v158 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v158, "setSteerable:", v157);

                            }
                            if (!v9)
                              goto LABEL_252;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_252:
                            v201[0] = v13;
                            v201[1] = 3221225472;
                            v201[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_16;
                            v201[3] = &unk_1E30CC428;
                            v201[4] = self;
                            _MRReadNowPlayingInfoString(v10, (uint64_t)CFSTR("kMRMediaRemoteNowPlayingInfoArtworkIdentifier"), v201);
                            if (!v9)
                              goto LABEL_251;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_251:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkURL"));
                            v159 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v159)
                            {
                              v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v159);
                              -[MRContentItem metadata](self, "metadata");
                              v161 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v161, "setArtworkURL:", v160);

                            }
                            if (!v9)
                              goto LABEL_250;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_250:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoUniqueIdentifier"));
                            v162 = (void *)objc_claimAutoreleasedReturnValue();
                            v163 = v162;
                            if (v162)
                            {
                              v164 = objc_msgSend(v162, "longLongValue");
                              -[MRContentItem metadata](self, "metadata");
                              v165 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v165, "setLegacyUniqueIdentifier:", v164);

                            }
                            if (!v9)
                              goto LABEL_186;
                          }
                          if (objc_msgSend(v9, "includeMetadata"))
                          {
LABEL_186:
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoUserInfo"));
                            v166 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v166)
                            {
                              -[MRContentItem metadata](self, "metadata");
                              v167 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v167, "setUserInfo:", v166);

                            }
                          }
                          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoMediaType"));
                          v200 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v200)
                          {
LABEL_202:
                            objc_msgSend(v10, "objectForKeyedSubscript:");
                            v176 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((!v9 || objc_msgSend(v9, "includeLanguageOptions")) && v176)
                            {
                              v177 = (void *)MRLanguageOptionsCreateFromExternalRepresentation(v176);
                              if (v177)
                              {
                                -[MRContentItem setCurrentLanguageOptions:](self, "setCurrentLanguageOptions:", v177);
                                -[MRContentItem metadata](self, "metadata");
                                v178 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v178, "setLanguageOptionsAvailable:", 1);

                              }
                            }

                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"));
                            v179 = objc_claimAutoreleasedReturnValue();
                            v180 = (void *)v179;
                            if (v9)
                            {
                              if (!objc_msgSend(v9, "includeLanguageOptions") || !v180)
                              {

                                goto LABEL_216;
                              }
                            }
                            else if (!v179)
                            {
                              goto LABEL_217;
                            }
                            v181 = (void *)MRLanguageOptionGroupsCreateFromExternalRepresentation(v180);
                            if (v181)
                            {
                              -[MRContentItem setAvailableLanguageOptions:](self, "setAvailableLanguageOptions:", v181);
                              -[MRContentItem metadata](self, "metadata");
                              v182 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v182, "setLanguageOptionsAvailable:", 1);

                            }
                            if (v9)
                            {
LABEL_216:
                              if (!objc_msgSend(v9, "includeArtwork"))
                                goto LABEL_233;
                            }
LABEL_217:
                            if (v196)
                            {
                              v183 = 0;
                            }
                            else
                            {
                              -[MRContentItem artwork](self, "artwork");
                              v183 = (MRArtwork *)(id)objc_claimAutoreleasedReturnValue();

                            }
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkData"));
                            v184 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v184)
                            {
                              if (!v183)
                                v183 = objc_alloc_init(MRArtwork);
                              -[MRArtwork setImageData:](v183, "setImageData:", v184);
                            }
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataHeight"));
                            v185 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v185)
                            {
                              if (!v183)
                                v183 = objc_alloc_init(MRArtwork);
                              -[MRArtwork setHeight:](v183, "setHeight:", objc_msgSend(v185, "longValue"));
                            }
                            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteNowPlayingInfoArtworkDataWidth"));
                            v186 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v186)
                            {
                              if (!v183)
                                v183 = objc_alloc_init(MRArtwork);
                              -[MRArtwork setWidth:](v183, "setWidth:", objc_msgSend(v186, "longValue"));
                            }
                            -[MRContentItem setArtwork:](self, "setArtwork:", v183);

LABEL_233:
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoContentItemIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoAlbum"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtist"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoAssetURL"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoComposer"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoDiscNumber"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoGenre"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackRate"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsAlwaysLive"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsInTransition"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoDuration"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoStartTime"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoTitle"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoTotalDiscCount"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoTotalTrackCount"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoTrackNumber"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoCollectionIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoServiceIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoBrandIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoPlaybackProgress"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsExplicitTrack"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsSharable"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsLiked"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsInWishList"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationName"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoPurchaseInfoData"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoDownloadState"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoDownloadProgress"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoAppMetrics"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoCollectionInfo"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkMIMEType"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsAdvertisement"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoIsSteerable"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkURL"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoUniqueIdentifier"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoUserInfo"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoCurrentLanguageOptionsData"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"));
                            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoArtworkData"));
                            -[MRContentItem metadata](self, "metadata");
                            v187 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v187, "nowPlayingInfo");
                            v188 = objc_claimAutoreleasedReturnValue();
                            if ((void *)v188 == v10)
                            {

                              v194 = v197;
                              v193 = v198;
                            }
                            else
                            {
                              v189 = (void *)v188;
                              -[MRContentItem metadata](self, "metadata");
                              v190 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v190, "nowPlayingInfo");
                              v191 = (void *)objc_claimAutoreleasedReturnValue();
                              v192 = objc_msgSend(v191, "isEqualToDictionary:", v10);

                              v194 = v197;
                              v193 = v198;
                              if ((v192 & 1) != 0)
                              {
LABEL_238:

                                v8 = v199;
                                goto LABEL_239;
                              }
                              -[MRContentItem metadata](self, "metadata");
                              v187 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v187, "setNowPlayingInfo:", v10);
                            }

                            goto LABEL_238;
                          }
                          if ((objc_msgSend(v200, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoTypeAudio")) & 1) != 0)
                          {
                            v168 = 0;
                          }
                          else
                          {
                            if ((objc_msgSend(v200, "isEqualToString:", CFSTR("kMRMediaRemoteNowPlayingInfoTypeVideo")) & 1) != 0)
                            {
                              v168 = 0;
                              v169 = 2;
LABEL_197:
                              -[MRContentItem metadata](self, "metadata");
                              v170 = (void *)objc_claimAutoreleasedReturnValue();
                              v171 = objc_msgSend(v170, "hasMediaType");

                              if ((v171 & 1) == 0)
                              {
                                -[MRContentItem metadata](self, "metadata");
                                v172 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v172, "setMediaType:", v169);

                              }
                              -[MRContentItem metadata](self, "metadata");
                              v173 = (void *)objc_claimAutoreleasedReturnValue();
                              v174 = objc_msgSend(v173, "hasMediaSubType");

                              if ((v174 & 1) == 0)
                              {
                                -[MRContentItem metadata](self, "metadata");
                                v175 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v175, "setMediaSubType:", v168);

                              }
                              objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteNowPlayingInfoMediaType"));
                              goto LABEL_202;
                            }
                            if ((objc_msgSend(v200, "isEqualToString:", CFSTR("MRMediaRemoteMediaTypeMusic")) & 1) == 0)
                            {
                              if ((objc_msgSend(v200, "isEqualToString:", CFSTR("MRMediaRemoteMediaTypePodcast")) & 1) != 0)
                              {
                                v169 = 1;
                                v168 = 4;
                              }
                              else if ((objc_msgSend(v200, "isEqualToString:", CFSTR("MRMediaRemoteMediaTypeAudioBook")) & 1) != 0)
                              {
                                v169 = 1;
                                v168 = 5;
                              }
                              else
                              {
                                v195 = objc_msgSend(v200, "isEqualToString:", CFSTR("MRMediaRemoteMediaTypeITunesU"));
                                if (v195)
                                  v168 = 6;
                                else
                                  v168 = 0;
                                v169 = v195;
                              }
                              goto LABEL_197;
                            }
                            v168 = 1;
                          }
                          v169 = 1;
                          goto LABEL_197;
                        }
LABEL_39:
                        if (!objc_msgSend(v9, "includeMetadata"))
                          goto LABEL_43;
                        goto LABEL_40;
                      }
LABEL_35:
                      if (!objc_msgSend(v9, "includeMetadata"))
                        goto LABEL_39;
                      goto LABEL_36;
                    }
LABEL_31:
                    if (!objc_msgSend(v9, "includeMetadata"))
                      goto LABEL_35;
                    goto LABEL_32;
                  }
LABEL_27:
                  if (!objc_msgSend(v9, "includeMetadata"))
                    goto LABEL_31;
                  goto LABEL_28;
                }
LABEL_25:
                if (!objc_msgSend(v9, "includeMetadata"))
                  goto LABEL_27;
                goto LABEL_26;
              }
LABEL_21:
              if (!objc_msgSend(v9, "includeMetadata"))
                goto LABEL_25;
              goto LABEL_22;
            }
LABEL_19:
            if (!objc_msgSend(v9, "includeMetadata"))
              goto LABEL_21;
            goto LABEL_20;
          }
LABEL_12:
          if (!objc_msgSend(v9, "includeMetadata"))
            goto LABEL_19;
          goto LABEL_13;
        }
LABEL_10:
        if (!objc_msgSend(v9, "includeMetadata"))
          goto LABEL_12;
        goto LABEL_11;
      }
    }
    else
    {
      -[MRContentItem metadata](self, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nowPlayingInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

      v216[0] = v13;
      v216[1] = 3221225472;
      v216[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke;
      v216[3] = &unk_1E30CA498;
      v217 = v10;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v216);

      if (!v9)
        goto LABEL_9;
    }
    if (!objc_msgSend(v9, "includeMetadata"))
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_239:

}

+ (id)mergeContentItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "mergeFrom:", v10);
        }
        else
        {
          v13 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v10, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEffectivelyEqual:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;

  v4 = a3;
  v5 = _AXSHapticMusicEnabled();
  v6 = (void *)-[MRContentItem copy](self, "copy");
  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasElapsedTime:", 0);

  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasElapsedTimeTimestamp:", 0);

  objc_msgSend(v6, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHasInferredTimestamp:", 0);

  objc_msgSend(v7, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHasElapsedTime:", 0);

  objc_msgSend(v7, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHasElapsedTimeTimestamp:", 0);

  objc_msgSend(v7, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHasInferredTimestamp:", 0);

  v14 = 0;
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    v15 = v5 == 0;
    -[MRContentItem metadata](self, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "calculatedPlaybackPosition");
    v18 = v17;
    objc_msgSend(v4, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "calculatedPlaybackPosition");
    v14 = vabdd_f64(v18, v20) < dbl_193ADA050[v15];

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  MRContentItem *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  id v84;
  id v85;
  void *v86;
  char v87;
  void *v89;
  void *v90;

  v4 = (MRContentItem *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_58:
      v11 = 0;
      goto LABEL_59;
    }
    -[MRContentItem identifier](v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem identifier](self, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {

    }
    else
    {
      v7 = (void *)v6;
      -[MRContentItem identifier](v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v10)
        goto LABEL_58;
    }
    -[MRContentItem metadata](v4, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem metadata](self, "metadata");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

    }
    else
    {
      v14 = (void *)v13;
      -[MRContentItem metadata](v4, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem metadata](self, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_58;
    }
    -[MRContentItem info](v4, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem info](self, "info");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v18 == (void *)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      -[MRContentItem info](v4, "info");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem info](self, "info");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (!v23)
        goto LABEL_58;
    }
    -[MRContentItem transcriptAlignments](v4, "transcriptAlignments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem transcriptAlignments](self, "transcriptAlignments");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v24 == (void *)v25)
    {

    }
    else
    {
      v26 = (void *)v25;
      -[MRContentItem transcriptAlignments](v4, "transcriptAlignments");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem transcriptAlignments](self, "transcriptAlignments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToArray:", v28);

      if (!v29)
        goto LABEL_58;
    }
    -[MRContentItem availableLanguageOptions](v4, "availableLanguageOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v30 == (void *)v31)
    {

    }
    else
    {
      v32 = (void *)v31;
      -[MRContentItem availableLanguageOptions](v4, "availableLanguageOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem availableLanguageOptions](self, "availableLanguageOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToArray:", v34);

      if (!v35)
        goto LABEL_58;
    }
    -[MRContentItem currentLanguageOptions](v4, "currentLanguageOptions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v36 == (void *)v37)
    {

    }
    else
    {
      v38 = (void *)v37;
      -[MRContentItem currentLanguageOptions](v4, "currentLanguageOptions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem currentLanguageOptions](self, "currentLanguageOptions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqualToArray:", v40);

      if (!v41)
        goto LABEL_58;
    }
    -[MRContentItem sections](v4, "sections");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem sections](self, "sections");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 == (void *)v43)
    {

    }
    else
    {
      v44 = (void *)v43;
      -[MRContentItem sections](v4, "sections");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem sections](self, "sections");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqualToArray:", v46);

      if (!v47)
        goto LABEL_58;
    }
    -[MRContentItem parentIdentifier](v4, "parentIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem parentIdentifier](self, "parentIdentifier");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[MRContentItem parentIdentifier](v4, "parentIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem parentIdentifier](self, "parentIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if (!v53)
        goto LABEL_58;
    }
    -[MRContentItem ancestorIdentifier](v4, "ancestorIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
    v55 = objc_claimAutoreleasedReturnValue();
    if (v54 == (void *)v55)
    {

    }
    else
    {
      v56 = (void *)v55;
      -[MRContentItem ancestorIdentifier](v4, "ancestorIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem ancestorIdentifier](self, "ancestorIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "isEqualToString:", v58);

      if (!v59)
        goto LABEL_58;
    }
    -[MRContentItem associatedParticipantIdentifier](v4, "associatedParticipantIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v60 == (void *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      -[MRContentItem associatedParticipantIdentifier](v4, "associatedParticipantIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v63, "isEqualToString:", v64);

      if (!v65)
        goto LABEL_58;
    }
    -[MRContentItem queueIdentifier](v4, "queueIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem queueIdentifier](self, "queueIdentifier");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v66 == (void *)v67)
    {

    }
    else
    {
      v68 = (void *)v67;
      -[MRContentItem queueIdentifier](v4, "queueIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem queueIdentifier](self, "queueIdentifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "isEqualToString:", v70);

      if (!v71)
        goto LABEL_58;
    }
    -[MRContentItem requestIdentifier](v4, "requestIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem requestIdentifier](self, "requestIdentifier");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v72 == (void *)v73)
    {

    }
    else
    {
      v74 = (void *)v73;
      -[MRContentItem requestIdentifier](v4, "requestIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem requestIdentifier](self, "requestIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "isEqualToString:", v76);

      if (!v77)
        goto LABEL_58;
    }
    -[MRContentItem artwork](v4, "artwork");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem artwork](self, "artwork");
    v79 = objc_claimAutoreleasedReturnValue();
    if (v78 == (void *)v79)
    {

    }
    else
    {
      v80 = (void *)v79;
      -[MRContentItem artwork](v4, "artwork");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItem artwork](self, "artwork");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "isEqual:", v82);

      if (!v83)
        goto LABEL_58;
    }
    -[MRContentItem artworks](v4, "artworks");
    v84 = (id)objc_claimAutoreleasedReturnValue();
    -[MRContentItem artworks](self, "artworks");
    v85 = (id)objc_claimAutoreleasedReturnValue();
    if (v84 == v85)
    {

    }
    else
    {
      v86 = v85;
      v87 = objc_msgSend(v84, "isEqual:", v85);

      if ((v87 & 1) == 0)
        goto LABEL_58;
    }
    -[MRContentItem remoteArtworks](v4, "remoteArtworks");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItem remoteArtworks](self, "remoteArtworks");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89 == v90)
      v11 = 1;
    else
      v11 = objc_msgSend(v89, "isEqual:", v90);

  }
LABEL_59:

  return v11;
}

- (MRContentItem)initWithNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MRContentItem *v7;
  MRContentItem *v8;
  MRContentItem *v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "extractedIdentifierFromNowPlayingInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = -[MRContentItem initWithIdentifier:](self, "initWithIdentifier:", v5);
    v8 = v7;
    if (v7)
      -[MRContentItem setNowPlayingInfo:policy:request:](v7, "setNowPlayingInfo:policy:request:", v4, 1, 0);
    self = v8;

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

MRTranscriptAlignment *__34__MRContentItem_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRTranscriptAlignment *v3;

  v2 = a2;
  v3 = -[MRTranscriptAlignment initWithProtobuf:]([MRTranscriptAlignment alloc], "initWithProtobuf:", v2);

  return v3;
}

MRLanguageOptionGroup *__34__MRContentItem_initWithProtobuf___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRLanguageOptionGroup *v3;

  v2 = a2;
  v3 = -[MRLanguageOptionGroup initWithProtobuf:]([MRLanguageOptionGroup alloc], "initWithProtobuf:", v2);

  return v3;
}

MRLanguageOption *__34__MRContentItem_initWithProtobuf___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  MRLanguageOption *v3;

  v2 = a2;
  v3 = -[MRLanguageOption initWithProtobuf:]([MRLanguageOption alloc], "initWithProtobuf:", v2);

  return v3;
}

MRContentItem *__34__MRContentItem_initWithProtobuf___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  MRContentItem *v3;

  v2 = a2;
  v3 = -[MRContentItem initWithProtobuf:]([MRContentItem alloc], "initWithProtobuf:", v2);

  return v3;
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobufWithEncoding:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlbumName:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrackArtistName:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComposer:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenre:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionIdentifier:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentIdentifier:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternationalStandardRecordingCode:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProfileIdentifier:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceIdentifier:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBrandIdentifier:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRadioStationName:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRadioStationString:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkMIMEType:", v3);

}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkIdentifier:", v3);

}

+ (id)extractedIdentifierFromNowPlayingInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoContentItemIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoUniqueIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v8 = v4;
LABEL_10:
      v9 = v8;
LABEL_11:

      return v9;
    }
    if (v5)
    {
      v10 = v5;
LABEL_7:
      objc_msgSend(v10, "stringValue");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v6)
    {
      v8 = v6;
      goto LABEL_10;
    }
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = v7;
        goto LABEL_7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        goto LABEL_10;
      }
    }
    v9 = 0;
    goto LABEL_11;
  }
  v9 = 0;
  return v9;
}

id __30__MRContentItem_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

id __30__MRContentItem_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

id __30__MRContentItem_copyWithZone___block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

id __30__MRContentItem_copyWithZone___block_invoke_4(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (NSArray)transcriptAlignments
{
  return self->_transcriptAlignments;
}

- (void)setTranscriptAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
