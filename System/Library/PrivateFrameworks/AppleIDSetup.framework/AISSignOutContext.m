@implementation AISSignOutContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)accountAltDSIDsByService
{
  void *v2;

  type metadata accessor for AIDAServiceType(0);
  sub_2364D6150();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2365AFF48();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (BOOL)shouldRemoveDeviceUser
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AISSignOutContext_shouldRemoveDeviceUser);
}

- (NSString)altDSID
{
  AISSignOutContext *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_23656DC84();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2365B0038();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)machineIdToSignOut
{
  void *v2;

  if (*(_QWORD *)&self->accountAltDSIDsByService[OBJC_IVAR___AISSignOutContext_machineIdToSignOut])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2365B0038();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AISSignOutContext_type);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AISSignOutContext *v5;

  v4 = a3;
  v5 = self;
  sub_23656DDC0(v4);

}

- (AISSignOutContext)initWithCoder:(id)a3
{
  id v3;
  AISSignOutContext *v4;

  v3 = a3;
  v4 = (AISSignOutContext *)sub_23656EF30(v3);

  return v4;
}

- (AISSignOutContext)initWithAccountAltDSIDsByService:(id)a3
{
  uint64_t v3;
  objc_class *v4;
  _BYTE *v5;
  _QWORD *v6;
  AISSignOutContext *v7;
  objc_super v9;

  type metadata accessor for AIDAServiceType(0);
  sub_2364D6150();
  v3 = sub_2365AFF60();
  v4 = (objc_class *)type metadata accessor for SignOutContext();
  v5 = objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR___AISSignOutContext_accountAltDSIDsByService] = v3;
  v6 = &v5[OBJC_IVAR___AISSignOutContext_machineIdToSignOut];
  *v6 = 0;
  v6[1] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AISSignOutContext_type] = 0;
  v5[OBJC_IVAR___AISSignOutContext_shouldRemoveDeviceUser] = 0;
  v9.receiver = v5;
  v9.super_class = v4;
  v7 = -[AISSignOutContext init](&v9, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (AISSignOutContext)initWithAltDSID:(id)a3 machineIdToSignOut:(id)a4 type:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = sub_2365B005C();
  v9 = v8;
  if (a4)
  {
    v10 = sub_2365B005C();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  return (AISSignOutContext *)sub_23656E8F4(v7, v9, v10, v12, a5);
}

- (id)initWithAltDSID:(uint64_t)a3 type:(uint64_t)a4
{
  void *v6;
  id v7;

  sub_2365B005C();
  v6 = (void *)sub_2365B0038();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(a1, sel_initWithAltDSID_machineIdToSignOut_type_, v6, 0, a4);

  return v7;
}

- (AISSignOutContext)init
{
  AISSignOutContext *result;

  result = (AISSignOutContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  AISSignOutContext *v2;
  void *v3;

  v2 = self;
  SignOutContext.description.getter();

  v3 = (void *)sub_2365B0038();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
