@implementation IMMessagePartSyndicationRange

+ (id)rangesFromSerializedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") - 1);
      v8 = objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(a1, "deserializeSyndicationRangeFromString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13), (_QWORD)v21);
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              IMLogHandleForCategory("IMMessagePartSyndicationRange");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                sub_19E36F3A4();

              goto LABEL_24;
            }
            v15 = (void *)v14;
            -[NSObject addObject:](v8, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v11)
            continue;
          break;
        }
      }

      v16 = -[NSObject count](v8, "count");
      if (v16 == objc_msgSend(v9, "count"))
      {
        v8 = v8;
        v17 = v8;
LABEL_25:

        goto LABEL_26;
      }
      IMLogHandleForCategory("IMMessagePartSyndicationRange");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_19E36F344();

    }
    else
    {
      IMLogHandleForCategory("IMMessagepartSyndicationRange");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_19E36F2E4();
    }
LABEL_24:
    v17 = 0;
    goto LABEL_25;
  }
  v17 = 0;
LABEL_26:

  return v17;
}

- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5
{
  return -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](self, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", a3, a4.location, a4.length, a5, ((unint64_t)a3 >> 5) & 1, 0);
}

- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5 syndicationStatus:(int64_t)a6 assetDescriptor:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  IMMessagePartSyndicationRange *v16;
  IMMessagePartSyndicationRange *v17;
  NSObject *v18;
  NSObject *v19;
  IMMessagePartSyndicationRange *v20;
  objc_super v22;

  length = a4.length;
  location = a4.location;
  v14 = a5;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IMMessagePartSyndicationRange;
  v16 = -[IMMessagePartSyndicationRange init](&v22, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_12;
  if ((unint64_t)a3 < 0xA)
  {
    if (!(location | length))
    {
      IMLogHandleForCategory("IMMessagePartSyndicationRange");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_19E36EE00(v19);

      goto LABEL_10;
    }
    v16->_syndicationType = a3;
    v16->_messagePartRange.location = location;
    v16->_messagePartRange.length = length;
    objc_storeStrong((id *)&v16->_syndicationStartDate, a5);
    v17->_syndicationStatus = a6;
    objc_storeStrong((id *)&v17->_assetDescriptor, a7);
LABEL_12:
    v20 = v17;
    goto LABEL_13;
  }
  IMLogHandleForCategory("IMMessagePartSyndicationRange");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_19E36EDA0();

LABEL_10:
  v20 = 0;
LABEL_13:

  return v20;
}

- (IMMessagePartSyndicationRange)initWithSyndicationAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  IMMessagePartSyndicationRange *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "messagePartSyndicationType");
  v6 = objc_msgSend(v4, "messagePartRange");
  v8 = v7;
  objc_msgSend(v4, "syndicationStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "messagePartSyndicationStatus");

  v11 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](self, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v5, v6, v8, v9, v10, 0);
  return v11;
}

- (IMMessagePartSyndicationRange)initWithCoder:(id)a3
{
  id v4;
  IMMessagePartSyndicationRange *v5;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  NSDate *syndicationStartDate;
  uint64_t v10;
  IMMessagePartSyndicationAssetDescriptor *assetDescriptor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMMessagePartSyndicationRange;
  v5 = -[IMMessagePartSyndicationRange init](&v13, sel_init);
  if (v5)
  {
    v5->_syndicationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syndicationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagePartRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_messagePartRange.location = objc_msgSend(v6, "rangeValue");
    v5->_messagePartRange.length = v7;

    v5->_serializedVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("serializedVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syndicationStartDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    syndicationStartDate = v5->_syndicationStartDate;
    v5->_syndicationStartDate = (NSDate *)v8;

    v5->_syndicationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syndicationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetDescriptor"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetDescriptor = v5->_assetDescriptor;
    v5->_assetDescriptor = (IMMessagePartSyndicationAssetDescriptor *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t syndicationType;
  void *v5;
  id v6;

  syndicationType = self->_syndicationType;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", syndicationType, CFSTR("syndicationType"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_messagePartRange.location, self->_messagePartRange.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("messagePartRange"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"), CFSTR("serializedVersion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_syndicationStartDate, CFSTR("syndicationStartDate"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_syndicationStatus, CFSTR("syndicationStatus"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_assetDescriptor, CFSTR("assetDescriptor"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType");
  v6 = -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange");
  v8 = v7;
  -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus");
  -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v5, v6, v8, v9, v10, v11);

  return v12;
}

- (NSString)serializedString
{
  NSString *serializedString;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSString *v22;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[9];

  v26[8] = *MEMORY[0x1E0C80C00];
  serializedString = self->_serializedString;
  if (!serializedString)
  {
    -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serializedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "length"))
    {
      v6 = objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 4);
      v26[0] = CFSTR("|");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v8;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange");
      objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[4] = v11;
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "__im_nanosecondTimeInterval"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[5] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[6] = v15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[7] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25[0] = CFSTR("|");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v8;
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange");
      objc_msgSend(v18, "numberWithUnsignedInteger:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[4] = v11;
      v20 = (void *)MEMORY[0x1E0CB37E8];
      -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v13, "__im_nanosecondTimeInterval"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[5] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[6] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("|"));
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    v22 = self->_serializedString;
    self->_serializedString = v21;

    serializedString = self->_serializedString;
  }
  return serializedString;
}

