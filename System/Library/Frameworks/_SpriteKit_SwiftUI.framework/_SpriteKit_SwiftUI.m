uint64_t SpriteView.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance SpriteView.Options()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance SpriteView.Options@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t SpriteView.DebugOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_SpriteKit_SwiftUI::SpriteView::DebugOptions __swiftcall SpriteView.DebugOptions.init(rawValue:)(_SpriteKit_SwiftUI::SpriteView::DebugOptions rawValue)
{
  _SpriteKit_SwiftUI::SpriteView::DebugOptions *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SpriteView.DebugOptions.showsFPS.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static SpriteView.DebugOptions.showsDrawCount.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static SpriteView.DebugOptions.showsNodeCount.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static SpriteView.DebugOptions.showsQuadCount.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static SpriteView.DebugOptions.showsPhysics.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static SpriteView.DebugOptions.showsFields.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance SpriteView.DebugOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance SpriteView.DebugOptions(_QWORD *a1, uint64_t *a2)
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

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance SpriteView.Options@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance SpriteView.Options@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance SpriteView.DebugOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance SpriteView.DebugOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance SpriteView.DebugOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance SpriteView.DebugOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance SpriteView.DebugOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance SpriteView.DebugOptions(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance SpriteView.DebugOptions()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance SpriteView.DebugOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance SpriteView.DebugOptions@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SpriteView.DebugOptions(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SpriteView.DebugOptions(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = 4;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)(a5 + 48) = closure #1 in SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:);
  *(_QWORD *)(a5 + 56) = 0;
  return result;
}

uint64_t closure #1 in SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:)()
{
  return 1;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:options:shouldRender:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;

  v8 = *a5;
  *(_QWORD *)a8 = result;
  *(_QWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 16) = a3;
  *(_QWORD *)(a8 + 24) = a4;
  *(_QWORD *)(a8 + 32) = v8;
  *(_QWORD *)(a8 + 40) = 0;
  *(_QWORD *)(a8 + 48) = a6;
  *(_QWORD *)(a8 + 56) = a7;
  return result;
}

uint64_t SpriteView.init(scene:transition:isPaused:preferredFramesPerSecond:options:debugOptions:shouldRender:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;

  v9 = *a5;
  v10 = *a6;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = v9;
  *(_QWORD *)(a9 + 40) = v10;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  return result;
}

__n128 SpriteView.body.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  __n128 result;
  __n128 v16;
  objc_super v17;

  v3 = *(void **)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  v16 = *(__n128 *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = (objc_class *)type metadata accessor for SpriteKitViewDelegate();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback];
  *(_QWORD *)v11 = v7;
  *((_QWORD *)v11 + 1) = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  v12 = v3;
  v13 = v4;
  swift_retain();
  v14 = objc_msgSendSuper2(&v17, sel_init);
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  result = v16;
  *(__n128 *)(a1 + 24) = v16;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v14;
  return result;
}

uint64_t type metadata accessor for SpriteKitViewDelegate()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type SpriteView.Options and conformance SpriteView.Options()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.Options, &type metadata for SpriteView.Options);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.Options, &type metadata for SpriteView.Options);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.Options, &type metadata for SpriteView.Options);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options;
  if (!lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.Options, &type metadata for SpriteView.Options);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.Options and conformance SpriteView.Options);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.DebugOptions, &type metadata for SpriteView.DebugOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.DebugOptions, &type metadata for SpriteView.DebugOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.DebugOptions, &type metadata for SpriteView.DebugOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions;
  if (!lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for SpriteView.DebugOptions, &type metadata for SpriteView.DebugOptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpriteView.DebugOptions and conformance SpriteView.DebugOptions);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in SpriteView()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 protocol witness for View.body.getter in conformance SpriteView@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  __n128 result;
  __n128 v16;
  objc_super v17;

  v3 = *(void **)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  v16 = *(__n128 *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = (objc_class *)type metadata accessor for SpriteKitViewDelegate();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback];
  *(_QWORD *)v11 = v7;
  *((_QWORD *)v11 + 1) = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  v12 = v3;
  v13 = v4;
  swift_retain();
  v14 = objc_msgSendSuper2(&v17, sel_init);
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  result = v16;
  *(__n128 *)(a1 + 24) = v16;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v14;
  return result;
}

uint64_t destroy for SpriteView(id *a1)
{

  return swift_release();
}

