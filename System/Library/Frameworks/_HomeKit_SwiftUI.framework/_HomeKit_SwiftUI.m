_HomeKit_SwiftUI::CameraView __swiftcall CameraView.init(source:)(_HomeKit_SwiftUI::CameraView source)
{
  _HomeKit_SwiftUI::CameraView *v1;

  v1->source.super.isa = source.source.super.isa;
  return source;
}

uint64_t CameraView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  void **v1;
  void *v3;
  id v4;
  uint64_t result;

  v3 = *v1;
  sub_21DED2B14();
  sub_21DED2B08();
  sub_21DED2AFC();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = v3;
  result = swift_release();
  *a1 = v4;
  return result;
}

uint64_t sub_21DED2658()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21DED2670()
{
  return sub_21DED2AF0();
}

uint64_t sub_21DED2688@<X0>(_QWORD *a1@<X8>)
{
  void **v1;
  void *v3;
  id v4;
  uint64_t result;

  v3 = *v1;
  sub_21DED2B14();
  sub_21DED2B08();
  sub_21DED2AFC();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = v3;
  result = swift_release();
  *a1 = v4;
  return result;
}

ValueMetadata *type metadata accessor for CameraView()
{
  return &type metadata for CameraView;
}

unint64_t sub_21DED2738()
{
  unint64_t result;

  result = qword_2553B2510;
  if (!qword_2553B2510)
  {
    result = MEMORY[0x2207A5D48](&unk_21DED2E30, &type metadata for CameraViewUIViewRepresentation);
    atomic_store(result, (unint64_t *)&qword_2553B2510);
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraViewUIViewRepresentation()
{
  return &type metadata for CameraViewUIViewRepresentation;
}

id sub_21DED2790()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;

  v1 = *v0;
  sub_21DED2B14();
  sub_21DED2B08();
  sub_21DED2AFC();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD75B0]), sel_init);
  objc_msgSend(v2, sel_setCameraSource_, v1);
  swift_release();
  return v2;
}

uint64_t sub_21DED2844(void *a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  sub_21DED2B14();
  sub_21DED2B08();
  sub_21DED2AFC();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(a1, sel_setCameraSource_, v3);
  return swift_release();
}

uint64_t sub_21DED28F4()
{
  return sub_21DED2A60();
}

uint64_t sub_21DED2934()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_21DED2940()
{
  sub_21DED2A04();
  return sub_21DED2AC0();
}

uint64_t sub_21DED2990()
{
  sub_21DED2A04();
  return sub_21DED2A6C();
}

void sub_21DED29E0()
{
  sub_21DED2A04();
  sub_21DED2AB4();
  __break(1u);
}

unint64_t sub_21DED2A04()
{
  unint64_t result;

  result = qword_2553B2518;
  if (!qword_2553B2518)
  {
    result = MEMORY[0x2207A5D48](&unk_21DED2DA0, &type metadata for CameraViewUIViewRepresentation);
    atomic_store(result, (unint64_t *)&qword_2553B2518);
  }
  return result;
}

uint64_t sub_21DED2A48()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_21DED2A54()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_21DED2A60()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_21DED2A6C()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_21DED2A78()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_21DED2A84()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_21DED2A90()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_21DED2A9C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_21DED2AA8()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_21DED2AB4()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_21DED2AC0()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_21DED2ACC()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_21DED2AD8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21DED2AE4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21DED2AF0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21DED2AFC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21DED2B08()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21DED2B14()
{
  return MEMORY[0x24BEE6928]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

