@implementation _MTLDebugCommandEncoder

- (void)kprintf:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v6);
  v5 = (void *)objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  -[_MTLDebugCommandEncoder kprintfBytes:length:](self, "kprintfBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

- (void)IOLog:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v6);
  v5 = (void *)objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  -[_MTLDebugCommandEncoder IOLogBytes:length:](self, "IOLogBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

@end
