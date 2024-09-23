@implementation CHLineWrappableGroup

- (CHLineWrappableGroup)initWithLines:(id)a3
{
  id v5;
  CHLineWrappableGroup *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHLineWrappableGroup *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUUID *uuid;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CHLineWrappableGroup;
  v6 = -[CHLineWrappableGroup init](&v33, sel_init);
  v12 = v6;
  if (v6)
  {
    v6->_canWrapToNextGroup = 1;
    objc_msgSend_firstObject(v5, v7, v8, v9, v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_firstObject(v5, v13, v14, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_layoutDirection = objc_msgSend_layoutDirection(v19, v20, v21, v22, v23, v24);

    }
    else
    {
      v12->_layoutDirection = 0;
    }

    objc_storeStrong((id *)&v12->_subregions, a3);
    v12->_textRegionType = 3;
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v25, v26, v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v30;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t canWrapToNextGroup;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;

  v4 = a3;
  objc_msgSend_boundingQuad(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, (uint64_t)CFSTR("boundingQuad"), v12, v13);

  canWrapToNextGroup = objc_msgSend_canWrapToNextGroup(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, canWrapToNextGroup, (uint64_t)CFSTR("canWrapToNextGroup"), v21, v22);
  v28 = objc_msgSend_layoutDirection(self, v23, v24, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, (uint64_t)CFSTR("layoutDirection"), v30, v31);
  objc_msgSend_subregions(self, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("subregions"), v39, v40);

  objc_msgSend_text(self, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v46, (uint64_t)CFSTR("text"), v48, v49);

  v55 = objc_msgSend_textRegionType(self, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInteger_forKey_(v4, v56, v55, (uint64_t)CFSTR("textRegionType"), v57, v58);
  objc_msgSend_uuid(self, v59, v60, v61, v62, v63);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v64, (uint64_t)v67, (uint64_t)CFSTR("uuid"), v65, v66);

}

- (CHLineWrappableGroup)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHLineWrappableGroup *v9;
  uint64_t v10;
  CRNormalizedQuad *boundingQuad;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *subregions;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *text;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSUUID *uuid;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CHLineWrappableGroup;
  v9 = -[CHLineWrappableGroup init](&v43, sel_init);
  if (v9)
  {
    objc_msgSend_decodeObjectForKey_(v4, v5, (uint64_t)CFSTR("boundingQuad"), v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    boundingQuad = v9->_boundingQuad;
    v9->_boundingQuad = (CRNormalizedQuad *)v10;

    v9->_canWrapToNextGroup = objc_msgSend_decodeBoolForKey_(v4, v12, (uint64_t)CFSTR("canWrapToNextGroup"), v13, v14, v15);
    v9->_layoutDirection = objc_msgSend_decodeIntegerForKey_(v4, v16, (uint64_t)CFSTR("layoutDirection"), v17, v18, v19);
    v20 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("subregions"), v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    subregions = v9->_subregions;
    v9->_subregions = (NSArray *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("text"), v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    text = v9->_text;
    v9->_text = (NSString *)v30;

    v9->_textRegionType = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)CFSTR("textRegionType"), v33, v34, v35);
    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("uuid"), v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v40;

  }
  return v9;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end
