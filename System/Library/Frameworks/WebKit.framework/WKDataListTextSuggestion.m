@implementation WKDataListTextSuggestion

+ (id)textSuggestionWithInputText:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WKDataListTextSuggestion;
  return (id)objc_msgSend(objc_msgSendSuper2(&v4, sel_alloc), "initWithInputText:", a3);
}

@end
