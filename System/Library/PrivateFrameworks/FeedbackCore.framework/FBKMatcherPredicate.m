@implementation FBKMatcherPredicate

- (FBKMatcherPredicate)initWithFileMatcher:(id)a3 filePredicate:(id)a4
{
  id v7;
  id v8;
  FBKMatcherPredicate *v9;
  FBKMatcherPredicate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKMatcherPredicate;
  v9 = -[FBKMatcherPredicate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileMatcher, a3);
    objc_storeStrong((id *)&v10->_filePredicate, a4);
  }

  return v10;
}

- (FBKFilePredicate)filePredicate
{
  return self->_filePredicate;
}

- (void)setFilePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filePredicate, a3);
}

- (FBKFileMatcher)fileMatcher
{
  return self->_fileMatcher;
}

- (void)setFileMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_fileMatcher, a3);
}

- (BOOL)isAdditional
{
  return self->_isAdditional;
}

- (void)setIsAdditional:(BOOL)a3
{
  self->_isAdditional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMatcher, 0);
  objc_storeStrong((id *)&self->_filePredicate, 0);
}

- (NSString)localizedWhenItWillGather
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  -[FBKMatcherPredicate filePredicate](self, "filePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enhancedLoggingDuration");

  if (v4)
  {
    +[FBKMatcherPredicate shortDateFormatter](FBKMatcherPredicate, "shortDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKMatcherPredicate filePredicate](self, "filePredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromTimeInterval:", (double)objc_msgSend(v6, "enhancedLoggingDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GATHER_IN"), CFSTR("In %@"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_24E15EAF8;
  }
  return (NSString *)v10;
}

- (NSString)localizedDataCollectedSummary
{
  return (NSString *)sub_21DA63AF8(self, (uint64_t)a2, (SEL *)&selRef_localizedDataCollectedSummary);
}

- (NSString)localizedDataCollectedExplanation
{
  return (NSString *)sub_21DA63AF8(self, (uint64_t)a2, (SEL *)&selRef_localizedDataCollectedExplanation);
}

- (BOOL)hasCachedLocalizedDataFromExtension
{
  FBKMatcherPredicate *v2;
  NSString *v3;
  FBKMatcherPredicate *v4;
  BOOL v5;

  v2 = self;
  v3 = -[FBKMatcherPredicate localizedDataCollectedSummary](v2, sel_localizedDataCollectedSummary);
  if (v3)
  {

    v4 = -[FBKMatcherPredicate localizedDataCollectedExplanation](v2, sel_localizedDataCollectedExplanation);
    if (!v4)
      return 0;
    v5 = 1;
    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresRemote
{
  return sub_21DA63D48(self, (uint64_t)a2, (SEL *)&selRef_requiresRemote);
}

- (BOOL)isConfiguredWithDEBundleIdentifier
{
  FBKMatcherPredicate *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v2 = self;
  v3 = -[FBKMatcherPredicate deBundleIdentifier](v2, sel_deBundleIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_21DAC481C();
    v7 = v6;

    swift_bridgeObjectRelease();
    v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0)
      v8 = v5 & 0xFFFFFFFFFFFFLL;
    return v8 != 0;
  }
  else
  {

    return 0;
  }
}

- (BOOL)hasRegularExpression
{
  FBKMatcherPredicate *v2;
  BOOL v3;

  v2 = self;
  v3 = FBKMatcherPredicate.hasRegularExpression.getter();

  return v3;
}

- (NSString)deBundleIdentifier
{
  return (NSString *)sub_21DA63AF8(self, (uint64_t)a2, (SEL *)&selRef_deBundleIdentifier);
}

- (NSString)name
{
  return (NSString *)sub_21DA63AF8(self, (uint64_t)a2, (SEL *)&selRef_name);
}

- (NSString)platform
{
  FBKMatcherPredicate *v2;
  FBKFileMatcher *v3;
  id v4;
  NSString *result;
  void *v6;

  v2 = self;
  v3 = -[FBKMatcherPredicate fileMatcher](v2, sel_fileMatcher);
  v4 = -[FBKFileMatcher platform](v3, sel_platform);

  if (v4)
  {
    sub_21DAC481C();

    v6 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)shouldAutoGather
{
  return sub_21DA63D48(self, (uint64_t)a2, (SEL *)&selRef_alwaysRequired);
}

- (NSString)description
{
  return (NSString *)sub_21DA64AC4(self, (uint64_t)a2, FBKMatcherPredicate.description.getter);
}

- (NSString)shortDescription
{
  return (NSString *)sub_21DA64AC4(self, (uint64_t)a2, (void (*)(void))FBKMatcherPredicate.shortDescription.getter);
}

- (BOOL)collectsSameDiagnosticsAsOtherMatcher:(id)a3
{
  objc_class *v4;
  FBKMatcherPredicate *v5;
  FBKMatcherPredicate v7;

  v4 = (objc_class *)a3;
  v5 = self;
  v7.super.isa = v4;
  LOBYTE(self) = FBKMatcherPredicate.collectsSameDiagnosticsAs(otherMatcher:)(v7);

  return self & 1;
}

+ (NSDateComponentsFormatter)shortestDateFormatter
{
  return (NSDateComponentsFormatter *)sub_21DA64884((uint64_t)a1, (uint64_t)a2, &qword_255398CB8, (id *)&qword_255399828);
}

+ (NSDateComponentsFormatter)shortDateFormatter
{
  return (NSDateComponentsFormatter *)sub_21DA64884((uint64_t)a1, (uint64_t)a2, &qword_255398CC0, (id *)&qword_255399830);
}

- (BOOL)isEqual:(id)a3
{
  FBKMatcherPredicate *v4;
  FBKMatcherPredicate *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21DAC4BB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = FBKMatcherPredicate.isEqual(_:)((uint64_t)v8);

  sub_21DA37AB4((uint64_t)v8);
  return v6 & 1;
}

- (NSString)hashingKey
{
  return (NSString *)sub_21DA64AC4(self, (uint64_t)a2, FBKMatcherPredicate.hashingKey.getter);
}

- (int64_t)hash
{
  FBKMatcherPredicate *v2;
  FBKFileMatcher *v3;
  unsigned int v4;
  FBKFilePredicate *v5;
  unsigned int v6;

  v2 = self;
  v3 = -[FBKMatcherPredicate fileMatcher](v2, sel_fileMatcher);
  v4 = -[FBKFileMatcher hash](v3, sel_hash);

  v5 = -[FBKMatcherPredicate filePredicate](v2, sel_filePredicate);
  v6 = -[FBKFilePredicate hash](v5, sel_hash);

  LODWORD(v5) = -[FBKMatcherPredicate isAdditional](v2, sel_isAdditional);
  return v6 & v4 & v5;
}

@end
