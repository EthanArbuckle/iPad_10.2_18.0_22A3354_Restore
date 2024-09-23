@implementation BlastDoorSMSCTPartContentWrapper

- (NSString)description
{
  return (NSString *)sub_1AD4D7F48((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content, (void (*)(void))sub_1AD00C410);
}

- (unint64_t)type
{
  return self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24];
}

- (BlastDoorSMSCTPartPlain)plain
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v9;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24])
    return (BlastDoorSMSCTPartPlain *)0;
  v5 = *v2;
  v4 = v2[1];
  v6 = (objc_class *)type metadata accessor for _ObjCSMSCTPartPlainWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorSMSCTPartPlain_sMSCTPartPlain];
  *(_QWORD *)v8 = v5;
  *((_QWORD *)v8 + 1) = v4;
  v9.receiver = v7;
  v9.super_class = v6;
  swift_bridgeObjectRetain();
  return (BlastDoorSMSCTPartPlain *)-[BlastDoorSMSCTPartContentWrapper init](&v9, sel_init);
}

- (BlastDoorSMSCTPartSMIL)smil
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t *v9;
  BlastDoorSMSCTPartContentWrapper *v10;
  objc_super v12;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24] == 1)
  {
    v4 = v2[2];
    v3 = v2[3];
    v6 = *v2;
    v5 = v2[1];
    v7 = (objc_class *)type metadata accessor for _ObjCSMSCTPartSMILWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = (uint64_t *)&v8[OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL];
    *v9 = v6;
    v9[1] = v5;
    v9[2] = v4;
    v9[3] = v3;
    sub_1AD00C45C(v6);
    v12.receiver = v8;
    v12.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = -[BlastDoorSMSCTPartContentWrapper init](&v12, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorSMSCTPartSMIL *)v10;
}

- (BlastDoorSMSCTPartAttachment)attachment
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  uint64_t *v7;
  BlastDoorSMSCTPartContentWrapper *v8;
  objc_super v10;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24] == 2)
  {
    v4 = *v2;
    v3 = v2[1];
    v5 = (objc_class *)type metadata accessor for _ObjCSMSCTPartAttachmentWrapper();
    v6 = (char *)objc_allocWithZone(v5);
    v7 = (uint64_t *)&v6[OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment];
    *v7 = v4;
    v7[1] = v3;
    sub_1AD00408C(v4, v3);
    v10.receiver = v6;
    v10.super_class = v5;
    v8 = -[BlastDoorSMSCTPartContentWrapper init](&v10, sel_init);
  }
  else
  {
    v8 = 0;
  }
  return (BlastDoorSMSCTPartAttachment *)v8;
}

- (BlastDoorSMSCTPartContentWrapper)init
{
  BlastDoorSMSCTPartContentWrapper *result;

  result = (BlastDoorSMSCTPartContentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4D83D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AD00C4C8);
}

@end
