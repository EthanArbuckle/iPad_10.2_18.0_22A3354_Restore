@implementation BMMediaUsageEvent

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 timestamp:(id)a7
{
  return -[BMMediaUsageEvent initWithBegin:bundleID:URL:mediaURL:usageTrusted:timestamp:](self, "initWithBegin:bundleID:URL:mediaURL:usageTrusted:timestamp:", a3, a4, a5, a6, 0, a7);
}

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8
{
  return -[BMMediaUsageEvent initWithBegin:bundleID:URL:mediaURL:usageTrusted:timestamp:safariProfileID:](self, "initWithBegin:bundleID:URL:mediaURL:usageTrusted:timestamp:safariProfileID:", a3, a4, a5, a6, a7, a8, 0);
}

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8 safariProfileID:(id)a9
{
  _BOOL4 v10;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMMediaUsageEvent *v20;
  BMEventTimeElapsingImplementor *v21;
  id v22;
  id v23;
  _BOOL8 v24;
  void *v25;
  id v26;
  BMEventBinarySteppingImplementor *v27;
  BMEventAppAssociatingImplementor *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v36;
  void *v37;
  objc_super v38;
  _QWORD v39[4];

  v10 = a7;
  v13 = a3;
  v39[3] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v38.receiver = self;
  v38.super_class = (Class)BMMediaUsageEvent;
  v20 = -[BMEventBase init](&v38, sel_init);
  if (v20)
  {
    v21 = objc_alloc_init(BMEventTimeElapsingImplementor);
    v39[0] = v21;
    v37 = v19;
    v22 = v18;
    v23 = v17;
    v24 = v13;
    v25 = v16;
    v26 = v15;
    v27 = objc_alloc_init(BMEventBinarySteppingImplementor);
    v39[1] = v27;
    v28 = objc_alloc_init(BMEventAppAssociatingImplementor);
    v39[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
    v36 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMEventBase set_validators:](v20, "set_validators:", v29);

    v15 = v26;
    v16 = v25;

    v30 = v24;
    v17 = v23;
    v18 = v22;
    v19 = v37;
    -[BMMediaUsageEvent setStarting:](v20, "setStarting:", v30);
    v31 = (void *)objc_msgSend(v15, "copy");
    -[BMMediaUsageEvent setBundleID:](v20, "setBundleID:", v31);

    v32 = (void *)objc_msgSend(v25, "copy");
    -[BMMediaUsageEvent setURL:](v20, "setURL:", v32);

    v33 = (void *)objc_msgSend(v17, "copy");
    -[BMMediaUsageEvent setMediaURL:](v20, "setMediaURL:", v33);

    -[BMMediaUsageEvent setUsageTrusted:](v20, "setUsageTrusted:", v36);
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    -[BMMediaUsageEvent setAbsoluteTimestamp:](v20, "setAbsoluteTimestamp:");
    v34 = (void *)objc_msgSend(v37, "copy");
    -[BMMediaUsageEvent setSafariProfileID:](v20, "setSafariProfileID:", v34);

  }
  return v20;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMMediaUsageEvent;
  return -[BMEventBase isValidWithContext:error:](&v5, sel_isValidWithContext_error_, a3, a4);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BMMediaUsageEvent dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaUsageEvent isStarting](self, "isStarting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaUsageEvent bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaUsageEvent URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaUsageEvent mediaURL](self, "mediaURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaUsageEvent isUsageTrusted](self, "isUsageTrusted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> interval: %@, launch: %@, bundleID: %@, URL: %@, mediaURL: %@ isUsageTrusted: %@"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isUsageTrusted
{
  return self->_usageTrusted;
}

- (void)setUsageTrusted:(BOOL)a3
{
  self->_usageTrusted = a3;
}

- (NSString)safariProfileID
{
  return self->_safariProfileID;
}

- (void)setSafariProfileID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