- (unint64_t)serializedVersion
{
  unint64_t result;

  result = self->_serializedVersion;
  if (!result)
  {
    result = +[IMMessagePartSyndicationRange serializationVersion](IMMessagePartSyndicationRange, "serializationVersion");
    self->_serializedVersion = result;
  }
  return result;
}

+ (id)_stringFromSyndicationType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC)
    return 0;
  else
    return off_1E3FBA610[a3];
}

+ (id)_stringFromSyndicationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E3FBA678[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartSyndicationRange;
  -[IMMessagePartSyndicationRange description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_stringFromSyndicationType:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_stringFromSyndicationStatus:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_messagePartRange);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion");
  -[IMMessagePartSyndicationRange serializedString](self, "serializedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, syndicationType: %@, syndicationStatus: %@, messagePartRange: %@, syndicationStartDate: %@, version: %ld, serializedString: %@, assetSyndications: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v7 = objc_msgSend(v4, "serializedVersion");
    if (v7 == -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion")
      && (v8 = objc_msgSend(v4, "syndicationType"),
          v8 == -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"))
      && (v9 = objc_msgSend(v4, "syndicationStatus"),
          v9 == -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus")))
    {
      objc_msgSend(v4, "syndicationStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "__im_nanosecondTimeInterval");
      -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v12, "__im_nanosecondTimeInterval"))
      {
        v13 = objc_msgSend(v4, "messagePartRange");
        v15 = v14;
        v18 = v13 == -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange") && v15 == v16;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v4, "assetDescriptor");
    v19 = objc_claimAutoreleasedReturnValue();
    -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20 | v19;

    if (v21)
      v6 = 0;
    else
      v6 = v18;
    if (v21 && v18)
    {
      -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v22, "isEqual:", v19);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)serializedStringFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "serializedString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendFormat:", CFSTR(",%@"), v10);
          else
            objc_msgSend(v4, "appendString:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)messageRangeFromTokens_v1:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  IMMessagePartSyndicationRange *v19;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") != 5 && objc_msgSend(v4, "count") != 6)
  {
    IMLogHandleForCategory("IMMessagePartSyndicationRange");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_19E36F000(v4);
    goto LABEL_29;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "longLongValue");

  if (objc_msgSend(v4, "count") == 6)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

  }
  else
  {
    v14 = 0;
  }
  if (v6 < 9)
  {
    if (v8 < 0 || v10 < 0)
    {
      IMLogHandleForCategory("IMMessagePartSyndicationRange");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v16 = objc_claimAutoreleasedReturnValue();
        v23 = 134218498;
        v24 = v8;
        v25 = 2048;
        v26 = v10;
        v27 = 2112;
        v28 = v16;
        _os_log_error_impl(&dword_19E239000, v15, OS_LOG_TYPE_ERROR, "Message part range is out of range. Location: %ld, Length: %ld, in tokens: %@", (uint8_t *)&v23, 0x20u);
        goto LABEL_28;
      }
    }
    else
    {
      if (!v10)
      {
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_19E36EE40(v4, v15);
        goto LABEL_29;
      }
      if (!v12)
      {
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_19E36EEC8(v4);
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v12);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_19E36EF70(v4);
        goto LABEL_28;
      }
      if (v14 < 3)
      {
        v19 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:]([IMMessagePartSyndicationRange alloc], "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v6, v8, v10, v15, v14, 0);
        goto LABEL_30;
      }
      IMLogHandleForCategory("IMMessagePartSyndicationRange");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "_stringFromSyndicationStatus:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = (uint64_t)v21;
        v25 = 2112;
        v26 = (uint64_t)v22;
        _os_log_error_impl(&dword_19E239000, v18, OS_LOG_TYPE_ERROR, "Syndication status is out of range: %@ in tokens: %@", (uint8_t *)&v23, 0x16u);

      }
    }
  }
  else
  {
    IMLogHandleForCategory("IMMessagePartSyndicationRange");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "_stringFromSyndicationType:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = (uint64_t)v16;
      v25 = 2112;
      v26 = (uint64_t)v17;
      _os_log_error_impl(&dword_19E239000, v15, OS_LOG_TYPE_ERROR, "Syndication type is out of range: %@ in tokens: %@", (uint8_t *)&v23, 0x16u);

LABEL_28:
    }
  }
