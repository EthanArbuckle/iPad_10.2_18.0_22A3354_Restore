@implementation SGURL

- (SGURL)initWithURL:(id)a3 title:(id)a4 receivedFromHandle:(id)a5 bundleIdentifier:(id)a6 groupIdentifier:(id)a7 documentIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 flags:(unsigned __int8)a13
{
  id v21;
  SGURL *v22;
  SGURL *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v21 = a12;
  v33.receiver = self;
  v33.super_class = (Class)SGURL;
  v22 = -[SGURL init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_url, a3);
    objc_storeStrong((id *)&v23->_title, a4);
    objc_storeStrong((id *)&v23->_receivedFromHandle, a5);
    objc_storeStrong((id *)&v23->_bundleIdentifier, a6);
    objc_storeStrong((id *)&v23->_groupIdentifier, a7);
    objc_storeStrong((id *)&v23->_documentIdentifier, a8);
    objc_storeStrong((id *)&v23->_documentTitle, a9);
    objc_storeStrong((id *)&v23->_documentDate, a10);
    v23->_documentTimeInterval = a11;
    objc_storeStrong((id *)&v23->_receivedAt, a12);
    v23->_flags = a13;
  }

  return v23;
}

- (id)description
{
  id v3;
  NSString *groupIdentifier;
  NSString *documentIdentifier;
  NSDate *receivedAt;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = *(_OWORD *)&self->_url;
  v9 = *(_OWORD *)&self->_receivedFromHandle;
  groupIdentifier = self->_groupIdentifier;
  documentIdentifier = self->_documentIdentifier;
  receivedAt = self->_receivedAt;
  -[NSDate timeIntervalSince1970](receivedAt, "timeIntervalSince1970");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGURL u:%@ t:'%@' r:%@ b:%@ g:%@ d:%@ t:%@ (%f) f:%d>"), v10, v9, groupIdentifier, documentIdentifier, receivedAt, v7, self->_flags);
}

