@implementation _GDSEmissionForecast

- (_GDSEmissionForecast)initWithForecast:(id)a3 generatedAt:(id)a4 fetchedAt:(id)a5 refetchInterval:(double)a6
{
  id v11;
  id v12;
  id v13;
  _GDSEmissionForecast *v14;
  _GDSEmissionForecast *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_GDSEmissionForecast;
  v14 = -[_GDSEmissionForecast init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_generationDate, a4);
    objc_storeStrong((id *)&v15->_fetchDate, a5);
    objc_storeStrong((id *)&v15->_forecastMap, a3);
    v15->_refetchInterval = a6;
  }

  return v15;
}

- (NSDate)generationDate
{
  return self->_generationDate;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (double)refetchInterval
{
  return self->_refetchInterval;
}

- (NSDictionary)forecastMap
{
  return self->_forecastMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastMap, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_generationDate, 0);
}

@end
