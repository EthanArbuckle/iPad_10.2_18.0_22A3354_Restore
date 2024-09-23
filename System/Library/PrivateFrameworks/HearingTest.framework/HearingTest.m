double static Double.HTMinPreStimulusDelay.getter()
{
  return 1.0;
}

double static Double.HTMaxPreStimulusDelay.getter()
{
  return 2.0;
}

double static Double.HTPostStimulusDelay.getter()
{
  return 1.0;
}

double static Double.HTToneDuration.getter()
{
  return 1.0;
}

HearingTest::HTHearingChannel_optional __swiftcall HTHearingChannel.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (HearingTest::HTHearingChannel_optional)rawValue;
}

uint64_t HTHearingChannel.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_23DF4C500(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23DF4C518(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_23DF531A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_23DF4C5B0()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

uint64_t sub_23DF4C5F4()
{
  return sub_23DF531F4();
}

uint64_t sub_23DF4C61C()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

_QWORD *sub_23DF4C65C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_23DF4C67C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23DF4C688()
{
  sub_23DF53044();
  return sub_23DF530EC();
}

uint64_t sub_23DF4C6E4()
{
  sub_23DF53044();
  return sub_23DF530E0();
}

double HTHearingTestTone.frequency.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double HTHearingTestTone.soundLevel.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void HTHearingTestTone.channel.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

double HTHearingTestTone.toneDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

HearingTest::HTHearingTestTone __swiftcall HTHearingTestTone.init(frequency:soundLevel:channel:toneDuration:)(Swift::Double frequency, Swift::Double soundLevel, HearingTest::HTHearingChannel channel, Swift::Double toneDuration)
{
  uint64_t v4;
  char v5;
  HearingTest::HTHearingTestTone result;

  v5 = *(_BYTE *)channel;
  *(Swift::Double *)v4 = frequency;
  *(Swift::Double *)(v4 + 8) = soundLevel;
  *(_BYTE *)(v4 + 16) = v5;
  *(Swift::Double *)(v4 + 24) = toneDuration;
  result.toneDuration = toneDuration;
  result.soundLevel = soundLevel;
  result.frequency = frequency;
  result.channel = channel;
  return result;
}

BOOL sub_23DF4C768(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23DF4C784()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF4C7B8 + 4 * byte_23DF53300[*v0]))(0x636E657571657266, 0xE900000000000079);
}

uint64_t sub_23DF4C7B8()
{
  return 0x76654C646E756F73;
}

uint64_t sub_23DF4C7D4()
{
  return 0x6C656E6E616863;
}

uint64_t sub_23DF4C7EC()
{
  return 0x61727544656E6F74;
}

uint64_t sub_23DF4C80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF529AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23DF4C830()
{
  return 0;
}

void sub_23DF4C83C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23DF4C848()
{
  sub_23DF4CA94();
  return sub_23DF53224();
}

uint64_t sub_23DF4C870()
{
  sub_23DF4CA94();
  return sub_23DF53230();
}

uint64_t HTHearingTestTone.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  _BYTE v10[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D182E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(_BYTE *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4CA94();
  sub_23DF53218();
  v10[15] = 0;
  sub_23DF5317C();
  if (!v2)
  {
    v10[14] = 1;
    sub_23DF5317C();
    v10[13] = v8;
    v10[12] = 2;
    sub_23DF4CAD8();
    sub_23DF53194();
    v10[11] = 3;
    sub_23DF5317C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242648CE8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23DF4CA94()
{
  unint64_t result;

  result = qword_256D18440;
  if (!qword_256D18440)
  {
    result = MEMORY[0x242648D00](&unk_23DF541D0, &type metadata for HTHearingTestTone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D18440);
  }
  return result;
}

unint64_t sub_23DF4CAD8()
{
  unint64_t result;

  result = qword_256D182E8;
  if (!qword_256D182E8)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingChannel, &type metadata for HTHearingChannel);
    atomic_store(result, (unint64_t *)&qword_256D182E8);
  }
  return result;
}

uint64_t HTHearingTestTone.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D182F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4CA94();
  sub_23DF5320C();
  if (!v2)
  {
    v17[15] = 0;
    sub_23DF53140();
    v10 = v9;
    v17[14] = 1;
    sub_23DF53140();
    v12 = v11;
    v17[12] = 2;
    sub_23DF4CD08();
    sub_23DF53158();
    v14 = v17[13];
    v17[11] = 3;
    sub_23DF53140();
    v16 = v15;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v12;
    *(_BYTE *)(a2 + 16) = v14;
    *(_QWORD *)(a2 + 24) = v16;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

unint64_t sub_23DF4CD08()
{
  unint64_t result;

  result = qword_256D182F8;
  if (!qword_256D182F8)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingChannel, &type metadata for HTHearingChannel);
    atomic_store(result, (unint64_t *)&qword_256D182F8);
  }
  return result;
}

uint64_t sub_23DF4CD4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HTHearingTestTone.init(from:)(a1, a2);
}

uint64_t sub_23DF4CD60(_QWORD *a1)
{
  return HTHearingTestTone.encode(to:)(a1);
}

double static HTHearingTestTone.earCompletion.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = -100.0;
  *(_OWORD *)a1 = xmmword_23DF54230;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

double HTHearingTestThreshold.frequency.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double HTHearingTestThreshold.threshold.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void HTHearingTestThreshold.channel.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t HTHearingTestThreshold.lowerBound.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t HTHearingTestThreshold.upperBound.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t HTHearingTestThreshold.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _WORD v12[8];

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v0 + 48);
  strcpy((char *)v12, ", threshold: ");
  v12[7] = -4864;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18300);
  v6 = swift_allocObject();
  v7 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v6 + 16) = xmmword_23DF54240;
  v8 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = v8;
  *(_QWORD *)(v6 + 32) = v1;
  sub_23DF530BC();
  sub_23DF530D4();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    sub_23DF53110();
    swift_bridgeObjectRelease();
    strcpy((char *)v12, ", lowerBound: ");
    HIBYTE(v12[7]) = -18;
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_23DF54240;
    *(_QWORD *)(v10 + 56) = v7;
    *(_QWORD *)(v10 + 64) = v8;
    *(_QWORD *)(v10 + 32) = v2;
    sub_23DF530BC();
    sub_23DF530D4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      goto LABEL_5;
    goto LABEL_3;
  }
  if ((v5 & 1) == 0)
  {
LABEL_3:
    sub_23DF53110();
    swift_bridgeObjectRelease();
    strcpy((char *)v12, ", upperBound: ");
    HIBYTE(v12[7]) = -18;
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_23DF54240;
    *(_QWORD *)(v9 + 56) = v7;
    *(_QWORD *)(v9 + 64) = v8;
    *(_QWORD *)(v9 + 32) = v4;
    sub_23DF530BC();
    sub_23DF530D4();
    swift_bridgeObjectRelease();
  }
LABEL_5:
  sub_23DF53110();
  sub_23DF530D4();
  sub_23DF53104();
  sub_23DF530D4();
  swift_bridgeObjectRelease();
  sub_23DF530D4();
  swift_bridgeObjectRelease();
  sub_23DF530D4();
  swift_bridgeObjectRelease();
  sub_23DF530D4();
  swift_bridgeObjectRelease();
  sub_23DF530D4();
  return 0;
}

void __swiftcall HTHearingTestThreshold.init(frequency:threshold:channel:lowerBound:upperBound:)(HearingTest::HTHearingTestThreshold *__return_ptr retstr, Swift::Double frequency, Swift::Double threshold, HearingTest::HTHearingChannel channel, Swift::Double_optional lowerBound, Swift::Double_optional upperBound)
{
  Swift::Double v6;
  char v7;
  HearingTest::HTHearingChannel v8;

  v8 = *(_BYTE *)channel;
  retstr->frequency = frequency;
  retstr->threshold = threshold;
  retstr->channel = v8;
  retstr->lowerBound.value = *(Swift::Double *)&lowerBound.is_nil;
  retstr->lowerBound.is_nil = upperBound.is_nil;
  retstr->upperBound.value = v6;
  retstr->upperBound.is_nil = v7 & 1;
}

uint64_t HTPreviousAudiogram.audiogram.getter()
{
  return swift_bridgeObjectRetain();
}

HearingTest::HTPreviousAudiogram __swiftcall HTPreviousAudiogram.init(audiogram:)(HearingTest::HTPreviousAudiogram audiogram)
{
  HearingTest::HTPreviousAudiogram *v1;

  v1->audiogram._rawValue = audiogram.audiogram._rawValue;
  return audiogram;
}

BOOL static HTHearingTestSessionTerminationReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HTHearingTestSessionTerminationReason.hash(into:)()
{
  return sub_23DF531F4();
}

uint64_t HTHearingTestSessionTerminationReason.hashValue.getter()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

uint64_t HTHearingTestSessionResult.thresholds.getter()
{
  return swift_bridgeObjectRetain();
}

void HTHearingTestSessionResult.terminationReason.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

HearingTest::HTHearingTestSessionResult __swiftcall HTHearingTestSessionResult.init(thresholds:terminationReason:)(Swift::OpaquePointer thresholds, HearingTest::HTHearingTestSessionTerminationReason terminationReason)
{
  uint64_t v2;
  char v3;
  HearingTest::HTHearingTestSessionResult result;

  v3 = *(_BYTE *)terminationReason;
  *(Swift::OpaquePointer *)v2 = thresholds;
  *(_BYTE *)(v2 + 8) = v3;
  result.thresholds = thresholds;
  result.terminationReason = terminationReason;
  return result;
}

