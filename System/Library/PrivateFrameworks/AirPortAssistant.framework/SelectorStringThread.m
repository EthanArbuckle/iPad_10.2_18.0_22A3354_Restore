@implementation SelectorStringThread

+ (void)detachNewThreadSelector:(SEL)a3 toTarget:(id)a4 withObject:(id)a5
{
  id v8;
  const char *v9;
  id v10;
  NSString *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;

  v8 = objc_allocWithZone(MEMORY[0x24BDD17F0]);
  v10 = (id)objc_msgSend_initWithTarget_selector_object_(v8, v9, (uint64_t)a4, a3, a5);
  v11 = NSStringFromSelector(a3);
  objc_msgSend_setName_(v10, v12, (uint64_t)v11);
  objc_msgSend_start(v10, v13, v14);
}

@end
