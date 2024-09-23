@implementation _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  NSString *originatorDisplayName;
  _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata;
  v5 = -[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("originatorDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatorDisplayName = v5->_originatorDisplayName;
    v5->_originatorDisplayName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *message;
  id v5;

  message = self->_message;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", message, CFSTR("message"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_originatorDisplayName, CFSTR("originatorDisplayName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *v4;
  void *v5;
  void *v6;
  _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *v7;

  v4 = +[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata allocWithZone:](_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata setMessage:](v4, "setMessage:", v5);

    -[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata originatorDisplayName](self, "originatorDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata setOriginatorDisplayName:](v4, "setOriginatorDisplayName:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata;
  if (-[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_message && !objc_msgSend((id)v7, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v8 = v6[3];
        if (v8 | (unint64_t)self->_originatorDisplayName)
          v5 = objc_msgSend((id)v8, "isEqual:");
        else
          v5 = 1;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_message, "hash");
  return -[NSString hash](self->_originatorDisplayName, "hash") ^ v3;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("message"), CFSTR("originatorDisplayName"), 0);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)originatorDisplayName
{
  return self->_originatorDisplayName;
}

- (void)setOriginatorDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorDisplayName, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
