@implementation SGTaggedCharacterRange

- (SGTaggedCharacterRange)initWithAnnotationType:(unint64_t)a3 tags:(id)a4 range:(_NSRange)a5 text:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  SGTaggedCharacterRange *v14;
  SGTaggedCharacterRange *v15;
  objc_super v17;

  length = a5.length;
  location = a5.location;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SGTaggedCharacterRange;
  v14 = -[SGTaggedCharacterRange init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_annotationType = a3;
    objc_storeStrong((id *)&v14->_tags, a4);
    v15->_range.location = location;
    v15->_range.length = length;
    objc_storeStrong((id *)&v15->_text, a6);
  }

  return v15;
}

- (SGTaggedCharacterRange)initWithDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SGTaggedCharacterRange *v14;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "annotationTypeFromString:", v17);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("range"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("range"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](self, "initWithAnnotationType:tags:range:text:", v16, v6, v9, v12, v13);
  return v14;
}

- (id)dictRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("annotationType");
  +[SGTaggedCharacterRange describeAnnotationType:](SGTaggedCharacterRange, "describeAnnotationType:", -[SGTaggedCharacterRange annotationType](self, "annotationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("tags");
  -[SGTaggedCharacterRange tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("range");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SGTaggedCharacterRange range](self, "range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SGTaggedCharacterRange range](self, "range");
  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = CFSTR("text");
  -[SGTaggedCharacterRange text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SGTaggedCharacterRange *v4;
  SGTaggedCharacterRange *v5;
  BOOL v6;

  v4 = (SGTaggedCharacterRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGTaggedCharacterRange isEqualToTaggedCharacterRange:](self, "isEqualToTaggedCharacterRange:", v5);

  return v6;
}

- (BOOL)isEqualToTaggedCharacterRange:(id)a3
{
  id *v4;
  unint64_t annotationType;
  NSArray *tags;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;

  v4 = (id *)a3;
  annotationType = self->_annotationType;
  if (annotationType != objc_msgSend(v4, "annotationType"))
    goto LABEL_4;
  tags = self->_tags;
  v7 = (NSArray *)v4[2];
  if (tags == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = tags;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_12;
    }
  }
  v11 = 0;
  if (self->_range.location == objc_msgSend(v4, "range") && self->_range.length == v12)
  {
    v13 = self->_text;
    v14 = v13;
    if (v13 == v4[3])
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v13, "isEqual:");

  }
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v2;

  v2 = self->_range.location - self->_annotationType + 32 * self->_annotationType;
  return self->_range.length - v2 + 32 * v2;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t annotationType;
  id v5;

  annotationType = self->_annotationType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", annotationType, CFSTR("annotationType"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_range.location, CFSTR("loc"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_range.length, CFSTR("len"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tags, CFSTR("tags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));

}

- (SGTaggedCharacterRange)initWithCoder:(id)a3
{
  id v5;
  SGTaggedCharacterRange *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *tags;
  void *v15;
  void *v16;
  NSString *v17;
  void *text;
  void *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGTaggedCharacterRange;
  v6 = -[SGTaggedCharacterRange init](&v21, sel_init);
  if (v6)
  {
    v6->_annotationType = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("annotationType"));
    v7 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("loc"));
    v8 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("len"));
    v6->_range.location = v7;
    v6->_range.length = v8;
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("tags"));
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGTaggedCharacterRange.m"), 101, CFSTR("nonnull NSArray<%@*> *%@ was null when decoded"), CFSTR("NSString"), CFSTR("tags"));

    }
    tags = v6->_tags;
    v6->_tags = (NSArray *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("text"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v16;
      text = v6->_text;
      v6->_text = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      text = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(text, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGTaggedCharacterRange.m"), 102, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "text");
    }

  }
  return v6;
}

- (id)annotationTypeUniqueIdentifier
{
  return +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:](SGTaggedCharacterRange, "annotationTypeUniqueIdentifier:", self->_annotationType);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "describeAnnotationType:", self->_annotationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGTaggedCharacterRange annotationType:%@ tags:%@ text:%@>"), v4, self->_tags, self->_text);

  return v5;
}

- (unint64_t)annotationType
{
  return self->_annotationType;
}

- (NSArray)tags
{
  return self->_tags;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeAnnotationType:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
    return CFSTR("AnnotationTypeUnknown");
  else
    return off_1E7DAFA48[a3 - 1];
}

