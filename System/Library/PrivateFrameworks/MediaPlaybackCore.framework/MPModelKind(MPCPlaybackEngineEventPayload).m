@implementation MPModelKind(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  NSString *v4;
  Class v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("modelClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);

  if (v5)
  {
    objc_msgSend(a1, "kindWithModelClass:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)mpc_jsonValue
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("modelClass");
  NSStringFromClass((Class)objc_msgSend(a1, "modelClass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
