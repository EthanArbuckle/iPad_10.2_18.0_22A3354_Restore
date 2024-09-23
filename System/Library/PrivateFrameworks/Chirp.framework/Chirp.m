uint64_t sub_20E5E9DC4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20E5E9DCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20E5FF3A4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_20E5E9E40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20E5FF3A4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 36));
  }
  return a1;
}

uint64_t sub_20E5E9EC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20E5FF3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20E5E9EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_20E5E9F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_20E5E9FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_20E5EA010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t sub_20E5EA06C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E5EA078(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20E5FF3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_20E5EA0B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E5EA0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20E5FF3A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CipherState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CipherState);
}

uint64_t sub_20E5EA10C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  result = type metadata accessor for CipherState(0, a2, a3, v9);
  *(_QWORD *)(a4 + *(int *)(result + 36)) = 0;
  return result;
}

uint64_t sub_20E5EA174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t AssociatedConformanceWitness;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;

  v45 = a7;
  v8 = v7;
  v43 = a5;
  v44 = a6;
  v42 = a4;
  v39 = a1;
  v40 = a2;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v41 = sub_20E5FF5FC();
  v38 = *(_QWORD *)(v41 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v35 - v13;
  v15 = swift_getAssociatedTypeWitness();
  v36 = *(_QWORD *)(v15 - 8);
  v37 = v15;
  v16 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)&v35 - v17;
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v35 - v20;
  v22 = *(int *)(a3 + 36);
  v23 = *(_QWORD *)(v8 + v22);
  result = sub_20E5EA43C(v19, v23, v10, v11);
  if (v23 == -1)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v8 + v22) = v23 + 1;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v14, v21, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, AssociatedTypeWitness);
    v25 = v46;
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 72))(v39, v8, v14, v40, v42, v43, v44, v45, v10, v11);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v41);
    if (v25)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, AssociatedTypeWitness);
    }
    else
    {
      v26 = v37;
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      v46 = 0;
      v28 = AssociatedConformanceWitness;
      v29 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v26, AssociatedConformanceWitness);
      v31 = v30;
      v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v26, v28);
      v34 = v33;
      v47 = v29;
      v48 = v31;
      sub_20E5EAB18(v29, v31);
      sub_20E5F2CF8(v32, v34);
      sub_20E5EAB5C(v32, v34);
      sub_20E5EAB5C(v29, v31);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v49, v26);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, AssociatedTypeWitness);
      return v47;
    }
  }
  return result;
}

uint64_t sub_20E5EA43C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  void (*v12)(uint64_t *, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = sub_20E5FF5C0();
  *(_QWORD *)(v7 + 16) = 4;
  *(_DWORD *)(v7 + 32) = 0;
  v18[0] = v7;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v9 = bswap64(a2);
  if ((v8 & 1) == 0)
    v9 = a2;
  v17 = v9;
  sub_20E5F80F4((char *)&v17, (char *)v18);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = v18[0];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v12 = *(void (**)(uint64_t *, uint64_t, unint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  swift_bridgeObjectRetain();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AD48);
  v14 = sub_20E5EAA88();
  v12(&v16, v13, v14, AssociatedTypeWitness, AssociatedConformanceWitness);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20E5EA5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  _BYTE *v31;
  void (*v32)(char *, char *, uint64_t);
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t AssociatedConformanceWitness;
  void (*v41)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t AssociatedTypeWitness;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v52 = a5;
  v53 = a7;
  v51 = a2;
  v66 = a1;
  v62 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = v12;
  v54 = *(_QWORD *)(*(_QWORD *)(v12 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v56 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v55 = (char *)&v48 - v15;
  v17 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(a3 + 24);
  v59 = swift_getAssociatedTypeWitness();
  v50 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v58 = (char *)&v48 - v18;
  v19 = swift_getAssociatedTypeWitness();
  v64 = *(_QWORD *)(v19 - 8);
  v65 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v24 = *(int *)(a3 + 36);
  v25 = *(_QWORD *)(v7 + v24);
  v63 = (char *)&v48 - v26;
  result = sub_20E5EA43C(v23, v25, v17, v16);
  if (v25 == -1)
  {
    __break(1u);
  }
  else
  {
    v49 = v7;
    *(_QWORD *)(v7 + v24) = v25 + 1;
    v28 = sub_20E5FF5CC();
    v29 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 64);
    v30 = v17;
    if (v28 < v29(v17, v16))
    {
      sub_20E5EAA04();
      swift_allocError();
      *v31 = 6;
      swift_willThrow();
      goto LABEL_7;
    }
    v32 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
    v48 = v22;
    v32(v22, v63, v65);
    v33 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
    v33(v11, v66, a4);
    v34 = sub_20E5FF5CC();
    v35 = v29(v17, v16);
    v36 = __OFSUB__(v34, v35);
    result = v34 - v35;
    if (!v36)
    {
      v37 = v55;
      sub_20E5FF5D8();
      v33(v11, v66, a4);
      v29(v17, v16);
      v38 = v56;
      sub_20E5FF4AC();
      v39 = v59;
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      v41 = *(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
      v42 = AssociatedTypeWitness;
      v43 = swift_getAssociatedConformanceWitness();
      v44 = v58;
      v45 = v42;
      v46 = v42;
      v30 = v39;
      v47 = v61;
      v41(v48, v37, v38, v45, v46, v43, v43, v39, AssociatedConformanceWitness);
      if (!v47)
      {
        v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 80))(v44, v49, v51, v52, v53, v17, v16);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v44, v39);
        (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
        return v30;
      }
LABEL_7:
      (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
      return v30;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_20E5EAA04()
{
  unint64_t result;

  result = qword_254A2AD40;
  if (!qword_254A2AD40)
  {
    result = MEMORY[0x212BC13A4](&protocol conformance descriptor for ChirpErrors, &type metadata for ChirpErrors);
    atomic_store(result, (unint64_t *)&qword_254A2AD40);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BC138C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20E5EAA88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AD50;
  if (!qword_254A2AD50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AD48);
    result = MEMORY[0x212BC13A4](MEMORY[0x24BDCFBD8], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AD50);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BC1398](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20E5EAB18(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_20E5EAB5C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BC1374](a1, v6, a5);
}

uint64_t dispatch thunk of static NoiseDH.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseDHPrivate.init(rawRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of NoiseDHPublic.noiseRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NoiseDHPublic.init(noiseRepresentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static NoiseDHPublic.noiseRepresentationByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseCipherNonce.init<A>(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.tag.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.ciphertext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.nonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of NoiseAEADSealedBox.init<A, B>(nonce:ciphertext:tag:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 48))(a1);
}

uint64_t dispatch thunk of static NoiseCipher.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static NoiseCipher.bigEndianNonce.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static NoiseCipher.tagByteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static NoiseCipher.seal<A, B>(_:using:nonce:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 72))(a1, a2);
}

uint64_t dispatch thunk of static NoiseCipher.open<A>(_:using:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t TransportState.readKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  type metadata accessor for CipherState(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v11 - v6, v3 + *(int *)(a1 + 44));
  v9 = sub_20E5FF3A4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a3, v7, v9);
}

uint64_t TransportState.writeKey.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  type metadata accessor for CipherState(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v11 - v6, v3 + *(int *)(a1 + 40));
  v9 = sub_20E5FF3A4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a3, v7, v9);
}

uint64_t TransportState.encryptOutgoingPayload<A>(_:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;

  v11 = sub_20E5FF5CC();
  v12 = *(_QWORD *)(a4 + 16);
  v13 = *(_QWORD *)(a4 + 24);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 64))(v12, v13);
  if (__OFSUB__(0xFFFFLL, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (0xFFFF - result < v11)
  {
    sub_20E5EAA04();
    swift_allocError();
    *v16 = 5;
    return swift_willThrow();
  }
  if (*v6 != 1)
  {
    if ((v6[1] & 1) == 0)
    {
      v21 = a2;
      v22 = a3;
      goto LABEL_8;
    }
LABEL_11:
    __break(1u);
    return result;
  }
  v21 = a2;
  v22 = a3;
LABEL_8:
  v17 = type metadata accessor for CipherState(0, v12, v13, v15);
  v18 = sub_20E5EAF50();
  return sub_20E5EA174(a1, (uint64_t)&v21, v17, a5, MEMORY[0x24BDCDDE8], a6, v18);
}

unint64_t sub_20E5EAF50()
{
  unint64_t result;

  result = qword_254A2AD58[0];
  if (!qword_254A2AD58[0])
  {
    result = MEMORY[0x212BC13A4](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, qword_254A2AD58);
  }
  return result;
}

uint64_t TransportState.decryptIncomingPayload<A>(_:authenticating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;
  uint64_t result;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = sub_20E5FF5CC();
  if (result >= 0x10000)
  {
    sub_20E5EAA04();
    swift_allocError();
    *v15 = 5;
    return swift_willThrow();
  }
  if (*v6 != 1)
  {
    v18 = a2;
    v19 = a3;
    goto LABEL_7;
  }
  if ((v6[1] & 1) == 0)
  {
    v18 = a2;
    v19 = a3;
LABEL_7:
    v16 = type metadata accessor for CipherState(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v14);
    v17 = sub_20E5EAF50();
    return sub_20E5EA5C8(a1, (uint64_t)&v18, v16, a5, MEMORY[0x24BDCDDE8], a6, v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_20E5EB0C0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20E5EB0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for CipherState(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_20E5EB140(char *a1, uint64_t *a2, uint64_t a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    v7 = *(int *)(a3 + 40);
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = sub_20E5FF3A4();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v13 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v12);
    *(_QWORD *)&v8[*(int *)(v13 + 36)] = *(_QWORD *)&v9[*(int *)(v13 + 36)];
    v14 = *(int *)(a3 + 44);
    v15 = &v4[v14];
    v16 = (char *)a2 + v14;
    v11(&v4[v14], v16, v10);
    *(_QWORD *)&v15[*(int *)(v13 + 36)] = *(_QWORD *)&v16[*(int *)(v13 + 36)];
  }
  return v4;
}

uint64_t sub_20E5EB228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_20E5FF3A4();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 44), v5);
}

char *sub_20E5EB298(char *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  *(_WORD *)a1 = *a2;
  v6 = *(int *)(a3 + 40);
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_20E5FF3A4();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  v12 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v11);
  *(_QWORD *)&v7[*(int *)(v12 + 36)] = *(_QWORD *)&v8[*(int *)(v12 + 36)];
  v13 = *(int *)(a3 + 44);
  v14 = &a1[v13];
  v15 = (char *)a2 + v13;
  v10(&a1[v13], v15, v9);
  *(_QWORD *)&v14[*(int *)(v12 + 36)] = *(_QWORD *)&v15[*(int *)(v12 + 36)];
  return a1;
}

_BYTE *sub_20E5EB354(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  void (*v10)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 40);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E5FF3A4();
  v10 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v12 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v11);
  *(_QWORD *)&v7[*(int *)(v12 + 36)] = *(_QWORD *)&v8[*(int *)(v12 + 36)];
  v13 = *(int *)(a3 + 44);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v10(&a1[v13], v15, v9);
  *(_QWORD *)&v14[*(int *)(v12 + 36)] = *(_QWORD *)&v15[*(int *)(v12 + 36)];
  return a1;
}

char *sub_20E5EB418(char *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  *(_WORD *)a1 = *a2;
  v6 = *(int *)(a3 + 40);
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_20E5FF3A4();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v12 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v11);
  *(_QWORD *)&v7[*(int *)(v12 + 36)] = *(_QWORD *)&v8[*(int *)(v12 + 36)];
  v13 = *(int *)(a3 + 44);
  v14 = &a1[v13];
  v15 = (char *)a2 + v13;
  v10(&a1[v13], v15, v9);
  *(_QWORD *)&v14[*(int *)(v12 + 36)] = *(_QWORD *)&v15[*(int *)(v12 + 36)];
  return a1;
}

_BYTE *sub_20E5EB4D4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  void (*v10)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 40);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E5FF3A4();
  v10 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  v12 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v11);
  *(_QWORD *)&v7[*(int *)(v12 + 36)] = *(_QWORD *)&v8[*(int *)(v12 + 36)];
  v13 = *(int *)(a3 + 44);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v10(&a1[v13], v15, v9);
  *(_QWORD *)&v14[*(int *)(v12 + 36)] = *(_QWORD *)&v15[*(int *)(v12 + 36)];
  return a1;
}

uint64_t sub_20E5EB598()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E5EB5A4(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5;
  BOOL v6;
  int v7;
  uint64_t v11;

  if ((_DWORD)a2 == 254)
  {
    v5 = *a1;
    v6 = v5 >= 2;
    v7 = (v5 + 2147483646) & 0x7FFFFFFF;
    if (v6)
      return (v7 + 1);
    else
      return 0;
  }
  else
  {
    v11 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(&a1[*(int *)(a3 + 40)], a2, v11);
  }
}

uint64_t sub_20E5EB624()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_20E5EB630(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v7 = type metadata accessor for CipherState(0, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), a4);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 40)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for TransportState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TransportState);
}

uint64_t sub_20E5EB6B0@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _BYTE *a7@<X8>)
{
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v17)(_BYTE *, uint64_t, uint64_t);

  *a7 = a1;
  a7[1] = a2;
  v12 = type metadata accessor for TransportState(0, a5, a6, a4);
  v13 = &a7[*(int *)(v12 + 40)];
  v15 = type metadata accessor for CipherState(0, a5, a6, v14);
  v17 = *(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32);
  v17(v13, a3, v15);
  return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v17)(&a7[*(int *)(v12 + 44)], a4, v15);
}

