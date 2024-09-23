uint64_t symbols_fall_2024_os_versions()
{
  return 0x7E80000FFFFFFFFLL;
}

void SymbolEffectConfiguration.Effect.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_2353BF8C4()
{
  char v0;

  sub_2353C6B20();
  if (v0 != 2)
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t static PulseSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  _BOOL4 v5;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 2)
  {
    if (v3 == 2)
      return 1;
  }
  else
  {
    v5 = (v2 & 1) == 0;
    if (v3 != 2 && ((v5 ^ v3) & 1) != 0)
      return 1;
  }
  return 0;
}

uint64_t static BounceSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

uint64_t static ScaleSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

uint64_t static AppearSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

uint64_t static DisappearSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

uint64_t static AutomaticSymbolEffect.== infix(_:_:)()
{
  return 1;
}

uint64_t static RotateSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

uint64_t static MagicReplaceSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

uint64_t SymbolEffectConfiguration.Effect.hashValue.getter()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353BFBDC()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353BFC38()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

void SymbolEffectConfiguration.effect.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;
  char v3;

  v2 = *(_WORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 10);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 10) = v3;
}

uint64_t SymbolEffectConfiguration.effect.setter(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  char v3;

  v2 = *(_WORD *)(result + 8);
  v3 = *(_BYTE *)(result + 10);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_WORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 10) = v3;
  return result;
}

uint64_t (*SymbolEffectConfiguration.effect.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectConfiguration.init(effect:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  __int16 v2;
  char v3;

  v2 = *(_WORD *)(result + 8);
  v3 = *(_BYTE *)(result + 10);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_WORD *)(a2 + 8) = v2;
  *(_BYTE *)(a2 + 10) = v3;
  return result;
}

void SymbolEffectConfiguration.hash(into:)()
{
  SymbolEffectConfiguration.Effect.hash(into:)();
}

uint64_t static SymbolEffectConfiguration.== infix(_:_:)(uint64_t *a1)
{
  __int16 v1;
  char v2;
  char v3;
  uint64_t v5;
  __int16 v6;
  char v7;

  v1 = *((_WORD *)a1 + 4);
  v2 = *((_BYTE *)a1 + 10);
  v5 = *a1;
  v6 = v1;
  v7 = v2;
  _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0((uint64_t)&v5);
  return v3 & 1;
}

uint64_t SymbolEffectConfiguration.hashValue.getter()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353BFDF0()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

void sub_2353BFE50()
{
  SymbolEffectConfiguration.Effect.hash(into:)();
}

uint64_t sub_2353BFE90()
{
  sub_2353C6B14();
  SymbolEffectConfiguration.Effect.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353BFEEC(uint64_t *a1)
{
  __int16 v1;
  char v2;
  char v3;
  uint64_t v5;
  __int16 v6;
  char v7;

  v1 = *((_WORD *)a1 + 4);
  v2 = *((_BYTE *)a1 + 10);
  v5 = *a1;
  v6 = v1;
  v7 = v2;
  _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0((uint64_t)&v5);
  return v3 & 1;
}

void SymbolEffectConfiguration.rbAnimation.getter()
{
  __asm { BR              X12 }
}

uint64_t sub_2353BFF74()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 4) = 0;
  return 6;
}

uint64_t SymbolEffectConfiguration.rbOptions(with:)(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  char v4;
  char v5;
  int v6;
  double v7;
  char v8;
  __int16 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  uint64_t v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  float v23;
  id v24;
  char v25;
  id *v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  char v30;
  id *v31;
  id v32;
  unint64_t v33;
  char v34;
  int v35;
  id v36;
  id v37;
  char v38;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;

  v2 = *(double *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 17);
  v6 = *(unsigned __int8 *)(a1 + 18);
  v7 = *(double *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_WORD *)(v1 + 8);
  v10 = *(unsigned __int8 *)(v1 + 10);
  *(_QWORD *)&v41 = *(_QWORD *)v1;
  WORD4(v41) = v9;
  BYTE10(v41) = v10;
  SymbolEffectConfiguration.rbOptions.getter();
  v12 = v11;
  v13 = (void *)*MEMORY[0x24BE7F368];
  v14 = v2;
  v15 = MEMORY[0x24BEE14E8];
  *((_QWORD *)&v42 + 1) = MEMORY[0x24BEE14E8];
  *(float *)&v41 = v14;
  sub_2353C429C(&v41, v40);
  v16 = v13;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_2353C39D4(v40, v16, isUniquelyReferenced_nonNull_native);
  v18 = v12;

  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    if ((v8 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)*MEMORY[0x24BE7F348];
    *((_QWORD *)&v42 + 1) = v15;
    if ((v4 & 1) != 0)
      LODWORD(v41) = 2139095040;
    else
      *(float *)&v41 = (float)v3;
    sub_2353C429C(&v41, v40);
    v20 = v19;
    v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_2353C39D4(v40, v20, v21);

    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      if (!v6)
        return v18;
      goto LABEL_10;
    }
  }
  v22 = (void *)*MEMORY[0x24BE7F350];
  v23 = v7;
  *((_QWORD *)&v42 + 1) = v15;
  *(float *)&v41 = v23;
  sub_2353C429C(&v41, v40);
  v24 = v22;
  v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_2353C39D4(v40, v24, v25);

  swift_bridgeObjectRelease();
  if (!v6)
    return v18;
LABEL_10:
  switch(v10)
  {
    case 1:
      v31 = (id *)MEMORY[0x24BE7F318];
      if (!*(_QWORD *)(v18 + 16))
      {
LABEL_20:
        v41 = 0u;
        v42 = 0u;
        goto LABEL_25;
      }
LABEL_17:
      v32 = *v31;
      v33 = sub_2353C34A8((uint64_t)v32);
      if ((v34 & 1) != 0)
      {
        sub_2353C432C(*(_QWORD *)(v18 + 56) + 32 * v33, (uint64_t)&v41);
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
      }

      if (*((_QWORD *)&v42 + 1))
      {
        if (swift_dynamicCast())
        {
          v35 = LODWORD(v40[0]) | 0x10;
LABEL_27:
          v36 = *v31;
          *((_QWORD *)&v42 + 1) = MEMORY[0x24BEE44F0];
LABEL_36:
          LODWORD(v41) = v35;
          sub_2353C429C(&v41, v40);
          v37 = v36;
          v38 = swift_isUniquelyReferenced_nonNull_native();
          sub_2353C39D4(v40, v37, v38);

          swift_bridgeObjectRelease();
          return v18;
        }
LABEL_26:
        v35 = 16;
        goto LABEL_27;
      }
LABEL_25:
      sub_2353C42AC((uint64_t)&v41);
      goto LABEL_26;
    case 9:
      v31 = (id *)MEMORY[0x24BE7F360];
      if (!*(_QWORD *)(v18 + 16))
        goto LABEL_20;
      goto LABEL_17;
    case 8:
      v26 = (id *)MEMORY[0x24BE7F388];
      v27 = MEMORY[0x24BEE44F0];
      if (*(_QWORD *)(v18 + 16))
      {
        v28 = (id)*MEMORY[0x24BE7F388];
        v29 = sub_2353C34A8((uint64_t)v28);
        if ((v30 & 1) != 0)
        {
          sub_2353C432C(*(_QWORD *)(v18 + 56) + 32 * v29, (uint64_t)&v41);
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
        }

        if (*((_QWORD *)&v42 + 1))
        {
          if (swift_dynamicCast())
          {
            v35 = LODWORD(v40[0]) | 0x100;
LABEL_35:
            v36 = *v26;
            *((_QWORD *)&v42 + 1) = v27;
            goto LABEL_36;
          }
LABEL_34:
          v35 = 256;
          goto LABEL_35;
        }
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
      }
      sub_2353C42AC((uint64_t)&v41);
      goto LABEL_34;
  }
  return v18;
}

void SymbolEffectConfiguration.rbOptions.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 10);
  sub_2353C0B20(MEMORY[0x24BEE4AF8]);
  __asm { BR              X9 }
}

