@implementation GDEntityResolutionRequest

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10 includeInferredNames:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  GDEntityResolutionRequest *v24;
  uint64_t v25;
  NSString *text;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *entityClassFilter;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *spans;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *sourceIDs;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSString *kgq;
  objc_super v44;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v44.receiver = self;
  v44.super_class = (Class)GDEntityResolutionRequest;
  v24 = -[GDEntityResolutionRequest init](&v44, sel_init);
  if (v24)
  {
    v25 = objc_msgSend_copy(v17, v22, v23);
    text = v24->_text;
    v24->_text = (NSString *)v25;

    v29 = objc_msgSend_copy(v18, v27, v28);
    entityClassFilter = v24->_entityClassFilter;
    v24->_entityClassFilter = (NSArray *)v29;

    v33 = objc_msgSend_copy(v19, v31, v32);
    spans = v24->_spans;
    v24->_spans = (NSArray *)v33;

    v24->_mode = a6;
    v24->_constraint = a7;
    v37 = objc_msgSend_copy(v20, v35, v36);
    sourceIDs = v24->_sourceIDs;
    v24->_sourceIDs = (NSArray *)v37;

    v41 = objc_msgSend_copy(v21, v39, v40);
    kgq = v24->_kgq;
    v24->_kgq = (NSString *)v41;

    v24->_includeFeatures = a10;
    v24->_includeInferredNames = a11;
  }

  return v24;
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 includeInferredNames:(BOOL)a6
{
  __int16 v7;

  HIBYTE(v7) = a6;
  LOBYTE(v7) = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, 0, 0, 0, 0, v7);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 includeInferredNames:(BOOL)a8
{
  __int16 v9;

  HIBYTE(v9) = a8;
  LOBYTE(v9) = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, 0, v9);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 spans:(id)a5 mode:(int64_t)a6 includeFeatures:(BOOL)a7
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, a5, a6, 0, a3, 0, a7);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6 includeInferredNames:(BOOL)a7
{
  __int16 v8;

  HIBYTE(v8) = a7;
  LOBYTE(v8) = a6;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, v8);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5
{
  __int16 v6;

  v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, 0, 0, 0, 0, v6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7
{
  __int16 v8;

  v8 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, 0, v8);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, a6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9
{
  __int16 v10;

  v10 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, 0, v10);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, a3, 0, a6);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5
{
  __int16 v6;

  v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, a3, 0, v6);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 mode:(int64_t)a4
{
  __int16 v5;

  v5 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, 0, 0, 0, a4, 0, 0, a3, v5);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5
{
  __int16 v6;

  v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, v6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 kgq:(id)a8
{
  __int16 v9;

  v9 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0, a8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  void *v6;
  const char *v7;
  NSArray *entityClassFilter;
  void *v9;
  const char *v10;
  NSArray *spans;
  void *v12;
  const char *v13;
  int64_t mode;
  void *v15;
  const char *v16;
  int64_t constraint;
  void *v18;
  const char *v19;
  NSArray *sourceIDs;
  void *v21;
  const char *v22;
  NSString *kgq;
  void *v24;
  const char *v25;
  _BOOL8 includeFeatures;
  void *v27;
  const char *v28;
  _BOOL8 includeInferredNames;
  const char *v30;
  id v31;

  text = self->_text;
  v5 = a3;
  NSStringFromSelector(sel_text);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)text, v6);

  entityClassFilter = self->_entityClassFilter;
  NSStringFromSelector(sel_entityClassFilter);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)entityClassFilter, v9);

  spans = self->_spans;
  NSStringFromSelector(sel_spans);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)spans, v12);

  mode = self->_mode;
  NSStringFromSelector(sel_mode);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v16, mode, v15);

  constraint = self->_constraint;
  NSStringFromSelector(sel_constraint);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v19, constraint, v18);

  sourceIDs = self->_sourceIDs;
  NSStringFromSelector(sel_sourceIDs);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)sourceIDs, v21);

  kgq = self->_kgq;
  NSStringFromSelector("kgq");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)kgq, v24);

  includeFeatures = self->_includeFeatures;
  NSStringFromSelector(sel_includeFeatures);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v28, includeFeatures, v27);

  includeInferredNames = self->_includeInferredNames;
  NSStringFromSelector(sel_includeInferredNames);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v30, includeInferredNames, v31);

}