LABEL_29:
  v19 = 0;
LABEL_30:

  return v19;
}

+ (id)messageRangeFromTokens_v3:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  IMMessagePartSyndicationRange *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 6 || objc_msgSend(v4, "count") == 7)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    if (objc_msgSend(v4, "count") == 6 || objc_msgSend(v4, "count") == 7)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

    }
    else
    {
      v14 = 0;
    }
    if (objc_msgSend(v4, "count") == 7)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:](IMMessagePartSyndicationAssetDescriptor, "descriptorFromSerializedString:", v17);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (v6 < 9)
    {
      if (v8 < 0 || v10 < 0)
      {
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
          v19 = objc_claimAutoreleasedReturnValue();
          v25 = 134218498;
          v26 = v8;
          v27 = 2048;
          v28 = v10;
          v29 = 2112;
          v30 = v19;
          _os_log_error_impl(&dword_19E239000, v18, OS_LOG_TYPE_ERROR, "Message part range is out of range. Location: %ld, Length: %ld, in tokens: %@", (uint8_t *)&v25, 0x20u);
          goto LABEL_33;
        }
      }
      else
      {
        if (!v10)
        {
          IMLogHandleForCategory("IMMessagePartSyndicationRange");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_19E36EE40(v4, v18);
          goto LABEL_34;
        }
        if (!v12)
        {
          IMLogHandleForCategory("IMMessagePartSyndicationRange");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_19E36EEC8(v4);
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v12);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          IMLogHandleForCategory("IMMessagePartSyndicationRange");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_19E36EF70(v4);
          goto LABEL_33;
        }
        if (v14 < 3)
        {
          v16 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:]([IMMessagePartSyndicationRange alloc], "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v6, v8, v10, v18, v14, v15);
          goto LABEL_35;
        }
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a1, "_stringFromSyndicationStatus:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412546;
          v26 = (uint64_t)v23;
          v27 = 2112;
          v28 = (uint64_t)v24;
          _os_log_error_impl(&dword_19E239000, v21, OS_LOG_TYPE_ERROR, "Syndication status is out of range: %@ in tokens: %@", (uint8_t *)&v25, 0x16u);

        }
      }
    }
    else
    {
      IMLogHandleForCategory("IMMessagePartSyndicationRange");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "_stringFromSyndicationType:", v6);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412546;
        v26 = (uint64_t)v19;
        v27 = 2112;
        v28 = (uint64_t)v20;
        _os_log_error_impl(&dword_19E239000, v18, OS_LOG_TYPE_ERROR, "Syndication type is out of range: %@ in tokens: %@", (uint8_t *)&v25, 0x16u);

LABEL_33:
      }
    }
LABEL_34:
    v16 = 0;
LABEL_35:

    goto LABEL_36;
  }
  IMLogHandleForCategory("IMMessagePartSyndicationRange");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_19E36F08C(v4);
  v16 = 0;
LABEL_36:

  return v16;
}

+ (id)deserializeSyndicationRangeFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a3;
  objc_msgSend(v4, "substringToIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "count"))
  {
    IMLogHandleForCategory("IMMessagePartSyndicationRange");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_19E36F118();
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if ((unint64_t)(v12 - 1) >= 2)
    {
      if (v12 != 3)
      {
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_19E36F26C((uint64_t)v4, v12);

LABEL_19:
        IMLogHandleForCategory("IMMessagePartSyndicationRange");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_19E36F1D8((uint64_t)v4, v7);
        goto LABEL_8;
      }
      objc_msgSend(a1, "messageRangeFromTokens_v3:", v7);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "messageRangeFromTokens_v1:", v7);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v13;
    if (v13)
      goto LABEL_9;
    goto LABEL_19;
  }
  IMLogHandleForCategory("IMMessagePartSyndicationRange");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_19E36F178();
LABEL_8:

  v9 = 0;
LABEL_9:

  return v9;
}

