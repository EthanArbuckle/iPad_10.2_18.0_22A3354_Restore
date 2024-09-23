@implementation _DPPrio3SumVectorShim

+ (BOOL)isValidVDAFType:(unsigned int)a3
{
  return a3 == -61437;
}

- (_DPPrio3SumVectorShim)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return -[_DPPrio3SumVectorShim init](&v3, sel_init);
}

+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id result;
  id v11;
  id v12;

  if (*(_DWORD *)((char *)a4 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType) == -61437)
  {
    v6 = a3;
    v7 = a4;
    sub_1D3FFF470(v6);
    v9 = v8;

    return v9;
  }
  else
  {
    v11 = a3;
    v12 = a4;
    result = (id)sub_1D40058D8();
    __break(1u);
  }
  return result;
}

+ (BOOL)isValidNumOfProofs:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

@end
