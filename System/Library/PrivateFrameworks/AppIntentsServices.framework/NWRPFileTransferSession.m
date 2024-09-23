@implementation NWRPFileTransferSession

- (_TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession)init
{
  sub_236153BB0();
}

- (void).cxx_destruct
{
  sub_23612C9D8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_receivedFileHandler));
  sub_23612C9D8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_completionHandler));
  sub_23612D664(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_peerPublicKey), *(_QWORD *)&self->receivedFileHandler[OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_peerPublicKey]);
  sub_23612D664(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_selfPublicKey), *(_QWORD *)&self->receivedFileHandler[OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_selfPublicKey]);
  swift_bridgeObjectRelease();
  sub_2361552CC((uint64_t)self+ OBJC_IVAR____TtC18AppIntentsServicesP33_5CADB32F94CECB2B8CC02D8CA1B76C2223NWRPFileTransferSession_temporaryDirectoryURL);
}

@end
