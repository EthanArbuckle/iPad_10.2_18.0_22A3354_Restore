@implementation LNFetchEntityURLOperation

- (void)start
{
  _TtC12LinkServicesP33_9053401123055129EA61198701A274AF25LNFetchEntityURLOperation *v2;

  v2 = self;
  sub_1A194061C();

}

- (void)finishWithError:(id)a3
{
  _TtC12LinkServicesP33_9053401123055129EA61198701A274AF25LNFetchEntityURLOperation *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1A1940828((uint64_t)a3);

}

- (_TtC12LinkServicesP33_9053401123055129EA61198701A274AF25LNFetchEntityURLOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
{
  uint64_t v9;
  void *v10;
  id v11;

  v9 = sub_1A19B2A5C();
  MEMORY[0x1E0C80A78](v9);
  v10 = _Block_copy(a7);
  sub_1A19B2A44();
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  swift_unknownObjectRetain();
  v11 = a6;
  sub_1A1940988();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12LinkServicesP33_9053401123055129EA61198701A274AF25LNFetchEntityURLOperation_entity));
  sub_1A19166A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12LinkServicesP33_9053401123055129EA61198701A274AF25LNFetchEntityURLOperation_completionHandler));
}

@end
