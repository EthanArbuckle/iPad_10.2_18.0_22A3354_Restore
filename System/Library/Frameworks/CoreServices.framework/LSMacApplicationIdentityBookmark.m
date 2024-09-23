@implementation LSMacApplicationIdentityBookmark

- (id)initWithURL:(void *)a3 bundleIdentifier:
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id *v9;
  id *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v6 = a2;
  v7 = a3;
  v8 = (void *)v7;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_9;
  }
  if (!(v6 | v7))
  {
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[LSMacApplicationIdentityBookmark initWithURL:bundleIdentifier:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v10 = 0;
    goto LABEL_8;
  }
  v21.receiver = a1;
  v21.super_class = (Class)LSMacApplicationIdentityBookmark;
  v9 = (id *)objc_msgSendSuper2(&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a2);
    v11 = objc_msgSend(v8, "copy");
    a1 = v10[2];
    v10[2] = (id)v11;
LABEL_8:

  }
LABEL_9:

  return v10;
}

- (LSMacApplicationIdentityBookmark)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  LSMacApplicationIdentityBookmark *v7;
  LSMacApplicationIdentityBookmark *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!(v5 | v6))
    goto LABEL_5;
  v10.receiver = self;
  v10.super_class = (Class)LSMacApplicationIdentityBookmark;
  v7 = -[LSMacApplicationIdentityBookmark init](&v10, sel_init);
  if (!v7)
  {
    self = 0;
LABEL_5:

    v8 = 0;
    goto LABEL_6;
  }
  v8 = (LSMacApplicationIdentityBookmark *)-[LSMacApplicationIdentityBookmark initWithURL:bundleIdentifier:](v7, (void *)v6, (void *)v5);
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("URL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSURL isEqual:](self->_URL, "isEqual:", v5[1]))
      v6 = -[NSString isEqual:](self->_bundleIdentifier, "isEqual:", v5[2]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ __ROR8__(-[NSURL hash](self->_URL, "hash"), 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182882000, a1, a3, "making a LSMacApplicationIdentityBookmark with nil URL AND nil bundleIdentifier identifies nothing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

@end