uint64_t type metadata accessor for SecureBytes.Backing()
{
  uint64_t result;

  result = qword_254A2ADE8;
  if (!qword_254A2ADE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20E5EB7A4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_20E5EB7E0()
{
  uint64_t result;

  type metadata accessor for SecureBytes.Backing();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  qword_254A2ADE0 = result;
  return result;
}

char *sub_20E5EB810(char *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char *v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  size_t v11;
  BOOL v12;
  size_t v13;
  size_t v14;
  size_t v15;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  v4 = v3;
  v7 = result;
  result = (char *)_swift_stdlib_malloc_size(result);
  if ((uint64_t)(result - 32) < a3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v8 = _swift_stdlib_malloc_size(v4) - 32;
  v9 = v4 + 2;
  result = (char *)swift_beginAccess();
  v10 = v4[2];
  v11 = v8 - v10;
  if (__OFSUB__(v8, v10))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v12 = __OFSUB__(a3, a2);
  v13 = a3 - a2;
  if (v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v12 = __OFSUB__(v11, v13);
  v14 = v11 - v13;
  if (v12)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  result = (char *)_swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = (char *)memmove((char *)v4 + v10 + 32, &v7[a2 + 32], v13);
  v15 = *v9 + v13;
  if (!__OFADD__(*v9, v13))
  {
    result = (char *)swift_beginAccess();
    *v9 = v15;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

size_t sub_20E5EB920(char a1)
{
  uint64_t *v1;
  uint64_t *v2;
  size_t v4;
  uint64_t *v5;
  size_t result;
  int64_t v7;
  size_t v8;
  BOOL v9;
  size_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = _swift_stdlib_malloc_size(v2) - 32;
  v5 = v2 + 2;
  result = swift_beginAccess();
  v7 = v2[2];
  v8 = v4 - v7;
  if (__OFSUB__(v4, v7))
  {
    __break(1u);
    goto LABEL_8;
  }
  v9 = __OFSUB__(v8, 1);
  v10 = v8 - 1;
  if (v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *((_BYTE *)v2 + v7 + 32) = a1;
  v11 = *v5 + 1;
  if (!__OFADD__(*v5, 1))
  {
    result = swift_beginAccess();
    *v5 = v11;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

size_t sub_20E5EB9E8(const void *a1, size_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  size_t v6;
  _QWORD *v7;
  size_t result;
  int64_t v9;
  size_t v10;
  BOOL v11;
  size_t v12;

  v3 = v2;
  v6 = _swift_stdlib_malloc_size(v2) - 32;
  v7 = v2 + 2;
  result = swift_beginAccess();
  v9 = v3[2];
  v10 = v6 - v9;
  if (__OFSUB__(v6, v9))
  {
    __break(1u);
    goto LABEL_11;
  }
  v11 = __OFSUB__(v10, a2);
  v12 = v10 - a2;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v9)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!a1)
    goto LABEL_8;
  if ((a2 & 0x8000000000000000) == 0)
  {
    result = (size_t)memmove((char *)v3 + v9 + 32, a1, a2);
LABEL_8:
    if (!__OFADD__(*v7, a2))
    {
      *v7 += a2;
      return result;
    }
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
  return result;
}

size_t sub_20E5EBAB8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  size_t v3;
  size_t result;
  int64_t v5;
  size_t v6;
  BOOL v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  v2 = sub_20E5FF5CC();
  v3 = _swift_stdlib_malloc_size(v1) - 32;
  result = swift_beginAccess();
  v5 = v1[2];
  v6 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
    __break(1u);
    goto LABEL_8;
  }
  v7 = __OFSUB__(v6, v2);
  v8 = v6 - v2;
  if (v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = _swift_stdlib_malloc_size(v1);
  if ((uint64_t)(result - 32) < v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  result = sub_20E5FF644();
  v9 = v1[2];
  v7 = __OFADD__(v9, v2);
  v10 = v9 + v2;
  if (!v7)
  {
    v1[2] = v10;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

size_t sub_20E5EBBA4(int64_t a1)
{
  const void **v1;
  const void **v2;
  char *v4;
  size_t result;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = (char *)*v2;
  result = _swift_stdlib_malloc_size(*v2);
  if ((uint64_t)(result - 32) < a1)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(a1))
    {
      if ((_DWORD)a1)
      {
        v6 = (a1 - 1) | ((a1 - 1) >> 1) | ((((_DWORD)a1 - 1) | ((a1 - 1) >> 1)) >> 2);
        v7 = v6 | (v6 >> 4) | ((v6 | (v6 >> 4)) >> 8);
        v8 = v7 | HIWORD(v7);
        if (v8 == -1)
          v9 = 0xFFFFFFFFLL;
        else
          v9 = (v8 + 1);
      }
      else
      {
        v9 = 1;
      }
      type metadata accessor for SecureBytes.Backing();
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = 0;
      *(_QWORD *)(v10 + 24) = v9;
      result = swift_beginAccess();
      v11 = *((_QWORD *)v4 + 2);
      if ((v11 & 0x8000000000000000) == 0)
      {
        sub_20E5EB810(v4, 0, v11);
        result = swift_release();
        *v2 = (const void *)v10;
        return result;
      }
LABEL_14:
      __break(1u);
      return result;
    }
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_20E5EBC8C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  return sub_20E5EE344(v2 + 32, v2 + 32 + *(_QWORD *)(v2 + 16), v3) & 1;
}

void sub_20E5EBCEC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_20E5EBCF4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *a1 = *(_QWORD *)(v3 + 16);
  return result;
}

uint64_t (*sub_20E5EBD38(_BYTE *a1, _QWORD *a2))()
{
  _QWORD *v2;

  *a1 = *(_BYTE *)(*v2 + *a2 + 32);
  return nullsub_1;
}

uint64_t sub_20E5EBD64@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v5 = *a1;
  v4 = a1[1];
  v6 = *v2;
  result = swift_beginAccess();
  v8 = *(_QWORD *)(v6 + 16);
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v8 >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v6;
    return swift_retain();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20E5EBDDC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *v1;
  result = swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = v5;
  }
  return result;
}

BOOL sub_20E5EBE28()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(_QWORD *)(v1 + 16) == 0;
}

void sub_20E5EBE6C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_20E5EBE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = swift_beginAccess();
  v9 = *(_QWORD *)(a4 + 16);
  if (v9 < a3 || (a3 | a1) < 0 || v9 < a1)
  {
    __break(1u);
    goto LABEL_16;
  }
  v10 = a3 - a1;
  if (a2 >= 1)
  {
    if (v10 < 0 || v10 >= a2)
      goto LABEL_11;
    return 0;
  }
  if (v10 <= 0 && v10 > a2)
    return 0;
LABEL_11:
  result = a1 + a2;
  if (__OFADD__(a1, a2))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (result < 0 || v9 < result)
    goto LABEL_17;
  return result;
}

uint64_t *sub_20E5EBF4C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *sub_20E5EBF68(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

_QWORD *sub_20E5EBF84(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *sub_20E5EBFA0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_20E5EBFB8(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void sub_20E5EBFD0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_20E5EBFDC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(_QWORD *)(v1 + 16);
}

uint64_t sub_20E5EC018()
{
  return 2;
}

uint64_t sub_20E5EC020()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = sub_20E5EE4E4(*v0);
  swift_release();
  return v1;
}

uint64_t sub_20E5EC054(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_20E5EC05C(a1, a2, a3, *v3);
}

uint64_t sub_20E5EC05C(uint64_t result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (_QWORD *)result;
  if (!a2)
  {
    v6 = 0;
    goto LABEL_14;
  }
  v6 = a3;
  if (!a3)
  {
LABEL_14:
    *v5 = a4;
    v5[1] = v6;
    return v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    result = swift_beginAccess();
    v8 = *(_QWORD *)(a4 + 16);
    if (v8)
    {
      *a2 = *(_BYTE *)(a4 + 32);
      v9 = v6 - 1;
      if (v6 != 1)
      {
        v10 = 0;
        while (v9 != v10)
        {
          if (__OFSUB__(v8, v10 + 1))
            goto LABEL_16;
          if (v8 - 1 == v10)
            goto LABEL_13;
          a2[v10 + 1] = *(_BYTE *)(a4 + 33 + v10);
          if (v9 == ++v10)
            goto LABEL_14;
        }
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
LABEL_13:
      v6 = v8;
    }
    goto LABEL_14;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_20E5EC130@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_20E5EC14C(a1, a2, a3);
}

uint64_t sub_20E5EC14C@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_20E5ED610(a1, a2, a3);
}

_QWORD *sub_20E5EC170@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    *a2 = *result - 1;
  return result;
}

_QWORD *sub_20E5EC188(_QWORD *result)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    --*result;
  return result;
}

_QWORD *sub_20E5EC1A0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    v6 = *v3;
    result = (_QWORD *)swift_beginAccess();
    if ((v5 & 0x8000000000000000) == 0 && *(_QWORD *)(v6 + 16) >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20E5EC20C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t result;
  char v7;

  result = sub_20E5EBE84(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t sub_20E5EC244(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  result = swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 16);
  if (v7 >= v4 && ((v4 | v3) & 0x8000000000000000) == 0 && v7 >= v3)
    return v4 - v3;
  __break(1u);
  return result;
}

_BYTE *sub_20E5EC2B0(_BYTE *result, _QWORD *a2)
{
  _QWORD *v2;

  *(_BYTE *)(*v2 + *a2 + 32) = *result;
  return result;
}

uint64_t (*sub_20E5EC2C8(uint64_t a1, uint64_t *a2))(uint64_t result)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(*v2 + v3 + 32);
  return sub_20E5EC2F4;
}

uint64_t sub_20E5EC2F4(uint64_t result)
{
  *(_BYTE *)(**(_QWORD **)result + *(_QWORD *)(result + 8) + 32) = *(_BYTE *)(result + 16);
  return result;
}

uint64_t sub_20E5EC30C(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;

  sub_20E5EE3D0(v2, *a2, a2[1], *a1, a1[1], a1[2]);
  return swift_release();
}

void (*sub_20E5EC344(_QWORD *a1, uint64_t *a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_20E5EC3BC(v4, *a2, a2[1]);
  return sub_20E5EC390;
}

void sub_20E5EC390(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_20E5EC3BC(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t *v3;
  _QWORD *v7;
  uint64_t v8;
  void (*result)(uint64_t **);
  uint64_t v10;

  v7 = malloc(0x48uLL);
  *a1 = v7;
  v7[7] = a3;
  v7[8] = v3;
  v7[6] = a2;
  v8 = *v3;
  result = (void (*)(uint64_t **))swift_beginAccess();
  v10 = *(_QWORD *)(v8 + 16);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v10 >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain();
    return sub_20E5EC460;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_20E5EC460(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_20E5EE3D0((uint64_t *)(*a1)[8], v1[6], (*a1)[7], *v1, v1[1], v1[2]);
  swift_release();
  free(v1);
}

uint64_t sub_20E5EC49C@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_20E5EE5C0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

_QWORD *sub_20E5EC4C4(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *result;
  v4 = *a2;
  if (__OFSUB__(*a2, *result))
  {
    __break(1u);
  }
  else if (*a2 != *result)
  {
    v5 = *v2 + 32;
    v6 = *(_BYTE *)(v5 + v3);
    *(_BYTE *)(v5 + v3) = *(_BYTE *)(v5 + v4);
    *(_BYTE *)(v5 + v4) = v6;
  }
  return result;
}

uint64_t sub_20E5EC4F8()
{
  return sub_20E5FF4D0();
}

uint64_t sub_20E5EC518()
{
  return sub_20E5FF4C4();
}

uint64_t sub_20E5EC538(int64_t a1, int64_t a2, size_t a3)
{
  const void **v3;
  const void **v4;
  _QWORD *v8;
  uint64_t result;
  int64_t v10;
  BOOL v11;
  int64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  const void *v18;
  char *v19;
  uint64_t v20;

  v4 = v3;
  v8 = (char *)*v3 + 16;
  result = swift_beginAccess();
  v10 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  v11 = __OFSUB__(*v8, v10);
  v12 = *v8 - v10;
  if (v11)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v13 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    result = _swift_stdlib_malloc_size(*v4);
    if (result - 32 >= v13)
    {
      if (a2 >= a1)
        return sub_20E5ECA48(a1, a2, a3);
      goto LABEL_26;
    }
  }
  if (v13 < 0)
    goto LABEL_22;
  if (HIDWORD(v13))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((_DWORD)v13)
  {
    v14 = (v13 - 1) | ((v13 - 1) >> 1) | ((((_DWORD)v13 - 1) | ((v13 - 1) >> 1)) >> 2);
    v15 = v14 | (v14 >> 4) | ((v14 | (v14 >> 4)) >> 8);
    v16 = v15 | HIWORD(v15);
    if (v16 == -1)
      v17 = 0xFFFFFFFFLL;
    else
      v17 = (v16 + 1);
  }
  else
  {
    v17 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = v17;
  if (a1 < 0)
    goto LABEL_24;
  v18 = (const void *)result;
  v19 = (char *)*v4;
  result = swift_beginAccess();
  v20 = *((_QWORD *)v19 + 2);
  if (v20 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_20E5EB810(v19, 0, a1);
  sub_20E5EB920(a3);
  sub_20E5EB810((char *)*v4, a2, v20);
  *v4 = v18;
  return swift_release();
}

uint64_t sub_20E5EC6D4(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  const void **v4;
  const void **v5;
  _QWORD *v10;
  uint64_t result;
  int64_t v12;
  BOOL v13;
  int64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  const void *v20;
  char *v21;
  uint64_t v22;

  v5 = v4;
  v10 = (char *)*v4 + 16;
  result = swift_beginAccess();
  v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  v13 = __OFSUB__(*v10, v12);
  v14 = *v10 - v12;
  if (v13)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v15 = v14 + a4;
  if (__OFADD__(v14, a4))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1)
        return sub_20E5ECB44(a1, a2, a3, a4);
      goto LABEL_26;
    }
  }
  if (v15 < 0)
    goto LABEL_22;
  if (HIDWORD(v15))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((_DWORD)v15)
  {
    v16 = (v15 - 1) | ((v15 - 1) >> 1) | ((((_DWORD)v15 - 1) | ((v15 - 1) >> 1)) >> 2);
    v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
    v18 = v17 | HIWORD(v17);
    if (v18 == -1)
      v19 = 0xFFFFFFFFLL;
    else
      v19 = (v18 + 1);
  }
  else
  {
    v19 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = v19;
  if (a1 < 0)
    goto LABEL_24;
  v20 = (const void *)result;
  v21 = (char *)*v5;
  result = swift_beginAccess();
  v22 = *((_QWORD *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_20E5EB810(v21, 0, a1);
  sub_20E5EB9E8(a3, a4);
  sub_20E5EB810((char *)*v5, a2, v22);
  *v5 = v20;
  return swift_release();
}

uint64_t sub_20E5EC87C(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  const void **v4;
  const void **v5;
  _QWORD *v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  BOOL v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  const void *v20;
  char *v21;
  uint64_t v22;

  v5 = v4;
  v10 = (char *)*v4 + 16;
  result = swift_beginAccess();
  v12 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_20;
  }
  v13 = *v10 - v12;
  if (__OFSUB__(*v10, v12))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  result = sub_20E5FF5CC();
  v14 = __OFADD__(v13, result);
  v15 = v13 + result;
  if (v14)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    result = _swift_stdlib_malloc_size(*v5);
    if (result - 32 >= v15)
    {
      if (a2 >= a1)
        return sub_20E5ECC4C(a1, a2, a3, a4);
      goto LABEL_26;
    }
  }
  if (v15 < 0)
    goto LABEL_22;
  if (HIDWORD(v15))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((_DWORD)v15)
  {
    v16 = (v15 - 1) | ((v15 - 1) >> 1) | ((((_DWORD)v15 - 1) | ((v15 - 1) >> 1)) >> 2);
    v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
    v18 = v17 | HIWORD(v17);
    if (v18 == -1)
      v19 = 0xFFFFFFFFLL;
    else
      v19 = (v18 + 1);
  }
  else
  {
    v19 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = v19;
  if (a1 < 0)
    goto LABEL_24;
  v20 = (const void *)result;
  v21 = (char *)*v5;
  result = swift_beginAccess();
  v22 = *((_QWORD *)v21 + 2);
  if (v22 < a2)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  sub_20E5EB810(v21, 0, a1);
  sub_20E5EBAB8();
  sub_20E5EB810((char *)*v5, a2, v22);
  *v5 = v20;
  return swift_release();
}

size_t sub_20E5ECA48(int64_t a1, int64_t a2, size_t a3)
{
  _QWORD *v3;
  _QWORD *v7;
  size_t result;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = v3 + 2;
  result = swift_beginAccess();
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  v10 = v3[2];
  v11 = v10 - v9;
  if (__OFSUB__(v10, v9))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = _swift_stdlib_malloc_size(v3);
  if ((uint64_t)(result - 32) < v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v13 = __OFSUB__(1, v9);
  v14 = 1 - v9;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_20E5ED9B8(a2, v10, v14);
  result = sub_20E5EDA6C(a3, a1);
  v15 = v3[2];
  v16 = v15 + v14;
  if (!__OFADD__(v15, v14))
  {
    result = swift_beginAccess();
    *v7 = v16;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

size_t sub_20E5ECB44(uint64_t a1, int64_t a2, void *a3, size_t a4)
{
  _QWORD *v4;
  _QWORD *v9;
  size_t result;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = v4 + 2;
  result = swift_beginAccess();
  v11 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = v4[2];
  v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v14 = v13 + a4;
  if (__OFADD__(v13, a4))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) < v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v15 = __OFSUB__(a4, v11);
  v16 = a4 - v11;
  if (v15)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v12 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_20E5ED9B8(a2, v12, v16);
  result = (size_t)sub_20E5EDADC(a3, a4, a1);
  v17 = v4[2];
  v18 = v17 + v16;
  if (!__OFADD__(v17, v16))
  {
    result = swift_beginAccess();
    *v9 = v18;
    return result;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_20E5ECC4C(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t *v4;
  int64_t *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t *v15;
  uint64_t result;
  int64_t v17;
  int64_t v18;
  BOOL v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;

  v5 = v4;
  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v14);
  v15 = v5 + 2;
  result = swift_beginAccess();
  v17 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }
  v27 = a2;
  v18 = *v15 - v17;
  if (__OFSUB__(*v15, v17))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = sub_20E5FF5CC();
  v19 = __OFADD__(v18, result);
  v20 = v18 + result;
  if (v19)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v26 = a1;
  v21 = _swift_stdlib_malloc_size(v5) - 32;
  result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a4);
  if (v21 < v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  result = sub_20E5FF5CC();
  v22 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = v27;
  if (*v15 < v27)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_20E5ED9B8(v27, *v15, v22);
  sub_20E5EDB84(a3, v26, a4);
  result = sub_20E5FF5CC();
  v23 = result - v17;
  if (__OFSUB__(result, v17))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v19 = __OFADD__(*v15, v23);
  v24 = *v15 + v23;
  if (!v19)
  {
    *v15 = v24;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_20E5ECDDC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t result;
  size_t v14;
  uint64_t v15;
  _BYTE v16[16];
  _QWORD *v17;
  char v18;
  unsigned __int8 v19;
  char v20;

  v3 = v2;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = &v16[-v11];
  v17 = v3;
  result = sub_20E5FF5B4();
  if (v18 == 1)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    sub_20E5FF5A8();
    swift_getAssociatedConformanceWitness();
    sub_20E5FF638();
    if ((v20 & 1) == 0)
    {
      v14 = v19;
      do
      {
        v15 = *v3;
        swift_beginAccess();
        sub_20E5EC538(*(_QWORD *)(v15 + 16), *(_QWORD *)(v15 + 16), v14);
        sub_20E5FF638();
        v14 = v19;
      }
      while (v20 != 1);
    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_20E5ECFAC@<X0>(_QWORD *a1@<X8>)
{
  if (qword_254A2ACB0 != -1)
    swift_once();
  *a1 = qword_254A2ADE0;
  return swift_retain();
}

uint64_t sub_20E5ECFFC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_20E5EC87C(*a1, a1[1], a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
}

uint64_t sub_20E5ED050@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = sub_20E5EEA58(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20E5ED078()
{
  return sub_20E5FF5F0();
}

uint64_t sub_20E5ED090(unsigned __int8 *a1)
{
  uint64_t *v1;
  uint64_t v2;
  size_t v3;

  v2 = *v1;
  v3 = *a1;
  swift_beginAccess();
  return sub_20E5EC538(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 16), v3);
}

uint64_t sub_20E5ED0E8(uint64_t a1, uint64_t a2)
{
  sub_20E5ECDDC(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

uint64_t sub_20E5ED124(unsigned __int8 *a1, int64_t *a2)
{
  return sub_20E5EC538(*a2, *a2, *a1);
}

uint64_t sub_20E5ED134()
{
  return sub_20E5FF5E4();
}

uint64_t sub_20E5ED14C@<X0>(int64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  int64_t v4;
  uint64_t v5;
  uint64_t result;
  int64_t v7;
  char v8;

  v4 = *a1;
  v5 = *v2;
  result = swift_beginAccess();
  if (!*(_QWORD *)(v5 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }
  v7 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 >= v4)
  {
    v8 = *(_BYTE *)(v5 + v4 + 32);
    result = sub_20E5EE86C(v4, v7);
    *a2 = v8;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20E5ED1CC(int64_t *a1)
{
  return sub_20E5EE86C(*a1, a1[1]);
}

void sub_20E5ED1D8(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_20E5ED1E4()
{
  return 0;
}

int64_t sub_20E5ED1EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  int64_t result;
  uint64_t v5;
  char v6;
  char v7;

  v3 = *v1;
  result = swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = *(_BYTE *)(v3 + 32);
  result = sub_20E5EBE84(0, 1, v5, v3);
  if ((v7 & 1) == 0)
  {
    if ((result & 0x8000000000000000) == 0)
    {
      result = sub_20E5EE86C(0, result);
      *a1 = v6;
      return result;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

int64_t sub_20E5ED274(int64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  if (result)
  {
    v2 = result;
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      v3 = *v1;
      swift_beginAccess();
      result = sub_20E5EBE84(0, v2, *(_QWORD *)(v3 + 16), v3);
      if ((v4 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) == 0)
        return sub_20E5EE86C(0, result);
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_20E5ED2F8(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  int64_t v3;

  v2 = *v1;
  if ((a1 & 1) != 0)
  {
    swift_beginAccess();
    v3 = *(_QWORD *)(v2 + 16);
    if ((v3 & 0x8000000000000000) == 0)
      return sub_20E5EE86C(0, v3);
    __break(1u);
    goto LABEL_7;
  }
  swift_release();
  if (qword_254A2ACB0 != -1)
LABEL_7:
    swift_once();
  *v1 = qword_254A2ADE0;
  return swift_retain();
}

uint64_t sub_20E5ED394(uint64_t (*a1)(char *))
{
  return sub_20E5ED3A8(a1);
}

uint64_t sub_20E5ED3A8(uint64_t (*a1)(char *))
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  int64_t v10;
  char v11;
  char v12;

  v4 = *v1;
  v5 = (_QWORD *)(*v1 + 16);
  swift_retain();
  result = swift_beginAccess();
  v7 = 0;
  v8 = v4 + 32;
  do
  {
    if (__OFSUB__(*v5, v7))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v7 == *v5)
      goto LABEL_9;
    v12 = *(_BYTE *)(v4 + v7 + 32);
    result = a1(&v12);
    if (v2)
      return swift_release();
    if ((result & 1) != 0)
    {
      result = swift_release();
      v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      while (!__OFSUB__(*v5, v10))
      {
        if (*v5 == v10)
        {
          if (v10 < v7)
            goto LABEL_29;
          return sub_20E5EE86C(v7, v10);
        }
        v12 = *(_BYTE *)(v8 + v10);
        result = a1(&v12);
        if ((result & 1) == 0)
        {
          if (__OFSUB__(v10, v7))
            goto LABEL_28;
          if (v10 != v7)
          {
            v11 = *(_BYTE *)(v8 + v7);
            *(_BYTE *)(v8 + v7) = *(_BYTE *)(v8 + v10);
            *(_BYTE *)(v8 + v10) = v11;
          }
LABEL_14:
          v9 = __OFADD__(v7++, 1);
          if (v9)
            goto LABEL_27;
        }
        v9 = __OFADD__(v10++, 1);
        if (v9)
          goto LABEL_26;
      }
      goto LABEL_25;
    }
    v9 = __OFADD__(v7++, 1);
  }
  while (!v9);
  __break(1u);
LABEL_9:
  swift_release();
  v10 = *(_QWORD *)(v4 + 16);
  v7 = v10;
  return sub_20E5EE86C(v7, v10);
}

uint64_t sub_20E5ED52C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  return a1(a3 + 32, a3 + 32 + *(_QWORD *)(a3 + 16));
}

uint64_t sub_20E5ED5A0(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v1;

  swift_beginAccess();
  return a1(v1 + 32, v1 + 32 + *(_QWORD *)(v1 + 16));
}

uint64_t sub_20E5ED610@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  swift_beginAccess();
  result = a1(v3 + 32, *(_QWORD *)(v3 + 16));
  if (!v4)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, 0, 1, a2);
  return result;
}

uint64_t sub_20E5ED6A8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  uint64_t *v2;

  return sub_20E5ED52C(a1, a2, *v2);
}

uint64_t sub_20E5ED6C0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_retain();
}

uint64_t sub_20E5ED6CC()
{
  return sub_20E5FF200();
}

uint64_t sub_20E5ED6F0()
{
  return sub_20E5FF23C();
}

uint64_t sub_20E5ED718()
{
  return sub_20E5FF224();
}

uint64_t sub_20E5ED728()
{
  return sub_20E5FF218();
}

uint64_t sub_20E5ED740()
{
  return sub_20E5FF20C();
}

uint64_t sub_20E5ED75C()
{
  return sub_20E5FF29C();
}

uint64_t sub_20E5ED774()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

uint64_t sub_20E5ED7B8()
{
  return sub_20E5FF74C();
}

uint64_t sub_20E5ED7E0()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

_QWORD *sub_20E5ED820(_QWORD *result, _QWORD *a2)
{
  if (!__OFSUB__(*a2, *result))
    return (_QWORD *)(*a2 == *result);
  __break(1u);
  return result;
}

BOOL sub_20E5ED83C(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL sub_20E5ED850(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL sub_20E5ED864(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL sub_20E5ED878(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

_QWORD *sub_20E5ED88C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  if (__OFSUB__(*result, *v2))
    __break(1u);
  else
    *a2 = *result - *v2;
  return result;
}

_QWORD *sub_20E5ED8A8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  if (__OFADD__(*v2, *result))
    __break(1u);
  else
    *a2 = *v2 + *result;
  return result;
}

_QWORD *sub_20E5ED8C4(_QWORD *result, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, _QWORD *a6)
{
  if (__OFADD__(*a4, *a6))
  {
    __break(1u);
  }
  else
  {
    *result = *a4 + *a6;
    return 0;
  }
  return result;
}

uint64_t sub_20E5ED8E8()
{
  uint64_t v0;

  swift_beginAccess();
  memset_s((void *)(v0 + 32), *(_QWORD *)(v0 + 24), 0, *(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_20E5ED938()
{
  return type metadata accessor for SecureBytes.Backing();
}

ValueMetadata *type metadata accessor for SecureBytes()
{
  return &type metadata for SecureBytes;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SecureBytes.BackingHeader(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SecureBytes.BackingHeader()
{
  return &type metadata for SecureBytes.BackingHeader;
}

size_t sub_20E5ED9B8(size_t result, int64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  size_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  v4 = v3;
  v7 = result;
  result = _swift_stdlib_malloc_size(v4);
  v8 = v7 + a3;
  if (__OFADD__(v7, a3))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v9 = __OFADD__(a2, a3);
  v10 = a2 + a3;
  if (v9)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v10 < v8)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v8 < 1 || (uint64_t)(result - 32) < a2)
    goto LABEL_13;
  result = _swift_stdlib_malloc_size(v4);
  if ((uint64_t)(result - 32) >= v10)
  {
    _swift_stdlib_malloc_size(v4);
    return (size_t)memmove(&v4[v8 + 32], &v4[v7 + 32], a2 - v7);
  }
LABEL_14:
  __break(1u);
  return result;
}

size_t sub_20E5EDA6C(size_t result, int64_t a2)
{
  const void *v2;
  int64_t v4;
  char v5;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = result;
  result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 >= a2)
  {
    result = _swift_stdlib_malloc_size(v2);
    *((_BYTE *)v2 + a2 + 32) = v5;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

void *sub_20E5EDADC(void *result, size_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  const void *v8;

  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  v6 = a3 + a2;
  if (__OFADD__(a3, a2))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v7 = v3;
  v8 = result;
  result = (void *)_swift_stdlib_malloc_size(v7);
  if ((uint64_t)result - 32 < v6)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v6 < a3)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  result = (void *)_swift_stdlib_malloc_size(v7);
  if (v8)
  {
    if ((a2 & 0x8000000000000000) == 0)
      return memmove(&v7[a3 + 32], v8, a2);
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_20E5EDB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;
  const void *v4;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;

  v4 = v3;
  v8 = *(_QWORD *)(a3 - 8);
  result = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v12 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, a3);
  result = sub_20E5FF5CC();
  v13 = a2 + result;
  if (__OFADD__(a2, result))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v14 = _swift_stdlib_malloc_size(v4) - 32;
  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a3);
  if (v14 < v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = sub_20E5FF5CC();
  if (__OFADD__(a2, result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (a2 + result >= a2)
  {
    _swift_stdlib_malloc_size(v4);
    return sub_20E5FF644();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_20E5EDCA8(uint64_t (*a1)(uint64_t, uint64_t))
{
  return sub_20E5ED5A0(a1);
}

unint64_t sub_20E5EDCCC()
{
  unint64_t result;

  result = qword_254A2ADF8;
  if (!qword_254A2ADF8)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFBC0, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_254A2ADF8);
  }
  return result;
}

uint64_t sub_20E5EDD10()
{
  return MEMORY[0x24BEE1780];
}

uint64_t sub_20E5EDD1C()
{
  return MEMORY[0x24BEE17C0];
}

unint64_t sub_20E5EDD2C()
{
  unint64_t result;

  result = qword_254A2AE00;
  if (!qword_254A2AE00)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFC08, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_254A2AE00);
  }
  return result;
}

unint64_t sub_20E5EDD74()
{
  unint64_t result;

  result = qword_254A2AE08;
  if (!qword_254A2AE08)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFCB0, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE08);
  }
  return result;
}

unint64_t sub_20E5EDDBC()
{
  unint64_t result;

  result = qword_254A2AE10;
  if (!qword_254A2AE10)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFE20, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE10);
  }
  return result;
}

unint64_t sub_20E5EDE04()
{
  unint64_t result;

  result = qword_254A2AE18;
  if (!qword_254A2AE18)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFD68, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE18);
  }
  return result;
}

unint64_t sub_20E5EDE4C()
{
  unint64_t result;

  result = qword_254A2AE20;
  if (!qword_254A2AE20)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFE90, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE20);
  }
  return result;
}

uint64_t sub_20E5EDE90()
{
  return sub_20E5EE304(&qword_254A2AE28, &qword_254A2AE30, MEMORY[0x24BEE28E8]);
}

uint64_t sub_20E5EDEBC()
{
  return sub_20E5EE16C(&qword_254A2AE38, (uint64_t (*)(void))sub_20E5EDD74, MEMORY[0x24BDD0788]);
}

unint64_t sub_20E5EDEEC()
{
  unint64_t result;

  result = qword_254A2AE48;
  if (!qword_254A2AE48)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFD40, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE48);
  }
  return result;
}

uint64_t sub_20E5EDF30()
{
  return sub_20E5EE16C(&qword_254A2AE50, (uint64_t (*)(void))sub_20E5EDEEC, MEMORY[0x24BDD0790]);
}

unint64_t sub_20E5EDF60()
{
  unint64_t result;

  result = qword_254A2AE58;
  if (!qword_254A2AE58)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFFA8, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE58);
  }
  return result;
}

uint64_t sub_20E5EDFA4()
{
  return sub_20E5EE16C(&qword_254A2AE60, (uint64_t (*)(void))sub_20E5EDE04, MEMORY[0x24BEE4240]);
}

uint64_t sub_20E5EDFD0()
{
  return sub_20E5EE16C(&qword_254A2AE68, (uint64_t (*)(void))sub_20E5EDDBC, MEMORY[0x24BEE4220]);
}

unint64_t sub_20E5EE000()
{
  unint64_t result;

  result = qword_254A2AE70;
  if (!qword_254A2AE70)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFEE0, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AE70);
  }
  return result;
}

uint64_t sub_20E5EE044()
{
  return sub_20E5EE26C(&qword_254A2AE78, MEMORY[0x24BEE1BD0]);
}

unint64_t sub_20E5EE068()
{
  unint64_t result;

  result = qword_254A2AE88;
  if (!qword_254A2AE88)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFB68, &type metadata for SecureBytes.Index);
    atomic_store(result, (unint64_t *)&qword_254A2AE88);
  }
  return result;
}

unint64_t sub_20E5EE0AC()
{
  unint64_t result;

  result = qword_254A2AE90;
  if (!qword_254A2AE90)
  {
    result = MEMORY[0x212BC13A4](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254A2AE90);
  }
  return result;
}

uint64_t sub_20E5EE0F0()
{
  return sub_20E5EE16C(&qword_254A2AE98, (uint64_t (*)(void))sub_20E5EDE4C, MEMORY[0x24BEE4230]);
}

uint64_t sub_20E5EE11C()
{
  return sub_20E5EE26C(&qword_254A2AEA0, MEMORY[0x24BEE1BA8]);
}

uint64_t sub_20E5EE140()
{
  return sub_20E5EE16C(&qword_254A2AEA8, (uint64_t (*)(void))sub_20E5EE000, MEMORY[0x24BEE4218]);
}

uint64_t sub_20E5EE16C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AE40);
    v8 = a2();
    result = MEMORY[0x212BC13A4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20E5EE1D4()
{
  return sub_20E5EE304(&qword_254A2AEB0, &qword_254A2AEB8, MEMORY[0x24BEE2C18]);
}

unint64_t sub_20E5EE204()
{
  unint64_t result;

  result = qword_254A2AEC0;
  if (!qword_254A2AEC0)
  {
    result = MEMORY[0x212BC13A4](&unk_20E5FFF40, &type metadata for SecureBytes);
    atomic_store(result, (unint64_t *)&qword_254A2AEC0);
  }
  return result;
}

uint64_t sub_20E5EE248()
{
  return sub_20E5EE26C(&qword_254A2AEC8, MEMORY[0x24BEE1BD8]);
}

uint64_t sub_20E5EE26C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AE80);
    v6[0] = sub_20E5EE068();
    v6[1] = sub_20E5EE0AC();
    result = MEMORY[0x212BC13A4](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20E5EE2D8()
{
  return sub_20E5EE304(&qword_254A2AED0, &qword_254A2AE40, MEMORY[0x24BEE4238]);
}

uint64_t sub_20E5EE304(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BC13A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20E5EE344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  swift_beginAccess();
  result = a2 - a1;
  if (a1)
    v7 = a2 - a1;
  else
    v7 = 0;
  if (v7 != *(_QWORD *)(a3 + 16))
    return 0;
  if (a1)
    return cc_cmp_safe() == 0;
  __break(1u);
  return result;
}

uint64_t sub_20E5EE3D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v11 = *a1;
  result = swift_beginAccess();
  v13 = *(_QWORD *)(v11 + 16);
  if (v13 < 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (a2 < 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v13 < a3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (__OFSUB__(a3, a2))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (a3 != a2)
  {
    if (__OFSUB__(a5, a4))
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a5 == a4)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    while (a4 < a5)
    {
      *(_BYTE *)(v11 + 32 + a2) = *(_BYTE *)(a6 + 32 + a4);
      v14 = a2 + 1;
      if (__OFADD__(a2, 1))
        goto LABEL_19;
      if (__OFSUB__(a3, v14))
        goto LABEL_20;
      ++a4;
      if (v14 == a3)
        goto LABEL_6;
      if (__OFSUB__(a5, a4))
        goto LABEL_21;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_6:
  if (__OFSUB__(a5, a4))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_20E5EE4E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_beginAccess();
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  if (v2 <= 0)
  {
    v3 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254A2AED8);
    v3 = swift_allocObject();
    v4 = _swift_stdlib_malloc_size((const void *)v3);
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  }
  v5 = sub_20E5EC05C((uint64_t)&v7, (_BYTE *)(v3 + 32), v2, a1);
  swift_retain();
  result = swift_release();
  if (v5 == v2)
    return v3;
  __break(1u);
  return result;
}

uint64_t sub_20E5EE5C0(uint64_t (*a1)(char *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;

  v4 = *v1;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5 < 1)
    return 0;
  v6 = 0;
  v7 = v4 + 32;
  v8 = v4 + 31;
  do
  {
    v14 = *(_BYTE *)(v7 + v6);
    v9 = a1(&v14);
    if (v2)
      break;
    if ((v9 & 1) != 0)
    {
      if (v6 >= v5 - 1)
        return v6;
      while (1)
      {
        v14 = *(_BYTE *)(v8 + v5);
        result = a1(&v14);
        v11 = v5 - 1;
        if ((result & 1) == 0)
          break;
        v12 = v5 - 2;
        if (__OFSUB__(v11, 1))
        {
          __break(1u);
          goto LABEL_17;
        }
        --v5;
        if (v6 >= v12)
          return v6;
      }
      if (!__OFSUB__(v11, v6))
      {
        v13 = *(_BYTE *)(v7 + v6);
        *(_BYTE *)(v7 + v6) = *(_BYTE *)(v8 + v5);
        *(_BYTE *)(v8 + v5--) = v13;
        goto LABEL_3;
      }
LABEL_17:
      __break(1u);
      return result;
    }
LABEL_3:
    ++v6;
  }
  while (v6 < v5);
  return v6;
}

size_t sub_20E5EE6E8()
{
  _QWORD *v0;
  size_t v1;
  size_t result;
  int64_t v3;

  v1 = _swift_stdlib_malloc_size(v0) - 32;
  result = swift_beginAccess();
  v3 = v0[2];
  if (__OFSUB__(v1, v3))
  {
    __break(1u);
    goto LABEL_6;
  }
  if (((v1 - v3) & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = _swift_stdlib_malloc_size(v0);
  if ((uint64_t)(result - 32) >= v3)
  {
    v0[2] = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

size_t sub_20E5EE768(int64_t a1, int64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;
  size_t result;
  int64_t v7;
  int64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = v2 + 2;
  result = swift_beginAccess();
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_11;
  }
  v8 = v2[2];
  if (__OFSUB__(v8, v7))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < v8 - v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v9 = __OFSUB__(0, v7);
  v10 = a1 - a2;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v8 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = sub_20E5ED9B8(a2, v8, v10);
  if (a1 < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  result = _swift_stdlib_malloc_size(v2);
  if ((uint64_t)(result - 32) < a1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = _swift_stdlib_malloc_size(v2);
  v11 = v2[2];
  v12 = v11 + v10;
  if (!__OFADD__(v11, v10))
  {
    result = swift_beginAccess();
    *v5 = v12;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_20E5EE86C(int64_t a1, int64_t a2)
{
  const void **v2;
  const void **v3;
  _QWORD *v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  const void *v14;
  char *v15;
  uint64_t v16;

  v3 = v2;
  v6 = (char *)*v2 + 16;
  result = swift_beginAccess();
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_19;
  }
  v9 = *v6 - v8;
  if (__OFSUB__(*v6, v8))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result)
  {
    result = _swift_stdlib_malloc_size(*v3);
    if (result - 32 >= v9)
    {
      if (a2 >= a1)
        return sub_20E5EE768(a1, a2);
      goto LABEL_24;
    }
  }
  if (v9 < 0)
    goto LABEL_20;
  if (HIDWORD(v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if ((_DWORD)v9)
  {
    v10 = (v9 - 1) | ((v9 - 1) >> 1) | ((((_DWORD)v9 - 1) | ((v9 - 1) >> 1)) >> 2);
    v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    v12 = v11 | HIWORD(v11);
    if (v12 == -1)
      v13 = 0xFFFFFFFFLL;
    else
      v13 = (v12 + 1);
  }
  else
  {
    v13 = 1;
  }
  type metadata accessor for SecureBytes.Backing();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = v13;
  if (a1 < 0)
    goto LABEL_22;
  v14 = (const void *)result;
  v15 = (char *)*v3;
  result = swift_beginAccess();
  v16 = *((_QWORD *)v15 + 2);
  if (v16 < a2)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    return result;
  }
  sub_20E5EB810(v15, 0, a1);
  sub_20E5EE6E8();
  sub_20E5EB810((char *)*v3, a2, v16);
  *v3 = v14;
  return swift_release();
}

uint64_t sub_20E5EE9E8(void *a1, size_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = **(_QWORD **)(v2 + 16);
  swift_beginAccess();
  return sub_20E5EC6D4(*(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 16), a1, a2);
}

uint64_t sub_20E5EEA58(size_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  if (qword_254A2ACB0 != -1)
    swift_once();
  result = qword_254A2ADE0;
  v5 = qword_254A2ADE0;
  if (!a2)
    return swift_retain();
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    do
    {
      swift_beginAccess();
      sub_20E5EC538(*(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 16), a1);
      --a2;
    }
    while (a2);
    return v5;
  }
  return result;
}

ValueMetadata *type metadata accessor for SecureBytes.Index()
{
  return &type metadata for SecureBytes.Index;
}

uint64_t HandshakeState.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 84);
  swift_getAssociatedTypeWitness();
  v5 = sub_20E5FF5FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t HandshakeState.e.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 84);
  swift_getAssociatedTypeWitness();
  v5 = sub_20E5FF5FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*HandshakeState.e.modify())()
{
  return nullsub_1;
}

void HandshakeState.init(handshakePattern:isInitiator:prologue:psk:responderStaticPriv:responderStaticPublic:initiatorStaticPriv:initiatorStaticPublic:)(int a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[17];
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v35 = a7;
  v36 = a6;
  v37 = a5;
  v33 = a4;
  v43 = a2;
  v44 = a3;
  v32 = a1;
  v47 = a15;
  v45 = a12;
  v31 = a11;
  v46 = a14;
  v34 = a9;
  swift_getAssociatedTypeWitness();
  v39 = sub_20E5FF5FC();
  v41 = *(_QWORD *)(v39 - 8);
  v16 = MEMORY[0x24BDAC7A8](v39);
  v30[8] = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v30[6] = (char *)v30 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v30[7] = (char *)v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v30[4] = (char *)v30 - v22;
  v42 = a13;
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  v38 = sub_20E5FF5FC();
  v40 = *(_QWORD *)(v38 - 8);
  v23 = MEMORY[0x24BDAC7A8](v38);
  v30[5] = (char *)v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v30[2] = (char *)v30 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v30[3] = (char *)v30 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30[1] = (char *)v30 - v29;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  v48 = a10;
  v49 = v31;
  v50 = v45;
  v51 = a13;
  v52 = v46;
  v53 = v47;
  type metadata accessor for HandshakeState();
}

void type metadata accessor for HandshakeState()
{
  JUMPOUT(0x212BC1374);
}

uint64_t sub_20E5EF814(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _DWORD v26[4];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v33 = a4;
  v34 = a7;
  v31 = a3;
  v32 = a6;
  v29 = a2;
  v30 = a5;
  v8 = sub_20E5FF4F4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v13 = *((_QWORD *)a1 + 1);
  if (v13)
  {
    if (*(_QWORD *)(v13 + 16))
    {
      v26[3] = *a1;
      v27 = v9;
      v28 = v8;
      swift_bridgeObjectRetain();
      __asm { BR              X9 }
    }
    v35 = MEMORY[0x24BEE4AF8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AF68);
    sub_20E5F58A8();
    sub_20E5FF4B8();
    swift_bridgeObjectRelease();
  }
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_20E5FF668();
  swift_bridgeObjectRelease();
  v35 = 0x5F6573696F4ELL;
  v36 = 0xE600000000000000;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v14 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_13;
  }
  v15 = sub_20E5FA854(v12);
  if ((v16 & 1) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v17 = (uint64_t *)(*(_QWORD *)(v14 + 56) + 32 * v15);
  v18 = *v17;
  v19 = v17[1];
  v21 = v17[2];
  v20 = v17[3];
  swift_bridgeObjectRetain();
  MEMORY[0x212BC0FCC](v18, v19, v21, v20);
  swift_bridgeObjectRelease();
  sub_20E5FF554();
  swift_bridgeObjectRelease();
  sub_20E5FF554();
  swift_bridgeObjectRelease();
  sub_20E5FF554();
  (*(void (**)(void))(v30 + 24))();
  sub_20E5FF554();
  swift_bridgeObjectRelease();
  sub_20E5FF554();
  (*(void (**)(void))(v32 + 48))();
  sub_20E5FF554();
  swift_bridgeObjectRelease();
  sub_20E5FF554();
  (*(void (**)(void))(v34 + 16))();
  sub_20E5FF554();
  swift_bridgeObjectRelease();
  sub_20E5FF4E8();
  v22 = sub_20E5FF4DC();
  v24 = v23;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v24 >> 60 == 15)
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x20E5EFBE0);
  }
  return v22;
}

void sub_20E5EFBF4(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;
  char v54;

  v49 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_20E5FF5FC();
  v45 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v42 - v8;
  v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness() + 8) + 8) + 8);
  v47 = swift_getAssociatedTypeWitness();
  v48 = sub_20E5FF5FC();
  v50 = *(_QWORD *)(v48 - 8);
  v10 = MEMORY[0x24BDAC7A8](v48);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v42 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v42 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v42 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v42 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v42 - v24;
  v26 = *a1;
  if (*(_BYTE *)(v2 + 1) != 1)
  {
    v42 = v23;
    v54 = v26;
    sub_20E5F88C0();
    v30 = v48;
    if ((v34 & 1) != 0)
    {
      v35 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v13, v2 + *(int *)(v49 + 88), v48);
      v36 = v47;
      v37 = *(_QWORD *)(v47 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v13, 1, v47) == 1)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v16, v13, v36);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v16, 0, 1, v36);
      sub_20E5F009C((uint64_t)v16, v35);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v30);
    }
    v53 = v26;
    sub_20E5F83BC();
    v38 = v2;
    v27 = v49;
    if ((v39 & 1) == 0)
      return;
    v40 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, v38 + *(int *)(v49 + 80), v46);
    v41 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v40, 1, AssociatedTypeWitness) != 1)
    {
      v22 = v42;
      sub_20E5FF3BC();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v22, 0, 1, v47);
      goto LABEL_14;
    }
