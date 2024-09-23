@implementation APContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchTimestamp, 0);
  objc_storeStrong((id *)&self->_supplementalContext, 0);
  objc_storeStrong((id *)&self->_adjacent, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_requestedAdIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (APContext)initWithIdentifier:(id)a3 maxSize:(id)a4 requestedAdIdentifier:(id)a5 currentContent:(id)a6 adjacentContent:(id)a7 supplementalContext:(id)a8
{
  double var1;
  double var0;
  id v16;
  id v17;
  id v18;
  id v19;
  APContext *v20;
  APContext *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  NSDictionary *supplementalContext;
  id v31;
  objc_super v32;

  var1 = a4.var1;
  var0 = a4.var0;
  v31 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)APContext;
  v20 = -[APContext init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    v21->_maxSize.width = var0;
    v21->_maxSize.height = var1;
    objc_storeStrong((id *)&v21->_requestedAdIdentifier, a5);
    objc_storeStrong((id *)&v21->_current, a6);
    objc_storeStrong((id *)&v21->_adjacent, a7);
    v28 = objc_msgSend_copy(v19, v22, v23, v24, v25, v26, v27);
    supplementalContext = v21->_supplementalContext;
    v21->_supplementalContext = (NSDictionary *)v28;

  }
  return v21;
}

- (APContext)initWithCoder:(id)a3
{
  id v4;
  APContext *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  NSUUID *identifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  NSString *requestedAdIdentifier;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  APContentDepiction *current;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  NSArray *adjacent;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  uint64_t v68;
  NSDictionary *supplementalContext;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  NSDate *prefetchTimestamp;
  objc_super v78;

  v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)APContext;
  v5 = -[APContext init](&v78, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("identifier"), v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v18 = objc_msgSend_decodeIntForKey_(v4, v13, (uint64_t)CFSTR("height"), v14, v15, v16, v17);
    v5->_maxSize.height = (double)v18;
    v5->_maxSize.width = (double)(int)objc_msgSend_decodeIntForKey_(v4, v19, (uint64_t)CFSTR("width"), v20, v21, (double)v18, v22);
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("requestedAdIdentifier"), v25, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    requestedAdIdentifier = v5->_requestedAdIdentifier;
    v5->_requestedAdIdentifier = (NSString *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("current"), v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    current = v5->_current;
    v5->_current = (APContentDepiction *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v44, v39, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, (uint64_t)CFSTR("adjacent"), v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    adjacent = v5->_adjacent;
    v5->_adjacent = (NSArray *)v50;

    v52 = (void *)MEMORY[0x24BDBCF20];
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    objc_msgSend_setWithObjects_(v52, v58, v53, v59, v60, v61, v62, v54, v55, v56, v57, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v63, (uint64_t)CFSTR("supplementalContext"), v65, v66, v67);
    v68 = objc_claimAutoreleasedReturnValue();
    supplementalContext = v5->_supplementalContext;
    v5->_supplementalContext = (NSDictionary *)v68;

    v70 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v70, (uint64_t)CFSTR("prefetchTimestamp"), v72, v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();
    prefetchTimestamp = v5->_prefetchTimestamp;
    v5->_prefetchTimestamp = (NSDate *)v75;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  double v88;
  double v89;
  id v90;

  v4 = a3;
  objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("identifier"), v13, v14, v15);

  objc_msgSend_maxSize(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt_forKey_(v4, v23, (int)v22, (uint64_t)CFSTR("width"), v24, v22, v25);
  objc_msgSend_maxSize(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt_forKey_(v4, v33, (int)v32, (uint64_t)CFSTR("height"), v34, v35, v32);
  objc_msgSend_requestedAdIdentifier(self, v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)v42, (uint64_t)CFSTR("requestedAdIdentifier"), v44, v45, v46);

  objc_msgSend_current(self, v47, v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v54, (uint64_t)v53, (uint64_t)CFSTR("current"), v55, v56, v57);

  objc_msgSend_adjacent(self, v58, v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, (uint64_t)CFSTR("adjacent"), v66, v67, v68);

  objc_msgSend_supplementalContext(self, v69, v70, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v76, (uint64_t)v75, (uint64_t)CFSTR("supplementalContext"), v77, v78, v79);

  objc_msgSend_prefetchTimestamp(self, v80, v81, v82, v83, v84, v85);
  v90 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v86, (uint64_t)v90, (uint64_t)CFSTR("prefetchTimestamp"), v87, v88, v89);

}

- (NSString)fingerprint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;

  objc_msgSend_identifier(self, a2, v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (APContentDepiction)current
{
  return (APContentDepiction *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)supplementalContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)maxSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_copyStruct(v4, &self->_maxSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSDate)prefetchTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)requestedAdIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)adjacent
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPrefetchTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setMaxSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;

  v3 = a3;
  objc_copyStruct(&self->_maxSize, &v3, 16, 1, 0);
}

- (void)setRequestedAdIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setCurrent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setAdjacent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setSupplementalContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
