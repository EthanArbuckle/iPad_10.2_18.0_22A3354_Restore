@implementation LPSharedObjectMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharedObjectMetadata)initWithCoder:(id)a3
{
  id v4;
  LPSharedObjectMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *information;
  void *v14;
  uint64_t v15;
  id v16;
  LPImage *icon;
  NSObject *v18;
  LPSharedObjectMetadata *v19;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LPSharedObjectMetadata;
  v5 = -[LPSharedObjectMetadata init](&v22, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_isCollaboration;
    *(_QWORD *)&v5->_isCollaboration = v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("information"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v12 = objc_claimAutoreleasedReturnValue();
    information = v5->_information;
    v5->_information = (NSString *)v12;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCollaboration"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization")))
    {
      decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v14, CFSTR("specialization"), &v21);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v21;
      icon = v5->_icon;
      v5->_icon = (LPImage *)v15;

      if (v16)
      {
        v18 = LPLogChannelSerialization();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[LPSharedObjectMetadata initWithCoder:].cold.1();
      }

    }
    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_isCollaboration, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("subtitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("information"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1), CFSTR("isCollaboration"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_information, CFSTR("icon"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("specialization"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPSharedObjectMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LPSharedObjectMetadata *v10;

  v4 = +[LPSharedObjectMetadata allocWithZone:](LPSharedObjectMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPSharedObjectMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharedObjectMetadata setTitle:](v4, "setTitle:", v5);

    -[LPSharedObjectMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharedObjectMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[LPSharedObjectMetadata information](self, "information");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharedObjectMetadata setInformation:](v4, "setInformation:", v7);

    -[LPSharedObjectMetadata setIsCollaboration:](v4, "setIsCollaboration:", -[LPSharedObjectMetadata isCollaboration](self, "isCollaboration"));
    -[LPSharedObjectMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharedObjectMetadata setIcon:](v4, "setIcon:", v8);

    -[LPSharedObjectMetadata specialization](self, "specialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharedObjectMetadata setSpecialization:](v4, "setSpecialization:", v9);

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  unsigned __int8 *v6;
  void *v7;
  void *v8;
  NSString *title;
  void *v10;
  NSString *subtitle;
  void *v12;
  NSString *information;
  void *v14;
  LPImage *icon;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPSharedObjectMetadata;
  if (-[LPSharedObjectMetadata isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unsigned __int8 *)v4;
      v7 = *(void **)&self->_isCollaboration;
      objc_msgSend(v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objectsAreEqual_0(v7, v8);

      if ((v7 & 1) == 0)
        goto LABEL_11;
      title = self->_title;
      objc_msgSend(v6, "subtitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(title) = objectsAreEqual_0(title, v10);

      if ((title & 1) == 0)
        goto LABEL_11;
      subtitle = self->_subtitle;
      objc_msgSend(v6, "information");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(subtitle) = objectsAreEqual_0(subtitle, v12);

      if ((subtitle & 1) == 0)
        goto LABEL_11;
      if (v6[11] == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1)
        && (information = self->_information,
            objc_msgSend(v6, "icon"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            LOBYTE(information) = objectsAreEqual_0(information, v14),
            v14,
            (information & 1) != 0))
      {
        icon = self->_icon;
        objc_msgSend(v6, "specialization");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objectsAreEqual_0(icon, v16);

      }
      else
      {
LABEL_11:
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("information"), CFSTR("icon"), CFSTR("isCollaboration"), CFSTR("specialization"), 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

- (NSString)title
{
  return *(NSString **)&self->_isCollaboration;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)information
{
  return self->_subtitle;
}

- (void)setInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LPImage)icon
{
  return (LPImage *)self->_information;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_information, a3);
}

- (BOOL)isCollaboration
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (LPSpecializationMetadata)specialization
{
  return (LPSpecializationMetadata *)self->_icon;
}

- (void)setSpecialization:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_isCollaboration, 0);
}

- (id)_applicationFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  if (v3 && (objc_msgSend(MEMORY[0x1E0CA5838], "currentProcessHasReadAccess") & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v3, 1, 1, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEnabled") & 1) != 0)
      {
        objc_msgSend(v6, "targetApplicationRecord");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v9 = LPLogChannelUI();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[LPSharedObjectMetadata(Transformers) _applicationFromURL:].cold.1((uint64_t)v3, (uint64_t)v5, v9);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  LPLinkMetadataDownloadProgressTransformer *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  LPLinkMetadataDownloadProgressTransformer *v26;
  void *v27;
  uint64_t v28;
  LPCaptionBarPresentationProperties *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  LPImagePresentationProperties *v37;
  LPCaptionButtonPresentationProperties *v38;
  const __CFString *v39;
  uint64_t v40;
  LPImage *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EE5E9180);

  if (v7)
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v4, "originalURL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharedObjectMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v52 = v8;
  }
  else
  {
    objc_msgSend(v56, "sharedObjectTitleForTransformer:", v4);
    v52 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[LPSharedObjectMetadata icon](self, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v56, "sharedObjectIconForTransformer:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if ((objc_msgSend(v4, "isInComposeContext") & 1) != 0)
  {
    v55 = 0;
    v14 = 0;
  }
  else
  {
    -[LPSharedObjectMetadata information](self, "information");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v55 = v15;
    }
    else
    {
      objc_msgSend(v56, "sharedObjectInformationForTransformer:", v4);
      v55 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (!v54
      || (objc_msgSend(v54, "isFileURL") & 1) != 0
      || +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", v54))
    {
      -[LPSharedObjectMetadata subtitle](self, "subtitle", v52);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend(v56, "sharedObjectSubtitleForTransformer:", v4);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v19;

    }
    else if (v56
           || (-[LPSharedObjectMetadata _applicationFromURL:](self, "_applicationFromURL:", v54),
               (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "domainName", v52);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v20 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style", v52));
  if (v20 && !-[LPSharedObjectMetadata isCollaboration](self, "isCollaboration"))
  {
    joinedByDot(v14, v55);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v21;
  }
  if (objc_msgSend(v4, "sharedObjectDownloadState"))
  {
    v22 = [LPLinkMetadataDownloadProgressTransformer alloc];
    v23 = objc_msgSend(v4, "bytesLoaded");
    v24 = objc_msgSend(v4, "sharedObjectDownloadState");
    objc_msgSend(v4, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[LPLinkMetadataDownloadProgressTransformer initWithBytesLoaded:downloadState:metadata:](v22, "initWithBytesLoaded:downloadState:metadata:", v23, v24, v25);

    -[LPSharedObjectMetadata downloadProgressForTransformer:](self, "downloadProgressForTransformer:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subtitle");
    v28 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v28;
  }
  v29 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v29);

  if ((unint64_t)(v20 - 1) >= 3)
  {
    if (v20)
      goto LABEL_32;
    joinedByDot(v53, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "top");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leading");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v33);

  }
  else
  {
    objc_msgSend(v5, "captionBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "top");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leading");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setText:", v53);

    objc_msgSend(v5, "captionBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottom");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leading");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v14);
  }

LABEL_32:
  if (!v13)
  {
    +[LPResources safariIcon](LPResources, "safariIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v4, "effectiveSizeClass"))
  {
    v37 = 0;
    goto LABEL_46;
  }
  v38 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  -[LPCaptionButtonPresentationProperties setType:](v38, "setType:", 1);
  -[LPCaptionButtonPresentationProperties setRequiresInlineButton:](v38, "setRequiresInlineButton:", MEMORY[0x1E0C9AAB0]);
  -[LPCaptionButtonPresentationProperties setDisabled:](v38, "setDisabled:", objc_msgSend(v4, "isInComposeContext"));
  if (-[LPSharedObjectMetadata isCollaboration](self, "isCollaboration"))
  {
    v39 = CFSTR("person.2.fill");
  }
  else
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_44;
    }
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "size");
    v49 = objc_msgSend(v4, "bytesLoaded");

    if (v48 <= v49)
    {
LABEL_44:
      v45 = 0;
      goto LABEL_45;
    }
    v39 = CFSTR("square.and.arrow.down");
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_lp_systemImageNamed:", v39);
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
    goto LABEL_44;
  v41 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v40);
  +[LPButtonAction actionWithTitle:image:handler:](LPButtonAction, "actionWithTitle:image:handler:", 0, v41, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setActions:](v38, "setActions:", v43);

  objc_msgSend(v5, "captionBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setButton:", v38);

  v45 = (void *)v40;
LABEL_45:
  v37 = objc_alloc_init(LPImagePresentationProperties);
  -[LPImagePresentationProperties setCanAdjustHorizontalPaddingForFixedSize:](v37, "setCanAdjustHorizontalPaddingForFixedSize:", 1);

LABEL_46:
  if (objc_msgSend(v56, "sharedObjectPrefersIconAsImageForTransformer:", v4))
  {
    objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v13);
    -[LPSharedObjectMetadata applicationIconWithURL:](self, "applicationIconWithURL:", v54);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", v5, v50, 0, 0);

  }
  else
  {
    objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", v5, v13, v37, 0);
  }

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 1;
}

- (id)applicationIconWithURL:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  if (+[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", v4))
  {
    +[LPiCloudSharingMetadata extractApplicationFromURL:](LPiCloudSharingMetadata, "extractApplicationFromURL:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[LPSharedObjectMetadata specialization](self, "specialization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", CFSTR("com.apple.iwork.pages")) & 1) != 0)
      {
        v5 = CFSTR("Pages");
      }
      else if ((objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", CFSTR("com.apple.iwork.numbers")) & 1) != 0)
      {
        v5 = CFSTR("Numbers");
      }
      else if (objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", CFSTR("com.apple.iwork.keynote")))
      {
        v5 = CFSTR("Keynote");
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  if (-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("pages")))
  {
    +[LPResources pagesIcon](LPResources, "pagesIcon");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("numbers")))
  {
    +[LPResources numbersIcon](LPResources, "numbersIcon");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("keynote")))
  {
    +[LPResources keynoteIcon](LPResources, "keynoteIcon");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if ((-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("freeform")) & 1) != 0
         || -[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("freeform-copy")))
  {
    +[LPResources freeformIcon](LPResources, "freeformIcon");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("iclouddrive")))
  {
    +[LPResources iCloudDriveIcon](LPResources, "iCloudDriveIcon");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[__CFString _lp_isEqualIgnoringCase:](v5, "_lp_isEqualIgnoringCase:", CFSTR("safari-tab-groups")))
    {
      v11 = 0;
      goto LABEL_23;
    }
    +[LPResources safariAppIconBadge](LPResources, "safariAppIconBadge");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_23:

  return v11;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE5E86C8) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_5:
    -[LPSharedObjectMetadata title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

    -[LPSharedObjectMetadata icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIcon:", v7);
    goto LABEL_6;
  }
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populateMetadataForBackwardCompatibility:", v9);
LABEL_6:

}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", v8);

  if (v9)
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE5E9180) & 1) != 0)
    {
      -[LPSharedObjectMetadata specialization](self, "specialization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[LPSharedObjectMetadata specialization](self, "specialization");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sharedObjectPreviewSummaryForTransformer:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v18 = (void *)v14;
        goto LABEL_16;
      }
    }
    else
    {

    }
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EE5E8638) & 1) != 0)
    {
      -[LPSharedObjectMetadata specialization](self, "specialization");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        -[LPSharedObjectMetadata specialization](self, "specialization");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "previewSummaryForTransformer:", v6);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "originalURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharedObjectMetadata _applicationFromURL:](self, "_applicationFromURL:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Link: “%@” shared from %@"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharedObjectMetadata title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  if (!v13)
  {
    objc_msgSend(v6, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_simplifiedStringForDisplayOnly:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "stringWithFormat:", v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

  }
LABEL_16:

  return v18;
}

- (id)previewImageForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E8638) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
LABEL_5:
    -[LPSharedObjectMetadata icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewImageForTransformer:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  LPSourceApplicationMetadata *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[LPSharedObjectMetadata specialization](self, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E9180) & 1) != 0)
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sharedObjectPrefersIconAsImageForTransformer:", v4);

    if ((v7 & 1) != 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "originalURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPSharedObjectMetadata applicationIconWithURL:](self, "applicationIconWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v8 = objc_alloc_init(LPSourceApplicationMetadata);
    -[LPSourceApplicationMetadata setIcon:](v8, "setIcon:", v10);
  }
  else
  {
    v8 = 0;
  }

LABEL_9:
  return v8;
}

