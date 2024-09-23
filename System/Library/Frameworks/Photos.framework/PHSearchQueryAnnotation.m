@implementation PHSearchQueryAnnotation

- (PHSearchQueryAnnotation)initWithQueryToken:(id)a3
{
  id v6;
  PHSearchQueryAnnotation *v7;
  PHSearchQueryAnnotation *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryAnnotation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryToken"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchQueryAnnotation;
  v7 = -[PHSearchQueryAnnotation init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_QUToken, a3);

  return v8;
}

- (PHSearchQueryAnnotation)initWithSuggestion:(id)a3 queryToken:(id)a4
{
  id v8;
  id v9;
  PHSearchQueryAnnotation *v10;
  PHSearchQueryAnnotation *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryAnnotation.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestion"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PHSearchQueryAnnotation;
  v10 = -[PHSearchQueryAnnotation init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_suggestion, a3);
    objc_storeStrong((id *)&v11->_QUToken, a4);
  }

  return v11;
}

- (unint64_t)ambiguityType
{
  void *v3;
  void *v5;
  unint64_t v6;

  -[PHSearchQueryAnnotation suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[PHSearchQueryAnnotation QUToken](self, "QUToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ambiguityType");

  return v6;
}

- (PHSearchQueryAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PHSearchQueryAnnotation *v7;
  PHSearchQueryAnnotation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQueryAnnotationPropertySuggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQueryAnnotationPropertyToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = -[PHSearchQueryAnnotation initWithSuggestion:queryToken:](self, "initWithSuggestion:queryToken:", v5, v6);
  else
    v7 = -[PHSearchQueryAnnotation initWithQueryToken:](self, "initWithQueryToken:", v6);
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  PHSearchSuggestion *suggestion;
  id v5;

  suggestion = self->_suggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestion, CFSTR("PHSearchQueryAnnotationPropertySuggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_QUToken, CFSTR("PHSearchQueryAnnotationPropertyToken"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PHSearchQueryAnnotation QUToken](self, "QUToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQueryAnnotation suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHSearchQueryAnnotation ambiguityType](self, "ambiguityType");
  v7 = CFSTR("PHSearchAmbiguityTypeNone");
  if (v6 == 1)
    v7 = CFSTR("PHSearchAmbiguityTypePartiallyAmbiguous");
  if (v6 == 2)
    v7 = CFSTR("PHSearchAmbiguityTypeFullyAmbiguous");
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("QU token: %@, suggestion: %@, ambiguityType: %@"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PHSearchQueryAnnotation *v4;
  PHSearchQueryAnnotation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;

  v4 = (PHSearchQueryAnnotation *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHSearchQueryAnnotation suggestion](self, "suggestion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        && (-[PHSearchQueryAnnotation suggestion](v5, "suggestion"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = (void *)v7;
        -[PHSearchQueryAnnotation suggestion](self, "suggestion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHSearchQueryAnnotation suggestion](v5, "suggestion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
LABEL_6:
          -[PHSearchQueryAnnotation QUToken](self, "QUToken");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            && (-[PHSearchQueryAnnotation QUToken](v5, "QUToken"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v14 = (void *)v13;
            -[PHSearchQueryAnnotation QUToken](self, "QUToken");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHSearchQueryAnnotation QUToken](v5, "QUToken");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

          }
          else
          {
            -[PHSearchQueryAnnotation QUToken](self, "QUToken");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHSearchQueryAnnotation QUToken](v5, "QUToken");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v14 == v15;
          }

          goto LABEL_17;
        }
      }
      else
      {
        -[PHSearchQueryAnnotation suggestion](self, "suggestion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHSearchQueryAnnotation suggestion](v5, "suggestion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        if (v18 == v19)
          goto LABEL_6;
      }
      v17 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v17 = 0;
  }
LABEL_18:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PHSearchQueryAnnotation suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PHSearchQueryAnnotation QUToken](self, "QUToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHSearchQueryAnnotation suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("suggestion"));

  -[PHSearchQueryAnnotation QUToken](self, "QUToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("disambiguation_token"));

  v8 = -[PHSearchQueryAnnotation ambiguityType](self, "ambiguityType");
  v9 = CFSTR("PHSearchAmbiguityTypeNone");
  if (v8 == 1)
    v9 = CFSTR("PHSearchAmbiguityTypePartiallyAmbiguous");
  if (v8 == 2)
    v9 = CFSTR("PHSearchAmbiguityTypeFullyAmbiguous");
  v10 = v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ambiguity_type"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (PHSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (PHSearchQueryQUToken)QUToken
{
  return self->_QUToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QUToken, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

+ (id)updateQueryString:(id)a3 withSelectedSuggestion:(id)a4 inRange:(_NSRange)a5 additionalAttributes:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  PHSearchQueryAnnotation *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  NSUInteger v34;
  NSUInteger v35;
  const __CFString *v36;
  PHSearchQueryAnnotation *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  NSRange v45;

  length = a5.length;
  location = a5.location;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQueryAnnotation.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryString.length > 0"));

    if (v13)
      goto LABEL_3;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQueryAnnotation.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectedSuggestion"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_16;
LABEL_3:
  if (objc_msgSend(v13, "type") == 2
    || +[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v12))
  {
    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    if (objc_msgSend(v13, "type") == 2)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v13, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

      v19 = -[PHSearchQueryAnnotation initWithSuggestion:queryToken:]([PHSearchQueryAnnotation alloc], "initWithSuggestion:queryToken:", v13, 0);
      v36 = CFSTR("PHSearchQueryAttributeKey");
      v37 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      if (v14)
        objc_msgSend(v21, "addEntriesFromDictionary:", v14);
      v22 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v18, "setAttributes:range:", v22, 0, objc_msgSend(v18, "length"));

      objc_msgSend(v15, "appendAttributedString:", v18);
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __97__PHSearchQueryAnnotation_updateQueryString_withSelectedSuggestion_inRange_additionalAttributes___block_invoke;
      v30[3] = &unk_1E35D7560;
      v34 = location;
      v35 = length;
      v31 = v15;
      v32 = v13;
      v33 = v14;
      objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v30);

    }
    v23 = (id)objc_msgSend(v15, "copy");

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v45.location = location;
      v45.length = length;
      NSStringFromRange(v45);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v25;
      v40 = 2112;
      v41 = v13;
      v42 = 2112;
      v43 = v26;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "Received out of bounds range: %@ for suggestion: %@ in query string: %@", buf, 0x20u);

    }
    v23 = v12;
  }

  return v23;
}

