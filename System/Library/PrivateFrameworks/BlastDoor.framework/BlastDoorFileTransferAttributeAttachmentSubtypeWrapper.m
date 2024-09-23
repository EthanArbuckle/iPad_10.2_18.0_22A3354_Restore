@implementation BlastDoorFileTransferAttributeAttachmentSubtypeWrapper

- (NSString)description
{
  void *v2;
  uint64_t v4;
  _BYTE v5[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v5);
  sub_1AD29ADF4(v5, &v4);
  sub_1AD29AE30((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1AD29AEB4);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  unint64_t v2;
  _BYTE v4[280];
  _BYTE v5[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v4);
  sub_1AD29ADF4(v4, v5);
  v2 = sub_1AD2A0AE4((uint64_t)v5);
  sub_1AD2A0BBC((uint64_t)v5);
  return v2;
}

- (BlastDoorGeneralAttachmentInfo)unspecified
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v9;
  _BYTE v10[280];
  _BYTE v11[280];
  _BYTE v12[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v11);
  sub_1AD29ADF4(v11, v12);
  if (sub_1AD2A0AE4((uint64_t)v12))
    return (BlastDoorGeneralAttachmentInfo *)0;
  v3 = (uint64_t *)sub_1AD2A0BBC((uint64_t)v12);
  v4 = *v3;
  v5 = v3[1];
  v6 = (objc_class *)type metadata accessor for _ObjCGeneralAttachmentInfoWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorGeneralAttachmentInfo_generalAttachmentInfo];
  *(_QWORD *)v8 = v4;
  *((_QWORD *)v8 + 1) = v5;
  sub_1AD29ADF4(v11, v10);
  sub_1AD2A0BBC((uint64_t)v10);
  v9.receiver = v7;
  v9.super_class = v6;
  swift_bridgeObjectRetain();
  return (BlastDoorGeneralAttachmentInfo *)-[BlastDoorFileTransferAttributeAttachmentSubtypeWrapper init](&v9, sel_init);
}

- (BlastDoorEmojiImageAttachmentInfo)emojiImage
{
  _OWORD *v2;
  objc_class *v3;
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD *v16;
  BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *v17;
  objc_super v19;
  _BYTE v20[280];
  _BYTE v21[280];
  _BYTE v22[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v21);
  sub_1AD29ADF4(v21, v22);
  if (sub_1AD2A0AE4((uint64_t)v22) == 1)
  {
    v2 = (_OWORD *)sub_1AD2A0BBC((uint64_t)v22);
    v3 = (objc_class *)type metadata accessor for _ObjCEmojiImageAttachmentInfoWrapper();
    v4 = (char *)objc_allocWithZone(v3);
    v5 = &v4[OBJC_IVAR___BlastDoorEmojiImageAttachmentInfo_emojiImageAttachmentInfo];
    v6 = v2[1];
    *(_OWORD *)v5 = *v2;
    *((_OWORD *)v5 + 1) = v6;
    v7 = v2[5];
    v9 = v2[2];
    v8 = v2[3];
    *((_OWORD *)v5 + 4) = v2[4];
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    v10 = v2[9];
    v12 = v2[6];
    v11 = v2[7];
    *((_OWORD *)v5 + 8) = v2[8];
    *((_OWORD *)v5 + 9) = v10;
    *((_OWORD *)v5 + 6) = v12;
    *((_OWORD *)v5 + 7) = v11;
    v13 = v2[13];
    v15 = v2[10];
    v14 = v2[11];
    *((_OWORD *)v5 + 12) = v2[12];
    *((_OWORD *)v5 + 13) = v13;
    *((_OWORD *)v5 + 10) = v15;
    *((_OWORD *)v5 + 11) = v14;
    sub_1AD29ADF4(v21, v20);
    v16 = (_QWORD *)sub_1AD2A0BBC((uint64_t)v20);
    sub_1AD2828CC(v16);
    v19.receiver = v4;
    v19.super_class = v3;
    v17 = -[BlastDoorFileTransferAttributeAttachmentSubtypeWrapper init](&v19, sel_init);
  }
  else
  {
    v17 = 0;
  }
  return (BlastDoorEmojiImageAttachmentInfo *)v17;
}

