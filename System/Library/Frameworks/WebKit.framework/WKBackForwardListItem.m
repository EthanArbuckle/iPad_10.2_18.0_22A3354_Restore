@implementation WKBackForwardListItem

- (Object)_apiObject
{
  return (Object *)&self->_item;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKBackForwardListItem accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKBackForwardListItem accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebBackForwardListItem> *))self->_item.data.__lx)(&self->_item);
    v4.receiver = self;
    v4.super_class = (Class)WKBackForwardListItem;
    -[WKBackForwardListItem dealloc](&v4, sel_dealloc);
  }
}

- (NSURL)URL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", &self[1]._item);
}

- (NSString)title
{
  NSString *result;

  result = (NSString *)self[1].super.isa;
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (NSURL)initialURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", &self[1]._item.data.__lx[8]);
}

- (void)_item
{
  return &self->_item;
}

- (CGImage)_copySnapshotForTesting
{
  CGImage *result;
  CGImage *v3;

  result = *(CGImage **)self[6]._item.data.__lx;
  if (result)
  {
    WebKit::ViewSnapshot::asImageForTesting(result, &v3);
    return v3;
  }
  return result;
}

- (CGPoint)_scrollPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = (double)*(int *)&self[2]._item.data.__lx[40];
  v3 = (double)*(int *)&self[2]._item.data.__lx[44];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_wasCreatedByJSWithoutUserInteraction
{
  return self[5]._item.data.__lx[40];
}

@end