+ (id)selectedSuggestionsFromQueryString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  NSRange v30;
  NSRange v31;

  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQueryAnnotation.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryString.length > 0"));

  }
  if (+[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v8))
  {
    *(_QWORD *)v25 = 0;
    *(_QWORD *)&v25[8] = v25;
    *(_QWORD *)&v25[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__8379;
    v27 = __Block_byref_object_dispose__8380;
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "attributedSubstringFromRange:", location, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__PHSearchQueryAnnotation_selectedSuggestionsFromQueryString_inRange___block_invoke;
    v20[3] = &unk_1E35D7588;
    v20[4] = v25;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v20);
    if (!objc_msgSend(*(id *)(*(_QWORD *)&v25[8] + 40), "count"))
    {
      PLSearchBackendQueryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v30.location = location;
        v30.length = length;
        NSStringFromRange(v30);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v12;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_INFO, "Unable to find selected suggestions in range: %@ for query string: %@", buf, 0x16u);

      }
    }
    v14 = *(id *)(*(_QWORD *)&v25[8] + 40);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v31.location = location;
      v31.length = length;
      NSStringFromRange(v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138412546;
      *(_QWORD *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2112;
      *(_QWORD *)&v25[14] = v17;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Received out of bounds range: %@ for query string: %@", v25, 0x16u);

    }
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)spotlightAttributedQueryStringFromAnnotatedQueryString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__8379;
    v15 = __Block_byref_object_dispose__8380;
    v5 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v5, "initWithString:", v6);

    v7 = objc_msgSend(v4, "length");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__PHSearchQueryAnnotation_spotlightAttributedQueryStringFromAnnotatedQueryString___block_invoke;
    v10[3] = &unk_1E35D75B0;
    v10[4] = &v11;
    v10[5] = a1;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v10);
    v8 = (void *)objc_msgSend((id)v12[5], "copy");
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)annotatedQueryStringFromSpotlightAttributedQueryString:(id)a3 forSearchQuery:(id)a4 photosEntityStore:(id)a5 photoLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _BYTE *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _BYTE buf[24];
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "searchText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:](PHSearchUtility, "insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "searchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "enableQueryUnderstanding");

  if ((v17 & 1) == 0)
  {
    v32 = objc_msgSend(v15, "copy");
LABEL_14:
    v31 = (id)v32;
    goto LABEL_15;
  }
  if (!objc_msgSend(v10, "length"))
  {
    PLSearchBackendQueryGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "No QU annotated string provided to search by Spotlight for query: \"%@\", buf, 0xCu);
    }
    goto LABEL_13;
  }
  objc_msgSend(v10, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
    PLSearchBackendQueryGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "string");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "QU annotated string value: %@ is not equal to the original string provided to spotlight: %@, cannot annotate the provided string.", buf, 0x16u);

    }
LABEL_13:

    v32 = objc_msgSend(v15, "copy");
    goto LABEL_14;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v10, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:", v22);

  v24 = objc_msgSend(v15, "length");
  v25 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke;
  v46[3] = &unk_1E35D75D8;
  v26 = v23;
  v47 = v26;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v46);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v49 = 0;
  v27 = objc_msgSend(v10, "length");
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke_2;
  v37[3] = &unk_1E35D7600;
  v45 = a1;
  v38 = v15;
  v39 = v11;
  v40 = v10;
  v41 = v12;
  v42 = v13;
  v44 = buf;
  v28 = v26;
  v43 = v28;
  objc_msgSend(v40, "enumerateAttributesInRange:options:usingBlock:", 0, v27, 0, v37);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v29 = objc_msgSend(v28, "length");
    objc_msgSend(v28, "addAttribute:value:range:", CFSTR("PHSearchQueryTripAttributeKey"), MEMORY[0x1E0C9AAB0], 0, v29);
  }
  v30 = v43;
  v31 = v28;

  _Block_object_dispose(buf, 8);
