@implementation MRPlayerPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRPlayerPath origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setOrigin:", v7);

  -[MRPlayerPath client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setClient:", v9);

  -[MRPlayerPath player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlayer:", v11);

  return v5;
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRPlayer)player
{
  return self->_player;
}

- (void)setClient:(id)a3
{
  MRClient *v4;
  MRClient *client;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath setClient:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MRPlayerPath.m"), 97, CFSTR("Type mismatch, expecting %@ found %@"), v8, objc_opt_class());

    }
  }
  v4 = (MRClient *)objc_msgSend(v9, "copy");
  client = self->_client;
  self->_client = v4;

}

- (void)setOrigin:(id)a3
{
  MROrigin *v4;
  MROrigin *origin;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath setOrigin:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MRPlayerPath.m"), 91, CFSTR("Type mismatch, expecting %@ found %@"), v8, objc_opt_class());

    }
  }
  v4 = (MROrigin *)objc_msgSend(v9, "copy");
  origin = self->_origin;
  self->_origin = v4;

}

- (void)setPlayer:(id)a3
{
  MRPlayer *v4;
  MRPlayer *player;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath setPlayer:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MRPlayerPath.m"), 103, CFSTR("Type mismatch, expecting %@ found %@"), v8, objc_opt_class());

    }
  }
  v4 = (MRPlayer *)objc_msgSend(v9, "copy");
  player = self->_player;
  self->_player = v4;

}

- (MRPlayerPath)initWithOrigin:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRPlayerPath *v11;
  uint64_t v12;
  MROrigin *origin;
  uint64_t v14;
  MRClient *client;
  uint64_t v16;
  MRPlayer *player;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MRPlayerPath;
  v11 = -[MRPlayerPath init](&v28, sel_init);
  if (!v11)
    goto LABEL_14;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath initWithOrigin:client:player:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MRPlayerPath.m"), 55, CFSTR("Type mismatch, expecting %@ found %@"), v21, objc_opt_class());

    if (v9)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath initWithOrigin:client:player:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_opt_class();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("MRPlayerPath.m"), 56, CFSTR("Type mismatch, expecting %@ found %@"), v24, objc_opt_class());

      }
    }
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath initWithOrigin:client:player:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_class();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("MRPlayerPath.m"), 57, CFSTR("Type mismatch, expecting %@ found %@"), v27, objc_opt_class());

    }
  }
  v12 = objc_msgSend(v8, "copy");
  origin = v11->_origin;
  v11->_origin = (MROrigin *)v12;

  if ((objc_msgSend(v9, "isValid") & 1) != 0)
  {
    v14 = objc_msgSend(v9, "copy");
    client = v11->_client;
    v11->_client = (MRClient *)v14;
  }
  else
  {
    client = v11->_client;
    v11->_client = 0;
  }

  v16 = objc_msgSend(v10, "copy");
  player = v11->_player;
  v11->_player = (MRPlayer *)v16;

LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  MRPlayerPath *v6;
  MRPlayerPath *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (MRPlayerPath *)a3;
  if (v6 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[MRPlayerPath origin](v7, "origin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlayerPath origin](self, "origin");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[MRPlayerPath origin](v7, "origin");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlayerPath origin](self, "origin");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[MRPlayerPath client](v7, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlayerPath client](self, "client");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[MRPlayerPath client](v7, "client");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlayerPath client](self, "client");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[MRPlayerPath player](v7, "player");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlayerPath player](self, "player");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[MRPlayerPath player](v7, "player");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlayerPath player](self, "player");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (MRClient)client
{
  return self->_client;
}

- (BOOL)isLocal
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;

  v3 = -[MRPlayerPath isResolved](self, "isResolved");
  if (v3)
  {
    -[MRPlayerPath client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLocal");

    if (!v5)
    {
LABEL_9:
      LOBYTE(v3) = 0;
      return v3;
    }
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportMultiplayerHost");

    -[MRPlayerPath origin](self, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isLocal");
    v10 = v9;
    if (v7)
    {
      if (v9)
      {

        goto LABEL_9;
      }
      -[MRPlayerPath origin](self, "origin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isLocallyHosted");

      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    else
    {

      if (!v10)
        goto LABEL_9;
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isResolved
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[MRPlayerPath origin](self, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MRPlayerPath client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[MRPlayerPath player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[MRPlayerPath client](self, "client");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v6, "processIdentifier") < 1)
        {
          LOBYTE(v8) = 0;
        }
        else
        {
          -[MRPlayerPath client](self, "client");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "hasPlaceholder") ^ 1;

        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)localResolvedPlayerPathFromPlayerPath:(id)a3
{
  MRPlayerPath *v3;
  void *v4;

  v3 = (MRPlayerPath *)a3;
  if (!v3)
    v3 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", 0, 0, 0);
  -[MRPlayerPath localResolvedPlayerPath](v3, "localResolvedPlayerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MRPlayerPath)localResolvedPlayerPath
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MRPlayerPath *v22;

  -[MRPlayerPath origin](self, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copy");

  }
  -[MRPlayerPath client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    +[MRClient localClient](MRClient, "localClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "copy");

  }
  -[MRPlayerPath player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    +[MRPlayer defaultPlayer](MRPlayer, "defaultPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "copy");

  }
  if (!objc_msgSend(v9, "processIdentifier"))
  {
    +[MRClient localClient](MRClient, "localClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProcessIdentifier:", objc_msgSend(v15, "processIdentifier"));

  }
  objc_msgSend(v9, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[MRClient localClient](MRClient, "localClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBundleIdentifier:", v18);

  }
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    +[MRPlayer defaultPlayer](MRPlayer, "defaultPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIdentifier:", v21);

  }
  v22 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v5, v9, v13);

  return v22;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRPlayerPath origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "identifier");
  -[MRPlayerPath client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("origin-%@-%ld/client-%@/player-%@"), v5, v7, v8, v10);

  return v11;
}

- (MRPlayerPath)initWithData:(id)a3
{
  id v4;
  _MRNowPlayingPlayerPathProtobuf *v5;
  MRPlayerPath *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRNowPlayingPlayerPathProtobuf initWithData:]([_MRNowPlayingPlayerPathProtobuf alloc], "initWithData:", v4);

    self = -[MRPlayerPath initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRPlayerPath)initWithProtobuf:(id)a3
{
  id v4;
  MROrigin *v5;
  void *v6;
  MROrigin *v7;
  MRClient *v8;
  void *v9;
  MRClient *v10;
  MRPlayer *v11;
  void *v12;
  id v13;
  MRPlayerPath *v14;

  if (a3)
  {
    v4 = a3;
    v5 = [MROrigin alloc];
    objc_msgSend(v4, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MROrigin initWithProtobuf:](v5, "initWithProtobuf:", v6);

    v8 = [MRClient alloc];
    objc_msgSend(v4, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRClient initWithProtobuf:](v8, "initWithProtobuf:", v9);

    v11 = [MRPlayer alloc];
    objc_msgSend(v4, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[MRPlayer initWithProtobuf:](v11, v12);
    self = -[MRPlayerPath initWithOrigin:client:player:](self, "initWithOrigin:client:player:", v7, v10, v13);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[MROrigin hash](self->_origin, "hash");
  v4 = -[MRClient hash](self->_client, "hash") ^ v3;
  return v4 ^ -[MRPlayer hash](self->_player, "hash");
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlayerPath protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRNowPlayingPlayerPathProtobuf)protobuf
{
  _MRNowPlayingPlayerPathProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int *v8;
  void *v9;

  v3 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
  -[MRPlayerPath origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerPathProtobuf setOrigin:](v3, "setOrigin:", v5);

  -[MRPlayerPath client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protobuf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerPathProtobuf setClient:](v3, "setClient:", v7);

  -[MRPlayerPath player](self, "player");
  v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  -[MRPlayer protobuf](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingPlayerPathProtobuf setPlayer:](v3, "setPlayer:", v9);

  return v3;
}

+ (MRPlayerPath)anyPlayerPath
{
  MRPlayerPath *v2;
  void *v3;
  void *v4;
  void *v5;
  MRPlayerPath *v6;

  v2 = [MRPlayerPath alloc];
  +[MROrigin anyOrigin](MROrigin, "anyOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRClient anyClient](MRClient, "anyClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRPlayer anyPlayer](MRPlayer, "anyPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlayerPath initWithOrigin:client:player:](v2, "initWithOrigin:client:player:", v3, v4, v5);

  return v6;
}

- (BOOL)isSystemMediaApplication
{
  void *v2;
  char v3;

  -[MRPlayerPath client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemMediaApplication");

  return v3;
}

+ (id)localPlayerPath
{
  if (localPlayerPath_onceToken != -1)
    dispatch_once(&localPlayerPath_onceToken, &__block_literal_global_40);
  return (id)localPlayerPath_localPlayerPath;
}

void __31__MRPlayerPath_localPlayerPath__block_invoke()
{
  void *v0;
  void *v1;
  MRPlayerPath *v2;
  void *v3;
  id v4;

  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MRClient localClient](MRClient, "localClient");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRPlayer defaultPlayer](MRPlayer, "defaultPlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v4, v0, v1);
  v3 = (void *)localPlayerPath_localPlayerPath;
  localPlayerPath_localPlayerPath = (uint64_t)v2;

}

- (MRPlayerPath)initWithOrigin:(id)a3 bundleIdentifier:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRClient *v11;
  MRPlayerPath *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MRClient initWithBundleIdentifier:]([MRClient alloc], "initWithBundleIdentifier:", v9);

  v12 = -[MRPlayerPath initWithOrigin:client:player:](self, "initWithOrigin:client:player:", v10, v11, v8);
  return v12;
}

- (MRPlayerPath)skeleton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc((Class)objc_opt_class());
  -[MRPlayerPath origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skeleton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "skeleton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "skeleton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithOrigin:client:player:", v5, v7, v9);

  return (MRPlayerPath *)v10;
}

- (BOOL)isSystemPodcastsApplication
{
  void *v2;
  char v3;

  -[MRPlayerPath client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemPodcastsApplication");

  return v3;
}

- (BOOL)isSystemBooksApplication
{
  void *v2;
  char v3;

  -[MRPlayerPath client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemBooksApplication");

  return v3;
}

- (BOOL)isHomepodDemoApplication
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;

  -[MRPlayerPath client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "isEqualToString:", CFSTR("com.apple.HomePodCannedDemo"));

  -[MRPlayerPath client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ChannelDemoCap"));

  return v5 | v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlayerPath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MRPlayerPath *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v5, v6);

    v5 = 0;
  }
  v7 = -[MRPlayerPath initWithProtobuf:](self, "initWithProtobuf:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRPlayerPath protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (id)playerPathByRedirectingToOrigin:(id)a3
{
  id v4;
  MRPlayerPath *v5;
  void *v6;
  MRClient *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRPlayer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MRPlayer *v17;
  void *v18;
  void *v19;
  int IsSystemMediaApplication;
  __CFString **v21;
  void *v22;
  void *v23;
  int IsSystemPodcastApplication;
  void *v25;
  void *v26;
  int IsSystemBooksApplication;
  __CFString *v28;
  void *v29;
  void *v31;
  void *v32;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRPlayerPath playerPathByRedirectingToOrigin:]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("MRPlayerPath.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  v5 = objc_alloc_init(MRPlayerPath);
  -[MRPlayerPath setOrigin:](v5, "setOrigin:", v4);
  -[MRPlayerPath client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MRClient);
    -[MRPlayerPath setClient:](v5, "setClient:", v7);

    -[MRPlayerPath client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayerPath client](v5, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBundleIdentifier:", v9);

  }
  -[MRPlayerPath player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [MRPlayer alloc];
    -[MRPlayerPath player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayerPath player](self, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MRPlayer initWithIdentifier:displayName:](v12, "initWithIdentifier:displayName:", v14, v16);
    -[MRPlayerPath setPlayer:](v5, "setPlayer:", v17);

  }
  -[MRPlayerPath client](self, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v19);

  if (IsSystemMediaApplication)
  {
    v21 = kMRMediaRemoteSystemMediaApplicationDisplayIdentifier;
LABEL_13:
    v28 = *v21;
    -[MRPlayerPath client](v5, "client");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBundleIdentifier:", v28);

    goto LABEL_14;
  }
  -[MRPlayerPath client](self, "client");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v23);

  if (IsSystemPodcastApplication)
  {
    v21 = kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier;
    goto LABEL_13;
  }
  -[MRPlayerPath client](self, "client");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  IsSystemBooksApplication = MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v26);

  if (IsSystemBooksApplication)
  {
    v21 = kMRMediaRemoteSystemBooksApplicationDisplayIdentifier;
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (id)playerPathByLocalizingWithOrigin:(id)a3
{
  id v4;
  MRPlayerPath *v5;
  void *v6;
  void *v7;
  MRPlayerPath *v8;

  v4 = a3;
  v5 = [MRPlayerPath alloc];
  -[MRPlayerPath client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRPlayerPath initWithOrigin:client:player:](v5, "initWithOrigin:client:player:", v4, v6, v7);

  return v8;
}

@end
