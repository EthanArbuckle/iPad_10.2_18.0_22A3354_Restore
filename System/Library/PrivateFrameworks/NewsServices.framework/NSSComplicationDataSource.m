@implementation NSSComplicationDataSource

+ (id)nss_newsComplicationTemplateForFamily:(int64_t)a3 compact:(BOOL)a4
{
  return +[NNCComplicationDataSource staticTemplateForFamily:compact:](NNCComplicationDataSource, "staticTemplateForFamily:compact:", a3, a4);
}

@end
