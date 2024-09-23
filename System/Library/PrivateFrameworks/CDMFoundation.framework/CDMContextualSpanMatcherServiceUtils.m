@implementation CDMContextualSpanMatcherServiceUtils

+ (id)buildContextualSpanMatcherRequestWithNLContext:(id)a3 requestId:(id)a4 tokenChain:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x24BE9E1B0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "setNlContext:", v10);

  objc_msgSend(v11, "setRequestId:", v9);
  objc_msgSend(v11, "setTokenChain:", v8);

  return v11;
}

@end
