@implementation RELongPressGesture

- (void)onUILongPress:(id)a3
{
  id v4;
  _TtC19_RealityKit_SwiftUIP33_C9AE5511A982EB3959C0C8BA03AFBA3D18RELongPressGesture *v5;

  v4 = a3;
  v5 = self;
  RELongPressGesture.onUILongPress(_:)(v4);

}

- (_TtC19_RealityKit_SwiftUIP33_C9AE5511A982EB3959C0C8BA03AFBA3D18RELongPressGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  @objc RETapGesture.init(target:action:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
}

- (void).cxx_destruct
{
  @objc RETapGesture.__ivar_destroyer((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_C9AE5511A982EB3959C0C8BA03AFBA3D18RELongPressGesture_model, &OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_C9AE5511A982EB3959C0C8BA03AFBA3D18RELongPressGesture_onLongPress);
}

@end
