@implementation BlastDoorBasicTextMessageMessageTypeWrapper

- (NSString)description
{
  void *v2;
  _OWORD v4[10];
  _OWORD v5[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v5);
  sub_1AD141274(v5, v4);
  sub_1AD1414D0((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1AD1412AC);
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)type
{
  unint64_t v2;
  _OWORD v4[10];
  _OWORD v5[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v4);
  sub_1AD141274(v4, v5);
  v2 = sub_1AD144444((uint64_t)v5);
  nullsub_1(v5);
  return v2;
}

- (BlastDoorBasicTypingIndicator)typingIndicator
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v9;
  _OWORD v10[10];
  _OWORD v11[10];
  _OWORD v12[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v11);
  sub_1AD141274(v11, v12);
  if (sub_1AD144444((uint64_t)v12))
    return (BlastDoorBasicTypingIndicator *)0;
  v3 = nullsub_1(v12);
  v4 = *(_BYTE *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = (objc_class *)type metadata accessor for _ObjCBasicTypingIndicatorWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorBasicTypingIndicator_basicTypingIndicator];
  *v8 = v4;
  *((_QWORD *)v8 + 1) = v5;
  sub_1AD141274(v11, v10);
  nullsub_1(v10);
  v9.receiver = v7;
  v9.super_class = v6;
  swift_bridgeObjectRetain();
  return (BlastDoorBasicTypingIndicator *)-[BlastDoorBasicTextMessageMessageTypeWrapper init](&v9, sel_init);
}

- (BlastDoorBasicMessage)textMessage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  BlastDoorBasicTextMessageMessageTypeWrapper *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _OWORD v18[10];
  _OWORD v19[10];
  _OWORD v20[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v19);
  sub_1AD141274(v19, v20);
  if (sub_1AD144444((uint64_t)v20) == 1)
  {
    v2 = nullsub_1(v20);
    v3 = *(_QWORD *)(v2 + 16);
    v4 = *(_QWORD *)(v2 + 24);
    v15 = *(_OWORD *)v2;
    v16 = *(_OWORD *)(v2 + 48);
    v5 = *(_QWORD *)(v2 + 64);
    v6 = *(_QWORD *)(v2 + 88);
    v7 = (objc_class *)type metadata accessor for _ObjCBasicMessageWrapper();
    v13 = *(_OWORD *)(v2 + 32);
    v14 = *(_OWORD *)(v2 + 72);
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorBasicMessage_basicMessage];
    *(_OWORD *)v9 = v15;
    *((_QWORD *)v9 + 2) = v3;
    *((_QWORD *)v9 + 3) = v4;
    *((_OWORD *)v9 + 2) = v13;
    *((_OWORD *)v9 + 3) = v16;
    *((_QWORD *)v9 + 8) = v5;
    *(_OWORD *)(v9 + 72) = v14;
    *((_QWORD *)v9 + 11) = v6;
    sub_1AD141274(v19, v18);
    v10 = *(_QWORD *)(nullsub_1(v18) + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1AD0E2EC4(v10);
    v17.receiver = v8;
    v17.super_class = v7;
    swift_retain();
    swift_bridgeObjectRetain();
    v11 = -[BlastDoorBasicTextMessageMessageTypeWrapper init](&v17, sel_init);
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorBasicMessage *)v11;
}

- (BlastDoorBasicTapBack)tapback
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BlastDoorBasicTextMessageMessageTypeWrapper *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _OWORD v23[10];
  _OWORD v24[10];
  _OWORD v25[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v24);
  sub_1AD141274(v24, v25);
  if (sub_1AD144444((uint64_t)v25) == 2)
  {
    v2 = nullsub_1(v25);
    v3 = *(_BYTE *)v2;
    v18 = *(_OWORD *)(v2 + 24);
    v19 = *(_OWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 40);
    v5 = *(_QWORD *)(v2 + 48);
    v20 = *(_OWORD *)(v2 + 88);
    v21 = *(_OWORD *)(v2 + 72);
    v6 = *(_QWORD *)(v2 + 104);
    v7 = *(_QWORD *)(v2 + 112);
    v8 = (objc_class *)type metadata accessor for _ObjCBasicTapBackWrapper();
    v17 = *(_OWORD *)(v2 + 56);
    v9 = (char *)objc_allocWithZone(v8);
    v10 = &v9[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack];
    *v10 = v3;
    *(_OWORD *)(v10 + 8) = v19;
    *(_OWORD *)(v10 + 24) = v18;
    *((_QWORD *)v10 + 5) = v4;
    *((_QWORD *)v10 + 6) = v5;
    *(_OWORD *)(v10 + 56) = v17;
    *(_OWORD *)(v10 + 72) = v21;
    *(_OWORD *)(v10 + 88) = v20;
    *((_QWORD *)v10 + 13) = v6;
    *((_QWORD *)v10 + 14) = v7;
    sub_1AD141274(v24, v23);
    v11 = (_QWORD *)nullsub_1(v23);
    v12 = v11[10];
    v13 = v11[11];
    v14 = v11[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1AD14145C(v12, v13, v14);
    v22.receiver = v9;
    v22.super_class = v8;
    swift_bridgeObjectRetain();
    v15 = -[BlastDoorBasicTextMessageMessageTypeWrapper init](&v22, sel_init);
  }
  else
  {
    v15 = 0;
  }
  return (BlastDoorBasicTapBack *)v15;
}

