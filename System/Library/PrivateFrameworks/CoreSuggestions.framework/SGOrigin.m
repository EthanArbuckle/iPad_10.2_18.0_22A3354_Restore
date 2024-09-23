@implementation SGOrigin

- (SGOrigin)init
{
  SGOrigin *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGOrigin;
  result = -[SGOrigin init](&v3, sel_init);
  if (result)
    result->_contextSnippetRange = (_NSRange)xmmword_1A22EB540;
  return result;
}

- (SGOrigin)initWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  SGOrigin *v15;
  SGOrigin *v16;
  uint64_t v17;
  NSString *sourceKey;
  uint64_t v19;
  NSString *externalKey;
  NSString *v21;
  NSString *bundleId;
  __CFString *v23;
  __CFString *v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[SGOrigin init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v17 = objc_msgSend(v12, "copy");
    sourceKey = v16->_sourceKey;
    v16->_sourceKey = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    externalKey = v16->_externalKey;
    v16->_externalKey = (NSString *)v19;

    v16->_fromForwardedMessage = a7;
    if (!v14)
    {
      switch(a3)
      {
        case 1uLL:
          v23 = CFSTR("com.apple.mobilemail");
          goto LABEL_10;
        case 4uLL:
          v23 = CFSTR("com.apple.MobileSMS");
          goto LABEL_10;
        case 5uLL:
          v21 = v16->_sourceKey;
          goto LABEL_4;
        case 7uLL:
          v23 = CFSTR("com.apple.mobilesafari");
LABEL_10:
          v24 = v23;
          bundleId = v16->_bundleId;
          v16->_bundleId = &v23->isa;
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
    }
    v21 = (NSString *)objc_msgSend(v14, "copy");
LABEL_4:
    bundleId = v16->_bundleId;
    v16->_bundleId = v21;
LABEL_11:

LABEL_12:
    if (v16->_bundleId)
      -[SGOrigin _resolveAppName](v16, "_resolveAppName");
  }

  return v16;
}

- (void)_resolveAppName
{
  id v3;
  _QWORD v4[5];

  if (_resolveAppName__pasOnceToken2 != -1)
    dispatch_once(&_resolveAppName__pasOnceToken2, &__block_literal_global_4469);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__SGOrigin__resolveAppName__block_invoke_2;
  v4[3] = &unk_1E4761C10;
  v4[4] = self;
  v3 = (id)_resolveAppName__pasExprOnceResult;
  objc_msgSend(v3, "runWithLockAcquired:", v4);

}

