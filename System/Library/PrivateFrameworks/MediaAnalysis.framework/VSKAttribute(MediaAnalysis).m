@implementation VSKAttribute(MediaAnalysis)

+ (id)mad_embeddingVersionAttribute
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0DC6858]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6868]), "initWithIntegerDefaultValue:", 0);
  v2 = (void *)objc_msgSend(v0, "initWithName:columnType:", CFSTR("embeddingVersion"), v1);

  return v2;
}

@end
