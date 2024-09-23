@implementation SGStructuredEventDocument

- (SGStructuredEventDocument)initWithPlainText:(id)a3 category:(unsigned __int8)a4 dataDetectorMatches:(id)a5 enrichedTaggedCharacterRanges:(id)a6 modelOutput:(id)a7 fromSuggestTool:(BOOL)a8
{
  id v15;
  id v16;
  SGStructuredEventDocument *v17;
  SGStructuredEventDocument *v18;
  objc_super v20;

  v15 = a3;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SGStructuredEventDocument;
  v17 = -[SGExtractionDocument initWithEnrichedTaggedCharacterRanges:modelOutput:](&v20, sel_initWithEnrichedTaggedCharacterRanges_modelOutput_, a6, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_plainText, a3);
    v18->_category = a4;
    objc_storeStrong((id *)&v18->_dataDetectorMatches, a5);
    v18->_fromSuggestTool = a8;
  }

  return v18;
}

- (id)detectedEventName
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t category;
  void *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        !v6))
  {
    sgEventsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect title, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }
    goto LABEL_11;
  }
  -[SGStructuredEventDocument titleMapping](self, "titleMapping");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    sgEventsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: No title mapping, unsupported category", v19, 2u);
    }

    v8 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", CFSTR("title"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDocument candidatesForLabelTokenIndexes:inPlainText:](self, "candidatesForLabelTokenIndexes:inPlainText:", v9, self->_plainText);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cleanCandidates:outputName:label:", v10, CFSTR("title"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "simpleCandidateResolutionFromCandidates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v14 = 0;
  }
  else
  {
    category = self->_category;
    -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGStructuredEventDocument resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v11, category, v8, v9, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:

  return v14;
}

- (id)detectedReservationIdWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t category;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint8_t v17[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", CFSTR("core"), CFSTR("EVENT_CORE__RESERVATION_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[SGExtractionDocument candidatesForLabelTokenIndexes:inPlainText:](self, "candidatesForLabelTokenIndexes:inPlainText:", v8, self->_plainText);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "simpleCandidateResolutionFromCandidates:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        if ((unint64_t)objc_msgSend(v9, "count") < 2)
        {
          v10 = 0;
        }
        else
        {
          category = self->_category;
          -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGStructuredEventDocument resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v9, category, CFSTR("EVENT_CORE__RESERVATION_ID"), v8, v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (a3 && !v10)
        {
          v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v18 = *MEMORY[0x1E0CB2D50];
          v19[0] = CFSTR("SGStructuredEventDocument: reservationId, unable to resolve candidates");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("SGExtractionDocumentErrorDomain"), 1, v15);

        }
      }
      v13 = v10;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    sgEventsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect reservationId, missing modelOutput or enrichedTaggedCharacterRanges", v17, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)detectedStartDateComponents
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[16];

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", CFSTR("time"), CFSTR("EVENT_TIME__START_DATETIME"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    -[SGExtractionDocument detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:useEndForDurations:](self, "detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:useEndForDurations:", v6, self->_dataDetectorMatches, 1, 0, 0, 0, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGStructuredEventDocument filterCandidateDateComponents:](self, "filterCandidateDateComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sgEventsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect startDateComponents, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)detectedEndDateComponents
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[16];

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", CFSTR("time"), CFSTR("EVENT_TIME__END_DATETIME"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 1;
    -[SGExtractionDocument detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:useEndForDurations:](self, "detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:useEndForDurations:", v6, self->_dataDetectorMatches, 1, 0, 0, 0, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGStructuredEventDocument filterCandidateDateComponents:](self, "filterCandidateDateComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sgEventsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect endDateComponents, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)filterCandidateDateComponents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v5 = 0;
LABEL_11:
      v5 = v5;
      v6 = v5;
      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "mergeDetectedDateComponents:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!v4
    || objc_msgSend(v4, "year") != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v5, "month") != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v5, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)detectedStartAddressWithError:(id *)a3
{
  return -[SGStructuredEventDocument detectedAddressForLabel:withError:](self, "detectedAddressForLabel:withError:", CFSTR("EVENT_LOCATION__START_ADDRESS"), a3);
}

- (id)detectedEndAddressWithError:(id *)a3
{
  return -[SGStructuredEventDocument detectedAddressForLabel:withError:](self, "detectedAddressForLabel:withError:", CFSTR("EVENT_LOCATION__END_ADDRESS"), a3);
}

- (id)detectedAddressForLabel:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect startAddress, missing modelOutput or enrichedTaggedCharacterRanges", v16, 2u);
    }
    goto LABEL_9;
  }
  -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", CFSTR("location"), v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v10, "count"))
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  -[SGStructuredEventDocument detectedPostalAddressExtractionForTokenIndexes:dataDetectorMatches:label:](self, "detectedPostalAddressExtractionForTokenIndexes:dataDetectorMatches:label:", v10, self->_dataDetectorMatches, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasExtraction");
  if (a4 && (v12 & 1) == 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("SGStructuredEventDocument: address, unable to resolve candidates");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("SGExtractionDocumentErrorDomain"), 1, v14);

  }
