@implementation MOMediaPlaySession

- (MOMediaPlaySession)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 startDate:(id)a10 endDate:(id)a11 duration:(unsigned int)a12 isRemote:(BOOL)a13 deviceSource:(id)a14 bgColor:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  MOMediaPlaySession *v32;
  MOMediaPlaySession *v33;
  id obj;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  obj = a3;
  v48 = a3;
  v37 = a4;
  v47 = a4;
  v38 = a5;
  v21 = a5;
  v39 = a6;
  v22 = a6;
  v40 = a7;
  v23 = a7;
  v42 = a8;
  v24 = a8;
  v41 = a9;
  v49 = a9;
  v43 = a10;
  v25 = a10;
  v44 = a11;
  v26 = a11;
  v36 = a14;
  v46 = a14;
  v27 = a15;
  if (v25)
  {
    if (v26)
      goto LABEL_10;
    goto LABEL_7;
  }
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMediaPlaySession.m"), 33, CFSTR("Invalid parameter not satisfying: startDate != nil (in %s:%d)"), "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 33, obj, a14, a4, v38, v39, v40, a9, v42, a10,
    a11);

  if (!v26)
  {
LABEL_7:
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMediaPlaySession.m"), 34, CFSTR("Invalid parameter not satisfying: endDate != nil (in %s:%d)"), "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 34);

  }
LABEL_10:
  v50.receiver = self;
  v50.super_class = (Class)MOMediaPlaySession;
  v32 = -[MOMediaPlaySession init](&v50, sel_init);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_title, obj);
    objc_storeStrong((id *)&v33->_album, v37);
    objc_storeStrong((id *)&v33->_bundleId, v38);
    objc_storeStrong((id *)&v33->_productId, v39);
    objc_storeStrong((id *)&v33->_genre, v40);
    objc_storeStrong((id *)&v33->_mediaType, v42);
    objc_storeStrong((id *)&v33->_artist, v41);
    objc_storeStrong((id *)&v33->_startDate, v43);
    objc_storeStrong((id *)&v33->_endDate, v44);
    v33->_duration = a12;
    v33->_isRemote = a13;
    objc_storeStrong((id *)&v33->_deviceSource, v36);
    objc_storeStrong((id *)&v33->_bgColor, a15);
  }

  return v33;
}