LABEL_15:

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 withAnnotation:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  NSRange v37;

  length = a5.length;
  location = a5.location;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_28:
    v27 = v10;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQueryAnnotation.m"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributedQueryString"));

  if (!v12)
    goto LABEL_28;
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PLSearchBackendQueryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v20;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Cannot update query string: %@ with annotation: %@ because it belongs to an unexpected class", buf, 0x16u);

    }
    goto LABEL_28;
  }
  if (!+[PHSearchUtility rangeExists:forString:](PHSearchUtility, "rangeExists:forString:", location, length, v10))
  {
    PLSearchBackendQueryGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37.location = location;
      v37.length = length;
      NSStringFromRange(v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v22;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Cannot update query string: %@ with annotation: %@ because the provided range is out of bounds: %@", buf, 0x20u);

    }
    goto LABEL_28;
  }
  objc_msgSend(v12, "QUToken");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject hasMemoryGenAnnotation](v13, "hasMemoryGenAnnotation") & 1) != 0)
  {
    objc_msgSend(v12, "suggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_10;
    PLSearchBackendQueryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v12;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "Found suggestion on memory gen annotation: %@, may be erroneous for query: %@", buf, 0x16u);

    }
  }

LABEL_10:
  objc_msgSend(v12, "suggestion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v12, "QUToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasMemoryGenAnnotation");

    if (v25)
    {
      objc_msgSend(v12, "QUToken");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "entityCategoryTypes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v17, "containsIndex:", 5) & 1) == 0
        && ((objc_msgSend(v17, "containsIndex:", 11) & 1) != 0
         || (objc_msgSend(v17, "containsIndex:", 12) & 1) != 0
         || (objc_msgSend(v17, "containsIndex:", 8) & 1) != 0
         || (objc_msgSend(v17, "containsIndex:", 10) & 1) != 0
         || objc_msgSend(v17, "containsIndex:", 9)))
      {
        objc_msgSend(v10, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *MEMORY[0x1E0CA5D78]);
      }
LABEL_27:

    }
    goto LABEL_28;
  }
  objc_msgSend(v12, "suggestion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v17, "type"))
  {
    case 0:
      v18 = v10;
      break;
    case 1:
    case 2:
    case 4:
      objc_msgSend(a1, "_updateSpotlightAttributedQueryString:suggestion:range:", v10, v17, location, length);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "_updateSpotlightAttributedQueryString:disambiguation:range:", v10, v17, location, length);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_27;
  }
  v27 = v18;

LABEL_29:
  return v27;
}

+ (id)_addTripMeaningAnnotationForSpotlightAttributedQueryString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLServicesLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "length");
    v6 = *MEMORY[0x1E0CA5D98];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v5, v6, v7);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v3;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 suggestion:(id)a4 range:(_NSRange)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  int64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSUInteger location;
  NSUInteger length;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "suggestionComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v62;
    v52 = *MEMORY[0x1E0D72E78];
    v53 = (void *)*MEMORY[0x1E0CA5E38];
    v51 = *MEMORY[0x1E0D72E60];
    *(_QWORD *)&v11 = 138412546;
    v50 = v11;
    v58 = v6;
    v59 = v9;
    v56 = *(_QWORD *)v62;
    v57 = v7;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v14);
        +[PHSearchUtility CSAttributedEntityKeyFromIndexCategoryType:](PHSearchUtility, "CSAttributedEntityKeyFromIndexCategoryType:", objc_msgSend(v15, "indexCategory", v50));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          PLSearchBackendQueryGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "indexCategory");
            PLDebugStringForSearchIndexCategory();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v69 = v19;
            v70 = 2112;
            v71 = v15;
            v72 = 2112;
            v73 = v7;
            v20 = v18;
            v21 = "Unable to find CSAttributedEntityKey for index category: %@, no query filter applied for suggestion co"
                  "mponent: %@ for suggestion: %@";
            goto LABEL_16;
          }
