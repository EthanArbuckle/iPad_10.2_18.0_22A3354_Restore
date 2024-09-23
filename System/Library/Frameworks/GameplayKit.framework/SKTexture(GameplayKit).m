@implementation SKTexture(GameplayKit)

+ (id)textureWithNoiseMap:()GameplayKit
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "__colorData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDE9EC8];
  objc_msgSend(v3, "sampleCount");
  v10 = v6;
  objc_msgSend(v3, "sampleCount");
  objc_msgSend(v5, "textureWithData:size:", v4, (double)v10, (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
