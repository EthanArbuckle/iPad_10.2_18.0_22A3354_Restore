@implementation CKDSharePCSData

- (CKDSharePCSData)initWithShareID:(id)a3 pcsData:(id)a4
{
  id v7;
  CKDSharePCSData *v8;
  CKDSharePCSData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDSharePCSData;
  v8 = -[CKDPCSData initWithPCSData:](&v11, sel_initWithPCSData_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_shareID, a3);

  return v9;
}

+ (CKDSharePCSData)dataWithShare:(id)a3 serviceType:(unint64_t)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_recordID(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invitedProtectionData(v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithShareID_pcsData_(v6, v13, (uint64_t)v9, v12);

  if (v14)
  {
    objc_msgSend_publicProtectionData(v5, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCSData_(v14, v18, (uint64_t)v17);

    objc_msgSend_invitedProtectionEtag(v5, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v14, v22, (uint64_t)v21);

    objc_msgSend_setServiceType_(v14, v23, a4);
    objc_msgSend_modificationDate(v5, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareModificationDate_(v14, v27, (uint64_t)v26);

    objc_msgSend_currentUserParticipant(v5, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_permission(v30, v31, v32);
    objc_msgSend_setMyParticipantPermission_(v14, v34, v33);
    v37 = objc_msgSend_role(v30, v35, v36);
    objc_msgSend_setMyParticipantRole_(v14, v38, v37);
    objc_msgSend_protectionInfo(v30, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMyParticipantPCSData_(v14, v42, (uint64_t)v41);

    v45 = objc_msgSend_publicPermission(v5, v43, v44);
    objc_msgSend_setPublicPermission_(v14, v46, v45);
    objc_msgSend_etag(v5, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareEtag_(v14, v50, (uint64_t)v49);

    objc_msgSend_publicProtectionEtag(v5, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCSEtag_(v14, v54, (uint64_t)v53);

    objc_msgSend_publicProtectionData(v5, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicPCSData_(v14, v58, (uint64_t)v57);

  }
  return (CKDSharePCSData *)v14;
}

+ (CKDSharePCSData)dataWithShareID:(id)a3 pcsData:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  v9 = (void *)objc_msgSend_initWithShareID_pcsData_(v7, v8, (uint64_t)v6, v5);

  return (CKDSharePCSData *)v9;
}

- (void)dealloc
{
  _OpaquePCSShareProtection *publicPCS;
  _OpaquePCSShareProtection *myParticipantPCS;
  _OpaquePCSShareProtection *preKeyRollInvitedPCS;
  objc_super v6;

  publicPCS = self->_publicPCS;
  if (publicPCS)
  {
    CFRelease(publicPCS);
    self->_publicPCS = 0;
  }
  myParticipantPCS = self->_myParticipantPCS;
  if (myParticipantPCS)
  {
    CFRelease(myParticipantPCS);
    self->_myParticipantPCS = 0;
  }
  preKeyRollInvitedPCS = self->_preKeyRollInvitedPCS;
  if (preKeyRollInvitedPCS)
  {
    CFRelease(preKeyRollInvitedPCS);
    self->_preKeyRollInvitedPCS = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKDSharePCSData;
  -[CKDPCSData dealloc](&v6, sel_dealloc);
}

- (void)setPublicPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *publicPCS;
  CKDSharePCSData *v5;
  CKDSharePCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  publicPCS = obj->_publicPCS;
  if (publicPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      publicPCS = obj->_publicPCS;
    }
    else
    {
      v5 = obj;
    }
    v5->_publicPCS = a3;
    if (publicPCS)
      CFRelease(publicPCS);
  }
  objc_sync_exit(obj);

}

- (void)setMyParticipantPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *myParticipantPCS;
  CKDSharePCSData *v5;
  CKDSharePCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  myParticipantPCS = obj->_myParticipantPCS;
  if (myParticipantPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      myParticipantPCS = obj->_myParticipantPCS;
    }
    else
    {
      v5 = obj;
    }
    v5->_myParticipantPCS = a3;
    if (myParticipantPCS)
      CFRelease(myParticipantPCS);
  }
  objc_sync_exit(obj);

}

- (void)setPreKeyRollInvitedPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *preKeyRollInvitedPCS;
  CKDSharePCSData *v5;
  CKDSharePCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  preKeyRollInvitedPCS = obj->_preKeyRollInvitedPCS;
  if (preKeyRollInvitedPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      preKeyRollInvitedPCS = obj->_preKeyRollInvitedPCS;
    }
    else
    {
      v5 = obj;
    }
    v5->_preKeyRollInvitedPCS = a3;
    if (preKeyRollInvitedPCS)
      CFRelease(preKeyRollInvitedPCS);
  }
  objc_sync_exit(obj);

}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  objc_super v30;

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  v30.receiver = self;
  v30.super_class = (Class)CKDSharePCSData;
  -[CKDPCSData CKPropertiesDescription](&v30, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  if (objc_msgSend_publicPCS(self, v8, v9))
  {
    v12 = objc_msgSend_publicPCS(self, v10, v11);
    objc_msgSend_appendFormat_(v7, v13, (uint64_t)CFSTR(", publicPCS=%@"), v12);
  }
  objc_msgSend_publicPCSData(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_publicPCSData(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v18, (uint64_t)CFSTR(", publicPCSData=%@"), v17);

  }
  objc_msgSend_publicPCSEtag(self, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_publicPCSEtag(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v23, (uint64_t)CFSTR(", publicPCSEtag=%@"), v22);

  }
  objc_msgSend_shareEtag(self, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_shareEtag(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v28, (uint64_t)CFSTR(", shareEtag=%@"), v27);

  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  objc_super v46;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  v46.receiver = self;
  v46.super_class = (Class)CKDSharePCSData;
  -[CKDPCSData encodeWithCoder:](&v46, sel_encodeWithCoder_, v4);
  objc_msgSend_shareID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, CFSTR("ShareID"));

  objc_msgSend_publicPCSData(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, CFSTR("PublicPCSData"));

  objc_msgSend_publicPCSEtag(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, CFSTR("PublicPCSEtag"));

  objc_msgSend_myParticipantPCSData(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, CFSTR("MyParticipantPCS"));

  v24 = objc_msgSend_myParticipantPermission(self, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v4, v25, v24, CFSTR("MyParticipantPermission"));
  v28 = objc_msgSend_myParticipantRole(self, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, CFSTR("MyParticipantType"));
  v32 = objc_msgSend_publicPermission(self, v30, v31);
  objc_msgSend_encodeInteger_forKey_(v4, v33, v32, CFSTR("PublicPermission"));
  v36 = objc_msgSend_serviceType(self, v34, v35);
  objc_msgSend_encodeInteger_forKey_(v4, v37, v36, CFSTR("ServiceType"));
  objc_msgSend_shareEtag(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v40, CFSTR("ShareEtag"));

  objc_msgSend_shareModificationDate(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, CFSTR("shareModificationDate"));

  objc_autoreleasePoolPop(v5);
}

- (CKDSharePCSData)initWithCoder:(id)a3
{
  id v4;
  CKDSharePCSData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKRecordID *shareID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSData *publicPCSData;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *publicPCSEtag;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSData *myParticipantPCSData;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *shareEtag;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSDate *shareModificationDate;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKDSharePCSData;
  v5 = -[CKDPCSData initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("ShareID"));
    v9 = objc_claimAutoreleasedReturnValue();
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("PublicPCSData"));
    v13 = objc_claimAutoreleasedReturnValue();
    publicPCSData = v5->_publicPCSData;
    v5->_publicPCSData = (NSData *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("PublicPCSEtag"));
    v17 = objc_claimAutoreleasedReturnValue();
    publicPCSEtag = v5->_publicPCSEtag;
    v5->_publicPCSEtag = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("MyParticipantPCS"));
    v21 = objc_claimAutoreleasedReturnValue();
    myParticipantPCSData = v5->_myParticipantPCSData;
    v5->_myParticipantPCSData = (NSData *)v21;

    v5->_myParticipantPermission = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("MyParticipantPermission"));
    v5->_myParticipantRole = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("MyParticipantType"));
    v5->_publicPermission = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("PublicPermission"));
    v5->_serviceType = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("ServiceType"));
    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("ShareEtag"));
    v29 = objc_claimAutoreleasedReturnValue();
    shareEtag = v5->_shareEtag;
    v5->_shareEtag = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("shareModificationDate"));
    v33 = objc_claimAutoreleasedReturnValue();
    shareModificationDate = v5->_shareModificationDate;
    v5->_shareModificationDate = (NSDate *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const void *v75;
  const char *v76;
  objc_super v78;

  v78.receiver = self;
  v78.super_class = (Class)CKDSharePCSData;
  v4 = -[CKDPCSData copyWithZone:](&v78, sel_copyWithZone_, a3);
  objc_msgSend_shareID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setShareID_(v4, v11, (uint64_t)v10);

  v14 = objc_msgSend_serviceType(self, v12, v13);
  objc_msgSend_setServiceType_(v4, v15, v14);
  objc_msgSend_shareEtag(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_copy(v18, v19, v20);
  objc_msgSend_setShareEtag_(v4, v22, (uint64_t)v21);

  v25 = objc_msgSend_publicPermission(self, v23, v24);
  objc_msgSend_setPublicPermission_(v4, v26, v25);
  v29 = objc_msgSend_myParticipantRole(self, v27, v28);
  objc_msgSend_setMyParticipantRole_(v4, v30, v29);
  v33 = objc_msgSend_myParticipantPermission(self, v31, v32);
  objc_msgSend_setMyParticipantPermission_(v4, v34, v33);
  objc_msgSend_myParticipantPCSData(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend_copy(v37, v38, v39);
  objc_msgSend_setMyParticipantPCSData_(v4, v41, (uint64_t)v40);

  objc_msgSend_publicPCSEtag(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend_copy(v44, v45, v46);
  objc_msgSend_setPublicPCSEtag_(v4, v48, (uint64_t)v47);

  objc_msgSend_publicPCSData(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend_copy(v51, v52, v53);
  objc_msgSend_setPublicPCSData_(v4, v55, (uint64_t)v54);

  objc_msgSend_shareModificationDate(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend_copy(v58, v59, v60);
  objc_msgSend_setShareModificationDate_(v4, v62, (uint64_t)v61);

  if (objc_msgSend_myParticipantPCS(self, v63, v64))
  {
    objc_msgSend_myParticipantPCS(self, v65, v66);
    v67 = (const void *)PCSFPCopyObject();
    objc_msgSend_setMyParticipantPCS_(v4, v68, (uint64_t)v67);
    if (v67)
      CFRelease(v67);
  }
  if (objc_msgSend_publicPCS(self, v65, v66))
  {
    objc_msgSend_publicPCS(self, v69, v70);
    v71 = (const void *)PCSFPCopyObject();
    objc_msgSend_setPublicPCS_(v4, v72, (uint64_t)v71);
    if (v71)
      CFRelease(v71);
  }
  if (objc_msgSend_preKeyRollInvitedPCS(self, v69, v70))
  {
    objc_msgSend_preKeyRollInvitedPCS(self, v73, v74);
    v75 = (const void *)PCSFPCopyObject();
    objc_msgSend_setPreKeyRollInvitedPCS_(v4, v76, (uint64_t)v75);
    if (v75)
      CFRelease(v75);
  }
  return v4;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (NSDate)shareModificationDate
{
  return self->_shareModificationDate;
}

- (void)setShareModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_shareModificationDate, a3);
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)shareEtag
{
  return self->_shareEtag;
}

- (void)setShareEtag:(id)a3
{
  objc_storeStrong((id *)&self->_shareEtag, a3);
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (void)setPublicPermission:(int64_t)a3
{
  self->_publicPermission = a3;
}

- (int64_t)myParticipantRole
{
  return self->_myParticipantRole;
}

- (void)setMyParticipantRole:(int64_t)a3
{
  self->_myParticipantRole = a3;
}

- (int64_t)myParticipantPermission
{
  return self->_myParticipantPermission;
}

- (void)setMyParticipantPermission:(int64_t)a3
{
  self->_myParticipantPermission = a3;
}

- (_OpaquePCSShareProtection)myParticipantPCS
{
  return self->_myParticipantPCS;
}

- (NSData)myParticipantPCSData
{
  return self->_myParticipantPCSData;
}

- (void)setMyParticipantPCSData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (_OpaquePCSShareProtection)preKeyRollInvitedPCS
{
  return self->_preKeyRollInvitedPCS;
}

- (_OpaquePCSShareProtection)publicPCS
{
  return self->_publicPCS;
}

- (NSString)publicPCSEtag
{
  return self->_publicPCSEtag;
}

- (void)setPublicPCSEtag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)publicPCSData
{
  return self->_publicPCSData;
}

- (void)setPublicPCSData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPCSData, 0);
  objc_storeStrong((id *)&self->_publicPCSEtag, 0);
  objc_storeStrong((id *)&self->_myParticipantPCSData, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_shareModificationDate, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

@end
