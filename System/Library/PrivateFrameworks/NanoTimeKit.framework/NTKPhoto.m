@implementation NTKPhoto

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = (char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_localIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalIdentifier:", v6);

  v7 = (void *)-[NSDate copyWithZone:](self->_modificationDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setModificationDate:", v7);

  objc_msgSend(v5, "setOriginalCrop:", self->_originalCrop.origin.x, self->_originalCrop.origin.y, self->_originalCrop.size.width, self->_originalCrop.size.height);
  v8 = (void *)-[NSURL copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setImageURL:", v8);

  objc_msgSend(v5, "setCrop:", self->_crop.origin.x, self->_crop.origin.y, self->_crop.size.width, self->_crop.size.height);
  for (i = 8; i != 88; i += 8)
  {
    v10 = objc_msgSend(*(id *)((char *)&self->super.isa + i), "copyWithZone:", a3);
    v11 = *(void **)&v5[i];
    *(_QWORD *)&v5[i] = v10;

  }
  objc_msgSend(v5, "setIsIris:", self->_isIris);
  v12 = (void *)-[NSURL copyWithZone:](self->_irisVideoURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setIrisVideoURL:", v12);

  objc_msgSend(v5, "setIrisDuration:", self->_irisDuration);
  objc_msgSend(v5, "setIrisStillDisplayTime:", self->_irisStillDisplayTime);
  return v5;
}

+ (id)decodeFromDictionary:(id)a3 forResourceDirectory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  NTKPhotoAnalysis *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NTKPhotoAnalysis *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NTKPhotoAnalysis *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NTKPhotoAnalysis *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NTKPhotoAnalysis *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NTKPhotoAnalysis *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  NTKPhotoAnalysis *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NTKPhotoAnalysis *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NTKPhotoAnalysis *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NTKPhotoAnalysis *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isIris"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (_QWORD *)objc_opt_new();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setLocalIdentifier:", v13);

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modificationDate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setModificationDate:", v14);

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalCropX"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalCropY"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalCropW"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalCropH"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        objc_msgSend(v12, "setOriginalCrop:", v17, v20, v23, v26);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v28, 0);
        objc_msgSend(v12, "setImageURL:", v29);

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cropX"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cropY"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        v35 = v34;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cropW"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v38 = v37;

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cropH"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;

        objc_msgSend(v12, "setCrop:", v32, v35, v38, v41);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topAnalysis"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topAnalysis"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[NTKPhotoAnalysis initFromDictionary:](v43, "initFromDictionary:", v44);
          v46 = (void *)v12[1];
          v12[1] = v45;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bottomAnalysis"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bottomAnalysis"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[NTKPhotoAnalysis initFromDictionary:](v48, "initFromDictionary:", v49);
          v51 = (void *)v12[2];
          v12[2] = v50;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("leftAnalysis"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v53 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("leftAnalysis"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[NTKPhotoAnalysis initFromDictionary:](v53, "initFromDictionary:", v54);
          v56 = (void *)v12[3];
          v12[3] = v55;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rightAnalysis"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          v58 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rightAnalysis"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[NTKPhotoAnalysis initFromDictionary:](v58, "initFromDictionary:", v59);
          v61 = (void *)v12[4];
          v12[4] = v60;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fastAnalysis"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          v63 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fastAnalysis"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = -[NTKPhotoAnalysis initFromDictionary:](v63, "initFromDictionary:", v64);
          v66 = (void *)v12[5];
          v12[5] = v65;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("slowAnalysis"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          v68 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("slowAnalysis"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = -[NTKPhotoAnalysis initFromDictionary:](v68, "initFromDictionary:", v69);
          v71 = (void *)v12[6];
          v12[6] = v70;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("insideAnalysis"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          v73 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("insideAnalysis"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = -[NTKPhotoAnalysis initFromDictionary:](v73, "initFromDictionary:", v74);
          v76 = (void *)v12[7];
          v12[7] = v75;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outsideAnalysis"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          v78 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outsideAnalysis"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = -[NTKPhotoAnalysis initFromDictionary:](v78, "initFromDictionary:", v79);
          v81 = (void *)v12[8];
          v12[8] = v80;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upAnalysis"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          v83 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upAnalysis"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = -[NTKPhotoAnalysis initFromDictionary:](v83, "initFromDictionary:", v84);
          v86 = (void *)v12[9];
          v12[9] = v85;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("downAnalysis"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (v87)
        {
          v88 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("downAnalysis"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = -[NTKPhotoAnalysis initFromDictionary:](v88, "initFromDictionary:", v89);
          v91 = (void *)v12[10];
          v12[10] = v90;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isIris"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIsIris:", objc_msgSend(v92, "BOOLValue"));

        if (objc_msgSend(v12, "isIris"))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("irisVideoURL"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringByAppendingPathComponent:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v94, 0);
          objc_msgSend(v12, "setIrisVideoURL:", v95);

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("irisDuration"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "doubleValue");
          objc_msgSend(v12, "setIrisDuration:");

          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("irisStillDisplayTime"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "doubleValue");
          objc_msgSend(v12, "setIrisStillDisplayTime:");

        }
        else
        {
          objc_msgSend(v12, "setIrisVideoURL:", 0);
          objc_msgSend(v12, "setIrisDuration:", 0.0);
          objc_msgSend(v12, "setIrisStillDisplayTime:", 0.0);
        }

        goto LABEL_32;
      }
    }
    else
    {

    }
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v98 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    +[NTKPhoto decodeFromDictionary:forResourceDirectory:].cold.1();

  v12 = 0;
LABEL_32:

  return v12;
}

- (id)encodeAsDictionary
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
  void *v13;
  NTKPhotoAnalysis *v14;
  void *v15;
  NTKPhotoAnalysis *v16;
  void *v17;
  NTKPhotoAnalysis *v18;
  void *v19;
  NTKPhotoAnalysis *v20;
  void *v21;
  NTKPhotoAnalysis *v22;
  void *v23;
  NTKPhotoAnalysis *v24;
  void *v25;
  NTKPhotoAnalysis *v26;
  void *v27;
  NTKPhotoAnalysis *v28;
  void *v29;
  NTKPhotoAnalysis *v30;
  void *v31;
  NTKPhotoAnalysis *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localIdentifier, CFSTR("localIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_modificationDate, CFSTR("modificationDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalCrop.origin.x);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("originalCropX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalCrop.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("originalCropY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalCrop.size.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originalCropW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalCrop.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalCropH"));

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_imageURL, "fileSystemRepresentation"));
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("imageURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_crop.origin.x);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("cropX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_crop.origin.y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cropY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_crop.size.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cropW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_crop.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cropH"));

  v14 = self->_analyses[0];
  if (v14)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v14, "encodeAsDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("topAnalysis"));

  }
  v16 = self->_analyses[1];
  if (v16)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v16, "encodeAsDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("bottomAnalysis"));

  }
  v18 = self->_analyses[2];
  if (v18)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v18, "encodeAsDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("leftAnalysis"));

  }
  v20 = self->_analyses[3];
  if (v20)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v20, "encodeAsDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("rightAnalysis"));

  }
  v22 = self->_analyses[4];
  if (v22)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v22, "encodeAsDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("fastAnalysis"));

  }
  v24 = self->_analyses[5];
  if (v24)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v24, "encodeAsDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("slowAnalysis"));

  }
  v26 = self->_analyses[6];
  if (v26)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v26, "encodeAsDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("insideAnalysis"));

  }
  v28 = self->_analyses[7];
  if (v28)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v28, "encodeAsDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("outsideAnalysis"));

  }
  v30 = self->_analyses[8];
  if (v30)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v30, "encodeAsDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("upAnalysis"));

  }
  v32 = self->_analyses[9];
  if (v32)
  {
    -[NTKPhotoAnalysis encodeAsDictionary](v32, "encodeAsDictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("downAnalysis"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIris);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isIris"));

  if (self->_isIris)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_irisVideoURL, "fileSystemRepresentation"));
    objc_msgSend(v35, "lastPathComponent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("irisVideoURL"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_irisDuration);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("irisDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_irisStillDisplayTime);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("irisStillDisplayTime"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_1E6BDC918, CFSTR("irisVideoURL"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6C9DC30, CFSTR("irisDuration"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6C9DC30, CFSTR("irisStillDisplayTime"));
  }
  return v3;
}

