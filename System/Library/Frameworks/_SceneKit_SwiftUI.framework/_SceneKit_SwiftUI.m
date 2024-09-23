uint64_t SceneView.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_SceneKit_SwiftUI::SceneView::Options __swiftcall SceneView.Options.init(rawValue:)(_SceneKit_SwiftUI::SceneView::Options rawValue)
{
  _SceneKit_SwiftUI::SceneView::Options *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SceneView.Options.allowsCameraControl.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static SceneView.Options.rendersContinuously.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static SceneView.Options.autoenablesDefaultLighting.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static SceneView.Options.jitteringEnabled.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static SceneView.Options.temporalAntialiasingEnabled.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

_QWORD *sub_222D73264@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_222D73270(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_222D73278@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_222D7328C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_222D732A0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_222D732B4(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_222D732E4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_222D73310@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_222D73334(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_222D73348(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_222D7335C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_222D73370@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_222D73384(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_222D73398(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_222D733AC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_222D733C0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_222D733D0()
{
  return sub_222D74078();
}

_QWORD *sub_222D733E8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_222D733FC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_222D7340C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_222D73418(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_222D73430@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t SceneView.init(scene:pointOfView:options:preferredFramesPerSecond:antialiasingMode:delegate:technique:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v8;

  v8 = *a3;
  *a8 = result;
  a8[1] = a2;
  a8[2] = a4;
  a8[3] = a5;
  a8[4] = a6;
  a8[5] = v8;
  a8[6] = a7;
  return result;
}

uint64_t SceneView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(void **)(v1 + 48);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  v5 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(a1 + 48) = v4;
  v6 = (void *)v5;
  v7 = v4;
  v8 = v2;
  v9 = v6;
  return swift_unknownObjectRetain();
}

unint64_t sub_222D73500()
{
  unint64_t result;

  result = qword_255775D10;
  if (!qword_255775D10)
  {
    result = MEMORY[0x22767E538](&protocol conformance descriptor for SceneView.Options, &type metadata for SceneView.Options);
    atomic_store(result, (unint64_t *)&qword_255775D10);
  }
  return result;
}

unint64_t sub_222D73548()
{
  unint64_t result;

  result = qword_255775D18;
  if (!qword_255775D18)
  {
    result = MEMORY[0x22767E538](&protocol conformance descriptor for SceneView.Options, &type metadata for SceneView.Options);
    atomic_store(result, (unint64_t *)&qword_255775D18);
  }
  return result;
}

unint64_t sub_222D73590()
{
  unint64_t result;

  result = qword_255775D20;
  if (!qword_255775D20)
  {
    result = MEMORY[0x22767E538](&protocol conformance descriptor for SceneView.Options, &type metadata for SceneView.Options);
    atomic_store(result, (unint64_t *)&qword_255775D20);
  }
  return result;
}

unint64_t sub_222D735D8()
{
  unint64_t result;

  result = qword_255775D28;
  if (!qword_255775D28)
  {
    result = MEMORY[0x22767E538](&protocol conformance descriptor for SceneView.Options, &type metadata for SceneView.Options);
    atomic_store(result, (unint64_t *)&qword_255775D28);
  }
  return result;
}

uint64_t sub_222D7361C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_222D73634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(void **)(v1 + 48);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  v5 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(a1 + 48) = v4;
  v6 = (void *)v5;
  v7 = v4;
  v8 = v2;
  v9 = v6;
  return swift_unknownObjectRetain();
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SceneView()
{
  return &type metadata for SceneView;
}

ValueMetadata *type metadata accessor for SceneView.Options()
{
  return &type metadata for SceneView.Options;
}

unint64_t sub_222D736EC()
{
  unint64_t result;

  result = qword_255776110[0];
  if (!qword_255776110[0])
  {
    result = MEMORY[0x22767E538](&unk_222D74544, &type metadata for UIKitSceneView);
    atomic_store(result, qword_255776110);
  }
  return result;
}

void type metadata accessor for SCNAntialiasingMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255775D90)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255775D90);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for UIKitSceneView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

ValueMetadata *type metadata accessor for UIKitSceneView()
{
  return &type metadata for UIKitSceneView;
}

uint64_t sub_222D737C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[7];
  void *v14;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(void **)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255775D98);
  sub_222D7403C();
  v8 = v14;
  v13[0] = v1;
  v13[1] = v2;
  v13[2] = v3;
  v13[3] = v4;
  v13[4] = v5;
  v13[5] = v6;
  v13[6] = v7;
  v9 = v7;
  v10 = v1;
  v11 = v2;
  swift_unknownObjectRetain();
  sub_222D73B54(v14, v13);

  swift_unknownObjectRelease();
  sub_222D7403C();
  return v13[0];
}

void sub_222D738A0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[7];
  void *v13;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(void **)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255775D98);
  sub_222D7403C();
  v8 = v13;
  v12[0] = v1;
  v12[1] = v2;
  v12[2] = v3;
  v12[3] = v4;
  v12[4] = v5;
  v12[5] = v6;
  v12[6] = v7;
  v9 = v7;
  v10 = v1;
  v11 = v2;
  swift_unknownObjectRetain();
  sub_222D73B54(v13, v12);

  swift_unknownObjectRelease();
}

id sub_222D7396C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE8298]), sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_222D739A8()
{
  return sub_222D73FD0();
}

