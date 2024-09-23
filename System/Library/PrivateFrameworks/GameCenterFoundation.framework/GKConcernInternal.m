@implementation GKConcernInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_631 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_631, &__block_literal_global_632);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_630;
}

void __44__GKConcernInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("player");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("concernID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("message");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_630;
  secureCodedPropertyKeys_sSecureCodedKeys_630 = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int concernID;
  NSString *message;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    concernID = self->_concernID;
    if (concernID == objc_msgSend(v5, "concernID"))
    {
      message = self->_message;
      objc_msgSend(v5, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSString isEqualToString:](message, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_concernID;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)concernID
{
  return self->_concernID;
}

- (void)setConcernID:(unsigned int)a3
{
  self->_concernID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
