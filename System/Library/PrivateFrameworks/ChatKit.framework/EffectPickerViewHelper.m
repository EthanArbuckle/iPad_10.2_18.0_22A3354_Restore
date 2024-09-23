@implementation EffectPickerViewHelper

+ (id)viewControllerWithHandler:(id)a3 effectPickerExtensionDetails:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a4;
  v8 = (void *)sub_18E625B68((uint64_t)sub_18E625DA8, v6, v7);

  swift_release();
  return v8;
}

- (_TtC7ChatKit22EffectPickerViewHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffectPickerViewHelper();
  return -[EffectPickerViewHelper init](&v3, sel_init);
}

@end
