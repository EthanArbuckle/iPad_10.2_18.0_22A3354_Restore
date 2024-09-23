@implementation ICSPosterConfigurationWrapper

- (PRSPosterConfiguration)configuration
{
  id v2;

  sub_1001120A0();
  return (PRSPosterConfiguration *)v2;
}

- (unint64_t)source
{
  return sub_1001120E8();
}

- (PRUISPosterTitleStyleAttributes)titleStyleAttributes
{
  id v2;

  sub_100112118();
  return (PRUISPosterTitleStyleAttributes *)v2;
}

- (void)setTitleStyleAttributes:(id)a3
{
  id v5;
  ICSPosterConfigurationWrapper *v6;

  v5 = a3;
  v6 = self;
  sub_100112188((uint64_t)a3);

}

- (ICSPosterConfigurationWrapper)initWithConfiguration:(id)a3 source:(unint64_t)a4
{
  id v6;
  ICSPosterConfigurationWrapper *result;

  v6 = a3;
  sub_10011219C(a3, a4);
  return result;
}

- (ICSPosterConfigurationWrapper)init
{
  sub_100112250();
}

- (void).cxx_destruct
{

}

@end