double HTHearingTestSessionResultWithAverageNoise.mean_drum_dBA_Inst.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t HTHearingTestSessionResultWithAverageNoise.thresholds.getter()
{
  return swift_bridgeObjectRetain();
}

void HTHearingTestSessionResultWithAverageNoise.terminationReason.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

HearingTest::HTHearingTestSessionResultWithAverageNoise __swiftcall HTHearingTestSessionResultWithAverageNoise.init(thresholds:terminationReason:averageNoise:)(Swift::OpaquePointer thresholds, HearingTest::HTHearingTestSessionTerminationReason terminationReason, Swift::Double averageNoise)
{
  uint64_t v3;
  char v4;
  HearingTest::HTHearingTestSessionResultWithAverageNoise result;

  v4 = *(_BYTE *)terminationReason;
  *(Swift::Double *)v3 = averageNoise;
  *(Swift::OpaquePointer *)(v3 + 8) = thresholds;
  *(_BYTE *)(v3 + 16) = v4;
  result.mean_drum_dBA_Inst = averageNoise;
  result.thresholds = thresholds;
  result.terminationReason = terminationReason;
  return result;
}

__n128 HTHearingTestState.currentTone.getter@<Q0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

uint64_t HTHearingTestState.responses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTHearingTestState.deletedTones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTHearingTestState.maskedTones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTHearingTestState.uncoveredInitialSamplingFrequencies.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTHearingTestState.previousAudiogram.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 HTHearingTestState.init(currentTone:responses:deletedTones:maskedTones:uncoveredInitialSamplingFrequencies:previousAudiogram:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __n128 result;
  __int128 v8;

  result = *(__n128 *)a1;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a7 = *(_OWORD *)a1;
  *(_OWORD *)(a7 + 16) = v8;
  *(_QWORD *)(a7 + 32) = a2;
  *(_QWORD *)(a7 + 40) = a3;
  *(_QWORD *)(a7 + 48) = a4;
  *(_QWORD *)(a7 + 56) = a5;
  *(_QWORD *)(a7 + 64) = a6;
  return result;
}

uint64_t sub_23DF4D278(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF4D2B4 + 4 * byte_23DF53304[a1]))(0x54746E6572727563, 0xEB00000000656E6FLL);
}

uint64_t sub_23DF4D2B4()
{
  return 0x65736E6F70736572;
}

uint64_t sub_23DF4D2D0()
{
  return 0x54646574656C6564;
}

uint64_t sub_23DF4D2F0()
{
  return 0x6F5464656B73616DLL;
}

unint64_t sub_23DF4D310()
{
  return 0xD000000000000023;
}

unint64_t sub_23DF4D330()
{
  return 0xD000000000000011;
}

uint64_t sub_23DF4D34C()
{
  unsigned __int8 *v0;

  return sub_23DF4D278(*v0);
}

uint64_t sub_23DF4D354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF52B94(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DF4D378(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23DF4D384()
{
  sub_23DF4D71C();
  return sub_23DF53224();
}

uint64_t sub_23DF4D3AC()
{
  sub_23DF4D71C();
  return sub_23DF53230();
}

uint64_t HTHearingTestState.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D18308);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *v1;
  v7 = *((_QWORD *)v1 + 2);
  v8 = *((_QWORD *)v1 + 3);
  v9 = *((_QWORD *)v1 + 4);
  v19 = *((_QWORD *)v1 + 5);
  v20 = v9;
  v10 = *((_QWORD *)v1 + 6);
  v17 = *((_QWORD *)v1 + 7);
  v18 = v10;
  v16 = *((_QWORD *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4D71C();
  sub_23DF53218();
  v23 = v21;
  v24 = v7;
  v25 = v8;
  v26 = 0;
  sub_23DF4D760();
  v11 = v22;
  sub_23DF53164();
  if (!v11)
  {
    v12 = v18;
    v13 = v19;
    *(_QWORD *)&v23 = v20;
    v26 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D18318);
    sub_23DF4DE00(&qword_256D18320, &qword_256D18318, (uint64_t (*)(void))sub_23DF4D7E8, MEMORY[0x24BEE12A0]);
    sub_23DF53194();
    *(_QWORD *)&v23 = v13;
    v26 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D18330);
    sub_23DF4DE00(&qword_256D18338, &qword_256D18330, (uint64_t (*)(void))sub_23DF4D82C, MEMORY[0x24BEE12A0]);
    sub_23DF53194();
    *(_QWORD *)&v23 = v12;
    v26 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D18348);
    sub_23DF4DEA8(&qword_256D18350, &qword_256D18348, MEMORY[0x24BEE1330], MEMORY[0x24BEE12A0]);
    sub_23DF53194();
    *(_QWORD *)&v23 = v17;
    v26 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D18358);
    sub_23DF4DEA8(&qword_256D18360, &qword_256D18358, MEMORY[0x24BEE13D8], MEMORY[0x24BEE12A0]);
    sub_23DF53194();
    *(_QWORD *)&v23 = v16;
    v26 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D18368);
    sub_23DF4DF04(&qword_256D18370, MEMORY[0x24BEE13D8], MEMORY[0x24BEE04C0]);
    sub_23DF53164();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23DF4D71C()
{
  unint64_t result;

  result = qword_256D18448;
  if (!qword_256D18448)
  {
    result = MEMORY[0x242648D00](&unk_23DF54180, &type metadata for HTHearingTestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D18448);
  }
  return result;
}

unint64_t sub_23DF4D760()
{
  unint64_t result;

  result = qword_256D18310;
  if (!qword_256D18310)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestTone, &type metadata for HTHearingTestTone);
    atomic_store(result, (unint64_t *)&qword_256D18310);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242648CF4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23DF4D7E8()
{
  unint64_t result;

  result = qword_256D18328;
  if (!qword_256D18328)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestToneResponse, &type metadata for HTHearingTestToneResponse);
    atomic_store(result, (unint64_t *)&qword_256D18328);
  }
  return result;
}

unint64_t sub_23DF4D82C()
{
  unint64_t result;

  result = qword_256D18340;
  if (!qword_256D18340)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestDeletedTone, &type metadata for HTHearingTestDeletedTone);
    atomic_store(result, (unint64_t *)&qword_256D18340);
  }
  return result;
}

uint64_t HTHearingTestState.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D18378);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4D71C();
  sub_23DF5320C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v32 = 0;
  sub_23DF4DD78();
  sub_23DF53128();
  v27 = v28;
  v25 = a2;
  v26 = v29;
  v9 = v30;
  v10 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18318);
  v32 = 1;
  sub_23DF4DE00(&qword_256D18388, &qword_256D18318, (uint64_t (*)(void))sub_23DF4DDBC, MEMORY[0x24BEE12D0]);
  sub_23DF53158();
  v23 = v10;
  v24 = v9;
  v12 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18330);
  v32 = 2;
  sub_23DF4DE00(&qword_256D18398, &qword_256D18330, (uint64_t (*)(void))sub_23DF4DE64, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_23DF53158();
  v22 = v12;
  v13 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18348);
  v32 = 3;
  sub_23DF4DEA8(&qword_256D183A8, &qword_256D18348, MEMORY[0x24BEE1348], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_23DF53158();
  v14 = v13;
  v15 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18358);
  v32 = 4;
  sub_23DF4DEA8(&qword_256D183B0, &qword_256D18358, MEMORY[0x24BEE1400], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_23DF53158();
  v16 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D18368);
  v32 = 5;
  sub_23DF4DF04(&qword_256D183B8, MEMORY[0x24BEE1400], MEMORY[0x24BEE04E0]);
  swift_bridgeObjectRetain();
  sub_23DF53128();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v28;
  swift_bridgeObjectRetain();
  v18 = v25;
  v19 = v26;
  *v25 = v27;
  v18[1] = v19;
  v21 = v22;
  v20 = v23;
  v18[2] = v24;
  v18[3] = v20;
  v18[4] = v21;
  v18[5] = v14;
  v18[6] = v15;
  v18[7] = v16;
  v18[8] = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23DF4DD78()
{
  unint64_t result;

  result = qword_256D18380;
  if (!qword_256D18380)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestTone, &type metadata for HTHearingTestTone);
    atomic_store(result, (unint64_t *)&qword_256D18380);
  }
  return result;
}

unint64_t sub_23DF4DDBC()
{
  unint64_t result;

  result = qword_256D18390;
  if (!qword_256D18390)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestToneResponse, &type metadata for HTHearingTestToneResponse);
    atomic_store(result, (unint64_t *)&qword_256D18390);
  }
  return result;
}

uint64_t sub_23DF4DE00(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x242648D00](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DF4DE64()
{
  unint64_t result;

  result = qword_256D183A0;
  if (!qword_256D183A0)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestDeletedTone, &type metadata for HTHearingTestDeletedTone);
    atomic_store(result, (unint64_t *)&qword_256D183A0);
  }
  return result;
}

uint64_t sub_23DF4DEA8(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x242648D00](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DF4DF04(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D18368);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x242648D00](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DF4DF64@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return HTHearingTestState.init(from:)(a1, a2);
}

uint64_t sub_23DF4DF78(_QWORD *a1)
{
  return HTHearingTestState.encode(to:)(a1);
}

double HTHearingTestDeletedTone.tone.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  double result;

  v2 = *(_BYTE *)(v1 + 16);
  result = *(double *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_BYTE *)(a1 + 16) = v2;
  *(double *)(a1 + 24) = result;
  return result;
}

uint64_t HTHearingTestDeletedTone.originalIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_23DF4DFB0()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C616E696769726FLL;
  else
    return 1701736308;
}

