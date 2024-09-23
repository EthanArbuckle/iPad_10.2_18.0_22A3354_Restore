@implementation LANotificationOfBooleanState

- (BOOL)BOOLValue
{
  void *v3;
  void *v4;
  char v5;

  -[LANotification value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LANotification value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)darwinNotificationForValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LANotificationOfBooleanState darwinNotificationForBoolValue:](self, "darwinNotificationForBoolValue:", objc_msgSend(v4, "BOOLValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  return 0;
}

+ (void)postNotificationWithNewBoolState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNewValue:oldValue:", v4, v5);

}

- (BOOL)oldBoolValue
{
  return self->_oldBoolValue;
}

@end
