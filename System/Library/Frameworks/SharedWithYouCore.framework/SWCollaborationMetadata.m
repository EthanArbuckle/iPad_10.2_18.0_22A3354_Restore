@implementation SWCollaborationMetadata

+ (SWCollaborationMetadata)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWCollaborationMetadata *)+[SWCollaborationMetadata allocWithZone:](_SWCollaborationMetadata, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationMetadata;
  return (SWCollaborationMetadata *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (void)_commonInitWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSString *v33;
  NSString *localIdentifier;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  NSString *v46;
  NSString *collaborationIdentifier;
  NSString *v48;
  NSString *title;
  SWCollaborationShareOptions *v50;
  SWCollaborationShareOptions *defaultShareOptions;
  NSArray *v52;
  NSArray *defaultOptions;
  NSDate *v54;
  NSDate *creationDate;
  UTType *v56;
  UTType *contentType;
  NSString *v58;
  NSString *initiatorHandle;
  NSPersonNameComponents *initiatorNameComponents;
  NSArray *v61;
  NSArray *ckAppBundleIDs;
  NSDictionary *v63;
  NSDictionary *handleToIdentityMap;
  CKContainerSetupInfo *v65;
  CKContainerSetupInfo *containerSetupInfo;
  NSData *v67;
  NSData *sourceProcessData;
  _SWCollaborationMetadataType *v69;
  _SWCollaborationMetadataType *type;
  NSPersonNameComponents *v71;
  NSPersonNameComponents *v72;

  v71 = (NSPersonNameComponents *)a11;
  if (a3)
  {
    v22 = a15;
    v23 = a14;
    v24 = a13;
    v25 = a12;
    v26 = a10;
    v27 = a9;
    v28 = a8;
    v29 = a7;
    v30 = a6;
    v31 = a5;
    v32 = a4;
    v33 = (NSString *)objc_msgSend(a3, "copy");
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = v33;
  }
  else
  {
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = (NSString *)&stru_1E217B478;
    v35 = a15;
    v36 = a14;
    v37 = a13;
    v38 = a12;
    v39 = a10;
    v40 = a9;
    v41 = a8;
    v42 = a7;
    v43 = a6;
    v44 = a5;
    v45 = a4;
  }

  v46 = (NSString *)objc_msgSend(a4, "copy");
  collaborationIdentifier = self->_collaborationIdentifier;
  self->_collaborationIdentifier = v46;

  v48 = (NSString *)objc_msgSend(a5, "copy");
  title = self->_title;
  self->_title = v48;

  v50 = (SWCollaborationShareOptions *)objc_msgSend(a6, "copy");
  defaultShareOptions = self->_defaultShareOptions;
  self->_defaultShareOptions = v50;

  v52 = (NSArray *)objc_msgSend(a7, "copy");
  defaultOptions = self->_defaultOptions;
  self->_defaultOptions = v52;

  v54 = (NSDate *)objc_msgSend(a8, "copy");
  creationDate = self->_creationDate;
  self->_creationDate = v54;

  v56 = (UTType *)objc_msgSend(a9, "copy");
  contentType = self->_contentType;
  self->_contentType = v56;

  v58 = (NSString *)objc_msgSend(a10, "copy");
  initiatorHandle = self->_initiatorHandle;
  self->_initiatorHandle = v58;

  initiatorNameComponents = self->_initiatorNameComponents;
  self->_initiatorNameComponents = v71;
  v72 = v71;

  v61 = (NSArray *)objc_msgSend(a12, "copy");
  ckAppBundleIDs = self->_ckAppBundleIDs;
  self->_ckAppBundleIDs = v61;

  v63 = (NSDictionary *)objc_msgSend(a13, "copy");
  handleToIdentityMap = self->_handleToIdentityMap;
  self->_handleToIdentityMap = v63;

  v65 = (CKContainerSetupInfo *)objc_msgSend(a14, "copy");
  containerSetupInfo = self->_containerSetupInfo;
  self->_containerSetupInfo = v65;

  v67 = (NSData *)objc_msgSend(a15, "copy");
  sourceProcessData = self->_sourceProcessData;
  self->_sourceProcessData = v67;

  +[_SWCollaborationMetadataType collaboration](_SWCollaborationMetadataType, "collaboration");
  v69 = (_SWCollaborationMetadataType *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v69;

}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 defaultOptions:(id)a7 creationDate:(id)a8 contentType:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 ckAppBundleIDs:(id)a12 handleToIdentityMap:(id)a13 containerSetupInfo:(id)a14 sourceProcessData:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SWCollaborationMetadata *v29;
  SWCollaborationMetadata *v30;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v20 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v37.receiver = self;
  v37.super_class = (Class)SWCollaborationMetadata;
  v29 = -[SWCollaborationMetadata init](&v37, sel_init);
  v30 = v29;
  if (v29)
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v29, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v20, v36, v35, v34, v33, v21, v22, v23, v24, v25, v26, v27, v28);

  return v30;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8 sourceProcessData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SWCollaborationMetadata *v22;
  void *v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = -[SWCollaborationMetadata init](self, "init");
  if (v22)
  {
    objc_msgSend(v17, "optionsGroups");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v22, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v15, v16, v17, v23, 0, 0, v18, v19, 0, 0, v20, v21);

  }
  return v22;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SWCollaborationMetadata *v20;
  void *v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = -[SWCollaborationMetadata init](self, "init");
  if (v20)
  {
    objc_msgSend(v16, "optionsGroups");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v20, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v14, v15, v16, v21, 0, 0, v17, v18, 0, 0, v19, 0);

  }
  return v20;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SWCollaborationMetadata *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[SWCollaborationMetadata init](self, "init");
  if (v17)
  {
    objc_msgSend(v14, "optionsGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v17, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v12, v13, v14, v18, 0, 0, v15, v16, 0, 0, 0, 0);

  }
  return v17;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SWCollaborationMetadata *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[SWCollaborationMetadata init](self, "init");
  if (v17)
  {
    +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v17, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v12, v13, v18, v14, 0, 0, v15, v16, 0, 0, 0, 0);

  }
  return v17;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 initiatorHandle:(id)a6 initiatorNameComponents:(id)a7 containerSetupInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SWCollaborationMetadata *v20;
  void *v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = -[SWCollaborationMetadata init](self, "init");
  if (v20)
  {
    +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationMetadata _commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v20, "_commonInitWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v14, v15, v21, v16, 0, 0, v17, v18, 0, 0, v19, 0);

  }
  return v20;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SWCollaborationMetadata *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v20, "optionsGroups");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v22, v21, v20, v23, v19, v18, v17, v16, 0, 0, 0, 0);

  return v24;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9 containerSetupInfo:(id)a10 sourceProcessData:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  SWCollaborationMetadata *v29;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v23, "optionsGroups");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v25, v24, v23, v26, v22, v21, v20, v19, 0, 0, v18, v17);

  return v29;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SWCollaborationMetadata *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v22, v21, v23, v20, v19, v18, v17, v16, 0, 0, 0, 0);

  return v24;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SWCollaborationMetadata *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v14, "optionsGroups");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v16, v15, v14, v17, v13, v12, 0, 0, 0, 0, 0, 0);

  return v18;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 containerSetupInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SWCollaborationMetadata *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v19, v18, v20, v17, v16, v15, 0, 0, 0, 0, v14, 0);

  return v21;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  SWCollaborationMetadata *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v16, v15, v17, v14, v13, v12, 0, 0, 0, 0, 0, 0);

  return v18;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SWCollaborationMetadata *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "optionsGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v10, v9, v8, v11, 0, 0, 0, 0, 0, 0, 0, 0);

  return v12;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SWCollaborationMetadata *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v10, v9, v11, v8, 0, 0, 0, 0, 0, 0, 0, 0);

  return v12;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SWCollaborationMetadata *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v17, "optionsGroups");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v19, v18, v17, v20, v16, v15, 0, 0, v14, 0, 0, 0);

  return v21;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SWCollaborationMetadata *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v19, v18, v20, v17, v16, v15, 0, 0, v14, 0, 0, 0);

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SWCollaborationMetadata *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "optionsGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v13, v12, v11, v10, v14, 0, 0, 0, 0, 0, 0, 0, 0);

  return v15;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SWCollaborationMetadata *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v13, v12, v11, v14, v10, 0, 0, 0, 0, 0, 0, 0, 0);

  return v15;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SWCollaborationMetadata *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v16, "optionsGroups");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v19, v18, v17, v16, v20, 0, 0, v15, v14, 0, 0, 0, 0);

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 initiatorHandle:(id)a7 initiatorNameComponents:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  SWCollaborationMetadata *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v19, v18, v17, v20, v16, 0, 0, v15, v14, 0, 0, 0, 0);

  return v21;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SWCollaborationMetadata *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v19, "optionsGroups");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v22, v21, v20, v19, v23, v18, v17, 0, 0, v16, 0, 0, 0);

  return v24;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SWCollaborationMetadata *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v22, v21, v20, v23, v19, v18, v17, 0, 0, v16, 0, 0, 0);

  return v24;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11 containerSetupInfo:(id)a12 sourceProcessData:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  SWCollaborationMetadata *v33;

  v29 = a13;
  v18 = a12;
  v28 = a11;
  v27 = a10;
  v19 = a9;
  v20 = a8;
  v26 = a7;
  v21 = a6;
  v25 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v21, "optionsGroups");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v23, v22, v25, v21, v31, v26, v20, v27, v28, v19, 0, v18, v29);

  return v33;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultShareOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  SWCollaborationMetadata *v29;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v22, "optionsGroups");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v25, v24, v23, v22, v26, v21, v20, v18, v17, v19, 0, 0, 0);

  return v29;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4 title:(id)a5 defaultOptions:(id)a6 creationDate:(id)a7 contentType:(id)a8 ckAppBundleIDs:(id)a9 initiatorHandle:(id)a10 initiatorNameComponents:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  SWCollaborationMetadata *v29;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v25, v24, v23, v26, v22, v21, v20, v18, v17, v19, 0, 0, 0);

  return v29;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultShareOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SWCollaborationMetadata *v26;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v22, "optionsGroups");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v24, v23, v22, v25, v21, v20, v18, v17, v19, 0, 0, 0);

  return v26;
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(id)a3 title:(id)a4 defaultOptions:(id)a5 creationDate:(id)a6 contentType:(id)a7 ckAppBundleIDs:(id)a8 initiatorHandle:(id)a9 initiatorNameComponents:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SWCollaborationMetadata *v26;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  +[SWCollaborationShareOptions shareOptionsWithOptionsGroups:](SWCollaborationShareOptions, "shareOptionsWithOptionsGroups:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, v24, v23, v25, v22, v21, v20, v18, v17, v19, 0, 0, 0);

  return v26;
}

