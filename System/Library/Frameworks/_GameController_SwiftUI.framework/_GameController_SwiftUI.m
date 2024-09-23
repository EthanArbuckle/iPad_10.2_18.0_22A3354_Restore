uint64_t View.handlesGameControllerEvents(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x23B7CE3BC](&v4, a2, &unk_2506AC348, a3);
}

uint64_t sub_235581148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier();
  return MEMORY[0x23B7CE428](MEMORY[0x24BDF55B8], v2, v4);
}

unint64_t lazy protocol witness table accessor for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier;
  if (!lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier)
  {
    result = MEMORY[0x23B7CE428](&protocol conformance descriptor for GameControllerEventInteractionModifier, &unk_2506AC348);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GameControllerEventInteractionModifier and conformance GameControllerEventInteractionModifier);
  }
  return result;
}

void *type metadata accessor for GameControllerEventInteractionModifier()
{
  return &unk_2506AC348;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in GameControllerEventInteractionModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance GameControllerEventInteractionModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t protocol witness for ViewModifier.body(content:) in conformance GameControllerEventInteractionModifier()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<GameControllerEventInteractionModifier>);
  lazy protocol witness table accessor for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>();
  lazy protocol witness table accessor for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable();
  return View.interactionRepresentable<A>(_:)();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CE410]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>;
  if (!lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<GameControllerEventInteractionModifier>);
    result = MEMORY[0x23B7CE428](MEMORY[0x24BDF55C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CE41C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable;
  if (!lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable)
  {
    result = MEMORY[0x23B7CE428](&protocol conformance descriptor for GCEventInteractionRepresentable, &unk_2506AC370);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable);
  }
  return result;
}

void *type metadata accessor for GCEventInteractionRepresentable()
{
  return &unk_2506AC370;
}

void type metadata accessor for GCUIEventTypes()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for GCUIEventTypes)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for GCUIEventTypes);
  }
}

uint64_t sub_235581410()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ViewModifier_Content<GameControllerEventInteractionModifier>);
  lazy protocol witness table accessor for type _ViewModifier_Content<GameControllerEventInteractionModifier> and conformance _ViewModifier_Content<A>();
  lazy protocol witness table accessor for type GCEventInteractionRepresentable and conformance GCEventInteractionRepresentable();
  return swift_getOpaqueTypeConformance2();
}

id protocol witness for _UIInteractionRepresentable.makeUIInteraction() in conformance GCEventInteractionRepresentable()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)&off_256249BB8), sel_init);
  objc_msgSend(v2, sel_setHandledEventTypes_, v1);
  return v2;
}

id protocol witness for _UIInteractionRepresentable.updateUIInteraction(_:) in conformance GCEventInteractionRepresentable(void *a1)
{
  _QWORD *v1;

  return objc_msgSend(a1, sel_setHandledEventTypes_, *v1);
}

void protocol witness for SetAlgebra.init() in conformance GCUIEventTypes(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance GCUIEventTypes(_QWORD *a1, uint64_t *a2)
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

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance GCUIEventTypes@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance GCUIEventTypes(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance GCUIEventTypes(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance GCUIEventTypes(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance GCUIEventTypes(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance GCUIEventTypes(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance GCUIEventTypes(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance GCUIEventTypes()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance GCUIEventTypes()
{
  return SetAlgebra.init<A>(_:)();
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance GCUIEventTypes(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GCUIEventTypes(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance GCUIEventTypes@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance GCUIEventTypes@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GCUIEventTypes(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t base witness table accessor for Equatable in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes, (uint64_t)&protocol conformance descriptor for GCUIEventTypes);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes, (uint64_t)&protocol conformance descriptor for GCUIEventTypes);
}

uint64_t base witness table accessor for RawRepresentable in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes, (uint64_t)&protocol conformance descriptor for GCUIEventTypes);
}

uint64_t base witness table accessor for SetAlgebra in GCUIEventTypes()
{
  return lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes((unint64_t *)&lazy protocol witness table cache variable for type GCUIEventTypes and conformance GCUIEventTypes, (uint64_t)&protocol conformance descriptor for GCUIEventTypes);
}

uint64_t lazy protocol witness table accessor for type GCUIEventTypes and conformance GCUIEventTypes(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for GCUIEventTypes();
    result = MEMORY[0x23B7CE428](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return MEMORY[0x24BDF5590]();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return MEMORY[0x24BDF5598]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x24BDF55A0]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x24BDF55A8]();
}

uint64_t View.interactionRepresentable<A>(_:)()
{
  return MEMORY[0x24BDF3220]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x24BDF55D0]();
}

uint64_t SetAlgebra.init<A>(_:)()
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

