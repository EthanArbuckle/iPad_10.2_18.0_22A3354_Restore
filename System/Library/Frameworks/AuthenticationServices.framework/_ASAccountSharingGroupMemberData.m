@implementation _ASAccountSharingGroupMemberData

- (NSString)displayName
{
  NSString *contactDisplayName;

  contactDisplayName = self->_contactDisplayName;
  if (contactDisplayName)
    return contactDisplayName;
  contactDisplayName = self->_shortContactDisplayName;
  if (contactDisplayName)
    return contactDisplayName;
  else
    return self->_handleForDisplay;
}

- (BOOL)isEqual:(id)a3
{
  _ASAccountSharingGroupMemberData *v4;
  _ASAccountSharingGroupMemberData *v5;
  void *v6;
  void *v7;
  NSString *handle;
  void *v9;
  NSString *handleForDisplay;
  void *v11;
  UIImage *avatarImageForGroupMemberCell;
  void *v13;
  int64_t groupPermissionLevel;
  _BOOL4 isMeParticipant;
  int64_t inviteStatus;
  void *v17;
  void *v18;
  char v19;

  v4 = (_ASAccountSharingGroupMemberData *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_ASAccountSharingGroupMemberData contactDisplayName](v5, "contactDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        -[_ASAccountSharingGroupMemberData shortContactDisplayName](v5, "shortContactDisplayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          handle = self->_handle;
          -[_ASAccountSharingGroupMemberData handle](v5, "handle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](handle, "isEqualToString:", v9))
          {
            handleForDisplay = self->_handleForDisplay;
            -[_ASAccountSharingGroupMemberData handleForDisplay](v5, "handleForDisplay");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](handleForDisplay, "isEqualToString:", v11))
            {
              avatarImageForGroupMemberCell = self->_avatarImageForGroupMemberCell;
              -[_ASAccountSharingGroupMemberData avatarImageForGroupMemberCell](v5, "avatarImageForGroupMemberCell");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[UIImage isEqual:](avatarImageForGroupMemberCell, "isEqual:", v13)
                && (groupPermissionLevel = self->_groupPermissionLevel,
                    groupPermissionLevel == -[_ASAccountSharingGroupMemberData groupPermissionLevel](v5, "groupPermissionLevel"))&& (isMeParticipant = self->_isMeParticipant, isMeParticipant == -[_ASAccountSharingGroupMemberData isMeParticipant](v5, "isMeParticipant"))&& (inviteStatus = self->_inviteStatus, inviteStatus == -[_ASAccountSharingGroupMemberData inviteStatus](v5, "inviteStatus")))
              {
                -[_ASAccountSharingGroupMemberData contact](v5, "contact");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual())
                {
                  -[_ASAccountSharingGroupMemberData participantID](v5, "participantID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = WBSIsEqual();

                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  int64_t inviteStatus;
  int64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_contactDisplayName, "hash");
  v4 = -[NSString hash](self->_shortContactDisplayName, "hash") ^ v3;
  v5 = -[NSString hash](self->_handle, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_handleForDisplay, "hash");
  v7 = -[UIImage hash](self->_avatarImageForGroupMemberCell, "hash");
  inviteStatus = self->_inviteStatus;
  v9 = v6 ^ v7 ^ self->_groupPermissionLevel ^ self->_isMeParticipant;
  v10 = inviteStatus ^ -[CNContact hash](self->_contact, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_participantID, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  int64_t groupPermissionLevel;
  int64_t inviteStatus;
  NSString *participantID;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v14 = *(_OWORD *)&self->_contactDisplayName;
  v13 = *(_OWORD *)&self->_handle;
  if (self->_isMeParticipant)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  groupPermissionLevel = self->_groupPermissionLevel;
  inviteStatus = self->_inviteStatus;
  participantID = self->_participantID;
  if (self->_contact)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; contactDisplayName = %@; shortContactDisplayName = %@; handle = %@; handleForDisplay = %@; permissionLevel = %lld; isMeParticipant = %@; inviteStatus = %lld>; hasContact = %@; participantID: %@;"),
    v4,
    self,
    v14,
    v13,
    groupPermissionLevel,
    v10,
    inviteStatus,
    v9,
    participantID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)handleForDisplay
{
  return self->_handleForDisplay;
}

- (void)setHandleForDisplay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contactDisplayName
{
  return self->_contactDisplayName;
}

- (void)setContactDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)shortContactDisplayName
{
  return self->_shortContactDisplayName;
}

- (void)setShortContactDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)avatarImageForGroupMemberCell
{
  return self->_avatarImageForGroupMemberCell;
}

- (void)setAvatarImageForGroupMemberCell:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageForGroupMemberCell, a3);
}

- (int64_t)groupPermissionLevel
{
  return self->_groupPermissionLevel;
}

- (void)setGroupPermissionLevel:(int64_t)a3
{
  self->_groupPermissionLevel = a3;
}

- (BOOL)isMeParticipant
{
  return self->_isMeParticipant;
}

- (void)setIsMeParticipant:(BOOL)a3
{
  self->_isMeParticipant = a3;
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(int64_t)a3
{
  self->_inviteStatus = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarImageForGroupMemberCell, 0);
  objc_storeStrong((id *)&self->_shortContactDisplayName, 0);
  objc_storeStrong((id *)&self->_contactDisplayName, 0);
  objc_storeStrong((id *)&self->_handleForDisplay, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
