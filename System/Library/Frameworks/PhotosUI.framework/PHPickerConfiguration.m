@implementation PHPickerConfiguration

- (PHPickerConfiguration)initWithPhotoLibrary:(PHPhotoLibrary *)photoLibrary
{
  PHPhotoLibrary *v4;
  PHPhotoLibrary *v5;
  PHPickerConfiguration *v6;
  PHPickerConfiguration *v8;
  SEL v9;

  v4 = photoLibrary;
  if (v4)
  {
    v5 = v4;
    v6 = -[PHPickerConfiguration _initWithPhotoLibrary:onlyReturnsIdentifiers:](self, "_initWithPhotoLibrary:onlyReturnsIdentifiers:", v4, 0);

    return v6;
  }
  else
  {
    v8 = (PHPickerConfiguration *)_PFAssertFailHandler();
    return -[PHPickerConfiguration init](v8, v9);
  }
}

- (PHPickerConfiguration)init
{
  return (PHPickerConfiguration *)-[PHPickerConfiguration _initWithPhotoLibrary:onlyReturnsIdentifiers:](self, "_initWithPhotoLibrary:onlyReturnsIdentifiers:", 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  _PHPickerSuggestionGroup *suggestionGroup;
  PHPickerConfiguration *v5;
  PHPickerConfiguration *v6;
  objc_class *v7;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v9;
  PHPhotoLibrary *v10;
  PHPhotoLibrary *v11;
  int v12;
  BOOL v13;
  PHPickerFilter *filter;
  PHPickerFilter *v15;
  PHPickerFilter *v16;
  PHPickerFilter *v17;
  _BOOL4 v18;
  NSArray *preselectedAssetIdentifiers;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  int v23;
  _PHPickerSuggestionGroup *v24;
  _PHPickerSuggestionGroup *v25;
  _PHPickerSuggestionGroup *v26;
  _BOOL4 v27;
  objc_class *v28;
  objc_class *v29;
  _PHPickerCollectionConfiguration *albumsConfiguration;
  _PHPickerCollectionConfiguration *v31;
  _PHPickerCollectionConfiguration *v32;
  _PHPickerCollectionConfiguration *v33;
  _BOOL4 v34;
  _PHPickerCollectionConfiguration *peopleConfiguration;
  _PHPickerCollectionConfiguration *v36;
  _PHPickerCollectionConfiguration *v37;
  _PHPickerCollectionConfiguration *v38;
  _BOOL4 v39;
  NSArray *followupPeopleConfigurations;
  NSArray *v41;
  NSArray *v42;
  NSArray *v43;
  int v44;
  NSString *containerIdentifier;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  int v49;
  NSString *purposedLimitedLibraryApplicationIdentifier;
  NSString *v51;
  NSString *v52;
  NSString *v53;
  int v54;

  v5 = (PHPickerConfiguration *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      if (v6)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          photoLibrary = self->_photoLibrary;
          v9 = v6->_photoLibrary;
          if (photoLibrary == v9)
          {

          }
          else
          {
            v10 = v9;
            v11 = photoLibrary;
            v12 = -[PHPhotoLibrary isEqual:](v11, "isEqual:", v10);

            if (!v12)
              goto LABEL_64;
          }
          if (self->_preferredAssetRepresentationMode != v6->_preferredAssetRepresentationMode
            || self->_selection != v6->_selection
            || self->_selectionLimit != v6->_selectionLimit)
          {
            goto LABEL_64;
          }
          filter = self->_filter;
          v15 = v6->_filter;
          if (filter == v15)
          {

          }
          else
          {
            v16 = v15;
            v17 = filter;
            v18 = -[PHPickerFilter isEqual:](v17, "isEqual:", v16);

            if (!v18)
              goto LABEL_64;
          }
          preselectedAssetIdentifiers = self->_preselectedAssetIdentifiers;
          v20 = v6->_preselectedAssetIdentifiers;
          if (preselectedAssetIdentifiers == v20)
          {

          }
          else
          {
            v21 = v20;
            v22 = preselectedAssetIdentifiers;
            v23 = -[NSArray isEqual:](v22, "isEqual:", v21);

            if (!v23)
              goto LABEL_64;
          }
          if (self->_mode != v6->_mode
            || self->_edgesWithoutContentMargins != v6->_edgesWithoutContentMargins
            || self->_disabledCapabilities != v6->_disabledCapabilities
            || self->__onlyReturnsIdentifiers != v6->__onlyReturnsIdentifiers
            || self->__allowsDownscaling != v6->__allowsDownscaling
            || self->__allowsEncodingPolicyModification != v6->__allowsEncodingPolicyModification
            || self->__usesOpenPanelLayout != v6->__usesOpenPanelLayout
            || self->__usesMemoriesLayout != v6->__usesMemoriesLayout
            || self->__alwaysShowLoadingPlaceholder != v6->__alwaysShowLoadingPlaceholder
            || self->__disabledPrivateCapabilities != v6->__disabledPrivateCapabilities
            || self->__sourceType != v6->__sourceType)
          {
            goto LABEL_64;
          }
          suggestionGroup = self->__suggestionGroup;
          v24 = v6->__suggestionGroup;
          if (suggestionGroup != v24)
          {
            v25 = v24;
            v26 = suggestionGroup;
            v27 = -[_PHPickerSuggestionGroup isEqual:](v26, "isEqual:", v25);

            if (!v27)
              goto LABEL_64;
            goto LABEL_40;
          }
LABEL_39:

LABEL_40:
          albumsConfiguration = self->__albumsConfiguration;
          v31 = v6->__albumsConfiguration;
          if (albumsConfiguration == v31)
          {

          }
          else
          {
            v32 = v31;
            v33 = albumsConfiguration;
            v34 = -[_PHPickerCollectionConfiguration isEqual:](v33, "isEqual:", v32);

            if (!v34)
              goto LABEL_64;
          }
          peopleConfiguration = self->__peopleConfiguration;
          v36 = v6->__peopleConfiguration;
          if (peopleConfiguration == v36)
          {

          }
          else
          {
            v37 = v36;
            v38 = peopleConfiguration;
            v39 = -[_PHPickerCollectionConfiguration isEqual:](v38, "isEqual:", v37);

            if (!v39)
              goto LABEL_64;
          }
          followupPeopleConfigurations = self->__followupPeopleConfigurations;
          v41 = v6->__followupPeopleConfigurations;
          if (followupPeopleConfigurations == v41)
          {

          }
          else
          {
            v42 = v41;
            v43 = followupPeopleConfigurations;
            v44 = -[NSArray isEqual:](v43, "isEqual:", v42);

            if (!v44)
              goto LABEL_64;
          }
          containerIdentifier = self->__containerIdentifier;
          v46 = v6->__containerIdentifier;
          if (containerIdentifier == v46)
          {

          }
          else
          {
            v47 = v46;
            v48 = containerIdentifier;
            v49 = -[NSString isEqual:](v48, "isEqual:", v47);

            if (!v49)
              goto LABEL_64;
          }
          purposedLimitedLibraryApplicationIdentifier = self->__purposedLimitedLibraryApplicationIdentifier;
          v51 = v6->__purposedLimitedLibraryApplicationIdentifier;
          if (purposedLimitedLibraryApplicationIdentifier == v51)
          {

          }
          else
          {
            v52 = v51;
            v53 = purposedLimitedLibraryApplicationIdentifier;
            v54 = -[NSString isEqual:](v53, "isEqual:", v52);

            if (!v54)
              goto LABEL_64;
          }
          if (self->__onboardingOverlayDismissedBefore == v6->__onboardingOverlayDismissedBefore
            && self->__onboardingHeaderDismissedBefore == v6->__onboardingHeaderDismissedBefore
            && self->__limitedLibraryHeaderDismissedBefore == v6->__limitedLibraryHeaderDismissedBefore)
          {
            v13 = self->__excludedCollections == v6->__excludedCollections;
LABEL_65:

            goto LABEL_66;
          }
LABEL_64:
          v13 = 0;
          goto LABEL_65;
        }
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v5 = (PHPickerConfiguration *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromClass(v7);
        objc_claimAutoreleasedReturnValue();
      }
      _PFAssertFailHandler();
      goto LABEL_39;
    }
    v13 = 0;
  }