LABEL_19:
    __break(1u);
    return;
  }
  v52 = *a1;
  sub_20E5F88C0();
  v27 = v49;
  if ((v28 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v9, v2 + *(int *)(v49 + 80), v46);
    v29 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v9, 1, AssociatedTypeWitness) == 1)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    sub_20E5FF3BC();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v9, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v25, 0, 1);
    sub_20E5F009C((uint64_t)v25, v27);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v48);
  }
  v51 = v26;
  sub_20E5F83BC();
  v30 = v48;
  if ((v31 & 1) == 0)
    return;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v19, v2 + *(int *)(v27 + 88), v48);
  v32 = v47;
  v33 = *(_QWORD *)(v47 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v19, 1, v47) == 1)
    goto LABEL_17;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v22, v19, v32);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v22, 0, 1, v32);
LABEL_14:
  sub_20E5F009C((uint64_t)v22, v27);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v22, v30);
}

uint64_t sub_20E5F009C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_20E5FF5FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v14 - v7, a1, v5);
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, AssociatedTypeWitness) != 1)
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, AssociatedTypeWitness);
    v12 = *(_QWORD *)(a2 + 48);
    v13 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8);
    v14 = *(_OWORD *)(a2 + 24);
    v15 = v12;
    v16 = v13;
    type metadata accessor for SymmetricState();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_20E5F0274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t, uint64_t);
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  _BYTE *v20;
  uint64_t result;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v30 = a3;
  v42 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_20E5FF5FC();
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v26 - v6;
  v7 = sub_20E5FF380();
  v28 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness() + 8) + 8) + 8);
  v9 = swift_getAssociatedTypeWitness();
  v10 = sub_20E5FF5FC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - v15;
  v31 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  v37 = a1;
  LODWORD(a1) = v17(a1, 1, AssociatedTypeWitness);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v16, v42, v10);
  if ((_DWORD)a1 == 1
    || (v27 = *(_QWORD *)(v9 - 8),
        v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48),
        v19(v16, 1, v9) == 1))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    sub_20E5EAA04();
    swift_allocError();
    *v20 = 2;
    return swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  v22 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v38, v37, v36);
  result = v17((uint64_t)v22, 1, AssociatedTypeWitness);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  v18(v14, v42, v10);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v19)(v14, 1, v9);
  if ((_DWORD)result == 1)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v23 = v33;
  sub_20E5FF3B0();
  if (!v23)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v9);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v22, AssociatedTypeWitness);
    v24 = *(_QWORD *)(v30 + 48);
    v25 = *(_QWORD *)(*(_QWORD *)(v30 + 56) + 8);
    v39 = *(_OWORD *)(v30 + 24);
    v40 = v24;
    v41 = v25;
    type metadata accessor for SymmetricState();
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v22, AssociatedTypeWitness);
}

void HandshakeState.readPayload(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

void sub_20E5F08D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t AssociatedConformanceWitness;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v43 = a3;
  v55 = a2;
  v50 = a1;
  v52 = a6;
  v53 = a9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_20E5FF5FC();
  v45 = *(_QWORD *)(v13 - 8);
  v46 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v40 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v36[4] = (char *)v36 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v36[3] = (char *)v36 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v36[2] = (char *)v36 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v36[1] = (char *)v36 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v39 = (char *)v36 - v24;
  v51 = a5;
  v54 = a8;
  v38 = type metadata accessor for CipherState(255, a5, a8, v25);
  v37 = sub_20E5FF5FC();
  v36[5] = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v49 = a7;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v42 = AssociatedTypeWitness;
  v44 = swift_getAssociatedTypeWitness();
  v26 = sub_20E5FF5FC();
  v47 = *(_QWORD *)(v26 - 8);
  v48 = v26;
  v27 = MEMORY[0x24BDAC7A8](v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v35 = MEMORY[0x24BDAC7A8](v34);
  MEMORY[0x24BDAC7A8](v35);
  __asm { BR              X10 }
}

void sub_20E5F0C50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 - 176) = v0;
  v3 = *(_QWORD *)(v2 - 168);
  *(_QWORD *)(v2 - 136) = v1;
  *(_QWORD *)(v2 - 128) = v3;
  v4 = *(_QWORD *)(v2 - 184);
  *(_QWORD *)(v2 - 120) = *(_QWORD *)(v2 - 160);
  *(_QWORD *)(v2 - 112) = v4;
  v5 = *(_QWORD *)(v2 - 152);
  *(_QWORD *)(v2 - 104) = *(_QWORD *)(v2 - 144);
  *(_QWORD *)(v2 - 96) = v5;
  type metadata accessor for HandshakeState();
}

uint64_t sub_20E5F0C80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;

  v5 = *(_QWORD *)(v2 - 200);
  v4 = *(_QWORD *)(v2 - 192);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v1, *(_QWORD *)(v2 - 72) + *(int *)(a1 + 92), v4);
  v6 = *(_QWORD *)(v2 - 232);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v1, 1, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  if (v7 == 1)
  {
    *(_QWORD *)(v2 - 184) = a1;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v6, AssociatedConformanceWitness);
    v10 = *(uint64_t **)(v2 - 240);
    v11 = *v10;
    v12 = v10[1];
    sub_20E5EAB18(*v10, v12);
    sub_20E5FB31C(v9, v11, v12);
    __asm { BR              X10 }
  }
  sub_20E5EAA04();
  swift_allocError();
  *v13 = 2;
  return swift_willThrow();
}

void sub_20E5F1848(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_20E5F18AC
     + *((int *)qword_20E5F1AE0 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_20E5F18BC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_20E5EAB18(v1, v0);
  sub_20E5FE3E0(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_20E5EAB5C(v1, v0);
  v4 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v4;
}

uint64_t sub_20E5F1AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;

  if (*(_QWORD *)(v3 + *(int *)(a1 + 96) + 16) == *(_QWORD *)(v3 + *(int *)(a1 + 96) + 24) >> 1)
    type metadata accessor for SymmetricState();
  v5 = type metadata accessor for TransportState(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 48), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a3, 1, 1, v5);
}

uint64_t HandshakeState.writePayload(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v6 = v4;
  v32 = xmmword_20E6000C0;
  v7 = (uint64_t *)(v4 + *(int *)(a4 + 96));
  v9 = v7[2];
  v8 = v7[3];
  v10 = v8 >> 1;
  if (v9 == v8 >> 1)
  {
    sub_20E5EAA04();
    swift_allocError();
    *v11 = 3;
    swift_willThrow();
    goto LABEL_13;
  }
  if (v9 >= (uint64_t)(v8 >> 1))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    JUMPOUT(0x20E5F1F54);
  }
  v14 = *v7;
  v13 = v7[1];
  sub_20E5F2F10(v13 + 40 * v9, (uint64_t)v29);
  if (__OFSUB__(v10, v9))
    goto LABEL_14;
  *v7 = v14;
  v7[1] = v13;
  v7[2] = v9 + 1;
  v7[3] = v8;
  v15 = v30;
  v16 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  v18 = *(_QWORD *)(v17 + 16);
  if (!v18)
  {
    swift_bridgeObjectRelease();
    __asm { BR              X12 }
  }
  v33 = v6;
  v19 = 0;
  v20 = (_QWORD *)a4;
  v21 = *(_QWORD *)(a4 + 16);
  v23 = v20[3];
  v22 = v20[4];
  v24 = v20[5];
  v10 = v20[6];
  v25 = v20[7];
  while (1)
  {
    LOBYTE(v28) = *(_BYTE *)(v17 + v19 + 32);
    sub_20E5F1F88((uint64_t)&v28, v33, (uint64_t)&v32, v21, v23, v22, v24, v10, v25);
    if (v5)
      break;
    if (v18 == ++v19)
    {
      swift_bridgeObjectRelease();
      __asm { BR              X13 }
    }
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
LABEL_13:
  sub_20E5EAB5C(v32, *((unint64_t *)&v32 + 1));
  return v10;
}

void sub_20E5F1F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[13];
  uint64_t AssociatedConformanceWitness;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v55 = a5;
  v56 = a8;
  v57 = a6;
  v41[7] = a3;
  v53 = a1;
  v54 = a2;
  v52 = a9;
  swift_getAssociatedTypeWitness();
  v50 = a4;
  v51 = a7;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v41[0] = *(_QWORD *)(AssociatedConformanceWitness + 8);
  v41[12] = *(_QWORD *)(*(_QWORD *)(v41[0] + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = sub_20E5FF5FC();
  v46 = *(_QWORD *)(v12 - 8);
  v47 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v41[9] = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v41[5] = (char *)v41 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v41[4] = (char *)v41 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v41[3] = (char *)v41 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v41[2] = (char *)v41 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v41[8] = (char *)v41 - v23;
  v24 = swift_checkMetadataState();
  v45 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v41[10] = (char *)v41 - v26;
  v43 = AssociatedTypeWitness;
  v41[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v41[1] = (char *)v41 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v41[6] = (char *)v41 - v29;
  v44 = v30;
  v31 = sub_20E5FF5FC();
  v48 = *(_QWORD *)(v31 - 8);
  v49 = v31;
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v36 = MEMORY[0x24BDAC7A8](v35);
  v37 = MEMORY[0x24BDAC7A8](v36);
  v38 = MEMORY[0x24BDAC7A8](v37);
  v39 = MEMORY[0x24BDAC7A8](v38);
  v40 = MEMORY[0x24BDAC7A8](v39);
  MEMORY[0x24BDAC7A8](v40);
  __asm { BR              X10 }
}

void sub_20E5F2354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 - 152);
  v2 = *(_QWORD *)(v0 - 144);
  if ((**(_BYTE **)(v0 - 160) & 1) == 0)
  {
    *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
    *(_QWORD *)(v0 - 128) = v1;
    v3 = *(_QWORD *)(v0 - 184);
    *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
    *(_QWORD *)(v0 - 112) = v3;
    v4 = *(_QWORD *)(v0 - 176);
    *(_QWORD *)(v0 - 104) = v2;
    *(_QWORD *)(v0 - 96) = v4;
    type metadata accessor for HandshakeState();
  }
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v1;
  v5 = *(_QWORD *)(v0 - 184);
  v6 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v5;
  *(_QWORD *)(v0 - 104) = v2;
  *(_QWORD *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_20E5F244C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v1 + *(int *)(a1 + 84), v2);
  v7 = *(_QWORD *)(v6 - 248);
  v8 = *(_QWORD *)(v6 - 240);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = *(_QWORD *)(v6 - 320);
    sub_20E5FF3BC();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    v10 = *(_QWORD *)(v6 - 256);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v12 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(v10, AssociatedConformanceWitness);
    v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 280) + 8))(v9, v10);
    sub_20E5F2CF8(v12, v14);
    v15 = *(_QWORD *)(v4 + 8);
    v16 = *(_QWORD *)(v6 - 72);
    *(_QWORD *)(v6 - 136) = *(_QWORD *)(v6 - 152);
    *(_QWORD *)(v6 - 128) = v16;
    *(_QWORD *)(v6 - 120) = *(_QWORD *)(v6 - 144);
    *(_QWORD *)(v6 - 112) = v15;
    type metadata accessor for SymmetricState();
  }
  __break(1u);
  JUMPOUT(0x20E5F2CDCLL);
}

void sub_20E5F2558(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_20E5FBA9C(v2, v1, (uint64_t)a1);
  if (*(_QWORD *)(v3 + 8))
  {
    *(_QWORD *)(v4 - 136) = v2;
    *(_QWORD *)(v4 - 128) = v1;
    sub_20E5FBC04(v4 - 136, a1, MEMORY[0x24BDCDDE8]);
  }
  sub_20E5EAB5C(v2, v1);
  JUMPOUT(0x20E5F2C58);
}

void sub_20E5F25A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 - 152);
  v1 = *(_QWORD *)(v0 - 144);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v2;
  v3 = *(_QWORD *)(v0 - 184);
  v4 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v3;
  *(_QWORD *)(v0 - 104) = v1;
  *(_QWORD *)(v0 - 96) = v4;
  type metadata accessor for HandshakeState();
}

void sub_20E5F25CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(v5 - 208);
  v6 = *(_QWORD *)(v5 - 200);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v1, *(_QWORD *)(v5 - 160) + *(int *)(a1 + 80), v6);
  v8 = *(_QWORD *)(v5 - 248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 240) + 48))(v1, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
    JUMPOUT(0x20E5F2620);
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 240) + 32))(*(_QWORD *)(v5 - 288), v1, v8);
  v9 = *(_QWORD *)(v5 - 360);
  sub_20E5FF3BC();
  v10 = *(_QWORD *)(v5 - 256);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(v10, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 280) + 8))(v9, v10);
  v12 = *(_QWORD *)(v3 + 8);
  v13 = *(_QWORD *)(v5 - 72);
  *(_QWORD *)(v5 - 136) = v4;
  *(_QWORD *)(v5 - 128) = v13;
  *(_QWORD *)(v5 - 120) = v2;
  *(_QWORD *)(v5 - 112) = v12;
  type metadata accessor for SymmetricState();
}

void sub_20E5F2648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v1;
  v2 = *(_QWORD *)(v0 - 184);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v2;
  v3 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
  *(_QWORD *)(v0 - 96) = v3;
  type metadata accessor for HandshakeState();
}

void sub_20E5F2678(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(v2 - 160);
  v6 = *(_QWORD *)(v2 - 208);
  v5 = *(_QWORD *)(v2 - 200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v4 + *(int *)(a1 + 84), v5);
  v7 = *(_QWORD *)(v2 - 232);
  v8 = *(_QWORD *)(v2 - 304);
  v9 = *(_QWORD *)(v2 - 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v4 + *(int *)(a1 + 92), v9);
  sub_20E5F0274(v1, v8, a1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  JUMPOUT(0x20E5F2C58);
}

void sub_20E5F26B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_BYTE *)(*(_QWORD *)(v0 - 160) + 1) == 1)
  {
    v1 = *(_QWORD *)(v0 - 152);
    *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
    *(_QWORD *)(v0 - 128) = v1;
    v2 = *(_QWORD *)(v0 - 184);
    *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
    *(_QWORD *)(v0 - 112) = v2;
    v3 = *(_QWORD *)(v0 - 176);
    *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
    *(_QWORD *)(v0 - 96) = v3;
    type metadata accessor for HandshakeState();
  }
  v4 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v4;
  v5 = *(_QWORD *)(v0 - 184);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v5;
  v6 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
  *(_QWORD *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_20E5F26F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)(v3 - 208);
  v5 = *(_QWORD *)(v3 - 200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v2 + *(int *)(a1 + 84), v5);
  v8 = *(_QWORD *)(v3 - 232);
  v7 = *(_QWORD *)(v3 - 224);
  v9 = *(_QWORD *)(v3 - 352);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v2 + *(int *)(a1 + 88), v7);
  sub_20E5F0274(v1, v9, a1);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  JUMPOUT(0x20E5F2C58);
}

void sub_20E5F2774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_BYTE *)(*(_QWORD *)(v0 - 160) + 1) == 1)
  {
    v1 = *(_QWORD *)(v0 - 152);
    *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
    *(_QWORD *)(v0 - 128) = v1;
    v2 = *(_QWORD *)(v0 - 184);
    *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
    *(_QWORD *)(v0 - 112) = v2;
    v3 = *(_QWORD *)(v0 - 176);
    *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
    *(_QWORD *)(v0 - 96) = v3;
    type metadata accessor for HandshakeState();
  }
  v4 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v4;
  v5 = *(_QWORD *)(v0 - 184);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v5;
  v6 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
  *(_QWORD *)(v0 - 96) = v6;
  type metadata accessor for HandshakeState();
}

void sub_20E5F27B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 208) + 16))(v2, v1 + *(int *)(a1 + 80), *(_QWORD *)(v3 - 200));
  v6 = *(_QWORD *)(v3 - 232);
  v5 = *(_QWORD *)(v3 - 224);
  v7 = *(_QWORD *)(v3 - 336);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v1 + *(int *)(a1 + 92), v5);
  sub_20E5F0274(v2, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x20E5F2C1CLL);
}

void sub_20E5F282C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
  *(_QWORD *)(v0 - 128) = v1;
  v2 = *(_QWORD *)(v0 - 184);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 112) = v2;
  v3 = *(_QWORD *)(v0 - 176);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 144);
  *(_QWORD *)(v0 - 96) = v3;
  type metadata accessor for HandshakeState();
}

void sub_20E5F285C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v2 - 160);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v2 - 208) + 16))(v1, v4 + *(int *)(a1 + 80), *(_QWORD *)(v2 - 200));
  v6 = *(_QWORD *)(v2 - 232);
  v5 = *(_QWORD *)(v2 - 224);
  v7 = *(_QWORD *)(v2 - 296);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v4 + *(int *)(a1 + 88), v5);
  sub_20E5F0274(v1, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x20E5F2C1CLL);
}

