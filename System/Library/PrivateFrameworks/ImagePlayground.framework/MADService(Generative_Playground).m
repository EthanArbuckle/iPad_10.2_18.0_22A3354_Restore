@implementation MADService(Generative_Playground)

+ (uint64_t)getEmbeddingVectorDimension:()Generative_Playground
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x24BE64208], "getUnifiedEmbeddingVersion");
  return objc_msgSend(MEMORY[0x24BE64208], "getEmbeddingFormatForVersion:dimension:type:error:", v4, a3, 0, 0);
}

@end
