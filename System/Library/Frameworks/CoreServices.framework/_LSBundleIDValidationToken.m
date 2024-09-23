@implementation _LSBundleIDValidationToken

- (id)initWithBundleIdentifier:(id)a1
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      v3 = &stru_1E10473A0;
    -[__CFString dataUsingEncoding:](v3, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = a1;
    v7.super_class = (Class)_LSBundleIDValidationToken;
    a1 = objc_msgSendSuper2(&v7, sel_initWithPayload_, v5);

  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isToken:(void *)a3 correctForBundleIdentifier:(void *)a4 connection:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (v6)
  {
    if (!v7
      || (objc_msgSend(v7, "dataUsingEncoding:", 4),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = -[_LSValidationToken isCorrectForPayload:]((uint64_t)v6, v9),
          v9,
          (v10 & 1) == 0))
    {
      objc_msgSend(v8, "_xpcConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)_LSCopyBundleIdentifierForXPCConnection(v11, 1);

      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 && (-[_LSValidationToken isCorrectForPayload:]((uint64_t)v6, v13) & 1) != 0;

      goto LABEL_12;
    }
  }
  else if (v8)
  {
    objc_msgSend(v8, "_xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _LSXPCConnectionMayMapDatabase(v12) != 0;
LABEL_12:

    goto LABEL_13;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

@end