void sub_20E5F28D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD **)(v0 - 160);
  v2 = v1[1];
  if (v2)
  {
    v4 = v1[3];
    v3 = v1[4];
    if (v4 == v3 >> 1)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 - 208) = v3;
      *(_QWORD *)(v0 - 200) = v3 >> 1;
      *(_QWORD *)(v0 - 168) = v2;
      if (v4 < (uint64_t)(v3 >> 1))
      {
        *(_QWORD *)(v0 - 224) = v1[2];
        v5 = *(_QWORD *)(v0 - 152);
        v6 = *(_QWORD *)(v0 - 144);
        *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 192);
        *(_QWORD *)(v0 - 128) = v5;
        v7 = *(_QWORD *)(v0 - 184);
        v8 = *(_QWORD *)(v0 - 176);
        *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 72);
        *(_QWORD *)(v0 - 112) = v7;
        *(_QWORD *)(v0 - 104) = v6;
        *(_QWORD *)(v0 - 96) = v8;
        type metadata accessor for HandshakeState();
      }
    }
    __break(1u);
    JUMPOUT(0x20E5F2CD4);
  }
  sub_20E5EAA04();
  swift_allocError();
  JUMPOUT(0x20E5F2C4CLL);
}

void sub_20E5F2938()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_20E5EAB18(v1, v2);
  v7 = *(_QWORD *)(v4 + 8);
  swift_unknownObjectRetain();
  *(_QWORD *)(v6 - 136) = v0;
  *(_QWORD *)(v6 - 128) = v5;
  *(_QWORD *)(v6 - 120) = v3;
  *(_QWORD *)(v6 - 112) = v7;
  type metadata accessor for SymmetricState();
}

void sub_20E5F2970(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_20E5FBE7C(v1, v2, a1);
  sub_20E5EAB5C(v1, v2);
  if (!__OFSUB__(*(_QWORD *)(v6 - 200), v3))
  {
    v7 = *(_QWORD *)(v6 - 224);
    v5[1] = v4;
    v5[2] = v7;
    v8 = *(_QWORD *)(v6 - 208);
    v5[3] = v3 + 1;
    v5[4] = v8;
    swift_unknownObjectRelease();
    JUMPOUT(0x20E5F29B4);
  }
  __break(1u);
  JUMPOUT(0x20E5F2CD8);
}

void sub_20E5F2A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v8 = *(_QWORD *)(v7 - 216);
  v9 = sub_20E5FC29C(v5, v4, a1, a4);
  if (v8)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v7 - 240) + 8))(*(_QWORD *)(v7 - 288), v6);
    sub_20E5EAB5C(v5, v4);
  }
  else
  {
    v11 = v9;
    v12 = v10;
    sub_20E5EAB5C(v5, v4);
    sub_20E5F2CF8(v11, v12);
    sub_20E5EAB5C(v11, v12);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v7 - 240) + 8))(*(_QWORD *)(v7 - 288), v6);
  }
  JUMPOUT(0x20E5F2C58);
}

void sub_20E5F2AF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 208) + 16))(v2, v1 + *(int *)(a1 + 80), *(_QWORD *)(v3 - 200));
  v6 = *(_QWORD *)(v3 - 232);
  v5 = *(_QWORD *)(v3 - 224);
  v7 = *(_QWORD *)(v3 - 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v1 + *(int *)(a1 + 92), v5);
  sub_20E5F0274(v2, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
  JUMPOUT(0x20E5F2C1CLL);
}

void sub_20E5F2BA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 208) + 16))(v2, v1 + *(int *)(a1 + 84), *(_QWORD *)(v3 - 200));
  JUMPOUT(0x20E5F2BD8);
}

void sub_20E5F2CF8(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_20E5F2D5C
     + *((int *)qword_20E5F2F00 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_20E5F2D6C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_20E5EAB18(v1, v0);
  sub_20E5FF2CC();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

uint64_t sub_20E5F2F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_20E5F2F98()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20E5F2FA0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  swift_getAssociatedTypeWitness();
  result = sub_20E5FF5FC();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    result = sub_20E5FF5FC();
    if (v2 <= 0x3F)
      type metadata accessor for SymmetricState();
  }
  return result;
}

_BYTE *sub_20E5F3100(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  size_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  void *v42;
  const void *v43;
  unsigned int (*v44)(const void *, uint64_t, uint64_t);
  size_t v45;
  void *v46;
  const void *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  _BYTE *v51;
  _DWORD *v52;
  uint64_t v53;
  int v54;
  int v55;
  void (*v56)(_BYTE *, _DWORD *, uint64_t);
  unint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  size_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  size_t __n;
  size_t v71;
  size_t v72;
  uint64_t v73;
  uint64_t v74;
  size_t v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = v5;
  if (*(_DWORD *)(v4 + 84))
    v7 = *(_QWORD *)(v4 + 64);
  else
    v7 = *(_QWORD *)(v4 + 64) + 1;
  v69 = v7 + v5;
  swift_getAssociatedConformanceWitness();
  v8 = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = *(_DWORD *)(v9 + 80);
  v10 = *(_DWORD *)(v9 + 84);
  v12 = v11;
  v73 = v9;
  v74 = v8;
  v13 = *(_QWORD *)(v9 + 64);
  if (!v10)
    ++v13;
  __n = v7;
  v71 = v13 + v11;
  v72 = v13;
  v75 = v13 + 7;
  v14 = (v13
       + 7
       + ((v71
         + ((v7
           + ((v7 + v5 + ((v5 + 40) & ~(unint64_t)v5)) & ~(unint64_t)v5)
           + v11) & ~(unint64_t)v11)) & ~(unint64_t)v11)) & 0xFFFFFFFFFFFFFFF8;
  v15 = sub_20E5FF3A4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v17;
  v19 = v17 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v77 = v16;
  v78 = v15;
  v20 = *(_QWORD *)(v16 + 64) + 7;
  v76 = *(_DWORD *)(v16 + 84);
  if (v76)
    v21 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
  else
    v21 = (v20 & 0xFFFFFFFFFFFFFFF8) + 9;
  v22 = v11 | v5 | (unint64_t)v17;
  v23 = (v11 | v5 | v17) & 0x100000;
  if (v22 <= 7
    && v23 == 0
    && ((v18 + 32 + v14) & v19) + ((v20 + ((v21 + v18) & ~v18)) & 0xFFFFFFFFFFFFFFF8) + 16 <= 0x18)
  {
    v66 = v18 + 32;
    v67 = v19;
    v63 = v21;
    v64 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    v65 = v21 + v18;
    v68 = *(_QWORD *)(v16 + 64) + 7;
    v28 = ~(unint64_t)v5;
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    v29 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
    v30 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
    *v29 = *v30;
    v29[1] = v30[1];
    v29[2] = v30[2];
    v29[3] = v30[3];
    v31 = (void *)(((unint64_t)v29 + v6 + 32) & ~v6);
    v32 = (void *)(((unint64_t)v30 + v6 + 32) & ~v6);
    v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
    swift_unknownObjectRetain();
    v34 = v33;
    if (v33((char *)v32, 1, AssociatedTypeWitness))
    {
      v36 = __n;
      memcpy(v31, v32, __n);
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v4 + 16))(v31, v32, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v31, 0, 1, AssociatedTypeWitness);
      v36 = __n;
    }
    v37 = v34;
    v38 = ~v12;
    v39 = (void *)(((unint64_t)v31 + v69) & v28);
    v40 = (char *)(((unint64_t)v32 + v69) & v28);
    if (v37(v40, 1, AssociatedTypeWitness))
    {
      memcpy(v39, v40, v36);
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v4 + 16))(v39, v40, AssociatedTypeWitness);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v39, 0, 1, AssociatedTypeWitness);
    }
    v41 = &v40[v36];
    v42 = (void *)(((unint64_t)v39 + v36 + v12) & v38);
    v43 = (const void *)((unint64_t)&v41[v12] & v38);
    v44 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v73 + 48);
    if (v44(v43, 1, v74))
    {
      v45 = v72;
      memcpy(v42, v43, v72);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(v42, v43, v74);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v73 + 56))(v42, 0, 1, v74);
      v45 = v72;
    }
    v46 = (void *)(((unint64_t)v42 + v71) & v38);
    v47 = (const void *)(((unint64_t)v43 + v71) & v38);
    if (v44(v47, 1, v74))
    {
      memcpy(v46, v47, v45);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(v46, v47, v74);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v73 + 56))(v46, 0, 1, v74);
    }
    v48 = ~v18;
    v49 = (_QWORD *)(((unint64_t)v46 + v75) & 0xFFFFFFFFFFFFFFF8);
    v50 = (_QWORD *)(((unint64_t)v47 + v75) & 0xFFFFFFFFFFFFFFF8);
    *v49 = *v50;
    v49[1] = v50[1];
    v49[2] = v50[2];
    v49[3] = v50[3];
    v51 = (_BYTE *)(((unint64_t)v49 + v66) & v67);
    v52 = (_DWORD *)(((unint64_t)v50 + v66) & v67);
    swift_unknownObjectRetain();
    if (v76)
    {
      v53 = v78;
      if (!(*(unsigned int (**)(_DWORD *, _QWORD, uint64_t))(v77 + 48))(v52, v76, v78))
      {
LABEL_38:
        v56 = *(void (**)(_BYTE *, _DWORD *, uint64_t))(v77 + 16);
        v56(v51, v52, v53);
        *(_QWORD *)((unint64_t)&v51[v68] & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v52 + v68) & 0xFFFFFFFFFFFFF8);
        if (!v76)
          v51[v64] = 0;
        goto LABEL_40;
      }
    }
    else
    {
      v53 = v78;
      if (!*((_BYTE *)v52 + v64))
        goto LABEL_38;
      v54 = *((unsigned __int8 *)v52 + v64) - 1;
      v55 = v64 & 0xFFFFFFF8;
      if ((v64 & 0xFFFFFFF8) != 0)
      {
        v54 = 0;
        v55 = *v52;
      }
      if ((v55 | v54) == 0xFFFFFFFF)
        goto LABEL_38;
    }
    memcpy(v51, v52, v63);
    v56 = *(void (**)(_BYTE *, _DWORD *, uint64_t))(v77 + 16);
LABEL_40:
    v57 = ((unint64_t)v52 + v65) & v48;
    v56((_BYTE *)((unint64_t)&v51[v65] & v48), (_DWORD *)v57, v53);
    v58 = (_QWORD *)((v68 + ((unint64_t)&v51[v65] & v48)) & 0xFFFFFFFFFFFFFFF8);
    v59 = (uint64_t *)((v68 + v57) & 0xFFFFFFFFFFFFFFF8);
    v60 = *v59;
    v61 = v59[1];
    sub_20E5EAB18(*v59, v61);
    *v58 = v60;
    v58[1] = v61;
    return a1;
  }
  v26 = *(_QWORD *)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v27 = v26 + ((v22 & 0xF8 ^ 0x1F8) & (v22 + 16));
  swift_retain();
  return (_BYTE *)v27;
}

uint64_t sub_20E5F3678(uint64_t a1)
{
  unint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  int v29;
  void (*v30)(_DWORD *, uint64_t);
  unint64_t v31;
  unint64_t v32;

  v1 = (a1 + 10) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = v1 + v4 + 32;
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v6(v5 & ~v4, 1, AssociatedTypeWitness))
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5 & ~v4, AssociatedTypeWitness);
  if (*(_DWORD *)(v3 + 84))
    v7 = *(_QWORD *)(v3 + 64);
  else
    v7 = *(_QWORD *)(v3 + 64) + 1;
  v8 = ((v5 | v4) + v7) & ~v4;
  if (!v6(v8, 1, AssociatedTypeWitness))
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  v9 = v8 + v7;
  swift_getAssociatedConformanceWitness();
  v10 = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = v9 + v12;
  v14 = (v9 + v12) & ~v12;
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v15(v14, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  if (*(_DWORD *)(v11 + 84))
    v16 = *(_QWORD *)(v11 + 64);
  else
    v16 = *(_QWORD *)(v11 + 64) + 1;
  v17 = ((v13 | v12) + v16) & ~v12;
  if (!v15(v17, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v17, v10);
  v18 = (v16 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  v19 = sub_20E5FF3A4();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = v18 + (v21 | 7) + 32;
  v23 = (_DWORD *)(v22 & ~(v21 | 7));
  v24 = *(_DWORD *)(v20 + 84);
  v25 = *(_QWORD *)(v20 + 64) + 7;
  v26 = v25 & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
  if (!v24)
  {
    if (!*((_BYTE *)v23 + v27))
      goto LABEL_23;
    v28 = *((unsigned __int8 *)v23 + v27) - 1;
    v29 = v27 & 0xFFFFFFF8;
    if ((v27 & 0xFFFFFFF8) != 0)
    {
      v28 = 0;
      v29 = *v23;
    }
    if ((v29 | v28) == 0xFFFFFFFF)
      goto LABEL_23;
LABEL_22:
    v30 = *(void (**)(_DWORD *, uint64_t))(v20 + 8);
    goto LABEL_24;
  }
  if ((*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v20 + 48))(v22 & ~(v21 | 7), *(unsigned int *)(v20 + 84), v19))
  {
    goto LABEL_22;
  }
LABEL_23:
  v30 = *(void (**)(_DWORD *, uint64_t))(v20 + 8);
  v30(v23, v19);
LABEL_24:
  v31 = v26 + 9;
  if (v24)
    v31 = v26 + 8;
  v32 = ((unint64_t)v23 + v21 + v31) & ~v21;
  v30((_DWORD *)v32, v19);
  return sub_20E5EAB5C(*(_QWORD *)((v25 + v32) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)(((v25 + v32) & 0xFFFFFFFFFFFFFFF8) + 8));
}

_BYTE *sub_20E5F3918(_BYTE *a1, _BYTE *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int (*v9)(unint64_t, uint64_t, uint64_t);
  int v10;
  size_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  const void *v25;
  int v26;
  size_t v27;
  size_t v28;
  size_t v29;
  void *v30;
  const void *v31;
  size_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  _DWORD *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _BYTE *v45;
  int v46;
  int v47;
  size_t v48;
  void (*v49)(void *, _DWORD *, uint64_t);
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v58;
  unsigned int (*v59)(const void *, uint64_t, uint64_t);

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v2 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v3 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *v2 = *v3;
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)v2 + v6 + 32;
  v58 = ~v6;
  v8 = (unint64_t)v3 + v6 + 32;
  v9 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  swift_unknownObjectRetain();
  if (v9(v8 & ~v6, 1, AssociatedTypeWitness))
  {
    v10 = *(_DWORD *)(v5 + 84);
    v11 = *(_QWORD *)(v5 + 64);
    if (v10)
      v12 = *(_QWORD *)(v5 + 64);
    else
      v12 = v11 + 1;
    memcpy((void *)(v7 & ~v6), (const void *)(v8 & ~v6), v12);
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v7 & ~v6, v8 & ~v6, AssociatedTypeWitness);
    (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7 & ~v6, 0, 1, AssociatedTypeWitness);
    v10 = *(_DWORD *)(v5 + 84);
    v11 = *(_QWORD *)(v5 + 64);
  }
  if (v10)
    v13 = v11;
  else
    v13 = v11 + 1;
  v14 = (char *)(((v7 | v6) + v13) & v58);
  v15 = (char *)(((v8 | v6) + v13) & v58);
  if (v9((unint64_t)v15, 1, AssociatedTypeWitness))
  {
    memcpy(v14, v15, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v14, v15, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, AssociatedTypeWitness);
  }
  v16 = &v14[v13];
  v17 = &v15[v13];
  swift_getAssociatedConformanceWitness();
  v18 = swift_getAssociatedTypeWitness();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = &v16[v20];
  v22 = ~v20;
  v23 = (void *)((unint64_t)&v16[v20] & ~v20);
  v24 = &v17[v20];
  v25 = (const void *)((unint64_t)&v17[v20] & ~v20);
  v59 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v59(v25, 1, v18))
  {
    v26 = *(_DWORD *)(v19 + 84);
    v27 = *(_QWORD *)(v19 + 64);
    if (v26)
      v28 = *(_QWORD *)(v19 + 64);
    else
      v28 = v27 + 1;
    memcpy(v23, v25, v28);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v23, v25, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v23, 0, 1, v18);
    v26 = *(_DWORD *)(v19 + 84);
    v27 = *(_QWORD *)(v19 + 64);
  }
  if (v26)
    v29 = v27;
  else
    v29 = v27 + 1;
  v30 = (void *)((((unint64_t)v21 | v20) + v29) & v22);
  v31 = (const void *)((((unint64_t)v24 | v20) + v29) & v22);
  if (v59(v31, 1, v18))
  {
    memcpy(v30, v31, v29);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v30, v31, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v30, 0, 1, v18);
  }
  v32 = v29 + 7;
  v33 = (_QWORD *)(((unint64_t)v30 + v29 + 7) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_QWORD *)(((unint64_t)v31 + v32) & 0xFFFFFFFFFFFFFFF8);
  *v33 = *v34;
  v33[1] = v34[1];
  v33[2] = v34[2];
  v33[3] = v34[3];
  v35 = sub_20E5FF3A4();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(unsigned int *)(v36 + 84);
  v38 = *(_DWORD *)(v36 + 80);
  v39 = *(_DWORD *)(v36 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v40 = (void *)(((unint64_t)v33 + v38 + 32) & v39);
  v41 = (_DWORD *)(((unint64_t)v34 + v38 + 32) & v39);
  v42 = *(_QWORD *)(v36 + 64) + 7;
  v43 = v42 & 0xFFFFFFFFFFFFFFF8;
  v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRetain();
  if (!(_DWORD)v37)
  {
    v45 = a1;
    if (!*((_BYTE *)v41 + v44))
      goto LABEL_36;
    v46 = *((unsigned __int8 *)v41 + v44) - 1;
    v47 = v44 & 0xFFFFFFF8;
    if ((v44 & 0xFFFFFFF8) != 0)
    {
      v46 = 0;
      v47 = *v41;
    }
    if ((v47 | v46) == 0xFFFFFFFF)
      goto LABEL_36;
LABEL_32:
    if ((_DWORD)v37)
      v48 = v43 + 8;
    else
      v48 = v43 + 9;
    memcpy(v40, v41, v48);
    v49 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 16);
    goto LABEL_38;
  }
  v45 = a1;
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v36 + 48))(v41, v37, v35))
    goto LABEL_32;
LABEL_36:
  v49 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 16);
  v49(v40, v41, v35);
  *(_QWORD *)(((unint64_t)v40 + v42) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v41 + v42) & 0xFFFFFFFFFFFFF8);
  if (!(_DWORD)v37)
    *((_BYTE *)v40 + v44) = 0;
LABEL_38:
  v50 = v43 + 9;
  if ((_DWORD)v37)
    v50 = v43 + 8;
  v51 = ((unint64_t)v40 + v38 + v50) & ~v38;
  v52 = ((unint64_t)v41 + v38 + v50) & ~v38;
  v49((void *)v51, (_DWORD *)v52, v35);
  v53 = (_QWORD *)((v42 + v51) & 0xFFFFFFFFFFFFFFF8);
  v54 = (uint64_t *)((v42 + v52) & 0xFFFFFFFFFFFFFFF8);
  v55 = *v54;
  v56 = v54[1];
  sub_20E5EAB18(*v54, v56);
  *v53 = v55;
  v53[1] = v56;
  return v45;
}

_BYTE *sub_20E5F3DBC(_BYTE *a1, _BYTE *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t (*v10)(unint64_t, uint64_t, uint64_t);
  int v11;
  int v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  int v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t (*v28)(void *, uint64_t, uint64_t);
  int v29;
  int v30;
  size_t v31;
  size_t v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _DWORD *v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  size_t v50;
  unint64_t v51;
  uint64_t (*v52)(_DWORD *, uint64_t, uint64_t);
  int v53;
  uint64_t v54;
  int v55;
  _DWORD *v56;
  _DWORD *v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  _DWORD *v65;
  int v66;
  size_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v78;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v2 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v3 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *v2 = *v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)v2 + v6 + 32;
  v8 = ~v6;
  v9 = (unint64_t)v3 + v6 + 32;
  v10 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  v11 = v10(v7 & ~v6, 1, AssociatedTypeWitness);
  v12 = v10(v9 & ~v6, 1, AssociatedTypeWitness);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v7 & ~v6, v9 & ~v6, AssociatedTypeWitness);
      (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7 & ~v6, 0, 1, AssociatedTypeWitness);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 24))(v7 & ~v6, v9 & ~v6, AssociatedTypeWitness);
      goto LABEL_10;
    }
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  memcpy((void *)(v7 & ~v6), (const void *)(v9 & ~v6), v13);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v14 = *(_QWORD *)(v5 + 64);
  else
    v14 = *(_QWORD *)(v5 + 64) + 1;
  v15 = (char *)(((v7 | v6) + v14) & v8);
  v16 = (char *)(((v9 | v6) + v14) & v8);
  v17 = v10((unint64_t)v15, 1, AssociatedTypeWitness);
  v18 = v10((unint64_t)v16, 1, AssociatedTypeWitness);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v15, v16, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v15, 0, 1, AssociatedTypeWitness);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, AssociatedTypeWitness);
LABEL_18:
    memcpy(v15, v16, v14);
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v15, v16, AssociatedTypeWitness);
LABEL_19:
  v19 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = &v19[v22];
  v24 = ~v22;
  v25 = (void *)((unint64_t)&v19[v22] & ~v22);
  v26 = (unint64_t)&v16[v14 + v22];
  v27 = (void *)(v26 & ~v22);
  v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v29 = v28(v25, 1, v20);
  v30 = v28(v27, 1, v20);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v25, v27, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v25, 0, 1, v20);
      goto LABEL_28;
    }
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v25, v27, v20);
      goto LABEL_28;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v25, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v31 = *(_QWORD *)(v21 + 64);
  else
    v31 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v25, v27, v31);
LABEL_28:
  if (*(_DWORD *)(v21 + 84))
    v32 = *(_QWORD *)(v21 + 64);
  else
    v32 = *(_QWORD *)(v21 + 64) + 1;
  v33 = (void *)((((unint64_t)v23 | v22) + v32) & v24);
  v34 = (void *)(((v26 | v22) + v32) & v24);
  v35 = v28(v33, 1, v20);
  v36 = v28(v34, 1, v20);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v33, v34, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v33, 0, 1, v20);
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (v36)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v33, v20);
LABEL_36:
    memcpy(v33, v34, v32);
    goto LABEL_37;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v33, v34, v20);
LABEL_37:
  v37 = (_QWORD *)(((unint64_t)v33 + v32 + 7) & 0xFFFFFFFFFFFFFFF8);
  v38 = (_QWORD *)(((unint64_t)v34 + v32 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v37 = *v38;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v37[1] = v38[1];
  v37[2] = v38[2];
  v37[3] = v38[3];
  v39 = sub_20E5FF3A4();
  v40 = v39;
  v41 = *(_QWORD *)(v39 - 8);
  v42 = *(unsigned int *)(v41 + 84);
  v43 = *(_DWORD *)(v41 + 80);
  v44 = *(_DWORD *)(v41 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v45 = (_DWORD *)(((unint64_t)v37 + v43 + 32) & v44);
  v46 = (_DWORD *)(((unint64_t)v38 + v43 + 32) & v44);
  v47 = *(_QWORD *)(v41 + 64);
  v48 = v47 + 7;
  v49 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8;
  v50 = v49 + 8;
  if ((_DWORD)v42)
  {
    v78 = v47 + 7;
    v51 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    v52 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v41 + 48);
    v53 = v52(v45, v42, v39);
    v54 = v40;
    v55 = v53;
    v56 = v46;
    v57 = v46;
    v58 = v54;
    v59 = ((uint64_t (*)(_DWORD *, uint64_t))v52)(v57, v42);
    v49 = v51;
    if (v55)
      goto LABEL_39;
    goto LABEL_64;
  }
  if (!*((_BYTE *)v45 + v50)
    || ((v60 = *((unsigned __int8 *)v45 + v50) - 1, (_DWORD)v49 == -8) ? (v61 = 0) : (v60 = 0, v61 = *v45),
        (v61 | v60) == 0xFFFFFFFF))
  {
    if (!*((_BYTE *)v46 + v50))
      goto LABEL_70;
    v64 = *((unsigned __int8 *)v46 + v50) - 1;
    if ((_DWORD)v49 != -8)
      v64 = 0;
    v78 = v48;
    if ((_DWORD)v49 == -8)
    {
      v56 = v46;
      v58 = v39;
      v66 = 0;
    }
    else
    {
      v65 = v46;
      v58 = v39;
      v56 = v65;
      v66 = *v65;
    }
    v59 = (v66 | v64) + 1;
LABEL_64:
    v40 = v58;
    v46 = v56;
    v48 = v78;
    if (v59)
    {
      (*(void (**)(_DWORD *, uint64_t))(v41 + 8))(v45, v40);
      goto LABEL_66;
    }
LABEL_70:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 24))(v45, v46, v40);
    *(_QWORD *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8);
    goto LABEL_71;
  }
  if (!*((_BYTE *)v46 + v50))
    goto LABEL_55;
  v78 = v48;
  v56 = v46;
  v62 = *((unsigned __int8 *)v46 + v50) - 1;
  if ((_DWORD)v49 != -8)
    v62 = 0;
  v58 = v39;
  if ((_DWORD)v49 == -8)
    v63 = 0;
  else
    v63 = *v56;
  v59 = (v63 | v62) + 1;
LABEL_39:
  v40 = v58;
  v46 = v56;
  v48 = v78;
  if (v59)
  {
LABEL_66:
    if ((_DWORD)v42)
      v67 = v50;
    else
      v67 = v49 + 9;
    memcpy(v45, v46, v67);
    goto LABEL_71;
  }
