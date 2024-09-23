@implementation _DKMetadata

+ (id)keyPathForMetadataKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metadata.%@"), a3);
}

@end
