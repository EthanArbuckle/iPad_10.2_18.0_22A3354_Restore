@implementation EDIndexedRichLink

- (EDPersistedMessageID)messageID
{
  return (EDPersistedMessageID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___EDIndexedRichLink_messageID));
}

- (EDPersistedRichLinkID)richLinkID
{
  return (EDPersistedRichLinkID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___EDIndexedRichLink_richLinkID));
}

- (EDIndexedRichLink)initWithMessageID:(id)a3 richLinkID:(id)a4
{
  return (EDIndexedRichLink *)sub_1D30F4624((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR___EDIndexedRichLink_messageID, &OBJC_IVAR___EDIndexedRichLink_richLinkID, (objc_class **)off_1E9496EA0);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1D30F4804(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))EDIndexedRichLink.isEqual(_:));
}

- (int64_t)hash
{
  return (int64_t)sub_1D30F4890(self, (uint64_t)a2, (SEL *)&selRef_richLinkID);
}

- (EDIndexedRichLink)init
{
  EDIndexedRichLink *result;

  result = (EDIndexedRichLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
