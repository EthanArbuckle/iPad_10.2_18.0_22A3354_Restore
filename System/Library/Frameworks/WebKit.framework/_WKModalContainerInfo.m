@implementation _WKModalContainerInfo

- (_WKModalContainerInfo)initWithTypes:(OptionSet<WebCore::ModalContainerControlType>)a3
{
  _WKModalContainerInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKModalContainerInfo;
  result = -[_WKModalContainerInfo init](&v5, sel_init);
  if (result)
  {
    if ((a3.var0 & 2) != 0)
    {
      result->_availableTypes |= 2uLL;
      if ((a3.var0 & 4) == 0)
      {
LABEL_4:
        if ((a3.var0 & 1) == 0)
          return result;
        goto LABEL_5;
      }
    }
    else if ((a3.var0 & 4) == 0)
    {
      goto LABEL_4;
    }
    result->_availableTypes |= 4uLL;
    if ((a3.var0 & 1) == 0)
      return result;
LABEL_5:
    result->_availableTypes |= 1uLL;
  }
  return result;
}

- (unint64_t)availableTypes
{
  return self->_availableTypes;
}

@end
