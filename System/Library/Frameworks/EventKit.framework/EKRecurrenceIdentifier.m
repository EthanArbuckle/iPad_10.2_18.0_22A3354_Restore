@implementation EKRecurrenceIdentifier

+ (id)recurrenceIdentifierWithLocalUID:(id)a3 recurrenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setLocalUID:", v5);
    objc_msgSend(v7, "setRecurrenceDate:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)recurrenceIdentifierWithString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setIdentifierString:", v4);
  v13 = 0;
  v14 = 0;
  v6 = objc_msgSend(a1, "_splitIdentifier:intoLocalUID:recurrenceDate:", v4, &v14, &v13);

  v7 = v14;
  v8 = v13;
  if (v6)
  {
    objc_msgSend(v5, "setLocalUID:", v7);
    objc_msgSend(v5, "setRecurrenceDate:", v8);
  }
  objc_msgSend(v5, "localUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

+ (id)localUIDForIdentifierString:(id)a3
{
  int v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = objc_msgSend(a1, "_splitIdentifier:intoLocalUID:recurrenceDate:", a3, &v8, 0);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (v3)
    v6 = v4;

  return v6;
}

- (NSString)identifierString
{
  NSString *identifierString;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  identifierString = self->_identifierString;
  if (!identifierString)
  {
    v4 = (void *)objc_opt_class();
    -[EKRecurrenceIdentifier recurrenceDate](self, "recurrenceDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceIdentifier localUID](self, "localUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_recurrenceIdentifierWithRecurrenceDate:localUID:stripTime:stripTimeZone:", v5, v6, 0, 0);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_identifierString;
    self->_identifierString = v7;

    identifierString = self->_identifierString;
  }
  return identifierString;
}

+ (const)_dateFormatStripTime:(BOOL)a3 stripTimeZone:(BOOL)a4
{
  const char *v4;

  if (!a4 || a3)
    v4 = "%Y%m%d";
  else
    v4 = "%Y%m%dT%H%M%S";
  if (a3 || a4)
    return v4;
  else
    return "%Y%m%dT%H%M%SZ";
}

+ (BOOL)_splitIdentifier:(id)a3 intoLocalUID:(id *)a4 recurrenceDate:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  char *v11;
  char *v12;
  int64_t v13;
  id v14;
  BOOL v15;
  BOOL v16;
  id v18;
  tm v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!((unint64_t)a4 | (unint64_t)a5))
    goto LABEL_15;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (!objc_msgSend(v8, "length"))
  {
    v16 = 0;
    goto LABEL_16;
  }
  v10 = objc_retainAutorelease(v9);
  v11 = (char *)objc_msgSend(v10, "UTF8String");
  v12 = strchr(v11, 47);
  if (!v12 || (v13 = v12 - v11, v12 - v11 == -1))
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    goto LABEL_15;
  }
  if (!a4)
  {
    if (a5)
      goto LABEL_18;
LABEL_15:
    v16 = 1;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12 + 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v14;
  if (!a5)
  {
    v15 = v14 == 0;
    goto LABEL_24;
  }
LABEL_18:
  strlcpy((char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), v11, v13 + 1);
  if (strcmp((const char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), "(null)"))
  {
    strptime_l((const char *)&v19 - ((v13 + 16) & 0xFFFFFFFFFFFFFFF0), (const char *)objc_msgSend(a1, "_dateFormatStripTime:stripTimeZone:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v20), &v19, 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)timegm(&v19));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!a4 || (v18 = *a4, v16 = *a4 != 0, v18))
  {
    v15 = *a5 == 0;
LABEL_24:
    v16 = !v15;
  }
LABEL_16:

  return v16;
}

+ (id)_recurrenceIdentifierWithRecurrenceDate:(id)a3 localUID:(id)a4 stripTime:(BOOL)a5 stripTimeZone:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  size_t v17;
  double v18;
  char *v19;
  char v21[16];
  tm v22;
  time_t v23;
  uint64_t v24;

  v6 = a6;
  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v11 && (unint64_t)objc_msgSend(v11, "length") <= 0x32)
  {
    v13 = v12;
    v14 = v13;
    if (v10)
    {
      v15 = objc_retainAutorelease(v13);
      v16 = (const char *)objc_msgSend(v15, "UTF8String");
      v17 = strlen(v16);
      objc_msgSend(v10, "timeIntervalSince1970");
      v23 = (uint64_t)v18;
      memset(&v22, 0, sizeof(v22));
      gmtime_r(&v23, &v22);
      strftime_l(v21, 0x20uLL, (const char *)objc_msgSend(a1, "_dateFormatStripTime:stripTimeZone:", v7, v6), &v22, 0);
      v19 = &v21[-((v17 + 49) & 0xFFFFFFFFFFFFFFF0)];
      strcpy(v19, v21);
      if (objc_msgSend(v15, "length"))
      {
        *(_WORD *)&v19[strlen(v19)] = 47;
        strcat(v19, v16);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    NSLog(CFSTR("UID %@ is of unexpected size."), v12);
    v14 = 0;
  }

  return v14;
}

+ (id)_recurrenceStringForDate:(id)a3 stripTime:(BOOL)a4 stripTimeZone:(BOOL)a5
{
  return (id)objc_msgSend(a1, "_recurrenceIdentifierWithRecurrenceDate:localUID:stripTime:stripTimeZone:", a3, &stru_1E4789A58, a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EKRecurrenceIdentifier localUID](self, "localUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalUID:", v5);

  -[EKRecurrenceIdentifier recurrenceDate](self, "recurrenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecurrenceDate:", v6);

  -[EKRecurrenceIdentifier identifierString](self, "identifierString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifierString:", v7);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[EKRecurrenceIdentifier localUID](self, "localUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[EKRecurrenceIdentifier recurrenceDate](self, "recurrenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + 13 * objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  EKRecurrenceIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (EKRecurrenceIdentifier *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self != v5)
    {
      -[EKRecurrenceIdentifier localUID](self, "localUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKRecurrenceIdentifier localUID](v5, "localUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v7))
      {
        v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[EKRecurrenceIdentifier recurrenceDate](self, "recurrenceDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || (-[EKRecurrenceIdentifier recurrenceDate](v5, "recurrenceDate"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[EKRecurrenceIdentifier recurrenceDate](self, "recurrenceDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecurrenceIdentifier recurrenceDate](v5, "recurrenceDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v8)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v11 = 1;
      }

      goto LABEL_13;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (NSString)localUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)recurrenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecurrenceDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setIdentifierString:(id)a3
{
  objc_storeStrong((id *)&self->_identifierString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierString, 0);
  objc_storeStrong((id *)&self->_recurrenceDate, 0);
  objc_storeStrong((id *)&self->_localUID, 0);
}

@end