uint64_t sub_2353C0414()
{
  uint64_t v0;
  char v1;
  void *v2;
  id v3;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  if (v1 != 2)
  {
    v2 = (void *)*MEMORY[0x24BE7F328];
    v8 = MEMORY[0x24BEE1328];
    LOBYTE(v7) = v1 & 1;
    sub_2353C429C(&v7, v6);
    v3 = v2;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2353C39D4(v6, v3, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  return v0;
}

unint64_t sub_2353C0B20(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25622D798);
  v2 = sub_2353C6AE4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2353C5B24(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_2353C34A8(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_2353C429C(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Symbols::PulseSymbolEffect __swiftcall PulseSymbolEffect.init()()
{
  _BYTE *v0;
  Symbols::PulseSymbolEffect result;

  *v0 = 2;
  return result;
}

uint64_t PulseSymbolEffect.isLayered.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PulseSymbolEffect.isLayered.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PulseSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void PulseSymbolEffect.byLayer.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void PulseSymbolEffect.wholeSymbol.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void PulseSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 0;
}

uint64_t PulseSymbolEffect.hash(into:)()
{
  _BYTE *v0;

  if (*v0 != 2)
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t PulseSymbolEffect.hashValue.getter()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_2353C6B14();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C0D38(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 0;
}

uint64_t sub_2353C0D4C()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_2353C6B14();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B44();
}

uint64_t sub_2353C0DB0()
{
  _BYTE *v0;

  if (*v0 != 2)
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t sub_2353C0DF8()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  sub_2353C6B14();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B44();
}

BOOL sub_2353C0E58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if (v2 != 2)
  {
    v4 = (v2 & 1) == 0;
    return v3 != 2 && ((v4 ^ v3) & 1) != 0;
  }
  return v3 == 2;
}

uint64_t BounceSymbolEffect.isUp.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t (*BounceSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*BounceSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t BounceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(1, a1);
}

void sub_2353C0ED4(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 1;
}

uint64_t sub_2353C0EF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2353C41A8(a1, a2) & 1;
}

Symbols::VariableColorSymbolEffect __swiftcall VariableColorSymbolEffect.init()()
{
  uint64_t v0;
  Symbols::VariableColorSymbolEffect result;

  *(_WORD *)v0 = 514;
  *(_BYTE *)(v0 + 2) = 2;
  return result;
}

uint64_t VariableColorSymbolEffect.isReversing.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t VariableColorSymbolEffect.isReversing.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.isReversing.modify())()
{
  return nullsub_1;
}

uint64_t VariableColorSymbolEffect.isIterative.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t VariableColorSymbolEffect.isIterative.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.isIterative.modify())()
{
  return nullsub_1;
}

uint64_t VariableColorSymbolEffect.hasReveal.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t VariableColorSymbolEffect.hasReveal.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.hasReveal.modify())()
{
  return nullsub_1;
}

void VariableColorSymbolEffect.reversing.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  v2 = *(_WORD *)(v1 + 1);
  *(_BYTE *)a1 = 1;
  *(_WORD *)(a1 + 1) = v2;
}

void VariableColorSymbolEffect.nonReversing.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  v2 = *(_WORD *)(v1 + 1);
  *(_BYTE *)a1 = 0;
  *(_WORD *)(a1 + 1) = v2;
}

void VariableColorSymbolEffect.cumulative.getter(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v2 = v1[2];
  *(_WORD *)a1 = *v1;
  *(_BYTE *)(a1 + 2) = v2;
}

void VariableColorSymbolEffect.iterative.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  char v2;

  v2 = v1[2];
  *a1 = *v1;
  a1[1] = 1;
  a1[2] = v2;
}

void VariableColorSymbolEffect.hideInactiveLayers.getter(uint64_t a1@<X8>)
{
  _WORD *v1;

  *(_WORD *)a1 = *v1;
  *(_BYTE *)(a1 + 2) = 1;
}

void VariableColorSymbolEffect.dimInactiveLayers.getter(uint64_t a1@<X8>)
{
  _WORD *v1;

  *(_WORD *)a1 = *v1;
  *(_BYTE *)(a1 + 2) = 0;
}

void VariableColorSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 2) << 16);
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 2;
}

uint64_t VariableColorSymbolEffect.hash(into:)()
{
  _BYTE *v0;
  int v1;
  int v2;

  v1 = v0[1];
  v2 = v0[2];
  if (*v0 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  if (v2 != 2)
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t VariableColorSymbolEffect.hashValue.getter()
{
  sub_2353C6B14();
  VariableColorSymbolEffect.hash(into:)();
  return sub_2353C6B44();
}

void sub_2353C1110(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 2) << 16);
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 2;
}

uint64_t sub_2353C1130()
{
  sub_2353C6B14();
  VariableColorSymbolEffect.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353C1184()
{
  sub_2353C6B14();
  VariableColorSymbolEffect.hash(into:)();
  return sub_2353C6B44();
}

Symbols::ScaleSymbolEffect __swiftcall ScaleSymbolEffect.init()()
{
  _WORD *v0;
  Symbols::ScaleSymbolEffect result;

  *v0 = 514;
  return result;
}

uint64_t ScaleSymbolEffect.isUp.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ScaleSymbolEffect.isUp.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ScaleSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t ScaleSymbolEffect.isLayered.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ScaleSymbolEffect.isLayered.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*ScaleSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void ScaleSymbolEffect.up.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 1);
  *a1 = 1;
  a1[1] = v2;
}

void ScaleSymbolEffect.down.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 1);
  *a1 = 0;
  a1[1] = v2;
}

void ScaleSymbolEffect.byLayer.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
  a1[1] = 1;
}

void ScaleSymbolEffect.wholeSymbol.getter(_WORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t ScaleSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(3, a1);
}

void sub_2353C1278(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 3;
}

uint64_t AppearSymbolEffect.isUp.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t (*AppearSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*AppearSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t AppearSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(4, a1);
}

void sub_2353C12C8(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 4;
}

uint64_t DisappearSymbolEffect.isUp.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t (*DisappearSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*DisappearSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t DisappearSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(5, a1);
}

void sub_2353C1318(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 5;
}

Symbols::ReplaceSymbolEffect __swiftcall ReplaceSymbolEffect.init()()
{
  _WORD *v0;
  Symbols::ReplaceSymbolEffect result;

  *v0 = 515;
  return result;
}

BOOL static ReplaceSymbolEffect.ReplaceStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ReplaceSymbolEffect.ReplaceStyle.hash(into:)()
{
  return sub_2353C6B20();
}

uint64_t ReplaceSymbolEffect.ReplaceStyle.hashValue.getter()
{
  sub_2353C6B14();
  sub_2353C6B20();
  return sub_2353C6B44();
}

BOOL sub_2353C13BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2353C13D0()
{
  sub_2353C6B14();
  sub_2353C6B20();
  return sub_2353C6B44();
}

uint64_t sub_2353C1414()
{
  return sub_2353C6B20();
}

uint64_t sub_2353C143C()
{
  sub_2353C6B14();
  sub_2353C6B20();
  return sub_2353C6B44();
}

uint64_t (*ReplaceSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t (*ReplaceSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void ReplaceSymbolEffect.offUp.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 1);
  *a1 = 2;
  a1[1] = v2;
}

uint64_t ReplaceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(6, a1);
}

uint64_t ReplaceSymbolEffect.hash(into:)()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v1 == 2)
      return sub_2353C6B2C();
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v1 != 2)
LABEL_3:
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t ReplaceSymbolEffect.hashValue.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C15D4(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 6;
}

uint64_t sub_2353C15F0()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v1 == 2)
      return sub_2353C6B2C();
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v1 != 2)
LABEL_3:
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t sub_2353C166C()
{
  unsigned __int8 *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void AutomaticSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 7;
}

uint64_t AutomaticSymbolEffect.hashValue.getter()
{
  sub_2353C6B14();
  return sub_2353C6B44();
}

void sub_2353C175C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 7;
}

uint64_t sub_2353C1770()
{
  sub_2353C6B14();
  return sub_2353C6B44();
}

uint64_t sub_2353C17A4()
{
  sub_2353C6B14();
  return sub_2353C6B44();
}

uint64_t sub_2353C17D4()
{
  return 1;
}

void WiggleSymbolEffect.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 767;
}

uint64_t WiggleSymbolEffect.WiggleStyle.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) && *(_BYTE *)(v0 + 8) == 1)
  {
    sub_2353C6B20();
    return sub_2353C6B38();
  }
  else
  {
    sub_2353C6B20();
    return sub_2353C6B2C();
  }
}

uint64_t WiggleSymbolEffect.WiggleStyle.hashValue.getter()
{
  sub_2353C6B14();
  WiggleSymbolEffect.WiggleStyle.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353C18A4()
{
  sub_2353C6B14();
  WiggleSymbolEffect.WiggleStyle.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353C18F8()
{
  sub_2353C6B14();
  WiggleSymbolEffect.WiggleStyle.hash(into:)();
  return sub_2353C6B44();
}

void WiggleSymbolEffect.style.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t WiggleSymbolEffect.style.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*WiggleSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t WiggleSymbolEffect.isLayered.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t WiggleSymbolEffect.isLayered.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 9) = result;
  return result;
}

uint64_t (*WiggleSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void WiggleSymbolEffect.clockwise.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 1;
  *(_BYTE *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.counterClockwise.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.left.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0x4066800000000000;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.right.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.up.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0xC056800000000000;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.down.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0x4056800000000000;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.forward.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 1;
  *(_BYTE *)(a1 + 8) = 2;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.backward.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 9);
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 2;
  *(_BYTE *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.custom(angle:)(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
  char v3;

  v3 = *(_BYTE *)(v2 + 9);
  *(double *)a1 = a2;
  *(_BYTE *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 9) = v3;
}

void WiggleSymbolEffect.byLayer.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 9) = 1;
}