uint64_t sub_23DF4DFF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF52E60(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DF4E014(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23DF4E020()
{
  sub_23DF4E1C8();
  return sub_23DF53224();
}

uint64_t sub_23DF4E048()
{
  sub_23DF4E1C8();
  return sub_23DF53230();
}

uint64_t HTHearingTestDeletedTone.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D183C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = *((_BYTE *)v1 + 16);
  v11 = v1[3];
  v13 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4E1C8();
  sub_23DF53218();
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v14 = 0;
  sub_23DF4D760();
  sub_23DF53194();
  if (!v2)
  {
    LOBYTE(v15) = 1;
    sub_23DF53188();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23DF4E1C8()
{
  unint64_t result;

  result = qword_256D18450;
  if (!qword_256D18450)
  {
    result = MEMORY[0x242648D00](&unk_23DF54130, &type metadata for HTHearingTestDeletedTone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D18450);
  }
  return result;
}

uint64_t HTHearingTestDeletedTone.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D183C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4E1C8();
  sub_23DF5320C();
  if (!v2)
  {
    v15[15] = 0;
    sub_23DF4DD78();
    sub_23DF53158();
    v9 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
    LOBYTE(v16) = 1;
    v13 = sub_23DF5314C();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_QWORD *)(a2 + 32) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23DF4E394@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HTHearingTestDeletedTone.init(from:)(a1, a2);
}

uint64_t sub_23DF4E3A8(_QWORD *a1)
{
  return HTHearingTestDeletedTone.encode(to:)(a1);
}

double HTHearingTestToneResponse.tone.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  double result;

  v2 = *(_BYTE *)(v1 + 16);
  result = *(double *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_BYTE *)(a1 + 16) = v2;
  *(double *)(a1 + 24) = result;
  return result;
}

uint64_t HTHearingTestToneResponse.response.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

void __swiftcall HTHearingTestToneResponse.init(tone:response:)(HearingTest::HTHearingTestToneResponse *__return_ptr retstr, HearingTest::HTHearingTestTone tone, Swift::Bool response)
{
  HearingTest::HTHearingChannel v3;
  Swift::Double v4;

  v3 = *(_BYTE *)(*(_QWORD *)&tone.channel + 16);
  v4 = *(double *)(*(_QWORD *)&tone.channel + 24);
  *(_OWORD *)&retstr->tone.frequency = **(_OWORD **)&tone.channel;
  retstr->tone.channel = v3;
  retstr->tone.toneDuration = v4;
  retstr->response = response;
}

uint64_t sub_23DF4E400()
{
  _BYTE *v0;

  if (*v0)
    return 0x65736E6F70736572;
  else
    return 1701736308;
}

uint64_t sub_23DF4E434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DF52F64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23DF4E458()
{
  sub_23DF4E600();
  return sub_23DF53224();
}

uint64_t sub_23DF4E480()
{
  sub_23DF4E600();
  return sub_23DF53230();
}

uint64_t HTHearingTestToneResponse.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _DWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D183D0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = *((_BYTE *)v1 + 16);
  v11 = v1[3];
  v13[2] = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4E600();
  sub_23DF53218();
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v14 = 0;
  sub_23DF4D760();
  sub_23DF53194();
  if (!v2)
  {
    LOBYTE(v15) = 1;
    sub_23DF53170();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23DF4E600()
{
  unint64_t result;

  result = qword_256D18458[0];
  if (!qword_256D18458[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF540E0, &type metadata for HTHearingTestToneResponse.CodingKeys);
    atomic_store(result, qword_256D18458);
  }
  return result;
}

uint64_t HTHearingTestToneResponse.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D183D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DF4E600();
  sub_23DF5320C();
  if (!v2)
  {
    v15[15] = 0;
    sub_23DF4DD78();
    sub_23DF53158();
    v9 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
    LOBYTE(v16) = 1;
    v13 = sub_23DF53134();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_BYTE *)(a2 + 32) = v13 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23DF4E7D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HTHearingTestToneResponse.init(from:)(a1, a2);
}

uint64_t sub_23DF4E7E4(_QWORD *a1)
{
  return HTHearingTestToneResponse.encode(to:)(a1);
}

uint64_t static HTHearingTestError.== infix(_:_:)()
{
  return 1;
}

uint64_t HTHearingTestError.hash(into:)()
{
  return sub_23DF531F4();
}

uint64_t HTHearingTestError.hashValue.getter()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

uint64_t sub_23DF4E864()
{
  return 1;
}

uint64_t sub_23DF4E86C()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

uint64_t sub_23DF4E8AC()
{
  return sub_23DF531F4();
}

uint64_t sub_23DF4E8D0()
{
  sub_23DF531E8();
  sub_23DF531F4();
  return sub_23DF53200();
}

uint64_t HTHearingTestMetrics.algTonesCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HTHearingTestMetrics.algMisTapsCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t HTHearingTestMetrics.algTonesDelCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t HTHearingTestMetrics.algFastTapperCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t HTHearingTestMetrics.algTonesAtMaxProgress.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

__n128 HTHearingTestMetrics.algMaxAudFloor.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 40);
  v3 = *(_OWORD *)(v1 + 56);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t HTHearingTestMetrics.algUserTaps.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t HTHearingTestMetrics.algMaskedCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t HTHearingTestMetrics.algToneRepetitions.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

__n128 HTHearingTestMetrics.requirementStatusManagerMetrics.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 208);
  v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 160);
  *(_OWORD *)(a1 + 80) = v5;
  result = *(__n128 *)(v1 + 192);
  *(__n128 *)(a1 + 96) = result;
  *(_QWORD *)(a1 + 112) = v2;
  return result;
}

void __swiftcall HTHearingTestMetrics.init()(HearingTest::HTHearingTestMetrics *__return_ptr retstr)
{
  retstr->requirementStatusManagerMetrics.interruptionPauseCount = 0;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band7 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band9 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band3 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band5 = 0u;
  retstr->requirementStatusManagerMetrics.inteferenceFlagRC = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band1 = 0u;
  *(_OWORD *)&retstr->algMaskedCount = 0u;
  retstr->requirementStatusManagerMetrics.interruptionNoiseRC = 0u;
  *(_OWORD *)&retstr->algMaxAudFloor.lessThan10 = 0u;
  *(_OWORD *)&retstr->algMaxAudFloor.lessThan20 = 0u;
  *(_OWORD *)&retstr->algTonesDelCount = 0u;
  *(_OWORD *)&retstr->algTonesAtMaxProgress = 0u;
  *(_OWORD *)&retstr->algTonesCount = 0u;
}

uint64_t HTHearingTestMetricsV2.algTonesCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HTHearingTestMetricsV2.algMisTapsCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t HTHearingTestMetricsV2.algTonesDelCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t HTHearingTestMetricsV2.algFastTapperCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t HTHearingTestMetricsV2.algTonesAtMaxProgress.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

__n128 HTHearingTestMetricsV2.algMaxAudFloor.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 40);
  v3 = *(_OWORD *)(v1 + 56);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t HTHearingTestMetricsV2.algUserTaps.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t HTHearingTestMetricsV2.algMaskedCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t HTHearingTestMetricsV2.algToneRepetitions.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

__n128 HTHearingTestMetricsV2.requirementStatusManagerMetrics.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 208);
  v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 160);
  *(_OWORD *)(a1 + 80) = v5;
  result = *(__n128 *)(v1 + 192);
  *(__n128 *)(a1 + 96) = result;
  *(_QWORD *)(a1 + 112) = v2;
  return result;
}

uint64_t HTHearingTestMetricsV2.noiseMetadataMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 232);
  v3 = *(_QWORD *)(v1 + 240);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 216);
  *(_QWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void __swiftcall HTHearingTestMetricsV2.init()(HearingTest::HTHearingTestMetricsV2 *__return_ptr retstr)
{
  uint64_t v2;
  uint64_t v3;

  retstr->requirementStatusManagerMetrics.interruptionPauseCount = 0;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band7 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band9 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band3 = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band5 = 0u;
  retstr->requirementStatusManagerMetrics.inteferenceFlagRC = 0u;
  *(_OWORD *)&retstr->requirementStatusManagerMetrics.inteferenceFlagMaskedBands.band1 = 0u;
  *(_OWORD *)&retstr->algMaskedCount = 0u;
  retstr->requirementStatusManagerMetrics.interruptionNoiseRC = 0u;
  *(_OWORD *)&retstr->algMaxAudFloor.lessThan10 = 0u;
  *(_OWORD *)&retstr->algMaxAudFloor.lessThan20 = 0u;
  *(_OWORD *)&retstr->algTonesDelCount = 0u;
  *(_OWORD *)&retstr->algTonesAtMaxProgress = 0u;
  *(_OWORD *)&retstr->algTonesCount = 0u;
  v2 = sub_23DF530F8();
  *(_QWORD *)(v2 + 16) = 8;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  v3 = sub_23DF530F8();
  *(_QWORD *)(v3 + 16) = 8;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  retstr->noiseMetadataMetrics.StatNoise = 0.0;
  retstr->noiseMetadataMetrics.InstNoise = 0.0;
  retstr->noiseMetadataMetrics.HistStat._rawValue = (void *)v2;
  retstr->noiseMetadataMetrics.HistInst._rawValue = (void *)v3;
}

__n128 HTRequirementStatusManagerMetrics.interruptionNoiseRC.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = *v1;
  *a1 = *v1;
  return result;
}

__n128 HTRequirementStatusManagerMetrics.inteferenceFlagRC.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[1];
  *a1 = result;
  return result;
}

