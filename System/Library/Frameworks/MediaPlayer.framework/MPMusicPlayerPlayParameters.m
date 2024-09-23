@implementation MPMusicPlayerPlayParameters

- (MPMusicPlayerPlayParameters)initWithDictionary:(NSDictionary *)dictionary
{
  NSDictionary *v4;
  MPMusicPlayerPlayParameters *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *itemID;
  MPIdentifierSet *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __objc2_class *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  MPIdentifierSet *v31;
  uint64_t v32;
  MPIdentifierSet *identifiers;
  uint64_t v34;
  NSString *libraryID;
  uint64_t v36;
  NSString *catalogID;
  uint64_t v38;
  NSString *persistentID;
  uint64_t v40;
  NSDictionary *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  uint8_t buf[16];
  _QWORD v55[4];
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  objc_super v61;

  v4 = dictionary;
  v61.receiver = self;
  v61.super_class = (Class)MPMusicPlayerPlayParameters;
  v5 = -[MPMusicPlayerPlayParameters init](&v61, sel_init);
  if (v5)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("id"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v6 = v52;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v7 = 0;
LABEL_8:
        if (!objc_msgSend(v7, "length"))
        {

          v7 = 0;
        }
        v8 = objc_msgSend(v7, "copy");
        itemID = v5->_itemID;
        v5->_itemID = (NSString *)v8;

        -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("kind"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
          obj = v50;
        else
          obj = 0;
        -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("isLibrary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          LODWORD(v10) = objc_msgSend(v49, "BOOLValue");
        else
          LODWORD(v10) = 0;
        -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("catalogId"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v11 = v51;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v12 = 0;
LABEL_22:
            if (!objc_msgSend(v12, "length"))
            {

              v12 = 0;
            }
            -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("musicKit_libraryID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
            {
              v14 = v13;
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) == 0)
              {
                v15 = 0;
LABEL_30:
                if (!objc_msgSend(v15, "length"))
                {

                  v15 = 0;
                }
                -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("musicKit_persistentID"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v16;
                if (_NSIsNSString())
                  v17 = v16;
                else
                  v17 = 0;
                if (!objc_msgSend(v17, "length"))
                {

                  v17 = 0;
                }
                v46 = v13;
                if (!v7 || !obj)
                {
                  v18 = v15;
                  v19 = v12;
                  v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
                  v48 = v20;
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "-[MPMusicPlayerPlayParameters initWithDictionary:] id or kind missing from playParams dictionary. Returning nil.", buf, 2u);
                  }
                  v21 = v5;
                  v5 = 0;
                  goto LABEL_59;
                }
                if ((objc_msgSend(v7, "isEqual:", v17) & 1) != 0)
                {
                  v48 = 0;
                }
                else
                {
                  if ((_DWORD)v10)
                    v22 = v7;
                  else
                    v22 = v15;
                  v48 = v22;
                }
                v44 = v15;
                v45 = v12;
                if ((objc_msgSend(obj, "isEqualToString:", CFSTR("song")) & 1) != 0
                  || (objc_msgSend(obj, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0
                  || (objc_msgSend(obj, "isEqualToString:", CFSTR("uploadedAudio")) & 1) != 0
                  || objc_msgSend(obj, "isEqualToString:", CFSTR("uploadedVideo")))
                {
                  v23 = MPModelSongKind;
                }
                else if (objc_msgSend(obj, "isEqualToString:", CFSTR("tvEpisode")))
                {
                  v23 = MPModelTVEpisodeKind;
                }
                else if (objc_msgSend(obj, "isEqualToString:", CFSTR("movie")))
                {
                  v23 = MPModelMovieKind;
                }
                else if (objc_msgSend(obj, "isEqualToString:", CFSTR("album")))
                {
                  v23 = MPModelAlbumKind;
                }
                else
                {
                  if (objc_msgSend(obj, "isEqualToString:", CFSTR("playlist")))
                  {
                    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
                    v43 = objc_claimAutoreleasedReturnValue();
                    v25 = v12;
                    v21 = (void *)v43;
                    v28 = 0;
                    v27 = 0;
                    if (!(_DWORD)v10)
                      v25 = v7;
                    v26 = v25;
                    goto LABEL_56;
                  }
                  if (!objc_msgSend(obj, "isEqualToString:", CFSTR("_playlistEntry")))
                  {
                    if (!objc_msgSend(obj, "isEqualToString:", CFSTR("radioStation")))
                    {
                      v27 = 0;
                      v26 = 0;
                      v28 = 0;
                      v21 = 0;
LABEL_58:
                      objc_storeStrong((id *)&v5->_itemKind, obj);
                      v5->_libraryContent = (char)v10;
                      v18 = v44;
                      v34 = objc_msgSend(v44, "copy");
                      libraryID = v5->_libraryID;
                      v5->_libraryID = (NSString *)v34;

                      v19 = v45;
                      v36 = objc_msgSend(v45, "copy");
                      catalogID = v5->_catalogID;
                      v5->_catalogID = (NSString *)v36;

                      v38 = objc_msgSend(v17, "copy");
                      persistentID = v5->_persistentID;
                      v5->_persistentID = (NSString *)v38;

                      v40 = -[NSDictionary copy](v4, "copy");
                      v41 = v5->_dictionary;
                      v5->_dictionary = (NSDictionary *)v40;

LABEL_59:
                      goto LABEL_60;
                    }
                    +[MPModelRadioStationKind identityKind](MPModelRadioStationKind, "identityKind");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = 0;
                    v26 = 0;
                    v25 = v45;
                    if (!(_DWORD)v10)
                      v25 = v7;
                    v27 = v25;
LABEL_56:
                    v29 = v25;
                    if (v21)
                    {
                      v30 = (char)v10;
                      v10 = [MPIdentifierSet alloc];
                      v55[0] = MEMORY[0x1E0C809B0];
                      v55[1] = 3221225472;
                      v55[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke;
                      v55[3] = &unk_1E31574F8;
                      v28 = v28;
                      v56 = v28;
                      v26 = v26;
                      v57 = v26;
                      v58 = v48;
                      v59 = v17;
                      v27 = v27;
                      v60 = v27;
                      v31 = v10;
                      LOBYTE(v10) = v30;
                      v32 = -[MPIdentifierSet initWithSource:modelKind:block:](v31, "initWithSource:modelKind:block:", CFSTR("MusicPlayerPlayParams"), v21, v55);
                      identifiers = v5->_identifiers;
                      v5->_identifiers = (MPIdentifierSet *)v32;

                    }
                    goto LABEL_58;
                  }
                  v23 = MPModelPlaylistEntryKind;
                }
                -[__objc2_class identityKind](v23, "identityKind");
                v24 = objc_claimAutoreleasedReturnValue();
                v25 = v12;
                v21 = (void *)v24;
                v26 = 0;
                v27 = 0;
                if (!(_DWORD)v10)
                  v25 = v7;
                v28 = v25;
                goto LABEL_56;
              }
              objc_msgSend(v13, "stringValue");
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            v15 = v14;
            goto LABEL_30;
          }
          objc_msgSend(v51, "stringValue");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;
        goto LABEL_22;
      }
      objc_msgSend(v52, "stringValue");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    goto LABEL_8;
  }
LABEL_60:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MPIdentifierSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t data;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = -[NSDictionary hash](self->_dictionary, "hash");
  v10 = v5 ^ 0x7465646279746573 ^ v9;
  v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  v12 = v8 + v10;
  v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  v14 = v13 + __ROR8__(v6 + v7, 32);
  v66 = __ROR8__(v12 + v11, 32);
  v69 = v14 ^ __ROR8__(v13, 43);
  v15 = v14 ^ v9;
  v63 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_identifiers;
  v17 = -[MPIdentifierSet hash](v16, "hash");
  v18 = (v15 + v63) ^ __ROR8__(v63, 51);
  v19 = v66 + (v69 ^ v17);
  v20 = __ROR8__(v69 ^ v17, 48);
  v21 = (v19 ^ v20) + __ROR8__(v15 + v63, 32);
  v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  v23 = v19 + v18;
  v67 = __ROR8__(v23, 32);
  v70 = v22;
  v61 = v21 ^ v17;
  v64 = v23 ^ __ROR8__(v18, 47);

  v24 = self->_itemKind;
  data = -[NSString hash](v24, "hash");
  v25 = (v61 + v64) ^ __ROR8__(v64, 51);
  v26 = v67 + (v70 ^ data);
  v27 = __ROR8__(v70 ^ data, 48);
  v28 = (v26 ^ v27) + __ROR8__(v61 + v64, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v68 = __ROR8__(v30, 32);
  v71 = v29;
  v62 = v28 ^ data;
  v65 = v30 ^ __ROR8__(v25, 47);

  v31 = self->_libraryContent | 0x1800000000000000;
  v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  v33 = v68 + (v71 ^ (v31 + 0x400000000000000));
  v34 = __ROR8__(v71 ^ (v31 + 0x400000000000000), 48);
  v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  v37 = v33 + v32;
  v38 = v37 ^ __ROR8__(v32, 47);
  v39 = (v35 ^ (v31 + 0x400000000000000)) + v38;
  v40 = v39 ^ __ROR8__(v38, 51);
  v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  v42 = __ROR8__(v36, 48);
  v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  v45 = v40 + v41;
  v46 = v45 ^ __ROR8__(v40, 47);
  v47 = v46 + v43;
  v48 = v47 ^ __ROR8__(v46, 51);
  v49 = __ROR8__(v45, 32) + v44;
  v50 = __ROR8__(v44, 48);
  v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  v53 = v48 + v49;
  v54 = v53 ^ __ROR8__(v48, 47);
  v55 = v54 + v51;
  v56 = v55 ^ __ROR8__(v54, 51);
  v57 = __ROR8__(v53, 32) + v52;
  v58 = __ROR8__(v52, 48);
  v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  int v9;
  BOOL v10;
  MPIdentifierSet *v11;
  MPIdentifierSet *v12;
  MPIdentifierSet *v13;
  int v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (NSDictionary *)v5[2];
    v7 = self->_dictionary;
    v8 = v7;
    if (v7 == v6)
      LOBYTE(v9) = 0;
    else
      v9 = -[NSDictionary isEqual:](v7, "isEqual:", v6) ^ 1;

    v11 = (MPIdentifierSet *)v5[3];
    v12 = self->_identifiers;
    v13 = v12;
    if (v12 == v11)
      LOBYTE(v14) = 0;
    else
      v14 = !-[MPIdentifierSet isEqual:](v12, "isEqual:", v11);

    v15 = (NSString *)v5[4];
    v16 = self->_itemKind;
    v17 = v16;
    if (v16 == v15)
      v18 = 1;
    else
      v18 = -[NSString isEqual:](v16, "isEqual:", v15);

    v10 = v18 & (!self->_libraryContent ^ (*((_BYTE *)v5 + 8) != 0)) & ~(v9 | v14);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerPlayParameters)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerPlayParameters *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSString *itemID;
  uint64_t v11;
  MPIdentifierSet *identifiers;
  uint64_t v13;
  NSString *itemKind;
  uint64_t v15;
  NSString *catalogID;
  uint64_t v17;
  NSString *libraryID;
  uint64_t v19;
  NSString *persistentID;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPMusicPlayerPlayParameters;
  v5 = -[MPMusicPlayerPlayParameters init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("MPMusicPlayerPlayParametersDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      v7 = v6;
    else
      v7 = 0;
    if (v7)
      v8 = v7;
    else
      v8 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v5->_dictionary, v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersItemID"));
    v9 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (MPIdentifierSet *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersItemKind"));
    v13 = objc_claimAutoreleasedReturnValue();
    itemKind = v5->_itemKind;
    v5->_itemKind = (NSString *)v13;

    v5->_libraryContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPMusicPlayerPlayParametersIsLibraryContent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersCatalogID"));
    v15 = objc_claimAutoreleasedReturnValue();
    catalogID = v5->_catalogID;
    v5->_catalogID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersLibraryID"));
    v17 = objc_claimAutoreleasedReturnValue();
    libraryID = v5->_libraryID;
    v5->_libraryID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerPlayParametersMusicKitPersistentID"));
    v19 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *dictionary;
  id v5;

  dictionary = self->_dictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dictionary, CFSTR("MPMusicPlayerPlayParametersDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("MPMusicPlayerPlayParametersItemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiers, CFSTR("MPMusicPlayerPlayParametersIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemKind, CFSTR("MPMusicPlayerPlayParametersItemKind"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_libraryContent, CFSTR("MPMusicPlayerPlayParametersIsLibraryContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_catalogID, CFSTR("MPMusicPlayerPlayParametersCatalogID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryID, CFSTR("MPMusicPlayerPlayParametersLibraryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentID, CFSTR("MPMusicPlayerPlayParametersMusicKitPersistentID"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_dictionary);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (NSString)itemKind
{
  return self->_itemKind;
}

- (BOOL)isLibraryContent
{
  return self->_libraryContent;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSString)catalogID
{
  return self->_catalogID;
}

- (NSString)libraryID
{
  return self->_libraryID;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_catalogID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  if (v3 || *(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_2;
    v14[3] = &unk_1E31574D0;
    v15 = v3;
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v14);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_3;
    v12[3] = &unk_1E3162B80;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v9, "setLibraryIdentifiersWithDatabaseID:block:", v6, v12);

  }
  v7 = *(void **)(a1 + 64);
  v8 = v9;
  if (v7)
  {
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_4;
    v10[3] = &unk_1E3162BD0;
    v11 = v7;
    objc_msgSend(v9, "setRadioIdentifiersWithBlock:", v10);

    v8 = v9;
  }

}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)a1[4];
  if (v3)
    objc_msgSend(v5, "setSubscriptionAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v3));
  if (a1[5])
    objc_msgSend(v5, "setGlobalPlaylistID:");
  v4 = v5;
  if (a1[6])
  {
    objc_msgSend(v5, "setUniversalCloudLibraryID:");
    v4 = v5;
  }

}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v2));

}

uint64_t __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStationStringID:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
