@implementation EDIndexedMessage

- (EDPersistedMessageID)messageID
{
  return (EDPersistedMessageID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___EDIndexedMessage_messageID));
}

- (BOOL)hasBodyData
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_hasBodyData);
}

- (EDIndexedMessage)initWithMessageID:(id)a3 hasBodyData:(BOOL)a4
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_messageID) = (Class)a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_hasBodyData) = a4;
  v6.receiver = self;
  v6.super_class = (Class)EDIndexedMessage;
  v4 = a3;
  return -[EDIndexedMessage init](&v6, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1D30F4804(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))EDIndexedMessage.isEqual(_:));
}

- (int64_t)hash
{
  return (int64_t)sub_1D30F4890(self, (uint64_t)a2, (SEL *)&selRef_messageID);
}

- (EDIndexedMessage)init
{
  EDIndexedMessage *result;

  result = (EDIndexedMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
