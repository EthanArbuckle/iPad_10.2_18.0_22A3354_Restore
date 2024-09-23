@implementation AVAnnotation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVAnnotation)initWithTimeRange:(id *)a3 normalizedBoundingBox:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)AVAnnotation;
  v9 = -[AVAnnotation init](&v13, sel_init);
  if (v9)
  {
    *((_QWORD *)v9 + 1) = objc_msgSend(CFSTR("AVAnnotationVersion_1"), "copy");
    *((_QWORD *)v9 + 2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "copy");
    v11 = *(_OWORD *)&a3->var0.var3;
    v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)(v9 + 56) = v11;
    *(_OWORD *)(v9 + 72) = v10;
    *((CGFloat *)v9 + 11) = x;
    *((CGFloat *)v9 + 12) = y;
    *((CGFloat *)v9 + 13) = width;
    *((CGFloat *)v9 + 14) = height;
    *((_QWORD *)v9 + 15) = 0;
  }
  return (AVAnnotation *)v9;
}

- (AVAnnotation)initWithJSONData:(id)a3 representationBinaryDataBindings:(id)a4 error:(id *)a5
{
  AVAnnotation *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFDictionary *v21;
  CGSize v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSArray *v32;
  AVAnnotation *v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  void *v38;
  uint64_t *v39;
  uint64_t *v40;
  id *v41;
  CMTimeRange v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v8 = -[AVAnnotation init](self, "init");
  v43 = 0;
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v43);
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyVersion"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8->_version = (NSString *)objc_msgSend(v11, "copy");
          objc_msgSend(v11, "isEqualToString:", CFSTR("AVAnnotationVersion_1"));
          v12 = objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyIdentifier"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8->_identifier = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
            v13 = objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyAuthor"));
            if (v13)
            {
              v14 = (void *)v13;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v62 = *MEMORY[0x1E0CB2938];
                v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                v38 = (void *)MEMORY[0x1E0C99D80];
                v39 = &v63;
                v40 = &v62;
                goto LABEL_41;
              }
              v13 = objc_msgSend(v14, "copy");
            }
            v8->_author = (NSString *)v13;
            v15 = objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyLastModifiedDate"));
            if (!v15)
            {
LABEL_12:
              v8->_lastModifiedDate = (NSDate *)v15;
              v17 = (const __CFDictionary *)objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyTimeRange"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = a5;
                CMTimeRangeMakeFromDictionary(&v42, v17);
                v19 = *(_OWORD *)&v42.start.epoch;
                v18 = *(_OWORD *)&v42.duration.timescale;
                *(_OWORD *)&v8->_timeRange.start.value = *(_OWORD *)&v42.start.value;
                *(_OWORD *)&v8->_timeRange.start.epoch = v19;
                *(_OWORD *)&v8->_timeRange.duration.timescale = v18;
                v20 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
                *(_OWORD *)&v42.start.value = *MEMORY[0x1E0C9D628];
                *(_OWORD *)&v42.start.epoch = v20;
                v21 = (const __CFDictionary *)objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyNormalizedBoundingBox"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (!CGRectMakeWithDictionaryRepresentation(v21, (CGRect *)&v42))
                  {
LABEL_30:
                    a5 = v41;
                    goto LABEL_31;
                  }
                  v22 = *(CGSize *)&v42.start.epoch;
                  v8->_normalizedBoundingBox.origin = *(CGPoint *)&v42.start.value;
                  v8->_normalizedBoundingBox.size = v22;
                  v23 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyZOrder"));
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v8->_zOrder = objc_msgSend(v23, "integerValue");
                    v24 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("AVAnnotationArchiveKeyRepresentations"));
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v25 = objc_msgSend(v24, "count");
                      if (v25 == objc_msgSend(a4, "count"))
                      {
                        v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        if (!objc_msgSend(v24, "count"))
                        {
LABEL_25:
                          v32 = v26;
                          v33 = v8;
                          v8->_representations = v32;
                          return v33;
                        }
                        v27 = 0;
                        while (1)
                        {
                          v28 = objc_msgSend(v24, "objectAtIndex:", v27, v41);
                          v29 = (void *)objc_msgSend(a4, "objectAtIndex:", v27);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v48 = *MEMORY[0x1E0CB2938];
                            v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                            v34 = (void *)MEMORY[0x1E0C99D80];
                            v35 = &v49;
                            v36 = &v48;
                            goto LABEL_29;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v46 = *MEMORY[0x1E0CB2938];
                            v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                            v34 = (void *)MEMORY[0x1E0C99D80];
                            v35 = &v47;
                            v36 = &v46;
                            goto LABEL_29;
                          }
                          v30 = objc_msgSend(v29, "objectForKey:", CFSTR("data"));
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_30;
                          v31 = +[AVAnnotationRepresentation _annotationRepresentationWithPropertyList:binaryData:](AVAnnotationRepresentation, "_annotationRepresentationWithPropertyList:binaryData:", v28, v30);
                          if (!v31)
                            break;
                          objc_msgSend(v26, "addObject:", v31);
                          if (objc_msgSend(v24, "count") <= (unint64_t)++v27)
                            goto LABEL_25;
                        }
                        v44 = *MEMORY[0x1E0CB2938];
                        v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                        v34 = (void *)MEMORY[0x1E0C99D80];
                        v35 = &v45;
                        v36 = &v44;
                      }
                      else
                      {
                        v50 = *MEMORY[0x1E0CB2938];
                        v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                        v34 = (void *)MEMORY[0x1E0C99D80];
                        v35 = &v51;
                        v36 = &v50;
                      }
                    }
                    else
                    {
                      v52 = *MEMORY[0x1E0CB2938];
                      v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                      v34 = (void *)MEMORY[0x1E0C99D80];
                      v35 = &v53;
                      v36 = &v52;
                    }
                  }
                  else
                  {
                    v54 = *MEMORY[0x1E0CB2938];
                    v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                    v34 = (void *)MEMORY[0x1E0C99D80];
                    v35 = &v55;
                    v36 = &v54;
                  }
                }
                else
                {
                  v56 = *MEMORY[0x1E0CB2938];
                  v57 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
                  v34 = (void *)MEMORY[0x1E0C99D80];
                  v35 = &v57;
                  v36 = &v56;
                }
