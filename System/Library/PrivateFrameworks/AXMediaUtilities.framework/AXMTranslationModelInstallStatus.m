@implementation AXMTranslationModelInstallStatus

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
