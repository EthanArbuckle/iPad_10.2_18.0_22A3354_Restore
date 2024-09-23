@implementation STKStickerPickerSceneClientToHostAction

+ (id)actionForStickerPickerSceneDidRequestDismissal
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_2505F99A0, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[STKStickerPickerSceneClientToHostAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v8, "stickerPickerSceneDidRequestDismissal");

}

@end