LABEL_29:
                v43 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11821, (void *)objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1, v41));
                goto LABEL_30;
              }
              v58 = *MEMORY[0x1E0CB2938];
              v59 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
              v38 = (void *)MEMORY[0x1E0C99D80];
              v39 = &v59;
              v40 = &v58;
              goto LABEL_41;
            }
            v16 = v15;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = objc_msgSend((id)objc_msgSend(objc_alloc_init(MEMORY[0x1E0CB36A8]), "dateFromString:", v16), "copy");
              goto LABEL_12;
            }
            v60 = *MEMORY[0x1E0CB2938];
            v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
            v38 = (void *)MEMORY[0x1E0C99D80];
            v39 = &v61;
            v40 = &v60;
          }
          else
          {
            v64 = *MEMORY[0x1E0CB2938];
            v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
            v38 = (void *)MEMORY[0x1E0C99D80];
            v39 = &v65;
            v40 = &v64;
          }
        }
        else
        {
          v66 = *MEMORY[0x1E0CB2938];
          v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = &v67;
          v40 = &v66;
        }
      }
      else
      {
        v68 = *MEMORY[0x1E0CB2938];
        v69[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Annotation data contains invalid format"));
        v38 = (void *)MEMORY[0x1E0C99D80];
        v39 = v69;
        v40 = &v68;
      }
LABEL_41:
      v43 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11821, (void *)objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 1));
    }
  }
LABEL_31:

  v33 = 0;
  if (a5)
    *a5 = v43;
  return v33;
}

