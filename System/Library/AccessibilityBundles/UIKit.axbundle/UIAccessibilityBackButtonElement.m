@implementation UIAccessibilityBackButtonElement

- (BOOL)_accessibilityHasNativeFocus
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSArray *obj;
  uint64_t v8;
  int v9;
  _QWORD __b[8];
  id v11;
  SEL v12;
  UIAccessibilityBackButtonElement *v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_associatedViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v5);
      if ((objc_msgSend(v11, "_accessibilityHasNativeFocus") & 1) != 0)
        break;
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          goto LABEL_9;
      }
    }
    v14 = 1;
    v9 = 1;
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  if (!v9)
    v14 = 0;
  return v14 & 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)associatedViews
{
  return self->_associatedViews;
}

- (void)setAssociatedViews:(id)a3
{
  objc_storeStrong((id *)&self->_associatedViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedViews, 0);
}

@end
