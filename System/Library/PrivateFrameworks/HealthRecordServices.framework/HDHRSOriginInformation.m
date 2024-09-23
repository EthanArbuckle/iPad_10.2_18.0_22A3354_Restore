@implementation HDHRSOriginInformation

- (HDHRSOriginInformation)initWithOperatingSystemVersion:(id *)a3 build:(id)a4
{
  id v6;
  HDHRSOriginInformation *v7;
  HDHRSOriginInformation *v8;
  __int128 v9;
  uint64_t v10;
  NSString *operatingSystemBuild;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDHRSOriginInformation;
  v7 = -[HDHRSOriginInformation init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&a3->var0;
    v7->_operatingSystemVersion.patchVersion = a3->var2;
    *(_OWORD *)&v7->_operatingSystemVersion.majorVersion = v9;
    v10 = objc_msgSend(v6, "copy");
    operatingSystemBuild = v8->_operatingSystemBuild;
    v8->_operatingSystemBuild = (NSString *)v10;

  }
  return v8;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_operatingSystemVersion.minorVersion ^ self->_operatingSystemVersion.majorVersion ^ self->_operatingSystemVersion.patchVersion;
  return v2 ^ -[NSString hash](self->_operatingSystemBuild, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HDHRSOriginInformation *v4;
  HDHRSOriginInformation *v5;
  HDHRSOriginInformation *v6;
  int64_t minorVersion;
  char v8;
  NSString *v9;
  NSString *operatingSystemBuild;
  void *v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (HDHRSOriginInformation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5)
      {
        -[HDHRSOriginInformation operatingSystemVersion](v5, "operatingSystemVersion");
        if (v15 != self->_operatingSystemVersion.majorVersion)
          goto LABEL_15;
        -[HDHRSOriginInformation operatingSystemVersion](v6, "operatingSystemVersion");
        if (v14 != self->_operatingSystemVersion.minorVersion)
          goto LABEL_15;
        -[HDHRSOriginInformation operatingSystemVersion](v6, "operatingSystemVersion");
        minorVersion = v13;
      }
      else
      {
        if (self->_operatingSystemVersion.majorVersion)
          goto LABEL_15;
        minorVersion = self->_operatingSystemVersion.minorVersion;
        if (minorVersion)
          goto LABEL_15;
      }
      if (minorVersion == self->_operatingSystemVersion.patchVersion)
      {
        -[HDHRSOriginInformation operatingSystemBuild](v6, "operatingSystemBuild");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        operatingSystemBuild = self->_operatingSystemBuild;
        if (v9 == operatingSystemBuild)
        {
          v8 = 1;
        }
        else if (operatingSystemBuild)
        {
          -[HDHRSOriginInformation operatingSystemBuild](v6, "operatingSystemBuild");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v11, "isEqualToString:", self->_operatingSystemBuild);

        }
        else
        {
          v8 = 0;
        }

        goto LABEL_16;
      }
LABEL_15:
      v8 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v8 = 0;
  }
LABEL_17:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t majorVersion;
  id v5;

  majorVersion = self->_operatingSystemVersion.majorVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", majorVersion, CFSTR("OperatingSystemVersionMajor"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_operatingSystemVersion.minorVersion, CFSTR("OperatingSystemVersionMinor"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_operatingSystemVersion.patchVersion, CFSTR("OperatingSystemVersionPatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operatingSystemBuild, CFSTR("OperatingSystemBuild"));

}

- (HDHRSOriginInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDHRSOriginInformation *v6;
  _QWORD v8[3];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OperatingSystemBuild"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("OperatingSystemVersionMajor"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("OperatingSystemVersionMinor"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("OperatingSystemVersionPatch")) & 1) != 0)
  {
    v8[0] = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OperatingSystemVersionMajor"));
    v8[1] = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OperatingSystemVersionMinor"));
    v8[2] = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OperatingSystemVersionPatch"));
    self = -[HDHRSOriginInformation initWithOperatingSystemVersion:build:](self, "initWithOperatingSystemVersion:build:", v8, v5);
    v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v6 = 0;
  }

  return v6;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)&self->var2;
  return self;
}

- (NSString)operatingSystemBuild
{
  return self->_operatingSystemBuild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingSystemBuild, 0);
}

@end
