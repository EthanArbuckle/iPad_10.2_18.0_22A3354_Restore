@implementation MUTransitLineItemActionManager

- (MUTransitLineItemActionManager)initWithDelegate:(id)a3 analyticsDelegate:(id)a4
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MUTransitLineItemActionManager init](&v7, sel_init);
}

- (MUTransitLineItemActionManager)init
{
  MUTransitLineItemActionManager *result;

  result = (MUTransitLineItemActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR___MUTransitLineItemActionManager_delegate);
  sub_191DBE818((uint64_t)self + OBJC_IVAR___MUTransitLineItemActionManager_analyticsDelegate);
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  void *v3;

  if (_s6MapsUI28TransitLineItemActionManagerC19createFooterActionsSaySo011MKPlaceCardfE0CGSgyF_0())
  {
    sub_191E30474();
    v3 = (void *)sub_191EEB038();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  void (*v8)(uint64_t);
  id v9;
  MUTransitLineItemActionManager *v10;

  v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (a4)
    a4 = (id)sub_191EEAF48();
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = (void (*)(uint64_t))sub_191E304D4;
  }
  v9 = a3;
  v10 = self;
  TransitLineItemActionManager.performAction(_:options:completion:)(a3, (uint64_t)a4, v8);
  sub_191DCB644((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (id)createFooterActions
{
  void *v2;

  if (_s6MapsUI28TransitLineItemActionManagerC19createFooterActionsSaySo011MKPlaceCardfE0CGSgyF_0())
  {
    sub_191E30474();
    v2 = (void *)sub_191EEB038();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