- (BOOL)isEqualToMediaPlaySession:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *title;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *album;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *bundleId;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSString *productId;
  void *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  NSString *genre;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  NSString *mediaType;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  NSString *artist;
  void *v46;
  int v47;
  int v48;
  void *v49;
  int v50;
  NSDate *startDate;
  void *v52;
  int v53;
  int v54;
  void *v55;
  int v56;
  NSDate *endDate;
  void *v58;
  char v59;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_29;
  v6 = self->_title != 0;
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_29;
  title = self->_title;
  if (title)
  {
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](title, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  v12 = self->_album != 0;
  objc_msgSend(v5, "album");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_29;
  album = self->_album;
  if (album)
  {
    objc_msgSend(v5, "album");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](album, "isEqual:", v16);

    if (!v17)
      goto LABEL_29;
  }
  v18 = self->_bundleId != 0;
  objc_msgSend(v5, "bundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_29;
  bundleId = self->_bundleId;
  if (bundleId)
  {
    objc_msgSend(v5, "bundleId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](bundleId, "isEqual:", v22);

    if (!v23)
      goto LABEL_29;
  }
  v24 = self->_productId != 0;
  objc_msgSend(v5, "productId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_29;
  productId = self->_productId;
  if (productId)
  {
    objc_msgSend(v5, "productId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSString isEqual:](productId, "isEqual:", v28);

    if (!v29)
      goto LABEL_29;
  }
  v30 = self->_genre != 0;
  objc_msgSend(v5, "genre");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_29;
  genre = self->_genre;
  if (genre)
  {
    objc_msgSend(v5, "genre");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[NSString isEqual:](genre, "isEqual:", v34);

    if (!v35)
      goto LABEL_29;
  }
  v36 = self->_mediaType != 0;
  objc_msgSend(v5, "mediaType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_29;
  mediaType = self->_mediaType;
  if (mediaType)
  {
    objc_msgSend(v5, "mediaType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSString isEqual:](mediaType, "isEqual:", v40);

    if (!v41)
      goto LABEL_29;
  }
  v42 = self->_artist != 0;
  objc_msgSend(v5, "artist");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (v42 == v44)
    goto LABEL_29;
  artist = self->_artist;
  if (artist)
  {
    objc_msgSend(v5, "artist");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[NSString isEqual:](artist, "isEqual:", v46);

    if (!v47)
      goto LABEL_29;
  }
  v48 = self->_startDate != 0;
  objc_msgSend(v5, "startDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49 == 0;

  if (v48 == v50)
    goto LABEL_29;
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v5, "startDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[NSDate isEqual:](startDate, "isEqual:", v52);

    if (!v53)
      goto LABEL_29;
  }
  v54 = self->_endDate != 0;
  objc_msgSend(v5, "endDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if (v54 == v56)
  {
LABEL_29:
    v59 = 0;
  }
  else
  {
    endDate = self->_endDate;
    if (endDate)
    {
      objc_msgSend(v5, "endDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[NSDate isEqual:](endDate, "isEqual:", v58);

    }
    else
    {
      v59 = 1;
    }
  }

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  MOMediaPlaySession *v4;
  MOMediaPlaySession *v5;
  BOOL v6;

  v4 = (MOMediaPlaySession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MOMediaPlaySession isEqualToMediaPlaySession:](self, "isEqualToMediaPlaySession:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_album, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_bundleId, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_productId, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_genre, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_mediaType, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_artist, "hash") - v8 + 32 * v8;
  v10 = -[NSDate hash](self->_startDate, "hash") - v9 + 32 * v9;
  return -[NSDate hash](self->_endDate, "hash") - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlaySession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MOMediaPlaySession *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_class *v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_class *v34;
  uint64_t v35;
  objc_class *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  objc_class *v40;
  uint64_t v41;
  objc_class *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  void *v47;
  uint64_t isKindOfClass;
  objc_class *v49;
  void *v50;
  uint64_t v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  uint64_t v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  MOMediaPlaySession *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"title\" (expected %@, decoded %@)"), v7, v9, 0);
      v105 = *MEMORY[0x1E0CB2D50];
      v106[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_4:
      v13 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_7:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("album"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"album\" (expected %@, decoded %@)"), v9, v10, 0);
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
        v13 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v13 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"bundleId\" (expected %@, decoded %@)"), v10, v11, 0);
        v101 = *MEMORY[0x1E0CB2D50];
        v102 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);
        v22 = (void *)v21;
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"productId\" (expected %@, decoded %@)"), v11, v12, 0);
        v99 = *MEMORY[0x1E0CB2D50];
        v100 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v82 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v82);
        objc_msgSend(v4, "failWithError:", v26);
        v27 = (void *)v26;
        v13 = 0;
LABEL_39:

LABEL_40:
        v22 = v82;
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v13 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"genre\" (expected %@, decoded %@)"), v12, v17, 0);
        v97 = *MEMORY[0x1E0CB2D50];
        v98 = v31;
        v82 = (id)v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v81 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v81);
        objc_msgSend(v4, "failWithError:", v32);
        v13 = 0;
LABEL_37:

LABEL_38:
        self = v80;
        v27 = (void *)v81;
        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v13 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v17 = (void *)v35;
        v82 = (id)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"mediaType\" (expected %@, decoded %@)"), v35, v82, 0);
        v95 = *MEMORY[0x1E0CB2D50];
        v96 = v37;
        v81 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v79 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v79);
        objc_msgSend(v4, "failWithError:", v38);
LABEL_34:
        v13 = 0;
LABEL_35:

LABEL_36:
        v32 = (void *)v79;
        goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        goto LABEL_4;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artist"));
    v78 = objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v81 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v78;
        v82 = (id)v41;
        v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"artist\" (expected %@, decoded %@)"), v41, v81, 0);
        v93 = *MEMORY[0x1E0CB2D50];
        v94 = v43;
        v79 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v38);
        objc_msgSend(v4, "failWithError:", v44);

        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v13 = 0;
        v17 = 0;
        goto LABEL_42;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v13 = 0;
      v17 = (void *)v78;
      goto LABEL_41;
    }
    v82 = v22;
    objc_msgSend(v4, "error");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v13 = 0;
      v17 = (void *)v78;
      goto LABEL_40;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v49 = (objc_class *)objc_opt_class();
    if ((isKindOfClass & 1) == 0)
    {
      v80 = self;
      NSStringFromClass(v49);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v79 = objc_claimAutoreleasedReturnValue();
      v81 = v51;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"startDate\" (expected %@, decoded %@)"), v51, v79, 0);
      v91 = *MEMORY[0x1E0CB2D50];
      v92 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v53);
      objc_msgSend(v4, "failWithError:", v54);

