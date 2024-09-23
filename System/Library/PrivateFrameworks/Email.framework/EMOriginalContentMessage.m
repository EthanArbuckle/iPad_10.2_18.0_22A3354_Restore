@implementation EMOriginalContentMessage

- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 sender:(id)a5 date:(id)a6
{
  return -[EMOriginalContentMessage initWithSearchableMessageID:bodyText:subject:sender:toList:ccList:flags:date:](self, "initWithSearchableMessageID:bodyText:subject:sender:toList:ccList:flags:date:", a3, a4, 0, a5, 0, 0, 0, a6);
}

- (EMOriginalContentMessage)initWithSearchableMessageID:(id)a3 bodyText:(id)a4 subject:(id)a5 sender:(id)a6 toList:(id)a7 ccList:(id)a8 flags:(id)a9 date:(id)a10
{
  id v17;
  EMOriginalContentMessage *v18;
  EMOriginalContentMessage *v19;
  uint64_t v20;
  NSString *subject;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v28 = a3;
  v27 = a4;
  v29 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)EMOriginalContentMessage;
  v18 = -[EMOriginalContentMessage init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchableMessageID, a3);
    objc_storeStrong((id *)&v19->_bodyText, a4);
    v20 = objc_msgSend(v29, "copy");
    subject = v19->_subject;
    v19->_subject = (NSString *)v20;

    objc_storeStrong((id *)&v19->_sender, a6);
    objc_storeStrong((id *)&v19->_date, a10);
    objc_storeStrong((id *)&v19->_toList, a7);
    objc_storeStrong((id *)&v19->_ccList, a8);
    objc_storeStrong((id *)&v19->_flags, a9);
  }

  return v19;
}

- (EMOriginalContentMessage)initWithCoder:(id)a3
{
  id v4;
  EMOriginalContentMessage *v5;
  uint64_t v6;
  EMSearchableMessageID *searchableMessageID;
  uint64_t v8;
  NSString *bodyText;
  uint64_t v10;
  NSString *subject;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  ECEmailAddressConvertible *sender;
  uint64_t v17;
  NSDate *date;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *toList;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *ccList;
  uint64_t v31;
  ECMessageFlags *flags;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EMOriginalContentMessage;
  v5 = -[EMOriginalContentMessage init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_searchableMessageID"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchableMessageID = v5->_searchableMessageID;
    v5->_searchableMessageID = (EMSearchableMessageID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_bodyText"));
    v8 = objc_claimAutoreleasedReturnValue();
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
    v10 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EFPropertyKey_sender"));
    v15 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (ECEmailAddressConvertible *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
    v17 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("EFPropertyKey_toList"));
    v23 = objc_claimAutoreleasedReturnValue();
    toList = v5->_toList;
    v5->_toList = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("EFPropertyKey_ccList"));
    v29 = objc_claimAutoreleasedReturnValue();
    ccList = v5->_ccList;
    v5->_ccList = (NSArray *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flags"));
    v31 = objc_claimAutoreleasedReturnValue();
    flags = v5->_flags;
    v5->_flags = (ECMessageFlags *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[EMOriginalContentMessage searchableMessageID](self, "searchableMessageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_searchableMessageID"));

  -[EMOriginalContentMessage bodyText](self, "bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_bodyText"));

  -[EMOriginalContentMessage subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_subject"));

  -[EMOriginalContentMessage sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_sender"));

  -[EMOriginalContentMessage date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_date"));

  -[EMOriginalContentMessage toList](self, "toList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_toList"));

  -[EMOriginalContentMessage ccList](self, "ccList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_ccList"));

  -[EMOriginalContentMessage flags](self, "flags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_flags"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  objc_class *v6;
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
  void *v17;
  void *v19;
  objc_class *v20;
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
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 2);
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage searchableMessageID](self, "searchableMessageID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D1EF48];
    -[EMOriginalContentMessage bodyText](self, "bodyText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ec_partiallyRedactedStringForSubjectOrSummary:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D1EF48];
    -[EMOriginalContentMessage subject](self, "subject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ec_partiallyRedactedStringForSubjectOrSummary:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage sender](self, "sender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromEmailAddressList:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage toList](self, "toList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromEmailAddressList:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage ccList](self, "ccList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromEmailAddressList:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage flags](self, "flags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMOriginalContentMessage date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>\n\tsearchableMessageID:%@\n\tbodyText:%@\n\tsubject:%@\n\tsender:%@\n\tto:%@\n\tcc:%@\n\tflags:%@\n\tdate:%@"), v29, self, v28, v27, v26, v10, v12, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v22;
  }
}

- (BOOL)isEqual:(id)a3
{
  EMOriginalContentMessage *v4;
  EMOriginalContentMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (EMOriginalContentMessage *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[EMOriginalContentMessage searchableMessageID](self, "searchableMessageID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMOriginalContentMessage searchableMessageID](v5, "searchableMessageID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[EMOriginalContentMessage bodyText](self, "bodyText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMOriginalContentMessage bodyText](v5, "bodyText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFStringsAreEqual())
        {
          -[EMOriginalContentMessage subject](self, "subject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMOriginalContentMessage subject](v5, "subject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFStringsAreEqual())
          {
            -[EMOriginalContentMessage sender](self, "sender");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMOriginalContentMessage sender](v5, "sender");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (EFObjectsAreEqual())
            {
              -[EMOriginalContentMessage date](self, "date");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[EMOriginalContentMessage date](v5, "date");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (EFObjectsAreEqual())
              {
                -[EMOriginalContentMessage toList](self, "toList");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[EMOriginalContentMessage toList](v5, "toList");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (EFObjectsAreEqual())
                {
                  -[EMOriginalContentMessage ccList](self, "ccList");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EMOriginalContentMessage ccList](v5, "ccList");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (EFObjectsAreEqual())
                  {
                    -[EMOriginalContentMessage flags](self, "flags");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    -[EMOriginalContentMessage flags](v5, "flags");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = EFObjectsAreEqual();

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
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[EMOriginalContentMessage searchableMessageID](self, "searchableMessageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EMOriginalContentMessage bodyText](self, "bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[EMOriginalContentMessage subject](self, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[EMOriginalContentMessage sender](self, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[EMOriginalContentMessage date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[EMOriginalContentMessage toList](self, "toList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  -[EMOriginalContentMessage ccList](self, "ccList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  -[EMOriginalContentMessage flags](self, "flags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v14) + v16)
      + objc_msgSend(v17, "hash")
      + 0x147747C7101;

  return v18;
}

- (EMSearchableMessageID)searchableMessageID
{
  return self->_searchableMessageID;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)subject
{
  return self->_subject;
}

- (ECEmailAddressConvertible)sender
{
  return self->_sender;
}

- (NSArray)toList
{
  return self->_toList;
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (NSDate)date
{
  return self->_date;
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_searchableMessageID, 0);
}

@end
