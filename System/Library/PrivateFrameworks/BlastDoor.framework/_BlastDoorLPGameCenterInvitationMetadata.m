@implementation _BlastDoorLPGameCenterInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPGameCenterInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPGameCenterInvitationMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *game;
  uint64_t v10;
  _BlastDoorLPImage *image;
  _BlastDoorLPGameCenterInvitationMetadata *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPGameCenterInvitationMetadata;
  v5 = -[_BlastDoorLPGameCenterInvitationMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("game"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_maximumNumberOfPlayers;
    *(_QWORD *)&v5->_maximumNumberOfPlayers = v6;

    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("numberOfPlayers"));
    v5->_numberOfPlayers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minimumNumberOfPlayers"));
    v5->_minimumNumberOfPlayers = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maximumNumberOfPlayers"));
    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v8 = objc_claimAutoreleasedReturnValue();
    game = v5->_game;
    v5->_game = (NSString *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->_maximumNumberOfPlayers;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("game"));
  objc_msgSend(v5, "encodeInt32:forKey:", *((unsigned int *)&self->super.__dummyPropertyForObservation + 1), CFSTR("numberOfPlayers"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_numberOfPlayers, CFSTR("minimumNumberOfPlayers"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_minimumNumberOfPlayers, CFSTR("maximumNumberOfPlayers"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_game, CFSTR("image"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPGameCenterInvitationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  _BlastDoorLPGameCenterInvitationMetadata *v8;

  v4 = +[_BlastDoorLPGameCenterInvitationMetadata allocWithZone:](_BlastDoorLPGameCenterInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPGameCenterInvitationMetadata game](self, "game");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPGameCenterInvitationMetadata setGame:](v4, "setGame:", v5);

    -[_BlastDoorLPGameCenterInvitationMetadata setNumberOfPlayers:](v4, "setNumberOfPlayers:", -[_BlastDoorLPGameCenterInvitationMetadata numberOfPlayers](self, "numberOfPlayers"));
    -[_BlastDoorLPGameCenterInvitationMetadata setMinimumNumberOfPlayers:](v4, "setMinimumNumberOfPlayers:", -[_BlastDoorLPGameCenterInvitationMetadata minimumNumberOfPlayers](self, "minimumNumberOfPlayers"));
    -[_BlastDoorLPGameCenterInvitationMetadata setMaximumNumberOfPlayers:](v4, "setMaximumNumberOfPlayers:", -[_BlastDoorLPGameCenterInvitationMetadata maximumNumberOfPlayers](self, "maximumNumberOfPlayers"));
    -[_BlastDoorLPGameCenterInvitationMetadata image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPGameCenterInvitationMetadata setImage:](v4, "setImage:", v6);

    -[_BlastDoorLPGameCenterInvitationMetadata icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPGameCenterInvitationMetadata setIcon:](v4, "setIcon:", v7);

    v8 = v4;
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
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPGameCenterInvitationMetadata;
  if (-[_BlastDoorLPGameCenterInvitationMetadata isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[3];
      if ((!(v7 | *(_QWORD *)&self->_maximumNumberOfPlayers) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1)
        && *((_DWORD *)v6 + 4) == self->_numberOfPlayers
        && *((_DWORD *)v6 + 5) == self->_minimumNumberOfPlayers
        && ((v8 = v6[4], !(v8 | (unint64_t)self->_game)) || objc_msgSend((id)v8, "isEqual:")))
      {
        v9 = v6[5];
        if (v9 | (unint64_t)self->_image)
          v5 = objc_msgSend((id)v9, "isEqual:");
        else
          v5 = 1;
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
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("icon"));

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

- (_BlastDoorLPImage)image
{
  return (_BlastDoorLPImage *)self->_game;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (_BlastDoorLPImage)icon
{
  return self->_image;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (unsigned)numberOfPlayers
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfPlayers:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
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

@end
