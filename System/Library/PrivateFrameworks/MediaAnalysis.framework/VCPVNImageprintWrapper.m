@implementation VCPVNImageprintWrapper

- (VCPVNImageprintWrapper)initWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5
{
  id v9;
  VCPVNImageprintWrapper *v10;
  VCPVNImageprintWrapper *v11;
  VCPVNImageprintWrapper *v12;
  objc_super v14;

  v9 = a5;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPVNImageprintWrapper;
    v10 = -[VCPVNImageprintWrapper init](&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_type = a3;
      v10->_version = a4;
      objc_storeStrong((id *)&v10->_data, a5);
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (VCPVNImageprintWrapper)wrapperWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageprintType:version:andData:", a3, v5, v8);

  return (VCPVNImageprintWrapper *)v9;
}

+ (id)generateVNImageprintWithType:(unint64_t)a3 archiveData:(id)a4 andError:(id *)a5
{
  id v7;
  Class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    v8 = (Class *)0x1E0CEDEE8;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v8 = (Class *)0x1E0CEDDA0;
LABEL_5:
    a5 = (id *)objc_msgSend(objc_alloc(*v8), "initWithState:error:", v7, a5);
    goto LABEL_8;
  }
  if (a5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPVNImageprintWrapper] Invalid imageprint type %lu"), a3, *MEMORY[0x1E0CB2D50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_8:

  return a5;
}

- (BOOL)calculateDistance:(float *)a3 toWrapper:(id)a4 andError:(id *)a5
{
  id v8;
  unint64_t v9;
  int v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  id v34;
  BOOL v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    if (!a5)
      goto LABEL_19;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v59 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot calculate distance - missing the other imageprint"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v60[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
    v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v27 = 0;
    *a5 = v24;
    goto LABEL_18;
  }
  v9 = -[VCPVNImageprintWrapper type](self, "type");
  if (v9 != objc_msgSend(v8, "type"))
  {
    if (!a5)
      goto LABEL_19;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot calculate distance - mismatched imageprint type (%lu vs %lu)"), -[VCPVNImageprintWrapper type](self, "type"), objc_msgSend(v8, "type"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v58 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v10 = -[VCPVNImageprintWrapper version](self, "version");
  if (v10 != objc_msgSend(v8, "version"))
  {
    if (a5)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot calculate distance - mismatched versions (%d vs %d)"), -[VCPVNImageprintWrapper version](self, "version"), objc_msgSend(v8, "version"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v56 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  v11 = (void *)objc_opt_class();
  v12 = -[VCPVNImageprintWrapper type](self, "type");
  -[VCPVNImageprintWrapper data](self, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v11, "generateVNImageprintWithType:archiveData:andError:", v12, v13, &v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;

  if (v14 && !v15)
  {
    v16 = (void *)objc_opt_class();
    v17 = objc_msgSend(v8, "type");
    objc_msgSend(v8, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v16, "generateVNImageprintWithType:archiveData:andError:", v17, v18, &v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v43;

    if (!v19 || v15)
    {
      if (!a5)
      {
        v27 = 0;
LABEL_62:

        goto LABEL_18;
      }
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot calculate distance - unarchive theOtherImageprint.data - %@"), v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v27 = 0;
    }
    else
    {
      if (!-[VCPVNImageprintWrapper type](self, "type"))
      {
        v20 = v14;
        v21 = v19;
        if (objc_msgSend(v20, "isValidTorsoprint"))
          v22 = objc_msgSend(v20, "isValidFaceprint") ^ 1;
        else
          v22 = 0;
        if (objc_msgSend(v20, "isValidFaceprint"))
          v32 = objc_msgSend(v20, "isValidTorsoprint");
        else
          v32 = 1;
        if (objc_msgSend(v21, "isValidTorsoprint"))
          v33 = objc_msgSend(v21, "isValidFaceprint") ^ 1;
        else
          v33 = 0;
        if (objc_msgSend(v21, "isValidFaceprint")
          && (v22 ^ 1 | objc_msgSend(v21, "isValidTorsoprint")) != 1
          || ((v33 ^ 1 | v32) & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v40 = CFSTR("face-only");
            if (v22)
              v41 = CFSTR("torso-only");
            else
              v41 = CFSTR("face-only");
            if (v33)
              v40 = CFSTR("torso-only");
            *(_DWORD *)buf = 138412546;
            v48 = v41;
            v49 = 2112;
            v50 = v40;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Incomparable images: this - %@ vs that - %@", buf, 0x16u);
          }
          if (a3)
            *a3 = 1.0;

          v15 = 0;
          v27 = 1;
          v19 = v21;
          goto LABEL_61;
        }

      }
      v42 = 0;
      objc_msgSend(v14, "computeDistance:withDistanceFunction:error:", v19, 0, &v42);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v34 = v42;
      v15 = v34;
      if (v20)
        v35 = v34 == 0;
      else
        v35 = 0;
      v27 = v35;
      if (v35)
      {
        if (a3)
        {
          objc_msgSend(v20, "floatValue");
          *(_DWORD *)a3 = v36;
        }
      }
      else if (a5)
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v45 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot get distance between faceprints. Distance function returns nil"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v39);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
LABEL_61:

    goto LABEL_62;
  }
  if (a5)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot calculate distance - unarchive self.data - %@"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
    v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_61;
  }
  v27 = 0;
LABEL_18:

LABEL_20:
  return v27;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v12.receiver = self;
  v12.super_class = (Class)VCPVNImageprintWrapper;
  -[VCPVNImageprintWrapper description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[VCPVNImageprintWrapper type](self, "type");
  v7 = -[VCPVNImageprintWrapper version](self, "version");
  -[VCPVNImageprintWrapper data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  -[VCPVNImageprintWrapper data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("type: %lu, version: %d, and data[length:%lu]: <%p>"), v6, v7, v9, v10);

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (int)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
