@implementation CNShareContactActivityItem

- (CNShareContactActivityItem)initWithContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNShareContactActivityItem *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNShareContactActivityItem initWithContacts:inGroupNamed:](self, "initWithContacts:inGroupNamed:", v6, 0, v9, v10);
  return v7;
}

- (CNShareContactActivityItem)initWithContacts:(id)a3 inGroupNamed:(id)a4
{
  id v7;
  id v8;
  CNShareContactActivityItem *v9;
  CNShareContactActivityItem *v10;
  CNContactFormatter *v11;
  CNContactFormatter *contactFormatter;
  CNShareContactActivityItem *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNShareContactActivityItem;
  v9 = -[CNShareContactActivityItem init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contacts, a3);
    objc_storeStrong((id *)&v10->_groupName, a4);
    v11 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactFormatter = v10->_contactFormatter;
    v10->_contactFormatter = v11;

    -[CNContactFormatter setStyle:](v10->_contactFormatter, "setStyle:", 0);
    v13 = v10;
  }

  return v10;
}

- (LPLinkMetadata)linkMetadata
{
  LPLinkMetadata *linkMetadata;
  LPLinkMetadata *v4;
  LPLinkMetadata *v5;
  LPFileMetadata *v6;
  LPFileMetadata *fileMetadata;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  linkMetadata = self->_linkMetadata;
  if (!linkMetadata)
  {
    v4 = (LPLinkMetadata *)objc_alloc_init((Class)getLPLinkMetadataClass[0]());
    v5 = self->_linkMetadata;
    self->_linkMetadata = v4;

    v6 = (LPFileMetadata *)objc_alloc_init((Class)getLPFileMetadataClass[0]());
    fileMetadata = self->_fileMetadata;
    self->_fileMetadata = v6;

    -[CNShareContactActivityItem displayString](self, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setName:](self->_fileMetadata, "setName:", v8);

    getkUTTypeVCard[0]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setType:](self->_fileMetadata, "setType:", v9);

    -[CNShareContactActivityItem thumbnailImage](self, "thumbnailImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)getLPImageClass[0]()), "initWithPlatformImage:", v10);
      -[LPFileMetadata setThumbnail:](self->_fileMetadata, "setThumbnail:", v11);

    }
    -[LPLinkMetadata setSpecialization:](self->_linkMetadata, "setSpecialization:", self->_fileMetadata);
    -[CNShareContactActivityItem displayString](self, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](self->_linkMetadata, "setTitle:", v12);

    linkMetadata = self->_linkMetadata;
  }
  return linkMetadata;
}

- (id)displayString
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CNGroupIdentity *v17;
  void *v18;
  void *v19;

  -[CNShareContactActivityItem contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    v17 = [CNGroupIdentity alloc];
    -[CNShareContactActivityItem groupName](self, "groupName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareContactActivityItem contacts](self, "contacts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNGroupIdentity initGroupWithName:photo:contacts:](v17, "initGroupWithName:photo:contacts:", v18, 0, v19);

    -[CNShareContactActivityItem contactFormatter](self, "contactFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromGroupIdentity:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    v8 = v13;
    goto LABEL_7;
  }
  -[CNShareContactActivityItem contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNShareContactActivityItem contactFormatter](self, "contactFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v8))
  {
    objc_msgSend(v6, "phoneNumbers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "formattedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v13))
    {
      objc_msgSend(v6, "emailAddresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (id)thumbnailImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CNAvatarImageRenderer *v14;
  void *v15;
  CNAvatarImageRenderer *v16;

  -[CNShareContactActivityItem contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[CNShareContactActivityItem contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "thumbnailImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v6, "thumbnailImageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;

      +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, 0, 0, 160.0, 160.0, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [CNAvatarImageRenderer alloc];
      +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CNAvatarImageRenderer initWithSettings:](v14, "initWithSettings:", v15);

      -[CNAvatarImageRenderer renderMonogramForContact:color:scope:prohibitedSources:](v16, "renderMonogramForContact:color:scope:prohibitedSources:", v6, 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DDCAF0], "optionsFromPreferences", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePhotos:", 1);
  objc_msgSend(v5, "setIncludeNotes:", 1);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isFeatureEnabled:", 12))
  {
    v8 = -[CNShareContactActivityItem canSharePronouns](self, "canSharePronouns");

    if (v8)
    {
      objc_msgSend(v5, "setIncludePronouns:", 1);
      objc_msgSend(v5, "setUseUnencryptedPronouns:", 1);
    }
  }
  else
  {

  }
  objc_msgSend(v5, "setIncludeMeCardOnlySharingProperties:", -[CNShareContactActivityItem canShareMeCardOnlySharingProperties](self, "canShareMeCardOnlySharingProperties"));
  v9 = (void *)MEMORY[0x1E0C972A8];
  -[CNShareContactActivityItem contacts](self, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataWithContacts:options:error:", v10, v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v4;
  void *v5;

  -[CNShareContactActivityItem linkMetadata](self, "linkMetadata", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CNMonogrammer *v12;
  void *v13;
  void *v14;

  width = a5.width;
  v7 = a4;
  -[CNShareContactActivityItem contacts](self, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
  {
    -[CNShareContactActivityItem contacts](self, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1B0]))
    {
      v12 = -[CNMonogrammer initWithStyle:diameter:]([CNMonogrammer alloc], "initWithStyle:diameter:", 2, width);
      -[CNMonogrammer monogramForContact:](v12, "monogramForContact:", v11);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v11, "thumbnailImageData");
      v12 = (CNMonogrammer *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithData:", v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)getkUTTypeVCard[0]();
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNShareContactActivityItem contacts](self, "contacts", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[CNShareContactActivityItem contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIVCardUtilities fileNameForContact:](CNUIVCardUtilities, "fileNameForContact:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[CNShareContactActivityItem displayString](self, "displayString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.vcf"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)canSharePronouns
{
  return self->_canSharePronouns;
}

- (void)setCanSharePronouns:(BOOL)a3
{
  self->_canSharePronouns = a3;
}

- (BOOL)canShareMeCardOnlySharingProperties
{
  return self->_canShareMeCardOnlySharingProperties;
}

- (void)setCanShareMeCardOnlySharingProperties:(BOOL)a3
{
  self->_canShareMeCardOnlySharingProperties = a3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (LPFileMetadata)fileMetadata
{
  return self->_fileMetadata;
}

- (void)setFileMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_fileMetadata, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