LABEL_17:

          goto LABEL_75;
        }
        v17 = objc_msgSend(v15, "indexCategory");
        if (v17 <= 1499)
        {
          if (v17 > 1099)
          {
            if (v17 > 1299)
            {
              if (v17 > 1329)
              {
                if (v17 <= 1399)
                {
                  if (v17 != 1330)
                  {
                    if (v17 != 1331)
                      goto LABEL_75;
                    goto LABEL_73;
                  }
LABEL_87:
                  objc_msgSend(v7, "personUUIDs");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v43, "count");

                  if (v44)
                  {
                    objc_msgSend(v7, "personUUIDs");
                    v18 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", a5.location, a5.length, v16, v18, 0);
                    goto LABEL_17;
                  }
                  goto LABEL_75;
                }
                if (v17 == 1400)
                {
                  v66 = v51;
                  v41 = (void *)MEMORY[0x1E0C99D20];
                  v42 = &v66;
LABEL_90:
                  objc_msgSend(v41, "arrayWithObjects:count:", v42, 1);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", a5.location, a5.length, v16, v45);

                  v33 = v6;
                  location = a5.location;
                  length = a5.length;
                  v36 = v53;
LABEL_74:
                  objc_msgSend(v33, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, v36);
                  goto LABEL_75;
                }
                if (v17 == 1401)
                {
                  v65 = v52;
                  v41 = (void *)MEMORY[0x1E0C99D20];
                  v42 = &v65;
                  goto LABEL_90;
                }
              }
              else
              {
                if (v17 > 1319)
                {
                  if ((unint64_t)(v17 - 1320) < 2)
                  {
                    objc_msgSend(v15, "lookupIdentifier");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v37)
                    {
                      objc_msgSend(v15, "lookupIdentifier");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      PLSearchContributorUUIDFromLookupIdentifier();
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      v67 = v39;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", a5.location, a5.length, v16, v40);

                    }
                  }
                  goto LABEL_75;
                }
                switch(v17)
                {
                  case 1300:
                    goto LABEL_87;
                  case 1301:
                    goto LABEL_73;
                  case 1310:
                    goto LABEL_79;
                }
              }
            }
            else
            {
              if ((unint64_t)(v17 - 1100) <= 5)
              {
                if (v17 == 1102)
                  goto LABEL_79;
LABEL_73:
                v33 = v6;
                location = a5.location;
                length = a5.length;
                v36 = v16;
                goto LABEL_74;
              }
              if ((unint64_t)(v17 - 1200) < 6)
                goto LABEL_73;
            }
          }
          else if (v17 > 999)
          {
            if ((unint64_t)(v17 - 1003) < 4)
              goto LABEL_79;
            if ((unint64_t)(v17 - 1000) < 3)
              goto LABEL_73;
          }
          else
          {
            if ((unint64_t)(v17 - 1) < 0xE)
              goto LABEL_73;
            if (!v17)
            {
              PLSearchBackendQueryGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v50;
                v69 = v15;
                v70 = 2112;
                v71 = v7;
                _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "Unexpected PLSearchIndexCategoryNone, no query filter applied for suggestion component: %@ for suggestion: %@", buf, 0x16u);
              }
              goto LABEL_17;
            }
          }
        }
        else if (v17 <= 1899)
        {
          if (v17 > 1599)
          {
            v26 = (unint64_t)(v17 - 1600) > 0xB || ((1 << (v17 - 64)) & 0xC03) == 0;
            if (!v26 || (unint64_t)(v17 - 1800) < 4 || (unint64_t)(v17 - 1700) < 2)
              goto LABEL_73;
          }
          else
          {
            v22 = v17 + 36;
            if ((unint64_t)(v17 - 1500) > 0x29)
              goto LABEL_75;
            if (((1 << v22) & 0xC0300C03) != 0)
            {
LABEL_37:
              +[PHSearchUtility CSSceneTypeFromIndexCategoryType:](PHSearchUtility, "CSSceneTypeFromIndexCategoryType:", objc_msgSend(v15, "indexCategory"));
              objc_msgSend(v15, "lookupIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "lookupIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                +[PHSearchUtility sceneIdFromIndexCategoryType:lookupIdentifier:](PHSearchUtility, "sceneIdFromIndexCategoryType:lookupIdentifier:", objc_msgSend(v15, "indexCategory"), v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v25 = 0;
              }

              v27 = +[PHSearchUtility CSSceneTypeFromIndexCategoryType:](PHSearchUtility, "CSSceneTypeFromIndexCategoryType:", objc_msgSend(v15, "indexCategory"));
              objc_msgSend(v15, "lookupIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "lookupIdentifier");
              v29 = objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = (void *)v29;
                +[PHSearchUtility sceneIdFromIndexCategoryType:lookupIdentifier:](PHSearchUtility, "sceneIdFromIndexCategoryType:lookupIdentifier:", objc_msgSend(v15, "indexCategory"), v28);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27)
                {
                  v7 = v57;
                  v6 = v58;
                  v13 = v56;
                  if (v31)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "addObject:", v32);

                    objc_msgSend(v54, "addObject:", v31);
                  }
                  goto LABEL_69;
                }
              }
              else
              {

                v31 = 0;
              }
              v7 = v57;
              v6 = v58;
              v13 = v56;
LABEL_69:

              v9 = v59;
              goto LABEL_75;
            }
            if (((1 << v22) & 0x30000000000) != 0)
              goto LABEL_79;
          }
        }
        else if (v17 > 2199)
        {
          if (v17 <= 2499)
          {
            if ((unint64_t)(v17 - 2400) < 2 || v17 == 2200 || v17 == 2300)
              goto LABEL_73;
          }
          else if (v17 > 2699)
          {
            if (v17 == 2700 || v17 == 2800)
            {
LABEL_79:
              PLSearchBackendQueryGetLog();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v15, "indexCategory");
                PLDebugStringForSearchIndexCategory();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v69 = v19;
                v70 = 2112;
                v71 = v15;
                v72 = 2112;
                v73 = v7;
                v20 = v18;
                v21 = "Unexpected PLSearchIndexCategory: %@, no query filter applied for suggestion component: %@ for suggestion: %@";
LABEL_16:
                _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x20u);

              }
              goto LABEL_17;
            }
          }
          else if ((unint64_t)(v17 - 2500) < 2 || (unint64_t)(v17 - 2600) < 2)
          {
            goto LABEL_37;
          }
        }
        else
        {
          if ((unint64_t)(v17 - 1900) < 0x14)
            goto LABEL_73;
          if (v17 == 2000)
          {
            objc_msgSend(v6, "tagRangeWithFilter:withCSAttributedEntityKey:numberValues:", a5.location, a5.length, v16, &unk_1E3657180);
          }
          else if (v17 == 2100)
          {
            goto LABEL_73;
          }
        }
