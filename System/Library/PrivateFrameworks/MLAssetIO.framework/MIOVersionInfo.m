@implementation MIOVersionInfo

- (MIOVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5
{
  MIOVersionInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MIOVersionInfo;
  result = -[MIOVersionInfo init](&v9, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_patchVersion = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  MIOVersionInfo *v4;
  MIOVersionInfo *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;

  v4 = (MIOVersionInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIOVersionInfo majorVersion](self, "majorVersion");
      if (v6 == -[MIOVersionInfo majorVersion](v5, "majorVersion")
        && (v7 = -[MIOVersionInfo minorVersion](self, "minorVersion"),
            v7 == -[MIOVersionInfo minorVersion](v5, "minorVersion")))
      {
        v8 = -[MIOVersionInfo patchVersion](self, "patchVersion");
        v9 = v8 == -[MIOVersionInfo patchVersion](v5, "patchVersion");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;

  v3 = -[MIOVersionInfo majorVersion](self, "majorVersion");
  v4 = -[MIOVersionInfo minorVersion](self, "minorVersion") ^ v3;
  return v4 ^ -[MIOVersionInfo patchVersion](self, "patchVersion");
}

- (NSString)versionNumberString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd.%zd.%zd"), -[MIOVersionInfo majorVersion](self, "majorVersion"), -[MIOVersionInfo minorVersion](self, "minorVersion"), -[MIOVersionInfo patchVersion](self, "patchVersion"));
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  v5 = -[MIOVersionInfo majorVersion](self, "majorVersion");
  v6 = v5 - objc_msgSend(v4, "majorVersion");
  v7 = -[MIOVersionInfo minorVersion](self, "minorVersion");
  v8 = v7 - objc_msgSend(v4, "minorVersion");
  v9 = -[MIOVersionInfo patchVersion](self, "patchVersion");
  v10 = objc_msgSend(v4, "patchVersion");

  v11 = v9 - v10;
  v12 = v6 >> 63;
  if (v6 > 0)
    LODWORD(v12) = v12 + 1;
  v13 = v8 >> 63;
  if (v8 > 0)
    LODWORD(v13) = v13 + 1;
  v14 = v11 < 0;
  v15 = v11 >> 63;
  v16 = 3 * v13 + 9 * v12;
  if (!v14 && v9 != v10)
    ++v16;
  return (v16 + (_DWORD)v15 != 0) | ((v16 + (int)v15) >> 31);
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)patchVersion
{
  return self->_patchVersion;
}

@end
