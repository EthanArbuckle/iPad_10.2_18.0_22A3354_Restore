@implementation SNResultsCollector

- (NSArray)results
{
  return (NSArray *)sub_1D43A1B00((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SNResultsCollector_results, &qword_1EFE4C690);
}

- (void)setResults:(id)a3
{
  sub_1D43A1BA8(self, (uint64_t)a2, (uint64_t)a3, &qword_1EFE4C690, &OBJC_IVAR___SNResultsCollector_results);
}

- (NSArray)errors
{
  return (NSArray *)sub_1D43A1B00((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SNResultsCollector_errors, &qword_1EFE49BB0);
}

- (void)setErrors:(id)a3
{
  sub_1D43A1BA8(self, (uint64_t)a2, (uint64_t)a3, &qword_1EFE49BB0, &OBJC_IVAR___SNResultsCollector_errors);
}

- (int64_t)completeCount
{
  return sub_1D43A1C78();
}

- (void)setCompleteCount:(int64_t)a3
{
  sub_1D43A1CAC(a3);
}

- (SNResultsCollector)init
{
  return (SNResultsCollector *)sub_1D43A1CBC();
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = sub_1D451A6EC();
  v5 = v4;
  swift_getObjCClassMetadata();
  v6 = static SNResultsCollector.automaticallyNotifiesObservers(forKey:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  SNResultsCollector *v5;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  SNResultsCollector.request(_:didProduce:)();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  SNResultsCollector *v6;
  id v7;

  swift_unknownObjectRetain();
  v7 = a4;
  v6 = self;
  SNResultsCollector.request(_:didFailWithError:)((uint64_t)v6, v7);
  swift_unknownObjectRelease();

}

- (void)requestDidComplete:(id)a3
{
  SNResultsCollector *v4;

  swift_unknownObjectRetain();
  v4 = self;
  SNResultsCollector.requestDidComplete(_:)();
  swift_unknownObjectRelease();

}

- (void)clearResults
{
  SNResultsCollector *v2;

  v2 = self;
  sub_1D43A21D4();

}

- (void)clearErrors
{
  SNResultsCollector *v2;

  v2 = self;
  sub_1D43A2270();

}

- (void)clearCompleteCount
{
  SNResultsCollector *v2;

  v2 = self;
  sub_1D43A230C();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