void WiggleSymbolEffect.wholeSymbol.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned __int8 v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_WORD *)(a1 + 8) = v2;
}

void WiggleSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  v2 = *(_WORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 10) = 8;
}

uint64_t WiggleSymbolEffect.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 9);
  if (*(unsigned __int8 *)(v0 + 8) == 255)
  {
    sub_2353C6B2C();
    if (v1 == 2)
      return sub_2353C6B2C();
  }
  else
  {
    sub_2353C6B2C();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v1 == 2)
      return sub_2353C6B2C();
  }
  sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t WiggleSymbolEffect.hashValue.getter()
{
  uint64_t v0;
  int v1;
  int v2;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 9);
  sub_2353C6B14();
  if (v1 == 255)
  {
    sub_2353C6B2C();
    if (v2 == 2)
      goto LABEL_6;
  }
  else
  {
    sub_2353C6B2C();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v2 == 2)
      goto LABEL_6;
  }
  sub_2353C6B2C();
LABEL_6:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C1C30(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  v2 = *(_WORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 10) = 8;
}

uint64_t sub_2353C1C54()
{
  uint64_t v0;
  int v1;
  int v2;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 9);
  sub_2353C6B14();
  if (v1 == 255)
  {
    sub_2353C6B2C();
    if (v2 == 2)
      goto LABEL_6;
  }
  else
  {
    sub_2353C6B2C();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v2 == 2)
      goto LABEL_6;
  }
  sub_2353C6B2C();
LABEL_6:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

uint64_t RotateSymbolEffect.isClockwise.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t (*RotateSymbolEffect.isClockwise.modify())()
{
  return nullsub_1;
}

uint64_t (*RotateSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t RotateSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(9, a1);
}

uint64_t _s7Symbols18BounceSymbolEffectV4hash4intoys6HasherVz_tF_0()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  if (v1 != 2)
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t _s7Symbols18BounceSymbolEffectV9hashValueSivg_0()
{
  unsigned __int8 *v0;
  int v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  if (v2 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C1E50(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 9;
}

uint64_t sub_2353C1E68()
{
  unsigned __int8 *v0;
  int v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  if (v2 != 2)
    sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B44();
}

BOOL static BreatheSymbolEffect.BreatheStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t BreatheSymbolEffect.BreatheStyle.hash(into:)()
{
  return sub_2353C6B20();
}

uint64_t BreatheSymbolEffect.BreatheStyle.hashValue.getter()
{
  sub_2353C6B14();
  sub_2353C6B20();
  return sub_2353C6B44();
}

BOOL sub_2353C1F84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void BreatheSymbolEffect.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *BreatheSymbolEffect.style.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*BreatheSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t (*BreatheSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t BreatheSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(10, a1);
}

uint64_t BreatheSymbolEffect.hash(into:)()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 2)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v1 == 2)
      return sub_2353C6B2C();
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v1 != 2)
LABEL_3:
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t BreatheSymbolEffect.hashValue.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 2)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C2104(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 10;
}

uint64_t sub_2353C2124()
{
  unsigned __int8 *v0;
  int v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 2)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

uint64_t (*MagicReplaceSymbolEffect.fallback.modify())()
{
  return nullsub_1;
}

void static MagicReplaceSymbolEffect.replace.getter(_WORD *a1@<X8>)
{
  *a1 = 515;
}

uint64_t MagicReplaceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(11, a1);
}

uint64_t MagicReplaceSymbolEffect.hash(into:)()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v1 == 2)
      return sub_2353C6B2C();
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v1 != 2)
LABEL_3:
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t MagicReplaceSymbolEffect.hashValue.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

uint64_t sub_2353C2318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

void ReplaceSymbolEffect.MagicReplace.fallback.getter(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

_WORD *sub_2353C233C@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_WORD *sub_2353C2348(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  return result;
}

_WORD *ReplaceSymbolEffect.MagicReplace.fallback.setter(_WORD *result)
{
  _WORD *v1;

  *v1 = *result;
  return result;
}

uint64_t (*ReplaceSymbolEffect.MagicReplace.fallback.modify(uint64_t a1))(uint64_t result)
{
  _WORD *v1;

  *(_QWORD *)a1 = v1;
  *(_WORD *)(a1 + 8) = *v1;
  return sub_2353C237C;
}

uint64_t sub_2353C237C(uint64_t result)
{
  **(_WORD **)result = *(_WORD *)(result + 8);
  return result;
}

uint64_t ReplaceSymbolEffect.MagicReplace.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2353C2394(11, a1);
}

uint64_t sub_2353C2394@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned __int16 *v2;

  *(_QWORD *)a2 = *v2;
  *(_WORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 10) = result;
  return result;
}

uint64_t ReplaceSymbolEffect.MagicReplace.hash(into:)()
{
  _BYTE *v0;
  int v1;

  v1 = v0[1];
  if (*v0 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v1 == 2)
      return sub_2353C6B2C();
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v1 != 2)
LABEL_3:
    sub_2353C6B2C();
  return sub_2353C6B2C();
}

uint64_t static ReplaceSymbolEffect.MagicReplace.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

uint64_t ReplaceSymbolEffect.MagicReplace.hashValue.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = v0[1];
  sub_2353C6B14();
  if (v1 != 3)
  {
    sub_2353C6B2C();
    sub_2353C6B20();
    if (v2 == 2)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2353C6B2C();
  if (v2 != 2)
LABEL_3:
    sub_2353C6B2C();
LABEL_5:
  sub_2353C6B2C();
  return sub_2353C6B44();
}

void sub_2353C24DC(uint64_t a1@<X8>)
{
  unsigned __int16 *v1;

  *(_QWORD *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 10) = 11;
}

Symbols::MagicReplaceSymbolEffect __swiftcall ReplaceSymbolEffect.magic(fallback:)(Symbols::MagicReplaceSymbolEffect fallback)
{
  _WORD *v1;

  *v1 = **(_WORD **)&fallback.fallback.style.value;
  return fallback;
}

Symbols::ReplaceSymbolEffect::MagicReplace __swiftcall ReplaceSymbolEffect.magic(fallback:)(Symbols::ReplaceSymbolEffect::MagicReplace fallback)
{
  _WORD *v1;

  *v1 = **(_WORD **)&fallback._backing.fallback.style.value;
  return fallback;
}

void static ReplaceSymbolEffect.downUp.getter(_WORD *a1@<X8>)
{
  *a1 = 512;
}

void static ReplaceSymbolEffect.upUp.getter(_WORD *a1@<X8>)
{
  *a1 = 513;
}

void static ReplaceSymbolEffect.offUp.getter(_WORD *a1@<X8>)
{
  *a1 = 514;
}

id sub_2353C2538(uint64_t *a1)
{
  id v1;
  uint64_t v2;
  int v3;
  id v4;
  BOOL v5;
  void *v6;
  char **v7;
  uint64_t v8;
  uint64_t v9;

  v1 = 0;
  v2 = *a1;
  switch(*((_BYTE *)a1 + 10))
  {
    case 0:
      v3 = *a1;
      v4 = objc_msgSend((id)objc_opt_self(), sel_effect);
      v1 = v4;
      v5 = (v2 & 1) == 0;
      goto LABEL_15;
    case 1:
      v1 = BounceSymbolEffect.objcRepresentation.getter();
      break;
    case 2:
      v1 = VariableColorSymbolEffect.objcRepresentation.getter();
      break;
    case 3:
      v1 = ScaleSymbolEffect.objcRepresentation.getter();
      break;
    case 4:
      v1 = AppearSymbolEffect.objcRepresentation.getter();
      break;
    case 5:
      v1 = DisappearSymbolEffect.objcRepresentation.getter();
      break;
    case 8:
      v1 = WiggleSymbolEffect.objcRepresentation.getter();
      break;
    case 9:
      v1 = RotateSymbolEffect.objcRepresentation.getter();
      break;
    case 0xA:
      v3 = BYTE1(v2);
      if (*a1 == 2)
      {
        v6 = (void *)objc_opt_self();
        v7 = &selRef_effect;
      }
      else
      {
        v6 = (void *)objc_opt_self();
        v7 = &selRef_breatheByScalingEffect;
        if ((v2 & 1) == 0)
          v7 = &selRef_breatheByDimmingEffect;
      }
      v4 = objc_msgSend(v6, *v7);
      v1 = v4;
      v5 = (v2 & 0x100) == 0;
LABEL_15:
      v8 = 1;
      if (v5)
        v8 = 2;
      if (v3 == 2)
        v9 = 0;
      else
        v9 = v8;
      objc_msgSend(v4, sel_set_layerBehavior_, v9);
      break;
    default:
      return v1;
  }
  return v1;
}

id BounceSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_bounceUpEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_bounceDownEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id PulseSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_effect);
  v3 = v2;
  v4 = 1;
  if ((v1 & 1) == 0)
    v4 = 2;
  if (v1 == 2)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(v2, sel_set_layerBehavior_, v5);
  return v3;
}

id ScaleSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_scaleUpEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_scaleDownEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

void *VariableColorSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = objc_msgSend((id)objc_opt_self(), sel_effect);
  v5 = v4;
  if (v2 == 2)
  {
    if (v1 == 2)
      goto LABEL_3;
  }
  else
  {
    if ((v2 & 1) != 0)
      v8 = 1;
    else
      v8 = 2;
    objc_msgSend(v4, sel_set_fillStyle_, v8);
    if (v1 == 2)
    {
LABEL_3:
      if (v3 == 2)
        return v5;
      goto LABEL_4;
    }
  }
  if ((v1 & 1) != 0)
    v9 = 1;
  else
    v9 = 2;
  objc_msgSend(v5, sel_set_playbackStyle_, v9);
  if (v3 != 2)
  {
LABEL_4:
    if ((v3 & 1) != 0)
      v6 = 1;
    else
      v6 = 2;
    objc_msgSend(v5, sel_set_inactiveStyle_, v6);
  }
  return v5;
}

id AppearSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_appearUpEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_appearDownEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id DisappearSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_disappearUpEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_disappearDownEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id WiggleSymbolEffect.objcRepresentation.getter()
{
  uint64_t v0;
  double v1;
  int v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(double *)v0;
  v2 = *(unsigned __int8 *)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 9);
  if (v2 > 1)
  {
    if (v2 == 2)
    {
      v6 = (void *)objc_opt_self();
      if ((LOBYTE(v1) & 1) != 0)
        v5 = objc_msgSend(v6, sel_wiggleForwardEffect);
      else
        v5 = objc_msgSend(v6, sel_wiggleBackwardEffect);
    }
    else
    {
      v5 = objc_msgSend((id)objc_opt_self(), sel_effect);
    }
  }
  else
  {
    if (v2)
    {
      v7 = v1;
      v8 = objc_msgSend((id)objc_opt_self(), sel_effect);
      objc_msgSend(v8, sel_set_style_, 3);
      objc_msgSend(v8, sel_set_angle_, v7);

      goto LABEL_13;
    }
    v4 = (void *)objc_opt_self();
    if ((LOBYTE(v1) & 1) != 0)
      v5 = objc_msgSend(v4, sel_wiggleClockwiseEffect);
    else
      v5 = objc_msgSend(v4, sel_wiggleCounterClockwiseEffect);
  }
  v8 = v5;
LABEL_13:
  v9 = 1;
  if ((v3 & 1) == 0)
    v9 = 2;
  if (v3 == 2)
    v10 = 0;
  else
    v10 = v9;
  objc_msgSend(v8, sel_set_layerBehavior_, v10);
  return v8;
}

id RotateSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_rotateClockwiseEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_rotateCounterClockwiseEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id BreatheSymbolEffect.objcRepresentation.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  if (v1 == 2)
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_effect;
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = &selRef_breatheByScalingEffect;
    if ((v1 & 1) == 0)
      v4 = &selRef_breatheByDimmingEffect;
  }
  v5 = objc_msgSend(v3, *v4);
  v6 = v5;
  v7 = 1;
  if ((v2 & 1) == 0)
    v7 = 2;
  if (v2 == 2)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id sub_2353C2D34(unint64_t *a1)
{
  unint64_t v1;
  int v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *a1;
  v2 = *((unsigned __int8 *)a1 + 10);
  switch(v2)
  {
    case 11:
      v7 = v1 >> 8;
      v8 = BYTE1(v1);
      v9 = (void *)objc_opt_self();
      v10 = objc_msgSend(v9, *off_250689180[(char)v1]);
      v11 = v10;
      v12 = 1;
      if ((v7 & 1) == 0)
        v12 = 2;
      if (v8 == 2)
        v13 = 0;
      else
        v13 = v12;
      objc_msgSend(v10, sel_set_layerBehavior_, v13);
      v4 = objc_msgSend(v9, sel_magicTransitionWithFallback_, v11);

      break;
    case 7:
      return objc_msgSend((id)objc_opt_self(), sel_transition);
    case 6:
      v3 = objc_msgSend((id)objc_opt_self(), *off_250689180[(char)v1]);
      v4 = v3;
      v5 = 1;
      if (((v1 >> 8) & 1) == 0)
        v5 = 2;
      if (BYTE1(v1) == 2)
        v6 = 0;
      else
        v6 = v5;
      objc_msgSend(v3, sel_set_layerBehavior_, v6);
      break;
    default:
      return 0;
  }
  return v4;
}

id ReplaceSymbolEffect.objcRepresentation.getter()
{
  char *v0;
  uint64_t v1;
  int v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = objc_msgSend((id)objc_opt_self(), *off_250689180[v1]);
  v4 = v3;
  v5 = 1;
  if ((v2 & 1) == 0)
    v5 = 2;
  if (v2 == 2)
    v6 = 0;
  else
    v6 = v5;
  objc_msgSend(v3, sel_set_layerBehavior_, v6);
  return v4;
}

id MagicReplaceSymbolEffect.objcRepresentation.getter()
{
  char *v0;
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = *v0;
  v2 = v0[1];
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, *off_250689180[v1]);
  v5 = v4;
  v6 = 1;
  if ((v2 & 1) == 0)
    v6 = 2;
  if (v2 == 2)
    v7 = 0;
  else
    v7 = v6;
  objc_msgSend(v4, sel_set_layerBehavior_, v7);
  v8 = objc_msgSend(v3, sel_magicTransitionWithFallback_, v5);

  return v8;
}

id AutomaticSymbolEffect.objcRepresentation.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_transition);
}

uint64_t SymbolEffect.objcEffect.getter(uint64_t a1, uint64_t a2)
{
  return sub_2353C2FD8(a1, a2, (uint64_t (*)(uint64_t *))sub_2353C2538);
}

uint64_t SymbolEffect.objcTransition.getter(uint64_t a1, uint64_t a2)
{
  return sub_2353C2FD8(a1, a2, (uint64_t (*)(uint64_t *))sub_2353C2D34);
}

uint64_t sub_2353C2FD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v5;
  __int16 v6;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 16))(&v8);
  v5 = v8;
  v6 = v9;
  v7 = v10;
  return a3(&v5);
}

id ReplaceSymbolEffect.MagicReplace.objcRepresentation.getter()
{
  char *v0;
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = *v0;
  v2 = v0[1];
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, *off_250689180[v1]);
  v5 = v4;
  v6 = 1;
  if ((v2 & 1) == 0)
    v6 = 2;
  if (v2 == 2)
    v7 = 0;
  else
    v7 = v6;
  objc_msgSend(v4, sel_set_layerBehavior_, v7);
  v8 = objc_msgSend(v3, sel_magicTransitionWithFallback_, v5);

  return v8;
}

void sub_2353C30C8()
{
  dword_25622D7F8 = 12;
}

uint64_t sub_2353C30D8()
{
  uint64_t result;

  result = sub_2353C6A84();
  qword_25622D800 = result;
  return result;
}

