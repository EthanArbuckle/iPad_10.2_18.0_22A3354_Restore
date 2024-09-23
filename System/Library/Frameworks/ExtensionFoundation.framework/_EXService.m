@implementation _EXService

- (_EXService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXService();
  return -[_EXService init](&v3, sel_init);
}

+ (id)runAsXPCService
{
  char **v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id (*v13)(void *);
  uint64_t v14;

  v13 = sub_190C6E144;
  v14 = 0;
  v1 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 1107296256;
  v11 = sub_190C28AF8;
  v12 = &block_descriptor_59;
  v2 = _Block_copy(&v9);
  v3 = (id)objc_opt_self();
  v4 = objc_msgSend(v3, sel_listenerWithConfigurator_, v2);
  _Block_release(v2);
  swift_release();
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
    goto LABEL_5;
  v0 = &selRef__UUID;
  objc_msgSend(v4, sel_activate);
  v13 = sub_190C6E158;
  v14 = 0;
  v9 = v1;
  v10 = 1107296256;
  v11 = sub_190C28AF8;
  v12 = &block_descriptor_62;
  v5 = _Block_copy(&v9);
  v6 = objc_msgSend(v3, sel_listenerWithConfigurator_, v5);
  _Block_release(v5);
  swift_release();
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(v6, sel_activate);
  v13 = sub_190C6E174;
  v14 = 0;
  v9 = v1;
  v10 = 1107296256;
  v11 = sub_190C28AF8;
  v12 = &block_descriptor_65;
  v7 = _Block_copy(&v9);
  v3 = objc_msgSend(v3, sel_listenerWithConfigurator_, v7);
  _Block_release(v7);
  swift_release();
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v3, v0[116]);
  result = objc_msgSend((id)objc_opt_self(), sel_activateXPCService);
  __break(1u);
  return result;
}

@end