__n128 HTRequirementStatusManagerMetrics.inteferenceFlagMaskedBands.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 48) = v3;
  result = *(__n128 *)(v1 + 96);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t HTRequirementStatusManagerMetrics.interruptionPauseCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

double HTNoiseMetadataMetrics.StatNoise.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t HTNoiseMetadataMetrics.HistStat.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTNoiseMetadataMetrics.HistInst.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HTHearingTestMetricPairedCounter.counterA.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HTHearingTestMetricPairedCounter.counterB.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t HTHearingTestMetricPairedCounter.totalCount.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  result = *v0 + v1;
  if (__OFADD__(*v0, v1))
    __break(1u);
  return result;
}

uint64_t HTHearingTestMaskedBandsMetrics.band1.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HTHearingTestMaskedBandsMetrics.band1.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band1.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band2.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t HTHearingTestMaskedBandsMetrics.band2.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band2.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band3.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t HTHearingTestMaskedBandsMetrics.band3.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band3.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band4.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t HTHearingTestMaskedBandsMetrics.band4.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band4.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band5.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t HTHearingTestMaskedBandsMetrics.band5.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band5.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band6.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t HTHearingTestMaskedBandsMetrics.band6.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band6.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band7.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t HTHearingTestMaskedBandsMetrics.band7.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band7.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band8.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t HTHearingTestMaskedBandsMetrics.band8.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band8.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band9.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t HTHearingTestMaskedBandsMetrics.band9.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band9.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestMaskedBandsMetrics.band10.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t HTHearingTestMaskedBandsMetrics.band10.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t (*HTHearingTestMaskedBandsMetrics.band10.modify())()
{
  return nullsub_1;
}

uint64_t HTHearingTestFlooringMetrics.lessThan5.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HTHearingTestFlooringMetrics.lessThan10.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t HTHearingTestFlooringMetrics.lessThan15.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t HTHearingTestFlooringMetrics.lessThan20.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

HearingTest::HTHearingTestMetricsDUFieldNames_optional __swiftcall HTHearingTestMetricsDUFieldNames.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HearingTest::HTHearingTestMetricsDUFieldNames_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DF5311C();
  result.value = swift_bridgeObjectRelease();
  v5 = 13;
  if (v3 < 0xD)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static HTHearingTestMetricsDUFieldNames.allCases.getter()
{
  return &unk_250EBCF88;
}

uint64_t HTHearingTestMetricsDUFieldNames.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF4ED80 + 4 * byte_23DF5330A[*v0]))(0x73656E6F54676C61, 0xED0000746E756F43);
}

uint64_t sub_23DF4ED80()
{
  return 0x615473694D676C61;
}

unint64_t sub_23DF4EDA4()
{
  return 0xD000000000000010;
}

uint64_t sub_23DF4EECC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23DF4C518(*a1, *a2, HTHearingTestMetricsDUFieldNames.rawValue.getter) & 1;
}

uint64_t sub_23DF4EEF4(uint64_t a1, uint64_t a2)
{
  return sub_23DF4F364(a1, a2, (void (*)(uint64_t))HTHearingTestMetricsDUFieldNames.rawValue.getter);
}

uint64_t sub_23DF4EF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF4F3D8(a1, a2, a3, (void (*)(void))HTHearingTestMetricsDUFieldNames.rawValue.getter);
}

uint64_t sub_23DF4EF0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF4F434(a1, a2, a3, (void (*)(uint64_t))HTHearingTestMetricsDUFieldNames.rawValue.getter);
}

HearingTest::HTHearingTestMetricsDUFieldNames_optional sub_23DF4EF18(Swift::String *a1)
{
  return HTHearingTestMetricsDUFieldNames.init(rawValue:)(*a1);
}

uint64_t sub_23DF4EF24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HTHearingTestMetricsDUFieldNames.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23DF4EF48(_QWORD *a1@<X8>)
{
  *a1 = &unk_250EBCF88;
}

HearingTest::HTHearingTestMetricsV2DUFieldNames_optional __swiftcall HTHearingTestMetricsV2DUFieldNames.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HearingTest::HTHearingTestMetricsV2DUFieldNames_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DF531AC();
  result.value = swift_bridgeObjectRelease();
  v5 = 17;
  if (v3 < 0x11)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static HTHearingTestMetricsV2DUFieldNames.allCases.getter()
{
  return &unk_250EBD170;
}

uint64_t HTHearingTestMetricsV2DUFieldNames.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23DF4F000 + 4 * byte_23DF53317[*v0]))(0x73656E6F54676C61, 0xED0000746E756F43);
}

uint64_t sub_23DF4F000()
{
  return 0x615473694D676C61;
}

unint64_t sub_23DF4F024()
{
  return 0xD000000000000010;
}

uint64_t sub_23DF4F14C()
{
  return 0x73696F4E74617453;
}

uint64_t sub_23DF4F174()
{
  return 0x7461745374736948;
}

uint64_t sub_23DF4F18C()
{
  return 0x74736E4974736948;
}

unint64_t sub_23DF4F1A8()
{
  unint64_t result;

  result = qword_256D183E0;
  if (!qword_256D183E0)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingChannel, &type metadata for HTHearingChannel);
    atomic_store(result, (unint64_t *)&qword_256D183E0);
  }
  return result;
}

unint64_t sub_23DF4F1F0()
{
  unint64_t result;

  result = qword_256D183E8;
  if (!qword_256D183E8)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestSessionTerminationReason, &type metadata for HTHearingTestSessionTerminationReason);
    atomic_store(result, (unint64_t *)&qword_256D183E8);
  }
  return result;
}

unint64_t sub_23DF4F238()
{
  unint64_t result;

  result = qword_256D183F0;
  if (!qword_256D183F0)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestError, &type metadata for HTHearingTestError);
    atomic_store(result, (unint64_t *)&qword_256D183F0);
  }
  return result;
}

unint64_t sub_23DF4F280()
{
  unint64_t result;

  result = qword_256D183F8;
  if (!qword_256D183F8)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestMetricsDUFieldNames, &type metadata for HTHearingTestMetricsDUFieldNames);
    atomic_store(result, (unint64_t *)&qword_256D183F8);
  }
  return result;
}

uint64_t sub_23DF4F2C4()
{
  return sub_23DF4F4EC(&qword_256D18400, &qword_256D18408);
}

uint64_t sub_23DF4F2E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23DF4C518(*a1, *a2, HTHearingTestMetricsV2DUFieldNames.rawValue.getter) & 1;
}

unint64_t sub_23DF4F314()
{
  unint64_t result;

  result = qword_256D18410;
  if (!qword_256D18410)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingTestMetricsV2DUFieldNames, &type metadata for HTHearingTestMetricsV2DUFieldNames);
    atomic_store(result, (unint64_t *)&qword_256D18410);
  }
  return result;
}

uint64_t sub_23DF4F358(uint64_t a1, uint64_t a2)
{
  return sub_23DF4F364(a1, a2, (void (*)(uint64_t))HTHearingTestMetricsV2DUFieldNames.rawValue.getter);
}

uint64_t sub_23DF4F364(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = sub_23DF531E8();
  a3(v4);
  sub_23DF530C8();
  swift_bridgeObjectRelease();
  return sub_23DF53200();
}

uint64_t sub_23DF4F3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF4F3D8(a1, a2, a3, (void (*)(void))HTHearingTestMetricsV2DUFieldNames.rawValue.getter);
}

uint64_t sub_23DF4F3D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_23DF530C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF4F428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF4F434(a1, a2, a3, (void (*)(uint64_t))HTHearingTestMetricsV2DUFieldNames.rawValue.getter);
}

uint64_t sub_23DF4F434(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_23DF531E8();
  a4(v5);
  sub_23DF530C8();
  swift_bridgeObjectRelease();
  return sub_23DF53200();
}

HearingTest::HTHearingTestMetricsV2DUFieldNames_optional sub_23DF4F498(Swift::String *a1)
{
  return HTHearingTestMetricsV2DUFieldNames.init(rawValue:)(*a1);
}

uint64_t sub_23DF4F4A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HTHearingTestMetricsV2DUFieldNames.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23DF4F4C8()
{
  return sub_23DF4F4EC(&qword_256D18418, &qword_256D18420);
}

