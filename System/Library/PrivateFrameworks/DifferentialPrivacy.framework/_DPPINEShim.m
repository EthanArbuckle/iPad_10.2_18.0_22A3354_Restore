@implementation _DPPINEShim

- (_DPPINEShim)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PINEShim();
  return -[_DPPINEShim init](&v3, sel_init);
}

+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id result;
  id v10;
  id v11;

  if (*(_DWORD *)((char *)a4 + OBJC_IVAR____DPPINEParameter_pineType) == -61436)
  {
    v6 = a3;
    v7 = a4;
    v8 = (void *)sub_1D3FFCAA0(v6, (uint64_t)v7);

    return v8;
  }
  else
  {
    v10 = a3;
    v11 = a4;
    result = (id)sub_1D40058D8();
    __break(1u);
  }
  return result;
}

+ (BOOL)isValidPINEType:(unint64_t)a3
{
  if (HIDWORD(a3))
    __break(1u);
  else
    LOBYTE(a1) = a3 == 4294905860;
  return (char)a1;
}

+ (BOOL)isValidNumOfProofs:(unint64_t)a3
{
  return a3 - 2 < 3;
}

@end
