@implementation MFFileAttachment

- (BOOL)isEqual:(id)a3
{
  MFFileAttachment *v4;
  MFFileAttachment *v5;
  MFFileAttachment *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (MFFileAttachment *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5)
      {
        -[MFFileAttachment attachmentContentIDURL](v5, "attachmentContentIDURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", self->_attachmentContentIDURL))
        {
          -[MFFileAttachment attachmentName](v6, "attachmentName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", self->_attachmentName))
            v9 = -[MFFileAttachment attachmentType](v6, "attachmentType") == self->_attachmentType;
          else
            v9 = 0;

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_attachmentName, "hash");
  return -[NSURL hash](self->_attachmentContentIDURL, "hash") ^ v3 ^ self->_attachmentType;
}

- (NSString)attachmentName
{
  return self->_attachmentName;
}

- (void)setAttachmentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)attachmentContentIDURL
{
  return self->_attachmentContentIDURL;
}

- (void)setAttachmentContentIDURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentContentIDURL, a3);
}

- (int)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(int)a3
{
  self->_attachmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentContentIDURL, 0);
  objc_storeStrong((id *)&self->_attachmentName, 0);
}

@end
