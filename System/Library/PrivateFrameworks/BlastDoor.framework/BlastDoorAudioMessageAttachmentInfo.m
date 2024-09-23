@implementation BlastDoorAudioMessageAttachmentInfo

- (NSString)description
{
  uint64_t v2;
  void *v3;
  __int128 v5;

  v2 = *(_QWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 8];
  v5 = *(_OWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  swift_retain();
  sub_1AD003E48(v2, v5);
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)inlineAttachmentKey
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                    + 8];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (NSString)audioTranscription
{
  return (NSString *)sub_1AD4CFC9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo);
}

- (BlastDoorAudioMessageAttachmentInfo)init
{
  BlastDoorAudioMessageAttachmentInfo *result;

  result = (BlastDoorAudioMessageAttachmentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 8];
  v3 = *(_QWORD *)&self->audioMessageAttachmentInfo[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo
                                                  + 16];
  swift_release();
  sub_1AD003F24(v2, v3);
  swift_bridgeObjectRelease();
}

@end
