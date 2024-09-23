@implementation SiriReferenceResolutionDonation

- (_TtC14AnnounceDaemon31SiriReferenceResolutionDonation)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC14AnnounceDaemon31SiriReferenceResolutionDonation *v7;
  id v8;
  objc_class *v9;
  objc_super v11;

  v3 = sub_1D23F27A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = (id)ANLogWithCategory();
  sub_1D23F27B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger, v6, v3);

  v9 = (objc_class *)type metadata accessor for SiriReferenceResolutionDonation();
  v11.receiver = v7;
  v11.super_class = v9;
  return -[SiriReferenceResolutionDonation init](&v11, sel_init);
}

- (void)makePlaybackDonationWithAnnouncementID:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC14AnnounceDaemon31SiriReferenceResolutionDonation *v7;

  v4 = sub_1D23F2864();
  v6 = v5;
  v7 = self;
  sub_1D23ED4C0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC14AnnounceDaemon31SiriReferenceResolutionDonation_logger;
  v3 = sub_1D23F27A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
