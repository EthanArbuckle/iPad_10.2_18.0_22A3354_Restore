@implementation LPiTunesMediaPlaylistMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPlaylistMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaPlaylistMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *curator;
  uint64_t v14;
  NSURL *curatorProfileURL;
  uint64_t v16;
  NSString *curatorHandle;
  uint64_t v18;
  LPImage *artwork;
  uint64_t v20;
  LPArtworkMetadata *artworkMetadata;
  LPiTunesMediaPlaylistMetadata *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LPiTunesMediaPlaylistMetadata;
  v5 = -[LPiTunesMediaPlaylistMetadata init](&v24, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("curator"));
    v12 = objc_claimAutoreleasedReturnValue();
    curator = v5->_curator;
    v5->_curator = (NSString *)v12;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("curatorProfileURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    curatorProfileURL = v5->_curatorProfileURL;
    v5->_curatorProfileURL = (NSURL *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("curatorHandle"));
    v16 = objc_claimAutoreleasedReturnValue();
    curatorHandle = v5->_curatorHandle;
    v5->_curatorHandle = (NSString *)v16;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curator, CFSTR("curator"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_curatorProfileURL, CFSTR("curatorProfileURL"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curatorHandle, CFSTR("curatorHandle"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaPlaylistMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  LPiTunesMediaPlaylistMetadata *v13;

  v4 = +[LPiTunesMediaPlaylistMetadata allocWithZone:](LPiTunesMediaPlaylistMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaPlaylistMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaPlaylistMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaPlaylistMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setCurator:](v4, "setCurator:", v8);

    -[LPiTunesMediaPlaylistMetadata curatorProfileURL](self, "curatorProfileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setCuratorProfileURL:](v4, "setCuratorProfileURL:", v9);

    -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setCuratorHandle:](v4, "setCuratorHandle:", v10);

    -[LPiTunesMediaPlaylistMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setArtwork:](v4, "setArtwork:", v11);

    -[LPiTunesMediaPlaylistMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

    v13 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaPlaylistMetadata;
  if (-[LPiTunesMediaPlaylistMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_storeFrontIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeIdentifier)
        && objectsAreEqual_0(v6[4], self->_name)
        && objectsAreEqual_0(v6[5], self->_curator)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata)
        && objectsAreEqual_0(v6[6], self->_curatorProfileURL))
      {
        v5 = objectsAreEqual_0(v6[7], self->_curatorProfileURL);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_storeIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("curator"), CFSTR("curatorProfileURL"), CFSTR("curatorHandle"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)curatorProfileURL
{
  return self->_curatorProfileURL;
}

- (void)setCuratorProfileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)curatorHandle
{
  return self->_curatorHandle;
}

- (void)setCuratorHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (LPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curatorHandle, 0);
  objc_storeStrong((id *)&self->_curatorProfileURL, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  LPCaptionBarPresentationProperties *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LPCollaborationFooterPresentationProperties *v15;
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
  void *v30;
  void *v31;
  LPCaptionButtonPresentationProperties *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_valueForQueryKey:", CFSTR("a"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("join"));

  if (v7)
    v8 = 56;
  else
    v8 = 9;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v9, "setCaptionBar:", v10);

  -[LPiTunesMediaPlaylistMetadata name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  appleMusicWordmark(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v9, v11, v12, v13, 1, v4);

  -[LPiTunesMediaPlaylistMetadata artwork](self, "artwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v9, v14);

  if ((v7 & 1) != 0)
  {
    if (sizeClassAllowsAppleMusicCollaborationFooter(objc_msgSend(v4, "effectiveSizeClass")))
    {
      if (objc_msgSend(v4, "isInComposeContext"))
      {
        v15 = objc_alloc_init(LPCollaborationFooterPresentationProperties);
        v16 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "configurationWithPaletteColors:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", CFSTR("person.2.fill"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_lp_imageByApplyingSymbolConfiguration:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCollaborationFooterPresentationProperties setGlyphAttachmentImage:](v15, "setGlyphAttachmentImage:", v21);

        LPLocalizedString(CFSTR("Collaborate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCollaborationFooterPresentationProperties setTitle:](v15, "setTitle:", v22);

        LPLocalizedString(CFSTR("Anyone with the link will be able to add, delete, and reorder songs."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCollaborationFooterPresentationProperties setSubtitle:](v15, "setSubtitle:", v23);

        objc_msgSend(v9, "captionBar");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCollaborationFooter:", v15);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A98], 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPImage _systemImageNamed:withSymbolConfiguration:](LPImage, "_systemImageNamed:withSymbolConfiguration:", CFSTR("person.2.fill"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_alloc_init(LPCaptionButtonPresentationProperties);
        LPLocalizedString(CFSTR("Join Playlist"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[LPButtonAction actionWithTitle:image:handler:](LPButtonAction, "actionWithTitle:image:handler:", v33, v31, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPCaptionButtonPresentationProperties setActions:](v32, "setActions:", v35);

        -[LPCaptionButtonPresentationProperties setShape:](v32, "setShape:", 2);
        objc_msgSend(v9, "captionBar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setButton:", v32);

      }
    }
  }
  else
  {
    -[LPiTunesMediaPlaylistMetadata storeIdentifier](self, "storeIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
    {
      objc_msgSend(v4, "canonicalURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      storefrontIdentifierFromURL(v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[LPInlineMediaPlaybackInformation playlistPlaybackInformationWithStoreIdentifier:storefrontIdentifier:](LPInlineMediaPlaybackInformation, "playlistPlaybackInformationWithStoreIdentifier:storefrontIdentifier:", v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {

    }
    objc_msgSend(v9, "setInlinePlaybackInformation:", v28);

  }
  return v9;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[LPiTunesMediaPlaylistMetadata curator](self, "curator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    LPLocalizedString(CFSTR("Playlist: %@ – %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LPLocalizedString(CFSTR("Playlist: %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LPiTunesMediaPlaylistMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByEmDash(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v6);

  -[LPiTunesMediaPlaylistMetadata artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaPlaylistMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)transcriptBoldTextFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)transcriptBoldTextFont_contentSizeCategory_140 != v3)
  {
    emphasizedPreferredFontForTextStyle(*MEMORY[0x1E0DC4AA0]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)transcriptBoldTextFont_font_141;
    transcriptBoldTextFont_font_141 = v4;

    objc_storeStrong((id *)&transcriptBoldTextFont_contentSizeCategory_140, v3);
  }
  v6 = (id)transcriptBoldTextFont_font_141;

  return v6;
}

- (id)_activeUserStateHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0DDBF98], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeUserState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "music");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = LPLogChannelUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get active iTunes user state.", v9, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)statusForTransformer:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[8];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPlaylistMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "userStateForMediaStorefrontIdentifier:", v5);

  subscribeToAppleMusicStatus(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = LPLogChannelUI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0C41000, v8, OS_LOG_TYPE_DEFAULT, "Failed to show playlist transformer status label; showing subscription status text instead.",
        buf,
        2u);
    }
    +[LPiTunesMediaSongMetadata statusForText:](LPiTunesMediaSongMetadata, "statusForText:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!v6)
  {
    v12 = LPLogChannelUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to show playlist transformer status label; unknown iTunes Store user state.";
LABEL_18:
      _os_log_impl(&dword_1A0C41000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_19:
    v9 = 0;
    goto LABEL_25;
  }
  -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_16;
  -[LPiTunesMediaPlaylistMetadata curatorProfileURL](self, "curatorProfileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_12;
LABEL_16:
    v12 = LPLogChannelUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to show playlist transformer status label; no curator name and/or no profile url or handle.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }

LABEL_12:
  -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[LPiTunesMediaPlaylistMetadata _activeUserStateHandle](self, "_activeUserStateHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (v18)
    {
      v12 = LPLogChannelUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Failed to show playlist transformer status label; user is sharing own playlist.";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  v33[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend((id)objc_opt_class(), "transcriptBoldTextFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v33[1] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "personNameComponentsFromString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "givenName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0CB3778]);
  v27 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Follow %@ on Apple Music"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  if (!v25)
  {
    -[LPiTunesMediaPlaylistMetadata curator](self, "curator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v27, "stringWithFormat:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v26, "initWithString:attributes:", v30, v21);

  if (!v25)
LABEL_25:

  return v9;
}

- (id)actionURLForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[LPiTunesMediaPlaylistMetadata curatorProfileURL](self, "curatorProfileURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPiTunesMediaPlaylistMetadata curatorProfileURL](self, "curatorProfileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v7, "setScheme:", CFSTR("https"));
      objc_msgSend(v7, "setHost:", CFSTR("music.apple.com"));
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[LPiTunesMediaPlaylistMetadata curatorHandle](self, "curatorHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("/profile/%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", v10);

      objc_msgSend(v7, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

@end
