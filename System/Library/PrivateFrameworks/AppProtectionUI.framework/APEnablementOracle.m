@implementation APEnablementOracle

+ (id)sharedInstance
{
  if (qword_2542A6480 != -1)
    swift_once();
  return (id)qword_2542A6600;
}

- (BOOL)canEnablementAction:(unint64_t)a3 bePerformedForFeature:(unint64_t)a4 ofSubject:(id)a5
{
  id v8;
  APEnablementOracle *v9;

  v8 = a5;
  v9 = self;
  LOBYTE(a4) = sub_2362FEF18(a3, a4, v8);

  return a4 & 1;
}

- (BOOL)getPreferredEnablementAction:(unint64_t *)a3 preferredEnableableFeature:(unint64_t *)a4 forSubject:(id)a5 error:(id *)a6
{
  id v9;
  APEnablementOracle *v10;

  v9 = a5;
  v10 = self;
  sub_2362FF118((uint64_t *)a3, a4, v9);

  return 1;
}

- (APEnablementOracle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APEnablementOracle;
  return -[APEnablementOracle init](&v3, sel_init);
}

@end
