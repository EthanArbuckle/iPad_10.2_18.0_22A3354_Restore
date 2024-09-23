@implementation MOGenericInteraction

- (MOGenericInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOGenericInteraction;
  return -[MOGenericInteraction init](&v3, sel_init);
}

- (MOGenericInteraction)initWithParticipants:(id)a3
{
  id v4;
  MOGenericInteraction *v5;
  uint64_t v6;
  NSArray *participants;
  uint64_t v8;
  NSString *interactionKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOGenericInteraction;
  v5 = -[MOGenericInteraction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v6 = objc_claimAutoreleasedReturnValue();
    participants = v5->_participants;
    v5->_participants = (NSArray *)v6;

    -[NSArray componentsJoinedByString:](v5->_participants, "componentsJoinedByString:", CFSTR("_"));
    v8 = objc_claimAutoreleasedReturnValue();
    interactionKey = v5->_interactionKey;
    v5->_interactionKey = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MOGenericInteraction *v4;
  MOGenericInteraction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (MOGenericInteraction *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MOGenericInteraction participants](self, "participants");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[MOGenericInteraction participants](v5, "participants");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v18 = 0;
          goto LABEL_13;
        }
        v9 = (void *)v8;
        -[MOGenericInteraction participants](self, "participants");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        -[MOGenericInteraction participants](v5, "participants");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v11 == v13)
        {
          -[MOGenericInteraction interactionKey](self, "interactionKey");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            -[MOGenericInteraction interactionKey](v5, "interactionKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              -[MOGenericInteraction interactionKey](self, "interactionKey");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              -[MOGenericInteraction interactionKey](v5, "interactionKey");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v7, "isEqualToString:", v17);

LABEL_13:
              goto LABEL_14;
            }
          }
        }
      }
      v18 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v18 = 0;
  }
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_interactionKey, "hash");
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSString)interactionKey
{
  return self->_interactionKey;
}

- (void)setInteractionKey:(id)a3
{
  objc_storeStrong((id *)&self->_interactionKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionKey, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
