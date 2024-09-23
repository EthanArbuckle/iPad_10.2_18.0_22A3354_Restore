@implementation LPGameCenterInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPGameCenterInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  LPGameCenterInvitationMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *game;
  uint64_t v10;
  LPImage *image;
  LPGameCenterInvitationMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPGameCenterInvitationMetadata;
  v5 = -[LPGameCenterInvitationMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("game"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_maximumNumberOfPlayers;
    *(_QWORD *)&v5->_maximumNumberOfPlayers = v6;

    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("numberOfPlayers"));
    v5->_numberOfPlayers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minimumNumberOfPlayers"));
    v5->_minimumNumberOfPlayers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maximumNumberOfPlayers"));
    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v8 = objc_claimAutoreleasedReturnValue();
    game = v5->_game;
    v5->_game = (NSString *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_maximumNumberOfPlayers, CFSTR("game"));
  objc_msgSend(v4, "encodeInt32:forKey:", *(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2), CFSTR("numberOfPlayers"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_numberOfPlayers, CFSTR("minimumNumberOfPlayers"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_minimumNumberOfPlayers, CFSTR("maximumNumberOfPlayers"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_game, CFSTR("image"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPGameCenterInvitationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPGameCenterInvitationMetadata *v8;

  v4 = +[LPGameCenterInvitationMetadata allocWithZone:](LPGameCenterInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPGameCenterInvitationMetadata game](self, "game");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPGameCenterInvitationMetadata setGame:](v4, "setGame:", v5);

    -[LPGameCenterInvitationMetadata setNumberOfPlayers:](v4, "setNumberOfPlayers:", -[LPGameCenterInvitationMetadata numberOfPlayers](self, "numberOfPlayers"));
    -[LPGameCenterInvitationMetadata setMinimumNumberOfPlayers:](v4, "setMinimumNumberOfPlayers:", -[LPGameCenterInvitationMetadata minimumNumberOfPlayers](self, "minimumNumberOfPlayers"));
    -[LPGameCenterInvitationMetadata setMaximumNumberOfPlayers:](v4, "setMaximumNumberOfPlayers:", -[LPGameCenterInvitationMetadata maximumNumberOfPlayers](self, "maximumNumberOfPlayers"));
    -[LPGameCenterInvitationMetadata image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPGameCenterInvitationMetadata setImage:](v4, "setImage:", v6);

    -[LPGameCenterInvitationMetadata icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPGameCenterInvitationMetadata setIcon:](v4, "setIcon:", v7);

    v8 = v4;
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
  v8.super_class = (Class)LPGameCenterInvitationMetadata;
  if (-[LPGameCenterInvitationMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[3], *(void **)&self->_maximumNumberOfPlayers) & 1) != 0
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2)
        && *((_DWORD *)v6 + 4) == self->_numberOfPlayers
        && *((_DWORD *)v6 + 5) == self->_minimumNumberOfPlayers
        && objectsAreEqual_0(v6[4], self->_game))
      {
        v5 = objectsAreEqual_0(v6[5], self->_image);
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
  return objc_msgSend(*(id *)&self->_maximumNumberOfPlayers, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("image"));
  v3[2](v3, CFSTR("icon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("game"), CFSTR("numberOfPlayers"), CFSTR("minimumNumberOfPlayers"), CFSTR("maximumNumberOfPlayers"), CFSTR("image"), CFSTR("icon"), 0);
}

- (NSString)game
{
  return *(NSString **)&self->_maximumNumberOfPlayers;
}

- (void)setGame:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (LPImage)image
{
  return (LPImage *)self->_game;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (LPImage)icon
{
  return self->_image;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (unsigned)numberOfPlayers
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfPlayers:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
}

- (unsigned)minimumNumberOfPlayers
{
  return self->_numberOfPlayers;
}

- (void)setMinimumNumberOfPlayers:(unsigned int)a3
{
  self->_numberOfPlayers = a3;
}

- (unsigned)maximumNumberOfPlayers
{
  return self->_minimumNumberOfPlayers;
}

- (void)setMaximumNumberOfPlayers:(unsigned int)a3
{
  self->_minimumNumberOfPlayers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfPlayers, 0);
}

- (id)invitationText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Invitation to play %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPGameCenterInvitationMetadata game](self, "game");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)playerCountText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[LPGameCenterInvitationMetadata minimumNumberOfPlayers](self, "minimumNumberOfPlayers")
    && -[LPGameCenterInvitationMetadata maximumNumberOfPlayers](self, "maximumNumberOfPlayers"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("%d-%d Players"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPGameCenterInvitationMetadata minimumNumberOfPlayers](self, "minimumNumberOfPlayers"), -[LPGameCenterInvitationMetadata maximumNumberOfPlayers](self, "maximumNumberOfPlayers"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("%d Player(s)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v4, -[LPGameCenterInvitationMetadata numberOfPlayers](self, "numberOfPlayers"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  return v7;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LPCaptionBarPresentationProperties *v15;
  void *v16;
  void *v17;

  objc_msgSend(a3, "commonPresentationPropertiesForStyle:", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPGameCenterInvitationMetadata image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v4, "setCaptionBar:", v6);

  -[LPGameCenterInvitationMetadata invitationText](self, "invitationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "top");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leading");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v7);

  -[LPGameCenterInvitationMetadata playerCountText](self, "playerCountText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v11);

  v15 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v4, "setMediaTopCaptionBar:", v15);

  -[LPGameCenterInvitationMetadata icon](self, "icon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaTopCaptionBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeadingIcon:", v16);

  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("%@.\n%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPGameCenterInvitationMetadata invitationText](self, "invitationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPGameCenterInvitationMetadata playerCountText](self, "playerCountText");
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
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Invitation to play %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPGameCenterInvitationMetadata game](self, "game");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v7);

  -[LPGameCenterInvitationMetadata image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v8);

  -[LPGameCenterInvitationMetadata icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIcon:", v9);

}

@end