+ (unint64_t)annotationTypeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeDataDetectors")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeNLTaggerLexicalClass")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeNLTaggerLemma")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeCrossAnnotation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeMetadata")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeMisc")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeReminder")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeHuman")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypePadding")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeModelOutput")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeHTML")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeCSS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AnnotationTypeNER")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)annotationTypeUniqueIdentifier:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
    return CFSTR("U");
  else
    return off_1E7DAFAB0[a3 - 1];
}

+ (id)enrichAndFilterTaggedCharacterRanges:(id)a3 usingMapping:(id)a4 withAnnotationType:(unint64_t)a5
{
  id v5;
  void *v6;
  id v8;

  v8 = a4;
  v5 = v8;
  sgMapAndFilter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)mergeTagsFromTaggedCharacterRanges:(id)a3 withTaggedCharacterRanges:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *context;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  NSRange v53;
  NSRange v54;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = a4;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v29)
  {
    v26 = *(_QWORD *)v46;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(obj);
        v31 = v6;
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v8 = (void *)objc_opt_new();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v32 = v28;
        v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v35)
        {
          v33 = v7;
          v34 = *(_QWORD *)v42;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v42 != v34)
                objc_enumerationMutation(v32);
              v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v9);
              if (v7 == v10
                || (v11 = objc_msgSend(v7, "range"),
                    v13 = v12,
                    v54.location = objc_msgSend(v10, "range"),
                    v54.length = v14,
                    v53.location = v11,
                    v53.length = v13,
                    NSIntersectionRange(v53, v54).length))
              {
                v36 = v9;
                v39 = 0u;
                v40 = 0u;
                v37 = 0u;
                v38 = 0u;
                objc_msgSend(v10, "tags");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v38;
                  do
                  {
                    v19 = 0;
                    do
                    {
                      if (*(_QWORD *)v38 != v18)
                        objc_enumerationMutation(v15);
                      v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19);
                      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
                      objc_msgSend(v10, "annotationTypeUniqueIdentifier");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@_%@"), v22, v20);
                      objc_msgSend(v8, "addObject:", v23);

                      ++v19;
                    }
                    while (v17 != v19);
                    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                  }
                  while (v17);
                }

                v7 = v33;
                v9 = v36;
              }
              ++v9;
            }
            while (v9 != v35);
            v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v35);
        }

        objc_msgSend(v27, "addObject:", v8);
        objc_autoreleasePoolPop(context);
        v6 = v31 + 1;
      }
      while (v31 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v29);
  }

  return v27;
}