- (id)downloadProgressForTransformer:(id)a3
{
  id v4;
  LPDownloadProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  unint64_t v17;

  v4 = a3;
  if (-[LPSharedObjectMetadata isCollaboration](self, "isCollaboration"))
  {
    v5 = 0;
  }
  else
  {
    -[LPSharedObjectMetadata specialization](self, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPFileMetadata descriptionForUTI:](LPFileMetadata, "descriptionForUTI:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = objc_msgSend(v4, "bytesLoaded");
    v10 = objc_msgSend(v6, "size");
    if (objc_msgSend(v6, "size"))
    {
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v6, "size"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 < v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v4, "bytesLoaded"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        LPLocalizedString(CFSTR("%@ of %@"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v15, v13, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        joinedByDot(v7, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v12 = 0;
    }
    v16 = 1.0;
    if (v9 < v10)
    {
      v17 = objc_msgSend(v4, "bytesLoaded");
      v16 = (double)v17 / (double)(unint64_t)objc_msgSend(v6, "size");
    }
    v5 = -[LPDownloadProgress initWithProgress:subtitle:isFinished:]([LPDownloadProgress alloc], "initWithProgress:subtitle:isFinished:", v12, v9 >= v10, v16);

  }
  return v5;
}

- (id)fallbackIconForTransformer:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "originalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", v4);

  if (v5)
  {
    +[LPResources iCloudIcon](LPResources, "iCloudIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPSharedObjectMetadata 'provider' with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A0C41000, v0, v1, "Failed to decode LPSharedObjectMetadata 'provider' with exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
