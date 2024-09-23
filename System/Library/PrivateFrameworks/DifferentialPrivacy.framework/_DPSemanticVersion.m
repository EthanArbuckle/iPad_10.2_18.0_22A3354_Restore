@implementation _DPSemanticVersion

- (_DPSemanticVersion)initWithString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DPSemanticVersion *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$"), 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "numberOfRanges") >= 6
        && objc_msgSend(v9, "rangeAtIndex:", 1) != 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v9, "rangeAtIndex:", 2) != 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v9, "rangeAtIndex:", 3) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = objc_msgSend(v9, "rangeAtIndex:", 1);
        objc_msgSend(v6, "substringWithRange:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v9, "rangeAtIndex:", 2);
        objc_msgSend(v6, "substringWithRange:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v9, "rangeAtIndex:", 3);
        objc_msgSend(v6, "substringWithRange:", v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[_DPSemanticVersion initWithMajorVersion:minorVersion:patchVersion:](self, "initWithMajorVersion:minorVersion:patchVersion:", objc_msgSend(v30, "integerValue"), objc_msgSend(v33, "integerValue"), objc_msgSend(v36, "integerValue"));

        v18 = self;
        goto LABEL_18;
      }
      _DPSemanticVersionError(CFSTR("Version string is not a valid semantic version string. It should specify at least \"<major>.<minor>.<patch>\"."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPLog framework](_DPLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPSemanticVersion initWithString:error:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

      if (a4)
        *a4 = objc_retainAutorelease(v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to parse semantic version from '%@'."), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _DPSemanticVersionError(v19);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      +[_DPLog framework](_DPLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_DPSemanticVersion initWithString:error:].cold.1((uint64_t)v9, v20, v21, v22, v23, v24, v25, v26);

      if (a4)
      {
        v9 = objc_retainAutorelease(v9);
        v18 = 0;
        *a4 = v9;
        goto LABEL_18;
      }
    }
    v18 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (_DPSemanticVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 patchVersion:(unint64_t)a5
{
  _DPSemanticVersion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DPSemanticVersion;
  result = -[_DPSemanticVersion init](&v9, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_patchVersion = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu.%lu.%lu)"), -[_DPSemanticVersion majorVersion](self, "majorVersion"), -[_DPSemanticVersion minorVersion](self, "minorVersion"), -[_DPSemanticVersion patchVersion](self, "patchVersion"));
}

- (BOOL)isBackwardCompatibleWithVersion:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v4 = a3;
  v5 = -[_DPSemanticVersion majorVersion](self, "majorVersion");
  if (v5 != objc_msgSend(v4, "majorVersion"))
    goto LABEL_9;
  v6 = -[_DPSemanticVersion majorVersion](self, "majorVersion");
  v7 = -[_DPSemanticVersion minorVersion](self, "minorVersion");
  v8 = objc_msgSend(v4, "minorVersion");
  if (!v6)
  {
    if (v7 == v8)
    {
      v10 = -[_DPSemanticVersion patchVersion](self, "patchVersion");
      v9 = v10 == objc_msgSend(v4, "patchVersion");
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (v7 <= v8)
  {
    v11 = -[_DPSemanticVersion minorVersion](self, "minorVersion");
    if (v11 == objc_msgSend(v4, "minorVersion"))
    {
      v12 = -[_DPSemanticVersion patchVersion](self, "patchVersion");
      v9 = v12 >= objc_msgSend(v4, "patchVersion");
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[_DPSemanticVersion majorVersion](self, "majorVersion");
    if (v6 == objc_msgSend(v5, "majorVersion")
      && (v7 = -[_DPSemanticVersion minorVersion](self, "minorVersion"), v7 == objc_msgSend(v5, "minorVersion")))
    {
      v8 = -[_DPSemanticVersion patchVersion](self, "patchVersion");
      v9 = v8 == objc_msgSend(v5, "patchVersion");
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

  return v9;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)patchVersion
{
  return self->_patchVersion;
}

- (void)initWithString:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
