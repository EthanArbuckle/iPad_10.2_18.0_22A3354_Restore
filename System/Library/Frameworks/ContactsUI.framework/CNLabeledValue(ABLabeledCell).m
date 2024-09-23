@implementation CNLabeledValue(ABLabeledCell)

- (id)contactViewControllerCellClassForPropertyType:()ABLabeledCell
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967B0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]);
  }
  v4 = (id)objc_opt_class();

  return v4;
}

@end
