@implementation DNDMutableAppAction

- (void)setAction:(id)a3
{
  LNAction *v4;
  LNAction *rawAction;
  void *v6;
  NSString *v7;
  NSString *identifier;
  NSData *encodedAction;
  id v10;

  v10 = a3;
  if ((-[LNAction isEqual:](self->super._rawAction, "isEqual:") & 1) == 0)
  {
    v4 = (LNAction *)objc_msgSend(v10, "copy");
    rawAction = self->super._rawAction;
    self->super._rawAction = v4;

    objc_msgSend(v10, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSString *)objc_msgSend(v6, "copy");
    identifier = self->super._identifier;
    self->super._identifier = v7;

    encodedAction = self->super._encodedAction;
    self->super._encodedAction = 0;

  }
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

@end