- (BlastDoorBasicAudioMessage)audioMessage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  uint64_t *v9;
  BlastDoorBasicTextMessageMessageTypeWrapper *v10;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _OWORD v15[10];
  _OWORD v16[10];
  _OWORD v17[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v16);
  sub_1AD141274(v16, v17);
  if (sub_1AD144444((uint64_t)v17) == 3)
  {
    v2 = nullsub_1(v17);
    v13 = *(_OWORD *)v2;
    v3 = *(_QWORD *)(v2 + 16);
    v4 = *(_QWORD *)(v2 + 40);
    v5 = *(_QWORD *)(v2 + 48);
    v6 = (objc_class *)type metadata accessor for _ObjCBasicAudioMessageWrapper();
    v12 = *(_OWORD *)(v2 + 24);
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorBasicAudioMessage_basicAudioMessage];
    *(_OWORD *)v8 = v13;
    *((_QWORD *)v8 + 2) = v3;
    *(_OWORD *)(v8 + 24) = v12;
    *((_QWORD *)v8 + 5) = v4;
    *((_QWORD *)v8 + 6) = v5;
    sub_1AD141274(v16, v15);
    v9 = (uint64_t *)nullsub_1(v15);
    sub_1AD00C45C(*v9);
    v14.receiver = v7;
    v14.super_class = v6;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = -[BlastDoorBasicTextMessageMessageTypeWrapper init](&v14, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorBasicAudioMessage *)v10;
}

- (BlastDoorUnsupportedMessage)unsupported
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  char *v6;
  BlastDoorBasicTextMessageMessageTypeWrapper *v7;
  __int128 v9;
  objc_super v10;
  _OWORD v11[10];
  _OWORD v12[10];
  _OWORD v13[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v12);
  sub_1AD141274(v12, v13);
  if (sub_1AD144444((uint64_t)v13) == 4)
  {
    v2 = nullsub_1(v13);
    v3 = *(_QWORD *)(v2 + 16);
    v4 = (objc_class *)type metadata accessor for _ObjCUnsupportedMessageWrapper();
    v9 = *(_OWORD *)v2;
    v5 = (char *)objc_allocWithZone(v4);
    v6 = &v5[OBJC_IVAR___BlastDoorUnsupportedMessage_unsupportedMessage];
    *(_OWORD *)v6 = v9;
    *((_QWORD *)v6 + 2) = v3;
    sub_1AD141274(v12, v11);
    nullsub_1(v11);
    v10.receiver = v5;
    v10.super_class = v4;
    swift_retain();
    swift_bridgeObjectRetain();
    v7 = -[BlastDoorBasicTextMessageMessageTypeWrapper init](&v10, sel_init);
  }
  else
  {
    v7 = 0;
  }
  return (BlastDoorUnsupportedMessage *)v7;
}

- (BlastDoorBasicEmojiTapback)emojiTapback
{
  uint64_t v2;
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
  _QWORD *v13;
  BlastDoorBasicTextMessageMessageTypeWrapper *v14;
  objc_super v16;
  _OWORD v17[10];
  _OWORD v18[10];
  _OWORD v19[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v18);
  sub_1AD141274(v18, v19);
  if (sub_1AD144444((uint64_t)v19) == 5)
  {
    v2 = nullsub_1(v19);
    v3 = (objc_class *)type metadata accessor for _ObjCBasicEmojiTapbackWrapper();
    v4 = (char *)objc_allocWithZone(v3);
    v5 = &v4[OBJC_IVAR___BlastDoorBasicEmojiTapback_basicEmojiTapback];
    v6 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)v5 = *(_OWORD *)v2;
    *((_OWORD *)v5 + 1) = v6;
    v7 = *(_OWORD *)(v2 + 80);
    v9 = *(_OWORD *)(v2 + 32);
    v8 = *(_OWORD *)(v2 + 48);
    *((_OWORD *)v5 + 4) = *(_OWORD *)(v2 + 64);
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    v11 = *(_OWORD *)(v2 + 112);
    v10 = *(_OWORD *)(v2 + 128);
    v12 = *(_OWORD *)(v2 + 96);
    *((_QWORD *)v5 + 18) = *(_QWORD *)(v2 + 144);
    *((_OWORD *)v5 + 7) = v11;
    *((_OWORD *)v5 + 8) = v10;
    *((_OWORD *)v5 + 6) = v12;
    sub_1AD141274(v18, v17);
    v13 = (_QWORD *)nullsub_1(v17);
    sub_1AD284434(v13);
    v16.receiver = v4;
    v16.super_class = v3;
    v14 = -[BlastDoorBasicTextMessageMessageTypeWrapper init](&v16, sel_init);
  }
  else
  {
    v14 = 0;
  }
  return (BlastDoorBasicEmojiTapback *)v14;
}

- (BlastDoorBasicTextMessageMessageTypeWrapper)init
{
  BlastDoorBasicTextMessageMessageTypeWrapper *result;

  result = (BlastDoorBasicTextMessageMessageTypeWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _OWORD v2[10];

  sub_1AD141274((BlastDoorBasicTextMessageMessageTypeWrapper *)((char *)self+ OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType), v2);
  sub_1AD1414D0((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1AD14153C);
}

@end
