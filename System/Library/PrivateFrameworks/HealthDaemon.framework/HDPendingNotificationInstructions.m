@implementation HDPendingNotificationInstructions

- (HDPendingNotificationInstructions)initWithAction:(int64_t)a3 instructions:(id)a4
{
  id v6;
  HDPendingNotificationInstructions *v7;
  HDPendingNotificationInstructions *v8;
  uint64_t v9;
  NSSet *instructions;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDPendingNotificationInstructions;
  v7 = -[HDPendingNotificationInstructions init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_action = a3;
    v9 = objc_msgSend(v6, "copy");
    instructions = v8->_instructions;
    v8->_instructions = (NSSet *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromHKNotificationInstructionAction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDPendingNotificationInstructions messageIdentifiers](self, "messageIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDPendingNotificationInstructions categoryIdentifiers](self, "categoryIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@ mIDs:%@, cIDs:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)messageIdentifiers
{
  return (NSSet *)-[NSSet hk_map:](self->_instructions, "hk_map:", &__block_literal_global_166);
}

uint64_t __55__HDPendingNotificationInstructions_messageIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "messageIdentifier");
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)-[NSSet hk_map:](self->_instructions, "hk_map:", &__block_literal_global_214_3);
}

uint64_t __56__HDPendingNotificationInstructions_categoryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "categoryIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  HDPendingNotificationInstructions *v4;
  HDPendingNotificationInstructions *v5;
  NSSet *instructions;
  NSSet *v7;
  char v8;

  v4 = (HDPendingNotificationInstructions *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_action != v5->_action)
        goto LABEL_9;
      instructions = self->_instructions;
      v7 = v5->_instructions;
      if (instructions == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSSet isEqual:](instructions, "isEqual:");
      else
LABEL_9:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  int64_t action;

  action = self->_action;
  return -[NSSet hash](self->_instructions, "hash") ^ action;
}

- (int64_t)action
{
  return self->_action;
}

- (NSSet)instructions
{
  return self->_instructions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
}

@end
