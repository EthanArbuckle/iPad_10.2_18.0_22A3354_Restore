@implementation GKMultiplayerParticipant

- (GKMultiplayerParticipant)init
{
  GKMultiplayerParticipant *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerParticipant;
  result = -[GKMultiplayerParticipant init](&v3, sel_init);
  if (result)
    result->_status = 7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  GKMultiplayerParticipant *v4;
  GKMultiplayerParticipant *v5;
  int64_t type;
  int64_t status;
  GKPlayer *player;
  void *v9;
  char v10;

  v4 = (GKMultiplayerParticipant *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[GKMultiplayerParticipant type](v5, "type")
        && (status = self->_status, status == -[GKMultiplayerParticipant status](v5, "status")))
      {
        player = self->_player;
        -[GKMultiplayerParticipant player](v5, "player");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[GKPlayer isEqual:](player, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_status ^ self->_type;
  return v2 ^ -[GKPlayer hash](self->_player, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKMultiplayerParticipant *v4;

  v4 = objc_alloc_init(GKMultiplayerParticipant);
  -[GKMultiplayerParticipant setType:](v4, "setType:", self->_type);
  -[GKMultiplayerParticipant setPlayer:](v4, "setPlayer:", self->_player);
  -[GKMultiplayerParticipant setStatus:](v4, "setStatus:", self->_status);
  -[GKMultiplayerParticipant setNumber:](v4, "setNumber:", self->_number);
  return v4;
}

- (NSString)statusName
{
  return (NSString *)+[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", -[GKMultiplayerParticipant status](self, "status"));
}

- (id)description
{
  int64_t type;
  void *v4;
  GKPlayer *player;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  type = self->_type;
  if (type != 2)
  {
    if (type == 1)
    {
      v7 = CFSTR("Automatch");
      goto LABEL_7;
    }
    if (type)
    {
      v7 = CFSTR("Add");
      goto LABEL_7;
    }
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  player = self->_player;
  -[GKMultiplayerParticipant statusName](self, "statusName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" player = %@, status = %@"), player, v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerParticipant;
  -[GKMultiplayerParticipant description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringFromGKMultiplayerParticipantStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 0x15)
    return CFSTR("Unknown");
  else
    return off_1E59C5580[a3];
}

+ (id)allStatuses
{
  return &unk_1E5A5EB90;
}

- (BOOL)isSharePlayInvitee
{
  void *v2;
  void *v3;
  BOOL v4;

  -[GKMultiplayerParticipant player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (BOOL)isPlaceHolderItem
{
  return self->_isPlaceHolderItem;
}

- (void)setIsPlaceHolderItem:(BOOL)a3
{
  self->_isPlaceHolderItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
