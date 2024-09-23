@implementation CNChangeHistoryAnchor

- (NSData)historyToken
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[CNChangeHistoryAnchor encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sequenceNumber, CFSTR("_sequenceNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeRecordID, CFSTR("_changeRecordID"));

}

- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3 changeRecordID:(int64_t)a4
{
  CNChangeHistoryAnchor *v6;
  CNChangeHistoryAnchor *v7;
  CNChangeHistoryAnchor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryAnchor;
  v6 = -[CNChangeHistoryAnchor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_changeRecordID = a4;
    v6->_sequenceNumber = a3;
    v6->_version = 2;
    v8 = v6;
  }

  return v7;
}

- (CNChangeHistoryAnchor)initWithSequenceNumber:(int64_t)a3
{
  return -[CNChangeHistoryAnchor initWithSequenceNumber:changeRecordID:](self, "initWithSequenceNumber:changeRecordID:", a3, -1);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryAnchor version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("version"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryAnchor sequenceNumber](self, "sequenceNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sequenceNumber"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNChangeHistoryAnchor changeRecordID](self, "changeRecordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("changeRecordID"), v8);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)changeRecordID
{
  return self->_changeRecordID;
}

+ (id)limitedAccessHistoryAnchor
{
  return -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", -1);
}

- (CNChangeHistoryAnchor)initWithHistoryToken:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  CNChangeHistoryAnchor *v10;
  CNChangeHistoryAnchor *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v15 = 0;
  v8 = (void *)objc_msgSend([v6 alloc], "initForReadingFromData:error:", v7, &v15);

  v9 = v15;
  if (v8)
  {
    v10 = -[CNChangeHistoryAnchor initWithCoder:](self, "initWithCoder:", v8);
    objc_msgSend(v8, "finishDecoding");
    self = v10;
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A50], "errorWithCode:underlyingError:", 6, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAnchor)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryAnchor *v5;
  CNChangeHistoryAnchor *v6;
  uint64_t v7;
  CNChangeHistoryAnchor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNChangeHistoryAnchor;
  v5 = -[CNChangeHistoryAnchor init](&v10, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  v5->_version = 1;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_version")))
    v6->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version"));
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("_sequenceNumber")))
    goto LABEL_9;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sequenceNumber"));
  v6->_changeRecordID = -1;
  v6->_sequenceNumber = v7;
  if (v6->_version >= 2)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_changeRecordID")))
    {
      v6->_changeRecordID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changeRecordID"));
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v8 = v6;
LABEL_10:

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = a3;
  v5 = -[CNChangeHistoryAnchor sequenceNumber](self, "sequenceNumber");
  if (v5 < objc_msgSend(v4, "sequenceNumber"))
  {
LABEL_5:
    v7 = -1;
    goto LABEL_6;
  }
  v6 = -[CNChangeHistoryAnchor sequenceNumber](self, "sequenceNumber");
  if (v6 <= objc_msgSend(v4, "sequenceNumber"))
  {
    v8 = -[CNChangeHistoryAnchor changeRecordID](self, "changeRecordID");
    if (v8 >= objc_msgSend(v4, "changeRecordID"))
    {
      v10 = -[CNChangeHistoryAnchor changeRecordID](self, "changeRecordID");
      v7 = v10 > objc_msgSend(v4, "changeRecordID");
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

@end
