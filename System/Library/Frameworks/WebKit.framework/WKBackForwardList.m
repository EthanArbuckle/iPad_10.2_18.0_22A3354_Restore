@implementation WKBackForwardList

- (Object)_apiObject
{
  return (Object *)&self->_list;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebBackForwardList> *))self->_list.data.__lx)(&self->_list);
    v4.receiver = self;
    v4.super_class = (Class)WKBackForwardList;
    -[WKBackForwardList dealloc](&v4, sel_dealloc);
  }
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
  if ((v3 & 1) == 0 && (+[WKBackForwardList accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKBackForwardList accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (WKBackForwardListItem)currentItem
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->_item.data.__lx[16];
  if (!v2 || !*(_QWORD *)(v2 + 8) || !LOBYTE(self[1].super.isa))
    return 0;
  v3 = *(_QWORD *)&self->_item.data.__lx[40];
  if (v3 < *(unsigned int *)&self->_item.data.__lx[36])
  {
    v4 = *(_QWORD *)(*(_QWORD *)&self->_item.data.__lx[24] + 8 * v3);
    if (v4)
      return *(WKBackForwardListItem **)(v4 + 8);
    return 0;
  }
  __break(0xC471u);
  return self;
}

- (WKBackForwardListItem)backItem
{
  WKBackForwardListItem *result;

  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::backItem((uint64_t)&self->_list);
  if (result)
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  return result;
}

- (WKBackForwardListItem)forwardItem
{
  WKBackForwardListItem *result;

  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::forwardItem((uint64_t)&self->_list);
  if (result)
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  return result;
}

- (WKBackForwardListItem)itemAtIndex:(NSInteger)index
{
  WKBackForwardListItem *result;

  result = (WKBackForwardListItem *)WebKit::WebBackForwardList::itemAtIndex((uint64_t)&self->_list, index);
  if (result)
    return *(WKBackForwardListItem **)result->_item.data.__lx;
  return result;
}

- (NSArray)backList
{
  const void *v2;
  NSArray *v3;
  WebKit *v4;
  WebKit *v6;

  WebKit::WebBackForwardList::backList((WebKit::WebBackForwardList *)&self->_list, &v6);
  v2 = (const void *)*((_QWORD *)v6 + 1);
  if (v2)
    CFRetain(*((CFTypeRef *)v6 + 1));
  v3 = (id)CFMakeCollectable(v2);
  v4 = v6;
  v6 = 0;
  if (v4)
    CFRelease(*((CFTypeRef *)v4 + 1));
  return v3;
}

- (NSArray)forwardList
{
  const void *v2;
  NSArray *v3;
  WebKit *v4;
  WebKit *v6;

  WebKit::WebBackForwardList::forwardList((WebKit::WebBackForwardList *)&self->_list, &v6);
  v2 = (const void *)*((_QWORD *)v6 + 1);
  if (v2)
    CFRetain(*((CFTypeRef *)v6 + 1));
  v3 = (id)CFMakeCollectable(v2);
  v4 = v6;
  v6 = 0;
  if (v4)
    CFRelease(*((CFTypeRef *)v4 + 1));
  return v3;
}

- (void)_removeAllItems
{
  WebKit::WebBackForwardList::removeAllItems((WebKit::WebBackForwardList *)&self->_list);
}

- (void)_clear
{
  WebKit::WebBackForwardList::clear((WebKit::WebBackForwardList *)&self->_list);
}

@end
