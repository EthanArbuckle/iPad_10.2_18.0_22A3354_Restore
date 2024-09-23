@implementation CKAudioMessageImageUtilities

+ (id)audioMessageImageFor:(id)a3 with:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)_s7ChatKit28CKAudioMessageImageUtilitiesC05audiodE03for4withSo7UIImageCSo9IMMessageCSg_So6CGSizeVtFZ_0(a3, width, height);

  return v8;
}

- (_TtC7ChatKit28CKAudioMessageImageUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKAudioMessageImageUtilities();
  return -[CKAudioMessageImageUtilities init](&v3, sel_init);
}

@end
