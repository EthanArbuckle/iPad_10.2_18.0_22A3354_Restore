@implementation NLResourceWrapper

+ (id)copyAssetURLWithLocale:(id)a3 contentType:(id)a4 contentName:(id)a5
{
  void *v5;
  CoreNLP::Resource *v6;
  CoreNLP::Resource *v8;

  CoreNLP::Resource::getAssetResource((CoreNLP::Resource *)a3, (const __CFLocale *)a4, (const __CFString *)a5, 0, &v8);
  if (!v8)
    return 0;
  if (CoreNLP::Resource::exists((CoreNLP **)v8))
    v5 = (void *)objc_msgSend((id)CoreNLP::Resource::URL(v8), "copy");
  else
    v5 = 0;
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    CoreNLP::Resource::~Resource(v6);
    MEMORY[0x19401E994]();
  }
  return v5;
}

@end
