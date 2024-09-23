@implementation MFMimeTextAttachment

- (MFMimeTextAttachment)initWithMimePart:(id)a3
{
  id v4;
  MFMimeTextAttachment *v5;
  MFMimeTextAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMimeTextAttachment;
  v5 = -[MFMessageTextAttachment init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MFMessageTextAttachment setMimePart:](v5, "setMimePart:", v4);

  return v6;
}

- (id)_displayedMimePart
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  -[MFMessageTextAttachment mimePart](self, "mimePart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("multipart")))
    goto LABEL_11;
  objc_msgSend(v2, "subtype");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("appledouble"));

  if (v5)
  {
    objc_msgSend(v2, "subparts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "count");
    if (v6 >= 2)
      v7 = 2;
    else
      v7 = v6;
    if (v7)
    {
      v8 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("application")) & 1) == 0)
          break;
        objc_msgSend(v9, "subtype");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("applefile"));

        if ((v12 & 1) == 0)
          goto LABEL_15;

        if (v7 == ++v8)
          goto LABEL_11;
      }

LABEL_15:
      goto LABEL_12;
    }
LABEL_11:
    v9 = v2;
LABEL_12:

    v2 = v9;
  }
  return v2;
}

- (void)download
{
  void *v3;
  id v4;

  -[MFMimeTextAttachment _displayedMimePart](self, "_displayedMimePart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWrapperForcingDownload:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MFMessageTextAttachment setFileWrapper:](self, "setFileWrapper:", v4);

}

- (BOOL)hasBeenDownloaded
{
  char v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMimeTextAttachment;
  if (-[MFMessageTextAttachment hasBeenDownloaded](&v7, sel_hasBeenDownloaded))
    return 1;
  v4 = (void *)MEMORY[0x1AF433BF4]();
  -[MFMessageTextAttachment mimePart](self, "mimePart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "hasContents");

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (unsigned)approximateSize
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  if (-[MFMessageTextAttachment isPlaceholder](self, "isPlaceholder"))
  {
    -[MFMessageTextAttachment mimePart](self, "mimePart");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "approximateRawSize");

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MFMimeTextAttachment;
    return -[MFMessageTextAttachment approximateSize](&v6, sel_approximateSize);
  }
  return v4;
}

@end
