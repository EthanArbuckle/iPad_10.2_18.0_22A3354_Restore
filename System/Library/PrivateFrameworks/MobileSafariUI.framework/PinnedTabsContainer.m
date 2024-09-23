@implementation PinnedTabsContainer

+ (id)containerWithPrivateBrowsing:(BOOL)a3
{
  PinnedTabsContainer *v4;

  v4 = objc_alloc_init(PinnedTabsContainer);
  v4->_privateBrowsingEnabled = a3;
  v4->_isInDefaultProfile = 1;
  objc_storeStrong((id *)&v4->_activeProfileIdentifier, (id)*MEMORY[0x1E0D89E20]);
  return v4;
}

+ (id)containerWithActiveProfileIdentifier:(id)a3
{
  id v3;
  PinnedTabsContainer *v4;
  uint64_t v5;
  NSString *activeProfileIdentifier;

  v3 = a3;
  v4 = objc_alloc_init(PinnedTabsContainer);
  v5 = objc_msgSend(v3, "copy");

  activeProfileIdentifier = v4->_activeProfileIdentifier;
  v4->_activeProfileIdentifier = (NSString *)v5;

  return v4;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (BOOL)isInDefaultProfile
{
  return self->_isInDefaultProfile;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
}

@end
