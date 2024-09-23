@implementation APExtension

- (APExtension)initWithExtensionIdentity:(id)a3 auditToken:(id *)a4
{
  return (APExtension *)sub_2362C34F4(a3);
}

- (APExtension)initWithApplicationExtensionRecord:(id)a3
{
  return (APExtension *)sub_2362C1738(a3);
}

- (APExtension)initWithExtensionUUID:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = sub_2362CB428();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2362CB410();
  v8 = sub_2362CB698();
  return (APExtension *)sub_2362C1A3C((uint64_t)v7, v8, v9);
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLocked
{
  int v2;
  APExtension *v3;
  unsigned __int8 v4;

  v2 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR___APExtension_forcedLockedValue);
  if (v2 == 2)
  {
    v3 = self;
    v4 = sub_2362C1D7C();

  }
  else
  {
    v4 = v2 & 1;
  }
  return v4 & 1;
}

- (BOOL)isEffectivelyLocked
{
  return -[APExtension isLocked](self, sel_isLocked);
}

- (id)effectiveBundleIdentifier
{
  return sub_23624EC40();
}

- (BOOL)requiresShielding
{
  void *v3;
  APExtension *v4;
  id v5;
  unsigned __int8 v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedGuard);
  v6 = objc_msgSend(v5, sel_extensionRequiresAuthentication_, v4);

  return v6;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
