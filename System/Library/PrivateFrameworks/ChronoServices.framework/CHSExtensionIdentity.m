@implementation CHSExtensionIdentity

- (NSString)tokenString
{
  CHSExtensionIdentity *v2;
  void *v3;

  v2 = self;
  CHSExtensionIdentity.tokenString.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CHSExtensionIdentity)init
{
  return (CHSExtensionIdentity *)sub_18FB1DD18();
}

- (int64_t)hash
{
  CHSExtensionIdentity *v2;
  int64_t v3;

  v2 = self;
  v3 = CHSExtensionIdentity.hash.getter();

  return v3;
}

- (NSString)description
{
  CHSExtensionIdentity *v2;
  void *v3;
  char *v5;

  v2 = self;
  CHSExtensionIdentity.token.getter(&v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE18A140);
  sub_18FB1E9FC((unint64_t *)&qword_1EE18A150, (uint64_t *)&unk_1EE18A140, MEMORY[0x1E0DEAF20]);
  sub_18FBCD070();

  swift_bridgeObjectRelease_n();
  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)extensionBundleIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  CHSExtensionIdentity *v4;
  CHSExtensionIdentity *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18FBCD478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CHSExtensionIdentity.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)isRemote
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_deviceIdentifier;
  swift_beginAccess();
  return *((_QWORD *)v2 + 1) != 0;
}

- (CHSExtensionIdentity)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_18FBCD0DC();
  v9 = v8;
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v14 = 0;
    return (CHSExtensionIdentity *)sub_18FB1B738(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_18FBCD0DC();
  v11 = v10;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v12 = sub_18FBCD0DC();
  v14 = v13;
  return (CHSExtensionIdentity *)sub_18FB1B738(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (CHSExtensionIdentity)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CHSExtensionIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CHSExtensionIdentity extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("extensionBundleIdentifier"));

  -[CHSExtensionIdentity containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("containerBundleIdentifier"));

  -[CHSExtensionIdentity deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("deviceIdentifier"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CHSExtensionIdentity extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey();

  -[CHSExtensionIdentity containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CHSExtensionIdentity containerBundleIdentifier](self, "containerBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

  }
  -[CHSExtensionIdentity deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CHSExtensionIdentity deviceIdentifier](self, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

  }
}

- (CHSExtensionIdentity)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CHSExtensionIdentity *v8;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeStringFromXPCDictionaryWithKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CHSExtensionIdentity extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("extensionBundleIdentifier"));

  -[CHSExtensionIdentity containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("containerBundleIdentifier"));

  -[CHSExtensionIdentity deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("deviceIdentifier"));

}

- (CHSExtensionIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CHSExtensionIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)containerBundleIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_containerBundleIdentifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)deviceIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_deviceIdentifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