LABEL_66:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = -[PHPhotoLibrary hash](self->_photoLibrary, "hash");
  v4 = self->_preferredAssetRepresentationMode - v3 + 32 * v3;
  v5 = self->_selection - v4 + 32 * v4;
  v6 = self->_selectionLimit - v5 + 32 * v5;
  v7 = -[PHPickerFilter hash](self->_filter, "hash") - v6 + 32 * v6;
  v8 = -[NSArray hash](self->_preselectedAssetIdentifiers, "hash");
  v9 = self->_mode - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  v10 = self->_disabledCapabilities
      - (self->_edgesWithoutContentMargins
       - v9
       + 32 * v9)
      + 32 * (self->_edgesWithoutContentMargins - v9 + 32 * v9);
  v11 = self->__onlyReturnsIdentifiers - v10 + 32 * v10;
  v12 = self->__allowsDownscaling - v11 + 32 * v11;
  v13 = self->__allowsEncodingPolicyModification - v12 + 32 * v12;
  v14 = self->__usesOpenPanelLayout - v13 + 32 * v13;
  v15 = self->__usesMemoriesLayout - v14 + 32 * v14;
  v16 = -[_PHPickerSuggestionGroup hash](self->__suggestionGroup, "hash") - v15 + 32 * v15;
  v17 = -[_PHPickerCollectionConfiguration hash](self->__albumsConfiguration, "hash") - v16 + 32 * v16;
  v18 = -[_PHPickerCollectionConfiguration hash](self->__peopleConfiguration, "hash") - v17 + 32 * v17;
  v19 = -[NSArray hash](self->__followupPeopleConfigurations, "hash");
  v20 = self->__alwaysShowLoadingPlaceholder - (v19 - v18 + 32 * v18) + 32 * (v19 - v18 + 32 * v18);
  v21 = self->__disabledPrivateCapabilities - v20 + 32 * v20;
  v22 = self->__sourceType - v21 + 32 * v21;
  v23 = -[NSString hash](self->__containerIdentifier, "hash") - v22 + 32 * v22;
  v24 = -[NSString hash](self->__purposedLimitedLibraryApplicationIdentifier, "hash");
  v25 = self->__onboardingOverlayDismissedBefore - (v24 - v23 + 32 * v23) + 32 * (v24 - v23 + 32 * v23);
  v26 = self->__onboardingHeaderDismissedBefore - v25 + 32 * v25;
  v27 = self->__limitedLibraryHeaderDismissedBefore - v26 + 32 * v26;
  return self->__excludedCollections - v27 + 32 * v27 + 0x49943D4FF0D1075FLL;
}

- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyReturnsIdentifiers:(id)a3
{
  id v4;
  void *v5;
  PHPickerConfiguration *v6;
  PHPickerConfiguration *result;
  PHPickerConfiguration *v8;
  SEL v9;
  unint64_t v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[PHPickerConfiguration _initWithPhotoLibrary:onlyReturnsIdentifiers:](self, "_initWithPhotoLibrary:onlyReturnsIdentifiers:", v4, 1);

    return v6;
  }
  else
  {
    v8 = (PHPickerConfiguration *)_PFAssertFailHandler();
    -[PHPickerConfiguration _setEdgesWithoutContentMargins:](v8, v9, v10);
  }
  return result;
}

- (void)_setEdgesWithoutContentMargins:(unint64_t)a3
{
  self->_edgesWithoutContentMargins = a3;
}

- (unint64_t)_edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (void)_setDisabledFeatures:(unint64_t)a3
{
  self->_disabledCapabilities = a3;
}

- (unint64_t)_disabledFeatures
{
  return self->_disabledCapabilities;
}

- (void)_setAllowsContinuousSelection:(BOOL)a3
{
  int64_t v3;

  switch(self->_selection)
  {
    case 0:
      if (a3)
      {
        v3 = 2;
        goto LABEL_10;
      }
      break;
    case 1:
      if (a3)
      {
        v3 = 3;
        goto LABEL_10;
      }
      break;
    case 2:
      if (!a3)
      {
        v3 = 0;
        goto LABEL_10;
      }
      break;
    case 3:
      if (!a3)
      {
        v3 = 1;
LABEL_10:
        self->_selection = v3;
      }
      break;
    default:
      return;
  }
}