uint64_t sub_2353C3114(uint64_t a1, uint64_t a2)
{
  return sub_2353C325C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2353C3120(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2353C6A90();
  *a2 = 0;
  return result;
}

uint64_t sub_2353C3194(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2353C6A9C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2353C3210@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2353C6AA8();
  v2 = sub_2353C6A84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2353C3250(uint64_t a1, uint64_t a2)
{
  return sub_2353C325C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2353C325C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2353C6AA8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2353C3298()
{
  sub_2353C6AA8();
  sub_2353C6AB4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2353C32D8()
{
  uint64_t v0;

  sub_2353C6AA8();
  sub_2353C6B14();
  sub_2353C6AB4();
  v0 = sub_2353C6B44();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2353C3348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2353C6AA8();
  v2 = v1;
  if (v0 == sub_2353C6AA8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2353C6AFC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2353C33D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2353C6A84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2353C3414@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2353C6AA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2353C343C()
{
  sub_2353C5C40(&qword_25622D7D0, (uint64_t)&unk_2353C86C4);
  sub_2353C5C40(&qword_25622D7D8, (uint64_t)&unk_2353C866C);
  return sub_2353C6AF0();
}

unint64_t sub_2353C34A8(uint64_t a1)
{
  uint64_t v2;

  sub_2353C6AA8();
  sub_2353C6B14();
  sub_2353C6AB4();
  v2 = sub_2353C6B44();
  swift_bridgeObjectRelease();
  return sub_2353C3528(a1, v2);
}

unint64_t sub_2353C3528(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2353C6AA8();
    v8 = v7;
    if (v6 == sub_2353C6AA8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2353C6AFC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2353C6AA8();
          v15 = v14;
          if (v13 == sub_2353C6AA8() && v15 == v16)
            break;
          v18 = sub_2353C6AFC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2353C369C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25622D798);
  v35 = a2;
  v6 = sub_2353C6AD8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
        v13 = v20;
      }
    }
LABEL_21:
    v10 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_2353C429C(v22, v36);
    }
    else
    {
      sub_2353C432C((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_2353C6AA8();
    sub_2353C6B14();
    sub_2353C6AB4();
    v24 = sub_2353C6B44();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_2353C429C(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_2353C39D4(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_2353C34A8((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
        return sub_2353C429C(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_2353C3B58();
      goto LABEL_7;
    }
    sub_2353C369C(v12, a3 & 1);
    v18 = sub_2353C34A8((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2353C3AF4(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for OptionKey(0);
  result = (_OWORD *)sub_2353C6B08();
  __break(1u);
  return result;
}

_OWORD *sub_2353C3AF4(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_2353C429C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id sub_2353C3B58()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25622D798);
  v2 = *v0;
  v3 = sub_2353C6ACC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_2353C432C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_2353C429C(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _s7Symbols25VariableColorSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t result;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  if (v2 == 2)
  {
    if (v5 != 2)
      return 0;
  }
  else
  {
    result = 0;
    v9 = (v2 & 1) == 0;
    if (v5 == 2 || ((v9 ^ v5) & 1) == 0)
      return result;
  }
  if (v3 == 2)
  {
    if (v6 != 2)
      return 0;
LABEL_11:
    if (v4 == 2)
    {
      if (v7 == 2)
        return 1;
    }
    else
    {
      v11 = (v4 & 1) == 0;
      if (v7 != 2 && ((v11 ^ v7) & 1) != 0)
        return 1;
    }
    return 0;
  }
  result = 0;
  v10 = (v3 & 1) == 0;
  if (v6 != 2 && ((v10 ^ v6) & 1) != 0)
    goto LABEL_11;
  return result;
}

void _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X14 }
}

uint64_t sub_2353C3E0C@<X0>(int a1@<W8>)
{
  char v1;
  int v2;
  _BOOL4 v3;
  char v4;

  if (v2)
    goto LABEL_9;
  if (v1 != 2)
  {
    v3 = (v1 & 1) == 0;
    if (a1 != 2 && ((v3 ^ a1) & 1) != 0)
      goto LABEL_8;
LABEL_9:
    v4 = 0;
    return v4 & 1;
  }
  if (a1 != 2)
    goto LABEL_9;
LABEL_8:
  v4 = 1;
  return v4 & 1;
}

uint64_t _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (v2 != 3)
  {
    if (v4 == 3 || v2 != v4)
      return 0;
LABEL_9:
    if (v3 == 2)
    {
      if (v5 != 2)
        return 0;
    }
    else
    {
      v7 = (v3 & 1) == 0;
      if (v5 == 2 || ((v7 ^ v5) & 1) == 0)
        return 0;
    }
    return 1;
  }
  if (v4 == 3)
    goto LABEL_9;
  return 0;
}

uint64_t _s7Symbols18WiggleSymbolEffectV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  double v6;
  double v7;
  uint64_t result;
  _BOOL4 v9;
  _BOOL4 v10;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a1 + 9);
  v4 = *(unsigned __int8 *)(a2 + 8);
  v5 = *(unsigned __int8 *)(a2 + 9);
  if (v2 == 255)
  {
    if (v4 != 255)
      return 0;
  }
  else
  {
    if (v4 == 255)
      return 0;
    v6 = *(double *)a1;
    v7 = *(double *)a2;
    if (*(_BYTE *)(a1 + 8))
    {
      if (v2 == 1)
      {
        result = 0;
        if (v4 != 1 || v6 != v7)
          return result;
        goto LABEL_14;
      }
      result = 0;
      v9 = (LOBYTE(v6) & 1) == 0;
      if (v4 != 2)
        return result;
    }
    else
    {
      result = 0;
      v9 = (LOBYTE(v6) & 1) == 0;
      if (*(_BYTE *)(a2 + 8))
        return result;
    }
    if (((v9 ^ LODWORD(v7)) & 1) == 0)
      return result;
  }
LABEL_14:
  if (v3 == 2)
  {
    if (v5 != 2)
      return 0;
  }
  else
  {
    v10 = (v3 & 1) == 0;
    if (v5 == 2 || ((v10 ^ v5) & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t sub_2353C41A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t result;
  _BOOL4 v7;
  _BOOL4 v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (v2 == 2)
  {
    if (v4 != 2)
      return 0;
LABEL_6:
    if (v3 == 2)
    {
      if (v5 == 2)
        return 1;
    }
    else
    {
      v8 = (v3 & 1) == 0;
      if (v5 != 2 && ((v8 ^ v5) & 1) != 0)
        return 1;
    }
    return 0;
  }
  result = 0;
  v7 = (v2 & 1) == 0;
  if (v4 != 2 && ((v7 ^ v4) & 1) != 0)
    goto LABEL_6;
  return result;
}

uint64_t _s7Symbols19BreatheSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  _BOOL4 v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (v2 != 2)
  {
    v6 = (v4 ^ v2) & 1;
    if (v4 == 2 || v6 != 0)
      return 0;
LABEL_9:
    if (v3 == 2)
    {
      if (v5 != 2)
        return 0;
    }
    else
    {
      v8 = (v3 & 1) == 0;
      if (v5 == 2 || ((v8 ^ v5) & 1) == 0)
        return 0;
    }
    return 1;
  }
  if (v4 == 2)
    goto LABEL_9;
  return 0;
}

_OWORD *sub_2353C429C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2353C42AC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25622D698);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CA164]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2353C432C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _s7Symbols18WiggleSymbolEffectV0B5StyleO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2;
  int v3;
  char v4;
  BOOL v5;
  char v6;

  v2 = *(double *)a2;
  v3 = *(unsigned __int8 *)(a2 + 8);
  v4 = ((*(_QWORD *)a1 & 1) == 0) ^ *(_QWORD *)a2;
  if (*(_BYTE *)(a2 + 8))
    v4 = 0;
  v5 = *(double *)a1 == v2;
  if (v3 != 1)
    v5 = 0;
  v6 = ((*(_QWORD *)a1 & 1) == 0) ^ LOBYTE(v2);
  if (v3 != 2)
    v6 = 0;
  if (*(_BYTE *)(a1 + 8) == 1)
    v6 = v5;
  if (!*(_BYTE *)(a1 + 8))
    v6 = v4;
  return v6 & 1;
}

unint64_t sub_2353C43D8()
{
  unint64_t result;

  result = qword_25622D6A0;
  if (!qword_25622D6A0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for SymbolEffectConfiguration.Effect, &type metadata for SymbolEffectConfiguration.Effect);
    atomic_store(result, (unint64_t *)&qword_25622D6A0);
  }
  return result;
}

unint64_t sub_2353C4420()
{
  unint64_t result;

  result = qword_25622D6A8;
  if (!qword_25622D6A8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for SymbolEffectConfiguration, &type metadata for SymbolEffectConfiguration);
    atomic_store(result, (unint64_t *)&qword_25622D6A8);
  }
  return result;
}

unint64_t sub_2353C4464(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4488();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4488()
{
  unint64_t result;

  result = qword_25622D6B0;
  if (!qword_25622D6B0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for PulseSymbolEffect, &type metadata for PulseSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6B0);
  }
  return result;
}

unint64_t sub_2353C44D0()
{
  unint64_t result;

  result = qword_25622D6B8;
  if (!qword_25622D6B8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for PulseSymbolEffect, &type metadata for PulseSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6B8);
  }
  return result;
}

unint64_t sub_2353C4514(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4538();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4538()
{
  unint64_t result;

  result = qword_25622D6C0;
  if (!qword_25622D6C0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for BounceSymbolEffect, &type metadata for BounceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6C0);
  }
  return result;
}

unint64_t sub_2353C4580()
{
  unint64_t result;

  result = qword_25622D6C8;
  if (!qword_25622D6C8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for BounceSymbolEffect, &type metadata for BounceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6C8);
  }
  return result;
}

unint64_t sub_2353C45C4(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C45E8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C45E8()
{
  unint64_t result;

  result = qword_25622D6D0;
  if (!qword_25622D6D0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for VariableColorSymbolEffect, &type metadata for VariableColorSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6D0);
  }
  return result;
}

unint64_t sub_2353C4630()
{
  unint64_t result;

  result = qword_25622D6D8;
  if (!qword_25622D6D8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for VariableColorSymbolEffect, &type metadata for VariableColorSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6D8);
  }
  return result;
}

unint64_t sub_2353C4674(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4698();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4698()
{
  unint64_t result;

  result = qword_25622D6E0;
  if (!qword_25622D6E0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ScaleSymbolEffect, &type metadata for ScaleSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6E0);
  }
  return result;
}

unint64_t sub_2353C46E0()
{
  unint64_t result;

  result = qword_25622D6E8;
  if (!qword_25622D6E8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ScaleSymbolEffect, &type metadata for ScaleSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6E8);
  }
  return result;
}

unint64_t sub_2353C4724(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4748();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4748()
{
  unint64_t result;

  result = qword_25622D6F0;
  if (!qword_25622D6F0)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for AppearSymbolEffect, &type metadata for AppearSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6F0);
  }
  return result;
}

