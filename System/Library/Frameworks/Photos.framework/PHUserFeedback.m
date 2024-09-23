@implementation PHUserFeedback

- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  PHUserFeedback *v11;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHUserFeedback initWithType:feature:context:lastModifiedDate:](self, "initWithType:feature:context:lastModifiedDate:", a3, a4, v9, v10);

  return v11;
}

- (PHUserFeedback)initWithType:(unint64_t)a3 feature:(unint64_t)a4 context:(id)a5 lastModifiedDate:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PHUserFeedback *v14;

  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = a5;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PHUserFeedback initWithUUID:type:feature:creationType:context:lastModifiedDate:](self, "initWithUUID:type:feature:creationType:context:lastModifiedDate:", v12, a3, a4, 1, v10, v13);

  return v14;
}

- (PHUserFeedback)initWithUUID:(id)a3 type:(unint64_t)a4 feature:(unint64_t)a5 creationType:(unint64_t)a6 context:(id)a7 lastModifiedDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  NSString *v18;
  NSString *context;
  NSDate *v20;
  NSDate *lastModifiedDate;

  v15 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_uuid, a3);
    v16 = a8;
    v17 = a7;
    self->_type = a4;
    self->_feature = a5;
    self->_creationType = a6;
    v18 = (NSString *)objc_msgSend(v17, "copy");

    context = self->_context;
    self->_context = v18;

    v20 = (NSDate *)objc_msgSend(v16, "copy");
    lastModifiedDate = self->_lastModifiedDate;
    self->_lastModifiedDate = v20;

  }
  return self;
}

