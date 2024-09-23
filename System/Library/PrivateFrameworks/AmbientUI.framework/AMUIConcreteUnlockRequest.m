@implementation AMUIConcreteUnlockRequest

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)unlockDestination
{
  return self->unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->unlockDestination, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