unint64_t sub_2353C4790()
{
  unint64_t result;

  result = qword_25622D6F8;
  if (!qword_25622D6F8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for AppearSymbolEffect, &type metadata for AppearSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D6F8);
  }
  return result;
}

unint64_t sub_2353C47D4(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C47F8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C47F8()
{
  unint64_t result;

  result = qword_25622D700;
  if (!qword_25622D700)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for DisappearSymbolEffect, &type metadata for DisappearSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D700);
  }
  return result;
}

unint64_t sub_2353C4840()
{
  unint64_t result;

  result = qword_25622D708;
  if (!qword_25622D708)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for DisappearSymbolEffect, &type metadata for DisappearSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D708);
  }
  return result;
}

unint64_t sub_2353C4888()
{
  unint64_t result;

  result = qword_25622D710;
  if (!qword_25622D710)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ReplaceSymbolEffect.ReplaceStyle, &type metadata for ReplaceSymbolEffect.ReplaceStyle);
    atomic_store(result, (unint64_t *)&qword_25622D710);
  }
  return result;
}

unint64_t sub_2353C48CC(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C48F0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C48F0()
{
  unint64_t result;

  result = qword_25622D718;
  if (!qword_25622D718)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ReplaceSymbolEffect, &type metadata for ReplaceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D718);
  }
  return result;
}

unint64_t sub_2353C4938()
{
  unint64_t result;

  result = qword_25622D720;
  if (!qword_25622D720)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ReplaceSymbolEffect, &type metadata for ReplaceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D720);
  }
  return result;
}

unint64_t sub_2353C497C(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C49A0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C49A0()
{
  unint64_t result;

  result = qword_25622D728;
  if (!qword_25622D728)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for AutomaticSymbolEffect, &type metadata for AutomaticSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D728);
  }
  return result;
}

unint64_t sub_2353C49E8()
{
  unint64_t result;

  result = qword_25622D730;
  if (!qword_25622D730)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for AutomaticSymbolEffect, &type metadata for AutomaticSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D730);
  }
  return result;
}

unint64_t sub_2353C4A30()
{
  unint64_t result;

  result = qword_25622D738;
  if (!qword_25622D738)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for WiggleSymbolEffect.WiggleStyle, &type metadata for WiggleSymbolEffect.WiggleStyle);
    atomic_store(result, (unint64_t *)&qword_25622D738);
  }
  return result;
}

unint64_t sub_2353C4A74(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4A98();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4A98()
{
  unint64_t result;

  result = qword_25622D740;
  if (!qword_25622D740)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for WiggleSymbolEffect, &type metadata for WiggleSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D740);
  }
  return result;
}

unint64_t sub_2353C4AE0()
{
  unint64_t result;

  result = qword_25622D748;
  if (!qword_25622D748)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for WiggleSymbolEffect, &type metadata for WiggleSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D748);
  }
  return result;
}

unint64_t sub_2353C4B24(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4B48();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4B48()
{
  unint64_t result;

  result = qword_25622D750;
  if (!qword_25622D750)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for RotateSymbolEffect, &type metadata for RotateSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D750);
  }
  return result;
}

unint64_t sub_2353C4B90()
{
  unint64_t result;

  result = qword_25622D758;
  if (!qword_25622D758)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for RotateSymbolEffect, &type metadata for RotateSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D758);
  }
  return result;
}

unint64_t sub_2353C4BD8()
{
  unint64_t result;

  result = qword_25622D760;
  if (!qword_25622D760)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for BreatheSymbolEffect.BreatheStyle, &type metadata for BreatheSymbolEffect.BreatheStyle);
    atomic_store(result, (unint64_t *)&qword_25622D760);
  }
  return result;
}

unint64_t sub_2353C4C1C(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4C40();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4C40()
{
  unint64_t result;

  result = qword_25622D768;
  if (!qword_25622D768)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for BreatheSymbolEffect, &type metadata for BreatheSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D768);
  }
  return result;
}

unint64_t sub_2353C4C88()
{
  unint64_t result;

  result = qword_25622D770;
  if (!qword_25622D770)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for BreatheSymbolEffect, &type metadata for BreatheSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D770);
  }
  return result;
}

unint64_t sub_2353C4CCC(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4CF0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4CF0()
{
  unint64_t result;

  result = qword_25622D778;
  if (!qword_25622D778)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for MagicReplaceSymbolEffect, &type metadata for MagicReplaceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D778);
  }
  return result;
}

unint64_t sub_2353C4D38()
{
  unint64_t result;

  result = qword_25622D780;
  if (!qword_25622D780)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for MagicReplaceSymbolEffect, &type metadata for MagicReplaceSymbolEffect);
    atomic_store(result, (unint64_t *)&qword_25622D780);
  }
  return result;
}

unint64_t sub_2353C4D7C(uint64_t a1)
{
  unint64_t result;

  result = sub_2353C4DA0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2353C4DA0()
{
  unint64_t result;

  result = qword_25622D788;
  if (!qword_25622D788)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ReplaceSymbolEffect.MagicReplace, &type metadata for ReplaceSymbolEffect.MagicReplace);
    atomic_store(result, (unint64_t *)&qword_25622D788);
  }
  return result;
}

unint64_t sub_2353C4DE8()
{
  unint64_t result;

  result = qword_25622D790;
  if (!qword_25622D790)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for ReplaceSymbolEffect.MagicReplace, &type metadata for ReplaceSymbolEffect.MagicReplace);
    atomic_store(result, (unint64_t *)&qword_25622D790);
  }
  return result;
}

uint64_t dispatch thunk of SymbolEffect.configuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectConfiguration()
{
  return &type metadata for SymbolEffectConfiguration;
}

uint64_t _s7Symbols25SymbolEffectConfigurationV6EffectOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF5 && *(_BYTE *)(a1 + 11))
    return (*(_DWORD *)a1 + 245);
  v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 <= 0xB)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s7Symbols25SymbolEffectConfigurationV6EffectOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 245;
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 11) = 0;
    if (a2)
      *(_BYTE *)(result + 10) = -(char)a2;
  }
  return result;
}

uint64_t sub_2353C4EF4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 10);
}

uint64_t sub_2353C4EFC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 10) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectConfiguration.Effect()
{
  return &type metadata for SymbolEffectConfiguration.Effect;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PulseSymbolEffect(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  if (v6 >= 2)
    v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v7 = -2;
  if (v7 < 0)
    v7 = -1;
  return (v7 + 1);
}

uint64_t storeEnumTagSinglePayload for PulseSymbolEffect(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2353C5018 + 4 * byte_2353C7A35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2353C504C + 4 * byte_2353C7A30[v4]))();
}

uint64_t sub_2353C504C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C5054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2353C505CLL);
  return result;
}

