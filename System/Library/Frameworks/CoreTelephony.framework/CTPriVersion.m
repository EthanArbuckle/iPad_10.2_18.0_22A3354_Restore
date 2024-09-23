@implementation CTPriVersion

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPriVersion majorVersion](self, "majorVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", major=%@"), v4);

  -[CTPriVersion minorVersion](self, "minorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", minor=%@"), v5);

  -[CTPriVersion releaseVersion](self, "releaseVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", release=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTPriVersion majorVersion](self, "majorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMajorVersion:", v6);

  -[CTPriVersion minorVersion](self, "minorVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMinorVersion:", v8);

  -[CTPriVersion releaseVersion](self, "releaseVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setReleaseVersion:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTPriVersion majorVersion](self, "majorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("major"));

  -[CTPriVersion minorVersion](self, "minorVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("minor"));

  -[CTPriVersion releaseVersion](self, "releaseVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("release"));

}

- (CTPriVersion)initWithCoder:(id)a3
{
  id v4;
  CTPriVersion *v5;
  uint64_t v6;
  NSNumber *majorVersion;
  uint64_t v8;
  NSNumber *minorVersion;
  uint64_t v10;
  NSNumber *releaseVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTPriVersion;
  v5 = -[CTPriVersion init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("major"));
    v6 = objc_claimAutoreleasedReturnValue();
    majorVersion = v5->_majorVersion;
    v5->_majorVersion = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minor"));
    v8 = objc_claimAutoreleasedReturnValue();
    minorVersion = v5->_minorVersion;
    v5->_minorVersion = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("release"));
    v10 = objc_claimAutoreleasedReturnValue();
    releaseVersion = v5->_releaseVersion;
    v5->_releaseVersion = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_majorVersion, a3);
}

- (NSNumber)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minorVersion, a3);
}

- (NSNumber)releaseVersion
{
  return self->_releaseVersion;
}

- (void)setReleaseVersion:(id)a3
{
  objc_storeStrong((id *)&self->_releaseVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseVersion, 0);
  objc_storeStrong((id *)&self->_minorVersion, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end
