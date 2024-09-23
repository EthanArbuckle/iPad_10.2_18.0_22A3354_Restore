@implementation LPHTMLComponent

- (LPHTMLComponent)initWithTagName:(id)a3 themePath:(id)a4 generator:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPHTMLComponent *v11;
  void *v12;
  uint64_t v13;
  DOMElement *element;
  LPHTMLComponent *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPHTMLComponent;
  v11 = -[LPHTMLComponent init](&v17, sel_init);
  if (v11)
  {
    WebThreadLock();
    objc_msgSend(v10, "parentDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createElement:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    element = v11->_element;
    v11->_element = (DOMElement *)v13;

    objc_storeStrong((id *)&v11->_themePath, a4);
    objc_storeWeak((id *)&v11->_generator, v10);
    v15 = v11;
  }

  return v11;
}

- (void)addChild:(id)a3
{
  DOMElement *element;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  WebThreadLock();
  -[NSMutableArray addObject:](self->_children, "addObject:", v7);
  element = self->_element;
  objc_msgSend(v7, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)-[DOMElement appendChild:](element, "appendChild:", v5);

}

- (id)childThemePathWithName:(id)a3
{
  -[NSString stringByAppendingFormat:](self->_themePath, "stringByAppendingFormat:", CFSTR("-%@"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (LPLinkHTMLGenerator)generator
{
  return (LPLinkHTMLGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (DOMElement)element
{
  return self->_element;
}

- (NSString)themePath
{
  return self->_themePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themePath, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
