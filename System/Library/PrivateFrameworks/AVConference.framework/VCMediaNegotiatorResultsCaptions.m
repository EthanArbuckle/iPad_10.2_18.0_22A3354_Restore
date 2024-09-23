@implementation VCMediaNegotiatorResultsCaptions

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsCaptions;
  -[VCMediaNegotiatorResultsCaptions dealloc](&v3, sel_dealloc);
}

- (NSSet)localLanguages
{
  return self->_localLanguages;
}

- (void)setLocalLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSSet)remoteLanguages
{
  return self->_remoteLanguages;
}

- (void)setRemoteLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)remoteCanDisplayCaptions
{
  return self->_remoteCanDisplayCaptions;
}

- (void)setRemoteCanDisplayCaptions:(BOOL)a3
{
  self->_remoteCanDisplayCaptions = a3;
}

@end