- (GDEntityResolutionRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  int v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  GDEntityResolutionRequest *v41;
  void *v42;
  void *v43;
  const char *v44;
  int v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  char v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  void *v83;
  uint64_t v85;
  char v86;
  GDEntityResolutionRequest *v87;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_text);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend_error(v4, v9, v10), v40 = (void *)objc_claimAutoreleasedReturnValue(), v40, !v40))
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_entityClassFilter);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend_error(v4, v19, v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v41 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend_setWithObjects_(v21, v24, v22, v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_spans);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      objc_msgSend_error(v4, v29, v30);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
        goto LABEL_16;
    }
    NSStringFromSelector(sel_mode);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_containsValueForKey_(v4, v32, (uint64_t)v31);

    if (v33)
    {
      NSStringFromSelector(sel_mode);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)v34);

      objc_msgSend_error(v4, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
LABEL_16:
        v41 = 0;
        goto LABEL_29;
      }
      v87 = self;
    }
    else
    {
      v87 = self;
      v36 = 0;
    }
    NSStringFromSelector(sel_constraint);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_containsValueForKey_(v4, v44, (uint64_t)v43);

    if (v45)
    {
      NSStringFromSelector(sel_constraint);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_decodeIntegerForKey_(v4, v47, (uint64_t)v46);

      objc_msgSend_error(v4, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        v41 = 0;
        self = v87;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      v48 = 0;
    }
    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend_setWithObjects_(v53, v56, v54, v55, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_sourceIDs);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v57, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60
      || (objc_msgSend_error(v4, v61, v62), v82 = (void *)objc_claimAutoreleasedReturnValue(), v82, !v82))
    {
      v63 = objc_opt_class();
      NSStringFromSelector("kgq");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v65, v63, v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
      {
        objc_msgSend_error(v4, v67, v68);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
          goto LABEL_26;
      }
      v69 = v48;
      NSStringFromSelector(sel_includeFeatures);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend_decodeBoolForKey_(v4, v71, (uint64_t)v70);

      objc_msgSend_error(v4, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75
        || (NSStringFromSelector(sel_includeInferredNames),
            v76 = (void *)objc_claimAutoreleasedReturnValue(),
            v86 = objc_msgSend_decodeBoolForKey_(v4, v77, (uint64_t)v76),
            v76,
            objc_msgSend_error(v4, v78, v79),
            v80 = (void *)objc_claimAutoreleasedReturnValue(),
            v80,
            v80))
      {
LABEL_26:
        v41 = 0;
      }
      else
      {
        BYTE1(v85) = v86;
        LOBYTE(v85) = v72;
        v41 = (GDEntityResolutionRequest *)(id)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(v87, v81, (uint64_t)v8, v18, v28, v36, v69, v60, v66, v85);
        v87 = v41;
      }

    }
    else
    {
      v41 = 0;
    }
    self = v87;

    goto LABEL_29;
  }
  v41 = 0;
LABEL_31:

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  BOOL includeFeatures;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  includeFeatures = self->_includeFeatures;
  return (id)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_(v7, v8, (uint64_t)self->_text, self->_entityClassFilter, self->_spans, self->_mode, self->_constraint, self->_sourceIDs, self->_kgq, includeFeatures);
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)entityClassFilter
{
  return self->_entityClassFilter;
}

- (NSArray)spans
{
  return self->_spans;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)constraint
{
  return self->_constraint;
}

- (NSArray)sourceIDs
{
  return self->_sourceIDs;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (BOOL)includeFeatures
{
  return self->_includeFeatures;
}

- (BOOL)includeInferredNames
{
  return self->_includeInferredNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kgq, 0);
  objc_storeStrong((id *)&self->_sourceIDs, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_entityClassFilter, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