LABEL_10:

  return v11;
}

- (id)detectedStartPlaceWithError:(id *)a3
{
  return -[SGStructuredEventDocument _simpleCandidateForOutputName:label:withError:](self, "_simpleCandidateForOutputName:label:withError:", CFSTR("location"), CFSTR("EVENT_LOCATION__START_PLACE"), a3);
}

- (id)detectedEndPlaceWithError:(id *)a3
{
  return -[SGStructuredEventDocument _simpleCandidateForOutputName:label:withError:](self, "_simpleCandidateForOutputName:label:withError:", CFSTR("location"), CFSTR("EVENT_LOCATION__END_PLACE"), a3);
}

- (id)_simpleCandidateForOutputName:(id)a3 label:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t category;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect %@, missing modelOutput or enrichedTaggedCharacterRanges", buf, 0xCu);
    }
    goto LABEL_8;
  }
  -[SGStructuredEventDocument labelTokenIndexesForOutputName:label:](self, "labelTokenIndexesForOutputName:label:", v8, v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v13, "count"))
  {
LABEL_8:
    v17 = 0;
    goto LABEL_16;
  }
  -[SGExtractionDocument candidatesForLabelTokenIndexes:inPlainText:](self, "candidatesForLabelTokenIndexes:inPlainText:", v13, self->_plainText);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cleanCandidates:outputName:label:", v14, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "simpleCandidateResolutionFromCandidates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      v18 = 0;
    }
    else
    {
      category = self->_category;
      -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGStructuredEventDocument resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v15, category, v9, v13, v20);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a5 && !v18)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGStructuredEventDocument: %@, unable to resolve candidates"), v9);
      v26 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("SGExtractionDocumentErrorDomain"), 1, v23);

      v18 = 0;
    }
  }

LABEL_16:
  return v17;
}

- (id)mergePostalAddressComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    obj = v3;
    v36 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v36)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "street", obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (v6)
          {
            objc_msgSend(v12, "street");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v6, "caseInsensitiveCompare:", v14);

            if (v15)
            {
LABEL_29:
              v3 = obj;

              v33 = 0;
              goto LABEL_32;
            }
          }
          objc_msgSend(v12, "street");
          v16 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v16;
        }
        objc_msgSend(v12, "city");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (v7)
          {
            objc_msgSend(v12, "city");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v7, "caseInsensitiveCompare:", v18);

            if (v19)
              goto LABEL_29;
          }
          objc_msgSend(v12, "city");
          v20 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v20;
        }
        objc_msgSend(v12, "postalCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          if (v8)
          {
            objc_msgSend(v12, "postalCode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v8, "caseInsensitiveCompare:", v22);

            if (v23)
              goto LABEL_29;
          }
          objc_msgSend(v12, "postalCode");
          v24 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v24;
        }
        objc_msgSend(v12, "state");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (v9)
          {
            objc_msgSend(v12, "state");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v9, "caseInsensitiveCompare:", v26);

            if (v27)
              goto LABEL_29;
          }
          objc_msgSend(v12, "state");
          v28 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v28;
        }
        objc_msgSend(v12, "country");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          if (v10)
          {
            objc_msgSend(v12, "country");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v10, "caseInsensitiveCompare:", v30);

            if (v31)
              goto LABEL_29;
          }
          objc_msgSend(v12, "country");
          v32 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v32;
        }
      }
      v3 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D198E8], "components:city:state:postalCode:country:", v6, v7, v9, v8, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v33;
}

- (id)detectedPostalAddressExtractionForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t category;
  void *v21;
  SGPostalAddressExtraction *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  void *v27;
  SGStructuredEventDocument *v28;
  id v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __102__SGStructuredEventDocument_detectedPostalAddressExtractionForTokenIndexes_dataDetectorMatches_label___block_invoke;
    v27 = &unk_1E7DA81F8;
    v28 = self;
    v29 = v9;
    v14 = v13;
    v30 = v14;
    v15 = v12;
    v31 = v15;
    objc_msgSend(v8, "enumerateRangesUsingBlock:", &v24);
    if (objc_msgSend(v14, "count", v24, v25, v26, v27, v28) == 1)
    {
      objc_msgSend(v14, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        goto LABEL_14;
    }
    else if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      objc_msgSend(v14, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGStructuredEventDocument mergePostalAddressComponents:](self, "mergePostalAddressComponents:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_14;
    }
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v16 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      objc_msgSend(v15, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      category = self->_category;
      -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGStructuredEventDocument resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v19, category, v10, v8, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v16 = 0;
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v16 = 0;
  v17 = 0;
LABEL_16:
  v22 = -[SGPostalAddressExtraction initWithPlainText:components:]([SGPostalAddressExtraction alloc], "initWithPlainText:components:", v17, v16);

  return v22;
}

- (id)titleMapping
{
  if (self->_category - 4 > 4)
    return 0;
  else
    return off_1E7DA8238[(self->_category - 4)];
}

- (id)modelOutputSummary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelOutputSummary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)predictedStringsFromModelOutput
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v27 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("polarity")) & 1) == 0)
        {
          -[SGExtractionDocument modelOutput](self, "modelOutput");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");

          if (v10)
          {
            v11 = 0;
            do
            {
              -[SGExtractionDocument modelOutput](self, "modelOutput");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v7);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("NONE")) & 1) == 0)
              {
                objc_msgSend(v3, "objectForKeyedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v15)
                {
                  v16 = (void *)objc_opt_new();
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v14);

                }
                objc_msgSend(v3, "objectForKeyedSubscript:", v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addIndex:", v11);

              }
              ++v11;
              -[SGExtractionDocument modelOutput](self, "modelOutput");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v7);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

            }
            while (v20 > v11);
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  v21 = (void *)objc_opt_class();
  -[SGStructuredEventDocument plainText](self, "plainText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "candidatesForLabelIndexSets:inPlainText:forTaggedCharacterRanges:", v3, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)resolveCandidates:(id)a3 forCategory:(unsigned __int8)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  uint64_t v9;
  _BOOL4 fromSuggestTool;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a4;
  fromSuggestTool = self->_fromSuggestTool;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (fromSuggestTool)
    objc_msgSend(v16, "resolveCandidatesWithoutXPC:forCategory:label:rawIndexSet:taggedCharacterRanges:", v15, v17, v14, v13, v12);
  else
    objc_msgSend(v16, "resolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v15, v17, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxMergeDistanceForSection:label:", v7, v6);

  v10 = (void *)objc_opt_class();
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelTokenIndexesForOutputName:label:modelOutput:maxMergeDistance:", v7, v6, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)detectedEventPolarity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGExtractionDocument labelTokenIndexesForOutputName:label:modelOutput:](SGExtractionDocument, "labelTokenIndexesForOutputName:label:modelOutput:", CFSTR("polarity"), CFSTR("POLARITY__EVENT_YES"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("polarity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v4, "containsIndex:", 0))
    {
      -[SGExtractionDocument modelOutput](self, "modelOutput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("polarity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("POLARITY__EVENT_YES"));

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (unsigned)category
{
  return self->_category;
}

- (NSArray)dataDetectorMatches
{
  return self->_dataDetectorMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorMatches, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

void __102__SGStructuredEventDocument_detectedPostalAddressExtractionForTokenIndexes_dataDetectorMatches_label___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSUInteger v16;
  NSUInteger length;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  NSRange v31;
  NSRange v32;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "textRangeForTokenRange:", a2, a3);
  v6 = v5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = a1;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v12, "matchType") == 1)
        {
          objc_msgSend(v12, "postalAddressComponents");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            v32.location = objc_msgSend(v12, "range");
            v32.length = v16;
            v31.location = v4;
            v31.length = v6;
            length = NSIntersectionRange(v31, v32).length;

            if (length)
            {
              v18 = *(void **)(v24 + 48);
              objc_msgSend(v12, "postalAddressComponents");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v19);

            }
          }
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v20 = *(void **)(v24 + 56);
  objc_msgSend(*(id *)(v24 + 32), "plainText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "substringWithRange:", v4, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _PASCollapseWhitespaceAndStrip();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v23);

}

+ (id)modelOutputSummary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v21 = v5;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v5);
        v7 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v5, "objectForKeyedSubscript:", v7, v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = v9;
          v24 = i;
          v11 = 0;
          v12 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              v14 = v11;
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v8);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              if ((!v14 || (objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j)) & 1) == 0)
                && (objc_msgSend(CFSTR("NONE"), "isEqualToString:", v15) & 1) == 0)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  v17 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue") + 1);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v15);

                }
                else
                {
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7E0BDF8, v15);
                }
              }
              v11 = v15;

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v10);

          v5 = v21;
          i = v24;
        }

      }
      v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  return v4;
}

+ (id)candidatesForLabelIndexSets:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = (id)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "candidatesForLabelTokenIndexes:inPlainText:forTaggedCharacterRanges:", v17, v9, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v20;
}

+ (id)simpleCandidateResolutionFromCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(a1, "caseInsensitiveContainsString:inCandidates:", v11, v5, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)caseInsensitiveContainsString:(id)a3 inCandidates:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "caseInsensitiveCompare:", v5, (_QWORD)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)cleanCandidates:(id)a3 outputName:(id)a4 label:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stripRepeatedContentForSectionLength:label:", v8, v7);

  sgMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)stripRepeatedContent:(id)a3 repeatedLength:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (!a4 || objc_msgSend(v5, "length") < a4)
    goto LABEL_5;
  v7 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v6, "length") * 0.5);
  objc_msgSend(v6, "substringToIndex:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  _PASTrimTrailingWhitespace();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "substringFromIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v8 & 1) == 0)
  {

LABEL_5:
    v9 = v6;
  }

  return v9;
}

uint64_t __62__SGStructuredEventDocument_cleanCandidates_outputName_label___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stripRepeatedContent:repeatedLength:", a2, *(_QWORD *)(a1 + 40));
}

@end
