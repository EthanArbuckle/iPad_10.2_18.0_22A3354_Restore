@implementation FBKAppListResolver

- (FBKAppListResolver)initWithServerSideChoices:(id)a3
{
  id v4;
  FBKAppListResolver *v5;
  NSArray *v6;
  NSArray *prefetchedChoices;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKAppListResolver;
  v5 = -[FBKAppListResolver init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (NSArray *)v4;
    else
      v6 = (NSArray *)MEMORY[0x24BDBD1A8];
    prefetchedChoices = v5->_prefetchedChoices;
    v5->_prefetchedChoices = v6;

  }
  return v5;
}

- (NSArray)prefetchedChoices
{
  return self->_prefetchedChoices;
}

- (void)setPrefetchedChoices:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchedChoices, a3);
}

- (BOOL)didFetch
{
  return self->_didFetch;
}

- (void)setDidFetch:(BOOL)a3
{
  self->_didFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedChoices, 0);
}

+ (id)displayValueForChoiceValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_21DAC481C();
  _sSo18FBKAppListResolverC12FeedbackCoreE12displayValue09forChoiceG0S2S_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)prefetchChoices
{
  FBKAppListResolver *v2;

  v2 = self;
  FBKAppListResolver.prefetchChoices()();

}

- (id)choices
{
  FBKAppListResolver *v2;
  void *v3;

  v2 = self;
  FBKAppListResolver.choices()();

  sub_21DA3BF58(0, (unint64_t *)&qword_255399D00);
  v3 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v3;
}

@end