uint64_t sub_23DF4F4EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242648D00](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DF4F52C(_QWORD *a1@<X8>)
{
  *a1 = &unk_250EBD170;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingChannel()
{
  return &type metadata for HTHearingChannel;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestTone(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestTone(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestTone()
{
  return &type metadata for HTHearingTestTone;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestThreshold(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestThreshold(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestThreshold()
{
  return &type metadata for HTHearingTestThreshold;
}

ValueMetadata *type metadata accessor for HTPreviousAudiogram()
{
  return &type metadata for HTPreviousAudiogram;
}

uint64_t getEnumTagSinglePayload for HTHearingTestSessionTerminationReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HTHearingTestSessionTerminationReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DF4F7B8 + 4 * byte_23DF5332D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23DF4F7EC + 4 * byte_23DF53328[v4]))();
}

uint64_t sub_23DF4F7EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF4F7F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF4F7FCLL);
  return result;
}

uint64_t sub_23DF4F808(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF4F810);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23DF4F814(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF4F81C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestSessionTerminationReason()
{
  return &type metadata for HTHearingTestSessionTerminationReason;
}

uint64_t initializeBufferWithCopyOfBuffer for HTHearingTestSessionResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HTHearingTestSessionResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for HTHearingTestSessionResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for HTHearingTestSessionResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTHearingTestSessionResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestSessionResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestSessionResult()
{
  return &type metadata for HTHearingTestSessionResult;
}

uint64_t destroy for HTHearingTestSessionResultWithAverageNoise()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s11HearingTest42HTHearingTestSessionResultWithAverageNoiseVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTHearingTestSessionResultWithAverageNoise(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HTHearingTestSessionResultWithAverageNoise(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTHearingTestSessionResultWithAverageNoise(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestSessionResultWithAverageNoise(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestSessionResultWithAverageNoise()
{
  return &type metadata for HTHearingTestSessionResultWithAverageNoise;
}

uint64_t destroy for HTHearingTestState()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTHearingTestState(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTHearingTestState(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HTHearingTestState(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTHearingTestState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestState()
{
  return &type metadata for HTHearingTestState;
}

uint64_t initializeBufferWithCopyOfBuffer for HTHearingTestDeletedTone(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestDeletedTone(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestDeletedTone(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestDeletedTone()
{
  return &type metadata for HTHearingTestDeletedTone;
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

uint64_t getEnumTagSinglePayload for HTHearingTestToneResponse(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestToneResponse(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestToneResponse()
{
  return &type metadata for HTHearingTestToneResponse;
}

uint64_t getEnumTagSinglePayload for HTHearingTestError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for HTHearingTestError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23DF4FFEC + 4 * byte_23DF53332[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DF5000C + 4 * byte_23DF53337[v4]))();
}

_BYTE *sub_23DF4FFEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DF5000C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF50014(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF5001C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DF50024(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DF5002C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23DF50038()
{
  return 0;
}

ValueMetadata *type metadata accessor for HTHearingTestError()
{
  return &type metadata for HTHearingTestError;
}

uint64_t sub_23DF50050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  if ((a30 & 1) == 0)
    return sub_23DF500B8(a1, a2, BYTE1(a2) & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF500B8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for HTHearingTestSessionStatus(uint64_t a1, uint64_t a2)
{
  return sub_23DF513E8(a1, a2, sub_23DF500D0);
}

uint64_t sub_23DF500D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  if ((a30 & 1) == 0)
    return sub_23DF50138(a1, a2, BYTE1(a2) & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF50138(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for HTHearingTestSessionStatus(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_23DF51470(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_23DF50050);
}

uint64_t *assignWithCopy for HTHearingTestSessionStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23DF5165C(a1, a2, a3, (void (*)(_QWORD, uint64_t))sub_23DF50050, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))sub_23DF500D0);
}

__n128 __swift_memcpy233_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  v7 = a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  result = (__n128)a2[11];
  v11 = a2[12];
  v12 = a2[13];
  *(_OWORD *)(a1 + 217) = *(__int128 *)((char *)a2 + 217);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t *assignWithTake for HTHearingTestSessionStatus(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF51880(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))sub_23DF500D0);
}

uint64_t sub_23DF501C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 232);
}

uint64_t sub_23DF501CC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 232) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestSessionStatus()
{
  return &type metadata for HTHearingTestSessionStatus;
}

uint64_t sub_23DF501E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_23DF50248(a1, a2, a3, BYTE1(a3) & 1);
  }
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF50248(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for HTHearingTestSessionStatusWithAverageNoise(uint64_t a1, uint64_t a2)
{
  return sub_23DF51A64(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DF50264);
}

uint64_t sub_23DF50264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23DF502C4(a1, a2, a3, BYTE1(a3) & 1);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF502C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

_QWORD *initializeWithCopy for HTHearingTestSessionStatusWithAverageNoise(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23DF51B14(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23DF501E8);
}

uint64_t *assignWithCopy for HTHearingTestSessionStatusWithAverageNoise(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23DF51D48(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23DF501E8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))sub_23DF50264);
}

void *__swift_memcpy272_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x110uLL);
}

uint64_t *assignWithTake for HTHearingTestSessionStatusWithAverageNoise(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  return sub_23DF51FA0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))sub_23DF50264);
}

uint64_t getEnumTagSinglePayload for HTHearingTestSessionStatusWithAverageNoise(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 272))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 9;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for HTHearingTestSessionStatusWithAverageNoise(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 264) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 272) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = (unint64_t)-a2 << 9;
      result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_OWORD *)(a1 + 88) = 0u;
      *(_OWORD *)(a1 + 104) = 0u;
      *(_OWORD *)(a1 + 120) = 0u;
      *(_OWORD *)(a1 + 136) = 0u;
      *(_OWORD *)(a1 + 152) = 0u;
      *(_OWORD *)(a1 + 168) = 0u;
      *(_OWORD *)(a1 + 184) = 0u;
      *(_OWORD *)(a1 + 200) = 0u;
      *(_OWORD *)(a1 + 216) = 0u;
      *(_OWORD *)(a1 + 232) = 0u;
      *(_OWORD *)(a1 + 248) = 0u;
      *(_QWORD *)(a1 + 264) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 272) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23DF50428(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16) >> 63;
}

uint64_t sub_23DF50434(uint64_t result)
{
  *(_QWORD *)(result + 16) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_23DF50444(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0x1FFLL | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestSessionStatusWithAverageNoise()
{
  return &type metadata for HTHearingTestSessionStatusWithAverageNoise;
}

__n128 __swift_memcpy216_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 216))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMetrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 216) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestMetrics()
{
  return &type metadata for HTHearingTestMetrics;
}

uint64_t destroy for HTHearingTestMetricsV2()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTHearingTestMetricsV2(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v4 = *(_OWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  v6 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = v5;
  v7 = *(_OWORD *)(a2 + 160);
  v8 = *(_OWORD *)(a2 + 176);
  v9 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v8;
  *(_OWORD *)(a1 + 192) = v9;
  *(_OWORD *)(a1 + 160) = v7;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  v10 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HTHearingTestMetricsV2(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  a1[21] = a2[21];
  a1[22] = a2[22];
  a1[23] = a2[23];
  a1[24] = a2[24];
  a1[25] = a2[25];
  a1[26] = a2[26];
  a1[27] = a2[27];
  a1[28] = a2[28];
  a1[29] = a2[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[30] = a2[30];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy248_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;
  __int128 v13;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  v8 = a2[8];
  v9 = a2[9];
  v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  result = (__n128)a2[12];
  v12 = a2[13];
  v13 = a2[14];
  *(_QWORD *)(a1 + 240) = *((_QWORD *)a2 + 30);
  *(_OWORD *)(a1 + 208) = v12;
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 192) = result;
  return result;
}

uint64_t assignWithTake for HTHearingTestMetricsV2(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  v9 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v9;
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMetricsV2(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 248))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 232);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMetricsV2(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 248) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 232) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 248) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestMetricsV2()
{
  return &type metadata for HTHearingTestMetricsV2;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HTRequirementStatusManagerMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 120))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HTRequirementStatusManagerMetrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 120) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HTRequirementStatusManagerMetrics()
{
  return &type metadata for HTRequirementStatusManagerMetrics;
}

uint64_t destroy for HTNoiseMetadataMetrics()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTNoiseMetadataMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HTNoiseMetadataMetrics(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for HTNoiseMetadataMetrics(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTNoiseMetadataMetrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTNoiseMetadataMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTNoiseMetadataMetrics()
{
  return &type metadata for HTNoiseMetadataMetrics;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMetricPairedCounter(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMetricPairedCounter(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HTHearingTestMetricPairedCounter()
{
  return &type metadata for HTHearingTestMetricPairedCounter;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMaskedBandsMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMaskedBandsMetrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestMaskedBandsMetrics()
{
  return &type metadata for HTHearingTestMaskedBandsMetrics;
}

uint64_t getEnumTagSinglePayload for HTHearingTestFlooringMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HTHearingTestFlooringMetrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestFlooringMetrics()
{
  return &type metadata for HTHearingTestFlooringMetrics;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMetricsDUFieldNames(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMetricsDUFieldNames(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_23DF50D58 + 4 * byte_23DF53341[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_23DF50D8C + 4 * byte_23DF5333C[v4]))();
}

uint64_t sub_23DF50D8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF50D94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF50D9CLL);
  return result;
}

uint64_t sub_23DF50DA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF50DB0);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_23DF50DB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF50DBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF50DC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DF50DD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestMetricsDUFieldNames()
{
  return &type metadata for HTHearingTestMetricsDUFieldNames;
}

uint64_t getEnumTagSinglePayload for HTHearingTestMetricsV2DUFieldNames(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestMetricsV2DUFieldNames(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_23DF50EC4 + 4 * byte_23DF5334B[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_23DF50EF8 + 4 * byte_23DF53346[v4]))();
}

uint64_t sub_23DF50EF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF50F00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF50F08);
  return result;
}

uint64_t sub_23DF50F14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF50F1CLL);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_23DF50F20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF50F28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestMetricsV2DUFieldNames()
{
  return &type metadata for HTHearingTestMetricsV2DUFieldNames;
}

uint64_t sub_23DF50F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a5 & 0x8000000000000000) == 0)
    return sub_23DF50F9C(a1, a2, BYTE1(a2) & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DF50F9C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    JUMPOUT(0x242648CDCLL);
  return swift_bridgeObjectRetain();
}