LABEL_75:

        ++v14;
      }
      while (v12 != v14);
      v46 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      v12 = v46;
    }
    while (v46);
  }

  v47 = objc_msgSend(v55, "count");
  if (v47 == objc_msgSend(v54, "count"))
  {
    if (objc_msgSend(v55, "count") && objc_msgSend(v54, "count"))
      objc_msgSend(v6, "tagRangeWithSceneFilters:withCSSceneTypes:sceneIDs:", a5.location, a5.length, v55, v54);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v69 = v7;
      v70 = 2112;
      v71 = v55;
      v72 = 2112;
      v73 = v54;
      _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_ERROR, "Unaligned scene identifiers and scene types, no query filter applied for suggestion: %@, sceneTypes: %@, sceneIds: %@", buf, 0x20u);
    }

  }
  return v6;
}

+ (id)_updateSpotlightAttributedQueryString:(id)a3 disambiguation:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  NSObject *v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  __CFString *v30;
  id v31;
  __CFString *v32;
  void *v33;
  uint64_t v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  length = a5.length;
  location = a5.location;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = -[__CFString categoriesType](v10, "categoriesType");
  if (v11 <= 6)
  {
    if (v11 == 1)
    {
      -[__CFString locationAssetUUIDs](v10, "locationAssetUUIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      v24 = (_QWORD *)MEMORY[0x1E0CA5D90];
      if (v23)
        v24 = (_QWORD *)MEMORY[0x1E0CA5D78];
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *v24);
      goto LABEL_30;
    }
    if (v11 == 4)
    {
      -[__CFString startDate](v10, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString endDate](v10, "endDate");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v14 && v15)
      {
        objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:startDate:endDate:", location, length, *MEMORY[0x1E0CA5DB0], v14, v15);
      }
      else
      {
        PLSearchBackendQueryGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "string");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v37 = v10;
          v38 = 2112;
          v39 = v29;
          _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "Nil dates found for date type suggestion: %@, unable to annotate Spotlight query: %@", buf, 0x16u);

        }
      }

      goto LABEL_30;
    }
    goto LABEL_17;
  }
  if (v11 != 41)
  {
    if (v11 == 12)
    {
      objc_msgSend(a1, "_updateSpotlightAttributedQueryString:suggestion:range:", v9, v10, location, length);
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
      v31 = v21;
      goto LABEL_32;
    }
    if (v11 == 7)
    {
      v12 = *MEMORY[0x1E0CA5E00];
      -[__CFString personUUIDs](v10, "personUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", location, length, v12, v13, 1);

LABEL_30:
      v21 = v9;
      goto LABEL_31;
    }
LABEL_17:
    PLSearchBackendQueryGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = -[__CFString categoriesType](v10, "categoriesType");
      if ((unint64_t)(v26 - 1) > 0x28)
        v27 = CFSTR("PHSearchSuggestionCategoriesTypeUndefined");
      else
        v27 = off_1E35D8E08[v26 - 1];
      v32 = v27;
      -[__CFString text](v10, "text");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v32;
      v38 = 2112;
      v39 = v33;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Unsupported categories type found for disambiguation suggestion: %@, no query filter applied for the suggestion: %@", buf, 0x16u);

    }
    goto LABEL_30;
  }
  PLServicesLocalizedFrameworkString();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
  {
    v19 = *MEMORY[0x1E0CA5D98];
    v35 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", location, length, v19, v20);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "string");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", buf, 0xCu);

    }
  }

  objc_msgSend(v9, "tagRangeWithFilter:withCSAttributedEntityKey:", location, length, *MEMORY[0x1E0CA5D90]);
  v31 = v9;

LABEL_32:
  return v31;
}

+ (id)_annotationFromQueryString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8379;
  v14 = __Block_byref_object_dispose__8380;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PHSearchQueryAnnotation__annotationFromQueryString_inRange___block_invoke;
  v9[3] = &unk_1E35D7588;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

+ (id)_performDisambiguationForPersonName:(id)a3 expansionStringValuesByCSAttributedEntityType:(id)a4 photosEntityStore:(id)a5 photoLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQueryAnnotation.m"), 892, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personName"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5E00]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DF0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v17 = v15;
  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(a1, "_personLookupIdentifiersForPersonNames:photosEntityStore:photoLibrary:", v16, v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unionSet:", v19);

    }
    if (!objc_msgSend(v18, "count"))
    {
      v24[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_personLookupIdentifiersForPersonNames:photosEntityStore:photoLibrary:", v20, v13, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "unionSet:", v21);
    }
    objc_msgSend(v18, "allObjects");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

+ (id)_personLookupIdentifiersForPersonNames:(id)a3 photosEntityStore:(id)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D716F0]), "initWithQueryTerm:disambiguationType:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14), 3);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BF8]), "initWithDisambiguation:photoLibrary:photosEntityStore:", v15, v9, v8);
        objc_msgSend(v16, "performDisambiguationQuery");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "personLookupIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v10;
}

+ (id)_performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 photosEntityStore:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v10;
  v27 = v9;
  if (objc_msgSend(v10, "count"))
  {
    v14 = v10;
  }
  else
  {
    v36[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          PLSearchBackendQueryGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v19;
            _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "QU location data has an unexpected data type: %@", buf, 0xCu);
          }

          goto LABEL_16;
        }
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D716F0]), "initWithQueryTerm:disambiguationType:", v19, 1);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71BF8]), "initWithDisambiguation:photoLibrary:photosEntityStore:", v20, v12, v11);
        objc_msgSend(v21, "performDisambiguationQuery");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "locationNames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v23);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_16:

  return v13;
}

void __62__PHSearchQueryAnnotation__annotationFromQueryString_inRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("PHSearchQueryAttributeKey"), v8, a3, a4);

}