uint64_t initializeWithCopy for SpriteView(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = v6;
  v7 = v3;
  v8 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SpriteView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SpriteView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpriteView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SpriteView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpriteView()
{
  return &type metadata for SpriteView;
}

ValueMetadata *type metadata accessor for SpriteView.Options()
{
  return &type metadata for SpriteView.Options;
}

ValueMetadata *type metadata accessor for SpriteView.DebugOptions()
{
  return &type metadata for SpriteView.DebugOptions;
}

id SpriteKitViewDelegate.__deallocating_deinit()
{
  return SpriteKitViewDelegate.__deallocating_deinit((uint64_t (*)(_QWORD))type metadata accessor for SpriteKitViewDelegate);
}

id SKView.assignState(state:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  uint64_t v17;
  void *v18;

  v2 = v1;
  v4 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = objc_msgSend(v1, sel_scene);
  if (!v10)
    goto LABEL_3;
  v11 = v10;
  type metadata accessor for SKScene();
  v17 = v6;
  v18 = v4;
  v12 = v4;
  v13 = v11;
  LOBYTE(v11) = static NSObject.== infix(_:_:)();

  v4 = v18;
  if ((v11 & 1) == 0)
  {
LABEL_3:
    objc_msgSend(v2, sel_frame, v17);
    if (v15 != 0.0 || v14 != 0.0)
    {
      if (v3)
        objc_msgSend(v2, sel_presentScene_transition_, v4, v3);
      else
        objc_msgSend(v2, sel_presentScene_, v4);
    }
  }
  objc_msgSend(v2, sel_setDelegate_, v9, v17);
  objc_msgSend(v2, sel_setAllowsTransparency_, v6 & 1);
  objc_msgSend(v2, sel_setIgnoresSiblingOrder_, (v6 >> 1) & 1);
  objc_msgSend(v2, sel_setShouldCullNonVisibleNodes_, (v6 >> 2) & 1);
  objc_msgSend(v2, sel_setPreferredFramesPerSecond_, v7);
  objc_msgSend(v2, sel_setPaused_, v5);
  objc_msgSend(v2, sel_setShowsFPS_, v8 & 1);
  objc_msgSend(v2, sel_setShowsDrawCount_, (v8 >> 1) & 1);
  objc_msgSend(v2, sel_setShowsNodeCount_, (v8 >> 2) & 1);
  objc_msgSend(v2, sel_setShowsQuadCount_, (v8 >> 3) & 1);
  objc_msgSend(v2, sel_setShowsPhysics_, (v8 >> 4) & 1);
  return objc_msgSend(v2, sel_setShowsFields_, (v8 >> 5) & 1);
}

id SpriteKitViewCoordinator.__deallocating_deinit()
{
  return SpriteKitViewDelegate.__deallocating_deinit((uint64_t (*)(_QWORD))type metadata accessor for SpriteKitViewCoordinator);
}

id SpriteKitViewDelegate.__deallocating_deinit(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SpriteKitViewCoordinator()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView;
  if (!lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for UIKitSpriteKitView, &unk_24F18E170);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView;
  if (!lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView)
  {
    result = MEMORY[0x22E2BECBC](&protocol conformance descriptor for UIKitSpriteKitView, &unk_24F18E170);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UIKitSpriteKitView and conformance UIKitSpriteKitView);
  }
  return result;
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

void *type metadata accessor for SpriteKitViewState()
{
  return &unk_24F18E0D8;
}

uint64_t initializeBufferWithCopyOfBuffer for UIKitSpriteKitView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UIKitSpriteKitView(id *a1)
{

  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = v3;
  v7 = v4;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for SpriteKitViewState(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpriteKitViewState(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SpriteKitViewState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for UIKitSpriteKitView()
{
  return &unk_24F18E170;
}

char *UIKitSpriteKitView.makeUIView(context:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  char *v16;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIViewRepresentableContext<UIKitSpriteKitView>);
  UIViewRepresentableContext.coordinator.getter();
  v8 = &v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  v14 = *(void **)&v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState
                     + 8];
  v15 = *(void **)&v16[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  *(_QWORD *)v8 = v1;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v3;
  *((_QWORD *)v8 + 3) = v4;
  *((_QWORD *)v8 + 4) = v5;
  *((_QWORD *)v8 + 5) = v7;
  *((_QWORD *)v8 + 6) = v6;
  swift_unknownObjectRetain_n();
  v9 = v1;
  v10 = v2;
  v11 = v9;
  v12 = v10;
  outlined consume of SpriteKitViewState?(v15, v14);
  swift_unknownObjectRelease();

  UIViewRepresentableContext.coordinator.getter();
  return v16;
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance UIKitSpriteKitView()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char *v15;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = *(unsigned __int8 *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIViewRepresentableContext<UIKitSpriteKitView>);
  UIViewRepresentableContext.coordinator.getter();
  v8 = &v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  v9 = *(void **)&v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState
                    + 8];
  v14 = *(void **)&v15[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  *(_QWORD *)v8 = v1;
  *((_QWORD *)v8 + 1) = v2;
  *((_QWORD *)v8 + 2) = v3;
  *((_QWORD *)v8 + 3) = v4;
  *((_QWORD *)v8 + 4) = v5;
  *((_QWORD *)v8 + 5) = v7;
  *((_QWORD *)v8 + 6) = v6;
  swift_unknownObjectRetain_n();
  v10 = v1;
  v11 = v2;
  v12 = v10;
  v13 = v11;
  outlined consume of SpriteKitViewState?(v14, v9);
  swift_unknownObjectRelease();

}

id protocol witness for UIViewRepresentable.makeCoordinator() in conformance UIKitSpriteKitView@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SpriteKitViewCoordinator()), sel_init);
  *a1 = result;
  return result;
}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance UIKitSpriteKitView()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t associated type witness table accessor for View.Body : View in UIKitSpriteKitView()
{
  return MEMORY[0x24BDF5560];
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance UIKitSpriteKitView()
{
  lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView();
  return static UIViewRepresentable._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance UIKitSpriteKitView()
{
  lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView();
  return static UIViewRepresentable._makeViewList(view:inputs:)();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance UIKitSpriteKitView()
{
  return static View._viewListCount(inputs:)();
}

void protocol witness for View.body.getter in conformance UIKitSpriteKitView()
{
  lazy protocol witness table accessor for type UIKitSpriteKitView and conformance UIKitSpriteKitView();
  UIViewRepresentable.body.getter();
  __break(1u);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2BECB0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void *outlined consume of SpriteKitViewState?(void *result, void *a2)
{
  if (result)
  {

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

unint64_t type metadata accessor for SKScene()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SKScene;
  if (!lazy cache variable for type metadata for SKScene)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SKScene);
  }
  return result;
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t static UIViewRepresentable._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t static UIViewRepresentable._makeView(view:inputs:)()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

