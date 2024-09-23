@implementation JSBagObject

- (id)BOOLean:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2C590);
}

- (void)registerBagKeys:(id)a3
{
  void *v5;
  id v6;
  _TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject *v7;
  id v8;
  void *v9;
  id v10;
  _TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject *v11;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    v10 = v6;
    v11 = v7;

  }
  else
  {
    sub_19CFE0340();
    __break(1u);
  }
}

- (id)array:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2CAA4);
}

- (id)string:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2CE94);
}

- (id)url:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2D280);
}

- (id)dictionary:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2D75C);
}

- (id)double:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CD2D8E8);
}

- (id)integer:(id)a3
{
  return sub_19CD2C3BC(self, (uint64_t)a2, a3, (uint64_t (*)(void *, id, id))sub_19CE03D94);
}

- (_TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject)init
{
  _TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject *result;

  result = (_TtC9JetEngineP33_CD4A13C520117F75F11731052EDCF02B11JSBagObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