LABEL_60:
      v13 = 0;
      v17 = (void *)v78;
      goto LABEL_35;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v49, CFSTR("endDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v13 = 0;
      v17 = (void *)v78;
      goto LABEL_39;
    }
    v81 = (uint64_t)v27;
    objc_msgSend(v4, "error");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v13 = 0;
      v17 = (void *)v78;
      v27 = (void *)v81;
      goto LABEL_39;
    }
    v80 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("duration"));
      v73 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRemote"));
      if ((v73 & 1) == 0)
      {
        objc_msgSend(v4, "error");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          v13 = 0;
          v17 = (void *)v78;
          goto LABEL_38;
        }
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isRemote")) & 1) == 0)
        {
          v87 = *MEMORY[0x1E0CB2D50];
          v88 = CFSTR("Missing serialized value for MOMediaPlay.isRemote");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v79 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 1, v79);
          objc_msgSend(v4, "failWithError:", v38);
          goto LABEL_60;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSource"));
      v79 = objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v55 = (objc_class *)objc_opt_class();
          NSStringFromClass(v55);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"deviceSource\" (expected %@, decoded %@)"), v38, v77, 0);
          v85 = *MEMORY[0x1E0CB2D50];
          v86 = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v57);
          objc_msgSend(v4, "failWithError:", v58);

LABEL_76:
          goto LABEL_60;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          v13 = 0;
          v17 = (void *)v78;
          goto LABEL_36;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bkColor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"bkColor\" (expected %@, decoded %@)"), v77, v75, 0);
          v83 = *MEMORY[0x1E0CB2D50];
          v84 = v72;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v68);
          objc_msgSend(v4, "failWithError:", v69);

          goto LABEL_76;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
          goto LABEL_60;
      }
      v17 = (void *)v78;
      BYTE4(v71) = v73;
      LODWORD(v71) = v76;
      v13 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v80, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v5, v7, v9, v10, v11, v12, v78, v82, v81, v71, v79, v38);
      v80 = v13;
      goto LABEL_35;
    }
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (objc_class *)objc_opt_class();
    NSStringFromClass(v61);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v60;
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"endDate\" (expected %@, decoded %@)"), v60, v38, 0);
    v89 = *MEMORY[0x1E0CB2D50];
    v90 = v77;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v62);
    objc_msgSend(v4, "failWithError:", v63);

    goto LABEL_76;
  }
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  v13 = 0;
LABEL_48:

  return v13;
}

+ (BOOL)isValidThirdParty:(id)a3 bundleCategory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  if (!v6 || (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    goto LABEL_3;
  objc_msgSend(a1, "describeCategory:", 6011);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v9))
    goto LABEL_7;
  objc_msgSend(a1, "describeCategory:", 6009);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v10))
  {

LABEL_7:
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  objc_msgSend(a1, "describeCategory:", 6016);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_8;
LABEL_3:
  v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)isValidThirdPartyEvent:(id)a3 bundleCategory:(id)a4 mediaTypeString:(id)a5 playTime:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  char v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 || (objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    goto LABEL_19;
  objc_msgSend(a1, "describeCategory:", 6011);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);
  if (a6 < 90.0 || (v14 & 1) == 0)
  {
    objc_msgSend(a1, "describeCategory:", 6009);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "isEqualToString:", v15);
    if ((v16 & 1) != 0)
    {
      if (a6 < 600.0 || !v12)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(a1, "describeCategory:", 6016);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v11, "isEqualToString:", a1);
      if (!v12 || a6 < 600.0 || (v17 & 1) == 0)
      {

LABEL_18:
        goto LABEL_19;
      }
    }
    objc_msgSend(v12, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsString:", CFSTR("podcast"));

    if ((v16 & 1) == 0)
    if ((v19 & 1) != 0)
      goto LABEL_16;
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }

