@implementation NSUserActivity(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  INUserActivitySerializeToData(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a5;
  v7 = a3;
  objc_msgSend(v7, "decodeObjectOfClass:from:", objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    INUserActivityDeserializeFromData(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
