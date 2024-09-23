@implementation ECHTMLStringAndMIMECharset(MFAdditions)

+ (id)mf_utf8HTMLStringWithString:()MFAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = [a1 alloc];
  objc_msgSend(MEMORY[0x1E0D460E8], "charsetForEncoding:", 134217984);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:charset:", v4, v6);

  return v7;
}

@end