uint64_t destroy for HTHearingTestStatus(uint64_t *a1)
{
  return sub_23DF50FE8(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t sub_23DF50FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a5 & 0x8000000000000000) == 0)
    return sub_23DF51040(a1, a2, BYTE1(a2) & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DF51040(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    JUMPOUT(0x242648CD0);
  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for HTHearingTestStatus(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v13 = a2[9];
  v14 = a2[10];
  v15 = a2[11];
  v16 = a2[12];
  v17 = a2[13];
  sub_23DF50F44(*a2, v4, v5, v6, v7);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  a1[10] = v14;
  a1[11] = v15;
  a1[12] = v16;
  a1[13] = v17;
  return a1;
}

uint64_t *assignWithCopy for HTHearingTestStatus(uint64_t *a1, uint64_t *a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v18 = a2[9];
  v19 = a2[10];
  v20 = a2[11];
  v21 = a2[12];
  v22 = a2[13];
  sub_23DF50F44(*a2, v4, v5, v6, v7);
  v12 = *a1;
  v13 = a1[1];
  v14 = a1[2];
  v15 = a1[3];
  v16 = a1[4];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v18;
  a1[10] = v19;
  a1[11] = v20;
  a1[12] = v21;
  a1[13] = v22;
  sub_23DF50FE8(v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for HTHearingTestStatus(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v9;
  v10 = a2[5];
  *(_OWORD *)(a1 + 64) = a2[4];
  *(_OWORD *)(a1 + 80) = v10;
  *(_OWORD *)(a1 + 96) = a2[6];
  sub_23DF50FE8(v3, v5, v4, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTHearingTestStatus(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for HTHearingTestStatus(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 104) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 2 * -a2;
      result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_OWORD *)(a1 + 88) = 0u;
      *(_QWORD *)(a1 + 104) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23DF51388(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) >> 63;
}

uint64_t sub_23DF51394(uint64_t result)
{
  *(_QWORD *)(result + 32) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_23DF513A4(uint64_t result, int a2)
{
  *(_QWORD *)(result + 16) &= 1uLL;
  *(_DWORD *)(result + 36) = a2 << 31;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestStatus()
{
  return &type metadata for HTHearingTestStatus;
}

uint64_t sub_23DF513CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t result;

  if ((a30 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for HTAudiometryStatus(uint64_t a1, uint64_t a2)
{
  return sub_23DF513E8(a1, a2, sub_23DF51454);
}

uint64_t sub_23DF513E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 232);
  return a3(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
           *(_QWORD *)(a1 + 152),
           *(_QWORD *)(a1 + 160),
           *(_QWORD *)(a1 + 168),
           *(_QWORD *)(a1 + 176),
           *(_QWORD *)(a1 + 184),
           *(_QWORD *)(a1 + 192),
           *(_QWORD *)(a1 + 200),
           *(_QWORD *)(a1 + 208),
           *(_QWORD *)(a1 + 216),
           *(_QWORD *)(a1 + 224),
           v4);
}

uint64_t sub_23DF51454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t result;

  if ((a30 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for HTAudiometryStatus(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_23DF51470(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_23DF513CC);
}

uint64_t sub_23DF51470(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  char v35;

  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v15 = a2[9];
  v16 = a2[10];
  v17 = a2[11];
  v18 = a2[12];
  v19 = a2[13];
  v20 = a2[14];
  v21 = a2[15];
  v22 = a2[16];
  v23 = a2[17];
  v24 = a2[18];
  v25 = a2[19];
  v26 = a2[20];
  v27 = a2[21];
  v28 = a2[22];
  v29 = a2[23];
  v30 = a2[24];
  v31 = a2[25];
  v32 = a2[26];
  v33 = a2[27];
  v34 = a2[28];
  v35 = *((_BYTE *)a2 + 232);
  v11 = a2[8];
  v13 = a2[1];
  v12 = *a2;
  a4(*a2, v13, v5, v6, v7, v8, v9, v10, v11, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35);
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v13;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v15;
  *(_QWORD *)(a1 + 80) = v16;
  *(_QWORD *)(a1 + 88) = v17;
  *(_QWORD *)(a1 + 96) = v18;
  *(_QWORD *)(a1 + 104) = v19;
  *(_QWORD *)(a1 + 112) = v20;
  *(_QWORD *)(a1 + 120) = v21;
  *(_QWORD *)(a1 + 128) = v22;
  *(_QWORD *)(a1 + 136) = v23;
  *(_QWORD *)(a1 + 144) = v24;
  *(_QWORD *)(a1 + 152) = v25;
  *(_QWORD *)(a1 + 160) = v26;
  *(_QWORD *)(a1 + 168) = v27;
  *(_QWORD *)(a1 + 176) = v28;
  *(_QWORD *)(a1 + 184) = v29;
  *(_QWORD *)(a1 + 192) = v30;
  *(_QWORD *)(a1 + 200) = v31;
  *(_QWORD *)(a1 + 208) = v32;
  *(_QWORD *)(a1 + 216) = v33;
  *(_QWORD *)(a1 + 224) = v34;
  *(_BYTE *)(a1 + 232) = v35;
  return a1;
}

uint64_t *assignWithCopy for HTAudiometryStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_23DF5165C(a1, a2, a3, (void (*)(_QWORD, uint64_t))sub_23DF513CC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))sub_23DF51454);
}

uint64_t *sub_23DF5165C(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  char v34;
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
  char v54;
  uint64_t v56;
  uint64_t v57;

  v56 = *a2;
  v57 = a2[1];
  v36 = a2[9];
  v37 = a2[10];
  v38 = a2[11];
  v39 = a2[12];
  v40 = a2[13];
  v41 = a2[14];
  v42 = a2[15];
  v6 = a2[18];
  v43 = a2[16];
  v44 = a2[17];
  v7 = a2[19];
  v45 = a2[20];
  v46 = a2[21];
  v47 = a2[22];
  v48 = a2[23];
  v49 = a2[24];
  v50 = a2[25];
  v51 = a2[26];
  v52 = a2[27];
  v53 = a2[28];
  v54 = *((_BYTE *)a2 + 232);
  v8 = a2[8];
  v9 = a2[2];
  v10 = a2[3];
  v11 = a2[4];
  v12 = a2[5];
  v13 = a2[6];
  v14 = a2[7];
  a4(*a2, v57);
  v15 = *a1;
  v16 = a1[1];
  *a1 = v56;
  v17 = a1[2];
  v18 = a1[3];
  a1[1] = v57;
  a1[2] = v9;
  v19 = a1[4];
  v20 = a1[5];
  a1[3] = v10;
  a1[4] = v11;
  v21 = a1[6];
  v22 = a1[7];
  a1[5] = v12;
  a1[6] = v13;
  v23 = *((_OWORD *)a1 + 4);
  v24 = *((_OWORD *)a1 + 5);
  a1[7] = v14;
  a1[8] = v8;
  a1[9] = v36;
  a1[10] = v37;
  a1[11] = v38;
  v25 = *((_OWORD *)a1 + 6);
  v26 = *((_OWORD *)a1 + 7);
  a1[12] = v39;
  a1[13] = v40;
  a1[14] = v41;
  a1[15] = v42;
  v27 = *((_OWORD *)a1 + 8);
  v28 = *((_OWORD *)a1 + 9);
  a1[16] = v43;
  a1[17] = v44;
  a1[18] = v6;
  v29 = *((_OWORD *)a1 + 10);
  v30 = *((_OWORD *)a1 + 11);
  a1[19] = v7;
  a1[20] = v45;
  a1[21] = v46;
  a1[22] = v47;
  a1[23] = v48;
  v31 = *((_OWORD *)a1 + 12);
  v32 = *((_OWORD *)a1 + 13);
  a1[24] = v49;
  a1[25] = v50;
  a1[26] = v51;
  a1[27] = v52;
  v33 = a1[28];
  a1[28] = v53;
  v34 = *((_BYTE *)a1 + 232);
  *((_BYTE *)a1 + 232) = v54;
  a5(v15, v16, v17, v18, v19, v20, v21, v22, v23, *((_QWORD *)&v23 + 1), v24, *((_QWORD *)&v24 + 1), v25, *((_QWORD *)&v25 + 1), v26, *((_QWORD *)&v26 + 1), v27, *((_QWORD *)&v27 + 1), v28,
    *((_QWORD *)&v28 + 1),
    v29,
    *((_QWORD *)&v29 + 1),
    v30,
    *((_QWORD *)&v30 + 1),
    v31,
    *((_QWORD *)&v31 + 1),
    v32,
    *((_QWORD *)&v32 + 1),
    v33,
    v34);
  return a1;
}

uint64_t *assignWithTake for HTAudiometryStatus(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_23DF51880(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))sub_23DF51454);
}

uint64_t *sub_23DF51880(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, char))
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v37;

  v7 = *(_QWORD *)(a2 + 224);
  v8 = *(_BYTE *)(a2 + 232);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  v16 = a1[7];
  v17 = *((_OWORD *)a1 + 4);
  v18 = *((_OWORD *)a1 + 5);
  v19 = *((_OWORD *)a1 + 6);
  v20 = *((_OWORD *)a1 + 7);
  v21 = *((_OWORD *)a1 + 8);
  v22 = *((_OWORD *)a1 + 9);
  v23 = *((_OWORD *)a1 + 10);
  v24 = *((_OWORD *)a1 + 11);
  v25 = *((_OWORD *)a1 + 12);
  v26 = *((_OWORD *)a1 + 13);
  v27 = a1[28];
  v28 = *((_BYTE *)a1 + 232);
  v29 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v29;
  v30 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  *((_OWORD *)a1 + 3) = v30;
  v31 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)a1 + 5) = v31;
  v32 = *(_OWORD *)(a2 + 112);
  *((_OWORD *)a1 + 6) = *(_OWORD *)(a2 + 96);
  *((_OWORD *)a1 + 7) = v32;
  v33 = *(_OWORD *)(a2 + 144);
  *((_OWORD *)a1 + 8) = *(_OWORD *)(a2 + 128);
  *((_OWORD *)a1 + 9) = v33;
  v34 = *(_OWORD *)(a2 + 176);
  *((_OWORD *)a1 + 10) = *(_OWORD *)(a2 + 160);
  *((_OWORD *)a1 + 11) = v34;
  v35 = *(_OWORD *)(a2 + 208);
  *((_OWORD *)a1 + 12) = *(_OWORD *)(a2 + 192);
  *((_OWORD *)a1 + 13) = v35;
  a1[28] = v7;
  *((_BYTE *)a1 + 232) = v8;
  v37 = v28;
  a4(v9, v10, v11, v12, v13, v14, v15, v16, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19, *((_QWORD *)&v19 + 1), v20, *((_QWORD *)&v20 + 1), v21, *((_QWORD *)&v21 + 1), v22,
    *((_QWORD *)&v22 + 1),
    v23,
    *((_QWORD *)&v23 + 1),
    v24,
    *((_QWORD *)&v24 + 1),
    v25,
    *((_QWORD *)&v25 + 1),
    v26,
    *((_QWORD *)&v26 + 1),
    v27,
    v37);
  return a1;
}

