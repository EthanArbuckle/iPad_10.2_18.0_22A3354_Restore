@implementation CalDAVConcreteServerVersion

+ (id)prototypes
{
  if (prototypes_onceToken != -1)
    dispatch_once(&prototypes_onceToken, &__block_literal_global_4);
  return (id)_calDAVServerVersionPrototypes;
}

void __41__CalDAVConcreteServerVersion_prototypes__block_invoke()
{
  CalDAVConcreteServerVersion *v0;
  void *v1;
  CalendarServerVersion *v2;
  void *v3;
  GoogleCalDAVServerVersion *v4;
  void *v5;
  YahooCalDAVServerVersion *v6;
  void *v7;
  MobileMeCalDAVServerVersion *v8;
  void *v9;
  iCloudCalDAVServerVersion *v10;
  void *v11;
  OracleBeehiveCalDAVServerVersion *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v0 = objc_alloc_init(CalDAVConcreteServerVersion);
  v1 = (void *)_unknownServerVersionPrototype;
  _unknownServerVersionPrototype = (uint64_t)v0;

  v2 = objc_alloc_init(CalendarServerVersion);
  v3 = (void *)_calendarServerVersionPrototype;
  _calendarServerVersionPrototype = (uint64_t)v2;

  v4 = objc_alloc_init(GoogleCalDAVServerVersion);
  v5 = (void *)_googleServerVersionPrototype;
  _googleServerVersionPrototype = (uint64_t)v4;

  v6 = objc_alloc_init(YahooCalDAVServerVersion);
  v7 = (void *)_yahooServerVersionPrototype;
  _yahooServerVersionPrototype = (uint64_t)v6;

  v8 = objc_alloc_init(MobileMeCalDAVServerVersion);
  v9 = (void *)_mmeServerVersionPrototype;
  _mmeServerVersionPrototype = (uint64_t)v8;

  v10 = objc_alloc_init(iCloudCalDAVServerVersion);
  v11 = (void *)_icloudServerVersionPrototype;
  _icloudServerVersionPrototype = (uint64_t)v10;

  v12 = objc_alloc_init(OracleBeehiveCalDAVServerVersion);
  v13 = (void *)_oracleBeehiveServerVersionPrototype;
  _oracleBeehiveServerVersionPrototype = (uint64_t)v12;

  v14 = objc_alloc(MEMORY[0x24BDBCE30]);
  v15 = objc_msgSend(v14, "initWithObjects:", _calendarServerVersionPrototype, _googleServerVersionPrototype, _yahooServerVersionPrototype, _mmeServerVersionPrototype, _icloudServerVersionPrototype, _oracleBeehiveServerVersionPrototype, _unknownServerVersionPrototype, 0);
  v16 = (void *)_calDAVServerVersionPrototypes;
  _calDAVServerVersionPrototypes = v15;

}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  objc_storeStrong((id *)&self->_regularExpression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

@end