LABEL_16:
  v20 = 1;
LABEL_20:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *title;
  NSString *album;
  NSString *bundleId;
  NSString *productId;
  NSString *genre;
  NSString *mediaType;
  NSString *artist;
  NSDate *startDate;
  NSDate *endDate;
  uint64_t duration;
  NSString *deviceSource;
  id v16;

  v4 = a3;
  title = self->_title;
  v16 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v16;
  }
  album = self->_album;
  if (album)
  {
    objc_msgSend(v16, "encodeObject:forKey:", album, CFSTR("album"));
    v4 = v16;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    objc_msgSend(v16, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
    v4 = v16;
  }
  productId = self->_productId;
  if (productId)
  {
    objc_msgSend(v16, "encodeObject:forKey:", productId, CFSTR("productId"));
    v4 = v16;
  }
  genre = self->_genre;
  if (genre)
  {
    objc_msgSend(v16, "encodeObject:forKey:", genre, CFSTR("genre"));
    v4 = v16;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    objc_msgSend(v16, "encodeObject:forKey:", mediaType, CFSTR("mediaType"));
    v4 = v16;
  }
  artist = self->_artist;
  if (artist)
  {
    objc_msgSend(v16, "encodeObject:forKey:", artist, CFSTR("artist"));
    v4 = v16;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v16, "encodeObject:forKey:", startDate, CFSTR("startDate"));
    v4 = v16;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    objc_msgSend(v16, "encodeObject:forKey:", endDate, CFSTR("endDate"));
    v4 = v16;
  }
  duration = self->_duration;
  if ((_DWORD)duration)
  {
    objc_msgSend(v16, "encodeInt32:forKey:", duration, CFSTR("duration"));
    v4 = v16;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRemote, CFSTR("isRemote"));
  deviceSource = self->_deviceSource;
  if (deviceSource)
    objc_msgSend(v16, "encodeObject:forKey:", deviceSource, CFSTR("deviceSource"));
  if (self->_bgColor)
    objc_msgSend(v16, "encodeObject:forKey:", self->_deviceSource, CFSTR("bkColor"));

}

- (id)redactedTitle
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_title);
}

- (id)redactedAlbum
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_album);
}

- (id)redactedArtist
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_artist);
}

+ (id)redactString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_msgSend(v4, "length");
    if (v6 >> 1 >= 5)
      v7 = 5;
    else
      v7 = v6 >> 1;
    objc_msgSend(v4, "substringToIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%lu"), v8, objc_msgSend(v4, "hash"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setCalendar:", v3);
  objc_msgSend(v4, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss"));
  objc_msgSend(v4, "stringFromDate:", self->_startDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", self->_endDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MOMediaPlaySession redactedTitle](self, "redactedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOMediaPlaySession redactedAlbum](self, "redactedAlbum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("<MOMediaPlaySession | title:%@ album:%@ mediaType:%@ bundleId:%@ startDate:%@ endDate:%@ isRemote:%d deviceSource:%@>"), v8, v9, self->_mediaType, self->_bundleId, v5, v6, self->_isRemote, self->_deviceSource);

  return v10;
}

+ (id)getMOPlaySessionMediaType:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")))
  {
    v9 = &unk_1E855DB60;
  }
  else if (v5)
  {
    objc_msgSend(v5, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsString:", CFSTR("music")) & 1) != 0)
    {
      v9 = &unk_1E855DB90;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("podcast")) & 1) != 0)
    {
      v9 = &unk_1E855DBA8;
    }
    else if (objc_msgSend(v8, "containsString:", CFSTR("video")))
    {
      v9 = &unk_1E855DBC0;
    }
    else
    {
      v9 = &unk_1E855DBD8;
    }

  }
  else
  {
    v9 = &unk_1E855DB78;
  }

  return v9;
}

+ (id)describeCategory:(int)a3
{
  if ((a3 - 6000) < 0x16)
    return off_1E8541F30[a3 - 6000];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E855DFC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v3 && (objc_msgSend(v4, "containsObject:", v3) & 1) != 0;

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)productId
{
  return self->_productId;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSString)deviceSource
{
  return self->_deviceSource;
}

- (NSString)bgColor
{
  return self->_bgColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_deviceSource, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: endDate != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: startDate != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
