@implementation _ARDisplayLinkHelper

- (_ARDisplayLinkHelper)initWithDisplayLink:(id)a3
{
  id v4;
  _ARDisplayLinkHelper *v5;
  _ARDisplayLinkHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ARDisplayLinkHelper;
  v5 = -[_ARDisplayLinkHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_displayLink, v4);

  return v6;
}

- (void)callback:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_displayLink);
  objc_msgSend(WeakRetained, "displayLinkCallback");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLink);
}

@end
