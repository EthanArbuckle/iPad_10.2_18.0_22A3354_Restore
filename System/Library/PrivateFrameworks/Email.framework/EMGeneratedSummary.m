@implementation EMGeneratedSummary

+ (int64_t)consideredUrgentHourLimit
{
  if (consideredUrgentHourLimit_onceToken != -1)
    dispatch_once(&consideredUrgentHourLimit_onceToken, &__block_literal_global_15);
  return consideredUrgentHourLimit_urgentHourLimit;
}

void __47__EMGeneratedSummary_consideredUrgentHourLimit__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("MessageConsideredUrgentHourLimit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "integerValue");
  else
    v2 = 24;
  consideredUrgentHourLimit_urgentHourLimit = v2;

}

- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5
{
  return -[EMGeneratedSummary initWithTopLine:synopsis:urgent:messageItemID:](self, "initWithTopLine:synopsis:urgent:messageItemID:", a3, a4, a5, 0);
}

- (EMGeneratedSummary)initWithTopLine:(id)a3 synopsis:(id)a4 urgent:(BOOL)a5 messageItemID:(id)a6
{
  id v11;
  id v12;
  id v13;
  EMGeneratedSummary *v14;
  EMGeneratedSummary *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EMGeneratedSummary;
  v14 = -[EMGeneratedSummary init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_topLine, a3);
    objc_storeStrong((id *)&v15->_synopsis, a4);
    v15->_urgent = a5;
    objc_storeStrong((id *)&v15->_messageItemID, a6);
  }

  return v15;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMGeneratedSummary topLine](self, "topLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMGeneratedSummary synopsis](self, "synopsis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMGeneratedSummary urgent](self, "urgent");
  -[EMGeneratedSummary messageItemID](self, "messageItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n\ttopLine:%@\n\tsynopsis:%@\n\turgent: %d\n\tmessageItemID: %@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  EMGeneratedSummary *v4;
  EMGeneratedSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  char v11;
  void *v12;
  void *v13;

  v4 = (EMGeneratedSummary *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[EMGeneratedSummary topLine](self, "topLine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMGeneratedSummary topLine](v5, "topLine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[EMGeneratedSummary synopsis](self, "synopsis");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMGeneratedSummary synopsis](v5, "synopsis");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual()
          && (v10 = -[EMGeneratedSummary urgent](self, "urgent"), v10 == -[EMGeneratedSummary urgent](v5, "urgent")))
        {
          -[EMGeneratedSummary messageItemID](self, "messageItemID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMGeneratedSummary messageItemID](v5, "messageItemID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = EFObjectsAreEqual();

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isUrgentForDate:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_dateHoursAgo:", +[EMGeneratedSummary consideredUrgentHourLimit](EMGeneratedSummary, "consideredUrgentHourLimit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EMGeneratedSummary urgent](self, "urgent"))
    v6 = objc_msgSend(v4, "ef_isLaterThanDate:", v5);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[EMGeneratedSummary topLine](self, "topLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") + 33;

  -[EMGeneratedSummary synopsis](self, "synopsis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EMGeneratedSummary synopsis](self, "synopsis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "hash") + 33 * v4;

  }
  v7 = 33 * v4 + -[EMGeneratedSummary urgent](self, "urgent");
  -[EMGeneratedSummary messageItemID](self, "messageItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EMGeneratedSummary messageItemID](self, "messageItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "hash") + 33 * v7;

  }
  return v7;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D1EF48];
  -[EMGeneratedSummary topLine](self, "topLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ec_partiallyRedactedStringForSubjectOrSummary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = -[EMGeneratedSummary urgent](self, "urgent");
  -[EMGeneratedSummary messageItemID](self, "messageItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("t:%@, u:%d, m:%@"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGeneratedSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EMGeneratedSummary *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_topLine"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_synopsis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_urgent"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_messageItemID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EMGeneratedSummary initWithTopLine:synopsis:urgent:messageItemID:](self, "initWithTopLine:synopsis:urgent:messageItemID:", v5, v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EMGeneratedSummary topLine](self, "topLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_topLine"));

  -[EMGeneratedSummary synopsis](self, "synopsis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_synopsis"));

  objc_msgSend(v7, "encodeBool:forKey:", -[EMGeneratedSummary urgent](self, "urgent"), CFSTR("EFPropertyKey_urgent"));
  -[EMGeneratedSummary messageItemID](self, "messageItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_messageItemID"));

}

- (NSAttributedString)topLine
{
  return self->_topLine;
}

- (NSAttributedString)synopsis
{
  return self->_synopsis;
}

- (BOOL)urgent
{
  return self->_urgent;
}

- (EMCollectionItemID)messageItemID
{
  return self->_messageItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageItemID, 0);
  objc_storeStrong((id *)&self->_synopsis, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
}

@end
