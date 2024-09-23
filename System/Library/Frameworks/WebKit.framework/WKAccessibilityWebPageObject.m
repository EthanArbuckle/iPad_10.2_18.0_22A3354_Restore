@implementation WKAccessibilityWebPageObject

- (void)setRemoteTokenData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (WKAccessibilityWebPageObject)init
{
  WKAccessibilityWebPageObject *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKAccessibilityWebPageObject;
  v2 = -[WKAccessibilityWebPageObject init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__accessibilityCategoryInstalled_, CFSTR("AccessibilityCategoryInstalled"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)WKAccessibilityWebPageObject;
  -[WKAccessibilityWebPageObject dealloc](&v3, sel_dealloc);
}

- (double)pageScale
{
  WebPage *m_ptr;
  double v3;

  m_ptr = self->super.m_page.m_ptr;
  WebKit::WebPage::totalScaleFactor((WebKit::WebPage *)m_ptr, (WebCore::LocalFrame *)a2);
  return v3 / *(float *)(*((_QWORD *)m_ptr + 6) + 368);
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  WebPage *m_ptr;
  id v5;
  _QWORD v7[2];
  CGPoint v8;

  v8 = a3;
  m_ptr = self->super.m_page.m_ptr;
  if (!m_ptr)
    return 0;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v7, &v8);
  v7[1] = WebKit::WebPage::accessibilityScreenToRootView((WebKit::WebPage *)m_ptr, (const WebCore::IntPoint *)v7);
  v5 = -[WKAccessibilityWebPageObjectBase accessibilityRootObjectWrapper](self, "accessibilityRootObjectWrapper");
  WebCore::IntPoint::operator CGPoint();
  return (id)objc_msgSend(v5, "accessibilityHitTest:");
}

- (NSData)remoteTokenData
{
  return self->_remoteTokenData;
}

@end