LABEL_55:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 16))(v45, v46, v40);
  *(_QWORD *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8);
  if (!(_DWORD)v42)
    *((_BYTE *)v45 + v50) = 0;
LABEL_71:
  v68 = v49 + 9;
  if ((_DWORD)v42)
    v68 = v50;
  v69 = ((unint64_t)v45 + v43 + v68) & ~v43;
  v70 = ((unint64_t)v46 + v43 + v68) & ~v43;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 24))(v69, v70, v40);
  v71 = (uint64_t *)((v48 + v69) & 0xFFFFFFFFFFFFFFF8);
  v72 = (uint64_t *)((v48 + v70) & 0xFFFFFFFFFFFFFFF8);
  v73 = *v72;
  v74 = v72[1];
  sub_20E5EAB18(*v72, v74);
  v75 = *v71;
  v76 = v71[1];
  *v71 = v73;
  v71[1] = v74;
  sub_20E5EAB5C(v75, v76);
  return a1;
}

_BYTE *sub_20E5F4478(_BYTE *a1, _BYTE *a2)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  size_t v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  const void *v25;
  int v26;
  size_t v27;
  size_t v28;
  size_t v29;
  void *v30;
  const void *v31;
  _OWORD *v32;
  __int128 v33;
  _OWORD *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  _DWORD *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  int v46;
  size_t v47;
  void (*v48)(void *, _DWORD *, uint64_t);
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unsigned int (*v54)(unint64_t, uint64_t, uint64_t);
  unsigned int (*v55)(const void *, uint64_t, uint64_t);

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v2 = (_OWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v3 = (_OWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  v4 = v3[1];
  *v2 = *v3;
  v2[1] = v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (unint64_t)v2 + v7 + 32;
  v9 = ~v7;
  v10 = (unint64_t)v3 + v7 + 32;
  v54 = *(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v54(v10 & ~v7, 1, AssociatedTypeWitness))
  {
    v11 = *(_DWORD *)(v6 + 84);
    v12 = *(_QWORD *)(v6 + 64);
    if (v11)
      v13 = *(_QWORD *)(v6 + 64);
    else
      v13 = v12 + 1;
    memcpy((void *)(v8 & ~v7), (const void *)(v10 & ~v7), v13);
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))(v8 & ~v7, v10 & ~v7, AssociatedTypeWitness);
    (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v8 & ~v7, 0, 1, AssociatedTypeWitness);
    v11 = *(_DWORD *)(v6 + 84);
    v12 = *(_QWORD *)(v6 + 64);
  }
  if (v11)
    v14 = v12;
  else
    v14 = v12 + 1;
  v15 = (char *)(((v8 | v7) + v14) & v9);
  v16 = (char *)(((v10 | v7) + v14) & v9);
  if (v54((unint64_t)v16, 1, AssociatedTypeWitness))
  {
    memcpy(v15, v16, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v16, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, AssociatedTypeWitness);
  }
  v17 = &v15[v14];
  v18 = &v16[v14];
  swift_getAssociatedConformanceWitness();
  v19 = swift_getAssociatedTypeWitness();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = &v17[v21];
  v23 = ~v21;
  v24 = &v18[v21];
  v25 = (const void *)((unint64_t)&v18[v21] & ~v21);
  v55 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v55(v25, 1, v19))
  {
    v26 = *(_DWORD *)(v20 + 84);
    v27 = *(_QWORD *)(v20 + 64);
    if (v26)
      v28 = *(_QWORD *)(v20 + 64);
    else
      v28 = v27 + 1;
    memcpy((void *)((unint64_t)v22 & ~v21), v25, v28);
  }
  else
  {
    (*(void (**)(unint64_t, const void *, uint64_t))(v20 + 32))((unint64_t)v22 & ~v21, v25, v19);
    (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))((unint64_t)v22 & ~v21, 0, 1, v19);
    v26 = *(_DWORD *)(v20 + 84);
    v27 = *(_QWORD *)(v20 + 64);
  }
  if (v26)
    v29 = v27;
  else
    v29 = v27 + 1;
  v30 = (void *)((((unint64_t)v22 | v21) + v29) & v23);
  v31 = (const void *)((((unint64_t)v24 | v21) + v29) & v23);
  if (v55(v31, 1, v19))
  {
    memcpy(v30, v31, v29);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v30, v31, v19);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v30, 0, 1, v19);
  }
  v32 = (_OWORD *)(((unint64_t)v31 + v29 + 7) & 0xFFFFFFFFFFFFFFF8);
  v33 = v32[1];
  v34 = (_OWORD *)(((unint64_t)v30 + v29 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v34 = *v32;
  v34[1] = v33;
  v35 = sub_20E5FF3A4();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(_DWORD *)(v36 + 84);
  v38 = *(_DWORD *)(v36 + 80);
  v39 = *(_DWORD *)(v36 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v40 = (void *)(((unint64_t)v34 + v38 + 32) & v39);
  v41 = (_DWORD *)(((unint64_t)v32 + v38 + 32) & v39);
  v42 = *(_QWORD *)(v36 + 64) + 7;
  v43 = v42 & 0xFFFFFFFFFFFFFFF8;
  v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
  if (!v37)
  {
    if (!*((_BYTE *)v41 + v44))
      goto LABEL_36;
    v45 = *((unsigned __int8 *)v41 + v44) - 1;
    v46 = v44 & 0xFFFFFFF8;
    if ((v44 & 0xFFFFFFF8) != 0)
    {
      v45 = 0;
      v46 = *v41;
    }
    if ((v46 | v45) == 0xFFFFFFFF)
      goto LABEL_36;
LABEL_32:
    if (v37)
      v47 = v43 + 8;
    else
      v47 = v43 + 9;
    memcpy(v40, v41, v47);
    v48 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 32);
    goto LABEL_38;
  }
  if ((*(unsigned int (**)(_DWORD *, _QWORD, uint64_t))(v36 + 48))(v41, *(unsigned int *)(v36 + 84), v35))
    goto LABEL_32;
LABEL_36:
  v48 = *(void (**)(void *, _DWORD *, uint64_t))(v36 + 32);
  v48(v40, v41, v35);
  *(_QWORD *)(((unint64_t)v40 + v42) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v41 + v42) & 0xFFFFFFFFFFFFF8);
  if (!v37)
    *((_BYTE *)v40 + v44) = 0;
LABEL_38:
  v49 = v43 + 9;
  if (v37)
    v49 = v43 + 8;
  v50 = ((unint64_t)v40 + v38 + v49) & ~v38;
  v51 = ((unint64_t)v41 + v38 + v49) & ~v38;
  v48((void *)v50, (_DWORD *)v51, v35);
  *(_OWORD *)((v42 + v50) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((v42 + v51) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_BYTE *sub_20E5F48C8(_BYTE *a1, _BYTE *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t (*v10)(unint64_t, uint64_t, uint64_t);
  int v11;
  int v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  int v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t (*v28)(void *, uint64_t, uint64_t);
  int v29;
  int v30;
  size_t v31;
  size_t v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _DWORD *v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  size_t v50;
  unint64_t v51;
  uint64_t (*v52)(_DWORD *, uint64_t, uint64_t);
  int v53;
  _DWORD *v54;
  _DWORD *v55;
  uint64_t v56;
  int v57;
  _BYTE *v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  _DWORD *v65;
  int v66;
  size_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v75;
  uint64_t v76;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v2 = (_QWORD *)((unint64_t)(a1 + 10) & 0xFFFFFFFFFFFFFFF8);
  v3 = (_QWORD *)((unint64_t)(a2 + 10) & 0xFFFFFFFFFFFFFFF8);
  *v2 = *v3;
  swift_unknownObjectRelease();
  v2[1] = v3[1];
  v2[2] = v3[2];
  v2[3] = v3[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)v2 + v6 + 32;
  v8 = ~v6;
  v9 = (unint64_t)v3 + v6 + 32;
  v10 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  v11 = v10(v7 & ~v6, 1, AssociatedTypeWitness);
  v12 = v10(v9 & ~v6, 1, AssociatedTypeWitness);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(v7 & ~v6, v9 & ~v6, AssociatedTypeWitness);
      (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7 & ~v6, 0, 1, AssociatedTypeWitness);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v12)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))(v7 & ~v6, v9 & ~v6, AssociatedTypeWitness);
      goto LABEL_10;
    }
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7 & ~v6, AssociatedTypeWitness);
  }
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  memcpy((void *)(v7 & ~v6), (const void *)(v9 & ~v6), v13);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v14 = *(_QWORD *)(v5 + 64);
  else
    v14 = *(_QWORD *)(v5 + 64) + 1;
  v15 = (char *)(((v7 | v6) + v14) & v8);
  v16 = (char *)(((v9 | v6) + v14) & v8);
  v17 = v10((unint64_t)v15, 1, AssociatedTypeWitness);
  v18 = v10((unint64_t)v16, 1, AssociatedTypeWitness);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v15, v16, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v15, 0, 1, AssociatedTypeWitness);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, AssociatedTypeWitness);
LABEL_18:
    memcpy(v15, v16, v14);
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v15, v16, AssociatedTypeWitness);
LABEL_19:
  v19 = &v15[v14];
  swift_getAssociatedConformanceWitness();
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = &v19[v22];
  v24 = ~v22;
  v25 = (void *)((unint64_t)&v19[v22] & ~v22);
  v26 = (unint64_t)&v16[v14 + v22];
  v27 = (void *)(v26 & ~v22);
  v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v29 = v28(v25, 1, v20);
  v30 = v28(v27, 1, v20);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v25, v27, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v25, 0, 1, v20);
      goto LABEL_28;
    }
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v25, v27, v20);
      goto LABEL_28;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v25, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v31 = *(_QWORD *)(v21 + 64);
  else
    v31 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v25, v27, v31);
LABEL_28:
  if (*(_DWORD *)(v21 + 84))
    v32 = *(_QWORD *)(v21 + 64);
  else
    v32 = *(_QWORD *)(v21 + 64) + 1;
  v33 = (void *)((((unint64_t)v23 | v22) + v32) & v24);
  v34 = (void *)(((v26 | v22) + v32) & v24);
  v35 = v28(v33, 1, v20);
  v36 = v28(v34, 1, v20);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v33, v34, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v33, 0, 1, v20);
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (v36)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v33, v20);
LABEL_36:
    memcpy(v33, v34, v32);
    goto LABEL_37;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v33, v34, v20);
LABEL_37:
  v37 = (_QWORD *)(((unint64_t)v33 + v32 + 7) & 0xFFFFFFFFFFFFFFF8);
  v38 = (_QWORD *)(((unint64_t)v34 + v32 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v37 = *v38;
  swift_unknownObjectRelease();
  v37[1] = v38[1];
  v37[2] = v38[2];
  v37[3] = v38[3];
  v39 = sub_20E5FF3A4();
  v40 = v39;
  v41 = *(_QWORD *)(v39 - 8);
  v42 = *(unsigned int *)(v41 + 84);
  v43 = *(_DWORD *)(v41 + 80);
  v44 = *(_DWORD *)(v41 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v45 = (_DWORD *)(((unint64_t)v37 + v43 + 32) & v44);
  v46 = (_DWORD *)(((unint64_t)v38 + v43 + 32) & v44);
  v47 = *(_QWORD *)(v41 + 64);
  v48 = v47 + 7;
  v49 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8;
  v50 = v49 + 8;
  if ((_DWORD)v42)
  {
    v75 = v49 + 8;
    v76 = v47 + 7;
    v51 = (v47 + 7) & 0xFFFFFFFFFFFFFFF8;
    v52 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v41 + 48);
    v53 = v52(v45, v42, v39);
    v54 = v46;
    v55 = v46;
    v56 = v40;
    v57 = v52(v55, v42, v40);
    v58 = a1;
    if (v53)
      goto LABEL_39;
    goto LABEL_62;
  }
  v58 = a1;
  if (!*((_BYTE *)v45 + v50)
    || ((v59 = *((unsigned __int8 *)v45 + v50) - 1, (_DWORD)v49 == -8) ? (v60 = 0) : (v59 = 0, v60 = *v45),
        (v60 | v59) == 0xFFFFFFFF))
  {
    if (!*((_BYTE *)v46 + v50))
      goto LABEL_68;
    v64 = *((unsigned __int8 *)v46 + v50) - 1;
    if ((_DWORD)v49 != -8)
      v64 = 0;
    v75 = v49 + 8;
    v76 = v48;
    if ((_DWORD)v49 == -8)
    {
      v54 = v46;
      v56 = v39;
      v51 = v49;
      v66 = 0;
    }
    else
    {
      v65 = v46;
      v56 = v39;
      v51 = v49;
      v54 = v65;
      v66 = *v65;
    }
    v57 = (v66 | v64) + 1;
LABEL_62:
    v49 = v51;
    v40 = v56;
    v46 = v54;
    v50 = v75;
    v48 = v76;
    if (v57)
    {
      (*(void (**)(_DWORD *, uint64_t))(v41 + 8))(v45, v40);
      goto LABEL_64;
    }
LABEL_68:
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 40))(v45, v46, v40);
    *(_QWORD *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8);
    goto LABEL_69;
  }
  v61 = *((unsigned __int8 *)v46 + v50);
  if (!*((_BYTE *)v46 + v50))
    goto LABEL_53;
  v75 = v49 + 8;
  v76 = v48;
  v54 = v46;
  v56 = v39;
  v62 = v61 - 1;
  if ((_DWORD)v49 == -8)
  {
    v51 = v49;
    v63 = 0;
  }
  else
  {
    v62 = 0;
    v51 = v49;
    v63 = *v54;
  }
  v57 = (v63 | v62) + 1;
LABEL_39:
  v49 = v51;
  v40 = v56;
  v46 = v54;
  v50 = v75;
  v48 = v76;
  if (v57)
  {
LABEL_64:
    if ((_DWORD)v42)
      v67 = v50;
    else
      v67 = v49 + 9;
    memcpy(v45, v46, v67);
    goto LABEL_69;
  }
LABEL_53:
  (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v41 + 32))(v45, v46, v40);
  *(_QWORD *)(((unint64_t)v45 + v48) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v46 + v48) & 0xFFFFFFFFFFFFF8);
  if (!(_DWORD)v42)
    *((_BYTE *)v45 + v50) = 0;
LABEL_69:
  v68 = v49 + 9;
  if ((_DWORD)v42)
    v68 = v50;
  v69 = ((unint64_t)v45 + v43 + v68) & ~v43;
  v70 = ((unint64_t)v46 + v43 + v68) & ~v43;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 40))(v69, v70, v40);
  v71 = (uint64_t *)((v48 + v69) & 0xFFFFFFFFFFFFFFF8);
  v72 = *v71;
  v73 = v71[1];
  *(_OWORD *)v71 = *(_OWORD *)((v48 + v70) & 0xFFFFFFFFFFFFF8);
  sub_20E5EAB5C(v72, v73);
  return v58;
}

uint64_t sub_20E5F4F84(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5 = *(unsigned int *)(v4 + 84);
  if ((_DWORD)v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  swift_getAssociatedConformanceWitness();
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if ((_DWORD)v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v6 <= v10)
    v11 = v10;
  else
    v11 = v6;
  v12 = sub_20E5FF3A4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  if ((_DWORD)v14)
    v15 = v14 - 1;
  else
    v15 = 0;
  if (v14 <= 0xC)
    v16 = 12;
  else
    v16 = *(_DWORD *)(v13 + 84);
  if (v11 <= v16)
    v17 = v16;
  else
    v17 = v11;
  if (v17 <= 0x7FFFFFFF)
    v18 = 0x7FFFFFFF;
  else
    v18 = v17;
  if ((_DWORD)v5)
    v19 = *(_QWORD *)(v4 + 64);
  else
    v19 = *(_QWORD *)(v4 + 64) + 1;
  if ((_DWORD)v9)
    v20 = *(_QWORD *)(v8 + 64);
  else
    v20 = *(_QWORD *)(v8 + 64) + 1;
  if ((_DWORD)v14)
    v21 = 8;
  else
    v21 = 9;
  if (!a2)
    return 0;
  v22 = v12;
  v23 = *(unsigned __int8 *)(v4 + 80);
  v24 = v19 + v23;
  v25 = *(unsigned __int8 *)(v8 + 80);
  v46 = v19 + v25;
  v26 = v20 + v25;
  v27 = v20 + 7;
  v28 = *(_DWORD *)(v13 + 80);
  v29 = v28 + 32;
  v30 = *(_QWORD *)(v13 + 64) + 7;
  v31 = (v30 & 0xFFFFFFFFFFFFFFF8) + v21 + v28;
  if (v18 < a2)
  {
    if ((((((_DWORD)v30 + (v31 & ~(_DWORD)v28)) & 0xFFFFFFF8)
         + (((_DWORD)v29
           + (((_DWORD)v27
             + (((_DWORD)v26
               + (((_DWORD)v46 + (((_DWORD)v24 + (((_DWORD)v23 + 40) & ~(_DWORD)v23)) & ~(_DWORD)v23)) & ~(_DWORD)v25)) & ~(_DWORD)v25)) & 0xFFFFFFF8)) & (*(_DWORD *)(v13 + 80) & 0xF8 ^ 0xFFFFFFF8))
         + 16) & 0xFFFFFFF8) != 0)
      v32 = 2;
    else
      v32 = a2 - v18 + 1;
    if (v32 >= 0x10000)
      v33 = 4;
    else
      v33 = 2;
    if (v32 < 0x100)
      v33 = 1;
    if (v32 >= 2)
      v34 = v33;
    else
      v34 = 0;
    __asm { BR              X19 }
  }
  v35 = ~v23;
  v36 = (((a1 + 10) & 0xFFFFFFFFFFFFFFF8) + v23 + 32) & ~v23;
  if (v6 == v18)
  {
    if (v5 >= 2)
    {
      v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 48))(v36, v5, AssociatedTypeWitness, v29, v27, v26, v24);
      goto LABEL_56;
    }
    return 0;
  }
  v38 = ~v25;
  v39 = (v46 + ((v24 + v36) & v35)) & v38;
  if (v10 == v18)
  {
    if (v9 < 2)
      return 0;
    v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48))(v39, v9, v7, v29, v27, v26, v24);
LABEL_56:
    if (v37 >= 2)
      return v37 - 1;
    else
      return 0;
  }
  v41 = (uint64_t *)((v27 + ((v26 + v39) & v38)) & 0xFFFFFFFFFFFFFFF8);
  if ((v17 & 0x80000000) != 0)
  {
    v43 = ((unint64_t)v41 + v29) & (*(_DWORD *)(v13 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8);
    if (v15 == v16)
    {
      if (v14 < 2)
        return 0;
      v37 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 48))(v43, v14, v22, v29, v27, v26, v24);
      goto LABEL_56;
    }
    v44 = (v31 + v43) & ~v28;
    if (v14 < 0xC)
    {
      v45 = *(_QWORD *)(((v30 + v44) & 0xFFFFFFFFFFFFF8) + 8) >> 60;
      if (((4 * (_DWORD)v45) & 0xC) != 0)
        return 16 - ((4 * (_DWORD)v45) & 0xC | (v45 >> 2));
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(unint64_t))(v13 + 48))(v44);
    }
  }
  else
  {
    v42 = *v41;
    if ((unint64_t)*v41 >= 0xFFFFFFFF)
      LODWORD(v42) = -1;
    return (v42 + 1);
  }
}

void sub_20E5F537C(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  size_t v25;
  unsigned int v26;
  unsigned int v27;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  swift_getAssociatedConformanceWitness();
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v6 <= v9)
    v10 = v9;
  else
    v10 = v6;
  v11 = 0;
  v12 = *(_QWORD *)(sub_20E5FF3A4() - 8);
  v13 = *(_DWORD *)(v12 + 84);
  if (v13 <= 0xC)
    v14 = 12;
  else
    v14 = *(_DWORD *)(v12 + 84);
  if (v10 <= v14)
    v15 = v14;
  else
    v15 = v10;
  if (v15 <= 0x7FFFFFFF)
    v16 = 0x7FFFFFFF;
  else
    v16 = v15;
  v17 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v17;
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = (v17
       + v18
       + ((v17
         + *(unsigned __int8 *)(v4 + 80)
         + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~v18;
  v20 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v20;
  v21 = *(_DWORD *)(v12 + 80);
  v22 = (v21 + 32 + ((v20 + 7 + ((v20 + v18 + v19) & ~v18)) & 0xFFFFFFFFFFFFFFF8)) & (*(_DWORD *)(v12 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8);
  v23 = *(_QWORD *)(v12 + 64) + 7;
  v24 = (v23 & 0xFFFFFFFFFFFFFFF8) + 9;
  if (v13)
    v24 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
  v25 = ((v23 + ((v24 + v21) & ~v21)) & 0xFFFFFFFFFFFFFFF8) + v22 + 16;
  if (v16 < a3)
  {
    if ((((_DWORD)v23 + (((_DWORD)v24 + (_DWORD)v21) & ~(_DWORD)v21)) & 0xFFFFFFF8) + (_DWORD)v22 == -16)
      v26 = a3 - v16 + 1;
    else
      v26 = 2;
    if (v26 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v26 < 0x100)
      v11 = 1;
    if (v26 < 2)
      v11 = 0;
  }
  if (a2 > v16)
  {
    if ((_DWORD)v25)
    {
      v27 = ~v16 + a2;
      bzero(a1, v25);
      *a1 = v27;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X7 }
}

void sub_20E5F55EC(uint64_t a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  _QWORD *v29;
  _DWORD *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;

  *(_BYTE *)(v37 + v22) = 0;
  if (!v38)
    return;
  v25 = (((v37 + 10) & 0xFFFFFFFFFFFFFFF8) + a1 + 32) & a7;
  if (v24 == v11)
  {
    if (v18 >= 2)
    {
      v26 = v38 + 1;
      v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
      a3 = v18;
      v28 = v17;
LABEL_8:
      v27(v25, v26, a3, v28);
      return;
    }
    return;
  }
  v25 = (a6 + ((a5 + v25) & a7)) & v21;
  if (v19 != v11)
  {
    v29 = (_QWORD *)((v15 + ((a4 + v25) & v21)) & 0xFFFFFFFFFFFFFFF8);
    if ((v9 & 0x80000000) == 0)
    {
      if ((v38 & 0x80000000) == 0)
      {
        *v29 = v38 - 1;
        return;
      }
      v32 = v38 ^ 0x80000000;
      v29[2] = 0;
      v29[3] = 0;
LABEL_18:
      *v29 = v32;
      v29[1] = 0;
      return;
    }
    v30 = (_DWORD *)(((unint64_t)v29 + v14) & v12);
    if (v35 == v8)
    {
      if (a3 < 2)
        return;
      if (v38 + 1 > a3)
      {
        if ((_DWORD)a2)
        {
          v31 = v38 - a3;
          bzero(v30, a2);
          *v30 = v31;
        }
        return;
      }
      if (v38 == -1)
        return;
      v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v25 = ((unint64_t)v29 + v14) & v12;
      v26 = v38 + 1;
    }
    else
    {
      v25 = ((unint64_t)v30 + v13) & v33;
      if (a3 < 0xC)
      {
        v29 = (_QWORD *)((v10 + v25) & 0xFFFFFFFFFFFFFFF8);
        if (v38 <= 0xC)
        {
          *v29 = 0;
          v29[1] = (unint64_t)(((-v38 >> 2) & 3) - 4 * v38) << 60;
          return;
        }
        v32 = v38 - 13;
        goto LABEL_18;
      }
      v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v26 = v38;
    }
    v28 = v34;
    goto LABEL_8;
  }
  if (v20 >= 2)
  {
    v26 = v38 + 1;
    v27 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    a3 = v20;
    v28 = v36;
    goto LABEL_8;
  }
}

uint64_t sub_20E5F57D0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_20E5FF260();
  if (!result || (result = sub_20E5FF284(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_20E5FF278();
      return sub_20E5FF2CC();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_20E5F5860()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AF60;
  if (!qword_254A2AF60)
  {
    v1 = sub_20E5FF380();
    result = MEMORY[0x212BC13A4](MEMORY[0x24BDC6360], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AF60);
  }
  return result;
}

unint64_t sub_20E5F58A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AF70;
  if (!qword_254A2AF70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AF68);
    result = MEMORY[0x212BC13A4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AF70);
  }
  return result;
}

uint64_t sub_20E5F58F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = swift_bridgeObjectRetain() + 56;
    v3 = (char *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      swift_bridgeObjectRetain_n();
      v4 = sub_20E5F79E8((uint64_t)&unk_24C973E48);
      swift_bridgeObjectRelease();
      if (!*(_QWORD *)(v4 + 16))
        break;
      v5 = *(_BYTE *)(v4 + 32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_20E5FDD14(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v7 = *((_QWORD *)v3 + 2);
      v6 = *((_QWORD *)v3 + 3);
      if (v7 >= v6 >> 1)
        v3 = sub_20E5FDD14((char *)(v6 > 1), v7 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v7 + 1;
      v3[v7 + 32] = v5;
      v2 += 32;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v3;
      }
    }
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

Chirp::Modifiers_optional __swiftcall Modifiers.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  Chirp::Modifiers_optional result;
  char v5;

  v2 = v1;
  v3 = sub_20E5FF6C8();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static Modifiers.allCases.getter()
{
  return &unk_24C973D60;
}

uint64_t Modifiers.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_20E5F5ADC + 4 * byte_20E600160[*v0]))(812348272, 0xE400000000000000);
}

uint64_t sub_20E5F5ADC()
{
  return 829125488;
}

uint64_t sub_20E5F5AE8()
{
  return 845902704;
}

uint64_t sub_20E5F5AF4()
{
  return 862679920;
}

uint64_t sub_20E5F5B00()
{
  return 0x6B6361626C6C6166;
}

void sub_20E5F5B18(char *a1)
{
  sub_20E5F5B24(*a1);
}

void sub_20E5F5B24(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_20E5F5B64(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_20E5F5BBC + 4 * byte_20E60016A[a2]))(829125488);
}

uint64_t sub_20E5F5BBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 829125488 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_20E5FF6E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_20E5F5C5C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_20E5FF740();
  __asm { BR              X9 }
}

uint64_t sub_20E5F5CA0()
{
  sub_20E5FF518();
  swift_bridgeObjectRelease();
  return sub_20E5FF758();
}

void sub_20E5F5D04()
{
  __asm { BR              X10 }
}

uint64_t sub_20E5F5D38()
{
  sub_20E5FF518();
  return swift_bridgeObjectRelease();
}

void sub_20E5F5D88()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_20E5FF740();
  __asm { BR              X9 }
}

