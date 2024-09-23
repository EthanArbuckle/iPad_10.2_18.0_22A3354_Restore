@implementation DEAttachmentItem(GroupHandling)

- (uint64_t)isGroup
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attachmentType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("DEAttachmentTypeGroup"));

  return v2;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filesize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shouldCompress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachedPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Item: (display %@) (path %@) (mod %@) (size %@) (compress %@) (attPath %@)"), v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
