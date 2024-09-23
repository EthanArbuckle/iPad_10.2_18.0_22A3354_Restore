@implementation FPExtensionEnumerationSettings

- (FPItemID)enumeratedItemID
{
  FPExtensionEnumerationSettings *v2;
  FPItemID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  FPExtensionEnumerationSettings *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FPExtensionEnumerationSettings;
  -[FPEnumerationSettings encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_enumeratedItemID, CFSTR("enumeratedItemID"));
  objc_sync_exit(v5);

  objc_msgSend(v4, "encodeObject:forKey:", v5->_enumeratedURL, CFSTR("enumeratedURL"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_presenterEnumeration, CFSTR("presenterEnumeration"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_requireSandboxAccess, CFSTR("requireSandboxAccess"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_unbounded, CFSTR("unbounded"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_buildAndFilterAppLibraries, CFSTR("buildAndFilterAppLibraries"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_wantsDirectExtensionEnumeration, CFSTR("wantsDirectExtensionEnumeration"));

}

- (void)setEnumeratedItemID:(id)a3
{
  FPExtensionEnumerationSettings *v4;
  uint64_t v5;
  FPItemID *enumeratedItemID;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  enumeratedItemID = v4->_enumeratedItemID;
  v4->_enumeratedItemID = (FPItemID *)v5;

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedURL, 0);
  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
}

- (BOOL)wantsDirectExtensionEnumeration
{
  return self->_wantsDirectExtensionEnumeration;
}

- (BOOL)requireSandboxAccess
{
  return self->_requireSandboxAccess;
}

- (FPExtensionEnumerationSettings)initWithCoder:(id)a3
{
  id v4;
  FPExtensionEnumerationSettings *v5;
  uint64_t v6;
  FPItemID *enumeratedItemID;
  uint64_t v8;
  NSURL *enumeratedURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPExtensionEnumerationSettings;
  v5 = -[FPEnumerationSettings initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumeratedItemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    enumeratedItemID = v5->_enumeratedItemID;
    v5->_enumeratedItemID = (FPItemID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumeratedURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    enumeratedURL = v5->_enumeratedURL;
    v5->_enumeratedURL = (NSURL *)v8;

    v5->_presenterEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("presenterEnumeration"));
    v5->_requireSandboxAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireSandboxAccess"));
    v5->_unbounded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unbounded"));
    v5->_buildAndFilterAppLibraries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("buildAndFilterAppLibraries"));
    v5->_wantsDirectExtensionEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsDirectExtensionEnumeration"));
  }

  return v5;
}

- (NSURL)enumeratedURL
{
  return self->_enumeratedURL;
}

- (id)description
{
  FPExtensionEnumerationSettings *v2;
  FPItemID *v3;
  NSURL *enumeratedURL;
  const __CFString *v5;
  void *v6;
  uint64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  enumeratedURL = v2->_enumeratedURL;
  if (v2->_buildAndFilterAppLibraries)
    v5 = CFSTR("y");
  else
    v5 = CFSTR("n");
  if (enumeratedURL)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("url:%@ s:%@, al:%@"), enumeratedURL, v3, v5);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("s:%@, al:%@"), v3, v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  FPExtensionEnumerationSettings *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FPExtensionEnumerationSettings;
  v4 = -[FPEnumerationSettings copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[FPItemID copy](v5->_enumeratedItemID, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  objc_sync_exit(v5);
  v8 = -[NSURL copy](v5->_enumeratedURL, "copy");
  v9 = (void *)v4[5];
  v4[5] = v8;

  *((_BYTE *)v4 + 33) = v5->_wantsDirectExtensionEnumeration;
  *((_BYTE *)v4 + 34) = v5->_requireSandboxAccess;
  *((_BYTE *)v4 + 36) = v5->_buildAndFilterAppLibraries;
  *((_BYTE *)v4 + 35) = v5->_unbounded;
  *((_BYTE *)v4 + 32) = v5->_presenterEnumeration;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPItemID)nullableEnumeratedItemID
{
  FPExtensionEnumerationSettings *v2;
  FPItemID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setNullableEnumeratedItemID:(id)a3
{
  FPExtensionEnumerationSettings *v4;
  uint64_t v5;
  FPItemID *enumeratedItemID;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  enumeratedItemID = v4->_enumeratedItemID;
  v4->_enumeratedItemID = (FPItemID *)v5;

  objc_sync_exit(v4);
}

- (void)setEnumeratedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPresenterEnumeration
{
  return self->_presenterEnumeration;
}

- (void)setPresenterEnumeration:(BOOL)a3
{
  self->_presenterEnumeration = a3;
}

- (void)setWantsDirectExtensionEnumeration:(BOOL)a3
{
  self->_wantsDirectExtensionEnumeration = a3;
}

- (void)setRequireSandboxAccess:(BOOL)a3
{
  self->_requireSandboxAccess = a3;
}

- (BOOL)isUnbounded
{
  return self->_unbounded;
}

- (void)setUnbounded:(BOOL)a3
{
  self->_unbounded = a3;
}

- (BOOL)buildAndFilterAppLibraries
{
  return self->_buildAndFilterAppLibraries;
}

- (void)setBuildAndFilterAppLibraries:(BOOL)a3
{
  self->_buildAndFilterAppLibraries = a3;
}

@end