uint64_t sub_20E5F5DC8()
{
  sub_20E5FF518();
  swift_bridgeObjectRelease();
  return sub_20E5FF758();
}

Chirp::Modifiers_optional sub_20E5F5E2C(Swift::String *a1)
{
  return Modifiers.init(rawValue:)(*a1);
}

uint64_t sub_20E5F5E38()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_20E5F5E60 + 4 * byte_20E60017E[*v0]))();
}

void sub_20E5F5E60(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 829125488;
  a1[1] = v1;
}

void sub_20E5F5E70(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 845902704;
  a1[1] = v1;
}

void sub_20E5F5E80(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 862679920;
  a1[1] = v1;
}

void sub_20E5F5E90(_QWORD *a1@<X8>)
{
  *a1 = 0x6B6361626C6C6166;
  a1[1] = 0xE800000000000000;
}

void sub_20E5F5EAC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24C973E20;
}

_BYTE *HandshakeAndModifiers.init(_:modifiers:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = *result;
  *(_QWORD *)(a3 + 8) = a2;
  return result;
}

uint64_t HandshakeAndModifiers.init(_:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;

  v61 = a5;
  v10 = sub_20E5FF77C();
  v62 = *(_QWORD *)(v10 - 8);
  v63 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a2 >> 14;
  v14 = a1 >> 14;
  v64 = a3;
  if (a1 >> 14 == a2 >> 14)
  {
    swift_bridgeObjectRetain();
    v15 = a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    v15 = a1;
    v60 = a1 >> 14;
    do
    {
      swift_bridgeObjectRetain();
      v17 = sub_20E5FF620();
      v19 = v18;
      swift_bridgeObjectRelease();
      if ((sub_20E5FF494() & 1) == 0)
        goto LABEL_4;
      if ((sub_20E5FF488() & 1) != 0)
      {
        result = sub_20E5F7188(v17, v19);
        if ((result & 0x100000000) != 0)
          goto LABEL_39;
        sub_20E5FF788();
        v5 = sub_20E5FF764();
        (*(void (**)(char *, unint64_t))(v62 + 8))(v12, v63);
        if ((v5 & 1) != 0)
          goto LABEL_16;
      }
      if ((sub_20E5FF47C() & 1) == 0)
        goto LABEL_4;
      if ((sub_20E5FF488() & 1) != 0)
      {
        result = sub_20E5F7188(v17, v19);
        if ((result & 0x100000000) != 0)
          goto LABEL_41;
        sub_20E5FF788();
        v5 = sub_20E5FF770();
        (*(void (**)(char *, unint64_t))(v62 + 8))(v12, v63);
        if ((v5 & 1) != 0)
          goto LABEL_16;
      }
      if ((sub_20E5FF47C() & 1) == 0 || (sub_20E5FF470() & 1) == 0)
      {
LABEL_16:
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_4:
        v16 = sub_20E5FF4A0();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
          goto LABEL_18;
      }
      v15 = sub_20E5FF608();
      v14 = v15 >> 14;
    }
    while (v15 >> 14 != v13);
    v14 = a2 >> 14;
LABEL_18:
    if (v14 < v60)
    {
      __break(1u);
      goto LABEL_35;
    }
  }
  v21 = sub_20E5FF62C();
  v5 = v22;
  v62 = v23;
  v25 = v24;
  swift_bridgeObjectRelease();
  if (v13 >= v5 >> 14)
  {
    v60 = v25;
    v63 = v21;
    swift_bridgeObjectRetain();
    v26 = sub_20E5FF62C();
    v28 = v27;
    v30 = v29;
    v31 = swift_bridgeObjectRelease();
    v65 = 43;
    v66 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v31);
    v54[-2] = &v65;
    swift_bridgeObjectRetain();
    v57 = v28;
    v58 = v26;
    v56 = v30;
    v15 = 0;
    v59 = sub_20E5F67F4(0x7FFFFFFFFFFFFFFFLL, 1, sub_20E5F7614, (uint64_t)&v54[-4], v26, v28, v30);
    if (qword_254A2ACB8 == -1)
      goto LABEL_21;
    goto LABEL_36;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_21:
  v32 = v60;
  swift_bridgeObjectRetain();
  v33 = swift_bridgeObjectRetain();
  v34 = v62;
  v35 = sub_20E5F6C0C(v33, v63, v5, v62, v32);
  swift_bridgeObjectRelease();
  result = sub_20E5F74F4(v35);
  if ((v37 & 1) == 0)
  {
    if (*(_DWORD *)(v35 + 36) == v36)
    {
      if (result == 1 << *(_BYTE *)(v35 + 32))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AF78);
        v38 = swift_allocObject();
        *(_OWORD *)(v38 + 16) = xmmword_20E6002B0;
        v65 = 0;
        v66 = 0xE000000000000000;
        sub_20E5FF668();
        v39 = MEMORY[0x212BC0FCC](v63, v5, v34, v32);
        v41 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v65 = v39;
        v66 = v41;
LABEL_25:
        sub_20E5FF554();
        v43 = v65;
        v42 = v66;
        *(_QWORD *)(v38 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v38 + 32) = v43;
        *(_QWORD *)(v38 + 40) = v42;
        sub_20E5FF734();
        result = swift_bridgeObjectRelease();
        v44 = 0;
        v45 = 1;
        v46 = v61;
LABEL_32:
        *v46 = v44;
        v46[1] = v45;
        return result;
      }
      v54[1] = v15;
      sub_20E5F757C(&v65, result, v36, 0, v35);
      swift_release();
      swift_bridgeObjectRelease();
      v55 = v65;
      swift_bridgeObjectRetain();
      v47 = sub_20E5FF614();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v48 = sub_20E5FF614();
      swift_bridgeObjectRelease();
      if (v47 == v48)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v45 = 0;
        goto LABEL_31;
      }
      v49 = sub_20E5FF614();
      swift_bridgeObjectRelease();
      v50 = sub_20E5FF614();
      result = swift_bridgeObjectRelease();
      v51 = v49 + v50;
      if (!__OFADD__(v49, v50))
      {
        swift_bridgeObjectRetain();
        v52 = v64;
        v53 = sub_20E5FF614();
        swift_bridgeObjectRelease();
        if (v51 != v53)
        {
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AF78);
          v38 = swift_allocObject();
          *(_OWORD *)(v38 + 16) = xmmword_20E6002B0;
          v65 = 0;
          v66 = 0xE000000000000000;
          sub_20E5FF668();
          sub_20E5FF554();
          MEMORY[0x212BC0FCC](a1, a2, v52, a4);
          sub_20E5FF554();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
        v45 = sub_20E5F58F4(v59);
        result = swift_bridgeObjectRelease();
LABEL_31:
        v46 = v61;
        v44 = v55;
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_39:
    __break(1u);
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

char *sub_20E5F65D4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20E5F660C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20E5F65F0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20E5F670C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_20E5F660C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFA8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_20E5F670C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AF98);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

unint64_t sub_20E5F67F4(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD v44[4];

  v44[3] = a4;
  if (a1 < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v11 = a7;
  v12 = a6;
  v9 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v9;
  if (!a1 || (v42 = v12 >> 14, v12 >> 14 == v9 >> 14))
  {
    sub_20E5F7074(v12, v41, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  v32 = a1;
  v33 = v14;
  v40 = (char *)MEMORY[0x24BEE4AF8];
  v16 = v9;
  v10 = v9;
  v37 = v9;
  while (1)
  {
    v44[0] = sub_20E5FF620();
    v44[1] = v17;
    v18 = a3(v44);
    if (v8)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12;
    }
    v7 = v18;
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      break;
    v16 = sub_20E5FF608();
LABEL_9:
    if (v42 == v16 >> 14)
      goto LABEL_24;
  }
  if (v10 >> 14 == v16 >> 14 && (a2 & 1) != 0)
  {
    v16 = sub_20E5FF608();
    *(_QWORD *)(v41 + 16) = v16;
    v10 = v16;
    v37 = v16;
    goto LABEL_9;
  }
  if (v16 >> 14 < v10 >> 14)
  {
    __break(1u);
    goto LABEL_34;
  }
  v19 = sub_20E5FF62C();
  v36 = v20;
  v38 = v19;
  v34 = v22;
  v35 = v21;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v40 = sub_20E5FDD20(0, *((_QWORD *)v40 + 2) + 1, 1, v40);
  v7 = *((_QWORD *)v40 + 2);
  v23 = *((_QWORD *)v40 + 3);
  if (v7 >= v23 >> 1)
    v40 = sub_20E5FDD20((char *)(v23 > 1), v7 + 1, 1, v40);
  *((_QWORD *)v40 + 2) = v7 + 1;
  v24 = &v40[32 * v7];
  *((_QWORD *)v24 + 4) = v38;
  *((_QWORD *)v24 + 5) = v36;
  *((_QWORD *)v24 + 6) = v35;
  *((_QWORD *)v24 + 7) = v34;
  *(_QWORD *)(v33 + 16) = v40;
  v25 = sub_20E5FF608();
  v16 = v25;
  *(_QWORD *)(v41 + 16) = v25;
  if (*((_QWORD *)v40 + 2) != v32)
  {
    v10 = v25;
    v37 = v25;
    goto LABEL_9;
  }
  v37 = v25;
  v10 = v25;
LABEL_24:
  if (v42 == v10 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v12 = (unint64_t)v40;
    goto LABEL_32;
  }
  if (v42 >= v37 >> 14)
  {
    v7 = sub_20E5FF62C();
    v9 = v26;
    v10 = v27;
    v11 = v28;
    swift_bridgeObjectRelease();
    v12 = (unint64_t)v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_36;
    goto LABEL_29;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  v12 = (unint64_t)sub_20E5FDD20(0, *(_QWORD *)(v12 + 16) + 1, 1, (char *)v12);
LABEL_29:
  v30 = *(_QWORD *)(v12 + 16);
  v29 = *(_QWORD *)(v12 + 24);
  if (v30 >= v29 >> 1)
    v12 = (unint64_t)sub_20E5FDD20((char *)(v29 > 1), v30 + 1, 1, (char *)v12);
  *(_QWORD *)(v12 + 16) = v30 + 1;
  v31 = (_QWORD *)(v12 + 32 * v30);
  v31[4] = v7;
  v31[5] = v9;
  v31[6] = v10;
  v31[7] = v11;
  *(_QWORD *)(v33 + 16) = v12;
LABEL_32:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_5:
  swift_release();
  return v12;
}

unint64_t sub_20E5F6C0C(uint64_t isStackAllocationSafe, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  char v10;
  unint64_t v11;
  size_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16[2];

  v16[0] = a5;
  v9 = isStackAllocationSafe;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v10 = *(_BYTE *)(isStackAllocationSafe + 32);
  v11 = (unint64_t)((1 << v10) + 63) >> 6;
  v12 = 8 * v11;
  if ((v10 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    v13 = sub_20E5F7BE0((uint64_t)v16 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v11, v9, a2, a3, a4, v16[0]);
    if (v5)
      swift_willThrow();
    else
      a2 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = (void *)swift_slowAlloc();
    bzero(v14, v12);
    a2 = sub_20E5F7BE0((uint64_t)v14, v11, v9, a2, a3, a4, v16[0]);
    MEMORY[0x212BC141C](v14, -1, -1);
    swift_bridgeObjectRelease();
  }
  return a2;
}

uint64_t sub_20E5F6DBC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFA0);
  result = sub_20E5FF6BC();
  v8 = result;
  v34 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  v36 = v4;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v37 = v10;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v34)
        return v8;
      v15 = a1[v14];
      v16 = v10 + 1;
      if (!v15)
      {
        v16 = v10 + 2;
        if (v10 + 2 >= v34)
          return v8;
        v15 = a1[v16];
        if (!v15)
        {
          v16 = v10 + 3;
          if (v10 + 3 >= v34)
            return v8;
          v15 = a1[v16];
          if (!v15)
          {
            v17 = v10 + 4;
            if (v10 + 4 >= v34)
              return v8;
            v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                v16 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v16 >= v34)
                  return v8;
                v15 = a1[v16];
                ++v17;
                if (v15)
                  goto LABEL_24;
              }
            }
            v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v37 = v16;
      v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    v18 = *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13);
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 56) + 32 * v13);
    v21 = *v19;
    v20 = v19[1];
    v22 = v19[2];
    v23 = v19[3];
    sub_20E5FF740();
    sub_20E5FF74C();
    result = sub_20E5FF758();
    v24 = -1 << *(_BYTE *)(v8 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v31 == -1);
      v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v27) = v18;
    v32 = (_QWORD *)(*(_QWORD *)(v8 + 56) + 32 * v27);
    *v32 = v21;
    v32[1] = v20;
    v32[2] = v22;
    v32[3] = v23;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    result = swift_bridgeObjectRetain();
    v4 = v36;
    v10 = v37;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_20E5F7074(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_20E5FF62C();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_20E5FDD20(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_20E5FDD20((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

unint64_t sub_20E5F7188(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_20E5F7264(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_20E5FF65C();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_20E5FF674();
      v5 = sub_20E5FF680();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_20E5F7264(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_20E5F7300(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_20E5F736C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_20E5F7300(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_20E5F747C(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_20E5F736C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_20E5FF674();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_20E5FF650();
  }
  return result;
}

uint64_t sub_20E5F747C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_20E5FF578();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x212BC102C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_20E5F74F4(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_BYTE *sub_20E5F757C(_BYTE *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(a5 + 56);
    *result = *(_BYTE *)(*(_QWORD *)(a5 + 48) + a2);
    v6 = *(_QWORD *)(v5 + 32 * a2);
    swift_bridgeObjectRetain();
    return (_BYTE *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_20E5F7614(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_20E5FF6E0() & 1;
}

unint64_t sub_20E5F766C()
{
  unint64_t result;

  result = qword_254A2AF80;
  if (!qword_254A2AF80)
  {
    result = MEMORY[0x212BC13A4](&protocol conformance descriptor for Modifiers, &type metadata for Modifiers);
    atomic_store(result, (unint64_t *)&qword_254A2AF80);
  }
  return result;
}

unint64_t sub_20E5F76B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AF88;
  if (!qword_254A2AF88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AF90);
    result = MEMORY[0x212BC13A4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AF88);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Modifiers(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Modifiers(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_20E5F77E8 + 4 * byte_20E600188[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_20E5F781C + 4 * byte_20E600183[v4]))();
}

uint64_t sub_20E5F781C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F7824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E5F782CLL);
  return result;
}

uint64_t sub_20E5F7838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5F7840);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_20E5F7844(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F784C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F7858(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20E5F7860(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Modifiers()
{
  return &type metadata for Modifiers;
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HandshakeAndModifiers()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HandshakeAndModifiers(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeAndModifiers(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeAndModifiers(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeAndModifiers()
{
  return &type metadata for HandshakeAndModifiers;
}

uint64_t sub_20E5F79E8(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    __asm { BR              X8 }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_20E5F7BE0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v28 = (unint64_t *)result;
  v10 = 0;
  v11 = 0;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a3 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  v16 = a4 >> 16;
  v17 = a5 >> 16;
LABEL_4:
  v29 = v10;
  while (v14)
  {
    v18 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v19 = v18 | (v11 << 6);
LABEL_21:
    v23 = (_QWORD *)(*(_QWORD *)(a3 + 56) + 32 * v19);
    result = v23[2];
    if (result != a6 || v23[3] != a7 || *v23 >> 16 != v16 || v23[1] >> 16 != v17)
    {
      result = sub_20E5FF6D4();
      if ((result & 1) == 0)
        continue;
    }
    *(unint64_t *)((char *)v28 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v10 = v29 + 1;
    if (!__OFADD__(v29, 1))
      goto LABEL_4;
    __break(1u);
    return sub_20E5F6DBC(v28, a2, v29, a3);
  }
  v20 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v20 >= v15)
    return sub_20E5F6DBC(v28, a2, v29, a3);
  v21 = *(_QWORD *)(v30 + 8 * v20);
  ++v11;
  if (v21)
    goto LABEL_20;
  v11 = v20 + 1;
  if (v20 + 1 >= v15)
    return sub_20E5F6DBC(v28, a2, v29, a3);
  v21 = *(_QWORD *)(v30 + 8 * v11);
  if (v21)
    goto LABEL_20;
  v11 = v20 + 2;
  if (v20 + 2 >= v15)
    return sub_20E5F6DBC(v28, a2, v29, a3);
  v21 = *(_QWORD *)(v30 + 8 * v11);
  if (v21)
  {
LABEL_20:
    v14 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v11 << 6);
    goto LABEL_21;
  }
  v22 = v20 + 3;
  if (v22 >= v15)
    return sub_20E5F6DBC(v28, a2, v29, a3);
  v21 = *(_QWORD *)(v30 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v15)
      return sub_20E5F6DBC(v28, a2, v29, a3);
    v21 = *(_QWORD *)(v30 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20E5F7DC8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20E5F7DEC()
{
  return swift_deallocObject();
}

BOOL static ChirpErrors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChirpErrors.hash(into:)()
{
  return sub_20E5FF74C();
}

uint64_t ChirpErrors.hashValue.getter()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

BOOL sub_20E5F7E80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20E5F7E94()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

uint64_t sub_20E5F7ED8()
{
  return sub_20E5FF74C();
}

uint64_t sub_20E5F7F00()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

unint64_t sub_20E5F7F44()
{
  unint64_t result;

  result = qword_254A2AFB0;
  if (!qword_254A2AFB0)
  {
    result = MEMORY[0x212BC13A4]("5H7>\\\v", &type metadata for ChirpErrors);
    atomic_store(result, (unint64_t *)&qword_254A2AFB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ChirpErrors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ChirpErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_20E5F8074 + 4 * byte_20E6002C5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_20E5F80A8 + 4 * byte_20E6002C0[v4]))();
}

uint64_t sub_20E5F80A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F80B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E5F80B8);
  return result;
}

uint64_t sub_20E5F80C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5F80CCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_20E5F80D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F80D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChirpErrors()
{
  return &type metadata for ChirpErrors;
}

char *sub_20E5F80F4(char *result, char *a2)
{
  char **v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  char v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;

  if (result)
    v3 = a2 - result;
  else
    v3 = 0;
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v7 = (unint64_t)a2;
  v8 = (uint64_t)result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v10 = *((_QWORD *)v4 + 3) >> 1, v10 < v6))
  {
    if (v5 <= v6)
      v11 = v5 + v3;
    else
      v11 = v5;
    v4 = sub_20E5FD298(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    v10 = *((_QWORD *)v4 + 3) >> 1;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = v10 - v12;
  result = sub_20E5FE584(&v4[v12 + 32], v10 - v12, (char *)v8, v7);
  if (v14 < v3)
    goto LABEL_18;
  if (v14 >= 1)
  {
    v15 = *((_QWORD *)v4 + 2);
    v16 = __OFADD__(v15, v14);
    v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      goto LABEL_26;
    }
    *((_QWORD *)v4 + 2) = v17;
  }
  if (v14 != v13)
    goto LABEL_16;
LABEL_19:
  v8 = *((_QWORD *)v4 + 2);
  if (!result)
  {
LABEL_26:
    if (!a2)
      goto LABEL_16;
    result = 0;
    goto LABEL_28;
  }
  if (a2)
    v18 = result == a2;
  else
    v18 = 0;
  if (!v18)
  {
LABEL_28:
    v20 = *result++;
    v19 = v20;
    while (1)
    {
      while (1)
      {
        v21 = *((_QWORD *)v4 + 3);
        v22 = (char *)(v21 >> 1);
        v23 = v8 + 1;
        if ((uint64_t)(v21 >> 1) >= v8 + 1)
          break;
        v26 = result;
        v27 = a2;
        v28 = sub_20E5FD298((char *)(v21 > 1), v8 + 1, 1, v4);
        a2 = v27;
        v4 = v28;
        result = v26;
        v22 = (char *)(*((_QWORD *)v4 + 3) >> 1);
        if (v8 < (uint64_t)v22)
          goto LABEL_32;
LABEL_29:
        *((_QWORD *)v4 + 2) = v8;
      }
      if (v8 >= (uint64_t)v22)
        goto LABEL_29;
LABEL_32:
      v4[v8 + 32] = v19;
      if (a2 && a2 == result)
      {
LABEL_42:
        *((_QWORD *)v4 + 2) = v23;
        break;
      }
      v24 = 0;
      while (1)
      {
        v25 = (uint64_t)&v24[(_QWORD)result + 1];
        v19 = v24[(_QWORD)result];
        if (&v22[~v8] == v24)
          break;
        v4[v8 + 33 + (_QWORD)v24++] = v19;
        if (a2 && (char *)v25 == a2)
        {
          v23 = (uint64_t)&v24[v8 + 1];
          goto LABEL_42;
        }
      }
      result = &v24[(_QWORD)result + 1];
      v8 = (uint64_t)v22;
      *((_QWORD *)v4 + 2) = v22;
    }
  }
LABEL_16:
  *v2 = v4;
  return result;
}

uint64_t sub_20E5F82DC(uint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = (uint64_t)sub_20E5FDE20((char *)result, v11, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_20E5F83BC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *v0;
  sub_20E5F8A80();
  if ((v2 & 1) != 0)
    return;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v3 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_17;
  }
  v4 = sub_20E5FA854(v1);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  v6 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 32 * v4);
  v7 = *v6;
  v8 = v6[1];
  v9 = v6[2];
  v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x212BC0FCC](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  v11 = sub_20E5FF560();
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    do
    {
      if ((sub_20E5FF494() & 1) != 0)
        MEMORY[0x212BC1008](v13, v14);
      swift_bridgeObjectRelease();
      v13 = sub_20E5FF560();
      v14 = v15;
    }
    while (v15);
  }
  swift_bridgeObjectRelease();
  v16 = sub_20E5F90B0(0, 0xE000000000000000);
  v18 = v17;
  swift_bridgeObjectRelease();
  if (!v18)
    goto LABEL_18;
  if (v16 != 75 || v18 != 0xE100000000000000)
    sub_20E5FF6E0();
  swift_bridgeObjectRelease();
}

void sub_20E5F857C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *v0;
  sub_20E5F8A80();
  if ((v2 & 1) != 0)
    return;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v3 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = sub_20E5FA854(v1);
  if ((v5 & 1) == 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  v6 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 32 * v4);
  v7 = *v6;
  v8 = v6[1];
  v9 = v6[2];
  v10 = v6[3];
  swift_bridgeObjectRetain();
  MEMORY[0x212BC0FCC](v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  v11 = sub_20E5FF560();
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((sub_20E5FF494() & 1) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_20E5F65D4(0, v15[2] + 1, 1);
        v18 = v15[2];
        v17 = v15[3];
        if (v18 >= v17 >> 1)
          sub_20E5F65D4((char *)(v17 > 1), v18 + 1, 1);
        v15[2] = v18 + 1;
        v19 = &v15[2 * v18];
        v19[4] = v13;
        v19[5] = v14;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v13 = sub_20E5FF560();
      v14 = v16;
    }
    while (v16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  if (v15[2] < 2uLL)
    goto LABEL_25;
  v21 = v15[6];
  v20 = v15[7];
  swift_bridgeObjectRetain();
  swift_release();
  if (v21 == 78 && v20 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20E5FF6E0();
    swift_bridgeObjectRelease();
  }
}

void sub_20E5F87A4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *v0;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v2 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v3 = sub_20E5FA854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v5 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 32 * v3);
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  swift_bridgeObjectRetain();
  v10 = MEMORY[0x212BC0FCC](v6, v7, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = sub_20E5F8BE0(v10, v12);
  v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_15:
    __break(1u);
    return;
  }
  if (v13 != 78 || v15 != 0xE100000000000000)
    sub_20E5FF6E0();
  swift_bridgeObjectRelease();
}

void sub_20E5F88C0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *v0;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v2 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_16;
  }
  v3 = sub_20E5FA854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  v5 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 32 * v3);
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x212BC0FCC](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  v10 = sub_20E5FF560();
  v12 = v11;
  if (v11)
  {
    v13 = v10;
    do
    {
      if ((sub_20E5FF494() & 1) != 0)
        MEMORY[0x212BC1008](v13, v12);
      swift_bridgeObjectRelease();
      v13 = sub_20E5FF560();
      v12 = v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  v15 = sub_20E5FF590();
  v17 = sub_20E5F8BE0(v15, v16);
  v19 = v18;
  swift_bridgeObjectRelease();
  if (!v19)
    goto LABEL_17;
  if (v17 != 75 || v19 != 0xE100000000000000)
    sub_20E5FF6E0();
  swift_bridgeObjectRelease();
}

void sub_20E5F8A80()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *v0;
  if (qword_254A2ACB8 != -1)
    swift_once();
  v2 = qword_254A2B108;
  if (!*(_QWORD *)(qword_254A2B108 + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  v3 = sub_20E5FA854(v1);
  if ((v4 & 1) == 0)
  {
LABEL_12:
    __break(1u);
    return;
  }
  v5 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 32 * v3);
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  swift_bridgeObjectRetain();
  MEMORY[0x212BC0FCC](v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  v10 = sub_20E5FF560();
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    do
    {
      if ((sub_20E5FF494() & 1) != 0)
        MEMORY[0x212BC1008](v12, v13);
      swift_bridgeObjectRelease();
      v12 = sub_20E5FF560();
      v13 = v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  sub_20E5FF524();
  swift_bridgeObjectRelease();
}

uint64_t sub_20E5F8BE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return sub_20E5FF584();
  else
    return 0;
}

BOOL static HandshakePattern.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HandshakePattern.hash(into:)()
{
  return sub_20E5FF74C();
}

void *static HandshakePattern.allCases.getter()
{
  return &unk_24C973CF0;
}

uint64_t HandshakePattern.hashValue.getter()
{
  sub_20E5FF740();
  sub_20E5FF74C();
  return sub_20E5FF758();
}

unint64_t sub_20E5F8CB0()
{
  unint64_t result;

  result = qword_254A2AFB8;
  if (!qword_254A2AFB8)
  {
    result = MEMORY[0x212BC13A4]("YG7><\n", &type metadata for HandshakePattern);
    atomic_store(result, (unint64_t *)&qword_254A2AFB8);
  }
  return result;
}

unint64_t sub_20E5F8CF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AFC0;
  if (!qword_254A2AFC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AFC8);
    result = MEMORY[0x212BC13A4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AFC0);
  }
  return result;
}

void sub_20E5F8D44(_QWORD *a1@<X8>)
{
  *a1 = &unk_24C973CF0;
}

uint64_t getEnumTagSinglePayload for HandshakePattern(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDB)
    goto LABEL_17;
  if (a2 + 37 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 37) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 37;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 37;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 37;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x26;
  v8 = v6 - 38;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakePattern(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 37 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 37) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDA)
    return ((uint64_t (*)(void))((char *)&loc_20E5F8E30 + 4 * byte_20E6003B5[v4]))();
  *a1 = a2 + 37;
  return ((uint64_t (*)(void))((char *)sub_20E5F8E64 + 4 * byte_20E6003B0[v4]))();
}

uint64_t sub_20E5F8E64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F8E6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E5F8E74);
  return result;
}

uint64_t sub_20E5F8E80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5F8E88);
  *(_BYTE *)result = a2 + 37;
  return result;
}

uint64_t sub_20E5F8E8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5F8E94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HandshakePattern()
{
  return &type metadata for HandshakePattern;
}

uint64_t sub_20E5F8EB0()
{
  uint64_t v0;
  _QWORD *v1;
  unsigned __int8 *v2;
  unint64_t *v3;
  uint64_t result;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  unint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;

  v0 = 38;
  v1 = (_QWORD *)MEMORY[0x24BEE4B00];
  v2 = (unsigned __int8 *)&byte_24C973D10;
  while (1)
  {
    v31 = v0;
    v6 = *v2++;
    v5 = v6;
    v7 = sub_20E5FF500();
    v9 = v8;
    v10 = sub_20E5FF524();
    v11 = sub_20E5FADC0(v10, v7, v9);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = sub_20E5FA854(v6);
    v21 = v1[2];
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (v1[3] >= v23)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v19 & 1) != 0)
          goto LABEL_2;
      }
      else
      {
        sub_20E5FAC28();
        if ((v24 & 1) != 0)
          goto LABEL_2;
      }
    }
    else
    {
      sub_20E5FA94C(v23, isUniquelyReferenced_nonNull_native);
      v25 = sub_20E5FA854(v5);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_18;
      v20 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_2:
        v3 = (unint64_t *)(v1[7] + 32 * v20);
        *v3 = v11;
        v3[1] = v13;
        v3[2] = v15;
        v3[3] = v17;
        swift_bridgeObjectRelease();
        goto LABEL_3;
      }
    }
    v1[(v20 >> 6) + 8] |= 1 << v20;
    *(_BYTE *)(v1[6] + v20) = v5;
    v27 = (unint64_t *)(v1[7] + 32 * v20);
    *v27 = v11;
    v27[1] = v13;
    v27[2] = v15;
    v27[3] = v17;
    v28 = v1[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_17;
    v1[2] = v30;
LABEL_3:
    result = swift_bridgeObjectRelease();
    v0 = v31 - 1;
    if (v31 == 1)
    {
      qword_254A2B108 = (uint64_t)v1;
      return result;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result = sub_20E5FF6EC();
  __break(1u);
  return result;
}

uint64_t sub_20E5F90B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  sub_20E5FF530();
  return sub_20E5FF584();
}

