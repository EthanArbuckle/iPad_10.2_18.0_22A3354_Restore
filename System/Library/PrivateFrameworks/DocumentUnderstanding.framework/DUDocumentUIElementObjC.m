@implementation DUDocumentUIElementObjC

- (DUDocumentUIElementObjC)init
{
  DUDocumentUIElementObjC *v2;
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v3;
  _TtC21DocumentUnderstanding19DUDocumentUIElement *underlyingElement;
  DUDocumentUIElementObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUDocumentUIElementObjC;
  v2 = -[DUDocumentUIElementObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentUIElement);
    underlyingElement = v2->_underlyingElement;
    v2->_underlyingElement = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)text
{
  return -[DUDocumentUIElement text](self->_underlyingElement, "text");
}

- (void)setText:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDocumentUIElement setText:](self->_underlyingElement, "setText:", v4);

}

- (NSString)version
{
  return -[DUDocumentUIElement version](self->_underlyingElement, "version");
}

- (void)setVersion:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDocumentUIElement setVersion:](self->_underlyingElement, "setVersion:", v4);

}

- (NSString)classDescriptor
{
  return -[DUDocumentUIElement classDescriptor](self->_underlyingElement, "classDescriptor");
}

- (void)setClassDescriptor:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDocumentUIElement setClassDescriptor:](self->_underlyingElement, "setClassDescriptor:", v4);

}

- (float)fontSize
{
  float result;

  -[DUDocumentUIElement fontSize](self->_underlyingElement, "fontSize");
  return result;
}

- (void)setFontSize:(float)a3
{
  -[DUDocumentUIElement setFontSize:](self->_underlyingElement, "setFontSize:");
}

- (NSArray)superviewClassNames
{
  return -[DUDocumentUIElement superviewClassNames](self->_underlyingElement, "superviewClassNames");
}

- (void)setSuperviewClassNames:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUDocumentUIElement setSuperviewClassNames:](self->_underlyingElement, "setSuperviewClassNames:", v4);

}

- (CGRect)frameInWindow
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[DUDocumentUIElement frameInWindow](self->_underlyingElement, "frameInWindow");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  -[DUDocumentUIElement setFrameInWindow:](self->_underlyingElement, "setFrameInWindow:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGPoint)absoluteOriginOnScreen
{
  double v2;
  double v3;
  CGPoint result;

  -[DUDocumentUIElement absoluteOriginOnScreen](self->_underlyingElement, "absoluteOriginOnScreen");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  -[DUDocumentUIElement setAbsoluteOriginOnScreen:](self->_underlyingElement, "setAbsoluteOriginOnScreen:", a3.x, a3.y);
}

- (BOOL)isOnScreen
{
  return -[DUDocumentUIElement isOnScreen](self->_underlyingElement, "isOnScreen");
}

- (void)setIsOnScreen:(BOOL)a3
{
  -[DUDocumentUIElement setIsOnScreen:](self->_underlyingElement, "setIsOnScreen:", a3);
}

- (BOOL)isValidForContentExtraction
{
  return -[DUDocumentUIElement isValidForContentExtraction](self->_underlyingElement, "isValidForContentExtraction");
}

- (void)setIsValidForContentExtraction:(BOOL)a3
{
  -[DUDocumentUIElement setIsValidForContentExtraction:](self->_underlyingElement, "setIsValidForContentExtraction:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingElement, 0);
}

@end
