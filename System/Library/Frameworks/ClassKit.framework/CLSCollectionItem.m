@implementation CLSCollectionItem

- (id)_init
{
  return (id)objc_msgSend_initWithType_(self, a2, 0);
}

- (CLSCollectionItem)initWithType:(int64_t)a3
{
  CLSCollectionItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSCollectionItem;
  result = -[CLSObject _init](&v5, sel__init);
  if (result)
    result->_type = a3;
  return result;
}

- (CLSCollectionItem)initWithHandout:(id)a3
{
  id v4;
  CLSCollectionItem *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *referenceObjectID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSCollectionItem;
  v5 = -[CLSObject _init](&v12, sel__init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5->_type = 0;
        goto LABEL_8;
      }
      v8 = 1;
    }
    v5->_type = v8;
LABEL_8:
    objc_msgSend_objectID(v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    referenceObjectID = v5->_referenceObjectID;
    v5->_referenceObjectID = (NSString *)v9;

  }
  return v5;
}

- (CLSCollectionItem)initWithContext:(id)a3
{
  id v4;
  CLSCollectionItem *v5;
  const char *v6;
  uint64_t v7;
  CLSCollectionItem *v8;
  uint64_t v9;
  NSString *referenceObjectID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSCollectionItem;
  v5 = -[CLSObject _init](&v12, sel__init);
  v8 = v5;
  if (v5)
  {
    v5->_type = 4;
    objc_msgSend_objectID(v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    referenceObjectID = v8->_referenceObjectID;
    v8->_referenceObjectID = (NSString *)v9;

  }
  return v8;
}

- (CLSCollectionItem)initWithQuestionStep:(id)a3
{
  id v4;
  CLSCollectionItem *v5;
  const char *v6;
  uint64_t v7;
  CLSCollectionItem *v8;
  uint64_t v9;
  NSString *referenceObjectID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSCollectionItem;
  v5 = -[CLSObject _init](&v12, sel__init);
  v8 = v5;
  if (v5)
  {
    v5->_type = 5;
    objc_msgSend_objectID(v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    referenceObjectID = v8->_referenceObjectID;
    v8->_referenceObjectID = (NSString *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  int isEqualToString;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  int v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  int isEqualToDate;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  int v92;
  uint64_t v94;
  const char *v95;
  uint64_t v96;

  v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    objc_msgSend_objectID(self, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_objectID(v8, v11, v12), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_objectID(self, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_43;
      v17 = (void *)v14;
      objc_msgSend_objectID(v8, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_49;
      v21 = (void *)v18;
      objc_msgSend_objectID(self, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v8, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v26, (uint64_t)v25);

      if (v13)
      {

        if (!isEqualToString)
          goto LABEL_46;
      }
      else
      {

        if ((isEqualToString & 1) == 0)
          goto LABEL_46;
      }
    }
    objc_msgSend_parentObjectID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_parentObjectID(v8, v28, v29), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_parentObjectID(self, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_43;
      v17 = (void *)v30;
      objc_msgSend_parentObjectID(v8, v31, v32);
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33)
        goto LABEL_49;
      v36 = (void *)v33;
      objc_msgSend_parentObjectID(self, v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentObjectID(v8, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_isEqualToString_(v37, v41, (uint64_t)v40);

      if (v13)
      {

        if (!v42)
          goto LABEL_46;
      }
      else
      {

        if ((v42 & 1) == 0)
          goto LABEL_46;
      }
    }
    v43 = objc_msgSend_type(self, v28, v29);
    if (v43 != objc_msgSend_type(v8, v44, v45))
      goto LABEL_46;
    objc_msgSend_dateCreated(self, v46, v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_dateCreated(v8, v48, v49), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_dateCreated(self, v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
        goto LABEL_43;
      v17 = (void *)v50;
      objc_msgSend_dateCreated(v8, v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
        goto LABEL_49;
      v56 = (void *)v53;
      objc_msgSend_dateCreated(self, v54, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateCreated(v8, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v57, v61, (uint64_t)v60);

      if (v13)
      {

        if (!isEqualToDate)
          goto LABEL_46;
      }
      else
      {

        if ((isEqualToDate & 1) == 0)
          goto LABEL_46;
      }
    }
    objc_msgSend_dateLastModified(self, v48, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend_dateLastModified(v8, v63, v64), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_dateLastModified(self, v63, v64);
      v65 = objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_43;
      v17 = (void *)v65;
      objc_msgSend_dateLastModified(v8, v66, v67);
      v68 = objc_claimAutoreleasedReturnValue();
      if (!v68)
        goto LABEL_49;
      v71 = (void *)v68;
      objc_msgSend_dateLastModified(self, v69, v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(v8, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend_isEqualToDate_(v72, v76, (uint64_t)v75);

      if (v13)
      {

        if (!v77)
          goto LABEL_46;
      }
      else
      {

        if ((v77 & 1) == 0)
          goto LABEL_46;
      }
    }
    objc_msgSend_referenceObjectID(self, v63, v64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend_referenceObjectID(v8, v78, v79);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_52;
    }
    objc_msgSend_referenceObjectID(self, v78, v79);
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v17 = (void *)v80;
      objc_msgSend_referenceObjectID(v8, v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        v86 = (void *)v83;
        objc_msgSend_referenceObjectID(self, v84, v85);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceObjectID(v8, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend_isEqualToString_(v87, v91, (uint64_t)v90);

        if (v13)
        {

          if (v92)
            goto LABEL_52;
        }
        else
        {

          if ((v92 & 1) != 0)
          {
LABEL_52:
            v94 = objc_msgSend_displayOrder(self, v78, v79);
            v7 = v94 == objc_msgSend_displayOrder(v8, v95, v96);
            goto LABEL_47;
          }
        }
LABEL_46:
        v7 = 0;
LABEL_47:

        goto LABEL_48;
      }
LABEL_49:

      if (v13)
        goto LABEL_45;
      goto LABEL_44;
    }
LABEL_43:
    if (v13)
    {
LABEL_45:

      goto LABEL_46;
    }
LABEL_44:

    goto LABEL_45;
  }
  v7 = 0;
LABEL_48:

  return v7;
}

- (BOOL)validateObject:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSCollectionItem;
  return -[CLSObject validateObject:](&v4, sel_validateObject_, a3);
}

- (CLSCollectionItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSCollectionItem *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *referenceObjectID;
  const char *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSCollectionItem;
  v6 = -[CLSObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("referenceObjectID"));
    v9 = objc_claimAutoreleasedReturnValue();
    referenceObjectID = v6->_referenceObjectID;
    v6->_referenceObjectID = (NSString *)v9;

    v6->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("displayOrder"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSCollectionItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"), v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_referenceObjectID, CFSTR("referenceObjectID"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_displayOrder, CFSTR("displayOrder"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSCollectionItem;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("type");
  v22[1] = CFSTR("referenceObjectID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLSCollectionItem;
  -[CLSObject description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  v9 = objc_msgSend_type(self, v7, v8);
  NSStringFromCollectionItemType(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("type"), v11);

  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("referenceObjectID"), self->_referenceObjectID);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, self->_displayOrder);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v16, (uint64_t)CFSTR(" (%@: %@)"), CFSTR("displayOrder"), v15);

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSCollectionItem;
  -[CLSObject dictionaryRepresentation](&v15, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_type(self, v4, v5);
  NSStringFromCollectionItemType(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("type"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_referenceObjectID, CFSTR("referenceObjectID"));
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v11, self->_displayOrder);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, CFSTR("displayOrder"));

  return v3;
}

- (void)setType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setReferenceObjectID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *referenceObjectID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  referenceObjectID = self->_referenceObjectID;
  v12 = (id)v8;
  if (v8 | (unint64_t)referenceObjectID
    && (!v8 || !referenceObjectID || (objc_msgSend_isEqualToString_(referenceObjectID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_referenceObjectID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setDisplayOrder:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)referenceObjectID
{
  return self->_referenceObjectID;
}

- (unint64_t)displayOrder
{
  return self->_displayOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceObjectID, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4078EDC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB580 != -1)
    dispatch_once(&qword_1ED0FB580, block);
  return (id)qword_1ED0FB578;
}

@end
