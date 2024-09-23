@implementation _EXQuery

+ (id)extensionPointIdentifierQuery:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int active_platform;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;

  v3 = sub_190CA85F0();
  v5 = v4;
  swift_bridgeObjectRetain();
  active_platform = dyld_get_active_platform();
  v7 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  v8 = *v7;
  v9 = v7[1];
  v10 = v7[2];
  v11 = v7[3];
  v12 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v13 = sub_190C76D64(v3, v5, active_platform, v8, v9, v10, v11);
  swift_bridgeObjectRelease();
  return v13;
}

+ (id)extensionPointIdentifierQuery:(id)a3 platform:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;

  v5 = sub_190CA85F0();
  v7 = v6;
  swift_bridgeObjectRetain();
  v8 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  v9 = *v8;
  v10 = v8[1];
  v11 = v8[2];
  v12 = v8[3];
  v13 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v14 = sub_190C76D64(v5, v7, a4, v9, v10, v11, v12);
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)allExtensionsQuery
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _EXQuery()), sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXQuery)init
{
  return (_EXQuery *)sub_190C74274();
}

- (_EXQuery)initWithExtensionPointIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int active_platform;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _EXQuery *v13;

  v3 = sub_190CA85F0();
  v5 = v4;
  active_platform = dyld_get_active_platform();
  v7 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  v8 = *v7;
  v9 = v7[1];
  v10 = v7[2];
  v11 = v7[3];
  v12 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v13 = (_EXQuery *)sub_190C76D64(v3, v5, active_platform, v8, v9, v10, v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (_EXQuery)initWithExtensionPointIdentifier:(id)a3 predicate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  int active_platform;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  _EXQuery *v16;
  void *v17;

  v5 = sub_190CA85F0();
  v7 = v6;
  v8 = (objc_class *)a4;
  active_platform = dyld_get_active_platform();
  v10 = (unint64_t *)_EXAuditTokenForCurrentProcess();
  v11 = *v10;
  v12 = v10[1];
  v13 = v10[2];
  v14 = v10[3];
  v15 = objc_allocWithZone((Class)type metadata accessor for _EXQuery());
  v16 = (_EXQuery *)sub_190C76D64(v5, v7, active_platform, v11, v12, v13, v14);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  v17 = *(Class *)((char *)&v16->super.isa + OBJC_IVAR____EXQuery_predicate);
  *(Class *)((char *)&v16->super.isa + OBJC_IVAR____EXQuery_predicate) = v8;

  return v16;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____EXQuery_predicate));
}

- (void)setPredicate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQuery_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQuery_predicate) = (Class)a3;
  v3 = a3;

}

- (BOOL)includePostprocessing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_includePostprocessing);
}

- (void)setIncludePostprocessing:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_includePostprocessing) = a3;
}

- (BOOL)allowsDuplicates
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_allowsDuplicates);
}

- (void)setAllowsDuplicates:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_allowsDuplicates) = a3;
}

- (NSString)extensionPointIdentifier
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _EXQuery *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  sub_190C6D76C((uint64_t)v3, (uint64_t)v12);
  v4 = v13;
  v5 = v14;
  __swift_project_boxed_opaque_existential_2Tm(v12, v13);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(v4, v5);
  v9 = v8;
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v12);

  if (!v9)
    return (NSString *)0;
  v10 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (void)setExtensionPointIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _EXQuery *v11;

  if (a3)
  {
    v4 = sub_190CA85F0();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  v8 = *((_QWORD *)v7 + 3);
  v9 = *((_QWORD *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
  v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();

}

- (unsigned)platform
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _EXQuery *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  sub_190C6D76C((uint64_t)v3, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_2Tm(v9, v10);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  LODWORD(v3) = v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v9);

  return v3;
}

- (void)setPlatform:(unsigned int)a3
{
  uint64_t v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  _EXQuery *v9;

  v3 = *(_QWORD *)&a3;
  v5 = (char *)self + OBJC_IVAR____EXQuery_inner;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (BOOL)excludeLockedApps
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_excludeLockedApps);
}

- (void)setExcludeLockedApps:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____EXQuery_excludeLockedApps) = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXQuery *v5;

  v4 = a3;
  v5 = self;
  sub_190C748A4(v4);

}

- (_EXQuery)initWithCoder:(id)a3
{
  id v3;
  _EXQuery *v4;

  v3 = a3;
  v4 = (_EXQuery *)sub_190C77420(v3);

  return v4;
}

- (id)copyWithZone:(void *)a3
{
  _EXQuery *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_190C74CD0(v6);

  __swift_project_boxed_opaque_existential_2Tm(v6, v6[3]);
  v4 = (void *)sub_190CA8BC0();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v6);
  return v4;
}

- (BOOL)matches:(id)a3
{
  id v4;
  _EXQuery *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_190C74E44(v4);

  return self & 1;
}

- (BOOL)matchesRecord:(id)a3
{
  id v4;
  _EXQuery *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_190C74FE0(v4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  _EXQuery *v4;
  _EXQuery *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190CA8908();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_190C7524C((uint64_t)v8);

  sub_190C459C8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _EXQuery *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_190C75708();

  return v3;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)self + OBJC_IVAR____EXQuery_inner);

}

+ (id)executeQuery:(id)a3
{
  uint64_t inited;
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD98DC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_190CADDD0;
  *(_QWORD *)(inited + 32) = a3;
  v9 = inited;
  sub_190CA86D4();
  v5 = a3;
  v6 = sub_190C73A44(v9);
  swift_bridgeObjectRelease();
  sub_190C883D4(v6);

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE20BCB8);
  v7 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return v7;
}

+ (void)executeQuery:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD98DC0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_190CADDD0;
  *(_QWORD *)(v7 + 32) = a3;
  v10 = v7;
  sub_190CA86D4();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_190C77CB4;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = a3;
  swift_retain();
  sub_190C73B98(v10, (uint64_t)sub_190C777D8, v8);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (id)executeQueries:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  void *v5;

  type metadata accessor for _EXQuery();
  v3 = sub_190CA86BC();
  v4 = sub_190C73A44(v3);
  sub_190C883D4(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE20BCB8);
  v5 = (void *)sub_190CA86B0();
  swift_bridgeObjectRelease();
  return v5;
}

+ (void)executeQueries:(id)a3 completionHandler:(id)a4
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = _Block_copy(a4);
  type metadata accessor for _EXQuery();
  v5 = sub_190CA86BC();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_190C777AC;
  *(_QWORD *)(v7 + 24) = v6;
  swift_retain();
  sub_190C73B98(v5, (uint64_t)sub_190C77CC4, v7);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
