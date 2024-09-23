@implementation ImagePicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  _TtCV7MusicUI11ImagePicker11Coordinator *v7;

  type metadata accessor for InfoKey(0);
  sub_21CDBFDBC(&qword_25532F1B0, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_21D7C8294);
  sub_21D7C4FC8();
  v6 = a3;
  v7 = self;
  sub_21D044BA8(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtCV7MusicUI11ImagePicker11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_21D045164();

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v6;
  _TtCV7MusicUI11ImagePicker11Coordinator *v7;

  sub_21D7BF754();
  sub_21D7C5310();
  v6 = a3;
  v7 = self;
  sub_21D045C2C();

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  _TtCV7MusicUI11ImagePicker11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_21D046074();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtCV7MusicUI11ImagePicker11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_21D046164();

}

- (_TtCV7MusicUI11ImagePicker11Coordinator)init
{
  sub_21D046218();
}

- (void).cxx_destruct
{
  sub_21D0476A0((uint64_t)self + OBJC_IVAR____TtCV7MusicUI11ImagePicker11Coordinator_imagePicker);
  sub_21CDBD660(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7MusicUI11ImagePicker11Coordinator_pickHandler));
  swift_bridgeObjectRelease();
}

@end
