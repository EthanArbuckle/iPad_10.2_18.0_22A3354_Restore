@implementation WFDictateTextAction(UIKit)

- (id)keyCommands
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x24BEC49B8];
  WFLocalizedString(CFSTR("Finish Dictation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __41__WFDictateTextAction_UIKit__keyCommands__block_invoke;
  v9 = &unk_24E3428F8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v1, "commandWithTitle:input:modifierFlags:block:", v2, CFSTR("\r"), 0x100000, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

@end
