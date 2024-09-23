@implementation WKPreviewAction

+ (id)actionWithIdentifier:(id)a3 title:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id result;

  result = (id)objc_msgSend(a1, "actionWithTitle:style:handler:", a4, a5, a6);
  *((_QWORD *)result + 7) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKPreviewAction;
  v4 = -[UIPreviewAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[7] = -[WKPreviewAction identifier](self, "identifier");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKPreviewAction;
  -[WKPreviewAction dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

@end
