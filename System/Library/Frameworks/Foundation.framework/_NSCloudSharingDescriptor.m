@implementation _NSCloudSharingDescriptor

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSCloudSharingDescriptor;
  -[_NSCloudSharingDescriptor dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSCloudSharingDescriptor)initWithCoder:(id)a3
{
  self->_operation = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSShareOperation"));
  self->_invitationsSentViaThirdPartyService = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSShareViaThirdParty"));
  self->_publicShare = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSSharePublic"));
  self->_numberOfInvitations = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSShareNumberOfInviations"));
  self->_sharedContentType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSShareContentType"));
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_operation, CFSTR("NSShareOperation"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_invitationsSentViaThirdPartyService, CFSTR("NSShareViaThirdParty"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_publicShare, CFSTR("NSSharePublic"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_numberOfInvitations, CFSTR("NSShareNumberOfInviations"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sharedContentType, CFSTR("NSShareContentType"));
}

- (id)_variantSubstrings
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  v5 = self->_operation - 1;
  if (v5 < 3)
  {
    v6 = off_1E0F4D988[v5];
LABEL_13:
    objc_msgSend(v4, "addObject:", v6);
    return v4;
  }
  if (self->_publicShare)
  {
    v7 = CFSTR("Public");
LABEL_9:
    objc_msgSend(v3, "addObject:", v7);
    goto LABEL_10;
  }
  if (self->_invitationsSentViaThirdPartyService)
  {
    v7 = CFSTR("3rdParty");
    goto LABEL_9;
  }
  if (self->_numberOfInvitations >= 2)
  {
    v7 = CFSTR("Multiple");
    goto LABEL_9;
  }
LABEL_10:
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, (uint64_t)CFSTR("public.presentation"))|| -[NSString isEqualToString:](self->_sharedContentType, "isEqualToString:", CFSTR("key")))
  {
    v6 = CFSTR("Presentation");
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, (uint64_t)CFSTR("public.spreadsheet"))|| -[NSString isEqualToString:](self->_sharedContentType, "isEqualToString:", CFSTR("numbers")))
  {
    v6 = CFSTR("Spreadsheet");
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, (uint64_t)CFSTR("com.apple.notes.note")))
  {
    v6 = CFSTR("Note");
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, (uint64_t)CFSTR("com.apple.iwork.pages.pages"))|| -[NSString isEqualToString:](self->_sharedContentType, "isEqualToString:", CFSTR("pages")))
  {
    v6 = CFSTR("Document");
    goto LABEL_13;
  }
  return v4;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (BOOL)invitationsSentViaThirdPartyService
{
  return self->_invitationsSentViaThirdPartyService;
}

- (void)setInvitationsSentViaThirdPartyService:(BOOL)a3
{
  self->_invitationsSentViaThirdPartyService = a3;
}

- (BOOL)publicShare
{
  return self->_publicShare;
}

- (void)setPublicShare:(BOOL)a3
{
  self->_publicShare = a3;
}

- (int64_t)numberOfInvitations
{
  return self->_numberOfInvitations;
}

- (void)setNumberOfInvitations:(int64_t)a3
{
  self->_numberOfInvitations = a3;
}

- (NSString)sharedContentType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedContentType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