- (SWCollaborationMetadata)initWithLocalIdentifier:(SWLocalCollaborationIdentifier)localIdentifier
{
  return -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", localIdentifier, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (SWCollaborationMetadata)initWithCollaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier
{
  return -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", 0, collaborationIdentifier, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" collaborationIdentifier=%@"), v4);

  -[SWCollaborationMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" title=%@"), v5);

  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" defaultShareOptions=%@"), v6);

  -[SWCollaborationMetadata userSelectedShareOptions](self, "userSelectedShareOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" userSelectedShareOptions=%@"), v7);

  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" initiatorHandle=%@"), v8);

  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" initiatorNameComponents=%@"), v9);

  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handleToIdentityMap=%@"), v10);

  -[SWCollaborationMetadata type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" type=%@"), v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SWCollaborationMetadata isEqualToCollaborationMetadata:](self, "isEqualToCollaborationMetadata:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationMetadata:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _BYTE v103[12];
  int v104;
  _BYTE v105[12];
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _BOOL4 v119;
  int v120;
  id v121;

  v4 = a3;
  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v121 = (id)objc_claimAutoreleasedReturnValue();
  if (v121
    || (objc_msgSend(v4, "collaborationIdentifier"), (v102 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collaborationIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v5;
    v6 = objc_msgSend(v5, "isEqual:");
    v7 = 1;
    if (!v6)
    {
      v119 = 0;
      v120 = 1;
      v107 = 0;
      v117 = 0;
      v118 = 0;
      v115 = 0;
      v116 = 0;
      v104 = 0;
      memset(v105, 0, sizeof(v105));
      v113 = 0;
      v114 = 0;
      memset(v103, 0, sizeof(v103));
      v111 = 0uLL;
      v8 = 0;
      v112 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LOBYTE(v106) = 0;
      goto LABEL_5;
    }
  }
  else
  {
    v102 = 0;
    v7 = 0;
  }
  -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v99 == 0;
  v120 = v7;
  if (v99 || (objc_msgSend(v4, "localIdentifier"), (v95 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v17;
    if (!objc_msgSend(v17, "isEqual:"))
    {
      v107 = 1;
      v116 = 0;
      v117 = 0;
      v104 = 0;
      memset(v105, 0, sizeof(v105));
      v114 = 0;
      v115 = 0;
      v112 = 0;
      v113 = 0;
      memset(v103, 0, sizeof(v103));
      v111 = 0uLL;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LOBYTE(v106) = 0;
      v118 = 1;
      goto LABEL_5;
    }
    v18 = 1;
  }
  else
  {
    v95 = 0;
    v18 = 0;
  }
  -[SWCollaborationMetadata title](self, "title");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v118) = v18;
  HIDWORD(v118) = v96 == 0;
  if (v96 || (objc_msgSend(v4, "title"), (v91 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v19;
    if (!objc_msgSend(v19, "isEqual:"))
    {
      v107 = 1;
      *(_QWORD *)v105 = 0;
      v115 = 0;
      v116 = 0;
      v113 = 0;
      v114 = 0;
      memset(v103, 0, sizeof(v103));
      v111 = 0uLL;
      v8 = 0;
      v112 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v104 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      v117 = 1;
      goto LABEL_5;
    }
    v20 = 1;
  }
  else
  {
    v91 = 0;
    v20 = 0;
  }
  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v117) = v20;
  HIDWORD(v117) = v92 == 0;
  if (v92 || (objc_msgSend(v4, "defaultShareOptions"), (v87 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultShareOptions");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v21;
    if (!objc_msgSend(v21, "isEqual:"))
    {
      v107 = 1;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000000;
      v114 = 0;
      v115 = 0;
      v112 = 0;
      v113 = 0;
      memset(v103, 0, sizeof(v103));
      v111 = 0uLL;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      v116 = 1;
      goto LABEL_5;
    }
    LODWORD(v116) = 1;
  }
  else
  {
    v87 = 0;
    LODWORD(v116) = 0;
  }
  -[SWCollaborationMetadata userSelectedShareOptions](self, "userSelectedShareOptions");
  v22 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v116) = v22 == 0;
  v88 = (void *)v22;
  if (v22 || (objc_msgSend(v4, "userSelectedShareOptions"), (v83 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata userSelectedShareOptions](self, "userSelectedShareOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelectedShareOptions");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      v107 = 1;
      v113 = 0;
      v114 = 0;
      memset(v103, 0, sizeof(v103));
      v111 = 0uLL;
      v8 = 0;
      v112 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      LOBYTE(v106) = 0;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000001;
      v115 = 1;
      goto LABEL_5;
    }
    LODWORD(v115) = 1;
  }
  else
  {
    v83 = 0;
    LODWORD(v115) = 0;
  }
  -[SWCollaborationMetadata creationDate](self, "creationDate");
  v24 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v115) = v24 == 0;
  v84 = (void *)v24;
  if (v24 || (objc_msgSend(v4, "creationDate"), (v79 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata creationDate](self, "creationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v25;
    if (!objc_msgSend(v25, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      *(_QWORD *)v103 = 0;
      v112 = 0;
      v113 = 0;
      v111 = 0uLL;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      v114 = 1;
      goto LABEL_5;
    }
    LODWORD(v114) = 1;
  }
  else
  {
    v79 = 0;
    LODWORD(v114) = 0;
  }
  -[SWCollaborationMetadata contentType](self, "contentType");
  v26 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v114) = v26 == 0;
  v80 = (void *)v26;
  if (v26 || (objc_msgSend(v4, "contentType"), (v75 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata contentType](self, "contentType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      *(_QWORD *)v103 = 0x100000000;
      v111 = 0uLL;
      v8 = 0;
      v112 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      v113 = 1;
      goto LABEL_5;
    }
    LODWORD(v113) = 1;
  }
  else
  {
    v75 = 0;
    LODWORD(v113) = 0;
  }
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v28 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v113) = v28 == 0;
  v76 = (void *)v28;
  if (v28 || (objc_msgSend(v4, "ckAppBundleIDs"), (v71 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ckAppBundleIDs");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v8 = 0;
      v112 = 0;
      v9 = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      *(_QWORD *)v103 = 0x100000001;
      v111 = 1uLL;
      goto LABEL_5;
    }
    LODWORD(v111) = 1;
  }
  else
  {
    v71 = 0;
    LODWORD(v111) = 0;
  }
  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v30 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v112) = v30 == 0;
  v72 = (void *)v30;
  if (v30 || (objc_msgSend(v4, "initiatorHandle"), (v67 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initiatorHandle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v9 = 0;
      LODWORD(v112) = 0;
      *(_QWORD *)((char *)&v111 + 4) = 0;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      v8 = 1;
      HIDWORD(v111) = 1;
      goto LABEL_5;
    }
    HIDWORD(v111) = 1;
  }
  else
  {
    v67 = 0;
    HIDWORD(v111) = 0;
  }
  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v32 = objc_claimAutoreleasedReturnValue();
  LODWORD(v112) = v32 == 0;
  v68 = (void *)v32;
  if (v32 || (objc_msgSend(v4, "initiatorNameComponents"), (v63 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initiatorNameComponents");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v10 = 0;
      v109 = 0;
      v110 = 0;
      v11 = 0;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_QWORD *)v105 = 0x100000001;
      *(_DWORD *)&v103[8] = 1;
      *(_QWORD *)v103 = 0x100000001;
      v8 = 1;
      v9 = 1;
      *(_QWORD *)((char *)&v111 + 4) = 1;
      goto LABEL_5;
    }
    DWORD1(v111) = 1;
  }
  else
  {
    v63 = 0;
    DWORD1(v111) = 0;
  }
  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v34 = objc_claimAutoreleasedReturnValue();
  DWORD2(v111) = v34 == 0;
  v64 = (void *)v34;
  if (v34 || (objc_msgSend(v4, "handleToIdentityMap"), (v59 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleToIdentityMap");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v11 = 0;
      v108 = 0;
      v109 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      v8 = 1;
      v9 = 1;
      v10 = 1;
      v110 = 1;
      goto LABEL_5;
    }
    LODWORD(v110) = 1;
  }
  else
  {
    v59 = 0;
    LODWORD(v110) = 0;
  }
  -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
  v36 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v110) = v36 == 0;
  v60 = (void *)v36;
  if (v36 || (objc_msgSend(v4, "sourceProcessData"), (v55 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceProcessData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v12 = 0;
      v108 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      v8 = 1;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v109 = 1;
      goto LABEL_5;
    }
    LODWORD(v109) = 1;
  }
  else
  {
    v55 = 0;
    LODWORD(v109) = 0;
  }
  -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
  v38 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v109) = v38 == 0;
  v56 = (void *)v38;
  if (v38 || (objc_msgSend(v4, "containerSetupInfo"), (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerSetupInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      v104 = 0;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      v8 = 1;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v108 = 1;
      goto LABEL_5;
    }
    LODWORD(v108) = 1;
  }
  else
  {
    v51 = 0;
    LODWORD(v108) = 0;
  }
  -[SWCollaborationMetadata userSelectedOptions](self, "userSelectedOptions");
  v40 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v108) = v40 == 0;
  v52 = (void *)v40;
  if (v40 || (objc_msgSend(v4, "userSelectedOptions"), (v47 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata userSelectedOptions](self, "userSelectedOptions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelectedOptions");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      LOBYTE(v106) = 0;
      v107 = 1;
      v14 = 0;
      v15 = 0;
      *(_DWORD *)&v105[4] = 1;
      *(_DWORD *)&v105[8] = 1;
      *(_DWORD *)v105 = 1;
      *(_DWORD *)&v103[4] = 1;
      *(_DWORD *)&v103[8] = 1;
      *(_DWORD *)v103 = 1;
      v8 = 1;
      v9 = 1;
      v10 = 1;
      v11 = 1;
      v12 = 1;
      v13 = 1;
      v104 = 1;
      goto LABEL_5;
    }
    v104 = 1;
  }
  else
  {
    v47 = 0;
    v104 = 0;
  }
  -[SWCollaborationMetadata type](self, "type");
  v42 = objc_claimAutoreleasedReturnValue();
  v45 = v42 == 0;
  v48 = (void *)v42;
  if (v42 || (objc_msgSend(v4, "type"), (v46 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationMetadata type](self, "type");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v106) = objc_msgSend(v43, "isEqual:", v44);
    v107 = 1;
    *(_DWORD *)&v105[4] = 1;
    *(_DWORD *)&v105[8] = 1;
    *(_DWORD *)v105 = 1;
    *(_DWORD *)&v103[4] = 1;
    *(_DWORD *)&v103[8] = 1;
    *(_DWORD *)v103 = 1;

    v15 = v45;
    v14 = 1;
    v8 = 1;
    v13 = 1;
    v9 = 1;
    v12 = 1;
    v10 = 1;
    v11 = 1;
  }
  else
  {
    v48 = 0;
    v46 = 0;
    LOBYTE(v106) = 1;
    v107 = 1;
    *(_DWORD *)&v105[8] = 1;
    *(_QWORD *)v105 = 0x100000001;
    *(_DWORD *)&v103[8] = 1;
    *(_QWORD *)v103 = 0x100000001;
    v8 = 1;
    v9 = 1;
    v10 = 1;
    v11 = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
  }
LABEL_5:
  if (v15)

  if (v14)
  if (v104)
  {

  }
  if (HIDWORD(v108))

  if (v13)
  if ((_DWORD)v108)
  {

  }
  if (HIDWORD(v109))

  if (v12)
  if ((_DWORD)v109)
  {

  }
  if (HIDWORD(v110))

  if (v11)
  if ((_DWORD)v110)
  {

  }
  if (DWORD2(v111))

  if (v10)
  if (DWORD1(v111))
  {

  }
  if ((_DWORD)v112)

  if (v9)
  if (HIDWORD(v111))
  {

  }
  if (HIDWORD(v112))

  if (v8)
  if ((_DWORD)v111)
  {

  }
  if (HIDWORD(v113))

  if (*(_DWORD *)v103)
  if ((_DWORD)v113)
  {

  }
  if (HIDWORD(v114))

  if (*(_DWORD *)&v103[4])
  if ((_DWORD)v114)
  {

  }
  if (HIDWORD(v115))

  if (*(_DWORD *)&v103[8])
  {

    if (!(_DWORD)v115)
      goto LABEL_63;
  }
  else if (!(_DWORD)v115)
  {
LABEL_63:
    if (!HIDWORD(v116))
      goto LABEL_65;
    goto LABEL_64;
  }

  if (HIDWORD(v116))
LABEL_64:

LABEL_65:
  if (*(_DWORD *)v105)

  if ((_DWORD)v116)
  {

  }
  if (HIDWORD(v117))

  if (*(_DWORD *)&v105[4])
  {

    if (!(_DWORD)v117)
      goto LABEL_73;
  }
  else if (!(_DWORD)v117)
  {
LABEL_73:
    if (!HIDWORD(v118))
      goto LABEL_75;
    goto LABEL_74;
  }

  if (HIDWORD(v118))
LABEL_74:

LABEL_75:
  if (*(_DWORD *)&v105[8])
  {

    if (!(_DWORD)v118)
      goto LABEL_77;
  }
  else if (!(_DWORD)v118)
  {
LABEL_77:
    if (!v119)
      goto LABEL_79;
    goto LABEL_78;
  }

  if (v119)
LABEL_78:

LABEL_79:
  if (v107)

  if (v120)
  {

  }
  if (!v121)

  return v106;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash") ^ v3;
  -[SWCollaborationMetadata title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v29, "hash");
  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v28, "hash");
  -[SWCollaborationMetadata userSelectedShareOptions](self, "userSelectedShareOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "hash");
  -[SWCollaborationMetadata creationDate](self, "creationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v26, "hash");
  -[SWCollaborationMetadata contentType](self, "contentType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v25, "hash");
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");
  -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SWCollaborationMetadata type](self, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v18 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata defaultOptions](self, "defaultOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata contentType](self, "contentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v20, v15, v13, v17, v16, v14, v12, v4, v5, v6, v7, v8, v9);

  -[SWCollaborationMetadata type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setType:", v10);

  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _SWMutableCollaborationMetadata *v18;
  _SWMutableCollaborationMetadata *v19;
  void *v20;

  v18 = +[SWCollaborationMetadata allocWithZone:](_SWMutableCollaborationMetadata, "allocWithZone:", a3);
  -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata defaultOptions](self, "defaultOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata contentType](self, "contentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](v18, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v20, v15, v13, v17, v16, v14, v12, v4, v5, v6, v7, v8, v9);

  -[SWCollaborationMetadata type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationMetadata setType:](v19, "setType:", v10);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationMetadata)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  SWCollaborationMetadata *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_collaborationIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  NSStringFromSelector(sel_localIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_title);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultShareOptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, v13);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userSelectedShareOptions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, v17);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  NSStringFromSelector(sel_creationDate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v18, v19);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  NSStringFromSelector(sel_contentType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ckAppBundleIDs);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_opt_class();
  NSStringFromSelector(sel_initiatorHandle);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_opt_class();
  NSStringFromSelector(sel_initiatorNameComponents);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v31, v32);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0C99E20];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  v58[2] = objc_opt_class();
  v58[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handleToIdentityMap);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v35, v36);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_opt_class();
  NSStringFromSelector(sel_containerSetupInfo);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v37, v38);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_opt_class();
  NSStringFromSelector(sel_sourceProcessData);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_opt_class();
  NSStringFromSelector(sel_type);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "optionsGroups");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[SWCollaborationMetadata initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:](self, "initWithLocalIdentifier:collaborationIdentifier:title:defaultShareOptions:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:ckAppBundleIDs:handleToIdentityMap:containerSetupInfo:sourceProcessData:", v55, v57, v53, v56, v45, v51, v22, v30, v50, v27, v49, v48, v41);

  -[SWCollaborationMetadata setUserSelectedShareOptions:](v46, "setUserSelectedShareOptions:", v52);
  -[SWCollaborationMetadata setType:](v46, "setType:", v44);

  return v46;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  -[SWCollaborationMetadata collaborationIdentifier](self, "collaborationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWCollaborationMetadata localIdentifier](self, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SWCollaborationMetadata title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[SWCollaborationMetadata defaultShareOptions](self, "defaultShareOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultShareOptions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[SWCollaborationMetadata userSelectedShareOptions](self, "userSelectedShareOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userSelectedShareOptions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[SWCollaborationMetadata creationDate](self, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_creationDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[SWCollaborationMetadata contentType](self, "contentType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contentType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[SWCollaborationMetadata ckAppBundleIDs](self, "ckAppBundleIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ckAppBundleIDs);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[SWCollaborationMetadata initiatorHandle](self, "initiatorHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorHandle);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[SWCollaborationMetadata initiatorNameComponents](self, "initiatorNameComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorNameComponents);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[SWCollaborationMetadata handleToIdentityMap](self, "handleToIdentityMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handleToIdentityMap);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[SWCollaborationMetadata sourceProcessData](self, "sourceProcessData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sourceProcessData);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[SWCollaborationMetadata containerSetupInfo](self, "containerSetupInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerSetupInfo);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  -[SWCollaborationMetadata type](self, "type");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, v31);

}

- (NSArray)userSelectedOptions
{
  return self->_userSelectedOptions;
}

- (void)setUserSelectedOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SWCollaborationShareOptions)userSelectedShareOptions
{
  return self->_userSelectedShareOptions;
}

