@implementation IMSenderContext_Impl

- (BOOL)isFromMe
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isFromMe);
}

- (BOOL)isTrustedSender
{
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isKnownSender) & 1) != 0)
    return 1;
  else
    return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMSenderContext_Impl_isFromMe);
}

- (NSString)serviceName
{
  void *v2;

  if (*(_QWORD *)&self->isKnownSender[OBJC_IVAR___IMSenderContext_Impl_serviceName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

+ (id)contextWithKnownSender:(BOOL)a3
{
  objc_class *v4;
  _BYTE *v5;
  _QWORD *v6;
  objc_super v8;

  v4 = (objc_class *)type metadata accessor for SenderContext();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = a3;
  v5[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v6 = &v5[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = v5;
  v8.super_class = v4;
  return objc_msgSendSuper2(&v8, sel_init);
}

+ (id)fromMeContext
{
  objc_class *v2;
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 1;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

+ (id)untrustedContext
{
  objc_class *v2;
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 0;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

+ (id)businessChatContext
{
  objc_class *v2;
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (objc_class *)type metadata accessor for SenderContext();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v3[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v4 = &v3[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

+ (id)contextWithKnownSender:(BOOL)a3 serviceName:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  _BYTE *v9;
  uint64_t *v10;
  objc_super v12;

  if (a4)
  {
    v5 = sub_19E36F888();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = (objc_class *)type metadata accessor for SenderContext();
  v9 = objc_allocWithZone(v8);
  v9[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = a3;
  v9[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v10 = (uint64_t *)&v9[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v10 = v5;
  v10[1] = v7;
  v12.receiver = v9;
  v12.super_class = v8;
  return objc_msgSendSuper2(&v12, sel_init);
}

+ (id)fromMeContextWithServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  _BYTE *v7;
  uint64_t *v8;
  objc_super v10;

  if (a3)
  {
    v3 = sub_19E36F888();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (objc_class *)type metadata accessor for SenderContext();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 1;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v8 = v3;
  v8[1] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

+ (id)untrustedContextWithServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  _BYTE *v7;
  uint64_t *v8;
  objc_super v10;

  if (a3)
  {
    v3 = sub_19E36F888();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (objc_class *)type metadata accessor for SenderContext();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 0;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v8 = v3;
  v8[1] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

+ (id)businessChatContextWithServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  _BYTE *v7;
  uint64_t *v8;
  objc_super v10;

  if (a3)
  {
    v3 = sub_19E36F888();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (objc_class *)type metadata accessor for SenderContext();
  v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR___IMSenderContext_Impl_isKnownSender] = 1;
  v7[OBJC_IVAR___IMSenderContext_Impl_isFromMe] = 0;
  v8 = (uint64_t *)&v7[OBJC_IVAR___IMSenderContext_Impl_serviceName];
  *v8 = v3;
  v8[1] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE502A70;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE502A70 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  IMSenderContext_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_19E32D220(v4);

}

- (IMSenderContext_Impl)initWithCoder:(id)a3
{
  id v3;
  IMSenderContext_Impl *v4;

  v3 = a3;
  v4 = (IMSenderContext_Impl *)sub_19E32D500(v3);

  return v4;
}

- (IMSenderContext_Impl)init
{
  IMSenderContext_Impl *result;

  result = (IMSenderContext_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