- (SGOrigin)initWithCoder:(id)a3
{
  id v4;
  SGOrigin *v5;
  void *v6;
  uint64_t v7;
  NSString *sourceKey;
  void *v9;
  uint64_t v10;
  NSString *externalKey;
  void *v12;
  uint64_t v13;
  NSString *contextSnippet;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  CSPerson *fromPerson;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *toPeople;
  void *v25;
  uint64_t v26;
  NSString *bundleId;
  void *v28;
  uint64_t v29;
  NSString *localizedApplicationName;
  void *v31;
  uint64_t v32;
  NSString *teamId;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *to;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSArray *cc;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSArray *bcc;
  void *v49;
  uint64_t v50;
  NSDate *date;
  void *v52;
  uint64_t v53;
  NSString *title;
  void *v55;
  uint64_t v56;
  NSString *operatingSystemVersion;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SGOrigin;
  v5 = -[SGOrigin init](&v59, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sourceKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    sourceKey = v5->_sourceKey;
    v5->_sourceKey = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("externalKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    externalKey = v5->_externalKey;
    v5->_externalKey = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("contextSnippet"));
    v13 = objc_claimAutoreleasedReturnValue();
    contextSnippet = v5->_contextSnippet;
    v5->_contextSnippet = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextSnippetRange_location"));
    v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contextSnippetRange_length"));
    v5->_contextSnippetRange.location = v15;
    v5->_contextSnippetRange.length = v16;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("fromPerson"));
    v18 = objc_claimAutoreleasedReturnValue();
    fromPerson = v5->_fromPerson;
    v5->_fromPerson = (CSPerson *)v18;

    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("toPeople"));
    v23 = objc_claimAutoreleasedReturnValue();
    toPeople = v5->_toPeople;
    v5->_toPeople = (NSArray *)v23;

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("bundleId"));
    v26 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v26;

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("localizedApplicationName"));
    v29 = objc_claimAutoreleasedReturnValue();
    localizedApplicationName = v5->_localizedApplicationName;
    v5->_localizedApplicationName = (NSString *)v29;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("teamId"));
    v32 = objc_claimAutoreleasedReturnValue();
    teamId = v5->_teamId;
    v5->_teamId = (NSString *)v32;

    v34 = objc_alloc(MEMORY[0x1E0C99E60]);
    v35 = objc_opt_class();
    v36 = (void *)objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("to"));
    v37 = objc_claimAutoreleasedReturnValue();
    to = v5->_to;
    v5->_to = (NSArray *)v37;

    v39 = objc_alloc(MEMORY[0x1E0C99E60]);
    v40 = objc_opt_class();
    v41 = (void *)objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("cc"));
    v42 = objc_claimAutoreleasedReturnValue();
    cc = v5->_cc;
    v5->_cc = (NSArray *)v42;

    v44 = objc_alloc(MEMORY[0x1E0C99E60]);
    v45 = objc_opt_class();
    v46 = (void *)objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("bcc"));
    v47 = objc_claimAutoreleasedReturnValue();
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v47;

    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("date"));
    v50 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v50;

    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("title"));
    v53 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v53;

    v5->_fromForwardedMessage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromForwardedMessage"));
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("operatingSystemVersion"));
    v56 = objc_claimAutoreleasedReturnValue();
    operatingSystemVersion = v5->_operatingSystemVersion;
    v5->_operatingSystemVersion = (NSString *)v56;

    v5->_shouldShowOperatingSystemVersion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowOperatingSystemVersion"));
    v5->_isSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceKey, CFSTR("sourceKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalKey, CFSTR("externalKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextSnippet, CFSTR("contextSnippet"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contextSnippetRange.location, CFSTR("contextSnippetRange_location"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contextSnippetRange.length, CFSTR("contextSnippetRange_length"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromPerson, CFSTR("fromPerson"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toPeople, CFSTR("toPeople"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedApplicationName, CFSTR("localizedApplicationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamId, CFSTR("teamId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_to, CFSTR("to"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cc, CFSTR("cc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bcc, CFSTR("bcc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromForwardedMessage, CFSTR("fromForwardedMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operatingSystemVersion, CFSTR("operatingSystemVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldShowOperatingSystemVersion, CFSTR("shouldShowOperatingSystemVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSent, CFSTR("isSent"));

}

- (NSURL)url
{
  unint64_t type;
  void *v4;
  void *v5;
  id v6;
  NSString *externalKey;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;
  NSString *v13;
  void *v14;

  type = self->_type;
  if (type > 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGOrigin.m"), 190, CFSTR("Unknown origin type: %lu"), self->_type);
    v4 = 0;
LABEL_9:

    return (NSURL *)v4;
  }
  if (((1 << type) & 0xED) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    if (type == 1)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      externalKey = self->_externalKey;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](externalKey, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "initWithFormat:", CFSTR("message:%@"), v9);
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      v13 = self->_externalKey;
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "initWithFormat:", CFSTR("messages:openchat?guid=%@"), v9);
    }
    v14 = (void *)v10;
    objc_msgSend(v5, "URLWithString:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v4 = 0;
  return (NSURL *)v4;
}

- (BOOL)isEqual:(id)a3
{
  SGOrigin *v4;
  SGOrigin *v5;
  BOOL v6;

  v4 = (SGOrigin *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGOrigin isEqualToOrigin:](self, "isEqualToOrigin:", v5);

  return v6;
}

- (BOOL)isEqualToOrigin:(id)a3
{
  id *v4;
  id *v5;
  NSString *sourceKey;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *externalKey;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *contextSnippet;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  BOOL v21;
  CSPerson *fromPerson;
  CSPerson *v23;
  CSPerson *v24;
  CSPerson *v25;
  char v26;
  NSArray *toPeople;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  char v31;
  NSString *bundleId;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  NSString *localizedApplicationName;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  NSString *teamId;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  char v46;
  NSArray *to;
  NSArray *v48;
  NSArray *v49;
  NSArray *v50;
  char v51;
  NSArray *cc;
  NSArray *v53;
  NSArray *v54;
  NSArray *v55;
  char v56;
  NSArray *bcc;
  NSArray *v58;
  NSArray *v59;
  NSArray *v60;
  char v61;
  NSDate *date;
  NSDate *v63;
  NSDate *v64;
  NSDate *v65;
  char v66;
  NSString *title;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  char v71;
  NSString *operatingSystemVersion;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  char v76;

  v4 = (id *)a3;
  v5 = v4;
  if ((id)self->_type != v4[1])
    goto LABEL_59;
  sourceKey = self->_sourceKey;
  v7 = (NSString *)v4[2];
  if (sourceKey == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = sourceKey;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_59;
  }
  externalKey = self->_externalKey;
  v12 = (NSString *)v5[3];
  if (externalKey == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = externalKey;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_59;
  }
  contextSnippet = self->_contextSnippet;
  v17 = (NSString *)v5[4];
  if (contextSnippet == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = contextSnippet;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_59;
  }
  v21 = 0;
  if ((id)self->_contextSnippetRange.location == v5[5] && (id)self->_contextSnippetRange.length == v5[6])
  {
    fromPerson = self->_fromPerson;
    v23 = (CSPerson *)v5[7];
    if (fromPerson == v23)
    {

    }
    else
    {
      v24 = v23;
      v25 = fromPerson;
      v26 = -[CSPerson isEqual:](v25, "isEqual:", v24);

      if ((v26 & 1) == 0)
        goto LABEL_59;
    }
    toPeople = self->_toPeople;
    v28 = (NSArray *)v5[8];
    if (toPeople == v28)
    {

    }
    else
    {
      v29 = v28;
      v30 = toPeople;
      v31 = -[NSArray isEqual:](v30, "isEqual:", v29);

      if ((v31 & 1) == 0)
        goto LABEL_59;
    }
    bundleId = self->_bundleId;
    v33 = (NSString *)v5[9];
    if (bundleId == v33)
    {

    }
    else
    {
      v34 = v33;
      v35 = bundleId;
      v36 = -[NSString isEqual:](v35, "isEqual:", v34);

      if ((v36 & 1) == 0)
        goto LABEL_59;
    }
    localizedApplicationName = self->_localizedApplicationName;
    v38 = (NSString *)v5[17];
    if (localizedApplicationName == v38)
    {

    }
    else
    {
      v39 = v38;
      v40 = localizedApplicationName;
      v41 = -[NSString isEqual:](v40, "isEqual:", v39);

      if ((v41 & 1) == 0)
        goto LABEL_59;
    }
    teamId = self->_teamId;
    v43 = (NSString *)v5[18];
    if (teamId == v43)
    {

    }
    else
    {
      v44 = v43;
      v45 = teamId;
      v46 = -[NSString isEqual:](v45, "isEqual:", v44);

      if ((v46 & 1) == 0)
        goto LABEL_59;
    }
    to = self->_to;
    v48 = (NSArray *)v5[10];
    if (to == v48)
    {

    }
    else
    {
      v49 = v48;
      v50 = to;
      v51 = -[NSArray isEqual:](v50, "isEqual:", v49);

      if ((v51 & 1) == 0)
        goto LABEL_59;
    }
    cc = self->_cc;
    v53 = (NSArray *)v5[11];
    if (cc == v53)
    {

    }
    else
    {
      v54 = v53;
      v55 = cc;
      v56 = -[NSArray isEqual:](v55, "isEqual:", v54);

      if ((v56 & 1) == 0)
        goto LABEL_59;
    }
    bcc = self->_bcc;
    v58 = (NSArray *)v5[12];
    if (bcc == v58)
    {

    }
    else
    {
      v59 = v58;
      v60 = bcc;
      v61 = -[NSArray isEqual:](v60, "isEqual:", v59);

      if ((v61 & 1) == 0)
        goto LABEL_59;
    }
    date = self->_date;
    v63 = (NSDate *)v5[13];
    if (date == v63)
    {

    }
    else
    {
      v64 = v63;
      v65 = date;
      v66 = -[NSDate isEqual:](v65, "isEqual:", v64);

      if ((v66 & 1) == 0)
        goto LABEL_59;
    }
    title = self->_title;
    v68 = (NSString *)v5[14];
    if (title == v68)
    {

    }
    else
    {
      v69 = v68;
      v70 = title;
      v71 = -[NSString isEqual:](v70, "isEqual:", v69);

      if ((v71 & 1) == 0)
        goto LABEL_59;
    }
    if (self->_fromForwardedMessage == *((unsigned __int8 *)v5 + 130))
    {
      operatingSystemVersion = self->_operatingSystemVersion;
      v73 = (NSString *)v5[15];
      if (operatingSystemVersion == v73)
      {

      }
      else
      {
        v74 = v73;
        v75 = operatingSystemVersion;
        v76 = -[NSString isEqual:](v75, "isEqual:", v74);

        if ((v76 & 1) == 0)
          goto LABEL_59;
      }
      v21 = self->_isSent == *((unsigned __int8 *)v5 + 128);
      goto LABEL_60;
    }
LABEL_59:
    v21 = 0;
  }
LABEL_60:

  return v21;
}

- (unint64_t)hash
{
  unint64_t type;
  NSUInteger v4;

  type = self->_type;
  v4 = -[NSString hash](self->_sourceKey, "hash") - type + 32 * type;
  return -[NSString hash](self->_externalKey, "hash") - v4 + 32 * v4;
}

- (SGSimpleNamedEmailAddress)from
{
  return (SGSimpleNamedEmailAddress *)-[CSPerson sg_namedEmailAddress](self->_fromPerson, "sg_namedEmailAddress");
}

- (NSString)contextSnippet
{
  id v3;
  const __CFString *operatingSystemVersion;
  NSString *v5;

  if (self->_shouldShowOperatingSystemVersion)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (-[NSString length](self->_operatingSystemVersion, "length"))
      operatingSystemVersion = (const __CFString *)self->_operatingSystemVersion;
    else
      operatingSystemVersion = CFSTR("Unknown OS");
    v5 = (NSString *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@]%@"), operatingSystemVersion, self->_contextSnippet);
  }
  else
  {
    v5 = self->_contextSnippet;
  }
  return v5;
}

- (_NSRange)contextSnippetRange
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (self->_shouldShowOperatingSystemVersion)
  {
    -[SGOrigin contextSnippet](self, "contextSnippet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");
    v5 = v4 - -[NSString length](self->_contextSnippet, "length");

    location = v5 + self->_contextSnippetRange.location;
  }
  else
  {
    location = self->_contextSnippetRange.location;
  }
  length = self->_contextSnippetRange.length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)universalURL
{
  unint64_t type;
  void *v4;
  void *v6;

  type = self->_type;
  if (type == 4)
  {
    +[SGEKEventConversions urlForEKEventFromTextMessageWithUniqueIdentifier:](SGEKEventConversions, "urlForEKEventFromTextMessageWithUniqueIdentifier:", self->_externalKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (type == 1)
  {
    +[SGEKEventConversions urlForMailMessageWithId:](SGEKEventConversions, "urlForMailMessageWithId:", self->_externalKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGOrigin.m"), 286, CFSTR("Unknown origin type: %lu"), self->_type);

    v4 = 0;
  }
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (NSString)externalKey
{
  return self->_externalKey;
}

- (CSPerson)fromPerson
{
  return self->_fromPerson;
}

- (NSArray)toPeople
{
  return self->_toPeople;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (NSArray)to
{
  return self->_to;
}

- (NSArray)cc
{
  return self->_cc;
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isFromForwardedMessage
{
  return self->_fromForwardedMessage;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_localizedApplicationName, 0);
  objc_storeStrong((id *)&self->_operatingSystemVersion, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_toPeople, 0);
  objc_storeStrong((id *)&self->_fromPerson, 0);
  objc_storeStrong((id *)&self->_contextSnippet, 0);
  objc_storeStrong((id *)&self->_externalKey, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
}

void __27__SGOrigin__resolveAppName__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v7)
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 5)
        objc_msgSend(v3, "removeAllObjects");
      v9 = objc_alloc(MEMORY[0x1E0D81638]);
      objc_msgSend(v7, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "teamIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v9, "initWithFirst:second:", v10, v11);

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    }
    else
    {
      sgLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1A2267000, v12, OS_LOG_TYPE_DEFAULT, "SGOrigin: no bundle record found %@", buf, 0xCu);
      }

      v4 = 0;
    }

    objc_autoreleasePoolPop(v5);
  }
  objc_msgSend(v4, "first");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 136);
  *(_QWORD *)(v14 + 136) = v13;

  objc_msgSend(v4, "second");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 144);
  *(_QWORD *)(v17 + 144) = v16;

}

void __27__SGOrigin__resolveAppName__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)_resolveAppName__pasExprOnceResult;
  _resolveAppName__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 bundleId:(id)a6 fromForwardedMessage:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  SGOrigin *v14;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = -[SGOrigin initWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:]([SGOrigin alloc], "initWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:", a3, v13, v12, v11, v7);

  return v14;
}

+ (SGOrigin)originWithType:(unint64_t)a3 sourceKey:(id)a4 externalKey:(id)a5 fromForwardedMessage:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  SGOrigin *v11;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = -[SGOrigin initWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:]([SGOrigin alloc], "initWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:", a3, v10, v9, 0, v6);

  return v11;
}

@end