- (void)getJSONData:(id *)a3 representationBinaryDataBindings:(id *)a4
{
  void *v5;
  void *v6;
  NSString *v7;
  NSDate *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTimeRange range;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v6, "setObject:forKey:", -[AVAnnotation _version](self, "_version"), CFSTR("AVAnnotationArchiveKeyVersion"));
  objc_msgSend(v6, "setObject:forKey:", -[NSUUID UUIDString](-[AVAnnotation identifier](self, "identifier"), "UUIDString"), CFSTR("AVAnnotationArchiveKeyIdentifier"));
  v7 = -[AVAnnotation author](self, "author");
  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AVAnnotationArchiveKeyAuthor"));
  v8 = -[AVAnnotation lastModifiedDate](self, "lastModifiedDate");
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc_init(MEMORY[0x1E0CB36A8]), "stringFromDate:", v8);
    if (v9)
      objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("AVAnnotationArchiveKeyLastModifiedDate"));
  }
  if (self)
    -[AVAnnotation timeRange](self, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  objc_msgSend(v6, "setObject:forKey:", CMTimeRangeCopyAsDictionary(&range, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]), CFSTR("AVAnnotationArchiveKeyTimeRange"));
  -[AVAnnotation normalizedBoundingBox](self, "normalizedBoundingBox");
  objc_msgSend(v6, "setObject:forKey:", CGRectCreateDictionaryRepresentation(v37), CFSTR("AVAnnotationArchiveKeyNormalizedBoundingBox"));
  v22 = v6;
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotation zOrder](self, "zOrder")), CFSTR("AVAnnotationArchiveKeyZOrder"));
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = -[AVAnnotation representations](self, "representations");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
        v25 = 0;
        objc_msgSend(v10, "addObject:", objc_msgSend(v16, "_propertyListAndBinaryData:", &v25));
        if (v25)
        {
          v33[1] = CFSTR("identifier");
          v34[0] = v25;
          v33[0] = CFSTR("data");
          v34[1] = objc_msgSend(v16, "identifier");
          v17 = (void *)MEMORY[0x1E0C99D80];
          v18 = v34;
          v19 = v33;
        }
        else
        {
          v31[0] = CFSTR("data");
          v20 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v31[1] = CFSTR("identifier");
          v32[0] = v20;
          v32[1] = objc_msgSend(v16, "identifier");
          v17 = (void *)MEMORY[0x1E0C99D80];
          v18 = v32;
          v19 = v31;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2));
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v13);
  }
  objc_msgSend(v22, "setObject:forKey:", v10, CFSTR("AVAnnotationArchiveKeyRepresentations"));
  v21 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v22, 0, 0);
  if (a3)
    *a3 = v21;
  if (a4)
    *a4 = v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotation;
  -[AVAnnotation dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[48];
  _OWORD v19[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v19[0] = *(_OWORD *)&self->_timeRange.start.value;
  v19[1] = v5;
  v19[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  v6 = (void *)objc_msgSend(v4, "initWithTimeRange:normalizedBoundingBox:", v19, self->_normalizedBoundingBox.origin.x, self->_normalizedBoundingBox.origin.y, self->_normalizedBoundingBox.size.width, self->_normalizedBoundingBox.size.height);
  if (v6)
  {
    objc_msgSend(v6, "setIdentifier:", -[AVAnnotation identifier](self, "identifier"));
    objc_msgSend(v6, "setAuthor:", -[AVAnnotation author](self, "author"));
    objc_msgSend(v6, "setLastModifiedDate:", -[AVAnnotation lastModifiedDate](self, "lastModifiedDate"));
    -[AVAnnotation timeRange](self, "timeRange");
    objc_msgSend(v6, "setTimeRange:", v18);
    objc_msgSend(v6, "setZOrder:", -[AVAnnotation zOrder](self, "zOrder"));
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = -[AVAnnotation representations](self, "representations", 0);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "copy"));
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }
    objc_msgSend(v6, "setRepresentations:", v7);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v11;
  int v12;
  NSString *v13;
  uint64_t v14;
  BOOL v15;
  _BOOL4 v16;
  NSDate *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  int64_t v30;
  void *v31;
  CMTimeRange v33;
  CMTimeRange range1;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v35 = v8;
    v36 = v7;
    v37 = v6;
    v38 = v5;
    v39 = v3;
    v40 = v4;
    if (!a3)
      goto LABEL_26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    if (-[NSString isEqualToString:](-[AVAnnotation _version](self, "_version"), "isEqualToString:", objc_msgSend(a3, "_version")))
    {
      v11 = -[NSUUID isEqual:](-[AVAnnotation identifier](self, "identifier"), "isEqual:", objc_msgSend(a3, "identifier"));
    }
    else
    {
      v11 = 0;
    }
    v13 = -[AVAnnotation author](self, "author");
    v14 = objc_msgSend(a3, "author");
    v15 = v13 == (NSString *)v14;
    if (v13 == (NSString *)v14)
      v16 = v11;
    else
      v16 = 0;
    if (!v15 && v11)
      v16 = -[NSString isEqualToString:](-[AVAnnotation author](self, "author"), "isEqualToString:", objc_msgSend(a3, "author"));
    v17 = -[AVAnnotation lastModifiedDate](self, "lastModifiedDate");
    if (v17 == (NSDate *)objc_msgSend(a3, "lastModifiedDate"))
    {
      if (!v16)
        goto LABEL_26;
    }
    else if (!v16
           || !-[NSDate isEqualToDate:](-[AVAnnotation lastModifiedDate](self, "lastModifiedDate"), "isEqualToDate:", objc_msgSend(a3, "lastModifiedDate")))
    {
      goto LABEL_26;
    }
    if (self)
      -[AVAnnotation timeRange](self, "timeRange");
    else
      memset(&range1, 0, sizeof(range1));
    objc_msgSend(a3, "timeRange");
    v12 = CMTimeRangeEqual(&range1, &v33);
    if (v12)
    {
      -[AVAnnotation normalizedBoundingBox](self, "normalizedBoundingBox");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(a3, "normalizedBoundingBox");
      v42.origin.x = v26;
      v42.origin.y = v27;
      v42.size.width = v28;
      v42.size.height = v29;
      v41.origin.x = v19;
      v41.origin.y = v21;
      v41.size.width = v23;
      v41.size.height = v25;
      v12 = CGRectEqualToRect(v41, v42);
      if (v12)
      {
        v30 = -[AVAnnotation zOrder](self, "zOrder");
        if (v30 == objc_msgSend(a3, "zOrder"))
        {
          v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[AVAnnotation representations](self, "representations"));
          LOBYTE(v12) = objc_msgSend(v31, "isEqualToSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "representations")));
          return v12;
        }
LABEL_26:
        LOBYTE(v12) = 0;
      }
    }
  }
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  CMTimeEpoch v7;
  CMTimeEpoch v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;
  __int128 v23;
  _OWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString hash](-[AVAnnotation _version](self, "_version"), "hash");
  v4 = -[NSUUID hash](-[AVAnnotation identifier](self, "identifier"), "hash");
  v5 = -[NSString hash](-[AVAnnotation author](self, "author"), "hash");
  v6 = -[NSDate hash](-[AVAnnotation lastModifiedDate](self, "lastModifiedDate"), "hash");
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
  if (self)
    -[AVAnnotation timeRange](self, "timeRange");
  *(_OWORD *)&v22.value = v23;
  v22.epoch = *(_QWORD *)&v24[0];
  v7 = CMTimeHash(&v22);
  v22 = *(CMTime *)((char *)v24 + 8);
  v8 = CMTimeHash(&v22);
  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[AVAnnotation normalizedBoundingBox](self, "normalizedBoundingBox");
  v10 = objc_msgSend((id)objc_msgSend(v9, "valueWithRect:"), "hash");
  v18 = 0u;
  v19 = 0u;
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotation zOrder](self, "zOrder")), "hash");
  v20 = 0u;
  v21 = 0u;
  v12 = -[AVAnnotation representations](self, "representations", 0);
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v11 ^= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hash");
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v14);
  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedBoundingBox:(CGRect)a3
{
  self->_normalizedBoundingBox = a3;
}

- (int64_t)zOrder
{
  return self->_zOrder;
}

- (void)setZOrder:(int64_t)a3
{
  self->_zOrder = a3;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)_version
{
  return self->_version;
}

- (void)_setVersion:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_version = v4;
}

+ (id)annotationPropertyListToNonDataBindingsArray:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationArchiveKeyRepresentations"));
  objc_opt_class();
  obj = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "objectForKey:", CFSTR("AVAnnotationArchiveKeyIdentifier"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
        v18 = CFSTR("identifier");
        v19 = v11;
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
          if (v7)
            goto LABEL_4;
          return v4;
        }
      }
    }
  }
  return v4;
}

@end