uint64_t sub_2353C5068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2353C5070);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2353C5074(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C507C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PulseSymbolEffect()
{
  return &type metadata for PulseSymbolEffect;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for BounceSymbolEffect()
{
  return &type metadata for BounceSymbolEffect;
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VariableColorSymbolEffect(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE)
  {
    if ((a2 + 33554178) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
    }
  }
  v4 = *(unsigned __int8 *)a1;
  if (v4 >= 2)
    v5 = ((v4 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v5 = -2;
  if (v5 < 0)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for VariableColorSymbolEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554178) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFD)
    v3 = 0;
  if (a2 > 0xFD)
  {
    *(_WORD *)result = a2 - 254;
    *(_BYTE *)(result + 2) = (a2 - 254) >> 16;
    if (v3)
    {
      v4 = ((a2 - 254) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 2;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for VariableColorSymbolEffect()
{
  return &type metadata for VariableColorSymbolEffect;
}

ValueMetadata *type metadata accessor for ScaleSymbolEffect()
{
  return &type metadata for ScaleSymbolEffect;
}

ValueMetadata *type metadata accessor for AppearSymbolEffect()
{
  return &type metadata for AppearSymbolEffect;
}

ValueMetadata *type metadata accessor for DisappearSymbolEffect()
{
  return &type metadata for DisappearSymbolEffect;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect()
{
  return &type metadata for ReplaceSymbolEffect;
}

uint64_t getEnumTagSinglePayload for ReplaceSymbolEffect.ReplaceStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ReplaceSymbolEffect.ReplaceStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2353C531C + 4 * byte_2353C7A3F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2353C5350 + 4 * byte_2353C7A3A[v4]))();
}

uint64_t sub_2353C5350(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C5358(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2353C5360);
  return result;
}

uint64_t sub_2353C536C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2353C5374);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2353C5378(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C5380(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C538C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2353C5394(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect.ReplaceStyle()
{
  return &type metadata for ReplaceSymbolEffect.ReplaceStyle;
}

ValueMetadata *type metadata accessor for AutomaticSymbolEffect()
{
  return &type metadata for AutomaticSymbolEffect;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for WiggleSymbolEffect(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 10))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 9);
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiggleSymbolEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_BYTE *)(result + 9) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WiggleSymbolEffect()
{
  return &type metadata for WiggleSymbolEffect;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for WiggleSymbolEffect.WiggleStyle(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiggleSymbolEffect.WiggleStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2353C5524(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2353C552C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WiggleSymbolEffect.WiggleStyle()
{
  return &type metadata for WiggleSymbolEffect.WiggleStyle;
}

uint64_t _s7Symbols18BounceSymbolEffectVwet_0(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 65282 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65282 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65282;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65282;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65282;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  if (v6 >= 2)
    v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v7 = -2;
  if (v7 < 0)
    v7 = -1;
  return (v7 + 1);
}

uint64_t _s7Symbols18BounceSymbolEffectVwst_0(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65282 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65282 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2353C5640 + 4 * byte_2353C7A49[v4]))();
  *a1 = a2 - 254;
  return ((uint64_t (*)(void))((char *)sub_2353C5674 + 4 * byte_2353C7A44[v4]))();
}

uint64_t sub_2353C5674(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C567C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x2353C5684);
  return result;
}

uint64_t sub_2353C5690(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x2353C5698);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2353C569C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C56A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RotateSymbolEffect()
{
  return &type metadata for RotateSymbolEffect;
}

uint64_t getEnumTagSinglePayload for BreatheSymbolEffect(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v6;
  int v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 65282 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65282 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65282;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65282;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65282;
  }
LABEL_17:
  if (*(unsigned __int8 *)a1 <= 2u)
    v6 = 2;
  else
    v6 = *(unsigned __int8 *)a1;
  v7 = v6 - 3;
  if (*(unsigned __int8 *)a1 < 2u)
    v8 = -1;
  else
    v8 = v7;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BreatheSymbolEffect(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65282 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65282 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2353C57B0 + 4 * byte_2353C7A53[v4]))();
  *a1 = a2 - 254;
  return ((uint64_t (*)(void))((char *)sub_2353C57E4 + 4 * byte_2353C7A4E[v4]))();
}

uint64_t sub_2353C57E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C57EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x2353C57F4);
  return result;
}

uint64_t sub_2353C5800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x2353C5808);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2353C580C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C5814(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BreatheSymbolEffect()
{
  return &type metadata for BreatheSymbolEffect;
}

uint64_t getEnumTagSinglePayload for BreatheSymbolEffect.BreatheStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BreatheSymbolEffect.BreatheStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2353C590C + 4 * byte_2353C7A5D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2353C5940 + 4 * byte_2353C7A58[v4]))();
}

uint64_t sub_2353C5940(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C5948(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2353C5950);
  return result;
}

uint64_t sub_2353C595C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2353C5964);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2353C5968(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2353C5970(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2353C597C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BreatheSymbolEffect.BreatheStyle()
{
  return &type metadata for BreatheSymbolEffect.BreatheStyle;
}

ValueMetadata *type metadata accessor for MagicReplaceSymbolEffect()
{
  return &type metadata for MagicReplaceSymbolEffect;
}

uint64_t _s7Symbols19ReplaceSymbolEffectVwet_0(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 65282 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65282 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65282;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65282;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65282;
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  if (v6 >= 2)
    v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v7 = -2;
  if (v7 < 0)
    v7 = -1;
  return (v7 + 1);
}

uint64_t _s7Symbols19ReplaceSymbolEffectVwst_0(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65282 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65282 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2353C5AA4 + 4 * byte_2353C7A67[v4]))();
  *a1 = a2 - 254;
  return ((uint64_t (*)(void))((char *)sub_2353C5AD8 + 4 * byte_2353C7A62[v4]))();
}

uint64_t sub_2353C5AD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C5AE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x2353C5AE8);
  return result;
}

uint64_t sub_2353C5AF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x2353C5AFCLL);
  *(_BYTE *)(result + 1) = a2 + 2;
  return result;
}

uint64_t sub_2353C5B00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_2353C5B08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect.MagicReplace()
{
  return &type metadata for ReplaceSymbolEffect.MagicReplace;
}

uint64_t sub_2353C5B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25622D7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void type metadata accessor for OptionKey(uint64_t a1)
{
  sub_2353C5BB4(a1, &qword_25622D7B0);
}

void type metadata accessor for RBSymbolAnimation(uint64_t a1)
{
  sub_2353C5BB4(a1, &qword_25622D7A8);
}

void sub_2353C5BB4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_2353C5BF8()
{
  return sub_2353C5C40(&qword_25622D7B8, (uint64_t)&unk_2353C8634);
}

uint64_t sub_2353C5C1C()
{
  return sub_2353C5C40(&qword_25622D7C0, (uint64_t)&unk_2353C860C);
}

uint64_t sub_2353C5C40(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OptionKey(255);
    result = MEMORY[0x23B7CA170](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2353C5C80()
{
  return sub_2353C5C40(&qword_25622D7C8, (uint64_t)&unk_2353C869C);
}

uint64_t SymbolEffectOptions.RepeatOption.hash(into:)()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_2353C6B20();
  return sub_2353C6B20();
}

BOOL static SymbolEffectOptions.RepeatOption.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

uint64_t SymbolEffectOptions.RepeatOption.hashValue.getter()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2353C6B14();
  if ((v1 & 1) == 0)
    sub_2353C6B20();
  sub_2353C6B20();
  return sub_2353C6B44();
}

uint64_t sub_2353C5E4C()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2353C6B14();
  if ((v1 & 1) == 0)
    sub_2353C6B20();
  sub_2353C6B20();
  return sub_2353C6B44();
}

uint64_t sub_2353C5EA8()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_2353C6B20();
  return sub_2353C6B20();
}

uint64_t sub_2353C5EEC()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2353C6B14();
  if ((v1 & 1) == 0)
    sub_2353C6B20();
  sub_2353C6B20();
  return sub_2353C6B44();
}

BOOL sub_2353C5F48(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

double SymbolEffectOptions.speed.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void SymbolEffectOptions.speed.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*SymbolEffectOptions.speed.modify())()
{
  return nullsub_1;
}

void SymbolEffectOptions.repeat.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;

  v2 = *(_BYTE *)(v1 + 16);
  v3 = *(_BYTE *)(v1 + 17);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 8);
  *(_BYTE *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 9) = v3;
}

uint64_t SymbolEffectOptions.repeat.setter(uint64_t result)
{
  uint64_t v1;
  char v2;
  char v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *(_BYTE *)(result + 9);
  *(_QWORD *)(v1 + 8) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 17) = v3;
  return result;
}

uint64_t (*SymbolEffectOptions.repeat.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectOptions.prefersContinuous.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t SymbolEffectOptions.prefersContinuous.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 18) = result;
  return result;
}

uint64_t (*SymbolEffectOptions.prefersContinuous.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectOptions.repeatDelay.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t SymbolEffectOptions.repeatDelay.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*SymbolEffectOptions.repeatDelay.modify())()
{
  return nullsub_1;
}

void static SymbolEffectOptions.default.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FF0000000000000;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 256;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

void static SymbolEffectOptions.speed(_:)(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 256;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

void SymbolEffectOptions.speed(_:)(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(v2 + 8);
  v4 = *(_BYTE *)(v2 + 16);
  v5 = *(_BYTE *)(v2 + 17);
  v6 = *(_BYTE *)(v2 + 18);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(_BYTE *)(v2 + 32);
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 17) = v5;
  *(_BYTE *)(a1 + 18) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
}

uint64_t static SymbolEffectOptions.repeat(_:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = result;
  *(_QWORD *)a3 = 0x3FF0000000000000;
  *(_QWORD *)(a3 + 8) = v3;
  *(_BYTE *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_BYTE *)(a3 + 18) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 1;
  return result;
}

uint64_t SymbolEffectOptions.repeat(_:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)a3 = *v3;
  if ((a2 & 1) != 0)
    v4 = 0;
  else
    v4 = result;
  *(_QWORD *)(a3 + 8) = v4;
  *(_BYTE *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_BYTE *)(a3 + 18) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 1;
  return result;
}

void static SymbolEffectOptions.repeating.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FF0000000000000;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