void __128__PHSearchQueryAnnotation_annotatedQueryStringFromSpotlightAttributedQueryString_forSearchQuery_photosEntityStore_photoLibrary___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  char v17;
  char v18;
  int v19;
  BOOL v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  id v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t j;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  void *v83;
  int v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  PHSearchQueryQUToken *v113;
  void *v114;
  PHSearchQueryQUToken *v115;
  PHSearchQueryAnnotation *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  char v124;
  BOOL v125;
  uint64_t v126;
  void *v127;
  id v128;
  __int128 v129;
  void *v130;
  void *v131;
  NSRange v132;
  void *v133;
  id v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[128];
  void *v157;
  _BYTE v158[128];
  _BYTE v159[128];
  NSObject *v160;
  _BYTE v161[128];
  void *v162;
  uint8_t buf[4];
  void *v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  id v168;
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 88), "_annotationFromQueryString:inRange:", *(_QWORD *)(a1 + 32), a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_117;
  v135 = a1;
  v132.location = a3;
  v132.length = a4;
  v9 = *MEMORY[0x1E0CA5DF0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DF0]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CA5E00];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5E00]);
  *(_QWORD *)&v129 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5D90]);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5D38]);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CA5DE8];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v7, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  *((_QWORD *)&v129 + 1) = v10;
  if ((isKindOfClass & 1) != 0)
  {
    v17 = objc_msgSend(v15, "BOOLValue");

    v127 = 0;
  }
  else
  {
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      v19 = 0;
      v127 = 0;
      v20 = v133 == 0;
      v21 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
  }
  v19 = 0;
  v20 = v133 == 0;
  v21 = v17 ^ 1;
  if (v133 && ((v17 ^ 1) & 1) == 0)
  {
    objc_msgSend(*(id *)(v135 + 40), "searchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v22, "enableQueryUnderstandingGenericLocations");

    v20 = 0;
    v21 = v19;
  }
LABEL_10:
  v23 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v134 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v128 = v7;
  v131 = v23;
  if (v129 != 0)
  {
    v125 = v20;
    objc_msgSend(v23, "addIndex:", 2);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v135 + 48), "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "substringWithRange:", v132);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = v27;
    if ((_QWORD)v129)
      objc_msgSend(v27, "setObject:forKeyedSubscript:", (_QWORD)v129, v11);
    if (v10)
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, v9);
    v29 = *(void **)(v135 + 88);
    v30 = *(_QWORD *)(v135 + 56);
    objc_msgSend(*(id *)(v135 + 64), "photoLibrary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_performDisambiguationForPersonName:expansionStringValuesByCSAttributedEntityType:photosEntityStore:photoLibrary:", v26, v28, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v153;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v153 != v36)
            objc_enumerationMutation(v33);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            objc_msgSend(v134, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v24);
            PLSearchBackendQueryGetLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              NSStringFromRange(v132);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v135 + 40), "searchText");
              v41 = v21;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v164 = v40;
              v165 = 2112;
              v166 = v42;
              v167 = 2112;
              v168 = v33;
              _os_log_impl(&dword_1991EC000, v39, OS_LOG_TYPE_ERROR, "QU person data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

              v21 = v41;
            }

            goto LABEL_30;
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
        if (v35)
          continue;
        break;
      }
    }

    if (objc_msgSend(v33, "count"))
      v38 = v33;
    else
      v38 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v38, v24);
LABEL_30:
    v7 = v128;
    v23 = v131;

    v20 = v125;
  }
  if (v19)
  {
    objc_msgSend(v23, "addIndex:", 4);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 4);
    v124 = v21;
    v126 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v133, "count"))
    {
      v43 = v133;
    }
    else
    {
      objc_msgSend(*(id *)(v135 + 48), "string");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "substringWithRange:", v132);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v162 = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v162, 1);
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = 0;
      }

    }
    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v47 = v43;
    v56 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v149;
      while (2)
      {
        v59 = v47;
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v149 != v58)
            objc_enumerationMutation(v59);
          v61 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v47 = v59;

            v44 = v134;
            v45 = (void *)v126;
            objc_msgSend(v134, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v126);
            PLSearchBackendQueryGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              NSStringFromRange(v132);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v135 + 40), "searchText");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v164 = v68;
              v165 = 2112;
              v166 = v69;
              v167 = 2112;
              v168 = v47;
              _os_log_impl(&dword_1991EC000, v52, OS_LOG_TYPE_ERROR, "QU generic location data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

            }
            goto LABEL_53;
          }
          v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D716F0]), "initWithQueryTerm:disambiguationType:", v61, 2);
          v63 = objc_alloc(MEMORY[0x1E0D71BF8]);
          objc_msgSend(*(id *)(v135 + 64), "photoLibrary");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)objc_msgSend(v63, "initWithDisambiguation:photoLibrary:photosEntityStore:", v62, v64, *(_QWORD *)(v135 + 56));

          objc_msgSend(v65, "performDisambiguationQuery");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "genericLocationTuples");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObjectsFromArray:", v67);

        }
        v47 = v59;
        v57 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
        if (v57)
          continue;
        break;
      }
    }

    v52 = objc_msgSend(v51, "copy");
    v44 = v134;
    v45 = (void *)v126;
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v52, v126);
LABEL_53:
    v7 = v128;
    v23 = v131;
    v21 = v124;
  }
  else
  {
    v44 = v134;
    if (v20)
      goto LABEL_55;
    objc_msgSend(v23, "addIndex:", 3);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v135 + 48), "string");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "substringWithRange:", v132);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    v48 = *(void **)(v135 + 88);
    v49 = *(_QWORD *)(v135 + 56);
    objc_msgSend(*(id *)(v135 + 64), "photoLibrary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_performDisambiguationForLocationName:expansionStringValues:photosEntityStore:photoLibrary:", v47, v133, v49, v50);
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "lowercaseString");
    v52 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "containsObject:", v52))
    {
      v160 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v160, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v134;
      objc_msgSend(v134, "setObject:forKeyedSubscript:", v53, v45);

    }
    else
    {
      v44 = v134;
      objc_msgSend(v134, "setObject:forKeyedSubscript:", v51, v45);
    }
  }