- (id)feedbackDescription
{
  void *v3;
  void *v4;
  unsigned __int8 flags;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  flags = self->_flags;
  if ((flags & 2) == 0)
  {
    if ((self->_flags & 8) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "addObject:", CFSTR("offered"));
    if ((self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("engaged"));
  flags = self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", CFSTR("rejected"));
LABEL_5:
  objc_msgSend(v4, "_pas_componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nonFeedbackFlagDescription
{
  void *v3;
  void *v4;
  unsigned __int8 flags;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  flags = self->_flags;
  if ((flags & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("outgoing"));
    flags = self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("communication"));
  flags = self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(v4, "addObject:", CFSTR("ending date"));
    if ((self->_flags & 0x80) == 0)
      goto LABEL_6;
LABEL_11:
    objc_msgSend(v4, "addObject:", CFSTR("starting date"));
    goto LABEL_6;
  }
LABEL_9:
  objc_msgSend(v4, "addObject:", CFSTR("time range"));
  flags = self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_10;
LABEL_5:
  if ((flags & 0x80) != 0)
    goto LABEL_11;
LABEL_6:
  objc_msgSend(v4, "_pas_componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SGURL)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  SGURL *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SGURL *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  SEL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = a3;
  v6 = (void *)MEMORY[0x1A8583A40]();
  v7 = (void *)MEMORY[0x1A8583A40]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  v9 = (void *)MEMORY[0x1A8583A40]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  v11 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("flg"));
  if (v11 <= 0xFF)
  {
    v38 = v11;
    v41 = v10;
    v40 = v6;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("url"));
    v14 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGURL.m"), 133, CFSTR("nonnull %s %@ was null when decoded"), "NSURL", CFSTR("url"));

    }
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("ttl"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("rch"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("bid"));
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGURL.m"), 136, CFSTR("nonnull %s %@ was null when decoded"), "NSString", CFSTR("bid"));

    }
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("gid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v18, CFSTR("did"));
    v19 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGURL.m"), 138, CFSTR("nonnull %s %@ was null when decoded"), "NSString", CFSTR("did"));

    }
    v33 = a2;
    v20 = self;
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("dtl"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v41, CFSTR("ddt"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("dti"));
    v24 = v23;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v25, CFSTR("rca"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v33, v20, CFSTR("SGURL.m"), 142, CFSTR("nonnull %s %@ was null when decoded"), "NSDate", CFSTR("rca"));

    }
    LOBYTE(v32) = v38;
    self = -[SGURL initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:](v20, "initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:", v39, v37, v36, v17, v35, v34, v24, v21, v22, v26, v32);

    v12 = self;
    v6 = v40;
    v10 = v41;
  }
  else
  {
    v12 = 0;
  }

  objc_autoreleasePoolPop(v6);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("ttl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedFromHandle, CFSTR("rch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("gid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentIdentifier, CFSTR("did"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentTitle, CFSTR("dtl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentDate, CFSTR("ddt"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dti"), self->_documentTimeInterval);
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedAt, CFSTR("rca"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("flg"));

}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_url, "hash");
  return -[NSString hash](self->_title, "hash") - v3 + 32 * v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double documentTimeInterval;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;

  v18 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v6 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)-[NSString copyWithZone:](self->_receivedFromHandle, "copyWithZone:", a3);
  v8 = (void *)-[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)-[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v10 = (void *)-[NSString copyWithZone:](self->_documentIdentifier, "copyWithZone:", a3);
  v11 = (void *)-[NSString copyWithZone:](self->_documentTitle, "copyWithZone:", a3);
  v12 = (void *)-[NSDate copyWithZone:](self->_documentDate, "copyWithZone:", a3);
  documentTimeInterval = self->_documentTimeInterval;
  v14 = (void *)-[NSDate copyWithZone:](self->_receivedAt, "copyWithZone:", a3);
  LOBYTE(v17) = self->_flags;
  v15 = (void *)objc_msgSend(v18, "initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:", v5, v6, v7, v8, v9, v10, documentTimeInterval, v11, v12, v14, v17);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  SGURL *v4;
  SGURL *v5;
  BOOL v6;

  v4 = (SGURL *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGURL isEqualToURL:](self, "isEqualToURL:", v5);

  return v6;
}

- (BOOL)isEqualToURL:(id)a3
{
  id *v4;
  id *v5;
  NSURL *url;
  NSURL *v7;
  NSURL *v8;
  NSURL *v9;
  char v10;
  NSString *title;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *receivedFromHandle;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *bundleIdentifier;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *groupIdentifier;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSString *documentIdentifier;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *documentTitle;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  NSDate *documentDate;
  NSDate *v42;
  NSDate *v43;
  NSDate *v44;
  char v45;
  BOOL v46;
  void *v48;
  void *v49;
  NSDate *receivedAt;
  NSDate *v51;
  NSDate *v52;
  NSDate *v53;
  char v54;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_32;
  url = self->_url;
  v7 = (NSURL *)v4[2];
  if (url == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = url;
    v10 = -[NSURL isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_32;
  }
  title = self->_title;
  v12 = (NSString *)v5[3];
  if (title == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = title;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_32;
  }
  receivedFromHandle = self->_receivedFromHandle;
  v17 = (NSString *)v5[4];
  if (receivedFromHandle == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = receivedFromHandle;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_32;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v22 = (NSString *)v5[5];
  if (bundleIdentifier == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = bundleIdentifier;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_32;
  }
  groupIdentifier = self->_groupIdentifier;
  v27 = (NSString *)v5[6];
  if (groupIdentifier == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = groupIdentifier;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_32;
  }
  documentIdentifier = self->_documentIdentifier;
  v32 = (NSString *)v5[7];
  if (documentIdentifier == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = documentIdentifier;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_32;
  }
  documentTitle = self->_documentTitle;
  v37 = (NSString *)v5[8];
  if (documentTitle == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = documentTitle;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_32;
  }
  documentDate = self->_documentDate;
  v42 = (NSDate *)v5[9];
  if (documentDate == v42)
  {

LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_documentTimeInterval);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v5 + 10));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "isEqualToNumber:", v49))
    {
      receivedAt = self->_receivedAt;
      v51 = (NSDate *)v5[11];
      if (receivedAt == v51)
      {

      }
      else
      {
        v52 = v51;
        v53 = receivedAt;
        v54 = -[NSDate isEqual:](v53, "isEqual:", v52);

        if ((v54 & 1) == 0)
          goto LABEL_38;
      }
      v46 = self->_flags == *((unsigned __int8 *)v5 + 8);
      goto LABEL_41;
    }
LABEL_38:
    v46 = 0;
LABEL_41:

    goto LABEL_33;
  }
  v43 = v42;
  v44 = documentDate;
  v45 = -[NSDate isEqual:](v44, "isEqual:", v43);

  if ((v45 & 1) != 0)
    goto LABEL_35;
LABEL_32:
  v46 = 0;
LABEL_33:

  return v46;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)receivedFromHandle
{
  return self->_receivedFromHandle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)documentIdentifier
{
  return self->_documentIdentifier;
}

- (NSString)documentTitle
{
  return self->_documentTitle;
}

- (NSDate)documentDate
{
  return self->_documentDate;
}

- (double)documentTimeInterval
{
  return self->_documentTimeInterval;
}

- (NSDate)receivedAt
{
  return self->_receivedAt;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedAt, 0);
  objc_storeStrong((id *)&self->_documentDate, 0);
  objc_storeStrong((id *)&self->_documentTitle, 0);
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_receivedFromHandle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
