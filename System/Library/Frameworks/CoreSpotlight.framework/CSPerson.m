@implementation CSPerson

- (void)encodeWithCSCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "beginType:", "CSPerson");
  -[CSPerson displayName](self, "displayName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  -[CSPerson handleIdentifier](self, "handleIdentifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v5, "UTF8String"), -1);

  -[CSPerson handles](self, "handles");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = v6;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v19, "encodeObject:", v9);

  -[CSPerson contactIdentifier](self, "contactIdentifier");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v10, "UTF8String"), -1);

  -[CSPerson photosPersonIdentifier](self, "photosPersonIdentifier");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "encodeString:length:", objc_msgSend(v11, "UTF8String"), -1);

  if (-[CSPerson isPhotosPerson](self, "isPhotosPerson"))
  {
    -[CSPerson nameAlternatives](self, "nameAlternatives");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = v12;
    else
      v14 = v8;
    objc_msgSend(v19, "encodeObject:", v14);

    -[CSPerson faceAttributes](self, "faceAttributes");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = v15;
    else
      v17 = v8;
    objc_msgSend(v19, "encodeObject:", v17);

    -[CSPerson personType](self, "personType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeInt32:", objc_msgSend(v18, "intValue"));

    objc_msgSend(v19, "encodeBool:", -[CSPerson isPhotosPerson](self, "isPhotosPerson"));
  }
  objc_msgSend(v19, "endType");

}

- (CSPerson)initWithDisplayName:(NSString *)displayName handles:(NSArray *)handles handleIdentifier:(NSString *)handleIdentifier
{
  NSString *v8;
  NSArray *v9;
  NSString *v10;
  CSPerson *v11;
  CSPerson *v12;
  objc_super v14;

  v8 = displayName;
  v9 = handles;
  v10 = handleIdentifier;
  v14.receiver = self;
  v14.super_class = (Class)CSPerson;
  v11 = -[CSPerson init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CSPerson setDisplayName:](v11, "setDisplayName:", v8);
    -[CSPerson setHandles:](v12, "setHandles:", v9);
    -[CSPerson setHandleIdentifier:](v12, "setHandleIdentifier:", v10);
  }

  return v12;
}

- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6
{
  return -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:](self, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:", a3, a4, a5, a6, 0, 1, 0, 0);
}

