@implementation DRPasteAnnouncement

- (DRPasteAnnouncement)initWithSource:(id)a3 destination:(id)a4 pasteboardUUID:(id)a5 timeout:(double)a6
{
  id v11;
  id v12;
  id v13;
  DRPasteAnnouncement *v14;
  DRPasteAnnouncement *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DRPasteAnnouncement;
  v14 = -[DRPasteAnnouncement init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_destination, a4);
    objc_storeStrong((id *)&v15->_pasteboardUUID, a5);
    v15->_timeout = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  DRPasteAnnouncement *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pasteboardUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeout"));
  v9 = v8;

  v10 = -[DRPasteAnnouncement initWithSource:destination:pasteboardUUID:timeout:](self, "initWithSource:destination:pasteboardUUID:timeout:", v5, v6, v7, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  DRPasteAnnouncementEndpoint *source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("destination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pasteboardUUID, CFSTR("pasteboardUUID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeout"), self->_timeout);

}

- (NSString)localizedAnnouncementText
{
  return (NSString *)-[DRPasteAnnouncement _localizedTextRequiringAuthorization:](self, "_localizedTextRequiringAuthorization:", 0);
}

- (NSString)localizedAuthorizationText
{
  return (NSString *)-[DRPasteAnnouncement _localizedTextRequiringAuthorization:](self, "_localizedTextRequiringAuthorization:", 1);
}

- (id)_localizedTextRequiringAuthorization:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  id *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  if (_localizedTextRequiringAuthorization__onceToken != -1)
    dispatch_once(&_localizedTextRequiringAuthorization__onceToken, &__block_literal_global_0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DRPasteAnnouncementEndpoint localizedName](self->_destination, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DRPasteAnnouncementEndpoint localizedName](self->_source, "localizedName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v7 = CFSTR("PASTE_AUTHORIZATION_REQUEST_SOURCE_AND_DESTINATION");
        v8 = CFSTR("%@ would like to paste from %@");
      }
      else
      {
        v7 = CFSTR("PASTE_ANNOUNCEMENT_SOURCE_AND_DESTINATION");
        v8 = CFSTR("%@ pasted from %@");
      }
      objc_msgSend((id)_localizedTextRequiringAuthorization__DRBundle, "localizedStringForKey:value:table:", v7, v8, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v14 = (id *)&v22;
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), &v22, v5, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
        v13 = 0;
        goto LABEL_24;
      }
      -[DRPasteAnnouncementEndpoint deviceName](self->_source, "deviceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (v3)
        {
          v11 = CFSTR("PASTE_AUTHORIZATION_REQUEST_FROM_CONTINUITY_DEVICE");
          v12 = CFSTR("%@ would like to paste from %@");
        }
        else
        {
          v11 = CFSTR("PASTE_ANNOUNCEMENT_FROM_CONTINUITY_DEVICE");
          v12 = CFSTR("%@ pasted from %@");
        }
        objc_msgSend((id)_localizedTextRequiringAuthorization__DRBundle, "localizedStringForKey:value:table:", v11, v12, CFSTR("Localizable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v14 = (id *)&v21;
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), &v21, v5, v6);
      }
      else
      {
        if (v3)
        {
          v15 = CFSTR("PASTE_AUTHORIZATION_REQUEST_FROM_UNKNOWN_CONTINUITY_DEVICE");
          v16 = CFSTR("%@ would like to paste from another device");
        }
        else
        {
          v15 = CFSTR("PASTE_ANNOUNCEMENT_FROM_UNKNOWN_CONTINUITY_DEVICE");
          v16 = CFSTR("%@ pasted from another device");
        }
        objc_msgSend((id)_localizedTextRequiringAuthorization__DRBundle, "localizedStringForKey:value:table:", v15, v16, CFSTR("Localizable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v14 = (id *)&v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), &v20, v5, v19);
      }
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = *v14;

    if (v10)
    {
LABEL_27:

      goto LABEL_28;
    }
LABEL_24:
    DRLogTarget();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DRPasteAnnouncement _localizedTextRequiringAuthorization:].cold.1((uint64_t)v9, v17);

    v10 = CFSTR("PASTE OCCURRED");
    goto LABEL_27;
  }
  DRLogTarget();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[DRPasteAnnouncement _localizedTextRequiringAuthorization:].cold.2(v9);
  v10 = CFSTR("PASTE OCCURRED");
LABEL_28:

  return v10;
}

void __60__DRPasteAnnouncement__localizedTextRequiringAuthorization___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localizedTextRequiringAuthorization__DRBundle;
  _localizedTextRequiringAuthorization__DRBundle = v0;

}

- (BOOL)canCoalesceWithAnnouncement:(id)a3
{
  id v4;
  NSUUID *pasteboardUUID;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  pasteboardUUID = self->_pasteboardUUID;
  objc_msgSend(v4, "pasteboardUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pasteboardUUID) = -[NSUUID isEqual:](pasteboardUUID, "isEqual:", v6);

  if ((_DWORD)pasteboardUUID
    && (objc_msgSend(v4, "source"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = +[DRPasteAnnouncement _canCoalesceEndpoint:withEndpoint:](DRPasteAnnouncement, "_canCoalesceEndpoint:withEndpoint:", v7, self->_source), v7, v8))
  {
    objc_msgSend(v4, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[DRPasteAnnouncement _canCoalesceEndpoint:withEndpoint:](DRPasteAnnouncement, "_canCoalesceEndpoint:withEndpoint:", v9, self->_destination);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_canCoalesceEndpoint:(id)a3 withEndpoint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isEqual:", objc_opt_class()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "isSimilarToApplicationEndpoint:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 1;
        goto LABEL_9;
      }
      v8 = objc_msgSend(v6, "isSimilarToContinuityEndpoint:", v5);
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_9:

  return v9;
}

- (DRPasteAnnouncementEndpoint)source
{
  return self->_source;
}

- (DRPasteAnnouncementEndpoint)destination
{
  return self->_destination;
}

- (NSUUID)pasteboardUUID
{
  return self->_pasteboardUUID;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardUUID, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)_localizedTextRequiringAuthorization:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2084A3000, a2, OS_LOG_TYPE_ERROR, "Invalid format string for paste announcement (error: %@)", (uint8_t *)&v2, 0xCu);
}

- (void)_localizedTextRequiringAuthorization:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2084A3000, log, OS_LOG_TYPE_FAULT, "Unknown kind of source or destination for paste announcement", v1, 2u);
}

@end
