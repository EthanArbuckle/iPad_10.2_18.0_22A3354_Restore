@implementation MOResource(MOWeather)

- (id)metaData
{
  void *v2;
  void *v3;

  -[MOResource data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
