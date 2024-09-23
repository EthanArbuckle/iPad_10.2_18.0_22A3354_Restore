@implementation LPiTunesMediaAudioBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaAudioBookMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaAudioBookMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *author;
  uint64_t v14;
  NSString *narrator;
  uint64_t v16;
  LPImage *artwork;
  uint64_t v18;
  LPArtworkMetadata *artworkMetadata;
  uint64_t v20;
  NSURL *previewURL;
  LPiTunesMediaAudioBookMetadata *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LPiTunesMediaAudioBookMetadata;
  v5 = -[LPiTunesMediaAudioBookMetadata init](&v24, sel_init);
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

    decodeStringForKey(v4, (uint64_t)CFSTR("author"));
    v12 = objc_claimAutoreleasedReturnValue();
    author = v5->_author;
    v5->_author = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("narrator"));
    v14 = objc_claimAutoreleasedReturnValue();
    narrator = v5->_narrator;
    v5->_narrator = (NSString *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v16;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v18 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v18;

    decodeURLForKey(v4, CFSTR("previewURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v20;

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
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_author, CFSTR("author"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_narrator, CFSTR("narrator"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, CFSTR("previewURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaAudioBookMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  LPiTunesMediaAudioBookMetadata *v13;

  v4 = +[LPiTunesMediaAudioBookMetadata allocWithZone:](LPiTunesMediaAudioBookMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaAudioBookMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaAudioBookMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaAudioBookMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaAudioBookMetadata author](self, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setAuthor:](v4, "setAuthor:", v8);

    -[LPiTunesMediaAudioBookMetadata narrator](self, "narrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setNarrator:](v4, "setNarrator:", v9);

    -[LPiTunesMediaAudioBookMetadata previewURL](self, "previewURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setPreviewURL:](v4, "setPreviewURL:", v10);

    -[LPiTunesMediaAudioBookMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setArtwork:](v4, "setArtwork:", v11);

    -[LPiTunesMediaAudioBookMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaAudioBookMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

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
  v8.super_class = (Class)LPiTunesMediaAudioBookMetadata;
  if (-[LPiTunesMediaAudioBookMetadata isEqual:](&v8, sel_isEqual_, v4))
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
        && objectsAreEqual_0(v6[5], self->_author)
        && objectsAreEqual_0(v6[6], self->_narrator)
        && objectsAreEqual_0(v6[7], self->_artwork)
        && objectsAreEqual_0(v6[8], self->_artworkMetadata))
      {
        v5 = objectsAreEqual_0(v6[9], self->_previewURL);
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("author"), CFSTR("narrator"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("previewURL"), 0);
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

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)narrator
{
  return self->_narrator;
}

- (void)setNarrator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_narrator, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  LPCaptionBarPresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LPImagePresentationProperties *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id result;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = a3;
  objc_msgSend(v5, "commonPresentationPropertiesForStyle:", 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v6, "setCaptionBar:", v7);

  -[LPiTunesMediaAudioBookMetadata name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaAudioBookMetadata author](self, "author");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR(" Books"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v6, v8, v9, v10, 1, v5);

  -[LPiTunesMediaAudioBookMetadata artwork](self, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_populateProperties:withPrimaryImage:", v6, v11);

  v12 = objc_alloc_init(LPImagePresentationProperties);
  -[LPImagePresentationProperties setFilter:](v12, "setFilter:", 10);
  objc_msgSend(v6, "setImageProperties:", v12);
  if (TCCAccessPreflight())
  {
    v13 = 0;
  }
  else
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v14 = (void *)getMPMediaQueryClass_softClass;
    v45 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = (uint64_t)__getMPMediaQueryClass_block_invoke;
      v40 = &unk_1E44A7DB0;
      v41 = &v42;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v37);
      v14 = (void *)v43[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v15, "audiobooksQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3900];
    -[LPiTunesMediaAudioBookMetadata storeIdentifier](self, "storeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scannerWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    if (objc_msgSend(v19, "scanUnsignedLongLong:", &v36))
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v20 = (void *)getMPMediaPropertyPredicateClass_softClass;
      v45 = getMPMediaPropertyPredicateClass_softClass;
      if (!getMPMediaPropertyPredicateClass_softClass)
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = (uint64_t)__getMPMediaPropertyPredicateClass_block_invoke;
        v40 = &unk_1E44A7DB0;
        v41 = &v42;
        __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)&v37);
        v20 = (void *)v43[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v42, 8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v38 = (uint64_t)&v37;
      v39 = 0x2020000000;
      v23 = (_QWORD *)getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr;
      v40 = (void *)getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr)
      {
        v24 = MediaPlayerLibrary();
        v23 = dlsym(v24, "MPMediaItemPropertyStorePlaylistID");
        *(_QWORD *)(v38 + 24) = v23;
        getMPMediaItemPropertyStorePlaylistIDSymbolLoc_ptr = (uint64_t)v23;
      }
      _Block_object_dispose(&v37, 8);
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyStorePlaylistID(void)");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("LPiTunesMediaTransformers.m"), 42, CFSTR("%s"), dlerror());

        __break(1u);
        return result;
      }
      objc_msgSend(v21, "predicateWithValue:forProperty:", v22, *v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addFilterPredicate:", v25);

      objc_msgSend(v16, "items");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "persistentID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  -[LPiTunesMediaAudioBookMetadata storeIdentifier](self, "storeIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaAudioBookMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
  {
    objc_msgSend(v5, "canonicalURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    storefrontIdentifierFromURL(v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LPiTunesMediaAudioBookMetadata previewURL](self, "previewURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPInlineMediaPlaybackInformation audioBookPlaybackInformationWithStoreIdentifier:storefrontIdentifier:previewURL:persistentIdentifier:](LPInlineMediaPlaybackInformation, "audioBookPlaybackInformationWithStoreIdentifier:storefrontIdentifier:previewURL:persistentIdentifier:", v28, v30, v31, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {

  }
  objc_msgSend(v6, "setInlinePlaybackInformation:", v32);

  return v6;
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

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Audiobook: %@ – %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaAudioBookMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaAudioBookMetadata author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[LPiTunesMediaAudioBookMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaAudioBookMetadata author](self, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByEmDash(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v6);

  -[LPiTunesMediaAudioBookMetadata artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaAudioBookMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
