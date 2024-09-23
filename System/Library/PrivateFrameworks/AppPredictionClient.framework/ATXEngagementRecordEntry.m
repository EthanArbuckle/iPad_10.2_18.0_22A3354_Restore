@implementation ATXEngagementRecordEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXEngagementRecordEntry)initWithExecutable:(id)a3 dateEngaged:(id)a4 engagementRecordType:(unint64_t)a5
{
  id v9;
  id v10;
  ATXEngagementRecordEntry *v11;
  ATXEngagementRecordEntry *v12;
  ATXEngagementRecordEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXEngagementRecordEntry;
  v11 = -[ATXEngagementRecordEntry init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_executable, a3);
    objc_storeStrong((id *)&v12->_dateEngaged, a4);
    v12->_engagementRecordType = a5;
    v13 = v12;
  }

  return v12;
}

- (ATXEngagementRecordEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ATXEngagementRecordEntry *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("executable"), v4, 1, CFSTR("kATXEngagementRecord"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_home_screen();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("dateEngaged"), v4, 1, CFSTR("kATXEngagementRecord"), 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      self = -[ATXEngagementRecordEntry initWithExecutable:dateEngaged:engagementRecordType:](self, "initWithExecutable:dateEngaged:engagementRecordType:", v8, v12, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("engagementRecordType")));
      v13 = self;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  ATXExecutableIdentifier *executable;
  id v5;

  executable = self->_executable;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", executable, CFSTR("executable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateEngaged, CFSTR("dateEngaged"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_engagementRecordType, CFSTR("engagementRecordType"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Executable: %@ Date Engaged: %@ Type: %ld"), self->_executable, self->_dateEngaged, self->_engagementRecordType);
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("executable");
  -[ATXExecutableIdentifier debugTitle](self->_executable, "debugTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("dateEngaged");
  -[NSDate description](self->_dateEngaged, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("engagementRecordType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_engagementRecordType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return -[ATXExecutableIdentifier hash](self->_executable, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXEngagementRecordEntry *v4;
  id *v5;
  ATXExecutableIdentifier *executable;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  ATXExecutableIdentifier *v9;
  BOOL v10;
  BOOL v11;
  unint64_t engagementRecordType;

  v4 = (ATXEngagementRecordEntry *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      executable = self->_executable;
      v7 = (ATXExecutableIdentifier *)v5[1];
      if (executable == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = executable;
        v10 = -[ATXExecutableIdentifier isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      engagementRecordType = self->_engagementRecordType;
      v11 = engagementRecordType == objc_msgSend(v5, "engagementRecordType");
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (ATXExecutableIdentifier)executable
{
  return self->_executable;
}

- (NSDate)dateEngaged
{
  return self->_dateEngaged;
}

- (unint64_t)engagementRecordType
{
  return self->_engagementRecordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateEngaged, 0);
  objc_storeStrong((id *)&self->_executable, 0);
}

@end
