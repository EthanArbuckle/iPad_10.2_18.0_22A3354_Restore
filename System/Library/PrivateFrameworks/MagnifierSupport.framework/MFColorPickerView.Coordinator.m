@implementation MFColorPickerView.Coordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7;
  id v8;
  _TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator *v9;

  v7 = a4;
  v8 = a3;
  v9 = self;
  MEMORY[0x2276B1CEC](v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D7640);
  sub_22758DDD0();

}

- (void)colorPickerViewControllerDidFinish:(void *)a3
{
  id v4;
  _BYTE *v5;

  v4 = a3;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D7648);
  sub_22758DDD0();
  v5[OBJC_IVAR____TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator_didPresent] = 0;

}

- (_TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator)init
{
  _TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator *result;

  result = (_TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
