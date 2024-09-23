@implementation NSManagedObjectID(Shared)

- (uint64_t)ic_isModernFolderType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isContainerType
{
  if ((objc_msgSend(a1, "ic_isModernContainerType") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_isLegacyContainerType");
}

- (uint64_t)ic_isNoteType
{
  if ((objc_msgSend(a1, "ic_isModernNoteType") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_isLegacyNoteType");
}

- (uint64_t)ic_isModernNoteType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isModernContainerType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isLegacyFolderType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isModernAccountType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isLegacyAccountType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isLegacyNoteType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isLegacyContainerType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isModernType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "entity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectClassName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("IC"));

  return v3;
}

- (uint64_t)ic_isLegacyType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "entity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectClassName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("IC")) ^ 1;

  return v3;
}

- (uint64_t)ic_isModernAccountProxyType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isAccountType
{
  if ((objc_msgSend(a1, "ic_isModernAccountType") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_isLegacyAccountType");
}

- (uint64_t)ic_isFolderType
{
  if ((objc_msgSend(a1, "ic_isModernFolderType") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_isLegacyFolderType");
}

- (uint64_t)ic_isBaseAttachmentType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isAttachmentType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isInlineAttachmentType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isHashtagType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

- (uint64_t)ic_isInvitationType
{
  return objc_msgSend(a1, "ic_isEntityOfClass:", objc_opt_class());
}

@end
