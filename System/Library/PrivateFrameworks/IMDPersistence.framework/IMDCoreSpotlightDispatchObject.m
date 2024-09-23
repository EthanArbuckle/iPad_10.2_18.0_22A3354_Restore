@implementation IMDCoreSpotlightDispatchObject

+ (id)sharedInstance
{
  if (qword_1ED0D39C0 != -1)
    dispatch_once(&qword_1ED0D39C0, &unk_1E5AB7E58);
  return (id)qword_1ED0D3AA8;
}

- (IMDCoreSpotlightDispatchObject)init
{
  IMDCoreSpotlightDispatchObject *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDCoreSpotlightDispatchObject;
  result = -[IMDCoreSpotlightDispatchObject init](&v3, sel_init);
  if (result)
    *(_DWORD *)&result->_allowsOverrideOfObjects = 16843009;
  return result;
}

- (CRRecentContactsLibrary)recentsInstance
{
  return self->_recentsInstance;
}

- (void)setRecentsInstance:(id)a3
{
  objc_storeStrong((id *)&self->_recentsInstance, a3);
}

- (BOOL)allowsOverrideOfObjects
{
  return self->_allowsOverrideOfObjects;
}

- (void)setAllowsOverrideOfObjects:(BOOL)a3
{
  self->_allowsOverrideOfObjects = a3;
}

- (BOOL)shouldAddToSuggestions
{
  return self->_shouldAddToSuggestions;
}

- (void)setShouldAddToSuggestions:(BOOL)a3
{
  self->_shouldAddToSuggestions = a3;
}

- (BOOL)shouldAddToSpotlight
{
  return self->_shouldAddToSpotlight;
}

- (void)setShouldAddToSpotlight:(BOOL)a3
{
  self->_shouldAddToSpotlight = a3;
}

- (BOOL)shouldAddToCoreRecents
{
  return self->_shouldAddToCoreRecents;
}

- (void)setShouldAddToCoreRecents:(BOOL)a3
{
  self->_shouldAddToCoreRecents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsInstance, 0);
}

@end
