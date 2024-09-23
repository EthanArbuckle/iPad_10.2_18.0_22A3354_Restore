@implementation NSData(INJSONSerialization)

- (uint64_t)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
  else
    v10 = 0;

  return v10;
}

@end
