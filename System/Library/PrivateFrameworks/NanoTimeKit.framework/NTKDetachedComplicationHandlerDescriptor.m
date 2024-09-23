@implementation NTKDetachedComplicationHandlerDescriptor

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_family = a3;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (void)setComplication:(id)a3
{
  objc_storeStrong((id *)&self->_complication, a3);
}

- (CDTemplateComplicationDisplay)display
{
  return (CDTemplateComplicationDisplay *)objc_loadWeakRetained((id *)&self->_display);
}

- (void)setDisplay:(id)a3
{
  objc_storeWeak((id *)&self->_display, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_display);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