+ (unint64_t)serializationVersion
{
  return qword_1EE501520;
}

+ (void)setSerializationVersion:(unint64_t)a3
{
  qword_1EE501520 = a3;
}

- (BOOL)_canBeReplacedByRange:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (-[IMMessagePartSyndicationRange isEqual:](self, "isEqual:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[IMMessagePartSyndicationRange syndicationStartDate](self, "syndicationStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syndicationStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

    v5 = v8 != 1;
  }

  return v5;
}

+ (id)unarchiveClasses
{
  if (qword_1EE504610 != -1)
    dispatch_once(&qword_1EE504610, &unk_1E3FB3E08);
  return (id)qword_1EE504608;
}

+ (id)updateMessagesRanges:(id)a3 withMessagePartSyndicationRanges:(id)a4 didUpdate:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  BOOL *v18;
  id obj;
  _QWORD v20[10];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (!v7)
      v7 = (id)MEMORY[0x1E0C9AA60];
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_19E24772C;
    v33 = sub_19E247584;
    v34 = 0;
    v18 = a5;
    v34 = (id)objc_msgSend(v7, "mutableCopy");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "messagePartRange");
          v21 = 0;
          v22 = &v21;
          v23 = 0x2020000000;
          v24 = 1;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = sub_19E31B410;
          v20[3] = &unk_1E3FBA5F0;
          v20[8] = v14;
          v20[9] = v15;
          v20[4] = v13;
          v20[5] = &v29;
          v20[6] = &v35;
          v20[7] = &v21;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", v20);
          if (*((_BYTE *)v22 + 24))
          {
            objc_msgSend((id)v30[5], "addObject:", v13);
            *((_BYTE *)v36 + 24) = 1;
          }
          _Block_object_dispose(&v21, 8);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v10);
    }

    if (v18)
      *v18 = *((_BYTE *)v36 + 24);
    v16 = (id)v30[5];
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v7 = v7;
    v16 = v7;
  }

  return v16;
}

+ (id)messagePartSyndicationRangeForRange:(_NSRange)a3 inRangesArray:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  length = a3.length;
  location = a3.location;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "messagePartRange", (_QWORD)v18) == location && v14 == length)
          {
            v16 = v13;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_15:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)findChangesFromRangeArray:(id)a3 comparedToRangeArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *i;
  void *v11;
  id v12;
  IMMessagePartSyndicationRange *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IMMessagePartSyndicationRange *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  IMMessagePartSyndicationRange *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    if (!v6)
      v6 = (id)MEMORY[0x1E0C9AA60];
    if (v6 == v5)
    {
      v7 = 0;
      v6 = v5;
    }
    else if ((objc_msgSend(v5, "isEqualToArray:", v6) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v45 = v5;
      obj = v5;
      v47 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      if (v47)
      {
        v46 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(_QWORD *)v64 != v46)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v12 = v6;
            v13 = (IMMessagePartSyndicationRange *)v6;
            v14 = -[IMMessagePartSyndicationRange countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v60;
LABEL_23:
              v17 = 0;
              while (1)
              {
                if (*(_QWORD *)v60 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(IMMessagePartSyndicationRange **)(*((_QWORD *)&v59 + 1) + 8 * v17);
                v19 = -[IMMessagePartSyndicationRange messagePartRange](v18, "messagePartRange");
                v21 = v20;
                if (v19 == objc_msgSend(v11, "messagePartRange") && v21 == v22)
                  break;
                if (v15 == ++v17)
                {
                  v15 = -[IMMessagePartSyndicationRange countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
                  if (v15)
                    goto LABEL_23;
                  goto LABEL_32;
                }
              }
              if (-[IMMessagePartSyndicationRange isEqual:](v18, "isEqual:", v11))
                goto LABEL_35;
            }
            else
            {
LABEL_32:

              v24 = [IMMessagePartSyndicationRange alloc];
              v25 = objc_msgSend(v11, "messagePartRange");
              v27 = v26;
              objc_msgSend(v11, "syndicationStartDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:](v24, "initWithSyndicationType:messagePartRange:syndicationStartDate:", 0, v25, v27, v28);

              v13 = v18;
            }
            objc_msgSend(v49, "addObject:", v18);
LABEL_35:

            v6 = v12;
          }
          v47 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        }
        while (v47);
      }

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v6 = v6;
      v29 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v56;
        v48 = v6;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v56 != v31)
              objc_enumerationMutation(v48);
            v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v34 = obj;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v52;
              while (2)
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v52 != v37)
                    objc_enumerationMutation(v34);
                  v39 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "messagePartRange");
                  v41 = v40;
                  if (v39 == objc_msgSend(v33, "messagePartRange") && v41 == v42)
                  {

                    goto LABEL_55;
                  }
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                if (v36)
                  continue;
                break;
              }
            }

            objc_msgSend(v49, "addObject:", v33);