LABEL_55:
  if (v130)
  {
    objc_msgSend(v23, "addIndex:", 1);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v71 = v130;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v145;
      while (2)
      {
        for (k = 0; k != v73; ++k)
        {
          if (*(_QWORD *)v145 != v74)
            objc_enumerationMutation(v71);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_68;
          }
        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v144, v159, 16);
        if (v73)
          continue;
        break;
      }
    }

    if (objc_msgSend(v71, "count") && objc_msgSend(v71, "count") != 2)
    {
LABEL_68:
      v44 = v134;
      objc_msgSend(v134, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v70);
      PLSearchBackendQueryGetLog();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        NSStringFromRange(v132);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v135 + 40), "searchText");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v164 = v77;
        v165 = 2112;
        v166 = v78;
        v167 = 2112;
        v168 = v71;
        _os_log_impl(&dword_1991EC000, v76, OS_LOG_TYPE_ERROR, "QU date data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

      }
    }
    else
    {
      v44 = v134;
      objc_msgSend(v134, "setObject:forKeyedSubscript:", v71, v70);
    }

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DD0]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DC0]);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DC8]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DE0]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DB8]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DA8]);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) != 0)
  {
    if (!v80)
      goto LABEL_74;
  }
  else
  {
    objc_msgSend(v23, "addIndex:", 5);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 5);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v127, "count"))
      v98 = v127;
    else
      v98 = (void *)MEMORY[0x1E0C9AA60];
    v44 = v134;
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v98, v97);

    if (!v80)
    {
LABEL_74:
      if (!v82)
        goto LABEL_75;
      goto LABEL_98;
    }
  }
  objc_msgSend(v23, "addIndex:", 8);
  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 8);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v99);

  if (!v82)
  {
LABEL_75:
    if (!v84)
      goto LABEL_76;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v23, "addIndex:", 9);
  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 9);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v100);

  if (!v84)
  {
LABEL_76:
    if (!v87)
      goto LABEL_77;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v23, "addIndex:", 10);
  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 10);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v101);

  if (!v87)
  {
LABEL_77:
    if (!v88)
      goto LABEL_78;
LABEL_123:
    objc_msgSend(v23, "addIndex:", 12);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 12);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v157 = v88;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v157, 1);
      v121 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v121, v120);
    }
    else
    {
      objc_msgSend(v44, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v120);
      PLSearchBackendQueryGetLog();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        NSStringFromRange(v132);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v135 + 40), "searchText");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v164 = v122;
        v165 = 2112;
        v166 = v123;
        v167 = 2112;
        v168 = v88;
        _os_log_impl(&dword_1991EC000, v121, OS_LOG_TYPE_ERROR, "QU memories duration data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

      }
    }

    if (!v86)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_100:
  objc_msgSend(v23, "addIndex:", 11);
  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 11);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v103 = v87;
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v141;
    while (2)
    {
      for (m = 0; m != v105; ++m)
      {
        if (*(_QWORD *)v141 != v106)
          objc_enumerationMutation(v103);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_119;
        }
      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
      if (v105)
        continue;
      break;
    }
  }

  if (objc_msgSend(v103, "count"))
  {
    v44 = v134;
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v103, v102);
  }
  else
  {
LABEL_119:
    v44 = v134;
    objc_msgSend(v134, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v102);
    PLSearchBackendQueryGetLog();
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      NSStringFromRange(v132);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v135 + 40), "searchText");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v164 = v118;
      v165 = 2112;
      v166 = v119;
      v167 = 2112;
      v168 = v103;
      _os_log_impl(&dword_1991EC000, v117, OS_LOG_TYPE_ERROR, "QU memories moods data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

      v23 = v131;
      v44 = v134;

    }
  }
  v7 = v128;

  if (v88)
    goto LABEL_123;
LABEL_78:
  if (v86)
