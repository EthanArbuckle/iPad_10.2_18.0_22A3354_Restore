@implementation IDSGameCenterData

- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5
{
  double v5;

  return (IDSGameCenterData *)objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_supportsFriending_(self, a2, (uint64_t)a3, v5, a4, a5, 0);
}

- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5 supportsFriending:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  IDSGameCenterData *v14;
  IDSGameCenterData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSGameCenterData;
  v14 = -[IDSGameCenterData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactsAssociationID, a3);
    objc_storeStrong((id *)&v15->_contactsSharingState, a4);
    objc_storeStrong((id *)&v15->_contactsLastUpdatedDate, a5);
    v15->_supportsFriendingViaPush = a6;
  }

  return v15;
}

- (id)compareAgainstData:(id)a3
{
  IDSGameCenterData *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  IDSGameCenterData *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  IDSGameCenterData *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  IDSGameCenterData *v26;

  v4 = (IDSGameCenterData *)a3;
  v8 = v4;
  if (v4
    && (objc_msgSend_contactsLastUpdatedDate(v4, v5, v6, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend_contactsLastUpdatedDate(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v8;
    if (v13)
    {
      objc_msgSend_contactsLastUpdatedDate(self, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contactsLastUpdatedDate(v8, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_compare_(v18, v23, (uint64_t)v22, v24);

      if (v25 == -1)
        v17 = v8;
      else
        v17 = self;
    }
  }
  else
  {
    v17 = self;
  }
  v26 = v17;

  return v26;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_contactsAssociationID(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactsSharingState(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactsLastUpdatedDate(self, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v14;
  if (self->_supportsFriendingViaPush)
    objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("<IDSGameCenterData: %p; contactsAssociationID: %@ contactsSharingState: %@ contactsLastUpdatedDate: %@ supportsFriendingViaPush: %@>"),
      v16,
      self,
      v6,
      v10,
      v14,
      CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("<IDSGameCenterData: %p; contactsAssociationID: %@ contactsSharingState: %@ contactsLastUpdatedDate: %@ supportsFriendingViaPush: %@>"),
      v16,
      self,
      v6,
      v10,
      v14,
      CFSTR("NO"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualTo;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    isEqualTo = objc_msgSend_isEqualTo_(self, v5, (uint64_t)v4, v6);
  else
    isEqualTo = 0;

  return isEqualTo;
}

- (BOOL)isEqualTo:(id)a3
{
  void *v3;
  const char *v5;
  uint64_t v6;
  id v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  int isEqualToString;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  int isEqualToNumber;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  int isEqualToDate;
  int v71;
  int v73;
  const char *v74;
  uint64_t v75;
  double v76;

  v7 = a3;
  if (!v7)
    goto LABEL_29;
  objc_msgSend_contactsAssociationID(self, v5, v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_msgSend_contactsAssociationID(v7, v9, v10, v12), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_contactsAssociationID(self, v9, v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_26;
    v17 = (void *)v13;
    objc_msgSend_contactsAssociationID(v7, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_25;
    v22 = (void *)v18;
    objc_msgSend_contactsAssociationID(self, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contactsAssociationID(v7, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

    if (v11)
    {

      if (!isEqualToString)
        goto LABEL_29;
    }
    else
    {

      if ((isEqualToString & 1) == 0)
        goto LABEL_29;
    }
  }
  objc_msgSend_contactsSharingState(self, v9, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_msgSend_contactsSharingState(v7, v31, v32, v33), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_contactsSharingState(self, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
      goto LABEL_26;
    v17 = (void *)v34;
    objc_msgSend_contactsSharingState(v7, v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_25;
    v42 = (void *)v38;
    objc_msgSend_contactsSharingState(self, v39, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contactsSharingState(v7, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToNumber = objc_msgSend_isEqualToNumber_(v43, v48, (uint64_t)v47, v49);

    if (v11)
    {

      if (!isEqualToNumber)
        goto LABEL_29;
    }
    else
    {

      if ((isEqualToNumber & 1) == 0)
        goto LABEL_29;
    }
  }
  objc_msgSend_contactsLastUpdatedDate(self, v31, v32, v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_contactsLastUpdatedDate(v7, v51, v52, v53);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_32;
  }
  objc_msgSend_contactsLastUpdatedDate(self, v51, v52, v53);
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
  {
LABEL_26:
    if (v11)

    else
    goto LABEL_29;
  }
  v17 = (void *)v54;
  objc_msgSend_contactsLastUpdatedDate(v7, v55, v56, v57);
  v58 = objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
LABEL_25:

    goto LABEL_26;
  }
  v62 = (void *)v58;
  objc_msgSend_contactsLastUpdatedDate(self, v59, v60, v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contactsLastUpdatedDate(v7, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToDate = objc_msgSend_isEqualToDate_(v63, v68, (uint64_t)v67, v69);

  if (v11)
  {

    if (isEqualToDate)
      goto LABEL_32;
  }
  else
  {

    if ((isEqualToDate & 1) != 0)
    {
LABEL_32:
      v73 = objc_msgSend_supportsFriendingViaPush(self, v51, v52, v53);
      v71 = v73 ^ objc_msgSend_supportsFriendingViaPush(v7, v74, v75, v76) ^ 1;
      goto LABEL_30;
    }
  }
LABEL_29:
  LOBYTE(v71) = 0;
LABEL_30:

  return v71;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSGameCenterData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  IDSGameCenterData *UpdatedDate_supportsFriending;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("gs-contacts-association-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("gs-contacts-sharing-state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("gs-contacts-last-updated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, v19, CFSTR("gs-supports-friending-via-push"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend_BOOLValue(v20, v21, v22, v23);
  UpdatedDate_supportsFriending = (IDSGameCenterData *)objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_supportsFriending_(self, v25, (uint64_t)v8, v26, v12, v16, v24);

  return UpdatedDate_supportsFriending;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactsAssociationID;
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  contactsAssociationID = self->_contactsAssociationID;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)contactsAssociationID, v7, CFSTR("gs-contacts-association-id"));
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_contactsSharingState, v9, CFSTR("gs-contacts-sharing-state"));
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)self->_contactsLastUpdatedDate, v11, CFSTR("gs-contacts-last-updated"));
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v12, self->_supportsFriendingViaPush, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v16, v15, CFSTR("gs-supports-friending-via-push"));

}

- (NSString)contactsAssociationID
{
  return self->_contactsAssociationID;
}

- (void)setContactsAssociationID:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAssociationID, a3);
}

- (NSNumber)contactsSharingState
{
  return self->_contactsSharingState;
}

- (void)setContactsSharingState:(id)a3
{
  objc_storeStrong((id *)&self->_contactsSharingState, a3);
}

- (NSDate)contactsLastUpdatedDate
{
  return self->_contactsLastUpdatedDate;
}

- (void)setContactsLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_contactsLastUpdatedDate, a3);
}

- (BOOL)supportsFriendingViaPush
{
  return self->_supportsFriendingViaPush;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_contactsSharingState, 0);
  objc_storeStrong((id *)&self->_contactsAssociationID, 0);
}

@end
