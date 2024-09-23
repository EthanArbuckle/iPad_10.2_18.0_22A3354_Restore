@implementation ICAttachmentPaperDocumentModel

+ (int64_t)baseNotesVersion
{
  return 13;
}

- (id)additionalIndexableTextContentInNote
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalIndexableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)paperPageCount
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("paperPageCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setPaperPageCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("paperPageCount"));

  v11 = (void *)objc_msgSend(v13, "copy");
  -[ICAttachmentModel attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMetadata:", v11);

}

- (BOOL)supportsQuickLook
{
  return 1;
}

@end
