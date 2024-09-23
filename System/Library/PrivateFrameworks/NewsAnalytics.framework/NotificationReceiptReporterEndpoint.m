@implementation NotificationReceiptReporterEndpoint

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D5AAE7FC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  return (NSURL *)(id)sub_1D5AAD644();
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)0;
}

- (id)endpointURLWithContentType:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;

  sub_1D57B1F4C(0, (unint64_t *)&qword_1ED9C6F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - v6;
  if ((unint64_t)a3 > 7)
  {
    v13 = sub_1D5AAD668();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
    v12 = 0;
  }
  else
  {
    if (a3 == 5)
      v8 = OBJC_IVAR____TtC13NewsAnalyticsP33_73410A717757B42F2A6F1BC37191285735NotificationReceiptReporterEndpoint_notificationReceiptURL;
    else
      v8 = OBJC_IVAR____TtC13NewsAnalyticsP33_73410A717757B42F2A6F1BC37191285735NotificationReceiptReporterEndpoint_defaultURL;
    v9 = (char *)self + v8;
    v10 = sub_1D5AAD668();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
    {
      v12 = (void *)sub_1D5AAD644();
      sub_1D5AAD668();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v7, v10);
    }
  }
  return v12;
}

@end
