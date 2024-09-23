@implementation DynamicEndpoint

- (id)endpointURLWithContentType:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1D57CC7FC();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  DynamicEndpoint.endpointURL(contentType:)(a3, (uint64_t)v6);
  swift_release();
  v7 = sub_1D5AAD668();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1D5AAD644();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return v9;
}

- (NSString)name
{
  void *v2;

  DynamicEndpoint.name.getter();
  v2 = (void *)sub_1D5AAE7FC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1D5AAD668();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)self->appConfigurationManager;
  swift_retain();
  v8 = objc_msgSend(objc_msgSend(v7, sel_appConfiguration), sel_appAnalyticsEndpointUrlForEnvironment_, *(_QWORD *)self->environment);
  swift_unknownObjectRelease();
  sub_1D5AAD650();
  swift_release();

  v9 = (void *)sub_1D5AAD644();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v9;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)0;
}

@end
