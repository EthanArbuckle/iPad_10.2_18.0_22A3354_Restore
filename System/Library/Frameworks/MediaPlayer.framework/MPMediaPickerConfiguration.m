@implementation MPMediaPickerConfiguration

- (MPMediaPickerConfiguration)init
{
  MPMediaPickerConfiguration *v2;
  MPMediaPickerConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMediaPickerConfiguration;
  v2 = -[MPMediaPickerConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MPMediaPickerConfiguration setShowsCloudItems:](v2, "setShowsCloudItems:", 1);
    -[MPMediaPickerConfiguration setShowsItemsWithProtectedAssets:](v3, "setShowsItemsWithProtectedAssets:", 1);
    -[MPMediaPickerConfiguration setShowsLibraryContent:](v3, "setShowsLibraryContent:", 1);
  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 allowsPickingMultipleItems;
  _BOOL4 alwaysShowSearchBarInLibrary;
  _BOOL4 automaticallyDrillsToLibrary;
  _BOOL4 showsCloudItems;
  _BOOL4 showsItemsWithProtectedAssets;
  NSString *prompt;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  _NSStringFromMPMediaType(self->_mediaTypes, CFSTR(" | "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  allowsPickingMultipleItems = self->_allowsPickingMultipleItems;
  alwaysShowSearchBarInLibrary = self->_alwaysShowSearchBarInLibrary;
  automaticallyDrillsToLibrary = self->_automaticallyDrillsToLibrary;
  showsCloudItems = self->_showsCloudItems;
  showsItemsWithProtectedAssets = self->_showsItemsWithProtectedAssets;
  if (-[NSString length](self->_prompt, "length"))
    prompt = self->_prompt;
  else
    prompt = 0;
  v12 = CFSTR("YES");
  if (showsItemsWithProtectedAssets)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (showsCloudItems)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (automaticallyDrillsToLibrary)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (alwaysShowSearchBarInLibrary)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (allowsPickingMultipleItems)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (self->_picksSingleCollectionEntity)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (!self->_pickingForExternalPlayer)
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p mediaTypes=%@, allowsPickingMultipleItems=%@, alwaysShowsSearchBarInLibrary=%@, automaticallyDrillsToLibrary=%@, showsCloudItems=%@, showsItemsWithProtectedAssets=%@, prompt=%@, picksSingleCollectionEntity=%@, typeIdentifiers=%@, selectionMode=%lu, supportedContentOptions=%lu, pickingForExternalPlayer=%@, playbackArchiveConfiguration=%@>"), v4, self, v5, v17, v16, v15, v14, v13, prompt, v18, *(_OWORD *)&self->_typeIdentifiers, self->_supportedContentOptions, v12, self->_playbackArchiveConfiguration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)showsCatalogContent
{
  return ((unint64_t)-[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") >> 1) & 1;
}

- (void)setShowsCatalogContent:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[MPMediaPickerConfiguration setSupportedContentOptions:](self, "setSupportedContentOptions:", v5 | v6);
}

- (BOOL)showsLibraryContent
{
  return -[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") & 1;
}

- (void)setShowsLibraryContent:(BOOL)a3
{
  -[MPMediaPickerConfiguration setSupportedContentOptions:](self, "setSupportedContentOptions:", -[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)supportsUnavailableContent
{
  return ((unint64_t)-[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") >> 2) & 1;
}

- (void)setSupportsUnavailableContent:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MPMediaPickerConfiguration supportedContentOptions](self, "supportedContentOptions") & 0xFFFFFFFFFFFFFFFBLL;
  v6 = 4;
  if (!v3)
    v6 = 0;
  -[MPMediaPickerConfiguration setSupportedContentOptions:](self, "setSupportedContentOptions:", v5 | v6);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t mediaTypes;
  id v5;

  mediaTypes = self->_mediaTypes;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", mediaTypes, CFSTR("mediaTypes"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsPickingMultipleItems, CFSTR("allowsPickingMultipleItems"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_alwaysShowSearchBarInLibrary, CFSTR("aslsb"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_automaticallyDrillsToLibrary, CFSTR("adtl"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsCloudItems, CFSTR("showsCloudItems"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsItemsWithProtectedAssets, CFSTR("showsItemsWithProtectedAssets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_prompt, CFSTR("prompt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_picksSingleCollectionEntity, CFSTR("picksSingleCollectionEntity"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_watchCompatibilityVersion, CFSTR("watchCompatibilityVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeIdentifiers, CFSTR("typeIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectionMode, CFSTR("selectionMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pickingForExternalPlayer, CFSTR("pickingForExternalPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackArchiveConfiguration, CFSTR("pac"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedContentOptions, CFSTR("sco"));

}

- (MPMediaPickerConfiguration)initWithCoder:(id)a3
{
  id v4;
  MPMediaPickerConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *prompt;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *typeIdentifiers;
  uint64_t v15;
  MPPlaybackArchiveConfiguration *playbackArchiveConfiguration;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPMediaPickerConfiguration;
  v5 = -[MPMediaPickerConfiguration init](&v18, sel_init);
  if (v5)
  {
    v5->_mediaTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaTypes"));
    v5->_allowsPickingMultipleItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsPickingMultipleItems"));
    v5->_alwaysShowSearchBarInLibrary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("aslsb"));
    v5->_automaticallyDrillsToLibrary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adtl"));
    v5->_showsCloudItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCloudItems"));
    v5->_showsItemsWithProtectedAssets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsItemsWithProtectedAssets"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prompt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v7;

    v5->_picksSingleCollectionEntity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("picksSingleCollectionEntity"));
    v5->_watchCompatibilityVersion = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("watchCompatibilityVersion"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("typeIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSArray *)v13;

    v5->_selectionMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectionMode"));
    v5->_pickingForExternalPlayer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pickingForExternalPlayer"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pac"));
    v15 = objc_claimAutoreleasedReturnValue();
    playbackArchiveConfiguration = v5->_playbackArchiveConfiguration;
    v5->_playbackArchiveConfiguration = (MPPlaybackArchiveConfiguration *)v15;

    v5->_supportedContentOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sco"));
  }

  return v5;
}

- (unint64_t)mediaTypes
{
  return self->_mediaTypes;
}

- (void)setMediaTypes:(unint64_t)a3
{
  self->_mediaTypes = a3;
}

- (BOOL)allowsPickingMultipleItems
{
  return self->_allowsPickingMultipleItems;
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  self->_allowsPickingMultipleItems = a3;
}

- (BOOL)alwaysShowSearchBarInLibrary
{
  return self->_alwaysShowSearchBarInLibrary;
}

- (void)setAlwaysShowSearchBarInLibrary:(BOOL)a3
{
  self->_alwaysShowSearchBarInLibrary = a3;
}

- (BOOL)automaticallyDrillsToLibrary
{
  return self->_automaticallyDrillsToLibrary;
}

- (void)setAutomaticallyDrillsToLibrary:(BOOL)a3
{
  self->_automaticallyDrillsToLibrary = a3;
}

- (BOOL)showsCloudItems
{
  return self->_showsCloudItems;
}

- (void)setShowsCloudItems:(BOOL)a3
{
  self->_showsCloudItems = a3;
}

- (BOOL)showsItemsWithProtectedAssets
{
  return self->_showsItemsWithProtectedAssets;
}

- (void)setShowsItemsWithProtectedAssets:(BOOL)a3
{
  self->_showsItemsWithProtectedAssets = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)picksSingleCollectionEntity
{
  return self->_picksSingleCollectionEntity;
}

- (void)setPicksSingleCollectionEntity:(BOOL)a3
{
  self->_picksSingleCollectionEntity = a3;
}

- (unsigned)watchCompatibilityVersion
{
  return self->_watchCompatibilityVersion;
}

- (void)setWatchCompatibilityVersion:(unsigned int)a3
{
  self->_watchCompatibilityVersion = a3;
}

- (NSArray)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)selectionMode
{
  return self->_selectionMode;
}

- (void)setSelectionMode:(int64_t)a3
{
  self->_selectionMode = a3;
}

- (BOOL)pickingForExternalPlayer
{
  return self->_pickingForExternalPlayer;
}

- (void)setPickingForExternalPlayer:(BOOL)a3
{
  self->_pickingForExternalPlayer = a3;
}

- (MPPlaybackArchiveConfiguration)playbackArchiveConfiguration
{
  return self->_playbackArchiveConfiguration;
}

- (void)setPlaybackArchiveConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchiveConfiguration, a3);
}

- (int64_t)supportedContentOptions
{
  return self->_supportedContentOptions;
}

- (void)setSupportedContentOptions:(int64_t)a3
{
  self->_supportedContentOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchiveConfiguration, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