+ (id)mergeTaggedCharacterRanges:(id)a3 usingBaseTaggedCharacterRanges:(id)a4 extraTags:(id)a5 tagOverrides:(id)a6 alignWithGroundTruth:(id)a7
{
  id v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  SGTaggedCharacterRange *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  SGTaggedCharacterRange *v80;
  void *v81;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v91;
  id v92;
  id v93;
  id obj;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *context;
  char *contexta;
  char *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, void *);
  void *v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v87 = a4;
  v11 = a5;
  v93 = a6;
  v92 = a7;
  v89 = (void *)MEMORY[0x1C3BD4F6C]();
  v12 = (void *)objc_opt_new();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v11;
  v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
  if (v97)
  {
    v95 = *(id *)v121;
    do
    {
      v13 = 0;
      do
      {
        if (*(id *)v121 != v95)
          objc_enumerationMutation(obj);
        v101 = v13;
        v14 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v13);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        objc_msgSend(v14, "tags");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v117;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v117 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
              v21 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v14, "annotationTypeUniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@_%@"), v22, v20);
              objc_msgSend(v12, "addObject:", v23);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
          }
          while (v17);
        }

        objc_autoreleasePoolPop(context);
        v13 = v101 + 1;
      }
      while (v101 + 1 != (char *)v97);
      v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
    }
    while (v97);
  }

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v24 = v87;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v113;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v113 != v28)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
        v31 = (void *)MEMORY[0x1C3BD4F6C]();
        if (v27 > objc_msgSend(v30, "range"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTaggedCharacterRange.m"), 284, CFSTR("The baseTaggedCharacterRangeArray isn't sorted."));

        }
        v32 = objc_msgSend(v30, "range");
        objc_msgSend(v30, "range");
        v27 = v33 + v32;
        objc_autoreleasePoolPop(v31);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
    }
    while (v26);
  }

  objc_msgSend(a1, "mergeTagsFromTaggedCharacterRanges:withTaggedCharacterRanges:", v24, v91);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = MEMORY[0x1E0C809B0];
  v108 = 3221225472;
  v109 = __128__SGTaggedCharacterRange_mergeTaggedCharacterRanges_usingBaseTaggedCharacterRanges_extraTags_tagOverrides_alignWithGroundTruth___block_invoke;
  v110 = &unk_1E7DAFA28;
  v88 = v12;
  v111 = v88;
  sgMap();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "biosBasedAnnotation:usingTags:forSection:", v24, v36, CFSTR("N"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObjectsFromArray:", v38);

  objc_msgSend((id)objc_opt_class(), "biosBasedAnnotation:usingTags:forSection:", v24, v36, CFSTR("D"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObjectsFromArray:", v39);

  v86 = v37;
  objc_msgSend(a1, "mergeTagsFromTaggedCharacterRanges:withTaggedCharacterRanges:", v24, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_opt_new();
  if (objc_msgSend(v36, "count"))
  {
    v42 = 0;
    do
    {
      objc_msgSend(v36, "objectAtIndexedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setByAddingObjectsFromSet:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v45);

      ++v42;
    }
    while (objc_msgSend(v36, "count") > v42);
  }
  v85 = v40;
  v46 = v41;

  v47 = v46;
  if (v92)
  {
    objc_msgSend(a1, "mergeTagsFromTaggedCharacterRanges:withTaggedCharacterRanges:", v24, v92);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_opt_new();
    if (objc_msgSend(v46, "count"))
    {
      v49 = 0;
      do
      {
        objc_msgSend(v46, "objectAtIndexedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setByAddingObjectsFromSet:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v52);

        ++v49;
      }
      while (objc_msgSend(v46, "count") > v49);
    }

  }
  v84 = v46;
  v96 = (id)objc_opt_new();
  if (objc_msgSend(v24, "count"))
  {
    v53 = 0;
    v98 = v47;
    do
    {
      v102 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      contexta = v53;
      objc_msgSend(v47, "objectAtIndexedSubscript:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v55, "mutableCopy");

      v57 = objc_msgSend(v56, "count");
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v58 = v93;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v104;
        do
        {
          for (k = 0; k != v60; ++k)
          {
            if (*(_QWORD *)v104 != v61)
              objc_enumerationMutation(v58);
            v63 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * k);
            objc_msgSend(v58, "objectForKeyedSubscript:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "minusSet:", v64);

            if (objc_msgSend(v56, "count") < v57)
            {
              objc_msgSend(v56, "addObject:", v63);
              v57 = objc_msgSend(v56, "count");
            }
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
        }
        while (v60);
      }

      v65 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF beginswith 'L'"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "filteredSetUsingPredicate:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v65);
      if (objc_msgSend(v67, "count"))
      {
        if (objc_msgSend(v67, "count") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTaggedCharacterRange.m"), 350, CFSTR("Error in TaggedCharacterRange tags, only one can be of type SGTaggedCharacterRangeAnnotationTypeNLTaggerLemma"));

        }
        objc_msgSend(v67, "anyObject");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "substringFromIndex:", 2);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "lowercaseString");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "minusSet:", v67);
        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("L_%@"), v70);
        objc_msgSend(v56, "addObject:", v71);
      }
      else
      {
        v72 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v54, "text");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "lowercaseString");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)objc_msgSend(v72, "initWithFormat:", CFSTR("L_%@"), v71);
        objc_msgSend(v56, "addObject:", v73);

      }
      if (v57)
      {
        v74 = [SGTaggedCharacterRange alloc];
        objc_msgSend(v56, "allObjects");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v54, "range");
        v78 = v77;
        objc_msgSend(v54, "text");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v74, "initWithAnnotationType:tags:range:text:", 4, v75, v76, v78, v79);
        objc_msgSend(v96, "addObject:", v80);

      }
      objc_autoreleasePoolPop(v102);
      v53 = contexta + 1;
      v47 = v98;
    }
    while (objc_msgSend(v24, "count") > (unint64_t)(contexta + 1));
  }

  objc_autoreleasePoolPop(v89);
  return v96;
}

