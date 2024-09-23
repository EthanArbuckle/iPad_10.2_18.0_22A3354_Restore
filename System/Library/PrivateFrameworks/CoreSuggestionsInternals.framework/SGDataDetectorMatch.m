@implementation SGDataDetectorMatch

+ (id)detectionsInPlainText:(id)a3 baseDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB36B8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithIndexesInRange:", 0, objc_msgSend(v8, "length"));
  objc_msgSend(a1, "_detectionsInPlainText:withEligibleRegions:ddSignature:baseDate:", v8, v9, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 ddSignature:(_NSRange *)a5 baseDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const void *ScannerRefAndAcquire;
  CFMutableArrayRef Mutable;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  const void *v28;
  CFMutableArrayRef v29;
  _NSRange *v30;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)objc_opt_new();
  ScannerRefAndAcquire = (const void *)getScannerRefAndAcquire();
  if (a5)
  {
    *a5 = (_NSRange)xmmword_1C385A570;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (!Mutable)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
  }
  else
  {
    Mutable = 0;
  }
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke;
  v24 = &unk_1E7DAA8A8;
  v28 = ScannerRefAndAcquire;
  v16 = v9;
  v25 = v16;
  v29 = Mutable;
  v17 = v11;
  v26 = v17;
  v18 = v12;
  v27 = v18;
  v30 = a5;
  objc_msgSend(v10, "enumerateRangesUsingBlock:", &v21);

  releaseScannerRef(ScannerRefAndAcquire);
  if (Mutable)
    CFRelease(Mutable);
  objc_msgSend(v18, "matches", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  id v15;
  id v16;
  SGDataDetectorMatch *v17;
  SGDataDetectorMatch *v18;
  objc_super v20;

  length = a5.length;
  location = a5.location;
  v11 = a4.length;
  v12 = a4.location;
  v15 = a6;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SGDataDetectorMatch;
  v17 = -[SGDataDetectorMatch init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_matchType = a3;
    v17->_range.location = v12;
    v17->_range.length = v11;
    v17->_labelRange.location = location;
    v17->_labelRange.length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = -1;
  }

  return v18;
}

- (SGDataDetectorMatch)initWithLookupHintInDomain:(int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 qid:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v12;
  NSUInteger v13;
  id v15;
  id v16;
  SGDataDetectorMatch *v17;
  SGDataDetectorMatch *v18;
  id v21;
  objc_super v22;

  length = a5.length;
  location = a5.location;
  v12 = a4.length;
  v13 = a4.location;
  v21 = a6;
  v15 = a8;
  v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SGDataDetectorMatch;
  v17 = -[SGDataDetectorMatch init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_matchType = 6;
    v17->_range.location = v13;
    v17->_range.length = v12;
    v17->_labelRange.location = location;
    v17->_labelRange.length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = a3;
    objc_storeStrong((id *)&v18->_parsecWikidataQid, a9);
  }

  return v18;
}

- (SGDataDetectorMatch)initWithDetectedDate:(id)a3 detectedTimeZone:(id)a4 detectedEndDate:(id)a5 detectedEndTimeZone:(id)a6 matchType:(unsigned int)a7 range:(_NSRange)a8 labelRange:(_NSRange)a9 labelString:(id)a10 valueRange:(_NSRange)a11 valueString:(id)a12 allDay:(BOOL)a13 inferredDate:(BOOL)a14 approximateTime:(BOOL)a15 partialDate:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SGDataDetectorMatch *v26;
  SGDataDetectorMatch *v27;
  id obj;
  id v31;
  objc_super v32;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  obj = a6;
  v24 = a6;
  v25 = a10;
  v31 = a12;
  v32.receiver = self;
  v32.super_class = (Class)SGDataDetectorMatch;
  v26 = -[SGDataDetectorMatch init](&v32, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_detectedDate, a3);
    objc_storeStrong((id *)&v27->_detectedTimeZone, a4);
    objc_storeStrong((id *)&v27->_detectedEndDate, a5);
    objc_storeStrong((id *)&v27->_detectedEndTimeZone, obj);
    v27->_matchType = a7;
    v27->_range = a8;
    v27->_labelRange = a9;
    v27->_valueRange = a11;
    objc_storeStrong((id *)&v27->_labelString, a10);
    objc_storeStrong((id *)&v27->_valueString, a12);
    v27->_parsecDomain = -1;
    v27->_allDay = a13;
    v27->_inferredDate = a14;
    v27->_approximateTime = a15;
    v27->_partialDate = a16;
  }

  return v27;
}

