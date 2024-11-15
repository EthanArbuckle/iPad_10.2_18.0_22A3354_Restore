@implementation IKViewElementFactoryContext

- (IKViewElementStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void)setStyleFactory:(id)a3
{
  objc_storeStrong((id *)&self->_styleFactory, a3);
}

- (IKViewElement)headViewElement
{
  return self->_headViewElement;
}

- (void)setHeadViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_headViewElement, a3);
}

- (IKViewElement)navigationBarViewElement
{
  return self->_navigationBarViewElement;
}

- (void)setNavigationBarViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarViewElement, a3);
}

- (IKViewElement)toolBarViewElement
{
  return self->_toolBarViewElement;
}

- (void)setToolBarViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_toolBarViewElement, a3);
}

- (IKViewElement)templateViewElement
{
  return self->_templateViewElement;
}

- (void)setTemplateViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_templateViewElement, a3);
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateViewElement, 0);
  objc_storeStrong((id *)&self->_toolBarViewElement, 0);
  objc_storeStrong((id *)&self->_navigationBarViewElement, 0);
  objc_storeStrong((id *)&self->_headViewElement, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
}

@end