- (void)setUserSelectedShareOptions:(SWCollaborationShareOptions *)userSelectedShareOptions
{
  objc_setProperty_nonatomic_copy(self, a2, userSelectedShareOptions, 16);
}

- (SWCollaborationIdentifier)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SWLocalCollaborationIdentifier)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 40);
}

- (SWCollaborationShareOptions)defaultShareOptions
{
  return self->_defaultShareOptions;
}

- (void)setDefaultShareOptions:(SWCollaborationShareOptions *)defaultShareOptions
{
  objc_setProperty_nonatomic_copy(self, a2, defaultShareOptions, 48);
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(NSString *)initiatorHandle
{
  objc_setProperty_nonatomic_copy(self, a2, initiatorHandle, 56);
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (void)setInitiatorNameComponents:(NSPersonNameComponents *)initiatorNameComponents
{
  objc_storeStrong((id *)&self->_initiatorNameComponents, initiatorNameComponents);
}

- (NSArray)defaultOptions
{
  return self->_defaultOptions;
}

- (void)setDefaultOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)ckAppBundleIDs
{
  return self->_ckAppBundleIDs;
}

- (void)setCkAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (NSDictionary)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void)setHandleToIdentityMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, a3);
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_containerSetupInfo, a3);
}

- (NSData)sourceProcessData
{
  return self->_sourceProcessData;
}

- (void)setSourceProcessData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceProcessData, a3);
}

- (_SWCollaborationMetadataType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sourceProcessData, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_ckAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_defaultShareOptions, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_userSelectedShareOptions, 0);
  objc_storeStrong((id *)&self->_userSelectedOptions, 0);
}

@end