double SymbolEffectOptions.repeating.getter@<D0>(uint64_t a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *(double *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

void static SymbolEffectOptions.nonRepeating.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x3FF0000000000000;
  *(_QWORD *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

double SymbolEffectOptions.nonRepeating.getter@<D0>(uint64_t a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *(double *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 18) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t SymbolEffectOptions.hash(into:)()
{
  _BYTE *v0;
  char v1;
  int v2;
  char v3;

  v1 = v0[16];
  v2 = v0[17];
  v3 = v0[32];
  sub_2353C6B38();
  if (v2 == 1)
  {
    sub_2353C6B2C();
  }
  else
  {
    sub_2353C6B2C();
    if ((v1 & 1) == 0)
      sub_2353C6B20();
    sub_2353C6B20();
  }
  sub_2353C6B2C();
  if ((v3 & 1) != 0)
    return sub_2353C6B2C();
  sub_2353C6B2C();
  return sub_2353C6B38();
}

uint64_t SymbolEffectOptions.hashValue.getter()
{
  sub_2353C6B14();
  SymbolEffectOptions.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353C62D8()
{
  sub_2353C6B14();
  SymbolEffectOptions.hash(into:)();
  return sub_2353C6B44();
}

uint64_t sub_2353C6354()
{
  sub_2353C6B14();
  SymbolEffectOptions.hash(into:)();
  return sub_2353C6B44();
}

void static SymbolEffectOptions.repeating(delay:)(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_QWORD *)a1 = 0x3FF0000000000000;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 18) = 0;
  *(double *)(a1 + 24) = a2;
  *(_BYTE *)(a1 + 32) = 0;
}

void SymbolEffectOptions.repeating(delay:)(uint64_t a1@<X8>, double a2@<D0>)
{
  _QWORD *v2;

  *(_QWORD *)a1 = *v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 18) = 0;
  *(double *)(a1 + 24) = a2;
  *(_BYTE *)(a1 + 32) = 0;
}

uint64_t static SymbolEffectOptions.repeat(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v4;

  if ((a2 & 1) != 0)
    v4 = 0;
  else
    v4 = result;
  *(_QWORD *)a3 = 0x3FF0000000000000;
  *(_QWORD *)(a3 + 8) = v4;
  *(_BYTE *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_BYTE *)(a3 + 18) = 0;
  *(double *)(a3 + 24) = a4;
  *(_BYTE *)(a3 + 32) = 0;
  return result;
}

uint64_t SymbolEffectOptions.repeat(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)a3 = *v4;
  if ((a2 & 1) != 0)
    v5 = 0;
  else
    v5 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 17) = a2 & 1;
  *(_BYTE *)(a3 + 18) = 0;
  *(double *)(a3 + 24) = a4;
  *(_BYTE *)(a3 + 32) = 0;
  return result;
}

void static SymbolEffectOptions._RepeatStyle.periodic.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

uint64_t static SymbolEffectOptions._RepeatStyle.periodic(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v5;

  *(_BYTE *)a5 = 0;
  *(_QWORD *)(a5 + 8) = a3;
  *(_BYTE *)(a5 + 16) = a4 & 1;
  if ((a2 & 1) != 0)
    v5 = 0;
  else
    v5 = result;
  *(_QWORD *)(a5 + 24) = v5;
  *(_BYTE *)(a5 + 32) = a2 & 1;
  return result;
}

void static SymbolEffectOptions._RepeatStyle.continuous.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

id SymbolEffectOptions.objcRepresentation.getter()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;

  v1 = *(double *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  v4 = *(_BYTE *)(v0 + 17);
  v5 = *(unsigned __int8 *)(v0 + 18);
  v6 = *(_BYTE *)(v0 + 32);
  v7 = objc_msgSend((id)objc_opt_self(), sel_options);
  objc_msgSend(v7, sel_set_speed_, v1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v7, sel_set_repeatBehavior_, 0);
    if ((v6 & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v7, sel_set_repeatBehavior_, 2);
    objc_msgSend(v7, sel_set_repeatCount_, v2);
    if ((v6 & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v7, sel_set_repeatBehavior_, 1);
  if ((v6 & 1) == 0)
  {
LABEL_8:
    sub_2353C6764();
    v8 = (void *)sub_2353C6AC0();
    objc_msgSend(v7, sel_set_repeatDelay_, v8);

  }
LABEL_9:
  objc_msgSend(v7, sel_set_prefersContinuous_, v5);
  return v7;
}

void static SymbolEffectOptions.RepeatBehavior.periodic.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

uint64_t static SymbolEffectOptions.RepeatBehavior.periodic(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v5;

  *(_BYTE *)a5 = 0;
  *(_QWORD *)(a5 + 8) = a3;
  *(_BYTE *)(a5 + 16) = a4 & 1;
  if ((a2 & 1) != 0)
    v5 = 0;
  else
    v5 = result;
  *(_QWORD *)(a5 + 24) = v5;
  *(_BYTE *)(a5 + 32) = a2 & 1;
  return result;
}

void static SymbolEffectOptions.RepeatBehavior.continuous.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

double _s7Symbols19SymbolEffectOptionsV7_repeatyA2C12_RepeatStyleVF_0@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  double *v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  unsigned __int8 v7;
  double result;

  v3 = *a1;
  v4 = *((_QWORD *)a1 + 1);
  v5 = a1[16];
  v6 = *((_QWORD *)a1 + 3);
  v7 = a1[32];
  result = *v2;
  *(double *)a2 = *v2;
  *(_QWORD *)(a2 + 8) = v6;
  *(_WORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 18) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = v5;
  return result;
}

char *_s7Symbols19SymbolEffectOptionsV7_repeatyA2C12_RepeatStyleVFZ_0@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = *result;
  v3 = *((_QWORD *)result + 1);
  v4 = result[16];
  v5 = *((_QWORD *)result + 3);
  v6 = result[32];
  *(_QWORD *)a2 = 0x3FF0000000000000;
  *(_QWORD *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 18) = v2;
  *(_QWORD *)(a2 + 24) = v3;
  *(_BYTE *)(a2 + 32) = v4;
  return result;
}

uint64_t _s7Symbols19SymbolEffectOptionsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v3;
  double v4;
  char v5;
  uint64_t result;
  char v7;

  if (*(double *)a1 != *(double *)a2)
    return 0;
  v3 = *(unsigned __int8 *)(a1 + 18);
  v4 = *(double *)(a1 + 24);
  v5 = *(_BYTE *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 17) & 1) != 0)
  {
    result = 0;
    if (!*(_BYTE *)(a2 + 17))
      return result;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 17) & 1) != 0)
      return 0;
    if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      result = 0;
      if ((*(_BYTE *)(a2 + 16) & 1) == 0)
        return result;
    }
    else
    {
      if ((*(_BYTE *)(a2 + 16) & 1) != 0)
        return 0;
      result = 0;
      if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
        return result;
    }
  }
  if (((v3 ^ *(unsigned __int8 *)(a2 + 18)) & 1) != 0)
    return result;
  if ((v5 & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) != 0)
      return 1;
  }
  else
  {
    if (v4 == *(double *)(a2 + 24))
      v7 = *(_BYTE *)(a2 + 32);
    else
      v7 = 1;
    if ((v7 & 1) == 0)
      return 1;
  }
  return 0;
}

unint64_t sub_2353C6764()
{
  unint64_t result;

  result = qword_25622D7E0;
  if (!qword_25622D7E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25622D7E0);
  }
  return result;
}

unint64_t sub_2353C67A4()
{
  unint64_t result;

  result = qword_25622D7E8;
  if (!qword_25622D7E8)
  {
    result = MEMORY[0x23B7CA170](&protocol conformance descriptor for SymbolEffectOptions.RepeatOption, &type metadata for SymbolEffectOptions.RepeatOption);
    atomic_store(result, (unint64_t *)&qword_25622D7E8);
  }
  return result;
}

unint64_t sub_2353C67EC()
{
  unint64_t result;

  result = qword_25622D7F0;
  if (!qword_25622D7F0)
  {
    result = MEMORY[0x23B7CA170]("q\n,\x1Bx\t", &type metadata for SymbolEffectOptions);
    atomic_store(result, (unint64_t *)&qword_25622D7F0);
  }
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SymbolEffectOptions(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 18);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolEffectOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 18) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions()
{
  return &type metadata for SymbolEffectOptions;
}

uint64_t getEnumTagSinglePayload for SymbolEffectOptions.RepeatOption(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SymbolEffectOptions.RepeatOption(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_2353C6940(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2353C695C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions.RepeatOption()
{
  return &type metadata for SymbolEffectOptions.RepeatOption;
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolEffectOptions._RepeatStyle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions._RepeatStyle()
{
  return &type metadata for SymbolEffectOptions._RepeatStyle;
}

uint64_t _s7Symbols19SymbolEffectOptionsV12_RepeatStyleVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[33])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s7Symbols19SymbolEffectOptionsV12_RepeatStyleVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions.RepeatBehavior()
{
  return &type metadata for SymbolEffectOptions.RepeatBehavior;
}

uint64_t sub_2353C6A84()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2353C6A90()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2353C6A9C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2353C6AA8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2353C6AB4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2353C6AC0()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2353C6ACC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2353C6AD8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2353C6AE4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2353C6AF0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2353C6AFC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2353C6B08()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2353C6B14()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2353C6B20()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2353C6B2C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2353C6B38()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2353C6B44()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

