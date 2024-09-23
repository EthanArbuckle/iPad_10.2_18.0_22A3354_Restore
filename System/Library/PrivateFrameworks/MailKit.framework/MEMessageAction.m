@implementation MEMessageAction

+ (MEMessageAction)moveToTrashAction
{
  MEMessageAction *v2;
  void *v3;
  MEMessageAction *v4;

  v2 = [MEMessageAction alloc];
  +[MEMessageActionDestination trash](MEMessageActionDestination, "trash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:](v2, "initWithDestination:readStatus:flagChange:messageColor:", v3, 1, 0, 0);

  return v4;
}

+ (MEMessageAction)moveToArchiveAction
{
  MEMessageAction *v2;
  void *v3;
  MEMessageAction *v4;

  v2 = [MEMessageAction alloc];
  +[MEMessageActionDestination archive](MEMessageActionDestination, "archive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:](v2, "initWithDestination:readStatus:flagChange:messageColor:", v3, 0, 0, 0);

  return v4;
}

+ (MEMessageAction)moveToJunkAction
{
  MEMessageAction *v2;
  void *v3;
  MEMessageAction *v4;

  v2 = [MEMessageAction alloc];
  +[MEMessageActionDestination junk](MEMessageActionDestination, "junk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:](v2, "initWithDestination:readStatus:flagChange:messageColor:", v3, 0, 0, 0);

  return v4;
}

+ (MEMessageAction)markAsReadAction
{
  return -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:]([MEMessageAction alloc], "initWithDestination:readStatus:flagChange:messageColor:", 0, 1, 0, 0);
}

+ (MEMessageAction)markAsUnreadAction
{
  return -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:]([MEMessageAction alloc], "initWithDestination:readStatus:flagChange:messageColor:", 0, 2, 0, 0);
}

+ (MEMessageAction)flagActionWithFlag:(MEMessageActionFlag)flag
{
  MEMessageActionFlagChange *v3;
  MEMessageAction *v4;

  v3 = -[MEMessageActionFlagChange initWithFlag:]([MEMessageActionFlagChange alloc], "initWithFlag:", flag);
  v4 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:]([MEMessageAction alloc], "initWithDestination:readStatus:flagChange:messageColor:", 0, 0, v3, 0);

  return v4;
}

+ (MEMessageAction)setBackgroundColorActionWithColor:(MEMessageActionMessageColor)color
{
  return -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:]([MEMessageAction alloc], "initWithDestination:readStatus:flagChange:messageColor:", 0, 0, 0, color);
}

- (MEMessageAction)initWithDestination:(id)a3 readStatus:(int64_t)a4 flagChange:(id)a5 messageColor:(int64_t)a6
{
  id v11;
  id v12;
  MEMessageAction *v13;
  MEMessageAction *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MEMessageAction;
  v13 = -[MEMessageAction init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_destination, a3);
    v14->_readStatus = a4;
    objc_storeStrong((id *)&v14->_flagChange, a5);
    v14->_messageColor = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageAction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MEMessageAction *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_readStatus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flagChange"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MEMessageAction initWithDestination:readStatus:flagChange:messageColor:](self, "initWithDestination:readStatus:flagChange:messageColor:", v7, v5, v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_messageColor")));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MEMessageAction destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_destination"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEMessageAction readStatus](self, "readStatus"), CFSTR("EFPropertyKey_readStatus"));
  -[MEMessageAction flagChange](self, "flagChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_flagChange"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[MEMessageAction messageColor](self, "messageColor"), CFSTR("EFPropertyKey_messageColor"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  BOOL v13;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageAction destination](self, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      -[MEMessageAction flagChange](self, "flagChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flagChange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual()
        && (v11 = -[MEMessageAction readStatus](self, "readStatus"), v11 == objc_msgSend(v6, "readStatus")))
      {
        v12 = -[MEMessageAction messageColor](self, "messageColor");
        v13 = v12 == objc_msgSend(v6, "messageColor");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MEMessageAction destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MEMessageAction readStatus](self, "readStatus");
  -[MEMessageAction flagChange](self, "flagChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Message Action: Destination: %@, Read Status: %ld, Flag Change: %@, Message Color: %ld"), v4, v5, v6, -[MEMessageAction messageColor](self, "messageColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MEMessageActionDestination)destination
{
  return self->_destination;
}

- (int64_t)readStatus
{
  return self->_readStatus;
}

- (MEMessageActionFlagChange)flagChange
{
  return self->_flagChange;
}

- (int64_t)messageColor
{
  return self->_messageColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
