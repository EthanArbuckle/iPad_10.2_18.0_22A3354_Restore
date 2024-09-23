@implementation CLSMultipleChoiceAnswerItem

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40AAB20;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB810 != -1)
    dispatch_once(&qword_1ED0FB810, block);
  return (id)qword_1ED0FB808;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSMultipleChoiceAnswerItem;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSMultipleChoiceAnswerItem)initWithText:(id)a3
{
  id v5;
  id *v6;
  CLSMultipleChoiceAnswerItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSMultipleChoiceAnswerItem;
  v6 = -[CLSObject _init](&v9, sel__init);
  v7 = (CLSMultipleChoiceAnswerItem *)v6;
  if (v6)
    objc_storeStrong(v6 + 13, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend__init(v7, v8, v9);
  objc_msgSend_objectID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_setObjectID_(v10, v17, (uint64_t)v16);

  objc_msgSend_dateCreated(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v20, v21, v22);
  objc_msgSend_setDateCreated_(v10, v24, (uint64_t)v23);

  objc_msgSend_dateLastModified(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_copy(v27, v28, v29);
  objc_msgSend_setDateLastModified_(v10, v31, (uint64_t)v30);

  objc_msgSend_parentObjectID(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_copy(v34, v35, v36);
  objc_msgSend_setParentObjectID_(v10, v38, (uint64_t)v37);

  v41 = objc_msgSend_displayOrder(self, v39, v40);
  objc_msgSend_setDisplayOrder_(v10, v42, v41);
  objc_msgSend_itemText(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend_copy(v45, v46, v47);
  objc_msgSend_setItemText_(v10, v49, (uint64_t)v48);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend_assets(self, v50, v51, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v63, v67, 16);
  if (v54)
  {
    v57 = v54;
    v58 = *(_QWORD *)v64;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v64 != v58)
          objc_enumerationMutation(v52);
        v60 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v63 + 1) + 8 * v59), v55, v56);
        objc_msgSend_addAsset_(v10, v61, (uint64_t)v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v63, v67, 16);
    }
    while (v57);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSMultipleChoiceAnswerItem)initWithCoder:(id)a3
{
  id v4;
  CLSMultipleChoiceAnswerItem *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *itemText;
  const char *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSMultipleChoiceAnswerItem;
  v5 = -[CLSObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("itemText"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemText = v5->_itemText;
    v5->_itemText = (NSString *)v8;

    v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("displayOrder"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSMultipleChoiceAnswerItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_itemText, CFSTR("itemText"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_displayOrder, CFSTR("displayOrder"));

}

- (NSString)itemText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_itemText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setItemText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *itemText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  itemText = self->_itemText;
  v12 = (id)v8;
  if (v8 | (unint64_t)itemText
    && (!v8 || !itemText || (objc_msgSend_isEqualToString_(itemText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_itemText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
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

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  char v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  char v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_65;
  }
  v9 = v8;
  objc_msgSend_objectID(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend_objectID(v9, v12, v13), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_objectID(self, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_61;
    v3 = (void *)v15;
    objc_msgSend_objectID(v9, v16, v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend_objectID(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v9, v21, v22);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v20, v23, (uint64_t)v6) & 1) != 0)
      {
        v80 = v20;
        v24 = 1;
        goto LABEL_11;
      }

    }
LABEL_60:

    goto LABEL_61;
  }
  v24 = 0;
LABEL_11:
  objc_msgSend_parentObjectID(self, v12, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v24;
  if (v28 || (objc_msgSend_parentObjectID(v9, v26, v27), (v81 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_parentObjectID(self, v26, v27);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v25 = 0;
      goto LABEL_18;
    }
    v32 = (void *)v29;
    objc_msgSend_parentObjectID(v9, v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

      if (v28)
      else

      if ((v82 & 1) == 0)
        goto LABEL_61;

      goto LABEL_59;
    }
    v77 = v32;
    v78 = (void *)v33;
    v79 = v6;
    objc_msgSend_parentObjectID(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentObjectID(v9, v37, v38);
    v24 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v36, v39, v24) & 1) == 0)
    {

      if (v28)
      else

      if ((v82 & 1) == 0)
        goto LABEL_61;
      goto LABEL_58;
    }
    v72 = (void *)v24;
    v73 = v36;
    v76 = 1;
  }
  else
  {
    v79 = v6;
    v81 = 0;
    v76 = 0;
  }
  objc_msgSend_itemText(self, v26, v27);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    objc_msgSend_itemText(v9, v42, v43);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v75)
    {
      v68 = v5;
      v75 = 0;
      v69 = 0;
LABEL_43:
      v57 = objc_msgSend_displayOrder(self, v42, v43);
      if (v57 == objc_msgSend_displayOrder(v9, v58, v59))
      {
        objc_msgSend_assets(v9, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_assetsEqual_(self, v63, (uint64_t)v62);

        if ((v69 & 1) != 0)
        {
          v5 = v68;
LABEL_46:

          v64 = v44;
          if (v44)
          {

LABEL_68:
            if ((v76 & 1) != 0)
            {

            }
            v40 = v82;
            v6 = v79;
            if (v28)
              goto LABEL_20;
            v41 = v81;
            goto LABEL_19;
          }
LABEL_67:
          v67 = v64;

          goto LABEL_68;
        }
        v5 = v68;
        v64 = v44;
        if (!v44)
          goto LABEL_67;
        goto LABEL_75;
      }
      if ((v69 & 1) == 0)
      {
        v5 = v68;
        v65 = v75;
        if (v44)
          goto LABEL_73;
        goto LABEL_51;
      }

      v5 = v68;
LABEL_50:
      v64 = v44;
      v65 = v75;
      if (v44)
      {
LABEL_74:
        v25 = 0;
LABEL_75:

        if ((v76 & 1) == 0)
        {
          v40 = v82;
          v41 = v81;
          v6 = v79;
          if (v28)
          {
LABEL_20:

            if ((v40 & 1) != 0)
            {

            }
            goto LABEL_62;
          }
LABEL_19:

          goto LABEL_20;
        }

        v6 = v79;
LABEL_18:
        v40 = v82;
        v41 = v81;
        if (v28)
          goto LABEL_20;
        goto LABEL_19;
      }
LABEL_51:

LABEL_73:
      v64 = v44;
      goto LABEL_74;
    }
  }
  objc_msgSend_itemText(self, v42, v43);
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_50;
  v74 = (void *)v45;
  objc_msgSend_itemText(v9, v46, v47);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v71 = (void *)v48;
    objc_msgSend_itemText(self, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemText(v9, v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v51;
    v55 = (void *)v51;
    v24 = v54;
    if (!objc_msgSend_isEqualToString_(v55, v56, v54))
    {
      v25 = 0;
      goto LABEL_46;
    }
    v68 = v5;
    v69 = 1;
    goto LABEL_43;
  }

  if (v44)
  else

  if ((v76 & 1) != 0)
  {

  }
  if (!v28)

  if ((v82 & 1) != 0)
  {
LABEL_58:

LABEL_59:
    goto LABEL_60;
  }
LABEL_61:
  v25 = 0;
LABEL_62:
  if (!v14)

LABEL_65:
  return v25;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  v16 = v13 ^ (2 * objc_msgSend_displayOrder(self, v14, v15));
  objc_msgSend_itemText(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16 ^ objc_msgSend_hash(v19, v20, v21);

  return v22;
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
  v20.super_class = (Class)CLSMultipleChoiceAnswerItem;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("itemText");
  v22[1] = CFSTR("displayOrder");
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

- (BOOL)assetsEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t i;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  char isEqual;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_assets(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  if (v10 == objc_msgSend_count(v4, v11, v12))
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v13, (uint64_t)CFSTR("displayOrder"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v14;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_sortedArrayUsingDescriptors_(v7, v17, (uint64_t)v16);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_sortedArrayUsingDescriptors_(v4, v20, (uint64_t)v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
      v4 = (id)v21;
    }
    v22 = objc_msgSend_count(v7, v17, v18);
    if (v22 < 1)
    {
      v24 = 1;
    }
    else
    {
      v23 = v22;
      v24 = 0;
      for (i = 0; i != v23; v24 = i >= v23)
      {
        v26 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectAtIndexedSubscript_(v7, v27, i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v4, v29, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v28, v31, (uint64_t)v30);

        objc_autoreleasePoolPop(v26);
        if ((isEqual & 1) == 0)
          break;
        ++i;
      }
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_becomeChildOf_(v8, v6, (uint64_t)self);

}

- (void)removeAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_removeChild_changedPropertyName_(self, v6, (uint64_t)v8, CFSTR("assets"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_itemText, 0);
}

@end
