@implementation INMediaDestination

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  void *v4;
  id v6;
  INMediaDestinationType v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = -[INMediaDestination mediaDestinationType](self, "mediaDestinationType");
  if ((unint64_t)v7 >= INMediaDestinationTypePlaylist)
  {
    if (v7 == INMediaDestinationTypePlaylist)
    {
      -[INMediaDestination playlistName](self, "playlistName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        INLocalizedStringWithLocalizer(CFSTR("“%@”"), CFSTR("“%@”"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[INMediaDestination playlistName](self, "playlistName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        INLocalizedStringWithLocalizer(CFSTR("a playlist"), CFSTR("a playlist"), v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    INLocalizedStringWithLocalizer(CFSTR("library"), CFSTR("library"), v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (INMediaDestination)initWithMediaDestinationType:(int64_t)a3 playlistName:(id)a4
{
  id v6;
  INMediaDestination *v7;
  INMediaDestination *v8;
  uint64_t v9;
  NSString *playlistName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INMediaDestination;
  v7 = -[INMediaDestination init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_mediaDestinationType = a3;
    v9 = objc_msgSend(v6, "copy");
    playlistName = v8->_playlistName;
    v8->_playlistName = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaDestinationType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_playlistName, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INMediaDestination *v4;
  INMediaDestination *v5;
  NSString *playlistName;
  BOOL v7;

  v4 = (INMediaDestination *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = 0;
      if (self->_mediaDestinationType == v5->_mediaDestinationType)
      {
        playlistName = self->_playlistName;
        if (playlistName == v5->_playlistName || -[NSString isEqual:](playlistName, "isEqual:"))
          v7 = 1;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INMediaDestination)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  INMediaDestination *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaDestinationType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlistName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INMediaDestination initWithMediaDestinationType:playlistName:](self, "initWithMediaDestinationType:playlistName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaDestinationType;
  id v5;

  mediaDestinationType = self->_mediaDestinationType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", mediaDestinationType, CFSTR("mediaDestinationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playlistName, CFSTR("playlistName"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int64_t mediaDestinationType;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  mediaDestinationType = self->_mediaDestinationType;
  v9 = CFSTR("unknown");
  if (mediaDestinationType == 2)
    v9 = CFSTR("playlist");
  if (mediaDestinationType == 1)
    v10 = CFSTR("library");
  else
    v10 = (__CFString *)v9;
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("mediaDestinationType"));

  objc_msgSend(v6, "encodeObject:", self->_playlistName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("playlistName"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INMediaDestination descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INMediaDestination;
  -[INMediaDestination description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMediaDestination _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *playlistName;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("mediaDestinationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaDestinationType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("playlistName");
  v9[0] = v3;
  playlistName = self->_playlistName;
  v5 = playlistName;
  if (!playlistName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!playlistName)

  return v6;
}

- (INMediaDestinationType)mediaDestinationType
{
  return self->_mediaDestinationType;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistName, 0);
}

+ (INMediaDestination)libraryDestination
{
  return (INMediaDestination *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMediaDestinationType:playlistName:", 1, 0);
}

+ (INMediaDestination)playlistDestinationWithName:(NSString *)playlistName
{
  NSString *v4;
  void *v5;

  v4 = playlistName;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaDestinationType:playlistName:", 2, v4);

  return (INMediaDestination *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaDestinationType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INMediaDestinationTypeWithString(v9);

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playlistName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaDestinationType:playlistName:", v10, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
