@implementation QLThumbnailAdditionEntry

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[QLThumbnailAdditionEntry lastHitDate](self, "lastHitDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[QLThumbnailAdditionEntry documentID](self, "documentID"), CFSTR("docId"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[QLThumbnailAdditionEntry size](self, "size"), CFSTR("size"));
  -[QLThumbnailAdditionEntry lastSeenURL](self, "lastSeenURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

  -[QLThumbnailAdditionEntry vol_uuid](self, "vol_uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("vol_uuid"));

}

- (QLThumbnailAdditionEntry)initWithCoder:(id)a3
{
  id v4;
  QLThumbnailAdditionEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLThumbnailAdditionEntry;
  v5 = -[QLThumbnailAdditionEntry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setLastHitDate:](v5, "setLastHitDate:", v6);

    -[QLThumbnailAdditionEntry setDocumentID:](v5, "setDocumentID:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("docId")));
    -[QLThumbnailAdditionEntry setSize:](v5, "setSize:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setLastSeenURL:](v5, "setLastSeenURL:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vol_uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setVol_uuid:](v5, "setVol_uuid:", v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)unparsedVolumeUUID
{
  void *v2;
  char v4[29];
  _BYTE v5[11];
  unsigned __int8 uu[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v5 = 0;
  -[QLThumbnailAdditionEntry vol_uuid](self, "vol_uuid", 0, 0, 0, 0, *(_QWORD *)&v5[3], 0, 0, v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBytes:length:", uu, 16);

  uuid_unparse_upper(uu, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(unint64_t)a3
{
  self->_documentID = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSDate)lastHitDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastHitDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)lastSeenURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastSeenURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)vol_uuid
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVol_uuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vol_uuid, 0);
  objc_storeStrong((id *)&self->_lastSeenURL, 0);
  objc_storeStrong((id *)&self->_lastHitDate, 0);
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6;
  QLThumbnailAdditionEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  QLThumbnailAdditionEntry *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)QLThumbnailAdditionEntry;
  v7 = -[QLThumbnailAdditionEntry init](&v15, sel_init);
  if (!v7)
  {
LABEL_6:
    v13 = v7;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "columns") == 5 || objc_msgSend(v6, "columns") == 4)
  {
    -[QLThumbnailAdditionEntry setDocumentID:](v7, "setDocumentID:", objc_msgSend(v6, "unsignedLongLongAtIndex:", 0));
    objc_msgSend(v6, "dataAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setVol_uuid:](v7, "setVol_uuid:", v8);

    objc_msgSend(v6, "dateAtIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setLastHitDate:](v7, "setLastHitDate:", v9);

    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "stringAtIndex:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailAdditionEntry setLastSeenURL:](v7, "setLastSeenURL:", v12);

    if (objc_msgSend(v6, "columns") == 5)
      -[QLThumbnailAdditionEntry setSize:](v7, "setSize:", objc_msgSend(v6, "unsignedLongLongAtIndex:", 4));
    goto LABEL_6;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 20, CFSTR("This result set should have four or five columns"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_7:

  return v13;
}

@end
