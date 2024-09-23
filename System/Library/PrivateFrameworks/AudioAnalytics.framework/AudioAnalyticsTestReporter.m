@implementation AudioAnalyticsTestReporter

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithNewReporterID
{
  _TtC14AudioAnalytics26AudioAnalyticsTestReporter *v2;
  objc_super v4;

  v2 = -[AudioAnalyticsTestReporter initWithNewReporterID](self, sel_initWithNewReporterID);
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  -[AudioAnalyticsReporter setServiceType:](&v4, sel_setServiceType_, 11);
  return v2;
}

- (unsigned)serviceType
{
  return 11;
}

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithReporterID:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return -[AudioAnalyticsReporter initWithReporterID:](&v5, sel_initWithReporterID_, a3);
}

- (_TtC14AudioAnalytics26AudioAnalyticsTestReporter)initWithSessionID:(unsigned int)a3 serviceType:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return -[AudioAnalyticsReporter initWithSessionID:serviceType:](&v7, sel_initWithSessionID_serviceType_, v5, v4);
}

@end
