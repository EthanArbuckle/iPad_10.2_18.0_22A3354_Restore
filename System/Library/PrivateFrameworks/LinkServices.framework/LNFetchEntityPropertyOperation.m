@implementation LNFetchEntityPropertyOperation

- (void)start
{
  _TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation *v2;

  v2 = self;
  sub_1A192D740();

}

- (void)finishWithError:(id)a3
{
  _TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1A192D984((uint64_t)a3);

}

- (_TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 priority:(int64_t)a5 queue:(id)a6 activity:(id)a7
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
  sub_1A192DA88();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation_entity));
  sub_1A19166A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12LinkServicesP33_F4DA9E9995B703C6955B9953648C268F30LNFetchEntityPropertyOperation_completionHandler));
}

@end
