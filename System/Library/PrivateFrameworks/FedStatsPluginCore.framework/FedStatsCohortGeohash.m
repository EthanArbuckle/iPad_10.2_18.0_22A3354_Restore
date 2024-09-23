@implementation FedStatsCohortGeohash

- (FedStatsCohortGeohash)initWithPrecision:(unint64_t)a3
{
  FedStatsCohortGeohash *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsCohortGeohash;
  result = -[FedStatsCohortGeohash init](&v5, sel_init);
  if (result)
    result->_precision = a3;
  return result;
}

+ (id)cohortInstanceWithPrecision:(unint64_t)a3
{
  NSObject *v3;
  FedStatsCohortGeohash *v4;
  unint64_t v5;

  if (a3 < 5)
  {
    v4 = [FedStatsCohortGeohash alloc];
    v5 = a3;
  }
  else
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[FedStatsCohortGeohash cohortInstanceWithPrecision:].cold.1(v3);

    v4 = [FedStatsCohortGeohash alloc];
    v5 = 4;
  }
  return -[FedStatsCohortGeohash initWithPrecision:](v4, "initWithPrecision:", v5);
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  void *v6;
  __CFString *v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("geohash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "substringToIndex:", -[FedStatsCohortGeohash precision](self, "precision"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, CFSTR("Parameter has no string value for geohash cohort key"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = CFSTR("<null>");
  }

  return v7;
}

- (unint64_t)precision
{
  return self->_precision;
}

+ (void)cohortInstanceWithPrecision:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 4;
  _os_log_debug_impl(&dword_23B425000, log, OS_LOG_TYPE_DEBUG, "Cohort precision exceeds max precision. Capping at %lu", (uint8_t *)&v1, 0xCu);
}

@end
