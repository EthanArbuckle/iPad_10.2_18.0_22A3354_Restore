@implementation FBKAttachment

- (FBKAttachment)initWithCollectorIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7;
  id v8;
  FBKAttachment *v9;
  FBKAttachment *v10;
  void *v11;
  uint64_t v12;
  NSString *placeholderText;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBKAttachment;
  v9 = -[FBKAttachment init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceUUID, a4);
    objc_storeStrong((id *)&v10->_collectorIdentifier, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ATTACHMENT"), &stru_24E15EAF8, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    placeholderText = v10->_placeholderText;
    v10->_placeholderText = (NSString *)v12;

    v10->_attachmentType = 0;
    v10->_state = 0;
  }

  return v10;
}

- (FBKAttachment)initWithRequirement:(id)a3 urlExtension:(id)a4 collectorIdentifier:(id)a5 deviceUUID:(id)a6
{
  id v10;
  id v11;
  FBKAttachment *v12;
  uint64_t v13;

  v10 = a3;
  v11 = a4;
  v12 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](self, "initWithCollectorIdentifier:deviceUUID:", a5, a6);
  if (v12)
  {
    if (v11 || (objc_msgSend(v10, "isConfiguredWithDEBundleIdentifier") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      if (!objc_msgSend(v10, "hasRegularExpression"))
        goto LABEL_6;
      v13 = 2;
    }
    -[FBKAttachment setAttachmentType:](v12, "setAttachmentType:", v13);
LABEL_6:
    -[FBKAttachment setUrlExtension:](v12, "setUrlExtension:", v11);
    -[FBKAttachment setRequirement:](v12, "setRequirement:", v10);
  }

  return v12;
}

- (void)setGroup:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKAttachment item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBKAttachment setGroup:].cold.1(self, v6);

  }
  -[FBKAttachment setAttachedGroup:](self, "setAttachedGroup:", v4);
  -[FBKAttachment setState:](self, "setState:", 2 * (v4 != 0));
  +[FBKLog appHandle](FBKLog, "appHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[FBKAttachment shortDescription](self, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_INFO, "Did set group on [%{public}@]", (uint8_t *)&v9, 0xCu);

  }
}

- (void)setItem:(id)a3 originalURL:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FBKAttachment setOriginalLocalFileURL:](self, "setOriginalLocalFileURL:", a4);
  -[FBKAttachment setAttachedItem:](self, "setAttachedItem:", v6);

  -[FBKAttachment setAttachedGroup:](self, "setAttachedGroup:", 0);
  -[FBKAttachment setState:](self, "setState:", 2 * (v6 != 0));
  +[FBKLog appHandle](FBKLog, "appHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[FBKAttachment shortDescription](self, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_INFO, "Did set item on [%{public}@]", (uint8_t *)&v9, 0xCu);

  }
}

- (NSString)stateDescription
{
  int64_t v2;

  v2 = -[FBKAttachment state](self, "state");
  if ((unint64_t)(v2 - 1) > 7)
    return (NSString *)CFSTR("not gathered");
  else
    return &off_24E157E00[v2 - 1]->isa;
}

