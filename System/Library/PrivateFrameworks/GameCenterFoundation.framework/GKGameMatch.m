@implementation GKGameMatch

- (GKGameMatch)initWithInternalRepresentation:(id)a3 game:(id)a4
{
  id v6;
  id v7;
  GKGameMatch *v8;
  GKGameMatch *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  GKPlayer *player;
  void *v14;
  GKGameRecord *v15;
  void *v16;
  uint64_t v17;
  GKGame *game;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[GKInternalRepresentation internalRepresentation](GKRecentMatchInternal, "internalRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20.receiver = self;
  v20.super_class = (Class)GKGameMatch;
  v8 = -[GKGameMatch init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_game, a4);
    -[GKRecentMatchInternal player](v9->_internal, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[GKRecentMatchInternal player](v9->_internal, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      player = v9->_player;
      v9->_player = (GKPlayer *)v12;

      if (!v9->_game)
      {
        -[GKRecentMatchInternal game](v9->_internal, "game");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [GKGameRecord alloc];
          -[GKRecentMatchInternal game](v9->_internal, "game");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[GKGameRecord initWithInternalRepresentation:player:](v15, "initWithInternalRepresentation:player:", v16, v9->_player);
          game = v9->_game;
          v9->_game = (GKGame *)v17;

        }
      }
    }
  }

  return v9;
}

- (GKGameMatch)init
{
  return -[GKGameMatch initWithInternalRepresentation:game:](self, "initWithInternalRepresentation:game:", 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[GKGameMatch player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameMatch game](self, "game");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  objc_msgSend(v3, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> %@ %@ game:%@"), v6, self, v3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKGameMatch;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKGameMatch;
  -[GKGameMatch methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKGameMatch forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKGameMatch;
  if (-[GKGameMatch respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKGameMatch forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  int v4;

  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v4 = GKApplicationLinkedOnOrAfter();
      if (v4)
        LOBYTE(v4) = +[GKRecentMatchInternal instancesRespondToSelector:](GKRecentMatchInternal, "instancesRespondToSelector:", a3);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKGameMatch internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKGameMatch internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKGameMatch internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKGameMatch internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (GKRecentMatchInternal)internal
{
  return (GKRecentMatchInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
