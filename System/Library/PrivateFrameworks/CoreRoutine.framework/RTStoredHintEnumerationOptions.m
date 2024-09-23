@implementation RTStoredHintEnumerationOptions

- (RTStoredHintEnumerationOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithReferenceLocation_sourceFilter_ascending_distance_dateInterval_limit_batchSize_);
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 ascending:(BOOL)a4 dateInterval:(id)a5 limit:(unint64_t)a6 batchSize:(unint64_t)a7
{
  return -[RTStoredHintEnumerationOptions initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:](self, "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", a3, 0, a4, 0, a5, a6, a7);
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 dateInterval:(id)a6 limit:(unint64_t)a7 batchSize:(unint64_t)a8
{
  return -[RTStoredHintEnumerationOptions initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:](self, "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", a3, a4, a5, 0, a6, a7, a8);
}

- (RTStoredHintEnumerationOptions)initWithReferenceLocation:(id)a3 sourceFilter:(id)a4 ascending:(BOOL)a5 distance:(id)a6 dateInterval:(id)a7 limit:(unint64_t)a8 batchSize:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  RTStoredHintEnumerationOptions *v20;
  RTStoredHintEnumerationOptions *v21;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  if (objc_msgSend(v17, "integerValue"))
  {
    if (v16)
      goto LABEL_3;
LABEL_7:

    v18 = 0;
    goto LABEL_8;
  }

  v17 = 0;
  if (!v16)
    goto LABEL_7;
LABEL_3:
  if (!v18)
    v18 = &unk_1E4FC12B0;
LABEL_8:
  v23.receiver = self;
  v23.super_class = (Class)RTStoredHintEnumerationOptions;
  v20 = -[RTStoredHintEnumerationOptions init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_ascending = a5;
    objc_storeStrong((id *)&v20->_referenceLocation, a3);
    objc_storeStrong((id *)&v21->_sourceFilter, v17);
    objc_storeStrong((id *)&v21->_distance, v18);
    objc_storeStrong((id *)&v21->_dateInterval, a7);
    v21->_limit = a8;
    v21->_batchSize = a9;
  }

  return v21;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSDateInterval hash](self->_dateInterval, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_distance, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_limit);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[RTLocation hash](self->_referenceLocation, "hash");
  v12 = v10 ^ v11 ^ -[NSNumber hash](self->_sourceFilter, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredHintEnumerationOptions *v4;
  RTStoredHintEnumerationOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  int v23;

  v4 = (RTStoredHintEnumerationOptions *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v23 = -[RTStoredHintEnumerationOptions ascending](self, "ascending");
      v22 = -[RTStoredHintEnumerationOptions ascending](v5, "ascending");
      v21 = -[RTStoredHintEnumerationOptions batchSize](self, "batchSize");
      v20 = -[RTStoredHintEnumerationOptions batchSize](v5, "batchSize");
      -[RTStoredHintEnumerationOptions dateInterval](self, "dateInterval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTStoredHintEnumerationOptions dateInterval](v5, "dateInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "isEqualToDateInterval:", v7);

      -[RTStoredHintEnumerationOptions distance](self, "distance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTStoredHintEnumerationOptions distance](v5, "distance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[RTStoredHintEnumerationOptions limit](self, "limit");
      v11 = -[RTStoredHintEnumerationOptions limit](v5, "limit");
      -[RTStoredHintEnumerationOptions referenceLocation](self, "referenceLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTStoredHintEnumerationOptions referenceLocation](v5, "referenceLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToLocation:", v13);

      -[RTStoredHintEnumerationOptions sourceFilter](self, "sourceFilter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTStoredHintEnumerationOptions sourceFilter](v5, "sourceFilter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
      if (v23 == v22 && v21 == v20 && v19 && v8 == v9 && v10 == v11)
      {
        if (v15 == v16)
          v17 = v14;
        else
          v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", self->_referenceLocation, self->_sourceFilter, self->_ascending, self->_distance, self->_dateInterval, self->_limit, self->_batchSize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 ascending;
  id v5;

  ascending = self->_ascending;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distance, CFSTR("distance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceLocation, CFSTR("referenceLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceFilter, CFSTR("sourceFilter"));

}

- (RTStoredHintEnumerationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  RTStoredHintEnumerationOptions *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchSize"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceFilter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[RTStoredHintEnumerationOptions initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:](self, "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", v10, v11, v5, v8, v7, v9, v6);
  return v12;
}

- (id)description
{
  void *v3;
  NSNumber *sourceFilter;
  const __CFString *v5;
  NSNumber *distance;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  sourceFilter = self->_sourceFilter;
  if (self->_ascending)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  distance = self->_distance;
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ascending, %@, sourceFilter, %@, distance, %@, startDate, %@, endDate, %@, limit, %ld"), v5, sourceFilter, distance, v8, v10, self->_limit);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (NSNumber)sourceFilter
{
  return self->_sourceFilter;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sourceFilter, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

@end
