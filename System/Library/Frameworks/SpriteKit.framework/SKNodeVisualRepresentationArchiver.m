@implementation SKNodeVisualRepresentationArchiver

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("_children")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("_keyedSubSprites")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("_actions")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("_keyedActions")) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SKNodeVisualRepresentationArchiver;
    -[NSKeyedArchiver encodeObject:forKey:](&v8, sel_encodeObject_forKey_, v6, v7);
  }

}

@end
