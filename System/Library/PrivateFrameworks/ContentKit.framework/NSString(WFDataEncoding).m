@implementation NSString(WFDataEncoding)

+ (id)wf_stringWithData:()WFDataEncoding
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
    v5 = v4;
    if (!v4)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", v3, 0, &v8, 0);
      v5 = v8;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
