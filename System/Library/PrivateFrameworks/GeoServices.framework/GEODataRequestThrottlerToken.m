@implementation GEODataRequestThrottlerToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (GEODataRequestThrottlerToken)initWithRequest:(id)a3 forClient:(id)a4
{
  id v6;
  GEODataRequestThrottlerToken *v7;
  double v8;
  uint64_t v9;
  NSString *bundleId;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEODataRequestThrottlerToken;
  v7 = -[GEODataRequestThrottlerToken init](&v12, sel_init);
  if (v7)
  {
    GEOGetMonotonicTime();
    v7->_createdAt = v8;
    v7->_kind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a3;
    objc_msgSend(v6, "bundleId");
    v9 = objc_claimAutoreleasedReturnValue();
    bundleId = v7->_bundleId;
    v7->_bundleId = (NSString *)v9;

  }
  return v7;
}

- (GEODataRequestThrottlerToken)init
{
  GEODataRequestThrottlerToken *result;

  result = (GEODataRequestThrottlerToken *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEODataRequestThrottlerToken)initWithCoder:(id)a3
{
  id v4;
  GEODataRequestThrottlerToken *v5;
  double v6;
  uint64_t v7;
  NSString *bundleId;
  GEODataRequestThrottlerToken *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[GEODataRequestThrottlerToken initWithXPCCoder:](self, "initWithXPCCoder:", v4);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GEODataRequestThrottlerToken;
    v5 = -[GEODataRequestThrottlerToken init](&v11, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("c"));
      v5->_createdAt = v6;
      v5->_kind.type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("t"));
      v5->_kind.subtype.raw = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("s"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
      v7 = objc_claimAutoreleasedReturnValue();
      bundleId = v5->_bundleId;
      v5->_bundleId = (NSString *)v7;

    }
  }
  v9 = v5;

  return v9;
}

- (GEODataRequestThrottlerToken)initWithXPCCoder:(id)a3
{
  id v4;
  GEODataRequestThrottlerToken *v5;
  double v6;
  uint64_t v7;
  NSString *bundleId;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEODataRequestThrottlerToken;
  v5 = -[GEODataRequestThrottlerToken init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "geo_decodeXPCDoubleForKey:defaultValue:", CFSTR("c"), 0.0);
    v5->_createdAt = v6;
    v5->_kind.type = objc_msgSend(v4, "geo_decodeXPCInt64ForKey:defaultValue:", CFSTR("t"), 0);
    v5->_kind.subtype.raw = objc_msgSend(v4, "geo_decodeXPCInt64ForKey:defaultValue:", CFSTR("s"), 0);
    objc_msgSend(v4, "geo_decodeXPCStringForKey:", CFSTR("b"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEODataRequestThrottlerToken encodeWithXPCCoder:](self, "encodeWithXPCCoder:", v4);
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("c"), self->_createdAt);
    objc_msgSend(v4, "encodeInt32:forKey:", self->_kind.type, CFSTR("t"));
    objc_msgSend(v4, "encodeInt32:forKey:", self->_kind.subtype.raw, CFSTR("s"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_bundleId, CFSTR("b"));
  }

}

- (void)encodeWithXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", CFSTR("c"), self->_createdAt);
  objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", self->_kind.type, CFSTR("t"));
  objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", self->_kind.subtype.raw, CFSTR("s"));
  objc_msgSend(v4, "geo_encodeXPCString:forKey:", self->_bundleId, CFSTR("b"));

}

- (BOOL)isValidForRequest:(id)a3 client:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *bundleId;
  BOOL v11;
  double v12;
  double v13;

  v6 = a4;
  v7 = v6;
  if (*(_QWORD *)&self->_kind == a3)
  {
    objc_msgSend(v6, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    bundleId = self->_bundleId;
    if (v8)
    {
      if (!bundleId || (objc_msgSend(v8, "isEqual:") & 1) == 0)
        goto LABEL_12;
    }
    else if (bundleId)
    {
      goto LABEL_12;
    }
    if (checkEntitlements(a3.var0, v7))
    {
      GEOGetMonotonicTime();
      v13 = v12 - self->_createdAt;
      if (v13 <= 0.0)
        v13 = -v13;
      v11 = v13 < 5.0;
      goto LABEL_13;
    }
LABEL_12:
    v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)refresh
{
  double v3;

  GEOGetMonotonicTime();
  self->_createdAt = v3;
}

@end