uint64_t _s11HearingTest26HTHearingTestSessionStatusOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 233))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 232);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s11HearingTest26HTHearingTestSessionStatusOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 232) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 233) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 233) = 0;
    if (a2)
      *(_BYTE *)(result + 232) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HTAudiometryStatus()
{
  return &type metadata for HTAudiometryStatus;
}

uint64_t sub_23DF51A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 < 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for HTAudiometryStatusV2(uint64_t a1, uint64_t a2)
{
  return sub_23DF51A64(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DF51AD0);
}

uint64_t sub_23DF51A64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a1 + 224);
  v5 = *(_OWORD *)(a1 + 240);
  return a3(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
           *(_QWORD *)(a1 + 152),
           *(_QWORD *)(a1 + 160),
           *(_QWORD *)(a1 + 168),
           *(_QWORD *)(a1 + 176),
           *(_QWORD *)(a1 + 184),
           *(_QWORD *)(a1 + 192),
           *(_QWORD *)(a1 + 200),
           *(_QWORD *)(a1 + 208),
           *(_QWORD *)(a1 + 216),
           v4,
           *((_QWORD *)&v4 + 1),
           v5,
           *((_QWORD *)&v5 + 1),
           *(_QWORD *)(a1 + 256),
           *(_QWORD *)(a1 + 264));
}

uint64_t sub_23DF51AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 < 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for HTAudiometryStatusV2(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23DF51B14(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23DF51A20);
}

_QWORD *sub_23DF51B14(_QWORD *a1, _QWORD *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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

  v5 = a2[6];
  v6 = a2[7];
  v15 = a2[9];
  v16 = a2[10];
  v17 = a2[11];
  v18 = a2[12];
  v19 = a2[13];
  v20 = a2[14];
  v21 = a2[15];
  v22 = a2[16];
  v23 = a2[17];
  v24 = a2[18];
  v25 = a2[19];
  v26 = a2[20];
  v27 = a2[21];
  v28 = a2[22];
  v29 = a2[23];
  v30 = a2[24];
  v31 = a2[25];
  v32 = a2[26];
  v33 = a2[27];
  v34 = a2[28];
  v35 = a2[29];
  v36 = a2[30];
  v37 = a2[31];
  v38 = a2[32];
  v39 = a2[33];
  v7 = a2[8];
  v9 = a2[1];
  v8 = *a2;
  v11 = a2[3];
  v10 = a2[2];
  v13 = a2[5];
  v12 = a2[4];
  a4(*a2, v9, v10, v11, v12, v13, v5, v6, v7, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39);
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  a1[4] = v12;
  a1[5] = v13;
  a1[6] = v5;
  a1[7] = v6;
  a1[8] = v7;
  a1[9] = v15;
  a1[10] = v16;
  a1[11] = v17;
  a1[12] = v18;
  a1[13] = v19;
  a1[14] = v20;
  a1[15] = v21;
  a1[16] = v22;
  a1[17] = v23;
  a1[18] = v24;
  a1[19] = v25;
  a1[20] = v26;
  a1[21] = v27;
  a1[22] = v28;
  a1[23] = v29;
  a1[24] = v30;
  a1[25] = v31;
  a1[26] = v32;
  a1[27] = v33;
  a1[28] = v34;
  a1[29] = v35;
  a1[30] = v36;
  a1[31] = v37;
  a1[32] = v38;
  a1[33] = v39;
  return a1;
}

uint64_t *assignWithCopy for HTAudiometryStatusV2(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  return sub_23DF51D48(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23DF51A20, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))sub_23DF51AD0);
}

uint64_t *sub_23DF51D48(uint64_t *a1, _QWORD *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v62 = *a2;
  v63 = a2[1];
  v60 = a2[3];
  v61 = a2[2];
  v59 = a2[4];
  v58 = a2[5];
  v38 = a2[9];
  v39 = a2[10];
  v40 = a2[11];
  v41 = a2[12];
  v42 = a2[13];
  v43 = a2[14];
  v44 = a2[15];
  v6 = a2[18];
  v45 = a2[16];
  v46 = a2[17];
  v7 = a2[19];
  v8 = a2[20];
  v9 = a2[21];
  v10 = a2[22];
  v11 = a2[23];
  v47 = a2[24];
  v48 = a2[25];
  v49 = a2[26];
  v50 = a2[27];
  v51 = a2[28];
  v52 = a2[29];
  v53 = a2[30];
  v54 = a2[31];
  v55 = a2[32];
  v56 = a2[33];
  v12 = a2[8];
  v13 = a2[6];
  v14 = a2[7];
  a4(*a2, v63, v61, v60, v59, v58);
  v15 = *a1;
  v16 = a1[1];
  *a1 = v62;
  a1[1] = v63;
  v17 = a1[2];
  v18 = a1[3];
  a1[2] = v61;
  a1[3] = v60;
  v19 = a1[4];
  v20 = a1[5];
  a1[4] = v59;
  v21 = a1[6];
  v22 = a1[7];
  a1[5] = v58;
  a1[6] = v13;
  v23 = *((_OWORD *)a1 + 4);
  v24 = *((_OWORD *)a1 + 5);
  a1[7] = v14;
  a1[8] = v12;
  a1[9] = v38;
  a1[10] = v39;
  a1[11] = v40;
  v25 = *((_OWORD *)a1 + 6);
  v26 = *((_OWORD *)a1 + 7);
  a1[12] = v41;
  a1[13] = v42;
  a1[14] = v43;
  a1[15] = v44;
  v27 = *((_OWORD *)a1 + 8);
  v28 = *((_OWORD *)a1 + 9);
  a1[16] = v45;
  a1[17] = v46;
  a1[18] = v6;
  v29 = *((_OWORD *)a1 + 10);
  v30 = *((_OWORD *)a1 + 11);
  a1[19] = v7;
  a1[20] = v8;
  a1[21] = v9;
  a1[22] = v10;
  v31 = *((_OWORD *)a1 + 12);
  v32 = *((_OWORD *)a1 + 13);
  a1[23] = v11;
  a1[24] = v47;
  a1[25] = v48;
  a1[26] = v49;
  a1[27] = v50;
  v33 = *((_OWORD *)a1 + 14);
  v34 = *((_OWORD *)a1 + 15);
  a1[28] = v51;
  a1[29] = v52;
  a1[30] = v53;
  a1[31] = v54;
  v35 = a1[32];
  v36 = a1[33];
  a1[32] = v55;
  a1[33] = v56;
  a5(v15, v16, v17, v18, v19, v20, v21, v22, v23, *((_QWORD *)&v23 + 1), v24, *((_QWORD *)&v24 + 1), v25, *((_QWORD *)&v25 + 1), v26, *((_QWORD *)&v26 + 1), v27, *((_QWORD *)&v27 + 1), v28,
    *((_QWORD *)&v28 + 1),
    v29,
    *((_QWORD *)&v29 + 1),
    v30,
    *((_QWORD *)&v30 + 1),
    v31,
    *((_QWORD *)&v31 + 1),
    v32,
    *((_QWORD *)&v32 + 1),
    v33,
    *((_QWORD *)&v33 + 1),
    v34,
    *((_QWORD *)&v34 + 1),
    v35,
    v36);
  return a1;
}

uint64_t *assignWithTake for HTAudiometryStatusV2(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  return sub_23DF51FA0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))sub_23DF51AD0);
}

