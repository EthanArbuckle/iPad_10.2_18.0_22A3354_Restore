@implementation GCVersion

+ (id)currentSourceVersion
{
  if (currentSourceVersion_onceToken != -1)
    dispatch_once(&currentSourceVersion_onceToken, &__block_literal_global_18);
  return (id)currentSourceVersion_currentSourceVersion;
}

void __33__GCVersion_currentSourceVersion__block_invoke()
{
  unsigned int *v0;
  uint64_t v1;
  unsigned int v2;
  unsigned int *v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;
  unint64_t v7;
  GCVersion *v8;
  void *v9;

  v0 = (unsigned int *)dyld_image_header_containing_address();
  v1 = *v0;
  if ((_DWORD)v1 != -17958193)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("GameControllerFoundation Mach-O header has incorrect magic: %x"), v1);
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0C99768];
LABEL_7:
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", v4, v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v2 = v0[4];
  if (!v2)
  {
LABEL_6:
    v4 = *MEMORY[0x1E0C99768];
    v5 = CFSTR("GameControllerFoundation Mach-O is missing LC_SOURCE_VERSION");
    goto LABEL_7;
  }
  v3 = v0 + 8;
  while (*v3 != 42)
  {
    v3 = (unsigned int *)((char *)v3 + v3[1]);
    if (!--v2)
      goto LABEL_6;
  }
  v7 = *((_QWORD *)v3 + 1);
  v8 = -[GCVersion initWithMajor:minor:patch:]([GCVersion alloc], "initWithMajor:minor:patch:", (v7 >> 40) & 0x7FFFFF, (v7 >> 30) & 0x3FF, (v7 >> 20) & 0x3FF);
  v9 = (void *)currentSourceVersion_currentSourceVersion;
  currentSourceVersion_currentSourceVersion = (uint64_t)v8;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 patch:(unint64_t)a5
{
  GCVersion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCVersion;
  result = -[GCVersion init](&v9, sel_init);
  result->_major = a3;
  result->_minor = a4;
  result->_patch = a5;
  return result;
}

- (GCVersion)initWithString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  GCVersion *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  if (initWithString__onceToken != -1)
    dispatch_once(&initWithString__onceToken, &__block_literal_global_6);
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", initWithString__invalidChars);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
      goto LABEL_17;
    if ((unint64_t)objc_msgSend(v7, "count") > 3)
      goto LABEL_17;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
      goto LABEL_17;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 < 1)
      goto LABEL_17;
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (!v13)
        goto LABEL_17;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (v15 < 0)
        goto LABEL_17;
    }
    if ((unint64_t)objc_msgSend(v7, "count") < 3)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (!v18
        || (objc_msgSend(v7, "objectAtIndexedSubscript:", 2),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v19, "integerValue"),
            v19,
            v20 < 0))
      {
LABEL_17:
        v16 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    self = -[GCVersion initWithMajor:minor:patch:](self, "initWithMajor:minor:patch:", v11, v15, v20);
    v16 = self;
    goto LABEL_18;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

void __28__GCVersion_initWithString___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[NSCharacterSet characterSetWithCharactersInString:](&off_1F03AC410, "characterSetWithCharactersInString:", CFSTR(".0123456789"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithString__invalidChars;
  initWithString__invalidChars = v0;

}

- (GCVersion)init
{
  return -[GCVersion initWithMajor:minor:patch:](self, "initWithMajor:minor:patch:", 0, 0, 0);
}

- (GCVersion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("major"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minor"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("patch"));

  return -[GCVersion initWithMajor:minor:patch:](self, "initWithMajor:minor:patch:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion major](self, "major"), CFSTR("major"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion minor](self, "minor"), CFSTR("minor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion patch](self, "patch"), CFSTR("patch"));

}

- (BOOL)isEqualToSourceVersion:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[GCVersion major](self, "major");
  if (v5 == objc_msgSend(v4, "major") && (v6 = -[GCVersion minor](self, "minor"), v6 == objc_msgSend(v4, "minor")))
  {
    v7 = -[GCVersion patch](self, "patch");
    v8 = v7 == objc_msgSend(v4, "patch");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isGreaterThanSourceVersion:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  v5 = -[GCVersion major](self, "major");
  if (v5 > objc_msgSend(v4, "major"))
    goto LABEL_6;
  v6 = -[GCVersion major](self, "major");
  if (v6 != objc_msgSend(v4, "major"))
    goto LABEL_8;
  v7 = -[GCVersion minor](self, "minor");
  if (v7 <= objc_msgSend(v4, "minor"))
  {
    v8 = -[GCVersion minor](self, "minor");
    if (v8 == objc_msgSend(v4, "minor"))
    {
      v9 = -[GCVersion patch](self, "patch");
      if (v9 > objc_msgSend(v4, "patch"))
        goto LABEL_6;
      -[GCVersion patch](self, "patch");
      objc_msgSend(v4, "patch");
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
LABEL_6:
  v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)isGreaterThanOrEqualToSourceVersion:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[GCVersion isGreaterThanSourceVersion:](self, "isGreaterThanSourceVersion:", v4)
    || -[GCVersion isEqualToSourceVersion:](self, "isEqualToSourceVersion:", v4);

  return v5;
}

- (BOOL)isLessThanSourceVersion:(id)a3
{
  return objc_msgSend(a3, "isGreaterThanSourceVersion:", self);
}

- (BOOL)isLessThanOrEqualToSourceVersion:(id)a3
{
  return objc_msgSend(a3, "isGreaterThanOrEqualToSourceVersion:", self);
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[GCVersion isLessThanSourceVersion:](self, "isLessThanSourceVersion:", v4))
    v5 = -1;
  else
    v5 = -[GCVersion isGreaterThanSourceVersion:](self, "isGreaterThanSourceVersion:", v4);

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[GCVersion isEqualToSourceVersion:](self, "isEqualToSourceVersion:", v4);

  return v5;
}

- (BOOL)isGreaterThan:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GCVersion isGreaterThanSourceVersion:](self, "isGreaterThanSourceVersion:", v4);

  return v5;
}

- (BOOL)isGreaterThanOrEqualTo:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GCVersion isGreaterThanOrEqualToSourceVersion:](self, "isGreaterThanOrEqualToSourceVersion:", v4);

  return v5;
}

- (BOOL)isLessThan:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GCVersion isLessThanSourceVersion:](self, "isLessThanSourceVersion:", v4);

  return v5;
}

- (BOOL)isLessThanOrEqualTo:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GCVersion isLessThanOrEqualToSourceVersion:](self, "isLessThanOrEqualToSourceVersion:", v4);

  return v5;
}

- (unint64_t)hash
{
  return self->_minor ^ self->_major ^ self->_patch;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%lu.%lu.%lu"), -[GCVersion major](self, "major"), -[GCVersion minor](self, "minor"), -[GCVersion patch](self, "patch"));
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("%lu.%lu.%lu"), -[GCVersion major](self, "major"), -[GCVersion minor](self, "minor"), -[GCVersion patch](self, "patch"));
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCVersion description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)major
{
  return self->_major;
}

- (unint64_t)minor
{
  return self->_minor;
}

- (unint64_t)patch
{
  return self->_patch;
}

@end