- (BlastDoorStickerAttachmentInfo)sticker
{
  const void *v2;
  objc_class *v3;
  char *v4;
  _QWORD *v5;
  BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *v6;
  objc_super v8;
  _BYTE v9[280];
  _BYTE v10[280];
  _BYTE v11[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v10);
  sub_1AD29ADF4(v10, v11);
  if (sub_1AD2A0AE4((uint64_t)v11) == 2)
  {
    v2 = (const void *)sub_1AD2A0BBC((uint64_t)v11);
    v3 = (objc_class *)type metadata accessor for _ObjCStickerAttachmentInfoWrapper();
    v4 = (char *)objc_allocWithZone(v3);
    memcpy(&v4[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo], v2, 0x111uLL);
    sub_1AD29ADF4(v10, v9);
    v5 = (_QWORD *)sub_1AD2A0BBC((uint64_t)v9);
    sub_1AD282B4C(v5);
    v8.receiver = v4;
    v8.super_class = v3;
    v6 = -[BlastDoorFileTransferAttributeAttachmentSubtypeWrapper init](&v8, sel_init);
  }
  else
  {
    v6 = 0;
  }
  return (BlastDoorStickerAttachmentInfo *)v6;
}

- (BlastDoorLivePhotoAttachmentInfo)livePhoto
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *v8;
  __int128 v10;
  objc_super v11;
  _BYTE v12[280];
  _BYTE v13[280];
  _BYTE v14[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v13);
  sub_1AD29ADF4(v13, v14);
  if (sub_1AD2A0AE4((uint64_t)v14) == 3)
  {
    v2 = sub_1AD2A0BBC((uint64_t)v14);
    v3 = *(_QWORD *)(v2 + 16);
    v4 = *(_QWORD *)(v2 + 24);
    v5 = (objc_class *)type metadata accessor for _ObjCLivePhotoAttachmentInfoWrapper();
    v10 = *(_OWORD *)v2;
    v6 = (char *)objc_allocWithZone(v5);
    v7 = &v6[OBJC_IVAR___BlastDoorLivePhotoAttachmentInfo_livePhotoAttachmentInfo];
    *(_OWORD *)v7 = v10;
    *((_QWORD *)v7 + 2) = v3;
    *((_QWORD *)v7 + 3) = v4;
    sub_1AD29ADF4(v13, v12);
    sub_1AD2A0BBC((uint64_t)v12);
    v11.receiver = v6;
    v11.super_class = v5;
    swift_retain();
    swift_bridgeObjectRetain();
    v8 = -[BlastDoorFileTransferAttributeAttachmentSubtypeWrapper init](&v11, sel_init);
  }
  else
  {
    v8 = 0;
  }
  return (BlastDoorLivePhotoAttachmentInfo *)v8;
}

- (BlastDoorAudioMessageAttachmentInfo)audioMessage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *v11;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[280];
  _BYTE v17[280];
  _BYTE v18[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v17);
  sub_1AD29ADF4(v17, v18);
  if (sub_1AD2A0AE4((uint64_t)v18) == 4)
  {
    v2 = sub_1AD2A0BBC((uint64_t)v18);
    v14 = *(_OWORD *)(v2 + 16);
    v3 = *(_QWORD *)(v2 + 32);
    v4 = *(_QWORD *)(v2 + 40);
    v5 = (objc_class *)type metadata accessor for _ObjCAudioMessageAttachmentInfoWrapper();
    v13 = *(_OWORD *)v2;
    v6 = (char *)objc_allocWithZone(v5);
    v7 = &v6[OBJC_IVAR___BlastDoorAudioMessageAttachmentInfo_audioMessageAttachmentInfo];
    *(_OWORD *)v7 = v13;
    *((_OWORD *)v7 + 1) = v14;
    *((_QWORD *)v7 + 4) = v3;
    *((_QWORD *)v7 + 5) = v4;
    sub_1AD29ADF4(v17, v16);
    v8 = sub_1AD2A0BBC((uint64_t)v16);
    v9 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 24);
    swift_retain();
    sub_1AD003E48(v9, v10);
    v15.receiver = v6;
    v15.super_class = v5;
    swift_bridgeObjectRetain();
    v11 = -[BlastDoorFileTransferAttributeAttachmentSubtypeWrapper init](&v15, sel_init);
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorAudioMessageAttachmentInfo *)v11;
}

- (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper)init
{
  BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *result;

  result = (BlastDoorFileTransferAttributeAttachmentSubtypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v2[280];

  sub_1AD29ADF4((char *)self+ OBJC_IVAR___BlastDoorFileTransferAttributeAttachmentSubtypeWrapper_fileTransferAttribute_AttachmentSubtype, v2);
  sub_1AD29AE30((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1AD282E20);
}

@end