- (BOOL)_allowsContinuousSelection
{
  return self->_selection > 1uLL;
}

- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyForOpenPanel:(id)a3
{
  id v4;
  char *v5;
  PHPickerConfiguration *v7;
  SEL v8;
  _NSZone *v9;

  v4 = a3;
  if (v4
    || (objc_msgSend(MEMORY[0x24BDE35F0], "imagePickerPhotoLibrary"),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = -[PHPickerConfiguration _initWithPhotoLibrary:onlyReturnsIdentifiers:](self, "_initWithPhotoLibrary:onlyReturnsIdentifiers:", v4, 0);
    *((_QWORD *)v5 + 4) = 3;
    *(int64x2_t *)(v5 + 72) = vdupq_n_s64(0xFuLL);
    v5[12] = 1;

    return (PHPickerConfiguration *)v5;
  }
  else
  {
    v7 = (PHPickerConfiguration *)_PFAssertFailHandler();
    return (PHPickerConfiguration *)-[PHPickerConfiguration copyWithZone:](v7, v8, v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;

  v4 = -[PHPickerConfiguration _initWithPhotoLibrary:onlyReturnsIdentifiers:]([PHPickerConfiguration alloc], "_initWithPhotoLibrary:onlyReturnsIdentifiers:", self->_photoLibrary, self->__onlyReturnsIdentifiers);
  objc_storeStrong(v4 + 12, self->_photoLibrary);
  v4[3] = (id)self->_preferredAssetRepresentationMode;
  v4[4] = (id)self->_selection;
  v4[5] = (id)self->_selectionLimit;
  v5 = -[PHPickerFilter copy](self->_filter, "copy");
  v6 = v4[6];
  v4[6] = (id)v5;

  v7 = -[NSArray copy](self->_preselectedAssetIdentifiers, "copy");
  v8 = v4[7];
  v4[7] = (id)v7;

  v4[8] = (id)self->_mode;
  objc_storeStrong(v4 + 16, self->__aspectRatio);
  v4[9] = (id)self->_edgesWithoutContentMargins;
  v4[10] = (id)self->_disabledCapabilities;
  *((_BYTE *)v4 + 15) = self->__allowsDownscaling;
  *((_BYTE *)v4 + 16) = self->__allowsEncodingPolicyModification;
  v9 = -[_PHPickerSuggestionGroup copy](self->__suggestionGroup, "copy");
  v10 = v4[13];
  v4[13] = (id)v9;

  v11 = -[_PHPickerCollectionConfiguration copy](self->__albumsConfiguration, "copy");
  v12 = v4[18];
  v4[18] = (id)v11;

  v13 = -[_PHPickerCollectionConfiguration copy](self->__peopleConfiguration, "copy");
  v14 = v4[19];
  v4[19] = (id)v13;

  v15 = -[NSArray copy](self->__followupPeopleConfigurations, "copy");
  v16 = v4[20];
  v4[20] = (id)v15;

  *((_BYTE *)v4 + 14) = self->__alwaysShowLoadingPlaceholder;
  v4[14] = (id)self->__disabledPrivateCapabilities;
  v4[15] = (id)self->__sourceType;
  v17 = -[NSString copy](self->__containerIdentifier, "copy");
  v18 = v4[17];
  v4[17] = (id)v17;

  v19 = -[NSString copy](self->__purposedLimitedLibraryApplicationIdentifier, "copy");
  v20 = v4[11];
  v4[11] = (id)v19;

  *((_BYTE *)v4 + 8) = self->__onboardingOverlayDismissedBefore;
  *((_BYTE *)v4 + 9) = self->__onboardingHeaderDismissedBefore;
  *((_BYTE *)v4 + 10) = self->__limitedLibraryHeaderDismissedBefore;
  *((_BYTE *)v4 + 11) = self->__onlyReturnsIdentifiers;
  *((_BYTE *)v4 + 12) = self->__usesOpenPanelLayout;
  *((_BYTE *)v4 + 13) = self->__usesMemoriesLayout;
  v4[21] = (id)self->__excludedCollections;
  return v4;
}

- (PHPickerConfiguration)initWithCoder:(id)a3
{
  id v4;
  PHPickerConfiguration *v5;
  void *v6;
  void *v7;
  PHPickerFilter *v8;
  PHPickerFilter *filter;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PHPhotoLibrary *photoLibrary;
  uint64_t v18;
  _PHPickerAspectRatio *aspectRatio;
  uint64_t v20;
  _PHPickerSuggestionGroup *suggestionGroup;
  uint64_t v22;
  _PHPickerCollectionConfiguration *albumsConfiguration;
  uint64_t v24;
  _PHPickerCollectionConfiguration *peopleConfiguration;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *followupPeopleConfigurations;
  void *v31;
  uint64_t v32;
  NSString *containerIdentifier;
  uint64_t v34;
  NSString *purposedLimitedLibraryApplicationIdentifier;
  void *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PHPickerConfiguration;
  v5 = -[PHPickerConfiguration init](&v38, sel_init);
  if (v5)
  {
    v5->_preferredAssetRepresentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerConfigurationCoderAssetRepresentationModeKey"));
    v5->_selection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerConfigurationCoderSelectionKey"));
    v5->_selectionLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerConfigurationCoderSelectionLimitKey"));
    PUPickerFilterAvailableClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("PHPickerConfigurationCoderFilterKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[PHPickerFilter _initWithPUPickerFilter:]([PHPickerFilter alloc], "_initWithPUPickerFilter:", v7);
      filter = v5->_filter;
      v5->_filter = v8;

    }
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderPreselectedAssetIdentifiersKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v5->_preselectedAssetIdentifiers, v12);

    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerConfigurationCoderModeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderEdgesWithoutContentMarginsKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_edgesWithoutContentMargins = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderDisabledCapabilitiesKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disabledCapabilities = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderPhotoLibraryURLKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDE35F0]), "initWithPhotoLibraryURL:", v15);
      photoLibrary = v5->_photoLibrary;
      v5->_photoLibrary = (PHPhotoLibrary *)v16;

    }
    v5->__onlyReturnsIdentifiers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderOnlyReturnsIdentifiersKey"));
    v5->__allowsDownscaling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderAllowsDownscalingKey"));
    v5->__allowsEncodingPolicyModification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationAllowsEncodingPolicyModificationKey"));
    v5->__usesOpenPanelLayout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderUsesOpenPanelLayoutKey"));
    v5->__usesMemoriesLayout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderUsesMemoriesLayoutKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderAspectRatioKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    aspectRatio = v5->__aspectRatio;
    v5->__aspectRatio = (_PHPickerAspectRatio *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderSuggestionGroupKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    suggestionGroup = v5->__suggestionGroup;
    v5->__suggestionGroup = (_PHPickerSuggestionGroup *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderAlbumsConfigurationKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    albumsConfiguration = v5->__albumsConfiguration;
    v5->__albumsConfiguration = (_PHPickerCollectionConfiguration *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderPeopleConfigurationKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    peopleConfiguration = v5->__peopleConfiguration;
    v5->__peopleConfiguration = (_PHPickerCollectionConfiguration *)v24;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("PHPickerConfigurationCoderFollowupPeopleConfigurationsKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    followupPeopleConfigurations = v5->__followupPeopleConfigurations;
    v5->__followupPeopleConfigurations = (NSArray *)v29;

    v5->__alwaysShowLoadingPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderAlwaysShowLoadingPlaceholderKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderDisabledPrivateCapabilitiesKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->__disabledPrivateCapabilities = objc_msgSend(v31, "unsignedIntegerValue");

    v5->__sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerConfigurationCoderSourceTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderContainerIdentifierKey"));
    v32 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->__containerIdentifier;
    v5->__containerIdentifier = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderPurposedLimitedLibraryApplicationIdentifierKey"));
    v34 = objc_claimAutoreleasedReturnValue();
    purposedLimitedLibraryApplicationIdentifier = v5->__purposedLimitedLibraryApplicationIdentifier;
    v5->__purposedLimitedLibraryApplicationIdentifier = (NSString *)v34;

    v5->__onboardingOverlayDismissedBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderOnboardingOverlayDismissedBeforeKey"));
    v5->__onboardingHeaderDismissedBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderOnboardingHeaderDismissedBeforeKey"));
    v5->__limitedLibraryHeaderDismissedBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerConfigurationCoderLimitedLibraryHeaderDismissedBeforeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHPickerConfigurationCoderExcludedCollectionsKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->__excludedCollections = objc_msgSend(v36, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t preferredAssetRepresentationMode;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  preferredAssetRepresentationMode = self->_preferredAssetRepresentationMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", preferredAssetRepresentationMode, CFSTR("PHPickerConfigurationCoderAssetRepresentationModeKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selection, CFSTR("PHPickerConfigurationCoderSelectionKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectionLimit, CFSTR("PHPickerConfigurationCoderSelectionLimitKey"));
  -[PHPickerFilter _puPickerFilter](self->_filter, "_puPickerFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PHPickerConfigurationCoderFilterKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->__aspectRatio, CFSTR("PHPickerConfigurationCoderAspectRatioKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preselectedAssetIdentifiers, CFSTR("PHPickerConfigurationCoderPreselectedAssetIdentifiersKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("PHPickerConfigurationCoderModeKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_edgesWithoutContentMargins);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PHPickerConfigurationCoderEdgesWithoutContentMarginsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_disabledCapabilities);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("PHPickerConfigurationCoderDisabledCapabilitiesKey"));

  -[PHPhotoLibrary photoLibraryURL](self->_photoLibrary, "photoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("PHPickerConfigurationCoderPhotoLibraryURLKey"));

  objc_msgSend(v5, "encodeBool:forKey:", self->__onlyReturnsIdentifiers, CFSTR("PHPickerConfigurationCoderOnlyReturnsIdentifiersKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__allowsDownscaling, CFSTR("PHPickerConfigurationCoderAllowsDownscalingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__allowsEncodingPolicyModification, CFSTR("PHPickerConfigurationAllowsEncodingPolicyModificationKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__usesOpenPanelLayout, CFSTR("PHPickerConfigurationCoderUsesOpenPanelLayoutKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__usesMemoriesLayout, CFSTR("PHPickerConfigurationCoderUsesMemoriesLayoutKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__suggestionGroup, CFSTR("PHPickerConfigurationCoderSuggestionGroupKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__albumsConfiguration, CFSTR("PHPickerConfigurationCoderAlbumsConfigurationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__peopleConfiguration, CFSTR("PHPickerConfigurationCoderPeopleConfigurationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__followupPeopleConfigurations, CFSTR("PHPickerConfigurationCoderFollowupPeopleConfigurationsKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__alwaysShowLoadingPlaceholder, CFSTR("PHPickerConfigurationCoderAlwaysShowLoadingPlaceholderKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->__disabledPrivateCapabilities);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("PHPickerConfigurationCoderDisabledPrivateCapabilitiesKey"));

  objc_msgSend(v5, "encodeInteger:forKey:", self->__sourceType, CFSTR("PHPickerConfigurationCoderSourceTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__containerIdentifier, CFSTR("PHPickerConfigurationCoderContainerIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__purposedLimitedLibraryApplicationIdentifier, CFSTR("PHPickerConfigurationCoderPurposedLimitedLibraryApplicationIdentifierKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__onboardingOverlayDismissedBefore, CFSTR("PHPickerConfigurationCoderOnboardingOverlayDismissedBeforeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__onboardingHeaderDismissedBefore, CFSTR("PHPickerConfigurationCoderOnboardingHeaderDismissedBeforeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__limitedLibraryHeaderDismissedBefore, CFSTR("PHPickerConfigurationCoderLimitedLibraryHeaderDismissedBeforeKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->__excludedCollections);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("PHPickerConfigurationCoderExcludedCollectionsKey"));

}

- (id)_initWithPhotoLibrary:(id)a3 onlyReturnsIdentifiers:(BOOL)a4
{
  id v7;
  PHPickerConfiguration *v8;
  NSArray *preselectedAssetIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  PHPickerConfiguration *v14;
  SEL v15;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHPickerConfiguration;
  v8 = -[PHPickerConfiguration init](&v16, sel_init);
  if (!v8)
    goto LABEL_4;
  if ((-[PHPickerConfiguration isMemberOfClass:](v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    v8->_preferredAssetRepresentationMode = 0;
    v8->_selectionLimit = 1;
    preselectedAssetIdentifiers = v8->_preselectedAssetIdentifiers;
    v8->_preselectedAssetIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    v8->__onlyReturnsIdentifiers = a4;
    v8->__allowsEncodingPolicyModification = 1;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->__onboardingOverlayDismissedBefore = objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.photos.picker.overlay"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->__onboardingHeaderDismissedBefore = objc_msgSend(v11, "BOOLForKey:", CFSTR("com.apple.photos.picker.header"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8->__limitedLibraryHeaderDismissedBefore = objc_msgSend(v12, "BOOLForKey:", CFSTR("com.apple.photos.picker.limitedlibrary.header"));

LABEL_4:
    return v8;
  }
  v14 = (PHPickerConfiguration *)_PFAssertFailHandler();
  return (id)-[PHPickerConfiguration preferredAssetRepresentationMode](v14, v15);
}

- (PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode
{
  return self->_preferredAssetRepresentationMode;
}

- (void)setPreferredAssetRepresentationMode:(PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode
{
  self->_preferredAssetRepresentationMode = preferredAssetRepresentationMode;
}

- (PHPickerConfigurationSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(PHPickerConfigurationSelection)selection
{
  self->_selection = selection;
}

- (NSInteger)selectionLimit
{
  return self->_selectionLimit;
}

- (void)setSelectionLimit:(NSInteger)selectionLimit
{
  self->_selectionLimit = selectionLimit;
}

- (PHPickerFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(PHPickerFilter *)filter
{
  objc_setProperty_nonatomic_copy(self, a2, filter, 48);
}

- (NSArray)preselectedAssetIdentifiers
{
  return self->_preselectedAssetIdentifiers;
}

- (void)setPreselectedAssetIdentifiers:(NSArray *)preselectedAssetIdentifiers
{
  objc_setProperty_nonatomic_copy(self, a2, preselectedAssetIdentifiers, 56);
}

- (PHPickerMode)mode
{
  return self->_mode;
}

- (void)setMode:(PHPickerMode)mode
{
  self->_mode = mode;
}

- (NSDirectionalRectEdge)edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins
{
  self->_edgesWithoutContentMargins = edgesWithoutContentMargins;
}

- (PHPickerCapabilities)disabledCapabilities
{
  return self->_disabledCapabilities;
}

- (void)setDisabledCapabilities:(PHPickerCapabilities)disabledCapabilities
{
  self->_disabledCapabilities = disabledCapabilities;
}

- (BOOL)_onboardingOverlayDismissedBefore
{
  return self->__onboardingOverlayDismissedBefore;
}

- (void)set_onboardingOverlayDismissedBefore:(BOOL)a3
{
  self->__onboardingOverlayDismissedBefore = a3;
}

- (BOOL)_onboardingHeaderDismissedBefore
{
  return self->__onboardingHeaderDismissedBefore;
}

- (void)set_onboardingHeaderDismissedBefore:(BOOL)a3
{
  self->__onboardingHeaderDismissedBefore = a3;
}

- (BOOL)_limitedLibraryHeaderDismissedBefore
{
  return self->__limitedLibraryHeaderDismissedBefore;
}

- (void)set_limitedLibraryHeaderDismissedBefore:(BOOL)a3
{
  self->__limitedLibraryHeaderDismissedBefore = a3;
}

- (BOOL)_onlyReturnsIdentifiers
{
  return self->__onlyReturnsIdentifiers;
}

- (BOOL)_usesOpenPanelLayout
{
  return self->__usesOpenPanelLayout;
}

- (BOOL)_usesMemoriesLayout
{
  return self->__usesMemoriesLayout;
}

- (void)_setUsesMemoriesLayout:(BOOL)a3
{
  self->__usesMemoriesLayout = a3;
}

- (NSString)_purposedLimitedLibraryApplicationIdentifier
{
  return self->__purposedLimitedLibraryApplicationIdentifier;
}

- (void)_setPurposedLimitedLibraryApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (_PHPickerSuggestionGroup)_suggestionGroup
{
  return self->__suggestionGroup;
}

- (void)set_suggestionGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)_disabledPrivateCapabilities
{
  return self->__disabledPrivateCapabilities;
}

- (void)_setDisabledPrivateCapabilities:(unint64_t)a3
{
  self->__disabledPrivateCapabilities = a3;
}

- (int64_t)_sourceType
{
  return self->__sourceType;
}

- (void)_setSourceType:(int64_t)a3
{
  self->__sourceType = a3;
}

- (_PHPickerAspectRatio)_aspectRatio
{
  return self->__aspectRatio;
}

- (void)set_aspectRatio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)_containerIdentifier
{
  return self->__containerIdentifier;
}

- (void)set_containerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)_alwaysShowLoadingPlaceholder
{
  return self->__alwaysShowLoadingPlaceholder;
}

- (void)_setAlwaysShowLoadingPlaceholder:(BOOL)a3
{
  self->__alwaysShowLoadingPlaceholder = a3;
}

- (BOOL)_allowsDownscaling
{
  return self->__allowsDownscaling;
}

- (void)_setAllowsDownscaling:(BOOL)a3
{
  self->__allowsDownscaling = a3;
}

- (BOOL)_allowsEncodingPolicyModification
{
  return self->__allowsEncodingPolicyModification;
}

- (void)_setAllowsEncodingPolicyModification:(BOOL)a3
{
  self->__allowsEncodingPolicyModification = a3;
}

- (_PHPickerCollectionConfiguration)_albumsConfiguration
{
  return self->__albumsConfiguration;
}

- (void)_setAlbumsConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (_PHPickerCollectionConfiguration)_peopleConfiguration
{
  return self->__peopleConfiguration;
}

- (void)_setPeopleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)_followupPeopleConfigurations
{
  return self->__followupPeopleConfigurations;
}

- (void)_setFollowupPeopleConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)_excludedCollections
{
  return self->__excludedCollections;
}

- (void)_setExcludedCollections:(unint64_t)a3
{
  self->__excludedCollections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__followupPeopleConfigurations, 0);
  objc_storeStrong((id *)&self->__peopleConfiguration, 0);
  objc_storeStrong((id *)&self->__albumsConfiguration, 0);
  objc_storeStrong((id *)&self->__containerIdentifier, 0);
  objc_storeStrong((id *)&self->__aspectRatio, 0);
  objc_storeStrong((id *)&self->__suggestionGroup, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->__purposedLimitedLibraryApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_preselectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
