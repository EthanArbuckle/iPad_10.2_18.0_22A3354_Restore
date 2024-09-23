@implementation VPNSetupTableCell

- (void)textValueChanged:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VPNSetupTableCell performSelector:withObject:](self, "performSelector:withObject:", sel_controlChanged_, self);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_textValueChanged_, *MEMORY[0x24BDF7F58], 0);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7F58], 0);

}

@end
