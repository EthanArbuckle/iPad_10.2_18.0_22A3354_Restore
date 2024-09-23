@implementation FPNSFileProviderItemHelper

- (id)fp_downloadingStatus
{
  char v3;
  id *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[FPNSFileProviderItemHelper isDownloaded](self, "isDownloaded"))
    {
      v3 = objc_opt_respondsToSelector();
      v4 = (id *)MEMORY[0x1E0C99AF0];
      if ((v3 & 1) != 0
        && !-[FPNSFileProviderItemHelper isMostRecentVersionDownloaded](self, "isMostRecentVersionDownloaded"))
      {
        v4 = (id *)MEMORY[0x1E0C99AF8];
      }
    }
    else
    {
      v4 = (id *)MEMORY[0x1E0C99B08];
    }
    v5 = *v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)fp_isReadable
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[FPNSFileProviderItemHelper capabilities](self, "capabilities") & 1;
  else
    return 0;
}

- (BOOL)fp_isWritable
{
  _BOOL8 v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (-[FPNSFileProviderItemHelper capabilities](self, "capabilities") >> 1) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (id)fp_sharingCurrentUserRole
{
  SEL v3;
  void *v4;
  id *v5;
  id v6;
  id *v7;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || !-[FPNSFileProviderItemHelper isShared](self, "isShared"))
  {
    goto LABEL_13;
  }
  v3 = NSSelectorFromString(CFSTR("sharedItemRole"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPNSFileProviderItemHelper performSelector:](self, "performSelector:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2F58]) & 1) != 0)
    {
      v5 = (id *)MEMORY[0x1E0C99B98];
LABEL_8:
      v6 = *v5;

      return v6;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2F60]))
    {
      v5 = (id *)MEMORY[0x1E0C99BA0];
      goto LABEL_8;
    }

  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    v6 = 0;
    return v6;
  }
  if (-[FPNSFileProviderItemHelper isSharedByCurrentUser](self, "isSharedByCurrentUser"))
    v7 = (id *)MEMORY[0x1E0C99B98];
  else
    v7 = (id *)MEMORY[0x1E0C99BA0];
  v6 = *v7;
  return v6;
}

- (id)fp_sharingCurrentUserPermissions
{
  _BOOL4 v3;
  id *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[FPNSFileProviderItemHelper isShared](self, "isShared"))
  {
    v3 = -[FPNSFileProviderItemHelper fp_isWritable](self, "fp_isWritable");
    v4 = (id *)MEMORY[0x1E0C99B88];
    if (!v3)
      v4 = (id *)MEMORY[0x1E0C99B80];
    v5 = *v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (NSString)parentItemIdentifier
{
  return self->parentItemIdentifier;
}

- (NSString)filename
{
  return self->filename;
}

- (NSString)typeIdentifier
{
  return self->typeIdentifier;
}

- (UTType)contentType
{
  return self->contentType;
}

- (unint64_t)capabilities
{
  return self->capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contentType, 0);
  objc_storeStrong((id *)&self->typeIdentifier, 0);
  objc_storeStrong((id *)&self->filename, 0);
  objc_storeStrong((id *)&self->parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
