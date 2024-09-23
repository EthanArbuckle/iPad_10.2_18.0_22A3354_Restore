@implementation MAMusicHapticStatusPair

- (id)observer
{
  return self->observer;
}

- (void)setObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->observer, 0);
}

@end
