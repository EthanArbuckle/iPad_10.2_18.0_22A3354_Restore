@implementation MPModelLibraryRequest

- (BOOL)disableImplicitSectioning
{
  return self->_disableImplicitSectioning;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void)setFilteringOptions:(unint64_t)a3
{
  self->_filteringOptions = a3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MPModelLibraryRequest;
  -[MPModelRequest description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if (self->_legacyMediaQuery)
    objc_msgSend(v4, "appendFormat:", CFSTR(" legacyMediaQuery=%@"), self->_legacyMediaQuery);
  if (-[NSArray count](self->_allowedItemIdentifiers, "count"))
  {
    -[NSArray valueForKeyPath:](self->_allowedItemIdentifiers, "valueForKeyPath:", CFSTR("humanDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" allowedItemIdentifiers=[%@]"), v6);

  }
  if (-[NSArray count](self->_allowedSectionIdentifiers, "count"))
  {
    -[NSArray valueForKeyPath:](self->_allowedSectionIdentifiers, "valueForKeyPath:", CFSTR("humanDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" allowedSectionIdentifiers=[%@]"), v8);

  }
  if (-[NSArray count](self->_scopedContainers, "count"))
  {
    -[NSArray valueForKeyPath:](self->_scopedContainers, "valueForKeyPath:", CFSTR("humanDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" scopedContainers=[%@]"), v10);

  }
  if (-[NSString length](self->_filterText, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" filterText=\"%@\"), self->_filterText);
  if (self->_sortUsingAllowedItemIdentifiers)
    objc_msgSend(v4, "appendString:", CFSTR(" sortUsingAllowedItemIdentifiers=YES"));
  if (-[NSArray count](self->_itemPropertyFilters, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" itemPropertyFilters=%@"), self->_itemPropertyFilters);
  if (-[NSArray count](self->_sectionPropertyFilters, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" sectionPropertyFilters=%@"), self->_sectionPropertyFilters);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v11;
}

- (MPMediaQuery)legacyMediaQuery
{
  return self->_legacyMediaQuery;
}

- (_NSRange)contentRange
{
  _NSRange *p_contentRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_contentRange = &self->_contentRange;
  location = self->_contentRange.location;
  length = p_contentRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMediaQuery, 0);
  objc_storeStrong((id *)&self->_sectionPropertyFilters, 0);
  objc_storeStrong((id *)&self->_itemPropertyFilters, 0);
  objc_storeStrong((id *)&self->_sectionFilterText, 0);
  objc_storeStrong((id *)&self->_filterText, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performWithResponseHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPModelLibraryRequest;
  -[MPModelRequest performWithResponseHandler:](&v3, sel_performWithResponseHandler_, a3);
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryRequestOperation);
  -[MPModelLibraryRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);
  -[MPModelLibraryRequestOperation setRequest:](v5, "setRequest:", self);

  return v5;
}

- (void)setFilterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setAllowedItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPModelLibraryRequest;
  v4 = -[MPModelRequest copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 10, self->_allowedItemIdentifiers);
    objc_storeStrong(v5 + 11, self->_allowedSectionIdentifiers);
    objc_storeStrong(v5 + 12, self->_scopedContainers);
    *(_NSRange *)(v5 + 19) = self->_contentRange;
    v5[13] = (id)self->_filteringOptions;
    objc_storeStrong(v5 + 14, self->_filterText);
    objc_storeStrong(v5 + 15, self->_sectionFilterText);
    *((_BYTE *)v5 + 64) = self->_wantsDetailedKeepLocalRequestableResponse;
    *((_BYTE *)v5 + 65) = self->_sortUsingAllowedItemIdentifiers;
    *((_BYTE *)v5 + 67) = self->_disableImplicitSectioning;
    objc_storeStrong(v5 + 9, self->_mediaLibrary);
    v6 = -[MPMediaQuery copy](self->_legacyMediaQuery, "copy");
    v7 = v5[18];
    v5[18] = (id)v6;

    objc_storeStrong(v5 + 16, self->_itemPropertyFilters);
    objc_storeStrong(v5 + 17, self->_sectionPropertyFilters);
    *((_BYTE *)v5 + 66) = self->_isUpgradedSmartPlaylistLegacyMediaQuery;
  }
  return v5;
}

- (id)itemTranslationContext
{
  MPMediaLibraryEntityTranslationContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v3 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPModelLibraryRequest allowedItemIdentifiers](self, "allowedItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v3, "setAllowedEntityIdentifiers:", v4);

  -[MPModelLibraryRequest filterText](self, "filterText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setFilterText:](v3, "setFilterText:", v5);

  -[MPMediaLibraryEntityTranslationContext setFilteringOptions:](v3, "setFilteringOptions:", -[MPModelLibraryRequest filteringOptions](self, "filteringOptions"));
  -[MPModelLibraryRequest mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v3, "setMediaLibrary:", v6);

  -[MPModelRequest itemKind](self, "itemKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v3, "setModelKind:", v7);

  -[MPModelRequest itemKind](self, "itemKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v3, "setMultiQuery:", objc_msgSend(v8, "modelClass") == objc_opt_class());

  if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
  {
    -[MPModelLibraryRequest mediaLibrary](self, "mediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v3, "setPersonID:", v11);

  }
  -[MPModelLibraryRequest itemPropertyFilters](self, "itemPropertyFilters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setPropertyFilters:](v3, "setPropertyFilters:", v12);

  -[MPModelLibraryRequest scopedContainers](self, "scopedContainers");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = MEMORY[0x1E0C9AA60];
  -[MPMediaLibraryEntityTranslationContext setScopedContainers:](v3, "setScopedContainers:", v15);

  return v3;
}

- (MPMediaLibrary)mediaLibrary
{
  MPMediaLibrary *mediaLibrary;
  MPMediaLibrary *v3;
  void *v4;

  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
  {
    v3 = mediaLibrary;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v4);
    v3 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (NSArray)allowedItemIdentifiers
{
  return self->_allowedItemIdentifiers;
}

- (NSArray)itemPropertyFilters
{
  return self->_itemPropertyFilters;
}

- (NSString)filterText
{
  return self->_filterText;
}

- (void)setItemPropertyFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setContentRange:(_NSRange)a3
{
  self->_contentRange = a3;
}

- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3
{
  self->_wantsDetailedKeepLocalRequestableResponse = a3;
}

- (void)setScopedContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setAllowedSectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (MPModelLibraryRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelLibraryRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *scopedContainers;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *allowedItemIdentifiers;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *allowedSectionIdentifiers;
  uint64_t v23;
  NSString *filterText;
  uint64_t v25;
  NSString *sectionFilterText;
  uint64_t v27;
  MPMediaLibrary *mediaLibrary;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *itemPropertyFilters;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *sectionPropertyFilters;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MPModelLibraryRequest;
  v5 = -[MPModelRequest initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_wantsDetailedKeepLocalRequestableResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPModelLibraryRequestWantsDetailedKeepLocalRequestableResponse"));
    v5->_sortUsingAllowedItemIdentifiers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_MPModelLibraryRequestCodingKeySortUsingAllowedItemIdentifiers"));
    v5->_disableImplicitSectioning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPModelLibraryRequestDisableImplicitSectioning"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, &stru_1E3163D10);
    v9 = objc_claimAutoreleasedReturnValue();
    scopedContainers = v5->_scopedContainers;
    v5->_scopedContainers = (NSArray *)v9;

    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelLibraryRequestContentRangeLocation"));
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelLibraryRequestContentRangeLength"));
    v5->_contentRange.location = v11;
    v5->_contentRange.length = v12;
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("MPModelLibraryRequestAllowedItemIdentifiers"));
    v16 = objc_claimAutoreleasedReturnValue();
    allowedItemIdentifiers = v5->_allowedItemIdentifiers;
    v5->_allowedItemIdentifiers = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("MPModelLibraryRequestAllowedSectionIdentifiers"));
    v21 = objc_claimAutoreleasedReturnValue();
    allowedSectionIdentifiers = v5->_allowedSectionIdentifiers;
    v5->_allowedSectionIdentifiers = (NSArray *)v21;

    v5->_filteringOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelLibraryRequestFilteringOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibraryRequestFilterText"));
    v23 = objc_claimAutoreleasedReturnValue();
    filterText = v5->_filterText;
    v5->_filterText = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibraryRequestSectionFilterText"));
    v25 = objc_claimAutoreleasedReturnValue();
    sectionFilterText = v5->_sectionFilterText;
    v5->_sectionFilterText = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibraryRequestMediaLibrary"));
    v27 = objc_claimAutoreleasedReturnValue();
    mediaLibrary = v5->_mediaLibrary;
    v5->_mediaLibrary = (MPMediaLibrary *)v27;

    v5->_isUpgradedSmartPlaylistLegacyMediaQuery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPModelLibraryRequestCodingKeyIsUpgradedSmartPlaylistLegacyMediaQuery"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelLibraryRequestLegacyMediaQuery"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      -[MPModelLibraryRequest setLegacyMediaQuery:](v5, "setLegacyMediaQuery:", v29);
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("_MPModelLibraryRequestPropertyFilter"));
    v33 = objc_claimAutoreleasedReturnValue();
    itemPropertyFilters = v5->_itemPropertyFilters;
    v5->_itemPropertyFilters = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("MPModelLibraryRequestSectionPropertyFilters"));
    v38 = objc_claimAutoreleasedReturnValue();
    sectionPropertyFilters = v5->_sectionPropertyFilters;
    v5->_sectionPropertyFilters = (NSArray *)v38;

  }
  return v5;
}

- (void)setLegacyMediaQuery:(id)a3 forTransport:(BOOL)a4
{
  MPMediaQuery *v6;
  MPMediaQuery *v7;
  MPMediaQuery *v8;
  MPMediaQuery *legacyMediaQuery;
  MPMediaQuery *v10;
  MPMediaLibrary *v11;
  MPMediaLibrary *mediaLibrary;
  void *v13;
  MPMediaQuery *v14;
  MPModelPlaylist *v15;
  MPIdentifierSet *v16;
  void *v17;
  MPIdentifierSet *v18;
  MPModelPlaylist *v19;
  NSArray *v20;
  NSArray *scopedContainers;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  MPModelLibraryRequest *v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = (MPMediaQuery *)a3;
  v7 = v6;
  if (self->_legacyMediaQuery != v6)
  {
    v8 = (MPMediaQuery *)-[MPMediaQuery copy](v6, "copy");
    legacyMediaQuery = self->_legacyMediaQuery;
    self->_legacyMediaQuery = v8;

    v10 = self->_legacyMediaQuery;
    if (v10)
    {
      if (!a4)
      {
        -[MPMediaQuery mediaLibrary](v10, "mediaLibrary");
        v11 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();
        mediaLibrary = self->_mediaLibrary;
        self->_mediaLibrary = v11;

        -[MPMediaQuery _representativeCollection](self->_legacyMediaQuery, "_representativeCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v13, "playlistAttributes") & 2) != 0)
          {
            self->_isUpgradedSmartPlaylistLegacyMediaQuery = 1;
            v14 = self->_legacyMediaQuery;
            self->_legacyMediaQuery = 0;

            v15 = [MPModelPlaylist alloc];
            v16 = [MPIdentifierSet alloc];
            +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = MEMORY[0x1E0C809B0];
            v28 = 3221225472;
            v29 = __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke;
            v30 = &unk_1E3162A70;
            v31 = self;
            v32 = v13;
            v18 = -[MPIdentifierSet initWithSource:modelKind:block:](v16, "initWithSource:modelKind:block:", CFSTR("LibraryRequest"), v17, &v27);
            v19 = -[MPModelObject initWithIdentifiers:](v15, "initWithIdentifiers:", v18, v27, v28, v29, v30, v31);
            v33[0] = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
            v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
            scopedContainers = self->_scopedContainers;
            self->_scopedContainers = v20;

          }
          +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelRequest setSectionKind:](self, "setSectionKind:", v22);

          +[MPModelPlaylistEntryKind identityKind](MPModelPlaylistEntryKind, "identityKind");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelRequest setItemKind:](self, "setItemKind:", v23);

        }
        else
        {
          v24 = objc_msgSend(v13, "groupingType") - 1;
          if (v24 >= 5)
          {
            v25 = 0;
          }
          else
          {
            -[__objc2_class identityKind](*off_1E3154568[v24], "identityKind");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[MPModelRequest setSectionKind:](self, "setSectionKind:", v25);
          +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPModelRequest setItemKind:](self, "setItemKind:", v26);

        }
      }
    }
  }

}

- (void)setLegacyMediaQuery:(id)a3
{
  -[MPModelLibraryRequest setLegacyMediaQuery:forTransport:](self, "setLegacyMediaQuery:forTransport:", a3, 0);
}

- (void)setDisableImplicitSectioning:(BOOL)a3
{
  self->_disableImplicitSectioning = a3;
}

- (MPMediaLibrary)_mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelLibraryRequest;
  -[MPModelRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_wantsDetailedKeepLocalRequestableResponse, CFSTR("MPModelLibraryRequestWantsDetailedKeepLocalRequestableResponse"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sortUsingAllowedItemIdentifiers, CFSTR("_MPModelLibraryRequestCodingKeySortUsingAllowedItemIdentifiers"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableImplicitSectioning, CFSTR("MPModelLibraryRequestDisableImplicitSectioning"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allowedItemIdentifiers, CFSTR("MPModelLibraryRequestAllowedItemIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allowedSectionIdentifiers, CFSTR("MPModelLibraryRequestAllowedSectionIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scopedContainers, &stru_1E3163D10);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentRange.location, CFSTR("MPModelLibraryRequestContentRangeLocation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentRange.length, CFSTR("MPModelLibraryRequestContentRangeLength"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_filteringOptions, CFSTR("MPModelLibraryRequestFilteringOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterText, CFSTR("MPModelLibraryRequestFilterText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionFilterText, CFSTR("MPModelLibraryRequestSectionFilterText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mediaLibrary, CFSTR("MPModelLibraryRequestMediaLibrary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_legacyMediaQuery, CFSTR("MPModelLibraryRequestLegacyMediaQuery"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isUpgradedSmartPlaylistLegacyMediaQuery, CFSTR("MPModelLibraryRequestCodingKeyIsUpgradedSmartPlaylistLegacyMediaQuery"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemPropertyFilters, CFSTR("_MPModelLibraryRequestPropertyFilter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionPropertyFilters, CFSTR("MPModelLibraryRequestSectionPropertyFilters"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  char v62;
  int v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  unint64_t v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  char v82;
  char v83;
  void *v85;
  void *v86;
  id v87;
  id v88;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    goto LABEL_52;
  -[MPModelRequest itemKind](self, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelRequest sectionKind](self, "sectionKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  if (v13 == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelRequest itemSortDescriptors](self, "itemSortDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSortDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = v18;
  if (v19 == v20)
  {

  }
  else
  {
    v21 = v20;
    v22 = objc_msgSend(v19, "isEqual:", v20);

    if ((v22 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelRequest sectionSortDescriptors](self, "sectionSortDescriptors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionSortDescriptors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23;
  v26 = v24;
  if (v25 == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = objc_msgSend(v25, "isEqual:", v26);

    if ((v28 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest allowedItemIdentifiers](self, "allowedItemIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedItemIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29;
  v32 = v30;
  if (v31 == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = objc_msgSend(v31, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest allowedSectionIdentifiers](self, "allowedSectionIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedSectionIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v35;
  v38 = v36;
  if (v37 == v38)
  {

  }
  else
  {
    v39 = v38;
    v40 = objc_msgSend(v37, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest scopedContainers](self, "scopedContainers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedContainers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v41;
  v44 = v42;
  if (v43 == v44)
  {

  }
  else
  {
    v45 = v44;
    v46 = objc_msgSend(v43, "isEqual:", v44);

    if ((v46 & 1) == 0)
      goto LABEL_52;
  }
  v47 = -[MPModelLibraryRequest contentRange](self, "contentRange");
  if (v47 != objc_msgSend(v4, "contentRange"))
    goto LABEL_52;
  -[MPModelLibraryRequest contentRange](self, "contentRange");
  v49 = v48;
  objc_msgSend(v4, "contentRange");
  if (v49 != v50)
    goto LABEL_52;
  -[MPModelLibraryRequest filterText](self, "filterText");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterText");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v51;
  v54 = v52;
  if (v53 == v54)
  {

  }
  else
  {
    v55 = v54;
    v56 = objc_msgSend(v53, "isEqual:", v54);

    if ((v56 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest sectionFilterText](self, "sectionFilterText");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionFilterText");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v57;
  v60 = v58;
  if (v59 == v60)
  {

  }
  else
  {
    v61 = v60;
    v62 = objc_msgSend(v59, "isEqual:", v60);

    if ((v62 & 1) == 0)
      goto LABEL_52;
  }
  v63 = -[MPModelLibraryRequest sortUsingAllowedItemIdentifiers](self, "sortUsingAllowedItemIdentifiers");
  if (v63 != objc_msgSend(v4, "sortUsingAllowedItemIdentifiers"))
    goto LABEL_52;
  -[MPModelLibraryRequest mediaLibrary](self, "mediaLibrary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaLibrary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v64;
  v67 = v65;
  if (v66 == v67)
  {

  }
  else
  {
    v68 = v67;
    v69 = objc_msgSend(v66, "isEqual:", v67);

    if ((v69 & 1) == 0)
      goto LABEL_52;
  }
  v70 = -[MPModelLibraryRequest filteringOptions](self, "filteringOptions");
  if (v70 != objc_msgSend(v4, "filteringOptions"))
  {
LABEL_52:
    v83 = 0;
    goto LABEL_53;
  }
  -[MPModelLibraryRequest itemPropertyFilters](self, "itemPropertyFilters");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemPropertyFilters");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v71;
  v74 = v72;
  if (v73 == v74)
  {

  }
  else
  {
    v75 = v74;
    v76 = objc_msgSend(v73, "isEqual:", v74);

    if ((v76 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest sectionPropertyFilters](self, "sectionPropertyFilters");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionPropertyFilters");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v77;
  v80 = v78;
  if (v79 == v80)
  {

  }
  else
  {
    v81 = v80;
    v82 = objc_msgSend(v79, "isEqual:", v80);

    if ((v82 & 1) == 0)
      goto LABEL_52;
  }
  -[MPModelLibraryRequest legacyMediaQuery](self, "legacyMediaQuery");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyMediaQuery");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v85;
  v88 = v86;
  if (v87 == v88)
    v83 = 1;
  else
    v83 = objc_msgSend(v87, "isEqual:", v88);

LABEL_53:
  return v83;
}

- (id)sectionTranslationContext
{
  MPMediaLibraryEntityTranslationContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPModelLibraryRequest mediaLibrary](self, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v3, "setMediaLibrary:", v4);

  -[MPModelLibraryRequest allowedSectionIdentifiers](self, "allowedSectionIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequest scopedContainers](self, "scopedContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MPModelLibraryRequest scopedContainers](self, "scopedContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (v28)
      v8 = (id)objc_msgSend(v28, "mutableCopy");
    else
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = v8;
    -[MPModelRequest sectionKind](self, "sectionKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "modelClass");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[MPModelLibraryRequest scopedContainers](self, "scopedContainers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_opt_class() == v12)
          {
            objc_msgSend(v7, "removeObject:", v17);
            objc_msgSend(v17, "identifiers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v10, "copy");
    -[MPMediaLibraryEntityTranslationContext setScopedContainers:](v3, "setScopedContainers:", v7);

    v9 = (void *)v19;
  }
  else
  {
    v9 = v28;
  }
  v29 = v9;
  -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v3, "setAllowedEntityIdentifiers:");
  -[MPModelRequest sectionKind](self, "sectionKind");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v3, "setMultiQuery:", objc_msgSend(v20, "modelClass") == objc_opt_class());

  -[MPMediaLibraryEntityTranslationContext setFilteringOptions:](v3, "setFilteringOptions:", -[MPModelLibraryRequest filteringOptions](self, "filteringOptions"));
  -[MPModelRequest sectionKind](self, "sectionKind");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v3, "setModelKind:", v21);

  if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
  {
    -[MPModelLibraryRequest mediaLibrary](self, "mediaLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "userIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accountDSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v3, "setPersonID:", v24);

  }
  -[MPModelLibraryRequest sectionFilterText](self, "sectionFilterText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setFilterText:](v3, "setFilterText:", v25);

  -[MPModelLibraryRequest sectionPropertyFilters](self, "sectionPropertyFilters");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setPropertyFilters:](v3, "setPropertyFilters:", v26);

  return v3;
}

- (NSArray)allowedSectionIdentifiers
{
  return self->_allowedSectionIdentifiers;
}

- (NSString)sectionFilterText
{
  return self->_sectionFilterText;
}

- (void)setSectionFilterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return self->_wantsDetailedKeepLocalRequestableResponse;
}

- (BOOL)sortUsingAllowedItemIdentifiers
{
  return self->_sortUsingAllowedItemIdentifiers;
}

- (void)setSortUsingAllowedItemIdentifiers:(BOOL)a3
{
  self->_sortUsingAllowedItemIdentifiers = a3;
}

- (BOOL)isUpgradedSmartPlaylistLegacyMediaQuery
{
  return self->_isUpgradedSmartPlaylistLegacyMediaQuery;
}

- (NSArray)sectionPropertyFilters
{
  return self->_sectionPropertyFilters;
}

- (void)setSectionPropertyFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

void __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke_2;
  v5[3] = &unk_1E3162B80;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

void __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));

}

@end