LABEL_55:
            ;
          }
          v6 = v48;
          v30 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        }
        while (v30);
      }

      if (objc_msgSend(v49, "count"))
        v44 = v49;
      else
        v44 = 0;
      v7 = v44;

      v5 = v45;
    }
  }
  else
  {
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
        v8 = v6;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v7 = v8;
  }

  return v7;
}

- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMMessagePartSyndicationRange assetDescriptor](self, "assetDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syndicationForPartIndex:asset:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMLogHandleForCategory("IMMessagePartSyndicationRange");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_19E36F404(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }
  return v9;
}

+ (id)syndicationRangeForAssetDescriptor:(id)a3 range:(id)a4
{
  id v5;
  id v6;
  IMMessagePartSyndicationRange *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  IMMessagePartSyndicationRange *v14;

  v5 = a4;
  v6 = a3;
  v7 = [IMMessagePartSyndicationRange alloc];
  v8 = objc_msgSend(v5, "syndicationType");
  v9 = objc_msgSend(v5, "messagePartRange");
  v11 = v10;
  objc_msgSend(v5, "syndicationStartDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "syndicationStatus");

  v14 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](v7, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v8, v9, v11, v12, v13, v6);
  return v14;
}

+ (id)updateAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  IMMessagePartSyndicationAssetDescriptor *v12;
  void *v13;
  void *v14;
  IMMessagePartSyndicationAssetDescriptor *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "assetDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v10)
  {
    objc_msgSend(v10, "updateSyndicationAssetWithInfo:asset:", v8, a4);
    +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:range:](IMMessagePartSyndicationRange, "syndicationRangeForAssetDescriptor:range:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = [IMMessagePartSyndicationAssetDescriptor alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMMessagePartSyndicationAssetDescriptor initWithAssetSyndications:](v12, "initWithAssetSyndications:", v14);

    +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:range:](IMMessagePartSyndicationRange, "syndicationRangeForAssetDescriptor:range:", v15, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)replaceAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  IMMessagePartSyndicationAssetDescriptor *v12;
  void *v13;
  void *v14;
  IMMessagePartSyndicationAssetDescriptor *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "assetDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v10)
  {
    objc_msgSend(v10, "replaceSyndicationAssetsInfoWith:asset:", v8, a4);
    +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:range:](IMMessagePartSyndicationRange, "syndicationRangeForAssetDescriptor:range:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = [IMMessagePartSyndicationAssetDescriptor alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[IMMessagePartSyndicationAssetDescriptor initWithAssetSyndications:](v12, "initWithAssetSyndications:", v14);

    +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:range:](IMMessagePartSyndicationRange, "syndicationRangeForAssetDescriptor:range:", v15, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)removeAssetInfoForAsset:(int64_t)a3 range:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "assetDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    objc_msgSend(v7, "removeSyndicationAssetsInfoFor:", a3);
    +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:range:](IMMessagePartSyndicationRange, "syndicationRangeForAssetDescriptor:range:", v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (id)minStartDateForRanges:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "syndicationStartDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "compare:", v6);

          if (v11 != -1)
            continue;
        }
        objc_msgSend(v9, "syndicationStartDate");
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)maxStartDateForRanges:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "syndicationStartDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "compare:", v6);

          if (v11 != 1)
            continue;
        }
        objc_msgSend(v9, "syndicationStartDate");
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)syndicationType
{
  return self->_syndicationType;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (void)setSyndicationStatus:(int64_t)a3
{
  self->_syndicationStatus = a3;
}

- (_NSRange)messagePartRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_messagePartRange.length;
  location = self->_messagePartRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSDate)syndicationStartDate
{
  return self->_syndicationStartDate;
}

- (IMMessagePartSyndicationAssetDescriptor)assetDescriptor
{
  return self->_assetDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDescriptor, 0);
  objc_storeStrong((id *)&self->_syndicationStartDate, 0);
  objc_storeStrong((id *)&self->_serializedString, 0);
}

@end
