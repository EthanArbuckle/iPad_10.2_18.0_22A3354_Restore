@implementation DNDMutableSystemAction

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->super._action, a3);
}

- (void)setReverseAction:(id)a3
{
  objc_storeStrong((id *)&self->super._reverseAction, a3);
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSystemAction initWithAction:reverseAction:enabled:](+[DNDSystemAction allocWithZone:](DNDSystemAction, "allocWithZone:", a3), "initWithAction:reverseAction:enabled:", self->super._action, self->super._reverseAction, self->super._enabled);
}

@end