uint64_t *sub_23DF51FA0(uint64_t *a1, _OWORD *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = a1[7];
  v15 = *((_OWORD *)a1 + 4);
  v16 = *((_OWORD *)a1 + 5);
  v17 = *((_OWORD *)a1 + 6);
  v18 = *((_OWORD *)a1 + 7);
  v19 = *((_OWORD *)a1 + 8);
  v20 = *((_OWORD *)a1 + 9);
  v21 = *((_OWORD *)a1 + 10);
  v22 = *((_OWORD *)a1 + 11);
  v23 = *((_OWORD *)a1 + 12);
  v24 = *((_OWORD *)a1 + 13);
  v25 = *((_OWORD *)a1 + 14);
  v26 = *((_OWORD *)a1 + 15);
  v27 = a1[32];
  v28 = a1[33];
  v29 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v29;
  v30 = a2[3];
  *((_OWORD *)a1 + 2) = a2[2];
  *((_OWORD *)a1 + 3) = v30;
  v31 = a2[5];
  *((_OWORD *)a1 + 4) = a2[4];
  *((_OWORD *)a1 + 5) = v31;
  v32 = a2[7];
  *((_OWORD *)a1 + 6) = a2[6];
  *((_OWORD *)a1 + 7) = v32;
  v33 = a2[9];
  *((_OWORD *)a1 + 8) = a2[8];
  *((_OWORD *)a1 + 9) = v33;
  v34 = a2[11];
  *((_OWORD *)a1 + 10) = a2[10];
  *((_OWORD *)a1 + 11) = v34;
  v35 = a2[13];
  *((_OWORD *)a1 + 12) = a2[12];
  *((_OWORD *)a1 + 13) = v35;
  v36 = a2[15];
  *((_OWORD *)a1 + 14) = a2[14];
  *((_OWORD *)a1 + 15) = v36;
  *((_OWORD *)a1 + 16) = a2[16];
  a4(v7, v8, v9, v10, v11, v12, v13, v14, v15, *((_QWORD *)&v15 + 1), v16, *((_QWORD *)&v16 + 1), v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19, *((_QWORD *)&v19 + 1), v20,
    *((_QWORD *)&v20 + 1),
    v21,
    *((_QWORD *)&v21 + 1),
    v22,
    *((_QWORD *)&v22 + 1),
    v23,
    *((_QWORD *)&v23 + 1),
    v24,
    *((_QWORD *)&v24 + 1),
    v25,
    *((_QWORD *)&v25 + 1),
    v26,
    *((_QWORD *)&v26 + 1),
    v27,
    v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTAudiometryStatusV2(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 272))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 3;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for HTAudiometryStatusV2(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 264) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 272) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 8 * -a2;
      result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_OWORD *)(a1 + 88) = 0u;
      *(_OWORD *)(a1 + 104) = 0u;
      *(_OWORD *)(a1 + 120) = 0u;
      *(_OWORD *)(a1 + 136) = 0u;
      *(_OWORD *)(a1 + 152) = 0u;
      *(_OWORD *)(a1 + 168) = 0u;
      *(_OWORD *)(a1 + 184) = 0u;
      *(_OWORD *)(a1 + 200) = 0u;
      *(_OWORD *)(a1 + 216) = 0u;
      *(_OWORD *)(a1 + 232) = 0u;
      *(_OWORD *)(a1 + 248) = 0u;
      *(_QWORD *)(a1 + 264) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 272) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23DF52188(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 7 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for HTAudiometryStatusV2()
{
  return &type metadata for HTAudiometryStatusV2;
}

uint64_t sub_23DF521AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23DF521B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23DF521BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23DF521C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_23DF521CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_23DF521D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_23DF521DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_23DF521E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_23DF521EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_23DF521F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t sub_23DF521FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_23DF52204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t sub_23DF5220C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t sub_23DF52214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

ValueMetadata *type metadata accessor for HTHearingTestToneResponse.CodingKeys()
{
  return &type metadata for HTHearingTestToneResponse.CodingKeys;
}

uint64_t _s11HearingTest16HTHearingChannelOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11HearingTest16HTHearingChannelOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DF52308 + 4 * byte_23DF53355[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DF5233C + 4 * byte_23DF53350[v4]))();
}

uint64_t sub_23DF5233C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF52344(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF5234CLL);
  return result;
}

uint64_t sub_23DF52358(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF52360);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DF52364(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF5236C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23DF52378(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestDeletedTone.CodingKeys()
{
  return &type metadata for HTHearingTestDeletedTone.CodingKeys;
}

uint64_t getEnumTagSinglePayload for HTHearingTestState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23DF52470 + 4 * byte_23DF5335F[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23DF524A4 + 4 * byte_23DF5335A[v4]))();
}

uint64_t sub_23DF524A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF524AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF524B4);
  return result;
}

uint64_t sub_23DF524C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF524C8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23DF524CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF524D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestState.CodingKeys()
{
  return &type metadata for HTHearingTestState.CodingKeys;
}

uint64_t getEnumTagSinglePayload for HTHearingTestTone.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HTHearingTestTone.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23DF525CC + 4 * byte_23DF53369[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23DF52600 + 4 * byte_23DF53364[v4]))();
}

uint64_t sub_23DF52600(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF52608(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DF52610);
  return result;
}

uint64_t sub_23DF5261C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DF52624);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23DF52628(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DF52630(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestTone.CodingKeys()
{
  return &type metadata for HTHearingTestTone.CodingKeys;
}

unint64_t sub_23DF52650()
{
  unint64_t result;

  result = qword_256D192E0[0];
  if (!qword_256D192E0[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF53E90, &type metadata for HTHearingTestTone.CodingKeys);
    atomic_store(result, qword_256D192E0);
  }
  return result;
}

unint64_t sub_23DF52698()
{
  unint64_t result;

  result = qword_256D194F0[0];
  if (!qword_256D194F0[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF53F48, &type metadata for HTHearingTestState.CodingKeys);
    atomic_store(result, qword_256D194F0);
  }
  return result;
}

unint64_t sub_23DF526E0()
{
  unint64_t result;

  result = qword_256D19700[0];
  if (!qword_256D19700[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF54000, &type metadata for HTHearingTestDeletedTone.CodingKeys);
    atomic_store(result, qword_256D19700);
  }
  return result;
}

unint64_t sub_23DF52728()
{
  unint64_t result;

  result = qword_256D19910[0];
  if (!qword_256D19910[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF540B8, &type metadata for HTHearingTestToneResponse.CodingKeys);
    atomic_store(result, qword_256D19910);
  }
  return result;
}

unint64_t sub_23DF52770()
{
  unint64_t result;

  result = qword_256D19A20;
  if (!qword_256D19A20)
  {
    result = MEMORY[0x242648D00](&unk_23DF54028, &type metadata for HTHearingTestToneResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D19A20);
  }
  return result;
}

unint64_t sub_23DF527B8()
{
  unint64_t result;

  result = qword_256D19A28[0];
  if (!qword_256D19A28[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF54050, &type metadata for HTHearingTestToneResponse.CodingKeys);
    atomic_store(result, qword_256D19A28);
  }
  return result;
}

unint64_t sub_23DF52800()
{
  unint64_t result;

  result = qword_256D19AB0;
  if (!qword_256D19AB0)
  {
    result = MEMORY[0x242648D00](&unk_23DF53F70, &type metadata for HTHearingTestDeletedTone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D19AB0);
  }
  return result;
}

unint64_t sub_23DF52848()
{
  unint64_t result;

  result = qword_256D19AB8[0];
  if (!qword_256D19AB8[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF53F98, &type metadata for HTHearingTestDeletedTone.CodingKeys);
    atomic_store(result, qword_256D19AB8);
  }
  return result;
}

unint64_t sub_23DF52890()
{
  unint64_t result;

  result = qword_256D19B40;
  if (!qword_256D19B40)
  {
    result = MEMORY[0x242648D00](&unk_23DF53EB8, &type metadata for HTHearingTestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D19B40);
  }
  return result;
}

unint64_t sub_23DF528D8()
{
  unint64_t result;

  result = qword_256D19B48[0];
  if (!qword_256D19B48[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF53EE0, &type metadata for HTHearingTestState.CodingKeys);
    atomic_store(result, qword_256D19B48);
  }
  return result;
}

unint64_t sub_23DF52920()
{
  unint64_t result;

  result = qword_256D19BD0;
  if (!qword_256D19BD0)
  {
    result = MEMORY[0x242648D00](&unk_23DF53E00, &type metadata for HTHearingTestTone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D19BD0);
  }
  return result;
}

unint64_t sub_23DF52968()
{
  unint64_t result;

  result = qword_256D19BD8[0];
  if (!qword_256D19BD8[0])
  {
    result = MEMORY[0x242648D00](&unk_23DF53E28, &type metadata for HTHearingTestTone.CodingKeys);
    atomic_store(result, qword_256D19BD8);
  }
  return result;
}

uint64_t sub_23DF529AC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x636E657571657266 && a2 == 0xE900000000000079;
  if (v2 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x76654C646E756F73 && a2 == 0xEA00000000006C65 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61727544656E6F74 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23DF531A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23DF52B94(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x54746E6572727563 && a2 == 0xEB00000000656E6FLL;
  if (v2 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xE900000000000073 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x54646574656C6564 && a2 == 0xEC00000073656E6FLL || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F5464656B73616DLL && a2 == 0xEB0000000073656ELL || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x800000023DF543D0 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023DF54400)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23DF531A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23DF52E60(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701736308 && a2 == 0xE400000000000000;
  if (v2 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C616E696769726FLL && a2 == 0xED00007865646E49)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23DF531A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23DF52F64(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701736308 && a2 == 0xE400000000000000;
  if (v2 || (sub_23DF531A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23DF531A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_23DF53044()
{
  unint64_t result;

  result = qword_256D18428;
  if (!qword_256D18428)
  {
    result = MEMORY[0x242648D00](&protocol conformance descriptor for HTHearingChannel, &type metadata for HTHearingChannel);
    atomic_store(result, (unint64_t *)&qword_256D18428);
  }
  return result;
}

uint64_t sub_23DF530BC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23DF530C8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DF530D4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DF530E0()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23DF530EC()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23DF530F8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23DF53104()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23DF53110()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DF5311C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DF53128()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23DF53134()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23DF53140()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23DF5314C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23DF53158()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23DF53164()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23DF53170()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23DF5317C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23DF53188()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23DF53194()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23DF531A0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DF531AC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23DF531B8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DF531C4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DF531D0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DF531DC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DF531E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DF531F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DF53200()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DF5320C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23DF53218()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23DF53224()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23DF53230()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

