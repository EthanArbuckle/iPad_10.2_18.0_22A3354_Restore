@implementation WKDOMDocumentParserYieldToken

- (WKDOMDocumentParserYieldToken)initWithDocument:(NakedRef<WebCore::Document>)a3
{
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKDOMDocumentParserYieldToken;
  v4 = -[WKDOMDocumentParserYieldToken init](&v7, sel_init);
  if (v4)
  {
    v5 = WTF::fastMalloc((WTF *)8);
    MEMORY[0x19AEB29D0](v5, a3.var0);
    std::unique_ptr<WebCore::DocumentParserYieldToken>::reset[abi:sn180100]((uint64_t *)v4 + 1, v5);
  }
  return (WKDOMDocumentParserYieldToken *)v4;
}

- (void).cxx_destruct
{
  std::unique_ptr<WebCore::DocumentParserYieldToken>::reset[abi:sn180100]((uint64_t *)&self->_token, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