uint64_t sub_222D739E8()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_222D739F4()
{
  sub_222D73AD0();
  return sub_222D74030();
}

uint64_t sub_222D73A44()
{
  sub_222D73AD0();
  return sub_222D73FDC();
}

uint64_t sub_222D73A94()
{
  return sub_222D74060();
}

void sub_222D73AAC()
{
  sub_222D73AD0();
  sub_222D74024();
  __break(1u);
}

unint64_t sub_222D73AD0()
{
  unint64_t result;

  result = qword_255776220;
  if (!qword_255776220)
  {
    result = MEMORY[0x22767E538](&unk_222D744B4, &type metadata for UIKitSceneView);
    atomic_store(result, (unint64_t *)&qword_255776220);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22767E52C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_222D73B54(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v3 = (void *)a2[1];
  v4 = a2[2];
  v5 = a2[3];
  v6 = a2[4];
  v7 = a2[5];
  v8 = a2[6];
  objc_msgSend(a1, sel_setScene_, *a2);
  objc_msgSend(a1, sel_setDelegate_, v6);
  objc_msgSend(a1, sel_setAntialiasingMode_, v5);
  objc_msgSend(a1, sel_setPreferredFramesPerSecond_, v4);
  objc_msgSend(a1, sel_setAllowsCameraControl_, v7 & 1);
  objc_msgSend(a1, sel_setRendersContinuously_, (v7 >> 1) & 1);
  objc_msgSend(a1, sel_setAutoenablesDefaultLighting_, (v7 >> 2) & 1);
  objc_msgSend(a1, sel_setJitteringEnabled_, (v7 >> 3) & 1);
  objc_msgSend(a1, sel_setTemporalAntialiasingEnabled_, (v7 >> 4) & 1);
  objc_msgSend(a1, sel_setShowsStatistics_, (v7 >> 5) & 1);
  objc_msgSend(a1, sel_setTechnique_, v8);
  if (v3)
  {
    v13 = v3;
    v9 = objc_msgSend(a1, sel_pointOfView);
    if (!v9)
      goto LABEL_4;
    v10 = v9;
    sub_222D73D14();
    v11 = v13;
    v12 = v10;
    LOBYTE(v10) = sub_222D7406C();

    if ((v10 & 1) == 0)
LABEL_4:
      objc_msgSend(a1, sel_setPointOfView_, v13);

  }
}

unint64_t sub_222D73D14()
{
  unint64_t result;

  result = qword_255775DA0;
  if (!qword_255775DA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255775DA0);
  }
  return result;
}

void _s17_SceneKit_SwiftUI9SceneViewVwxx_0(id *a1)
{

  swift_unknownObjectRelease();
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = v3;
  v8 = v4;
  swift_unknownObjectRetain();
  v9 = v6;
  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v11;
  v12 = v11;

  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_unknownObjectRelease();
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;

  return a1;
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwet_0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s17_SceneKit_SwiftUI9SceneViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneViewState()
{
  return &type metadata for SceneViewState;
}

uint64_t sub_222D73FB8()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_222D73FC4()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_222D73FD0()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_222D73FDC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_222D73FE8()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_222D73FF4()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_222D74000()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_222D7400C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_222D74018()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_222D74024()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_222D74030()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_222D7403C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_222D74048()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_222D74054()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_222D74060()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_222D7406C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_222D74078()
{
  return MEMORY[0x24BEE22B0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