+ (id)biosBasedAnnotation:(id)a3 usingTags:(id)a4 forSection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  SGTaggedCharacterRange *v16;
  void *v17;
  void *v18;
  void **v19;
  int v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  SGTaggedCharacterRange *v27;
  __CFString *v28;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v33 = v8;
  objc_msgSend((id)objc_opt_class(), "state:index:section:", v8, 0, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_opt_new();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    v12 = 0;
    v13 = &stru_1E7DB83A8;
    v30 = v9;
    v31 = v7;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "state:index:section:", v33, ++v11, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "length"))
      {
        v34 = v15;
        if (-[__CFString isEqualToString:](v13, "isEqualToString:", v10))
        {
          v16 = [SGTaggedCharacterRange alloc];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("section_%@_intermediate"), v9);
          v37[0] = v17;
          v18 = (void *)MEMORY[0x1E0C99D20];
          v19 = (void **)v37;
        }
        else
        {
          v20 = objc_msgSend(v15, "isEqualToString:", v10);
          v16 = [SGTaggedCharacterRange alloc];
          v21 = objc_alloc(MEMORY[0x1E0CB3940]);
          if (v20)
          {
            v17 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("section_%@_begin"), v9);
            v36 = v17;
            v18 = (void *)MEMORY[0x1E0C99D20];
            v19 = &v36;
          }
          else
          {
            v17 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("section_%@_single"), v9);
            v35 = v17;
            v18 = (void *)MEMORY[0x1E0C99D20];
            v19 = &v35;
          }
        }
        objc_msgSend(v18, "arrayWithObjects:count:", v19, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v14, "range");
        v25 = v24;
        objc_msgSend(v14, "text");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v16, "initWithAnnotationType:tags:range:text:", 6, v22, v23, v25, v26);
        objc_msgSend(v32, "addObject:", v27);

        v9 = v30;
        v7 = v31;
        v15 = v34;
      }
      v28 = (__CFString *)v10;

      v10 = v15;
      v13 = v28;
      v12 = v10;
    }
    while (objc_msgSend(v7, "count") > v11);

  }
  else
  {
    v28 = &stru_1E7DB83A8;
  }

  return v32;
}

+ (id)state:(id)a3 index:(int)a4 section:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  __CFString *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count") <= (unint64_t)a4)
  {
    v17 = &stru_1E7DB83A8;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v7;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_"), v8);
          v16 = objc_msgSend(v14, "hasPrefix:", v15);

          if ((v16 & 1) != 0)
          {
            objc_msgSend(v14, "substringFromIndex:", 2);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v7 = v19;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
      v7 = v19;
    }
    v17 = &stru_1E7DB83A8;
LABEL_14:

  }
  return v17;
}

+ (id)flattenTaggedCharacterRanges:(id)a3 usingWhitelist:(id)a4 replaceOOVWithToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  int v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *context;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v31 = (id)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v7;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v34 = v10;
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v12 = (void *)objc_opt_new();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v11, "tags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              v19 = objc_msgSend(v18, "characterAtIndex:", 0);
              if (v19 != objc_msgSend(CFSTR("L"), "characterAtIndex:", 0)
                || (v20 = objc_msgSend(v8, "containsObject:", v18), v21 = v9, v20))
              {
                v22 = objc_msgSend(CFSTR("H"), "characterAtIndex:", 0);
                v21 = v18;
                if (v19 == v22)
                  continue;
              }
              objc_msgSend(v12, "addObject:", v21);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v15);
        }

        objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_pas_componentsJoinedByString:", CFSTR("&"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "containsString:", CFSTR(" ")))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGTaggedCharacterRange.m"), 444, CFSTR("tags contains space"));

        }
        objc_msgSend(v31, "addObject:", v24);

        objc_autoreleasePoolPop(context);
        v10 = v34 + 1;
      }
      while (v34 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v32);
  }

  return v31;
}

uint64_t __128__SGTaggedCharacterRange_mergeTaggedCharacterRanges_usingBaseTaggedCharacterRanges_extraTags_tagOverrides_alignWithGroundTruth___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 32));
}

SGTaggedCharacterRange *__95__SGTaggedCharacterRange_enrichAndFilterTaggedCharacterRanges_usingMapping_withAnnotationType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SGTaggedCharacterRange *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SGTaggedCharacterRange *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = a1;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_msgSend(v3, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_7;
        if (objc_msgSend(v3, "annotationType") == 3)
        {
          objc_msgSend(v3, "tags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 == 1)
          {
            objc_msgSend(v3, "tags");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
LABEL_7:
              objc_msgSend(v4, "addObject:", v12);

            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v17 = [SGTaggedCharacterRange alloc];
    v18 = *(_QWORD *)(v25 + 40);
    v19 = objc_msgSend(v3, "range");
    v21 = v20;
    objc_msgSend(v3, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v17, "initWithAnnotationType:tags:range:text:", v18, v4, v19, v21, v22);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