- (void)setAttachmentType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  self->_attachmentType = a3;
  switch(a3)
  {
    case 1:
      -[FBKAttachment setState:](self, "setState:", 0);
      return;
    case 3:
      -[FBKAttachment setState:](self, "setState:", 1);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      v9 = CFSTR("GATHERING_IMAGE");
      goto LABEL_12;
    case 4:
      -[FBKAttachment setState:](self, "setState:", 1);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      v9 = CFSTR("GATHERING_VIDEO");
LABEL_12:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24E15EAF8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAttachment setPlaceholderText:](self, "setPlaceholderText:", v10);

      return;
    case 5:
    case 6:
      -[FBKAttachment displayName](self, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        return;
      +[FBKLog appHandle](FBKLog, "appHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[FBKAttachment setAttachmentType:].cold.2(v6);
LABEL_8:

      return;
    default:
      +[FBKLog appHandle](FBKLog, "appHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[FBKAttachment setAttachmentType:].cold.1(a3, v6, v7);
      goto LABEL_8;
  }
}

- (id)displayName
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[FBKAttachment attachedGroup](self, "attachedGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKAttachment urlExtension](self, "urlExtension");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_5;
    v5 = (void *)v4;
    -[FBKAttachment urlExtension](self, "urlExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_5:
      -[FBKAttachment requirement](self, "requirement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[FBKAttachment requirement](self, "requirement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
      }
      else
      {
        -[FBKAttachment attachedGroup](self, "attachedGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayName");
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    goto LABEL_4;
  }
  -[FBKAttachment attachedItem](self, "attachedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FBKAttachment attachedItem](self, "attachedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = (void *)v13;
LABEL_15:

    return v14;
  }
  -[FBKAttachment requirement](self, "requirement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[FBKAttachment requirement](self, "requirement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[FBKAttachment urlExtension](self, "urlExtension");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FBKAttachment urlExtension](self, "urlExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
LABEL_4:
      -[FBKAttachment urlExtension](self, "urlExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v9 = v8;
      objc_msgSend(v8, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  -[FBKAttachment extension](self, "extension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[FBKAttachment extension](self, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[FBKAttachment proposedFileNameForLocalFiles](self, "proposedFileNameForLocalFiles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[FBKAttachment proposedFileNameForLocalFiles](self, "proposedFileNameForLocalFiles");
  else
    -[FBKAttachment placeholderText](self, "placeholderText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)promisedFileName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FBKAttachment attachedGroup](self, "attachedGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKAttachment attachedGroup](self, "attachedGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKAttachment attachedItem](self, "attachedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = 0;
      return v8;
    }
    -[FBKAttachment attachedItem](self, "attachedItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachedPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)remove
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "FBK attachment item is not local, this is not supported.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (BOOL)wasAttachedByApplication
{
  void *v2;
  BOOL v3;

  -[FBKAttachment originalLocalFileURL](self, "originalLocalFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasFBKFileReadyForSubmission
{
  return !-[FBKAttachment isCollecting](self, "isCollecting")
      && -[FBKAttachment wasAttachedByApplication](self, "wasAttachedByApplication")
      && -[FBKAttachment isLocal](self, "isLocal")
      && -[FBKAttachment hasFiles](self, "hasFiles");
}

- (BOOL)isCollecting
{
  return -[FBKAttachment state](self, "state") == 1;
}

- (BOOL)hasFiles
{
  void *v2;
  BOOL v3;

  -[FBKAttachment fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasGroup
{
  void *v2;
  BOOL v3;

  -[FBKAttachment attachedGroup](self, "attachedGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isLocal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[FBKAttachment attachedGroup](self, "attachedGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKAttachment attachedGroup](self, "attachedGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "isLocal");

    return v7;
  }
  -[FBKAttachment attachedItem](self, "attachedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FBKAttachment attachedItem](self, "attachedItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[FBKLog appHandle](FBKLog, "appHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[FBKAttachment isLocal].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v17.receiver = self;
  v17.super_class = (Class)FBKAttachment;
  -[FBKAttachment description](&v17, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment requirement](self, "requirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment extension](self, "extension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment stateDescription](self, "stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FBKAttachment attachmentType](self, "attachmentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment originalLocalFileURL](self, "originalLocalFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment placeholderText](self, "placeholderText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("\n%@\nreq[%@]\next[%@]\nstate[%@] type[%@] item[%@] group[%@]\nfrom [%@]\ndisplay[%@] altDisplay[%@]\n"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FBKAttachment requirement](self, "requirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    -[FBKAttachment requirement](self, "requirement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachment uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Attachment: %@ | %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKAttachment displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachment uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Attachment: %@ | %@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  FBKAttachment *v4;
  char isKindOfClass;

  v4 = (FBKAttachment *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (v4 == self) & isKindOfClass;
}

- (BOOL)shouldAutoGather
{
  void *v3;
  void *v4;
  char v5;

  -[FBKAttachment requirement](self, "requirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[FBKAttachment requirement](self, "requirement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAutoGather");

  return v5;
}

- (BOOL)canBeDeleted
{
  _BOOL4 v3;

  if (-[FBKAttachment state](self, "state") == 3)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[FBKAttachment hasFiles](self, "hasFiles");
    if (v3)
      LOBYTE(v3) = -[FBKAttachment state](self, "state") == 2;
  }
  return v3;
}

- (BOOL)isAdditional
{
  void *v2;
  char v3;

  -[FBKAttachment requirement](self, "requirement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdditional");

  return v3;
}

- (BOOL)isReadyToDisplayContents
{
  return -[FBKAttachment state](self, "state") == 2 && -[FBKAttachment hasFiles](self, "hasFiles");
}

- (BOOL)canStartGathering
{
  void *v3;
  BOOL v4;

  if (-[FBKAttachment state](self, "state") || -[FBKAttachment attachmentType](self, "attachmentType") != 1)
    return 0;
  -[FBKAttachment extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isRequired
{
  void *v3;
  _BOOL4 v4;

  -[FBKAttachment requirement](self, "requirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[FBKAttachment isAdditional](self, "isAdditional");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (NSURL)fileURL
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[FBKAttachment attachedItem](self, "attachedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKAttachment attachedItem](self, "attachedItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachedPath");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    return (NSURL *)v6;
  }
  -[FBKAttachment attachedGroup](self, "attachedGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKAttachment attachedGroup](self, "attachedGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootURL");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (NSURL *)v6;
}

- (NSString)instructionsAsHTML
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKAttachment requirement](self, "requirement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileMatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instructionsAsHTML");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)uniqueIdentifier
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[FBKAttachment hash](self, "hash");
  v5 = -[FBKAttachment state](self, "state");
  -[FBKAttachment displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu-%lu-%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)diffableHashWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[FBKAttachment uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKAttachment uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)matchesAttachmentDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "diagnosticExtensionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[FBKAttachment requirement](self, "requirement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileMatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[FBKAttachment requirement](self, "requirement");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileMatcher");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deBundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "diagnosticExtensionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        goto LABEL_3;
      }
      -[FBKAttachment extension](self, "extension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[FBKAttachment extension](self, "extension");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "diagnosticExtensionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "isEqualToString:", v8);
        goto LABEL_4;
      }
    }
    v11 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment originalLocalFileURL](self, "originalLocalFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
LABEL_3:
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

LABEL_4:
LABEL_5:

  return v11;
}

+ (id)descriptorForAttachment:(id)a3 given:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__FBKAttachment_descriptorForAttachment_given___block_invoke;
  v9[3] = &unk_24E157DE0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "ded_findWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __47__FBKAttachment_descriptorForAttachment_given___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesAttachmentDescriptor:", a2);
}

- (FBKMatcherPredicate)requirement
{
  return self->_requirement;
}

- (void)setRequirement:(id)a3
{
  objc_storeStrong((id *)&self->_requirement, a3);
}

- (DEDExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (FBKURLExtension)urlExtension
{
  return self->_urlExtension;
}

- (void)setUrlExtension:(id)a3
{
  objc_storeStrong((id *)&self->_urlExtension, a3);
}

- (BOOL)fileComesFromFBK
{
  return self->_fileComesFromFBK;
}

- (void)setFileComesFromFBK:(BOOL)a3
{
  self->_fileComesFromFBK = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
}

- (NSString)proposedFileNameForLocalFiles
{
  return self->_proposedFileNameForLocalFiles;
}

- (void)setProposedFileNameForLocalFiles:(id)a3
{
  objc_storeStrong((id *)&self->_proposedFileNameForLocalFiles, a3);
}

- (NSString)collectorIdentifier
{
  return self->_collectorIdentifier;
}

- (NSURL)originalLocalFileURL
{
  return self->_originalLocalFileURL;
}

- (void)setOriginalLocalFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalLocalFileURL, a3);
}

- (NSString)localizedAttachmentInfo
{
  return self->_localizedAttachmentInfo;
}

- (void)setLocalizedAttachmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAttachmentInfo, a3);
}

- (DEDAttachmentGroup)attachedGroup
{
  return self->_attachedGroup;
}

- (void)setAttachedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_attachedGroup, a3);
}

- (DEDAttachmentItem)attachedItem
{
  return self->_attachedItem;
}

- (void)setAttachedItem:(id)a3
{
  objc_storeStrong((id *)&self->_attachedItem, a3);
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_attachedItem, 0);
  objc_storeStrong((id *)&self->_attachedGroup, 0);
  objc_storeStrong((id *)&self->_localizedAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_originalLocalFileURL, 0);
  objc_storeStrong((id *)&self->_collectorIdentifier, 0);
  objc_storeStrong((id *)&self->_proposedFileNameForLocalFiles, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_urlExtension, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requirement, 0);
}

- (void)setGroup:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Setting group on Attachment with item: %{public}@", (uint8_t *)&v5);

}

- (void)setAttachmentType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "unknown attachment type given %ld", (uint8_t *)&v3);
}

- (void)setAttachmentType:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "FBKAttachmentType.otherFile/.fileDownload with no display name", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isLocal
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "could not find item or group for attachment, cannot determine isLocal:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
