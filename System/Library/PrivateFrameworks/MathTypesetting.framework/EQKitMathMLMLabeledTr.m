@implementation EQKitMathMLMLabeledTr

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;
  void *v8;
  EQKitMathMLMLabeledTr *v9;
  objc_super v11;

  objc_msgSend(a4, "pushState:", 3);
  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
  objc_msgSend(a4, "popState");
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v7);
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    v11.receiver = self;
    v11.super_class = (Class)EQKitMathMLMLabeledTr;
    v9 = -[EQKitMathMLMTr initWithChildren:node:](&v11, sel_initWithChildren_node_, v8, a3);

  }
  else
  {

    return 0;
  }
  return v9;
}

@end