LABEL_79:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v135 + 80) + 8) + 24) = 1;
LABEL_80:
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5DD8]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    objc_msgSend(v23, "addIndex:", 14);
    +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 14);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v91 = v89;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v136, v156, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v137;
      while (2)
      {
        for (n = 0; n != v93; ++n)
        {
          if (*(_QWORD *)v137 != v94)
            objc_enumerationMutation(v91);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v44 = v134;
            objc_msgSend(v134, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v90);
            PLSearchBackendQueryGetLog();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
            {
              NSStringFromRange(v132);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v135 + 40), "searchText");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v164 = v109;
              v165 = 2112;
              v166 = v110;
              v167 = 2112;
              v168 = v91;
              _os_log_impl(&dword_1991EC000, v108, OS_LOG_TYPE_ERROR, "QU person age type data for range: %@ in query: %@ has an unexpected data type: %@", buf, 0x20u);

              v23 = v131;
              v44 = v134;

            }
            goto LABEL_113;
          }
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v136, v156, 16);
        if (v93)
          continue;
        break;
      }
    }

    if (objc_msgSend(v91, "count"))
      v96 = v91;
    else
      v96 = (id)MEMORY[0x1E0C9AA60];
    v44 = v134;
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v96, v90);
LABEL_113:
    v7 = v128;

  }
  if (objc_msgSend(v44, "count"))
  {
    objc_msgSend(*(id *)(v135 + 72), "string");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "substringWithRange:", v132);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = [PHSearchQueryQUToken alloc];
    v114 = (void *)objc_msgSend(v131, "copy");
    v115 = -[PHSearchQueryQUToken initWithText:entityCategoryTypes:metadata:](v113, "initWithText:entityCategoryTypes:metadata:", v112, v114, v134);

    v116 = -[PHSearchQueryAnnotation initWithQueryToken:]([PHSearchQueryAnnotation alloc], "initWithQueryToken:", v115);
    v23 = v131;
    v44 = v134;
    objc_msgSend(*(id *)(v135 + 72), "addAttribute:value:range:", CFSTR("PHSearchQueryAttributeKey"), v116, v132);

  }
  v8 = 0;
LABEL_117:

}

void __82__PHSearchQueryAnnotation_spotlightAttributedQueryStringFromAnnotatedQueryString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_updateSpotlightAttributedQueryString:withAnnotation:range:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8, a3, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __70__PHSearchQueryAnnotation_selectedSuggestionsFromQueryString_inRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = v3;
    objc_msgSend(v3, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v3 = v6;
  }

}

void __97__PHSearchQueryAnnotation_updateQueryString_withSelectedSuggestion_inRange_additionalAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  PHSearchQueryAnnotation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3 == *(_QWORD *)(a1 + 56) && a4 == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", CFSTR("PHSearchQueryAttributeKey"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(v8, "QUToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHSearchQueryAnnotation initWithSuggestion:queryToken:]([PHSearchQueryAnnotation alloc], "initWithSuggestion:queryToken:", *(_QWORD *)(a1 + 40), v9);
    if (objc_msgSend(*(id *)(a1 + 40), "type"))
    {
      v18 = CFSTR("PHSearchQueryAttributeKey");
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      if (*(_QWORD *)(a1 + 48))
        objc_msgSend(v12, "addEntriesFromDictionary:");
      if (objc_msgSend(*(id *)(a1 + 40), "type") == 3)
      {
        v13 = *(void **)(a1 + 32);
        v14 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v13, "setAttributes:range:", v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(*(id *)(a1 + 40), "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v15, "initWithString:", v16);

        v17 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v14, "setAttributes:range:", v17, 0, objc_msgSend(v14, "length"));

        objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v14);
      }

    }
    *a5 = 1;

  }
}

+ (id)searchQueryAnnotationsFromAttributedQueryString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PHSearchQueryAnnotation_Memories__searchQueryAnnotationsFromAttributedQueryString___block_invoke;
  v10[3] = &unk_1E35D75D8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

+ (BOOL)hasCSAttributedEntityTypePhotosMemoriesTripKeyInAttributedQueryString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CA5DE0], 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isTripWithAttributedQueryString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "attribute:atIndex:effectiveRange:", CFSTR("PHSearchQueryTripAttributeKey"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isAllTimeWithAttributedQueryString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "attribute:atIndex:effectiveRange:", CFSTR("PHSearchQueryAllTimeAttributeKey"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)annotatedQueryStringFromLLMQUAttributedString:(id)a3 photoLibrary:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PHSearchQueryOptions *v11;
  PHSearchQuery *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

  v11 = objc_alloc_init(PHSearchQueryOptions);
  -[PHSearchQueryOptions setEnableQueryUnderstanding:](v11, "setEnableQueryUnderstanding:", 1);
  -[PHSearchQueryOptions setEnableQueryUnderstandingGenericLocations:](v11, "setEnableQueryUnderstandingGenericLocations:", 1);
  v12 = -[PHSearchQuery initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:]([PHSearchQuery alloc], "initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:", v10, v11, v6, 0x7FFFFFFFLL, 0);
  objc_msgSend(v6, "searchIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unverifiedPsiSearchIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHSearchQueryAnnotation annotatedQueryStringFromSpotlightAttributedQueryString:forSearchQuery:photosEntityStore:photoLibrary:](PHSearchQueryAnnotation, "annotatedQueryStringFromSpotlightAttributedQueryString:forSearchQuery:photosEntityStore:photoLibrary:", v7, v12, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)performDisambiguationForLocationName:(id)a3 expansionStringValues:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "searchIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unverifiedPsiSearchIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_performDisambiguationForLocationName:expansionStringValues:photosEntityStore:photoLibrary:", v8, v9, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to open the photos entity store during location disambiguation for %@", (uint8_t *)&v17, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)performDisambiguationForPersonName:(id)a3 expansionStringValuesByCSAttributedEntityType:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "searchIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unverifiedPsiSearchIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_performDisambiguationForPersonName:expansionStringValuesByCSAttributedEntityType:photosEntityStore:photoLibrary:", v8, v9, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to open the photos entity store during person disambiguation for %@", (uint8_t *)&v17, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __85__PHSearchQueryAnnotation_Memories__searchQueryAnnotationsFromAttributedQueryString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