- (CSPerson)initWithDisplayName:(id)a3 handles:(id)a4 handleIdentifier:(id)a5 photosPersonIdentifier:(id)a6 isPhotosPerson:(BOOL)a7 personType:(int64_t)a8 nameAlternatives:(id)a9 faceAttributes:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CSPerson *v22;
  CSPerson *v23;
  void *v24;
  objc_super v26;

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v26.receiver = self;
  v26.super_class = (Class)CSPerson;
  v22 = -[CSPerson init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    -[CSPerson setDisplayName:](v22, "setDisplayName:", v16);
    -[CSPerson setHandles:](v23, "setHandles:", v17);
    -[CSPerson setHandleIdentifier:](v23, "setHandleIdentifier:", v18);
    -[CSPerson setPhotosPersonIdentifier:](v23, "setPhotosPersonIdentifier:", v19);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setPersonType:](v23, "setPersonType:", v24);

    -[CSPerson setNameAlternatives:](v23, "setNameAlternatives:", v20);
    -[CSPerson setFaceAttributes:](v23, "setFaceAttributes:", v21);
    -[CSPerson setIsPhotosPerson:](v23, "setIsPhotosPerson:", v11);
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CSPerson displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("displayName"));

  -[CSPerson handles](self, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("handles"));

  -[CSPerson handleIdentifier](self, "handleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("handleIdentifier"));

  -[CSPerson contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("contactIdentifier"));

  -[CSPerson photosPersonIdentifier](self, "photosPersonIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("photosPersonIdentifier"));

  if (self->_isPhotosPerson)
  {
    -[CSPerson nameAlternatives](self, "nameAlternatives");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("photosNameAlternatives"));

    -[CSPerson faceAttributes](self, "faceAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("photosFaceAttributes"));

    -[CSPerson personType](self, "personType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("personType"));

    objc_msgSend(v12, "encodeBool:forKey:", self->_isPhotosPerson, CFSTR("isPhotosPerson"));
  }

}

- (CSPerson)initWithCoder:(id)a3
{
  id v4;
  CSPerson *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CSPerson;
  v5 = -[CSPerson init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setDisplayName:](v5, "setDisplayName:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("handles"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setHandles:](v5, "setHandles:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setHandleIdentifier:](v5, "setHandleIdentifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setContactIdentifier:](v5, "setContactIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photosPersonIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPerson setPhotosPersonIdentifier:](v5, "setPhotosPersonIdentifier:", v13);

    -[CSPerson setIsPhotosPerson:](v5, "setIsPhotosPerson:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPhotosPerson")));
    if (v5->_isPhotosPerson)
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("photosNameAlternatives"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPerson setNameAlternatives:](v5, "setNameAlternatives:", v17);

      v18 = (void *)MEMORY[0x1E0C99E60];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("photosFaceAttributes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPerson setFaceAttributes:](v5, "setFaceAttributes:", v21);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPerson setPersonType:](v5, "setPersonType:", v22);

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = objc_alloc((Class)objc_opt_class());
  -[CSPerson displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPerson handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPerson handleIdentifier](self, "handleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPerson photosPersonIdentifier](self, "photosPersonIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v5, v6, v7, v8);

  -[CSPerson contactIdentifier](self, "contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContactIdentifier:", v10);

  if (self->_isPhotosPerson)
  {
    -[CSPerson personType](self, "personType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPersonType:", v11);

    -[CSPerson nameAlternatives](self, "nameAlternatives");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNameAlternatives:", v12);

    -[CSPerson faceAttributes](self, "faceAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFaceAttributes:", v13);

    objc_msgSend(v9, "setIsPhotosPerson:", -[CSPerson isPhotosPerson](self, "isPhotosPerson"));
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CSPerson displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[CSPerson displayName](self, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:"))
      {
        v9 = 0;
        goto LABEL_50;
      }
      v59 = v8;
    }
    -[CSPerson handles](self, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[CSPerson handles](self, "handles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v13))
      {
        v9 = 0;
LABEL_48:

LABEL_49:
        v8 = v59;
        if (v6 == v7)
        {
LABEL_51:

          goto LABEL_52;
        }
LABEL_50:

        goto LABEL_51;
      }
      v55 = v13;
      v56 = v12;
    }
    -[CSPerson handleIdentifier](self, "handleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)v14;
    if ((void *)v14 != v15)
    {
      v57 = v4;
      -[CSPerson handleIdentifier](self, "handleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleIdentifier");
      v53 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqualToString:"))
      {
        v9 = 0;
        v4 = v57;
LABEL_46:

LABEL_47:
        v13 = v55;
        v12 = v56;
        if (v10 == v11)
          goto LABEL_49;
        goto LABEL_48;
      }
      v4 = v57;
      v52 = v17;
    }
    -[CSPerson contactIdentifier](self, "contactIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIdentifier");
    v54 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v18;
    if (v18 != v54)
    {
      -[CSPerson contactIdentifier](self, "contactIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v19;
      if (!objc_msgSend(v19, "isEqualToString:"))
      {
        v9 = 0;
        v20 = (void *)v54;
LABEL_44:

LABEL_45:
        v17 = v52;
        if (v60 == v15)
          goto LABEL_47;
        goto LABEL_46;
      }
    }
    -[CSPerson photosPersonIdentifier](self, "photosPersonIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosPersonIdentifier");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v21 != v49)
    {
      v22 = (void *)v21;
      -[CSPerson photosPersonIdentifier](self, "photosPersonIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photosPersonIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v23;
      if ((objc_msgSend(v23, "isEqualToString:") & 1) != 0)
      {
        if (self->_isPhotosPerson)
        {
          v21 = (uint64_t)v22;
          goto LABEL_23;
        }
        v9 = 1;
      }
      else
      {
        v9 = 0;
      }
      v30 = (void *)v49;
LABEL_42:

LABEL_43:
      v20 = (void *)v54;
      if (v58 == (void *)v54)
        goto LABEL_45;
      goto LABEL_44;
    }
    if (!self->_isPhotosPerson)
    {
      v9 = 1;
      v22 = (void *)v21;
      v30 = (void *)v49;
      goto LABEL_43;
    }
LABEL_23:
    -[CSPerson personType](self, "personType");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personType");
    v45 = (void *)v24;
    v46 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v21;
    if (v24 != v46)
    {
      -[CSPerson personType](self, "personType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personType");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v25;
      if (!objc_msgSend(v25, "isEqual:"))
      {
        v9 = 0;
        v26 = v45;
        v27 = (void *)v46;
LABEL_40:

LABEL_41:
        v22 = v44;
        v30 = (void *)v49;
        if (v44 == (void *)v49)
          goto LABEL_43;
        goto LABEL_42;
      }
    }
    -[CSPerson nameAlternatives](self, "nameAlternatives");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameAlternatives");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v28 != (void *)v41)
    {
      v37 = v28;
      -[CSPerson nameAlternatives](self, "nameAlternatives");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameAlternatives");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v29;
      if (!objc_msgSend(v29, "isEqual:"))
      {
        v9 = 0;
        v33 = (void *)v41;
        v28 = v37;
        goto LABEL_38;
      }
      v28 = v37;
    }
    -[CSPerson faceAttributes](self, "faceAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceAttributes");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

      v9 = 1;
    }
    else
    {
      v38 = (void *)v32;
      -[CSPerson faceAttributes](self, "faceAttributes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "faceAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v36, "isEqual:", v35);

    }
    v33 = (void *)v41;
    if (v28 == (void *)v41)
    {
LABEL_39:

      v26 = v45;
      v27 = (void *)v46;
      if (v45 == (void *)v46)
        goto LABEL_41;
      goto LABEL_40;
    }
LABEL_38:

    goto LABEL_39;
  }
  v9 = 0;
LABEL_52:

  return v9;
}

- (unint64_t)hash
{
  NSArray *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;

  v3 = self->_handles;
  v4 = -[NSArray count](v3, "count");
  v5 = -[NSString hash](self->_displayName, "hash");
  if (v4)
  {
    -[NSArray firstObject](v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");

  }
  else
  {
    v7 = 0;
  }

  return v5 ^ v7 ^ v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CSPerson displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPerson handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ <%@>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSString)handleIdentifier
{
  return self->_handleIdentifier;
}

- (void)setHandleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_handleIdentifier, a3);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactIdentifier:(NSString *)contactIdentifier
{
  objc_setProperty_atomic_copy(self, a2, contactIdentifier, 40);
}

- (NSString)photosPersonIdentifier
{
  return self->_photosPersonIdentifier;
}

- (void)setPhotosPersonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_photosPersonIdentifier, a3);
}

- (NSArray)nameAlternatives
{
  return self->_nameAlternatives;
}

- (void)setNameAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_nameAlternatives, a3);
}

- (NSArray)faceAttributes
{
  return self->_faceAttributes;
}

- (void)setFaceAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_faceAttributes, a3);
}

- (NSNumber)personType
{
  return self->_personType;
}

- (void)setPersonType:(id)a3
{
  objc_storeStrong((id *)&self->_personType, a3);
}

- (BOOL)isPhotosPerson
{
  return self->_isPhotosPerson;
}

- (void)setIsPhotosPerson:(BOOL)a3
{
  self->_isPhotosPerson = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_nameAlternatives, 0);
  objc_storeStrong((id *)&self->_photosPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handleIdentifier, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