- (SGDataDetectorMatch)initWithMatchType:(unsigned int)a3 range:(_NSRange)a4 labelRange:(_NSRange)a5 labelString:(id)a6 valueRange:(_NSRange)a7 valueString:(id)a8 postalAddressComponents:(id)a9
{
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  id v15;
  id v16;
  SGDataDetectorMatch *v17;
  SGDataDetectorMatch *v18;
  NSUInteger length;
  id v21;
  objc_super v22;

  length = a5.length;
  location = a5.location;
  v11 = a4.length;
  v12 = a4.location;
  v21 = a6;
  v15 = a8;
  v16 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SGDataDetectorMatch;
  v17 = -[SGDataDetectorMatch init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_matchType = a3;
    v17->_range.location = v12;
    v17->_range.length = v11;
    v17->_labelRange.location = location;
    v17->_labelRange.length = length;
    v17->_valueRange = a7;
    objc_storeStrong((id *)&v17->_labelString, a6);
    objc_storeStrong((id *)&v18->_valueString, a8);
    v18->_parsecDomain = -1;
    objc_storeStrong((id *)&v18->_postalAddressComponents, a9);
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGDataDetectorMatch/%i %i-%i"), self->_matchType, self->_range.location, self->_range.length + self->_range.location);
}

- (SGDataDetectorMatch)initWithCoder:(id)a3
{
  id v4;
  SGDataDetectorMatch *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *labelString;
  void *v15;
  uint64_t v16;
  NSString *valueString;
  void *v18;
  uint64_t v19;
  NSString *parsecWikidataQid;
  void *v21;
  uint64_t v22;
  SGPostalAddressComponents *postalAddressComponents;
  void *v24;
  uint64_t v25;
  NSDate *detectedDate;
  void *v27;
  uint64_t v28;
  NSTimeZone *detectedTimeZone;
  void *v30;
  uint64_t v31;
  NSDate *detectedEndDate;
  void *v33;
  uint64_t v34;
  NSTimeZone *detectedEndTimeZone;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGDataDetectorMatch;
  v5 = -[SGDataDetectorMatch init](&v37, sel_init);
  if (v5)
  {
    v5->_matchType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("matchType"));
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("range_location"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("range_length"));
    v5->_range.location = v6;
    v5->_range.length = v7;
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("labelRange_location"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("labelRange_length"));
    v5->_labelRange.location = v8;
    v5->_labelRange.length = v9;
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueRange_location"));
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueRange_length"));
    v5->_valueRange.location = v10;
    v5->_valueRange.length = v11;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("labelString"));
    v13 = objc_claimAutoreleasedReturnValue();
    labelString = v5->_labelString;
    v5->_labelString = (NSString *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("valueString"));
    v16 = objc_claimAutoreleasedReturnValue();
    valueString = v5->_valueString;
    v5->_valueString = (NSString *)v16;

    v5->_parsecDomain = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("parsecDomain"));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("parsecWikidataQid"));
    v19 = objc_claimAutoreleasedReturnValue();
    parsecWikidataQid = v5->_parsecWikidataQid;
    v5->_parsecWikidataQid = (NSString *)v19;

    v5->_allDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allDay"));
    v5->_inferredDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inferredDate"));
    v5->_approximateTime = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("approximateTime"));
    v5->_partialDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("partialDate"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("postalAddressComponents"));
    v22 = objc_claimAutoreleasedReturnValue();
    postalAddressComponents = v5->_postalAddressComponents;
    v5->_postalAddressComponents = (SGPostalAddressComponents *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("detectedDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    detectedDate = v5->_detectedDate;
    v5->_detectedDate = (NSDate *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("detectedTimeZone"));
    v28 = objc_claimAutoreleasedReturnValue();
    detectedTimeZone = v5->_detectedTimeZone;
    v5->_detectedTimeZone = (NSTimeZone *)v28;

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("detectedEndDate"));
    v31 = objc_claimAutoreleasedReturnValue();
    detectedEndDate = v5->_detectedEndDate;
    v5->_detectedEndDate = (NSDate *)v31;

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("detectedEndTimeZone"));
    v34 = objc_claimAutoreleasedReturnValue();
    detectedEndTimeZone = v5->_detectedEndTimeZone;
    v5->_detectedEndTimeZone = (NSTimeZone *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t matchType;
  id v5;

  matchType = self->_matchType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", matchType, CFSTR("matchType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_range.location, CFSTR("range_location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_range.length, CFSTR("range_length"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_labelRange.location, CFSTR("labelRange_location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_labelRange.length, CFSTR("labelRange_length"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_valueRange.location, CFSTR("valueRange_location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_valueRange.length, CFSTR("valueRange_length"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelString, CFSTR("labelString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_valueString, CFSTR("valueString"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_parsecDomain, CFSTR("parsecDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parsecWikidataQid, CFSTR("parsecWikidataQid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allDay, CFSTR("allDay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inferredDate, CFSTR("inferredDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_approximateTime, CFSTR("approximateTime"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_partialDate, CFSTR("partialDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddressComponents, CFSTR("postalAddressComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedDate, CFSTR("detectedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedTimeZone, CFSTR("detectedTimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedEndDate, CFSTR("detectedEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedEndTimeZone, CFSTR("detectedEndTimeZone"));

}

- (BOOL)isEqualToDataDetectorMatch:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  char v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;

  v7 = a3;
  if (v7
    && (v8 = -[SGDataDetectorMatch matchType](self, "matchType"), v8 == objc_msgSend(v7, "matchType")))
  {
    v9 = -[SGDataDetectorMatch range](self, "range");
    v11 = v10;
    v13 = 0;
    if (v9 == objc_msgSend(v7, "range") && v11 == v12)
    {
      v14 = -[SGDataDetectorMatch labelRange](self, "labelRange");
      v16 = v15;
      v13 = 0;
      if (v14 == objc_msgSend(v7, "labelRange") && v16 == v17)
      {
        v18 = -[SGDataDetectorMatch valueRange](self, "valueRange");
        v20 = v19;
        v13 = 0;
        if (v18 == objc_msgSend(v7, "valueRange") && v20 == v21)
        {
          -[SGDataDetectorMatch labelString](self, "labelString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "labelString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 != v23)
          {
            -[SGDataDetectorMatch labelString](self, "labelString");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "labelString");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v3, "isEqual:", v4))
            {
              v13 = 0;
              goto LABEL_24;
            }
          }
          -[SGDataDetectorMatch valueString](self, "valueString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "valueString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 != v26)
          {
            -[SGDataDetectorMatch valueString](self, "valueString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "valueString");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = v27;
            if (!objc_msgSend(v27, "isEqual:", v5))
            {
              v13 = 0;
              goto LABEL_22;
            }
          }
          v28 = -[SGDataDetectorMatch parsecDomain](self, "parsecDomain");
          if (v28 != objc_msgSend(v7, "parsecDomain"))
          {
            v13 = 0;
            if (v25 == v26)
              goto LABEL_23;
            goto LABEL_22;
          }
          -[SGDataDetectorMatch parsecWikidataQid](self, "parsecWikidataQid");
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "parsecWikidataQid");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v3;
          v83 = v5;
          if ((void *)v29 == v81)
          {
            v80 = (void *)v29;
          }
          else
          {
            v76 = v22;
            v30 = v26;
            v31 = v25;
            v32 = v4;
            -[SGDataDetectorMatch parsecWikidataQid](self, "parsecWikidataQid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "parsecWikidataQid");
            v79 = v33;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v33, "isEqual:"))
            {
              v40 = (void *)v29;
              v13 = 0;
              v39 = v81;
              v4 = v32;
              v25 = v31;
              v26 = v30;
              v22 = v76;
              goto LABEL_35;
            }
            v80 = (void *)v29;
            v4 = v32;
            v25 = v31;
            v26 = v30;
            v22 = v76;
          }
          v34 = -[SGDataDetectorMatch allDay](self, "allDay");
          if (v34 != objc_msgSend(v7, "allDay")
            || (v35 = -[SGDataDetectorMatch inferredDate](self, "inferredDate"),
                v35 != objc_msgSend(v7, "inferredDate"))
            || (v36 = -[SGDataDetectorMatch approximateTime](self, "approximateTime"),
                v36 != objc_msgSend(v7, "approximateTime"))
            || (v37 = -[SGDataDetectorMatch partialDate](self, "partialDate"),
                v37 != objc_msgSend(v7, "partialDate")))
          {
            v13 = 0;
            v38 = 0;
            goto LABEL_32;
          }
          -[SGDataDetectorMatch postalAddressComponents](self, "postalAddressComponents");
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "postalAddressComponents");
          v74 = objc_claimAutoreleasedReturnValue();
          v75 = (void *)v41;
          if (v41 != v74)
          {
            -[SGDataDetectorMatch postalAddressComponents](self, "postalAddressComponents");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "postalAddressComponents");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v42;
            if (!objc_msgSend(v42, "isEqual:"))
            {
              v13 = 0;
              v44 = (void *)v74;
              v43 = v75;
              goto LABEL_60;
            }
          }
          -[SGDataDetectorMatch detectedDate](self, "detectedDate");
          v45 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "detectedDate");
          v72 = objc_claimAutoreleasedReturnValue();
          v73 = (void *)v45;
          if (v45 != v72)
          {
            -[SGDataDetectorMatch detectedDate](self, "detectedDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "detectedDate");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v46;
            if (!objc_msgSend(v46, "isEqual:"))
            {
              v47 = (void *)v72;
              v48 = v73;
              v13 = 0;
              v44 = (void *)v74;
LABEL_58:

LABEL_59:
              v43 = v75;
              if (v75 == v44)
              {
LABEL_61:

                v38 = v13;
LABEL_32:
                v40 = v80;
                v39 = v81;
                if (v80 == v81)
                {

                  v13 = v38;
                  goto LABEL_36;
                }
LABEL_35:

LABEL_36:
                v3 = v82;
                v5 = v83;
                if (v25 == v26)
                {
LABEL_23:

                  if (v22 == v23)
                  {
LABEL_25:

                    goto LABEL_13;
                  }
LABEL_24:

                  goto LABEL_25;
                }
LABEL_22:

                goto LABEL_23;
              }
LABEL_60:

              goto LABEL_61;
            }
          }
          -[SGDataDetectorMatch detectedTimeZone](self, "detectedTimeZone");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "detectedTimeZone");
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v49;
          if (v49 != v68)
          {
            -[SGDataDetectorMatch detectedTimeZone](self, "detectedTimeZone");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "detectedTimeZone");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v50;
            if (!objc_msgSend(v50, "isEqual:"))
            {
              v13 = 0;
              v48 = v73;
              v44 = (void *)v74;
              v51 = (void *)v68;
LABEL_56:

LABEL_57:
              v47 = (void *)v72;
              if (v48 == (void *)v72)
                goto LABEL_59;
              goto LABEL_58;
            }
          }
          -[SGDataDetectorMatch detectedEndDate](self, "detectedEndDate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "detectedEndDate");
          v64 = v23;
          v65 = objc_claimAutoreleasedReturnValue();
          v77 = v22;
          if (v52 == (void *)v65
            || (-[SGDataDetectorMatch detectedEndDate](self, "detectedEndDate"),
                v53 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v7, "detectedEndDate"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                v61 = v53,
                objc_msgSend(v53, "isEqual:")))
          {
            -[SGDataDetectorMatch detectedEndTimeZone](self, "detectedEndTimeZone");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "detectedEndTimeZone");
            v56 = objc_claimAutoreleasedReturnValue();
            if (v55 == (void *)v56)
            {

              v13 = 1;
            }
            else
            {
              v57 = (void *)v56;
              -[SGDataDetectorMatch detectedEndTimeZone](self, "detectedEndTimeZone");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "detectedEndTimeZone");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v58, "isEqual:", v59);

            }
            v23 = v64;
            v54 = (void *)v65;
            v22 = v77;
            v44 = (void *)v74;
            if (v52 == (void *)v65)
            {
LABEL_55:

              v51 = (void *)v68;
              v48 = v73;
              if (v69 == (void *)v68)
                goto LABEL_57;
              goto LABEL_56;
            }
          }
          else
          {
            v13 = 0;
            v54 = (void *)v65;
            v44 = (void *)v74;
          }

          goto LABEL_55;
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SGDataDetectorMatch *v4;
  SGDataDetectorMatch *v5;
  BOOL v6;

  v4 = (SGDataDetectorMatch *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGDataDetectorMatch isEqualToDataDetectorMatch:](self, "isEqualToDataDetectorMatch:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SGDataDetectorMatch matchType](self, "matchType");
  v4 = -[SGDataDetectorMatch range](self, "range");
  -[SGDataDetectorMatch range](self, "range");
  return (v5 ^ v4) - v3 + 32 * v3;
}

- (unsigned)matchType
{
  return self->_matchType;
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

- (_NSRange)labelRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_labelRange.length;
  location = self->_labelRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)valueRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_valueRange.length;
  location = self->_valueRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSString)labelString
{
  return self->_labelString;
}

- (int)parsecDomain
{
  return self->_parsecDomain;
}

- (NSString)parsecWikidataQid
{
  return self->_parsecWikidataQid;
}

- (NSDate)detectedDate
{
  return self->_detectedDate;
}

- (NSTimeZone)detectedTimeZone
{
  return self->_detectedTimeZone;
}

- (NSDate)detectedEndDate
{
  return self->_detectedEndDate;
}

- (NSTimeZone)detectedEndTimeZone
{
  return self->_detectedEndTimeZone;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (BOOL)inferredDate
{
  return self->_inferredDate;
}

- (BOOL)approximateTime
{
  return self->_approximateTime;
}

- (BOOL)partialDate
{
  return self->_partialDate;
}

- (SGPostalAddressComponents)postalAddressComponents
{
  return self->_postalAddressComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddressComponents, 0);
  objc_storeStrong((id *)&self->_detectedEndTimeZone, 0);
  objc_storeStrong((id *)&self->_detectedEndDate, 0);
  objc_storeStrong((id *)&self->_detectedTimeZone, 0);
  objc_storeStrong((id *)&self->_detectedDate, 0);
  objc_storeStrong((id *)&self->_parsecWikidataQid, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)inferredDateForDataDetectorResult:(__DDResult *)a3
{
  CFTimeZoneRef v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v3 = CFTimeZoneCopyDefault();
  if (calendarsAndFormatters_onceToken != -1)
    dispatch_once(&calendarsAndFormatters_onceToken, &__block_literal_global_7804);
  v4 = (id)calendarsAndFormatters_result_0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 28, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SGDataDetectorsGetDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v3);
  if (v7)
  {
    objc_msgSend(v4, "components:fromDate:", 28, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "year");
    if (v9 == objc_msgSend(v6, "year") && (v10 = objc_msgSend(v8, "month"), v10 == objc_msgSend(v6, "month")))
    {
      v11 = objc_msgSend(v8, "day");
      v12 = v11 == objc_msgSend(v6, "day");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)partialDateForDataDetectorResult:(__DDResult *)a3
{
  CFStringRef v3;
  CFStringRef v4;
  BOOL v5;

  if (DDResultHasType())
    DDResultGetSubresultWithType();
  v3 = CFStringCreateWithCString(0, "PartialDate", 0x8000100u);
  v4 = CFStringCreateWithCString(0, "RelativeDayOfWeek", 0x8000100u);
  v5 = 1;
  if (!DDResultGetSubresultWithType() && !DDResultGetSubresultWithType())
  {
    DDResultGetSubresultWithType();
    if (!DDResultGetSubresultWithType())
      v5 = 0;
  }
  CFRelease(v3);
  CFRelease(v4);
  return v5;
}

+ (BOOL)approximateTimeForDataDetectorResult:(__DDResult *)a3
{
  const __CFArray *SubResults;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  BOOL v8;

  SubResults = (const __CFArray *)DDResultGetSubResults();
  if (SubResults)
  {
    v4 = SubResults;
    Count = CFArrayGetCount(SubResults);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v6 = Count;
      v7 = 0;
      v8 = 1;
      do
      {
        CFArrayGetValueAtIndex(v4, v7);
        if (DDResultTimeIsApprox())
          break;
        v8 = ++v7 < v6;
      }
      while (v6 != v7);
    }
  }
  else
  {
    return DDResultTimeIsApprox() != 0;
  }
  return v8;
}

+ (void)resetUnusedScannersForTesting
{
  uint64_t v2;
  char v3;
  char v4;
  void *v5;

  pthread_mutex_lock(&scannerPoolLock);
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    v5 = (void *)sharedScanners[v2];
    if (v5 && !scannerInUse[v2])
    {
      sharedScanners[v2] = 0;

    }
    v3 = 0;
    v2 = 1u;
  }
  while ((v4 & 1) != 0);
  pthread_mutex_unlock(&scannerPoolLock);
}

+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4
{
  return (id)objc_msgSend(a1, "_detectionsInPlainText:withEligibleRegions:ddSignature:baseDate:", a3, a4, 0, 0);
}

+ (id)detectionsInPlainText:(id)a3 withEligibleRegions:(id)a4 baseDate:(id)a5
{
  return (id)objc_msgSend(a1, "_detectionsInPlainText:withEligibleRegions:ddSignature:baseDate:", a3, a4, 0, a5);
}

+ (id)detectionsAndSignatureInText:(id)a3 eligibleRegions:(id)a4 baseDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v14 = xmmword_1C385A570;
  objc_msgSend(a1, "_detectionsInPlainText:withEligibleRegions:ddSignature:baseDate:", v10, v9, &v14, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMatches:", v12);
  objc_msgSend(v11, "setSignatureRange:", v14);
  return v11;
}

+ (BOOL)stringHasDatesOrTimes:(id)a3
{
  id v3;
  const void *ScannerRefAndAcquire;
  uint64_t v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    ScannerRefAndAcquire = (const void *)getScannerRefAndAcquire();
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = *MEMORY[0x1E0D1CDA0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__SGDataDetectorMatch_stringHasDatesOrTimes___block_invoke;
    v8[3] = &unk_1E7DB1130;
    v8[4] = &v9;
    SGDataDetectorsScan((uint64_t)ScannerRefAndAcquire, v3, v5, v8);
    releaseScannerRef(ScannerRefAndAcquire);
    v6 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __45__SGDataDetectorMatch_stringHasDatesOrTimes___block_invoke(uint64_t a1)
{
  int Category;

  Category = DDResultGetCategory();
  if (Category == 4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return Category != 4;
}

void __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFArray *v8;
  CFIndex Count;
  uint64_t *v10;
  uint64_t Range;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  void *v15;
  CFIndex v16;
  uint64_t v17;
  CFIndex v18;
  void *v19;
  const __CFArray *SubResults;
  const __CFArray *v21;
  CFIndex v22;
  CFIndex v23;
  uint64_t v24;
  CFIndex v25;
  CFIndex i;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t j;
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  CFIndex v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  uint8_t buf[8];
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  _BYTE v57[128];
  uint64_t v58;

  v5 = a1;
  v58 = *MEMORY[0x1E0C80C00];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke_2;
  v48[3] = &unk_1E7DAA880;
  v6 = *(_QWORD *)(a1 + 56);
  v51 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 32);
  v49 = *(id *)(a1 + 40);
  v50 = *(id *)(v5 + 48);
  SGDataDetectorsScanRange(v6, v7, a2, a3, 3, v48);
  v8 = *(const __CFArray **)(v5 + 64);
  if (v8 && *(_QWORD *)(v5 + 72))
  {
    Count = CFArrayGetCount(v8);
    if (Count == 1)
    {
      v10 = *(uint64_t **)(v5 + 72);
      CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), 0);
      Range = DDResultGetRange();
      *v10 = SGRangeFromCFRange(Range, v12);
      v10[1] = v13;
    }
    else
    {
      v14 = Count;
      if (Count >= 2)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v42 = v5;
        v43 = v14;
        v41 = v15;
        do
        {
          v19 = (void *)objc_opt_new();
          CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), v18);
          SubResults = (const __CFArray *)DDResultGetSubResults();
          if (SubResults)
          {
            v21 = SubResults;
            v22 = CFArrayGetCount(SubResults);
            if (v22 > v17)
            {
              v17 = v22;
              v16 = v18;
            }
            if (v22 >= 1)
            {
              v23 = v22;
              v24 = v17;
              v25 = v16;
              for (i = 0; i != v23; ++i)
              {
                CFArrayGetValueAtIndex(v21, i);
                if (DDResultHasType())
                {
                  *(_QWORD *)buf = 0;
                  if (DDResultCopyPhoneValue())
                  {
                    v27 = *(void **)buf;
                    if (*(_QWORD *)buf)
                    {
                      SGNormalizePhoneNumber();
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "addObject:", v28);

                    }
                  }
                }
              }
              v16 = v25;
              v17 = v24;
              v5 = v42;
              v14 = v43;
              v15 = v41;
            }
          }
          objc_msgSend(v15, "addObject:", v19);

          ++v18;
        }
        while (v18 != v14);
        v29 = v17;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v30 = v15;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v45 != v34)
                objc_enumerationMutation(v30);
              if (v33)
                objc_msgSend(v33, "intersectSet:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
              else
                v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "mutableCopy");
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          }
          while (v32);
        }
        else
        {
          v33 = 0;
        }

        if (objc_msgSend(v33, "count") && v29 >= 1)
        {
          sgLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&buf[4] = v43;
            v53 = 1024;
            v54 = v16;
            v55 = 1024;
            v56 = v29;
            _os_log_debug_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEBUG, "Found %i DD sigs for same person. Using sig %i with %i subresults", buf, 0x14u);
          }

          v37 = *(uint64_t **)(v5 + 72);
          CFArrayGetValueAtIndex(*(CFArrayRef *)(v5 + 64), v16);
          v38 = DDResultGetRange();
          *v37 = SGRangeFromCFRange(v38, v39);
          v37[1] = v40;
        }

      }
    }
  }

}

uint64_t __87__SGDataDetectorMatch__detectionsInPlainText_withEligibleRegions_ddSignature_baseDate___block_invoke_2(uint64_t a1, const void *a2)
{
  __CFArray *v4;
  const __CFArray *SubResults;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const void *ValueAtIndex;
  void *v11;
  void *v12;

  if (DDResultHasType())
  {
    v4 = *(__CFArray **)(a1 + 48);
    if (v4)
      CFArrayAppendValue(v4, a2);
    SubResults = (const __CFArray *)DDResultGetSubResults();
    if (SubResults)
    {
      v6 = SubResults;
      Count = CFArrayGetCount(SubResults);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
          matchFromSimpleDDResult((uint64_t)ValueAtIndex, *(void **)(a1 + 32));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(*(id *)(a1 + 40), "coalesceAddress:orAppendMatch:", ValueAtIndex, v11);

        }
      }
    }
  }
  else
  {
    matchFromSimpleDDResult((uint64_t)a2, *(void **)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(*(id *)(a1 + 40), "coalesceAddress:orAppendMatch:", a2, v12);

  }
  return 1;
}

@end