- (BOOL)isEqualToPhoto:(id)a3
{
  NTKPhoto *v4;
  NTKPhoto *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  CGRect v24;
  CGRect v25;

  v4 = (NTKPhoto *)a3;
  v5 = v4;
  if (self == v4)
  {
    v22 = 1;
  }
  else if (v4)
  {
    -[NTKPhoto localIdentifier](self, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPhoto localIdentifier](v5, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[NTKPhoto modificationDate](self, "modificationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPhoto modificationDate](v5, "modificationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDate:", v9))
      {
        -[NTKPhoto crop](self, "crop");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[NTKPhoto crop](v5, "crop");
        v25.origin.x = v18;
        v25.origin.y = v19;
        v25.size.width = v20;
        v25.size.height = v21;
        v24.origin.x = v11;
        v24.origin.y = v13;
        v24.size.width = v15;
        v24.size.height = v17;
        v22 = CGRectEqualToRect(v24, v25);
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  int v19;

  v4 = a3;
  -[NTKPhoto localIdentifier](self, "localIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  objc_msgSend(v4, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPhoto localIdentifier](self, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v9)
    goto LABEL_8;
  -[NTKPhoto modificationDate](self, "modificationDate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  objc_msgSend(v4, "modificationDate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_8;
  }
  v13 = (void *)v12;
  objc_msgSend(v4, "modificationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPhoto modificationDate](self, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v17 > 1.0)
  {
LABEL_8:
    LOBYTE(v19) = 0;
    goto LABEL_9;
  }
  v18 = -[NTKPhoto isIris](self, "isIris");
  v19 = v18 ^ objc_msgSend(v4, "isPhotoIris") ^ 1;
LABEL_9:

  return v19;
}

- (NSString)uuidFromLocalIdentifierAndModificationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CD1698];
  -[NTKPhoto localIdentifier](self, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuidFromLocalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPhoto modificationDate](self, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("~%ld"), (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isMissingAnalysis
{
  unint64_t v2;
  unint64_t v3;

  if (!self->_analyses[0])
    return 1;
  v2 = 0;
  do
  {
    v3 = v2;
    if (v2 == 9)
      break;
  }
  while (self->_analyses[++v2]);
  return v3 < 9;
}

- (id)analysisForAlignment:(unint64_t)a3 deviceSizeClass:(unint64_t)a4
{
  unint64_t v5;
  NTKPhotoAnalysis *v6;

  v5 = _NTKPhotoAnalysisIndex(a3);
  if (v5 > 9)
    v6 = 0;
  else
    v6 = self->_analyses[v5];
  return v6;
}

- (void)setAnalysis:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5
{
  unint64_t v8;
  id v9;

  v9 = a3;
  v8 = _NTKPhotoAnalysisIndex(a4);
  if (v8 <= 9)
    objc_storeStrong((id *)&self->_analyses[v8], a3);

}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CGRect)originalCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalCrop.origin.x;
  y = self->_originalCrop.origin.y;
  width = self->_originalCrop.size.width;
  height = self->_originalCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CGRect)crop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_crop.origin.x;
  y = self->_crop.origin.y;
  width = self->_crop.size.width;
  height = self->_crop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  self->_crop = a3;
}

- (BOOL)isIris
{
  return self->_isIris;
}

- (void)setIsIris:(BOOL)a3
{
  self->_isIris = a3;
}

- (NSURL)irisVideoURL
{
  return self->_irisVideoURL;
}

- (void)setIrisVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)irisDuration
{
  return self->_irisDuration;
}

- (void)setIrisDuration:(double)a3
{
  self->_irisDuration = a3;
}

- (double)irisStillDisplayTime
{
  return self->_irisStillDisplayTime;
}

- (void)setIrisStillDisplayTime:(double)a3
{
  self->_irisStillDisplayTime = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_irisVideoURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  v3 = 80;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (NTKPhoto)initWithLegacySidecar:(id)a3
{
  id v4;
  NTKPhoto *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *localIdentifier;
  uint64_t v12;
  NSDate *modificationDate;
  CGSize v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *imageURL;
  void *v19;
  double v20;
  double v21;
  const __CFURL *v22;
  CGImageSource *v23;
  CGImageSource *v24;
  const __CFDictionary *v25;
  const __CFNumber *Value;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  NSObject *v30;
  NSObject *v31;
  double v32;
  double v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  NSObject *v62;
  void *v63;
  NTKPhotoAnalysis *v64;
  void *v65;
  uint64_t v66;
  NTKPhotoAnalysis *v67;
  NTKPhotoAnalysis *v68;
  void *v69;
  uint64_t v70;
  NTKPhotoAnalysis *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSURL *irisVideoURL;
  void *v79;
  float v80;
  void *v81;
  float v82;
  NSURL *v83;
  double v85;
  objc_super v86;
  CGAffineTransform valuePtr;
  _BYTE buf[22];
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)NTKPhoto;
  v5 = -[NTKPhoto init](&v86, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[NTKPhoto(Legacy) initWithLegacySidecar:].cold.1((uint64_t)v5, (uint64_t)v6, v30);
      goto LABEL_39;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v10;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v12;

    v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v5->_originalCrop.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v5->_originalCrop.size = v14;
    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Image.jpg"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v17;

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "screenScale");
    v21 = v20;

    v22 = v5->_imageURL;
    *(_OWORD *)buf = *MEMORY[0x1E0C9D820];
    v23 = CGImageSourceCreateWithURL(v22, 0);
    if (v23)
    {
      v24 = v23;
      v25 = CGImageSourceCopyPropertiesAtIndex(v23, 0, 0);
      CFRelease(v24);
      if (v25)
      {
        Value = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E0CBD048]);
        v27 = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E0CBD040]);
        v28 = (const __CFNumber *)CFDictionaryGetValue(v25, (const void *)*MEMORY[0x1E0CBCFF0]);
        LODWORD(valuePtr.a) = 1;
        if (v28)
        {
          CFNumberGetValue(v28, kCFNumberIntType, &valuePtr);
          if ((LODWORD(valuePtr.a) - 5) >= 4)
            v29 = Value;
          else
            v29 = v27;
          if ((LODWORD(valuePtr.a) - 5) < 4)
            v27 = Value;
          Value = v29;
        }
        if (Value && v27)
        {
          CFNumberGetValue(Value, kCFNumberCGFloatType, buf);
          v7 = 0x1E0C99000;
          CFNumberGetValue(v27, kCFNumberCGFloatType, &buf[8]);
        }
        CFRelease(v25);
LABEL_23:

        v33 = *(double *)buf;
        v32 = *(double *)&buf[8];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("contentOffsetX"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "floatValue");
        v36 = v21 * v35;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("contentOffsetY"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        v39 = v21 * v38;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("zoomScale"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "floatValue");
        v42 = v41;
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "screenBounds");
        v45 = v44;
        v47 = v46;

        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "screenScale");
        v50 = v49;

        CGAffineTransformMakeScale(&valuePtr, v50, v50);
        v51 = v47 * valuePtr.c + valuePtr.a * v45;
        v52 = v47 * valuePtr.d + valuePtr.b * v45;
        v53 = v51 / v33;
        if (v51 / v33 < v52 / v32)
          v53 = v52 / v32;
        v85 = v42;
        v54 = v53 * v42;
        v55 = v36;
        v56 = v51 / v54;
        v57 = v52 / v54;
        v58 = v33 - v51 / v54;
        if (v36 / v54 < v58)
          v58 = v36 / v54;
        v59 = fmax(v58, 0.0);
        v60 = v32 - v57;
        if (v39 / v54 < v32 - v57)
          v60 = v39 / v54;
        v61 = fmax(v60, 0.0);
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134220032;
          *(double *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v32;
          v89 = 2048;
          v90 = v55;
          v91 = 2048;
          v92 = v39;
          v93 = 2048;
          v94 = v85;
          v95 = 2048;
          v96 = v59;
          v97 = 2048;
          v98 = v61;
          v99 = 2048;
          v100 = v56;
          v101 = 2048;
          v102 = v57;
          _os_log_impl(&dword_1B72A3000, v62, OS_LOG_TYPE_DEFAULT, "_findCropOfLegacyImage: { sz: (%.2f, %.2f), off: (%.2f %.2f), scale: %.2f } ==> (%.2f, %.2f, %.2f, %.2f)", buf, 0x5Cu);
        }

        v5->_crop.origin.x = v59;
        v5->_crop.origin.y = v61;
        v5->_crop.size.width = v56;
        v5->_crop.size.height = v57;

        objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Supplement.plist"));
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithContentsOfFile:", v30);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          v64 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("analysis-top"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = -[NTKPhotoAnalysis initFromDictionary:](v64, "initFromDictionary:", v65);
          v67 = v5->_analyses[0];
          v5->_analyses[0] = (NTKPhotoAnalysis *)v66;

          v68 = [NTKPhotoAnalysis alloc];
          objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("analysis-bottom"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = -[NTKPhotoAnalysis initFromDictionary:](v68, "initFromDictionary:", v69);
          v71 = v5->_analyses[1];
          v5->_analyses[1] = (NTKPhotoAnalysis *)v70;

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iris"), *(_QWORD *)&v85, *(_QWORD *)&v39);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v72, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("irisVideoHidden"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "BOOLValue");

          if ((v74 & 1) == 0)
          {
            v5->_isIris = 1;
            v75 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Iris.mov"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "fileURLWithPath:isDirectory:", v76, 0);
            v77 = objc_claimAutoreleasedReturnValue();
            irisVideoURL = v5->_irisVideoURL;
            v5->_irisVideoURL = (NSURL *)v77;

            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("irisDuration"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "floatValue");
            v5->_irisDuration = v80;

            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("irisStillDisplayTime"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "floatValue");
            v5->_irisStillDisplayTime = v82;

LABEL_38:
LABEL_39:

            goto LABEL_40;
          }
        }
        else
        {

        }
        v5->_isIris = 0;
        v83 = v5->_irisVideoURL;
        v5->_irisVideoURL = 0;

        v5->_irisDuration = 0.0;
        v5->_irisStillDisplayTime = 0.0;
        goto LABEL_38;
      }
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[NTKPhoto(Legacy) initWithLegacySidecar:].cold.3();
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[NTKPhoto(Legacy) initWithLegacySidecar:].cold.2();
    }

    goto LABEL_23;
  }
LABEL_40:

  return v5;
}

+ (void)decodeFromDictionary:forResourceDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "NTKPhoto decodeFromDictionary: bad dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