- (id)contextAsStringWithError:(id *)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[PHUserFeedback feature](self, "feature")
    && -[PHUserFeedback feature](self, "feature")
    && -[PHUserFeedback feature](self, "feature") != 2
    && -[PHUserFeedback feature](self, "feature") != 4)
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = CFSTR("User Feedback feature not supported for parsing context as string.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 2, v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    -[PHUserFeedback context](self, "context");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)contextAsDateWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[PHUserFeedback feature](self, "feature") == 1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    -[PHUserFeedback context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
    }
    else if (a3)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[PHUserFeedback context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Error parsing context '%@' as date."), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 1, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (!a3)
      return 0;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("User Feedback feature not supported for parsing context as date.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 2, v5);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)contextAsDateIntervalWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (-[PHUserFeedback feature](self, "feature") == 5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    -[PHUserFeedback context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" - "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
      }
      else
      {
        if (a3)
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          -[PHUserFeedback context](self, "context");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("Error parsing context '%@' as date interval."), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (void *)MEMORY[0x1E0CB35C8];
          v23 = *MEMORY[0x1E0CB2D50];
          v24 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 1, v22);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        v12 = 0;
      }
    }
    else
    {
      if (!a3)
      {
        v12 = 0;
        goto LABEL_15;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[PHUserFeedback context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Error parsing context '%@' as date interval."), v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 1, v11);
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    goto LABEL_16;
  }
  if (!a3)
    return 0;
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0CB2D50];
  v28[0] = CFSTR("User Feedback feature not supported for parsing context as date interval.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 2, v5);
  v12 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

- (id)contextAsLocationWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  CLLocationCoordinate2D v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CLLocationDegrees latitude;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (-[PHUserFeedback feature](self, "feature") == 3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    -[PHUserFeedback context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 1, &v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v48;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("latitude"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      latitude = v12;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("longitude"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("altitude"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("verticalAccuracy"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("course"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("courseAccuracy"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speed"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speedAccuracy"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromString:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v40 = CLLocationCoordinate2DMake(latitude, v15);
      v41 = (void *)objc_msgSend(v39, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", v38, v40.latitude, v40.longitude, v18, v21, v24, v27, v30, v33, v36);

    }
    else
    {
      if (!a3)
      {
        v41 = 0;
        goto LABEL_9;
      }
      v49[0] = *MEMORY[0x1E0CB2D50];
      v43 = (void *)MEMORY[0x1E0CB3940];
      -[PHUserFeedback context](self, "context");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("Error parsing context as location. Context: '%@'."), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = *MEMORY[0x1E0CB3388];
      v50[0] = v45;
      v50[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 1, v10);
      v41 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    goto LABEL_10;
  }
  if (!a3)
  {
    v41 = 0;
    return v41;
  }
  v42 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2D50];
  v52[0] = CFSTR("User Feedback feature not supported for parsing context as CLLocation.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 2, v5);
  v41 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v41;
}

- (id)contextAsListOfSongIdentifiersWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[PHUserFeedback feature](self, "feature") == 6)
  {
    -[PHUserFeedback context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 1, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v7
      && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("songIdentifiers")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("songIdentifiers"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v19[0] = *MEMORY[0x1E0CB2D50];
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[PHUserFeedback context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Error parsing context as list of song identifiers. Context: %@."), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = *MEMORY[0x1E0CB3388];
        v20[0] = v15;
        v20[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 1, v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }

  }
  else
  {
    if (!a3)
      return 0;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("User Feedback feature not supported for parsing context as song identifiers.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoKit.PHUserFeedback"), 2, v6);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)isEqualWithoutUUID:(id)a3
{
  PHUserFeedback *v4;
  PHUserFeedback *v5;
  BOOL v6;

  v4 = (PHUserFeedback *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = self->_type == v4->_type
      && self->_feature == v4->_feature
      && self->_creationType == v4->_creationType
      && -[NSString isEqualToString:](self->_context, "isEqualToString:", v4->_context)
      && -[NSDate isEqualToDate:](self->_lastModifiedDate, "isEqualToDate:", v5->_lastModifiedDate);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PHUserFeedback *v4;
  BOOL v5;

  v4 = (PHUserFeedback *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[NSString isEqualToString:](self->_uuid, "isEqualToString:", v4->_uuid))
  {
    v5 = -[PHUserFeedback isEqualWithoutUUID:](self, "isEqualWithoutUUID:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHUserFeedback uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_type;
  v5[3] = self->_feature;
  v5[4] = self->_creationType;
  v8 = -[NSString copyWithZone:](self->_context, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSDate copyWithZone:](self->_lastModifiedDate, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uuid;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  uuid = self->_uuid;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", uuid, CFSTR("PHUserFeedbackPropertyUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("PHUserFeedbackPropertyType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_feature);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("PHUserFeedbackPropertyFeature"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_creationType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("PHUserFeedbackPropertyCreationType"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_context, CFSTR("PHUserFeedbackPropertyContext"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("PHUserFeedbackPropertyLastModifiedDate"));

}

- (PHUserFeedback)initWithCoder:(id)a3
{
  id v4;
  PHUserFeedback *v5;
  uint64_t v6;
  NSString *uuid;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *context;
  uint64_t v13;
  NSDate *lastModifiedDate;

  v4 = a3;
  v5 = -[PHUserFeedback init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyFeature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_feature = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyCreationType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_creationType = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyContext"));
    v11 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHUserFeedbackPropertyLastModifiedDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v13;

  }
  return v5;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = -[PHUserFeedback type](self, "type");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E35DBA28[v3];
  v5 = -[PHUserFeedback feature](self, "feature");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = off_1E35DBA48[v5];
  v7 = -[PHUserFeedback creationType](self, "creationType");
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_1E35DBA80[v7];
  v17.receiver = self;
  v17.super_class = (Class)PHUserFeedback;
  -[PHUserFeedback description](&v17, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUserFeedback uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHUserFeedback type](self, "type");
  v12 = -[PHUserFeedback feature](self, "feature");
  -[PHUserFeedback lastModifiedDate](self, "lastModifiedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUserFeedback context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" UUID: %@, type: %tu (%@), feature: %tu (%@), creationType: %@, lastModifiedDate: %@, context: %@"), v10, v11, v4, v12, v6, v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (unint64_t)creationType
{
  return self->_creationType;
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)negativeUserFeedbackForMemoryFeature:(id)a3 existingFeedback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PHUserFeedback *v9;
  PHUserFeedback *v10;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "PHUserFeedback: Adding multiple pieces of feedback to the same memory is not supported. Will not add feedback for memory feature %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = (PHUserFeedback *)v7;
    goto LABEL_5;
  }
  if (!v6)
  {
    v9 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 2, 0, 0);
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "type") == 1)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "PHUserFeedback: Negative feedback for person should not be generated on a PHMemory. Create a feedback on PHPerson instead. negativeUserFeedbackForMemoryFeature function will return nil.", (uint8_t *)&v14, 2u);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "_contextForMemoryFeature:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 2, objc_msgSend(a1, "_feedbackFeatureForMemoryFeature:", v6), v13);

  }
LABEL_6:

  return v10;
}

+ (id)negativeUserFeedbackForMemoryMusicWithSongIdentifier:(id)a3 existingFeedback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  PHUserFeedback *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "feature") == 6)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v8, "feature") == 6)
    {
      v17 = 0;
      objc_msgSend(v8, "contextAsListOfSongIdentifiersWithError:", &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v12 = objc_msgSend(v10, "mutableCopy");

      if (!v12)
      {
        PLPhotoKitGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "PHUserFeedback: Error retrieving song identifiers from existing feedback: %@", buf, 0xCu);
        }
        v14 = 0;
        goto LABEL_7;
      }

      v9 = (id)v12;
    }
    objc_msgSend(v9, "addObject:", v6);
    objc_msgSend(a1, "_contextForSongIdentifiers:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 2, 6, v13);
    v11 = v9;
LABEL_7:

    goto LABEL_11;
  }
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "PHUserFeedback: Adding multiple pieces of feedback to the same memory is not supported. Will not add feedback for song identifier %@", buf, 0xCu);
  }

  v14 = v8;
LABEL_11:

  return v14;
}

+ (id)negativeUserFeedbackForPerson:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  PHUserFeedback *v6;

  objc_msgSend(a3, "userFeedbackProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "type") == 2)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "type") == 3)
  {
    v5 = 3;
  }
  else
  {
    v5 = 2;
  }
  v6 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", v5, 0, 0);

  return v6;
}

+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedName:(id)a4
{
  id v4;
  PHUserFeedback *v5;

  v4 = a4;
  v5 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 3, 1, v4);

  return v5;
}

+ (id)negativeAutonamingUserFeedbackForPerson:(id)a3 rejectedContactIdentifier:(id)a4
{
  id v4;
  PHUserFeedback *v5;

  v4 = a4;
  v5 = -[PHUserFeedback initWithType:feature:context:]([PHUserFeedback alloc], "initWithType:feature:context:", 3, 2, v4);

  return v5;
}

+ (unint64_t)mergeFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4
{
  if (a3 <= a4)
    return a4;
  else
    return a3;
}

+ (unint64_t)sumFeedbackType:(unint64_t)a3 withOtherFeedbackType:(unint64_t)a4
{
  unint64_t v4;

  if (a3 <= a4)
    v4 = a4;
  else
    v4 = a3;
  if (a4 == 2 && a3 == 2)
    return 3;
  else
    return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_contextForMemoryFeature:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[9];
  _QWORD v41[11];

  v41[9] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  if (objc_msgSend(v3, "type") == 16)
  {
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "type") != 512)
    {
      if (objc_msgSend(v3, "type") == 32)
      {
        objc_msgSend(v3, "holidayName");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v3, "type") == 4096)
        {
          objc_msgSend(v3, "location");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = CFSTR("coordinate");
          v38[0] = CFSTR("latitude");
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "coordinate");
          objc_msgSend(v13, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38[1] = CFSTR("longitude");
          v39[0] = v37;
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "coordinate");
          objc_msgSend(v14, "numberWithDouble:", v15);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v35;
          v40[1] = CFSTR("altitude");
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "altitude");
          objc_msgSend(v16, "numberWithDouble:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v34;
          v40[2] = CFSTR("horizontalAccuracy");
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "horizontalAccuracy");
          objc_msgSend(v17, "numberWithDouble:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v41[2] = v33;
          v40[3] = CFSTR("verticalAccuracy");
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "verticalAccuracy");
          objc_msgSend(v18, "numberWithDouble:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v41[3] = v32;
          v40[4] = CFSTR("course");
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "course");
          objc_msgSend(v19, "numberWithDouble:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41[4] = v20;
          v40[5] = CFSTR("courseAccuracy");
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "courseAccuracy");
          objc_msgSend(v21, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v41[5] = v22;
          v40[6] = CFSTR("speed");
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "speed");
          objc_msgSend(v23, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41[6] = v24;
          v40[7] = CFSTR("speedAccuracy");
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "speedAccuracy");
          objc_msgSend(v25, "numberWithDouble:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v41[7] = v26;
          v40[8] = CFSTR("timestamp");
          objc_msgSend(v5, "timestamp");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "stringFromDate:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v41[8] = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v29, 8, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v30, 4);

          goto LABEL_9;
        }
        if (objc_msgSend(v3, "type") != 0x20000)
        {
          v6 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v3, "areaName");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v6 = (void *)v12;
      goto LABEL_10;
    }
    objc_msgSend(v3, "dateInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), v9, CFSTR(" - "), v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

LABEL_10:
  return v6;
}

+ (id)_contextForSongIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("songIdentifiers");
  v11[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);

  v8 = (void *)objc_msgSend(v7, "initWithData:encoding:", v6, 4);
  return v8;
}

+ (unint64_t)_feedbackFeatureForMemoryFeature:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 16)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "type") == 512)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "type") == 32)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "type") == 4096)
  {
    v4 = 3;
  }
  else
  {
    v4 = 4 * (objc_msgSend(v3, "type") == 0x20000);
  }

  return v4;
}

@end