void sub_20E5F9128()
{
  __asm { BR              X10 }
}

uint64_t sub_20E5F9150()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFD0);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_20E6002B0;
  *(_BYTE *)(result + 32) = 1;
  *(_QWORD *)(result + 56) = &type metadata for 🔜;
  *(_QWORD *)(result + 64) = &off_24C973F28;
  *(_QWORD *)(result + 40) = &unk_24C973CC8;
  return result;
}

void sub_20E5FA494(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_20E5FA4D4()
{
  uint64_t *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  if (v0[2] > 0 || (unint64_t)v0[3] < 2)
  {
    __break(1u);
    JUMPOUT(0x20E5FA81CLL);
  }
  sub_20E5F2F10(v0[1], (uint64_t)v19);
  v2 = v20;
  v3 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  sub_20E5F82DC(v4);
  v5 = v0[3];
  v6 = *v0;
  if ((v5 & 1) != 0
    && (isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull(), *v0 = v6, isUniquelyReferenced_nonNull))
  {
    v8 = v0[2];
  }
  else
  {
    sub_20E5FAE5C(v0[1], v0[2], v5);
    v10 = v9;
    v12 = v11;
    v8 = v13;
    v5 = v14;
    swift_unknownObjectRelease();
    *v0 = v10;
    v0[1] = v12;
    v0[2] = v8;
    v0[3] = v5;
  }
  if (v5 < 2 || v8 > 0)
  {
    __break(1u);
    JUMPOUT(0x20E5FA83CLL);
  }
  v15 = v0[1];
  v16 = *(_QWORD *)(v15 + 24);
  v17 = *(_QWORD *)(v15 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v15, v16);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 24))(&unk_24C972D00, v16, v17);
}

unint64_t sub_20E5FA854(unsigned __int8 a1)
{
  uint64_t v2;

  sub_20E5FF740();
  sub_20E5FF74C();
  v2 = sub_20E5FF758();
  return sub_20E5FA8AC(a1, v2);
}

unint64_t sub_20E5FA8AC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_20E5FA94C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v22;
  int64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  __int128 v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFA0);
  v34 = a2;
  result = sub_20E5FF6B0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
          goto LABEL_40;
        result = v5 + 64;
        if (v8 >= v12)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            result = swift_release();
            v3 = v2;
            goto LABEL_38;
          }
          v32 = 1 << *(_BYTE *)(v5 + 32);
          if (v32 >= 64)
            bzero(v33, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v33 = -1 << v32;
          v3 = v2;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v22 = v33[v8];
        if (!v22)
        {
          v23 = v8 + 1;
          if (v8 + 1 >= v12)
            goto LABEL_31;
          v22 = v33[v23];
          if (!v22)
          {
            while (1)
            {
              v8 = v23 + 1;
              if (__OFADD__(v23, 1))
                break;
              if (v8 >= v12)
                goto LABEL_31;
              v22 = v33[v8];
              ++v23;
              if (v22)
                goto LABEL_20;
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_20:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v24 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v20);
      v25 = *(_QWORD *)(v5 + 56) + 32 * v20;
      v35 = *(_OWORD *)v25;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = *(_QWORD *)(v25 + 24);
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_20E5FF740();
      sub_20E5FF74C();
      result = sub_20E5FF758();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v16 == v29;
          if (v16 == v29)
            v16 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v31 == -1);
        v17 = __clz(__rbit64(~v31)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v17) = v24;
      v18 = *(_QWORD *)(v7 + 56) + 32 * v17;
      *(_OWORD *)v18 = v35;
      *(_QWORD *)(v18 + 16) = v26;
      *(_QWORD *)(v18 + 24) = v27;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

void *sub_20E5FAC28()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFA0);
  v2 = *v0;
  v3 = sub_20E5FF6A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    if (!v22)
      break;
LABEL_23:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(v2 + 56) + 32 * v15;
    v18 = *(_QWORD *)(v16 + 16);
    v17 = *(_QWORD *)(v16 + 24);
    v19 = *(_OWORD *)v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v20 = *(_QWORD *)(v4 + 56) + 32 * v15;
    *(_OWORD *)v20 = v19;
    *(_QWORD *)(v20 + 16) = v18;
    *(_QWORD *)(v20 + 24) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_20E5FADC0(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_20E5FF53C();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_20E5FF59C();
  }
  __break(1u);
  return result;
}

void sub_20E5FAE5C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v3 = a3 >> 1;
  v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_11;
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFD0);
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v4;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 40);
    if (v3 >= a2)
      goto LABEL_4;
    goto LABEL_10;
  }
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v3 < a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AFD8);
  swift_arrayInitWithCopy();
  if (__OFSUB__(0, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = v6[2];
  v9 = __OFADD__(a2, v8);
  v10 = a2 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
LABEL_15:
    __break(1u);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t assignWithTake for 🔙(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for 🔙()
{
  return &type metadata for 🔙;
}

uint64_t _s5Chirp4____Vwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5Chirp4____Vwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_20E5FB07C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for 🔜()
{
  return &type metadata for 🔜;
}

uint64_t getEnumTagSinglePayload for MessagePatternTokens(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagePatternTokens(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_20E5FB1A4 + 4 * byte_20E6005F5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_20E5FB1D8 + 4 * asc_20E6005F0[v4]))();
}

uint64_t sub_20E5FB1D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5FB1E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E5FB1E8);
  return result;
}

uint64_t sub_20E5FB1F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5FB1FCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_20E5FB200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5FB208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagePatternTokens()
{
  return &type metadata for MessagePatternTokens;
}

unint64_t sub_20E5FB228()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2AFE0;
  if (!qword_254A2AFE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2AFE8);
    result = MEMORY[0x212BC13A4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254A2AFE0);
  }
  return result;
}

void sub_20E5FB274(_QWORD *a1@<X8>)
{
  *a1 = &unk_24C973D38;
}

unint64_t sub_20E5FB288()
{
  unint64_t result;

  result = qword_254A2AFF0[0];
  if (!qword_254A2AFF0[0])
  {
    result = MEMORY[0x212BC13A4]("QE7>@\b", &type metadata for MessagePatternTokens);
    atomic_store(result, qword_254A2AFF0);
  }
  return result;
}

uint64_t (*sub_20E5FB2CC())()
{
  return nullsub_1;
}

uint64_t sub_20E5FB2DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20E5FB2E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

void sub_20E5FB31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x20E5FB464);
}

uint64_t sub_20E5FB498(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (a2)
      v3 = a3 - a2;
    else
      v3 = 0;
    result = sub_20E5FE81C(0, result, v3, a2, a3);
    if ((v4 & 1) != 0)
      v5 = v3;
    else
      v5 = result;
    if ((v5 & 0x8000000000000000) == 0)
      return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_20E5FB508(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (result < 0)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  if (a2)
    v3 = a3 - a2;
  else
    v3 = 0;
  result = sub_20E5FE81C(v3, -result, 0, a2, a3);
  if ((v4 & 1) != 0)
    result = 0;
  if (v3 < result)
    goto LABEL_10;
  return result;
}

void sub_20E5FB57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x20E5FB6C8);
}

void sub_20E5FB6FC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = type metadata accessor for CipherState(0, a2, a3, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a4, 1, 1, v10);
  __asm { BR              X9 }
}

uint64_t sub_20E5FB7E4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v6 - 176) = v3;
  swift_getAssociatedConformanceWitness();
  if (sub_20E5FF464() < BYTE6(v5))
  {
    *(_QWORD *)(v6 - 136) = v1;
    *(_QWORD *)(v6 - 128) = v5;
    sub_20E5EAF50();
    sub_20E5FF374();
    sub_20E5FF2F0();
    v7 = *(_QWORD *)(v6 - 160);
    *(_QWORD *)(v6 - 136) = *(_QWORD *)(v6 - 152);
    *(_QWORD *)(v6 - 128) = v2;
    *(_QWORD *)(v6 - 120) = v7;
    *(_QWORD *)(v6 - 112) = v4;
    type metadata accessor for SymmetricState();
  }
  v8 = sub_20E5FF464();
  return ((uint64_t (*)(uint64_t))((char *)&loc_20E5FB8EC + dword_20E5FBA8C[v0]))(v8);
}

void sub_20E5FB900(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v7 = __OFSUB__(a1, BYTE6(v1));
  v8 = a1 - BYTE6(v1);
  if (!v7)
  {
    *(_QWORD *)(v6 - 136) = sub_20E5FEAFC(v8);
    *(_QWORD *)(v6 - 128) = v9;
    sub_20E5FDF10(v6 - 136);
    v10 = *(_QWORD *)(v6 - 136);
    v11 = *(_QWORD *)(v6 - 128);
    *(_QWORD *)(v6 - 96) = v3;
    *(_QWORD *)(v6 - 88) = v1;
    sub_20E5EAB18(v3, v1);
    sub_20E5EAB18(v10, v11);
    sub_20E5F2CF8(v10, v11);
    sub_20E5EAB5C(v10, v11);
    sub_20E5EAB5C(v10, v11);
    *(_QWORD *)(v6 - 136) = v5;
    *(_QWORD *)(v6 - 128) = v2;
    *(_QWORD *)(v6 - 120) = *(_QWORD *)(v6 - 160);
    *(_QWORD *)(v6 - 112) = v4;
    type metadata accessor for SymmetricState();
  }
  __break(1u);
  JUMPOUT(0x20E5FBA6CLL);
}

void sub_20E5FB9AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(a1 + 56));
  *v4 = v1;
  v4[1] = v2;
  JUMPOUT(0x20E5FB9B8);
}

uint64_t sub_20E5FBA08(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (uint64_t *)(v3 + *(int *)(a1 + 56));
  v6 = *v5;
  v7 = v5[1];
  *(_QWORD *)(v4 - 136) = *v5;
  *(_QWORD *)(v4 - 128) = v7;
  sub_20E5EAB18(v6, v7);
  sub_20E5FF398();
  return sub_20E5EAB5C(v2, v1);
}

uint64_t sub_20E5FBA9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (uint64_t *)(v3 + *(int *)(a3 + 56));
  v9 = *v8;
  v14 = *v8;
  v15 = v8[1];
  sub_20E5EAB18(*v8, v15);
  sub_20E5EAB18(a1, a2);
  sub_20E5F2CF8(a1, a2);
  sub_20E5EAB5C(a1, a2);
  sub_20E5EAF50();
  sub_20E5FF374();
  sub_20E5EAB5C(v14, v15);
  swift_getAssociatedConformanceWitness();
  v10 = sub_20E5FF2F0();
  v12 = v11;
  result = sub_20E5EAB5C(v9, v15);
  *v8 = v10;
  v8[1] = v12;
  return result;
}

uint64_t sub_20E5FBC04(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20E5FF3A4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  sub_20E5FF398();
  sub_20E5FC420((uint64_t)v12, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_20E5FBCF8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  unint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  _QWORD v22[2];

  v20 = a2;
  v7 = type metadata accessor for CipherState(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = sub_20E5FF5FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v19 - v10, v4, v8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48);
  v13 = v12(v11, 1, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v13 == 1)
  {
    v14 = v20;
    sub_20E5EAB18(a1, v20);
    v7 = a1;
    goto LABEL_6;
  }
  v14 = v20;
  v22[0] = a1;
  v22[1] = v20;
  v21 = *(_OWORD *)&v4[*(int *)(a3 + 56)];
  result = v12(v4, 1, v7);
  if ((_DWORD)result != 1)
  {
    v16 = sub_20E5EAF50();
    v17 = v19;
    v18 = sub_20E5EA5C8((uint64_t)v22, (uint64_t)&v21, v7, MEMORY[0x24BDCDDE8], MEMORY[0x24BDCDDE8], v16, v16);
    if (v17)
      return v7;
    v7 = v18;
LABEL_6:
    sub_20E5FBA9C(a1, v14, a3);
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_20E5FBE7C(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  v6 = sub_20E5FF3A4();
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = a3[5];
  v13 = a3[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  result = sub_20E5FF464();
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    *(_QWORD *)&v25 = a1;
    *((_QWORD *)&v25 + 1) = a2;
    v21 = result;
    sub_20E5EAB18(a1, a2);
    sub_20E5FF398();
    v15 = v11;
    v17 = v23;
    v16 = v24;
    v25 = xmmword_20E6000C0;
    sub_20E5EAF50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    v18 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
    v19 = v18(v9, v17);
    MEMORY[0x24BDAC7A8](v19);
    *(&v20 - 6) = a3[2];
    *(&v20 - 5) = v13;
    *(&v20 - 4) = a3[4];
    *(&v20 - 3) = v12;
    *(&v20 - 2) = v21;
    *(&v20 - 1) = v16;
    sub_20E5FF38C();
    return v18(v15, v17);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20E5FC088@<X0>(int a1@<W0>, int a2@<W1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v21 = a1;
  v22 = a2;
  v23 = a4;
  v5 = sub_20E5FF3A4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - v10;
  v12 = a3[5];
  v13 = a3[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v14 = sub_20E5FF464();
  v24 = xmmword_20E6000C0;
  v25 = xmmword_20E6000C0;
  result = sub_20E5FF398();
  v25 = v24;
  if (v14 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_20E5EAF50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    v16 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
    v17 = v16(v9, v5);
    MEMORY[0x24BDAC7A8](v17);
    v18 = a3[2];
    *((_QWORD *)&v21 - 6) = v18;
    *((_QWORD *)&v21 - 5) = v13;
    v19 = a3[4];
    *((_QWORD *)&v21 - 4) = v19;
    *((_QWORD *)&v21 - 3) = v12;
    *((_QWORD *)&v21 - 2) = v14;
    *((_BYTE *)&v21 - 8) = v21 & 1;
    *((_BYTE *)&v21 - 7) = v22 & 1;
    type metadata accessor for TransportState(0, v18, v19, v20);
    sub_20E5FF38C();
    return v16(v11, v5);
  }
  return result;
}

uint64_t sub_20E5FC29C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  unint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  _QWORD v23[2];

  v21 = a2;
  v7 = type metadata accessor for CipherState(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = sub_20E5FF5FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v20 - v10, v4, v8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48);
  v13 = v12(v11, 1, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v13 == 1)
  {
    v14 = v21;
    sub_20E5FBA9C(a1, v21, a3);
    sub_20E5EAB18(a1, v14);
    return a1;
  }
  v23[0] = a1;
  v23[1] = v21;
  v22 = *(_OWORD *)&v4[*(int *)(a3 + 56)];
  result = v12(v4, 1, v7);
  if ((_DWORD)result != 1)
  {
    v16 = sub_20E5EAF50();
    v17 = v20;
    v18 = sub_20E5EA174((uint64_t)v23, (uint64_t)&v22, v7, MEMORY[0x24BDCDDE8], MEMORY[0x24BDCDDE8], v16, v16);
    if (!v17)
    {
      a1 = v18;
      sub_20E5FBA9C(v18, v19, a3);
    }
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_20E5FC420(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  v20 = a1;
  v3 = sub_20E5FF3A4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19 - v11;
  v13 = a2[5];
  v14 = a2[3];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  result = sub_20E5FF464();
  if (result + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v20, v3);
    sub_20E5FE5F4();
    sub_20E5FF398();
    v16 = v21;
    v22 = xmmword_20E6000C0;
    sub_20E5EAF50();
    static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)();
    v17 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    v18 = v17(v10, v3);
    MEMORY[0x24BDAC7A8](v18);
    *(&v19 - 6) = a2[2];
    *(&v19 - 5) = v14;
    *(&v19 - 4) = a2[4];
    *(&v19 - 3) = v13;
    *(&v19 - 2) = v16;
    sub_20E5FF38C();
    return v17(v12, v3);
  }
  return result;
}

uint64_t static HKDF.deriveKey<A>(inputKeyMaterial:salt:info:outputByteCount:)()
{
  char *v0;
  rsize_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2AD48);
  sub_20E5FF38C();
  v0 = (char *)v3;
  sub_20E5EAA88();
  sub_20E5FF428();
  v1 = *(_QWORD *)(v3 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v0 = sub_20E5FDE2C(0, v1, 0, (char *)v3, qword_254A2AED8);
  memset_s(v0 + 32, v1, 0, v1);
  return swift_bridgeObjectRelease();
}

void sub_20E5FC738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v23 = a4;
  v24 = a6;
  v35 = a3;
  v22[1] = a1;
  v22[2] = a2;
  v28 = type metadata accessor for CipherState(255, a4, a6, a4);
  v11 = sub_20E5FF5FC();
  v29 = *(_QWORD *)(v11 - 8);
  v30 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v27 = (char *)v22 - v12;
  v13 = sub_20E5FF3A4();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v25 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v26 = (char *)v22 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v22[0] = a7;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v18 = sub_20E5FF464();
  v31 = sub_20E5FB498(v18, a1, a2);
  v32 = v19;
  v33 = v20;
  v34 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B088);
  sub_20E5FE65C();
  sub_20E5FF398();
  v31 = v23;
  v32 = a5;
  v33 = v24;
  v34 = v22[0];
  type metadata accessor for SymmetricState();
}

uint64_t sub_20E5FC8F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 40))(*(_QWORD *)(v6 - 72) + *(int *)(a1 + 52), v4, v5);
  v7 = sub_20E5FF464();
  *(_QWORD *)(v6 - 112) = sub_20E5FB508(v7, *(_QWORD *)(v6 - 200), *(_QWORD *)(v6 - 192));
  *(_QWORD *)(v6 - 104) = v8;
  *(_QWORD *)(v6 - 96) = v9;
  *(_QWORD *)(v6 - 88) = v10;
  sub_20E5FF398();
  sub_20E5FC9FC();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 16))(*(_QWORD *)(v6 - 168), v4, v5);
  sub_20E5FE5F4();
  v11 = *(_QWORD *)(v6 - 160);
  sub_20E5FF398();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v5);
  v12 = *(_QWORD *)(v6 - 152);
  sub_20E5EA10C(v11, v2, v3, v12);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v6 - 144) - 8) + 56))(v12, 0, 1);
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v6 - 136) + 40))(*(_QWORD *)(v6 - 72), v12, *(_QWORD *)(v6 - 128));
}

uint64_t sub_20E5FC9FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;

  v1 = sub_20E5FF3A4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v7 = v0;
  sub_20E5FF38C();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_20E5FCAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[11];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a8;
  v24 = a6;
  v23[9] = type metadata accessor for CipherState(255, a5, a7, a4);
  v13 = sub_20E5FF5FC();
  v23[7] = *(_QWORD *)(v13 - 8);
  v23[8] = v13;
  MEMORY[0x24BDAC7A8](v13);
  v23[6] = (char *)v23 - v14;
  v15 = sub_20E5FF3A4();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v23[5] = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v23[4] = (char *)v23 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v23[0] = a1;
  v23[2] = a2;
  v25 = sub_20E5FB498(a3, a1, a2);
  v26 = v20;
  v27 = v21;
  v28 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B088);
  sub_20E5FE65C();
  sub_20E5FF398();
  v25 = a5;
  v26 = v24;
  v23[10] = a5;
  v24 = a7;
  v27 = a7;
  v28 = v29;
  type metadata accessor for SymmetricState();
}

uint64_t sub_20E5FCC2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v10 = v2;
  v11 = v2 + *(int *)(a1 + 52);
  *(_QWORD *)(v8 - 72) = v5;
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  *(_QWORD *)(v8 - 264) = v4;
  result = v12(v11, v7, v4);
  if (v6 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    v14 = sub_20E5FB508(2 * v6, *(_QWORD *)(v8 - 272), *(_QWORD *)(v8 - 256));
    v16 = v15;
    v17 = v10;
    *(_QWORD *)(v8 - 256) = a1;
    v19 = v18;
    v21 = v20;
    *(_QWORD *)(v8 - 104) = v1;
    *(_QWORD *)(v8 - 96) = v3;
    v22 = (_QWORD *)swift_allocObject();
    *(_QWORD *)(v8 - 128) = v22;
    v22[2] = v14;
    v22[3] = v16;
    v22[4] = v19;
    v22[5] = v21;
    v23 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 - 128), v1);
    v24 = v23[1];
    *(_OWORD *)(v8 - 176) = *v23;
    *(_OWORD *)(v8 - 160) = v24;
    sub_20E5FF728();
    v25 = *(_QWORD *)(v8 - 144);
    v26 = *(_QWORD *)(v8 - 136);
    __swift_destroy_boxed_opaque_existential_1(v8 - 128);
    *(_QWORD *)(v8 - 128) = v25;
    *(_QWORD *)(v8 - 120) = v26;
    sub_20E5EAB18(v25, v26);
    sub_20E5EAB18(v25, v26);
    sub_20E5FB31C(v6, v25, v26);
    v28 = *(_QWORD *)(v8 - 176);
    v27 = *(_QWORD *)(v8 - 168);
    sub_20E5FB57C(v6, v25, v26);
    *(_OWORD *)(v8 - 144) = *(_OWORD *)(v8 - 176);
    sub_20E5FF398();
    v29 = v17;
    sub_20E5FBA9C(v28, v27, *(_QWORD *)(v8 - 256));
    sub_20E5FC9FC();
    v30 = *(_QWORD *)(v8 - 72);
    v31 = *(_QWORD *)(v8 - 264);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v30 + 16))(*(_QWORD *)(v8 - 232), v7, v31);
    sub_20E5FE5F4();
    v32 = *(_QWORD *)(v8 - 240);
    sub_20E5FF398();
    v33 = *(_QWORD *)(v8 - 224);
    sub_20E5EA10C(v32, *(_QWORD *)(v8 - 192), *(_QWORD *)(v8 - 184), v33);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v8 - 200) - 8) + 56))(v33, 0, 1);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8 - 216) + 40))(v29, v33, *(_QWORD *)(v8 - 208));
    sub_20E5FE0F8(v8 - 128);
    sub_20E5EAB5C(v28, v27);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v7, v31);
    return sub_20E5EAB5C(*(_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 120));
  }
  return result;
}

