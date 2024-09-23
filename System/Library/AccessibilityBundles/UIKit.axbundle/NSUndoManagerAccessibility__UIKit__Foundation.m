@implementation NSUndoManagerAccessibility__UIKit__Foundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSUndoManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)undo
{
  id v2;
  id v3;
  id argument;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  NSUndoManagerAccessibility__UIKit__Foundation *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)NSUndoManagerAccessibility__UIKit__Foundation;
  -[NSUndoManagerAccessibility__UIKit__Foundation undo](&v7, sel_undo);
  v10 = *MEMORY[0x24BDFEC18];
  v11[0] = MEMORY[0x24BDBD1C8];
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (id)-[NSUndoManagerAccessibility__UIKit__Foundation undoActionName](v9, "undoActionName");
  if (!objc_msgSend(v5, "length"))
  {
    v2 = (id)UIKitAccessibilityLocalizedString();
    v3 = v5;
    v5 = v2;

  }
  argument = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA60]), "initWithString:", v5);
  objc_msgSend(argument, "setAttributes:", v6);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
}

- (void)redo
{
  id v2;
  id v3;
  id argument;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  NSUndoManagerAccessibility__UIKit__Foundation *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)NSUndoManagerAccessibility__UIKit__Foundation;
  -[NSUndoManagerAccessibility__UIKit__Foundation redo](&v7, sel_redo);
  v10 = *MEMORY[0x24BDFEC18];
  v11[0] = MEMORY[0x24BDBD1C8];
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (id)-[NSUndoManagerAccessibility__UIKit__Foundation redoActionName](v9, "redoActionName");
  if (!objc_msgSend(v5, "length"))
  {
    v2 = (id)UIKitAccessibilityLocalizedString();
    v3 = v5;
    v5 = v2;

  }
  argument = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA60]), "initWithString:", v5);
  objc_msgSend(argument, "setAttributes:", v6);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
}

@end
