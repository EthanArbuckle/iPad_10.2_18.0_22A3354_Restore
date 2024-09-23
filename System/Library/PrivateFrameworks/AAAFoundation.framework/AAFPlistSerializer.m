@implementation AAFPlistSerializer

- (id)mediaTypes
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("application/x-plist");
  v3[1] = CFSTR("application/x-apple-plist");
  v3[2] = CFSTR("text/plist");
  v3[3] = CFSTR("application/xml");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dictionaryFromObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, a4);
}

- (id)_dataFromDictionary:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, a4);
}

@end