uint64_t sub_20E5FCE74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;

  v22 = a7;
  v23 = a4;
  v24 = a5;
  v25 = a9;
  v15 = sub_20E5FF3A4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a1;
  v34 = a2;
  sub_20E5FF398();
  v26 = a6;
  v27 = v22;
  v28 = a8;
  v29 = a10;
  v30 = a3;
  v31 = v23;
  v32 = v24;
  type metadata accessor for TransportState(0, a6, a8, v19);
  sub_20E5FF38C();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_20E5FCF98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X7>, _BYTE *a8@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v34 = a7;
  v37 = a4;
  v38 = a5;
  v36 = a8;
  v12 = type metadata accessor for CipherState(0, a6, a7, a4);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v35 = (uint64_t)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v33 = (uint64_t)&v32 - v15;
  v16 = sub_20E5FF3A4();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v32 - v20;
  v39 = sub_20E5FB498(a3, a1, a2);
  v40 = v22;
  v41 = v23;
  v42 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B088);
  sub_20E5FE65C();
  sub_20E5FF398();
  sub_20E5FC9FC();
  v39 = sub_20E5FB508(a3, a1, a2);
  v40 = v25;
  v41 = v26;
  v42 = v27;
  sub_20E5FF398();
  sub_20E5FC9FC();
  v29 = v33;
  v28 = v34;
  sub_20E5EA10C((uint64_t)v21, a6, v34, v33);
  v30 = v35;
  sub_20E5EA10C((uint64_t)v19, a6, v28, v35);
  return sub_20E5EB6B0(v37, v38, v29, v30, a6, v28, v36);
}

uint64_t sub_20E5FD178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v6 = sub_20E5FF3A4();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    goto LABEL_6;
  if (a2 - a1 == 32)
    return result;
  if (a2 - a1 != 64)
  {
LABEL_6:
    __break(1u);
    return result;
  }
  v14[0] = sub_20E5FB498(32, a1, a2);
  v14[1] = v11;
  v14[2] = v12;
  v14[3] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B088);
  sub_20E5FE65C();
  sub_20E5FF398();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 40))(a3, v10, v6);
}

size_t sub_20E5FD26C@<X0>(size_t a1@<X0>, unint64_t a2@<X1>, size_t *a3@<X8>)
{
  size_t result;

  result = sub_20E5FE4D4(a1, a2);
  *a3 = result;
  return result;
}

char *sub_20E5FD298(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_20E5FDE2C(a1, a2, a3, a4, qword_254A2AED8);
}

uint64_t sub_20E5FD2A4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20E5FD2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  type metadata accessor for CipherState(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32), a4);
  result = sub_20E5FF5FC();
  if (v5 <= 0x3F)
  {
    result = sub_20E5FF3A4();
    if (v6 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_20E5FD34C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;

  v6 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v8 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      v10 = sub_20E5FF5FC();
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v12 = sub_20E5FF3A4();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      *(uint64_t *)((char *)a1 + *(int *)(v8 + 36)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 36));
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    v13 = *(int *)(a3 + 52);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_20E5FF3A4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = *(int *)(a3 + 56);
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = *v19;
    v21 = v19[1];
    sub_20E5EAB18(*v19, v21);
    *v18 = v20;
    v18[1] = v21;
  }
  return a1;
}

uint64_t sub_20E5FD494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for CipherState(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 32), a4);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, 1, v6))
  {
    v7 = sub_20E5FF3A4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  }
  v8 = a1 + *(int *)(a2 + 52);
  v9 = sub_20E5FF3A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return sub_20E5EAB5C(*(_QWORD *)(a1 + *(int *)(a2 + 56)), *(_QWORD *)(a1 + *(int *)(a2 + 56) + 8));
}

char *sub_20E5FD534(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  v7 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
  {
    v9 = sub_20E5FF5FC();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = sub_20E5FF3A4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  v11 = *(int *)(a3 + 52);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = *(int *)(a3 + 56);
  v16 = (uint64_t *)&a1[v15];
  v17 = (uint64_t *)&a2[v15];
  v18 = *v17;
  v19 = v17[1];
  sub_20E5EAB18(*v17, v19);
  *v16 = v18;
  v16[1] = v19;
  return a1;
}

char *sub_20E5FD650(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;

  v7 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(a1, 1, v7);
  v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      v26 = sub_20E5FF3A4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(a1, a2, v26);
      *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(a1, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = sub_20E5FF5FC();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  v12 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
  *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
LABEL_7:
  v14 = *(int *)(a3 + 52);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = *(int *)(a3 + 56);
  v19 = (uint64_t *)&a1[v18];
  v20 = (uint64_t *)&a2[v18];
  v21 = *v20;
  v22 = v20[1];
  sub_20E5EAB18(*v20, v22);
  v23 = *v19;
  v24 = v19[1];
  *v19 = v21;
  v19[1] = v22;
  sub_20E5EAB5C(v23, v24);
  return a1;
}

char *sub_20E5FD7D8(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v7 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
  {
    v9 = sub_20E5FF5FC();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = sub_20E5FF3A4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
    *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  v11 = *(int *)(a3 + 52);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)&a1[*(int *)(a3 + 56)] = *(_OWORD *)&a2[*(int *)(a3 + 56)];
  return a1;
}

char *sub_20E5FD8E0(char *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;

  v7 = type metadata accessor for CipherState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(a1, 1, v7);
  v11 = v9(a2, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      v22 = sub_20E5FF3A4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(a1, a2, v22);
      *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(a1, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = sub_20E5FF5FC();
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  v12 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
  *(_QWORD *)&a1[*(int *)(v7 + 36)] = *(_QWORD *)&a2[*(int *)(v7 + 36)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
LABEL_7:
  v14 = *(int *)(a3 + 52);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_20E5FF3A4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = *(int *)(a3 + 56);
  v19 = *(_QWORD *)&a1[v18];
  v20 = *(_QWORD *)&a1[v18 + 8];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  sub_20E5EAB5C(v19, v20);
  return a1;
}

uint64_t sub_20E5FDA58()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E5FDA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  type metadata accessor for CipherState(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32), a4);
  v7 = sub_20E5FF5FC();
  v8 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == (_DWORD)a2)
  {
    v9 = v7;
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    v11 = a1;
    return v10(v11, a2, v9);
  }
  v12 = sub_20E5FF3A4();
  v13 = *(_QWORD *)(v12 - 8);
  if (*(_DWORD *)(v13 + 84) == (_DWORD)a2)
  {
    v9 = v12;
    v11 = a1 + *(int *)(a3 + 52);
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    return v10(v11, a2, v9);
  }
  v15 = *(_QWORD *)(a1 + *(int *)(a3 + 56) + 8) >> 60;
  if (((4 * (_DWORD)v15) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v15) & 0xC | (v15 >> 2));
  else
    return 0;
}

uint64_t sub_20E5FDB34()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E5FDB40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;

  type metadata accessor for CipherState(255, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 32), a4);
  v8 = sub_20E5FF5FC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_20E5FF3A4();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 52);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  v15 = (_QWORD *)(a1 + *(int *)(a4 + 56));
  *v15 = 0;
  v15[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

void type metadata accessor for SymmetricState()
{
  JUMPOUT(0x212BC1374);
}

char *sub_20E5FDC14(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B0A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_20E5FDD14(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_20E5FDE2C(a1, a2, a3, a4, &qword_254A2AF98);
}

char *sub_20E5FDD20(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A2B078);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_20E5FDE20(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_20E5FDE2C(a1, a2, a3, a4, &qword_254A2B098);
}

char *sub_20E5FDE2C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void sub_20E5FDF10(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_20E5FDF6C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_20E5FE0F8(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_20E5FE150@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t __s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;

  v21 = v18;
  LOWORD(v22) = a1;
  BYTE2(v22) = BYTE2(a1);
  HIBYTE(v22) = BYTE3(a1);
  v23 = BYTE4(a1);
  v24 = BYTE5(a1);
  v25 = BYTE6(a1);
  result = memset_s(&v21, BYTE6(a1), 0, BYTE6(a1));
  v20 = v22 | ((unint64_t)v23 << 32) | ((unint64_t)v24 << 40) | ((unint64_t)v25 << 48);
  *v17 = v21;
  v17[1] = v20;
  return result;
}

_BYTE *sub_20E5FE3E0@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_20E5FE8D4(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_20E5FE994((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_20E5FEA0C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_20E5FE454(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_20E5FF2B4();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_20E5FF260();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_20E5FF284();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_20E5FF278();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

size_t sub_20E5FE4D4(size_t result, unint64_t a2)
{
  const void *v3;
  int64_t v4;
  _QWORD *v5;

  if (!result)
    return MEMORY[0x24BEE4AF8];
  v3 = (const void *)result;
  v4 = a2 - result;
  if (a2 == result)
    return MEMORY[0x24BEE4AF8];
  if (v4 < 1)
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!a2)
      goto LABEL_13;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_254A2AED8);
    v5 = (_QWORD *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v5);
    v5[2] = v4;
    v5[3] = 2 * result - 64;
    if (!a2)
      goto LABEL_13;
  }
  if ((unint64_t)v3 < a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      memmove(v5 + 4, v3, v4);
      return (size_t)v5;
    }
    __break(1u);
  }
LABEL_13:
  __break(1u);
  return result;
}

char *sub_20E5FE584(char *result, int64_t a2, char *__src, unint64_t a4)
{
  char *v4;
  size_t v5;

  v4 = __src;
  if (!__src || !a4 || (unint64_t)__src >= a4 || !a2)
    return v4;
  if ((uint64_t)(a4 - (_QWORD)__src) >= a2)
    v5 = a2;
  else
    v5 = a4 - (_QWORD)__src;
  if ((v5 & 0x8000000000000000) == 0)
  {
    memmove(result, __src, v5);
    v4 += v5;
    return v4;
  }
  __break(1u);
  return result;
}

unint64_t sub_20E5FE5F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A2B080;
  if (!qword_254A2B080)
  {
    v1 = sub_20E5FF3A4();
    result = MEMORY[0x212BC13A4](MEMORY[0x24BDC6398], v1);
    atomic_store(result, (unint64_t *)&qword_254A2B080);
  }
  return result;
}

void sub_20E5FE63C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20E5FC738(a1, a2, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_20E5FE65C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254A2B090;
  if (!qword_254A2B090)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A2B088);
    v2 = MEMORY[0x24BDCFB90];
    result = MEMORY[0x212BC13A4](MEMORY[0x24BDD0790], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254A2B090);
  }
  return result;
}

uint64_t sub_20E5FE6B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_20E5FD178(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_20E5FE6D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_20E5FE6E0 + *((int *)qword_20E5FE788 + (a4 >> 62))))();
}

uint64_t sub_20E5FE6F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, unsigned int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x20E5FE780);
  }
  return ((uint64_t (*)(void))((char *)&loc_20E5FE730 + *((int *)qword_20E5FE798 + a3)))();
}

uint64_t sub_20E5FE7A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x20E5FE808);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_20E5FE7C0 + dword_20E5FE80C[a4 >> 62]))(v5);
}

uint64_t sub_20E5FE81C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v5 = a5 - a4;
  if (!a4)
    v5 = 0;
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3)
    goto LABEL_19;
  v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_14;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_14:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result)
    goto LABEL_21;
  return result;
}

void sub_20E5FE8A4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20E5FCAB0(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_20E5FE8C4()
{
  return swift_deallocObject();
}

uint64_t sub_20E5FE8D4(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_20E5FE994(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_20E5FF290();
  swift_allocObject();
  result = sub_20E5FF254();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_20E5FF2C0();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_20E5FEA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_20E5FF290();
  swift_allocObject();
  result = sub_20E5FF254();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_20E5FEA8C(uint64_t a1, uint64_t a2)
{
  return sub_20E5FEAC4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20E5FCE74);
}

uint64_t sub_20E5FEAA8(uint64_t a1, uint64_t a2)
{
  return sub_20E5FEAC4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20E5FCF98);
}

uint64_t sub_20E5FEAC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 + 48), *(unsigned __int8 *)(v3 + 56), *(unsigned __int8 *)(v3 + 57), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
}

uint64_t sub_20E5FEAFC(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_20E5FF290();
      swift_allocObject();
      sub_20E5FF26C();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_20E5FF2C0();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_20E5FEB98()
{
  return sub_20E5FF314();
}

uint64_t sub_20E5FEBAC()
{
  return sub_20E5FF32C();
}

uint64_t sub_20E5FEBB4()
{
  return sub_20E5FF320();
}

uint64_t sub_20E5FEBBC()
{
  return sub_20E5FF344();
}

uint64_t sub_20E5FEBC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = sub_20E5FF338();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t static ChaChaPoly.tagByteCount.getter()
{
  return 16;
}

uint64_t static ChaChaPoly.name.getter()
{
  return 0x6F50616843616843;
}

uint64_t static ChaChaPoly.bigEndianNonce.getter()
{
  return 0;
}

uint64_t sub_20E5FEC18()
{
  return 0x6F50616843616843;
}

uint64_t sub_20E5FEC34()
{
  return 16;
}

uint64_t sub_20E5FEC3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = sub_20E5FF308();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t sub_20E5FEC64()
{
  return sub_20E5FF2FC();
}

uint64_t sub_20E5FEC90()
{
  return sub_20E5FF3EC();
}

uint64_t sub_20E5FECB0()
{
  return sub_20E5FF410();
}

uint64_t static AES.GCM.tagByteCount.getter()
{
  return 16;
}

uint64_t static AES.GCM.name.getter()
{
  return 0x4D4347534541;
}

uint64_t static AES.GCM.bigEndianNonce.getter()
{
  return 1;
}

uint64_t sub_20E5FECE8(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t result;

  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6138];
  *(_QWORD *)(a1 + 8) = sub_20E5FEEC4(&qword_254A2B0A8, MEMORY[0x24BDC6138], MEMORY[0x24BDC6128]);
  result = sub_20E5FEEC4(&qword_254A2B0B0, v2, MEMORY[0x24BDC6148]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_20E5FED44()
{
  return sub_20E5FEEC4(&qword_254A2B0B0, MEMORY[0x24BDC6138], MEMORY[0x24BDC6148]);
}

uint64_t sub_20E5FED70()
{
  return sub_20E5FEEC4(&qword_254A2B0B8, MEMORY[0x24BDC6138], (uint64_t)&protocol conformance descriptor for ChaChaPoly.Nonce);
}

unint64_t sub_20E5FEDA0()
{
  unint64_t result;

  result = qword_254A2B0C0;
  if (!qword_254A2B0C0)
  {
    result = MEMORY[0x212BC13A4](&protocol conformance descriptor for ChaChaPoly.SealedBox, MEMORY[0x24BDC6178]);
    atomic_store(result, (unint64_t *)&qword_254A2B0C0);
  }
  return result;
}

uint64_t sub_20E5FEDE4(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t result;

  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC65D0];
  *(_QWORD *)(a1 + 8) = sub_20E5FEEC4(&qword_254A2B0C8, MEMORY[0x24BDC65D0], MEMORY[0x24BDC65B0]);
  result = sub_20E5FEEC4(&qword_254A2B0D0, v2, MEMORY[0x24BDC65F0]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_20E5FEE40()
{
  return sub_20E5FEEC4(&qword_254A2B0D0, MEMORY[0x24BDC65D0], MEMORY[0x24BDC65F0]);
}

uint64_t sub_20E5FEE6C()
{
  return sub_20E5FEEC4(&qword_254A2B0D8, MEMORY[0x24BDC65D0], (uint64_t)&protocol conformance descriptor for AES.GCM.Nonce);
}

uint64_t sub_20E5FEE98()
{
  return sub_20E5FEEC4(&qword_254A2B0E0, MEMORY[0x24BDC6638], (uint64_t)&protocol conformance descriptor for AES.GCM.SealedBox);
}

uint64_t sub_20E5FEEC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BC13A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20E5FEF04()
{
  return 0x4D4347534541;
}

uint64_t sub_20E5FEF18()
{
  return 1;
}

uint64_t sub_20E5FEF20()
{
  return sub_20E5FF3E0();
}

uint64_t sub_20E5FEF34()
{
  return sub_20E5FF3D4();
}

uint64_t static Curve25519.noiseName.getter()
{
  return 0x3931353532;
}

uint64_t sub_20E5FEF5C()
{
  return 0x3931353532;
}

uint64_t sub_20E5FEF70()
{
  return sub_20E5FF368();
}

uint64_t Curve25519.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_20E5FF35C();
}

uint64_t static Curve25519.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 32;
}

uint64_t sub_20E5FEFE8()
{
  return sub_20E5FF35C();
}

uint64_t sub_20E5FF01C()
{
  return 32;
}

uint64_t static P256.noiseName.getter()
{
  return 909455952;
}

uint64_t sub_20E5FF034()
{
  return 909455952;
}

uint64_t P256.KeyAgreement.PrivateKey.init()()
{
  return sub_20E5FF458();
}

uint64_t sub_20E5FF04C()
{
  return sub_20E5FF44C();
}

uint64_t P256.KeyAgreement.PublicKey.init(noiseRepresentation:)()
{
  return sub_20E5FF440();
}

uint64_t static P256.KeyAgreement.PublicKey.noiseRepresentationByteCount.getter()
{
  return 65;
}

_UNKNOWN **sub_20E5FF0C0()
{
  return &protocol witness table for Curve25519.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_20E5FF0CC()
{
  return &protocol witness table for Curve25519.KeyAgreement.PublicKey;
}

_UNKNOWN **sub_20E5FF0D8()
{
  return &protocol witness table for P256.KeyAgreement.PrivateKey;
}

_UNKNOWN **sub_20E5FF0E4()
{
  return &protocol witness table for P256.KeyAgreement.PublicKey;
}

uint64_t sub_20E5FF0F4()
{
  return sub_20E5FF440();
}

uint64_t sub_20E5FF128()
{
  return 65;
}

uint64_t static SHA256.noiseName.getter()
{
  return 0x363532414853;
}

uint64_t sub_20E5FF144()
{
  return 0x363532414853;
}

uint64_t static SHA512.noiseName.getter()
{
  return 0x323135414853;
}

uint64_t sub_20E5FF16C(uint64_t a1)
{
  uint64_t result;

  result = sub_20E5FEEC4(&qword_254A2B0E8, MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_20E5FF1A8()
{
  return 0x323135414853;
}

uint64_t sub_20E5FF1BC(uint64_t a1)
{
  uint64_t result;

  result = sub_20E5FEEC4(&qword_254A2B0F0, MEMORY[0x24BDC6B38], MEMORY[0x24BDC6B30]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of static NoiseHashFunction.noiseName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_20E5FF200()
{
  return MEMORY[0x24BDCB7B8]();
}

uint64_t sub_20E5FF20C()
{
  return MEMORY[0x24BDCB7C0]();
}

uint64_t sub_20E5FF218()
{
  return MEMORY[0x24BDCB7C8]();
}

uint64_t sub_20E5FF224()
{
  return MEMORY[0x24BDCB7D0]();
}

uint64_t sub_20E5FF230()
{
  return MEMORY[0x24BDCB7D8]();
}

uint64_t sub_20E5FF23C()
{
  return MEMORY[0x24BDCB7E8]();
}

uint64_t sub_20E5FF248()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_20E5FF254()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_20E5FF260()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20E5FF26C()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_20E5FF278()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20E5FF284()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20E5FF290()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_20E5FF29C()
{
  return MEMORY[0x24BDCC9F0]();
}

uint64_t sub_20E5FF2A8()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_20E5FF2B4()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_20E5FF2C0()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_20E5FF2CC()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_20E5FF2D8()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_20E5FF2E4()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_20E5FF2F0()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t sub_20E5FF2FC()
{
  return MEMORY[0x24BDC6110]();
}

uint64_t sub_20E5FF308()
{
  return MEMORY[0x24BDC6118]();
}

uint64_t sub_20E5FF314()
{
  return MEMORY[0x24BDC6130]();
}

uint64_t sub_20E5FF320()
{
  return MEMORY[0x24BDC6150]();
}

uint64_t sub_20E5FF32C()
{
  return MEMORY[0x24BDC6158]();
}

uint64_t sub_20E5FF338()
{
  return MEMORY[0x24BDC6160]();
}

uint64_t sub_20E5FF344()
{
  return MEMORY[0x24BDC6168]();
}

uint64_t _s9CryptoKit10Curve25519O12KeyAgreementO06PublicD0V5ChirpE19noiseRepresentation10Foundation4DataVvg_0()
{
  return MEMORY[0x24BDC61C8]();
}

uint64_t sub_20E5FF35C()
{
  return MEMORY[0x24BDC61D0]();
}

uint64_t sub_20E5FF368()
{
  return MEMORY[0x24BDC6200]();
}

uint64_t sub_20E5FF374()
{
  return MEMORY[0x24BDC62B8]();
}

uint64_t sub_20E5FF380()
{
  return MEMORY[0x24BDC6380]();
}

uint64_t sub_20E5FF38C()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_20E5FF398()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_20E5FF3A4()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_20E5FF3B0()
{
  return MEMORY[0x24BDC6550]();
}

uint64_t sub_20E5FF3BC()
{
  return MEMORY[0x24BDC6558]();
}

uint64_t sub_20E5FF3C8()
{
  return MEMORY[0x24BDC6578]();
}

uint64_t sub_20E5FF3D4()
{
  return MEMORY[0x24BDC6590]();
}

uint64_t sub_20E5FF3E0()
{
  return MEMORY[0x24BDC6598]();
}

uint64_t sub_20E5FF3EC()
{
  return MEMORY[0x24BDC65B8]();
}

uint64_t sub_20E5FF3F8()
{
  return MEMORY[0x24BDC65F8]();
}

uint64_t sub_20E5FF404()
{
  return MEMORY[0x24BDC6600]();
}

uint64_t sub_20E5FF410()
{
  return MEMORY[0x24BDC6608]();
}

uint64_t sub_20E5FF41C()
{
  return MEMORY[0x24BDC6610]();
}

uint64_t sub_20E5FF428()
{
  return MEMORY[0x24BDC66D8]();
}

uint64_t sub_20E5FF434()
{
  return MEMORY[0x24BDC6888]();
}

uint64_t sub_20E5FF440()
{
  return MEMORY[0x24BDC6898]();
}

uint64_t sub_20E5FF44C()
{
  return MEMORY[0x24BDC6918]();
}

uint64_t sub_20E5FF458()
{
  return MEMORY[0x24BDC6940]();
}

uint64_t sub_20E5FF464()
{
  return MEMORY[0x24BDC6AB8]();
}

uint64_t sub_20E5FF470()
{
  return MEMORY[0x24BEE06A8]();
}

uint64_t sub_20E5FF47C()
{
  return MEMORY[0x24BEE06B0]();
}

uint64_t sub_20E5FF488()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_20E5FF494()
{
  return MEMORY[0x24BEE06F0]();
}

uint64_t sub_20E5FF4A0()
{
  return MEMORY[0x24BEE06F8]();
}

uint64_t sub_20E5FF4AC()
{
  return MEMORY[0x24BEE0798]();
}

uint64_t sub_20E5FF4B8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_20E5FF4C4()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_20E5FF4D0()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_20E5FF4DC()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_20E5FF4E8()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_20E5FF4F4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_20E5FF500()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_20E5FF50C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_20E5FF518()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20E5FF524()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_20E5FF530()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_20E5FF53C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_20E5FF548()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_20E5FF554()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20E5FF560()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_20E5FF56C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_20E5FF578()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_20E5FF584()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_20E5FF590()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_20E5FF59C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20E5FF5A8()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_20E5FF5B4()
{
  return MEMORY[0x24BEE0E10]();
}

uint64_t sub_20E5FF5C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_20E5FF5CC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_20E5FF5D8()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_20E5FF5E4()
{
  return MEMORY[0x24BEE1AD8]();
}

uint64_t sub_20E5FF5F0()
{
  return MEMORY[0x24BEE1B08]();
}

uint64_t sub_20E5FF5FC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20E5FF608()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_20E5FF614()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_20E5FF620()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_20E5FF62C()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_20E5FF638()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_20E5FF644()
{
  return MEMORY[0x24BEE1F28]();
}

uint64_t sub_20E5FF650()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_20E5FF65C()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_20E5FF668()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20E5FF674()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20E5FF680()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_20E5FF68C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20E5FF698()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20E5FF6A4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20E5FF6B0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20E5FF6BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20E5FF6C8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_20E5FF6D4()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_20E5FF6E0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20E5FF6EC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20E5FF6F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20E5FF704()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20E5FF710()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20E5FF71C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20E5FF728()
{
  return MEMORY[0x24BDD0780]();
}

uint64_t sub_20E5FF734()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_20E5FF740()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20E5FF74C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20E5FF758()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_20E5FF764()
{
  return MEMORY[0x24BEE4778]();
}

uint64_t sub_20E5FF770()
{
  return MEMORY[0x24BEE47C0]();
}

uint64_t sub_20E5FF77C()
{
  return MEMORY[0x24BEE47D0]();
}

uint64_t sub_20E5FF788()
{
  return MEMORY[0x24BEE47E0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

