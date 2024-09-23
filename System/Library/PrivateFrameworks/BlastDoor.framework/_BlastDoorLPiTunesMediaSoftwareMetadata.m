@implementation _BlastDoorLPiTunesMediaSoftwareMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaSoftwareMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *storeFrontIdentifier;
  uint64_t v10;
  NSString *storeIdentifier;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *subtitle;
  uint64_t v16;
  NSString *genre;
  uint64_t v18;
  NSString *platform;
  uint64_t v20;
  _BlastDoorLPImage *icon;
  uint64_t v22;
  NSArray *screenshots;
  uint64_t v24;
  _BlastDoorLPVideo *previewVideo;
  _BlastDoorLPiTunesMediaSoftwareMetadata *v26;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_BlastDoorLPiTunesMediaSoftwareMetadata;
  v5 = -[_BlastDoorLPiTunesMediaSoftwareMetadata init](&v28, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_isMessagesOnlyApp;
    *(_QWORD *)&v5->_isMessagesOnlyApp = v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("genre"));
    v14 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("platform"));
    v16 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v16;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v18 = objc_claimAutoreleasedReturnValue();
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfLPImagesForKey:", CFSTR("screenshots"));
    v20 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v20;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPVideoForKey:", CFSTR("previewVideo"));
    v22 = objc_claimAutoreleasedReturnValue();
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v22;

    *(&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMessagesOnlyApp"));
    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("messagesAppIcon"));
    v24 = objc_claimAutoreleasedReturnValue();
    previewVideo = v5->_previewVideo;
    v5->_previewVideo = (_BlastDoorLPVideo *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->_isMessagesOnlyApp;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, CFSTR("name"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("subtitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("genre"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_genre, CFSTR("platform"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_platform, CFSTR("icon"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("screenshots"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_screenshots, CFSTR("previewVideo"));
  objc_msgSend(v5, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1), CFSTR("isMessagesOnlyApp"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_previewVideo, CFSTR("messagesAppIcon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaSoftwareMetadata *v4;
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
  _BlastDoorLPiTunesMediaSoftwareMetadata *v15;

  v4 = +[_BlastDoorLPiTunesMediaSoftwareMetadata allocWithZone:](_BlastDoorLPiTunesMediaSoftwareMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaSoftwareMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setName:](v4, "setName:", v7);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata subtitle](self, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setSubtitle:](v4, "setSubtitle:", v8);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata genre](self, "genre");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setGenre:](v4, "setGenre:", v9);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata platform](self, "platform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setPlatform:](v4, "setPlatform:", v10);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata icon](self, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setIcon:](v4, "setIcon:", v11);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata screenshots](self, "screenshots");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setScreenshots:](v4, "setScreenshots:", v12);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata previewVideo](self, "previewVideo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setPreviewVideo:](v4, "setPreviewVideo:", v13);

    -[_BlastDoorLPiTunesMediaSoftwareMetadata setIsMessagesOnlyApp:](v4, "setIsMessagesOnlyApp:", -[_BlastDoorLPiTunesMediaSoftwareMetadata isMessagesOnlyApp](self, "isMessagesOnlyApp"));
    -[_BlastDoorLPiTunesMediaSoftwareMetadata messagesAppIcon](self, "messagesAppIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaSoftwareMetadata setMessagesAppIcon:](v4, "setMessagesAppIcon:", v14);

    v15 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BlastDoorLPiTunesMediaSoftwareMetadata;
  if (-[_BlastDoorLPiTunesMediaSoftwareMetadata isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | *(_QWORD *)&self->_isMessagesOnlyApp && !objc_msgSend((id)v7, "isEqual:"))
        goto LABEL_26;
      v8 = v6[3];
      if (v8 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v8, "isEqual:"))
        goto LABEL_26;
      if (((v9 = v6[4], !(v9 | (unint64_t)self->_storeIdentifier))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[5], !(v10 | (unint64_t)self->_name)) || objc_msgSend((id)v10, "isEqual:"))
        && ((v11 = v6[6], !(v11 | (unint64_t)self->_subtitle)) || objc_msgSend((id)v11, "isEqual:"))
        && ((v12 = v6[7], !(v12 | (unint64_t)self->_genre)) || objc_msgSend((id)v12, "isEqual:"))
        && ((v13 = v6[8], !(v13 | (unint64_t)self->_platform)) || objc_msgSend((id)v13, "isEqual:"))
        && ((v14 = v6[9], !(v14 | (unint64_t)self->_icon)) || objc_msgSend((id)v14, "isEqual:"))
        && ((v15 = v6[10], !(v15 | (unint64_t)self->_screenshots))
         || objc_msgSend((id)v15, "isEqual:"))
        && *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1))
      {
        v16 = v6[11];
        if (v16 | (unint64_t)self->_previewVideo)
          v5 = objc_msgSend((id)v16, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
LABEL_26:
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
  return -[NSString hash](self->_storeFrontIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("screenshots"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("messagesAppIcon"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("previewVideo"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("subtitle"), CFSTR("genre"), CFSTR("platform"), CFSTR("icon"), CFSTR("screenshots"), CFSTR("previewVideo"), CFSTR("isMessagesOnlyApp"), CFSTR("messagesAppIcon"), 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_isMessagesOnlyApp;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_storeIdentifier;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_name;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_subtitle;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)platform
{
  return self->_genre;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_platform;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSArray)screenshots
{
  return (NSArray *)self->_icon;
}

- (void)setScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_BlastDoorLPVideo)previewVideo
{
  return (_BlastDoorLPVideo *)self->_screenshots;
}

- (void)setPreviewVideo:(id)a3
{
  objc_storeStrong((id *)&self->_screenshots, a3);
}

- (BOOL)isMessagesOnlyApp
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsMessagesOnlyApp:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPImage)messagesAppIcon
{
  return (_BlastDoorLPImage *)self->_previewVideo;
}

- (void)setMessagesAppIcon:(id)a3
{
  objc_storeStrong((id *)&self->_previewVideo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_isMessagesOnlyApp, 0);
}

@end
